/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_41.s
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
# 257 "diag.j"
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
	mov 0x34, %r14
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
	mov 0x32, %r14
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
	mov 0x30, %r14
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
	mov 0x34, %r14
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
	mov 0x30, %r30
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
mondo_7_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910003  ! 1: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
tagged_7_1:
	taddcctv %r14, 0x13c9, %r6
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0x92a80001  ! 3: ANDNcc_R	andncc 	%r0, %r1, %r9
splash_cmpr_7_2:
	setx 0x4cfd45286614dbb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_3:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 5: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_7_4:
	setx 0x54b8f2b274b41b92, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa190200b  ! 8: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9545c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01974  ! 10: FqTOd	dis not found

DS_7_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e030  ! 13: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x91454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
intveclr_7_7:
	setx 0xf71638842cc4689f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad81bea4  ! 16: WR_SOFTINT_REG_I	wr	%r6, 0x1ea4, %softint
debug_7_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_7_9:
	taddcctv %r4, 0x166b, %r19
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d020b2  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_7_10:
	setx 0xda5cd607155a2aa9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_12-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_12:
	.word 0x9194c00b  ! 22: WRPR_PIL_R	wrpr	%r19, %r11, %pil
splash_tba_7_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa1902001  ! 25: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_7_15:
	setx 0x63324bf647dabba9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab82fdf3  ! 27: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1df3, %clear_softint
splash_tba_7_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba249e4  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x879020e3  ! 31: WRPR_TT_I	wrpr	%r0, 0x00e3, %tt
	.word 0x8d9024b4  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x04b4, %pstate
splash_hpstate_7_17:
	.word 0x81982256  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
	.word 0x91a00167  ! 34: FABSq	dis not found

splash_tba_7_18:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_7_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_7_20:
	.word 0x8198234f  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034f, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_7_21:
	.word 0x8198274f  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074f, %hpstate
	.word 0xa190200f  ! 41: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902ba4  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0ba4, %pstate
	.word 0x99902003  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902008  ! 44: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x99520000  ! 45: RDPR_PIL	rdpr	%pil, %r12
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd68008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_7_22:
	.word 0x81982006  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
splash_decr_7_23:
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7824012  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r18, %-
DS_7_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b44303  ! 50: ALIGNADDRESS	alignaddr	%r17, %r3, %r8
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_7_25:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01966  ! 53: FqTOd	dis not found

splash_cmpr_7_27:
	setx 0x04e52273e056ea55, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_28:
	.word 0x8f902002  ! 55: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_7_29:
	set 0x60140000, %r31
	.word 0x85806763  ! 56: WRCCR_I	wr	%r1, 0x0763, %ccr
	.word 0x94d526b3  ! 57: UMULcc_I	umulcc 	%r20, 0x06b3, %r10
	.word 0x99454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd8d804a0  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8800c60  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 61: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_7_30:
	.word 0x93a149cd  ! 1: FDIVd	fdivd	%f36, %f44, %f40
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903861  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1861, %pstate
intveclr_7_31:
	setx 0x69b64f7364ab505d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 67: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x9f8032a0  ! 68: SIR	sir	0x12a0
	.word 0xa190200f  ! 69: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_7_33:
	setx 0x7fe5b90f7986bb20, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_7_34:
	setx 0x66f98349955b3528, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_35:
	.word 0x819822c4  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_7_36:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 75: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
mondo_7_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d930004  ! 76: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_7_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 79: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90384e  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x184e, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d02035  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8780208b  ! 83: WRASI_I	wr	%r0, 0x008b, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_7_39:
	set user_data_start, %r31
	.word 0x8580ee2c  ! 85: WRCCR_I	wr	%r3, 0x0e2c, %ccr
splash_tba_7_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_42:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 89: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_7_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_43:
	.word 0x8f902003  ! 91: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa190200e  ! 92: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d903387  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1387, %pstate
mondo_7_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 94: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0xab806006  ! 95: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0006, %clear_softint
DS_7_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
pmu_7_46:
	nop
	setx 0xfffffd49fffff6d6, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_7_47:
    set user_data_start, %o7
	.word 0x93902001  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_7_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_48:
	.word 0x8f902002  ! 99: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_7_50:
	setx 0x985773536b9cf7f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c804a0  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
splash_hpstate_7_51:
	.word 0x81982805  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0805, %hpstate
debug_7_52:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_53:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 105: RDPC	rd	%pc, %r9
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa190200f  ! 107: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0x95500000  ! 109: RDPR_TPC	rdpr	%tpc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_54) + 48, 16, 16)) -> intp(6,0,17)
intvec_7_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 111: WRPR_GL_I	wrpr	%r0, 0x0005, %-
cwp_7_55:
    set user_data_start, %o7
	.word 0x93902005  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_7_56:
	setx 0x80cb5098527c74dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_57:
	.word 0x8f902003  ! 114: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_7_58:
	setx 0x00a780daa750e418, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_7_60:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_7_61:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_7_62:
	nop
	setx 0xfffffe8ffffff5d7, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_7_63:
    set user_data_start, %o7
	.word 0x93902002  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d903a42  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1a42, %pstate
mondo_7_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d914002  ! 122: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
debug_7_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976868f5  ! 124: SDIVX_I	sdivx	%r1, 0x08f5, %r11
	.word 0x8790214f  ! 125: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
	.word 0xa353c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x99a249c2  ! 127: FDIVd	fdivd	%f40, %f2, %f12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768f497  ! 128: SDIVX_I	sdivx	%r3, 0xfffff497, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196a  ! 129: FqTOd	dis not found

	.word 0xa3a18dd1  ! 130: FdMULq	fdmulq	
cwp_7_69:
    set user_data_start, %o7
	.word 0x93902003  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_7_70:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_7_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d914007  ! 135: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
debug_7_73:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902233  ! 137: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_7_74:
	setx 0x417afd070bcf6b98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903618  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1618, %pstate
tagged_7_75:
	taddcctv %r17, 0x1d71, %r6
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_7_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_7_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_7_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa362acb0	! Random illegal ?
	.word 0xa1a489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f16
	.word 0x97a20826  ! 145: FADDs	fadds	%f8, %f6, %f11
debug_7_79:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_7_81:
	taddcctv %r17, 0x1814, %r9
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_7_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f8, %f10
	.word 0xa9b0030d  ! 149: ALIGNADDRESS	alignaddr	%r0, %r13, %r20
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x83d020b4  ! 151: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab82f264  ! 153: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1264, %clear_softint
	.word 0xd0800c60  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
tagged_7_83:
	taddcctv %r21, 0x1c9b, %r10
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_7_84:
	setx 0xd654d127ebf9388c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c6383  ! 157: SDIVX_I	sdivx	%r17, 0x0383, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76cbbe1  ! 158: SDIVX_I	sdivx	%r18, 0xfffffbe1, %r19
intveclr_7_87:
	setx 0xb0bf171c83c179ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020ff  ! 160: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
	.word 0x8d90219d  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x019d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_7_88:
	tsubcctv %r24, 0x1534, %r13
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_7_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0xa7a01a6a  ! 166: FqTOi	fqtoi	
	.word 0xa745c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r19
tagged_7_90:
	tsubcctv %r25, 0x19be, %r7
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_7_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_91:
	.word 0x8f902003  ! 169: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa5a089c5  ! 170: FDIVd	fdivd	%f2, %f36, %f18
	.word 0xd8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 172: FqTOd	dis not found

splash_tba_7_93:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902cb9  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x0cb9, %pstate
	.word 0x87902297  ! 175: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0x8790213d  ! 176: WRPR_TT_I	wrpr	%r0, 0x013d, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_7_94:
	setx 0x05adda7d667331d4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe020  ! 179: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 180: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 181: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01962  ! 182: FqTOd	dis not found

DS_7_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_7_99:
	setx 0xda110bb66d08ce57, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e020  ! 188: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
debug_7_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 190: FqTOd	dis not found

mondo_7_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d910005  ! 191: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
splash_decr_7_104:
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7830004  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r4, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d902ca1  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0ca1, %pstate
	.word 0x91d020b5  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802089  ! 196: WRASI_I	wr	%r0, 0x0089, %asi
mondo_7_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d918013  ! 197: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0x8790202d  ! 198: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
memptr_7_106:
	set 0x60540000, %r31
	.word 0x8582f3a8  ! 199: WRCCR_I	wr	%r11, 0x13a8, %ccr
splash_lsu_7_107:
	setx 0x6f863ced60567285, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_108:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 201: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_7_109:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0xa3414000  ! 205: RDPC	rd	%pc, %r17
	.word 0x87902071  ! 206: WRPR_TT_I	wrpr	%r0, 0x0071, %tt
	.word 0x9ba00574  ! 207: FSQRTq	fsqrt	
splash_lsu_7_112:
	setx 0x4d05cc70ef7c7ec5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a00171  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802089  ! 211: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_7_113:
	setx 0xf115318793c47425, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_114)+40, 16, 16)) -> intp(7,1,3)
xir_7_114:
	.word 0xa98029b4  ! 214: WR_SET_SOFTINT_I	wr	%r0, 0x09b4, %set_softint
	.word 0xa3a00166  ! 215: FABSq	dis not found

	.word 0x8780204f  ! 216: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0xe6481136eb6c4699, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_116:
	setx 0x72d2dc6894275a98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x94843119  ! 221: ADDcc_I	addcc 	%r16, 0xfffff119, %r10
	.word 0xa1902000  ! 222: WRPR_GL_I	wrpr	%r0, 0x0000, %-
pmu_7_118:
	nop
	setx 0xfffff8c4fffffe06, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02034  ! 224: Tcc_I	tne	icc_or_xcc, %r0 + 52
mondo_7_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 225: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
intveclr_7_120:
	setx 0x8a66e68a43fc98cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 227: FqTOd	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x91500000  ! 229: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x879021e9  ! 230: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
mondo_7_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d918013  ! 231: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
splash_htba_7_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 233: FqTOd	dis not found

	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_7_126:
	nop
	setx 0xfffff539fffff821, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a00173  ! 236: FABSq	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x9280b94a  ! 238: ADDcc_I	addcc 	%r2, 0xfffff94a, %r9
	.word 0x87802058  ! 239: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902263  ! 240: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76a7a2f  ! 241: SDIVX_I	sdivx	%r9, 0xfffffa2f, %r19
	.word 0x91d02034  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_7_129:
	set user_data_start, %r31
	.word 0x8581207e  ! 243: WRCCR_I	wr	%r4, 0x007e, %ccr
	.word 0xa1902003  ! 244: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_7_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f14, %f0
	.word 0x99b14302  ! 245: ALIGNADDRESS	alignaddr	%r5, %r2, %r12
splash_hpstate_7_131:
	.word 0x81982f95  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
splash_lsu_7_132:
	setx 0x9f453b0fbd7e7dc1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_7_133:
	setx 0x68a40e3b98f35587, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802080  ! 251: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 253: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_7_134:
	setx 0x1735a40b6f49b0ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_135:
	.word 0x8f902001  ! 255: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_7_136:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_137-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_137:
	.word 0x91910014  ! 257: WRPR_PIL_R	wrpr	%r4, %r20, %pil
	.word 0x8d9034e4  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x14e4, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_7_138:
	set user_data_start, %r31
	.word 0x85822ac4  ! 261: WRCCR_I	wr	%r8, 0x0ac4, %ccr
change_to_randtl_7_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_139:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_7_140-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_140:
	.word 0x91944005  ! 263: WRPR_PIL_R	wrpr	%r17, %r5, %pil
cwp_7_141:
    set user_data_start, %o7
	.word 0x93902005  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_7_142:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_143:
	taddcctv %r26, 0x1301, %r13
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996afcc6  ! 267: SDIVX_I	sdivx	%r11, 0xfffffcc6, %r12
	.word 0x95464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x8d9024f9  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x04f9, %pstate
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
	.word 0x9b414000  ! 270: RDPC	rd	%pc, %r13
DS_7_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f6, %f2
	.word 0x99b0030c  ! 271: ALIGNADDRESS	alignaddr	%r0, %r12, %r12
splash_cmpr_7_147:
	setx 0xdb4083d84db78c4e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020a9  ! 273: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
pmu_7_148:
	nop
	setx 0xfffff977fffff660, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_7_150:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 276: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	setx 0xa901f7744796321c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_7_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 279: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_7_154:
	tsubcctv %r2, 0x1440, %r2
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_7_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_155:
	.word 0x8f902000  ! 282: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9191b54c  ! 283: WRPR_PIL_I	wrpr	%r6, 0x154c, %pil
	.word 0x8d802004  ! 284: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r11
DS_7_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_7_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f18, %f22
	.word 0x91b48307  ! 287: ALIGNADDRESS	alignaddr	%r18, %r7, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_158) + 40, 16, 16)) -> intp(3,0,29)
intvec_7_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_159:
	.word 0x97a449c4  ! 1: FDIVd	fdivd	%f48, %f4, %f42
	.word 0xd7308002  ! 1: STQF_R	-	%f11, [%r2, %r2]
	normalw
	.word 0x9b458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r13
debug_7_160:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_7_162:
	setx 0xa9a8202ea8cdfba8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_7_163:
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7844008  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r8, %-
	.word 0xa190200a  ! 294: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x926d2f1a  ! 295: UDIVX_I	udivx 	%r20, 0x0f1a, %r9
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_7_164:
    set user_data_start, %o7
	.word 0x93902001  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8780204f  ! 298: WRASI_I	wr	%r0, 0x004f, %asi
	setx 0x41404b7155f90a73, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_7_166:
	tsubcctv %r22, 0x1c70, %r9
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_7_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa9a1882d  ! 301: FADDs	fadds	%f6, %f13, %f20
	.word 0x93464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_7_168:
	setx 0x4bda071a64ae5dc9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_169:
	setx 0xe87002c791e09de2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_170:
	setx 0x500f5b52d8ecc5f2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_171:
	setx 0x5ccacd456203440e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_172:
	.word 0x99a109c0  ! 1: FDIVd	fdivd	%f4, %f0, %f12
	.word 0xc370298a	! Random illegal ?
	.word 0x99a00540  ! 1: FSQRTd	fsqrt	
	.word 0x97a28831  ! 309: FADDs	fadds	%f10, %f17, %f11
splash_lsu_7_173:
	setx 0x3cfb746f8348a3d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802840  ! 311: SIR	sir	0x0840
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 312: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91697f1f  ! 313: SDIVX_I	sdivx	%r5, 0xffffff1f, %r8
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0x97540000  ! 315: RDPR_GL	rdpr	%-, %r11
splash_hpstate_7_176:
	.word 0x819821de  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01de, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_177:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0xa3414000  ! 320: RDPC	rd	%pc, %r17
splash_tba_7_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_7_180:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_7_181:
	.word 0x81982a05  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
splash_cmpr_7_182:
	setx 0xc098d818fd380ced, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_183:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 325: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196a  ! 326: FqTOd	dis not found

	.word 0x87802016  ! 327: WRASI_I	wr	%r0, 0x0016, %asi
cwp_7_185:
    set user_data_start, %o7
	.word 0x93902002  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 329: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_7_187:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_188:
	setx 0xe50be562a28d4304, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902103  ! 333: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0xa984c012  ! 334: WR_SET_SOFTINT_R	wr	%r19, %r18, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_7_189:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_7_190:
    set user_data_start, %o7
	.word 0x93902002  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_7_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a0c9c7  ! 1: FDIVd	fdivd	%f34, %f38, %f18
	.word 0x99a14828  ! 338: FADDs	fadds	%f5, %f8, %f12
	.word 0x93520000  ! 339: RDPR_PIL	rdpr	%pil, %r9
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_7_192:
	nop
	setx 0xfffff85dfffffb75, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902b43  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x0b43, %pstate
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
	.word 0x95414000  ! 344: RDPC	rd	%pc, %r10
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8780204f  ! 346: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 347: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_7_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_7_196:
	setx 0xa5e9c9df9ff22cb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_197:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 353: RDPC	rd	%pc, %r12
	.word 0x8790201b  ! 354: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 355: FqTOd	dis not found

	.word 0xd2d804a0  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_199:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 357: RDPC	rd	%pc, %r10
memptr_7_200:
	set 0x60540000, %r31
	.word 0x85827307  ! 358: WRCCR_I	wr	%r9, 0x1307, %ccr
	rd %pc, %r19
	add %r19, (ivw_7_201-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_201:
	.word 0x91908002  ! 359: WRPR_PIL_R	wrpr	%r2, %r2, %pil
DS_7_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x93d02033  ! 361: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_7_203:
	setx 0x24f8a231b50952b8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802020  ! 364: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x99902001  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
debug_7_204:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 366: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
cwp_7_205:
    set user_data_start, %o7
	.word 0x93902003  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd8c7e030  ! 368: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_206) + 24, 16, 16)) -> intp(7,0,19)
intvec_7_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_207:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 370: RDPC	rd	%pc, %r8
tagged_7_208:
	tsubcctv %r4, 0x1e0b, %r2
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_7_209:
	setx 0x2ef8befb0ec7de20, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e010  ! 374: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
debug_7_210:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 375: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x99a00163  ! 378: FABSq	dis not found

DS_7_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7334000  ! 1: STQF_R	-	%f19, [%r0, %r13]
	normalw
	.word 0xa3458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xab84000b  ! 380: WR_CLEAR_SOFTINT_R	wr	%r16, %r11, %clear_softint
memptr_7_212:
	set 0x60140000, %r31
	.word 0x85806cfa  ! 381: WRCCR_I	wr	%r1, 0x0cfa, %ccr
	.word 0x8780204f  ! 382: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d02034  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 52
	rd %pc, %r19
	add %r19, (ivw_7_213-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_213:
	.word 0x91944010  ! 385: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_7_214:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56d2301  ! 388: SDIVX_I	sdivx	%r20, 0x0301, %r18
memptr_7_216:
	set user_data_start, %r31
	.word 0x85846788  ! 389: WRCCR_I	wr	%r17, 0x0788, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x87902137  ! 391: WRPR_TT_I	wrpr	%r0, 0x0137, %tt
splash_cmpr_7_217:
	setx 0xc1497b4d29b5baef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_7_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01964  ! 394: FqTOd	dis not found

	.word 0x9191b3e5  ! 395: WRPR_PIL_I	wrpr	%r6, 0x13e5, %pil
donret_7_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_220-donret_7_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa190200e  ! 397: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa9800007  ! 398: WR_SET_SOFTINT_R	wr	%r0, %r7, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_7_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01960  ! 401: FqTOd	dis not found

cwp_7_223:
    set user_data_start, %o7
	.word 0x93902003  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 404: WRPR_GL_I	wrpr	%r0, 0x0000, %-
intveclr_7_224:
	setx 0x4761ccf813e2efaa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x926a2922  ! 406: UDIVX_I	udivx 	%r8, 0x0922, %r9
	.word 0xa190200d  ! 407: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_7_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01967  ! 409: FqTOd	dis not found

	.word 0x916c400c  ! 410: SDIVX_R	sdivx	%r17, %r12, %r8
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa7a249c8  ! 412: FDIVd	fdivd	%f40, %f8, %f50
DS_7_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_228)+48, 16, 16)) -> intp(7,1,3)
xir_7_228:
	.word 0xa982e638  ! 414: WR_SET_SOFTINT_I	wr	%r11, 0x0638, %set_softint
	.word 0x9950c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xc6903d4da876cbfe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00172  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_230) + 40, 16, 16)) -> intp(4,0,31)
intvec_7_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_7_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_231-donret_7_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c80e40  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 425: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_7_232:
	setx 0x5a3663d2b8c8e40c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_233:
    set user_data_start, %o7
	.word 0x93902005  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_234)+56, 16, 16)) -> intp(7,1,3)
xir_7_234:
	.word 0xa9853075  ! 428: WR_SET_SOFTINT_I	wr	%r20, 0x1075, %set_softint
memptr_7_235:
	set 0x60140000, %r31
	.word 0x858238db  ! 429: WRCCR_I	wr	%r8, 0x18db, %ccr
splash_cmpr_7_236:
	setx 0xde936f2156e16073, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0x99520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_7_237:
	setx 0x077b5f5cf0cd446f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020cc  ! 434: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
intveclr_7_238:
	setx 0x8d4e6d7e97a5fa6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
change_to_randtl_7_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_239:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_7_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_240:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_7_241:
	setx 0x76b7166e1807ccdd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902404  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_7_242:
	setx 0x0b53430f64b28b3f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_7_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_7_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 447: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x8780208b  ! 448: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a21e1  ! 449: SDIVX_I	sdivx	%r8, 0x01e1, %r17
splash_cmpr_7_246:
	setx 0x5ec3bf505804458d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_247:
	.word 0x8f902000  ! 451: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_7_248:
	tsubcctv %r4, 0x1810, %r10
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969e90b  ! 453: SDIVX_I	sdivx	%r7, 0x090b, %r12
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_7_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_250:
	.word 0x8f902000  ! 455: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_7_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802058  ! 458: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa190200f  ! 459: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_7_252:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 460: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa781e856  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r7, 0x0856, %-
	.word 0x9550c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_7_253:
	setx 0x8bcb46d201b64148, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_254) + 8, 16, 16)) -> intp(1,0,18)
intvec_7_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 465: RDPC	rd	%pc, %r8
splash_lsu_7_256:
	setx 0x34791a29342367b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d92c010  ! 467: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
splash_lsu_7_258:
	setx 0xbb6cbeddfe9f8b81, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_259:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa5b34ff3  ! 471: FONES	e	%f18
debug_7_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab81f433  ! 473: WR_CLEAR_SOFTINT_I	wr	%r7, 0x1433, %clear_softint
mondo_7_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d92c009  ! 474: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
DS_7_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f28, %f2
	.word 0x91b1030b  ! 475: ALIGNADDRESS	alignaddr	%r4, %r11, %r8
debug_7_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_7_264:
	tsubcctv %r6, 0x17df, %r18
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa282ab55  ! 478: ADDcc_I	addcc 	%r10, 0x0b55, %r17
splash_cmpr_7_265:
	setx 0x15bcd586fe3e7772, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902000  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
intveclr_7_267:
	setx 0x450fed116dd36866, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_268) + 16, 16, 16)) -> intp(0,0,3)
intvec_7_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_269:
	.word 0x8f902003  ! 484: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_7_270:
	set user_data_start, %r31
	.word 0x85807343  ! 486: WRCCR_I	wr	%r1, 0x1343, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_271:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 487: RDPC	rd	%pc, %r9
	.word 0x926c400c  ! 488: UDIVX_R	udivx 	%r17, %r12, %r9
	.word 0xa1902001  ! 489: WRPR_GL_I	wrpr	%r0, 0x0001, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 490: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x90fc4003  ! 493: SDIVcc_R	sdivcc 	%r17, %r3, %r8
	.word 0x8d903c3c  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x1c3c, %pstate
mondo_7_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d910002  ! 495: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	.word 0xa3a409aa  ! 496: FDIVs	fdivs	%f16, %f10, %f17
	.word 0xa1902006  ! 497: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902027  ! 498: WRPR_TT_I	wrpr	%r0, 0x0027, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
mondo_6_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c00c  ! 1: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
tagged_6_1:
	taddcctv %r11, 0x1967, %r21
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0x90acc00c  ! 3: ANDNcc_R	andncc 	%r19, %r12, %r8
splash_cmpr_6_2:
	setx 0x40db74bf056d1f50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_3:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 5: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_cmpr_6_4:
	setx 0x3b56ad99cad0998b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa190200d  ! 8: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9345c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01961  ! 10: FqTOd	dis not found

DS_6_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 13: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xa9454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
intveclr_6_7:
	setx 0x68b759a0d956ebac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad832559  ! 16: WR_SOFTINT_REG_I	wr	%r12, 0x0559, %softint
debug_6_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_6_9:
	taddcctv %r10, 0x1ccc, %r18
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x93d02033  ! 19: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_lsu_6_10:
	setx 0x75be34f9efd57791, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_12-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_12:
	.word 0x9194c000  ! 22: WRPR_PIL_R	wrpr	%r19, %r0, %pil
splash_tba_6_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200b  ! 25: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_6_15:
	setx 0x7edd3eec331ea8c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab82e4e0  ! 27: WR_CLEAR_SOFTINT_I	wr	%r11, 0x04e0, %clear_softint
splash_tba_6_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a2c9f1  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x87902289  ! 31: WRPR_TT_I	wrpr	%r0, 0x0289, %tt
	.word 0x8d9026d5  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x06d5, %pstate
splash_hpstate_6_17:
	.word 0x8198245f  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	.word 0xa9a00165  ! 34: FABSq	dis not found

splash_tba_6_18:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_6_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_6_20:
	.word 0x81982a4e  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_6_21:
	.word 0x8198268e  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068e, %hpstate
	.word 0xa1902005  ! 41: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d903589  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1589, %pstate
	.word 0x99902003  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902005  ! 44: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93520000  ! 45: RDPR_PIL	rdpr	%pil, %r9
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd6800c60  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
splash_hpstate_6_22:
	.word 0x819825dc  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
splash_decr_6_23:
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa782000d  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r13, %-
DS_6_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b4c30c  ! 50: ALIGNADDRESS	alignaddr	%r19, %r12, %r9
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_6_25:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196b  ! 53: FqTOd	dis not found

splash_cmpr_6_27:
	setx 0x7a2db0a89b77ac99, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_28:
	.word 0x8f902002  ! 55: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_6_29:
	set 0x60740000, %r31
	.word 0x85846cae  ! 56: WRCCR_I	wr	%r17, 0x0cae, %ccr
	.word 0xa8d0efac  ! 57: UMULcc_I	umulcc 	%r3, 0x0fac, %r20
	.word 0xa3454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xd8d804a0  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8800be0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 61: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c80e40  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
DS_6_30:
	.word 0x99a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f12
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903cc9  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1cc9, %pstate
intveclr_6_31:
	setx 0x2734966e6c0e3e37, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d934003  ! 67: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	.word 0x9f802365  ! 68: SIR	sir	0x0365
	.word 0xa190200c  ! 69: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_6_33:
	setx 0xc12471905767684f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_6_34:
	setx 0xfc5c2c49482d48b7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_35:
	.word 0x8198218e  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018e, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_6_36:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 75: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
mondo_6_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94800d  ! 76: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_6_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90279d  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x079d, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d020b2  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802004  ! 83: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_6_39:
	set user_data_start, %r31
	.word 0x85813bc2  ! 85: WRCCR_I	wr	%r4, 0x1bc2, %ccr
splash_tba_6_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_42:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 89: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_6_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_43:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902005  ! 92: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d9034fc  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x14fc, %pstate
mondo_6_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d92000b  ! 94: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xab82f120  ! 95: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1120, %clear_softint
DS_6_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
pmu_6_46:
	nop
	setx 0xfffff46cfffff49f, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_6_47:
    set user_data_start, %o7
	.word 0x93902001  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_6_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_48:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_6_50:
	setx 0x60a0ba0f9ddfb561, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c80e60  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r20
splash_hpstate_6_51:
	.word 0x8198299e  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
debug_6_52:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 105: RDPC	rd	%pc, %r18
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa1902007  ! 107: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0xa5500000  ! 109: RDPR_TPC	rdpr	%tpc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_54) + 32, 16, 16)) -> intp(4,0,4)
intvec_6_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 111: WRPR_GL_I	wrpr	%r0, 0x0005, %-
cwp_6_55:
    set user_data_start, %o7
	.word 0x93902006  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_6_56:
	setx 0xdbedd5760677aa62, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_57:
	.word 0x8f902000  ! 114: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_6_58:
	setx 0x46a3ac5204ce4ea0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_6_60:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_6_61:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_6_62:
	nop
	setx 0xfffff1f8fffffbd0, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_6_63:
    set user_data_start, %o7
	.word 0x93902005  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90291c  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x091c, %pstate
mondo_6_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d940013  ! 122: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
debug_6_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a743e  ! 124: SDIVX_I	sdivx	%r9, 0xfffff43e, %r11
	.word 0x87902133  ! 125: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x9b53c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0xa7a109c8  ! 127: FDIVd	fdivd	%f4, %f8, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56b379a  ! 128: SDIVX_I	sdivx	%r12, 0xfffff79a, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196a  ! 129: FqTOd	dis not found

	.word 0xa3a2cdc9  ! 130: FdMULq	fdmulq	
cwp_6_69:
    set user_data_start, %o7
	.word 0x93902006  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_6_70:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_6_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d934008  ! 135: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
debug_6_73:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902122  ! 137: WRPR_TT_I	wrpr	%r0, 0x0122, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_6_74:
	setx 0xc3c1fe821c7f9740, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90272b  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x072b, %pstate
tagged_6_75:
	taddcctv %r26, 0x1416, %r17
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_6_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_6_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_6_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb776eddb	! Random illegal ?
	.word 0xa1a309d2  ! 1: FDIVd	fdivd	%f12, %f18, %f16
	.word 0x91a0482c  ! 145: FADDs	fadds	%f1, %f12, %f8
debug_6_79:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_6_81:
	taddcctv %r14, 0x14a0, %r23
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_6_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f24, %f0, %f10
	.word 0xa5b24301  ! 149: ALIGNADDRESS	alignaddr	%r9, %r1, %r18
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x91d02035  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab84e5c2  ! 153: WR_CLEAR_SOFTINT_I	wr	%r19, 0x05c2, %clear_softint
	.word 0xd08008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_6_83:
	taddcctv %r1, 0x1e78, %r12
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_6_84:
	setx 0x34f54043d8640faf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c325a  ! 157: SDIVX_I	sdivx	%r16, 0xfffff25a, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568ed78  ! 158: SDIVX_I	sdivx	%r3, 0x0d78, %r10
intveclr_6_87:
	setx 0x160397a51e0a8626, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021ab  ! 160: WRPR_TT_I	wrpr	%r0, 0x01ab, %tt
	.word 0x8d902722  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0722, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_6_88:
	tsubcctv %r22, 0x1a1c, %r10
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_6_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0x93a01a69  ! 166: FqTOi	fqtoi	
	.word 0x9345c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r9
tagged_6_90:
	tsubcctv %r10, 0x1ac6, %r26
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_6_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_91:
	.word 0x8f902003  ! 169: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93a2c9d4  ! 170: FDIVd	fdivd	%f42, %f20, %f40
	.word 0xd8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 172: FqTOd	dis not found

splash_tba_6_93:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902411  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x0411, %pstate
	.word 0x879022dc  ! 175: WRPR_TT_I	wrpr	%r0, 0x02dc, %tt
	.word 0x879020c7  ! 176: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_6_94:
	setx 0x739af70bd9e77680, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe010  ! 179: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196a  ! 180: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 181: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 182: FqTOd	dis not found

DS_6_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_6_99:
	setx 0x3afacffcfc38bcc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e010  ! 188: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
debug_6_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 190: FqTOd	dis not found

mondo_6_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950007  ! 191: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
splash_decr_6_104:
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7840008  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r8, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d902abb  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0abb, %pstate
	.word 0x91d020b5  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802004  ! 196: WRASI_I	wr	%r0, 0x0004, %asi
mondo_6_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940006  ! 197: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0x8790210c  ! 198: WRPR_TT_I	wrpr	%r0, 0x010c, %tt
memptr_6_106:
	set 0x60140000, %r31
	.word 0x858367ad  ! 199: WRCCR_I	wr	%r13, 0x07ad, %ccr
splash_lsu_6_107:
	setx 0xeb2d0537266e7f43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_108:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 201: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
debug_6_109:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0x93414000  ! 205: RDPC	rd	%pc, %r9
	.word 0x87902374  ! 206: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
	.word 0x9ba00568  ! 207: FSQRTq	fsqrt	
splash_lsu_6_112:
	setx 0x37e5a6c2fbbe6055, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00161  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802020  ! 211: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_6_113:
	setx 0x84e4df5dc469029a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_114)+56, 16, 16)) -> intp(6,1,3)
xir_6_114:
	.word 0xa980af2a  ! 214: WR_SET_SOFTINT_I	wr	%r2, 0x0f2a, %set_softint
	.word 0xa5a00174  ! 215: FABSq	dis not found

	.word 0x87802055  ! 216: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0xd94b75da64ba042a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_116:
	setx 0xa24ce770435f9d58, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9882eb5b  ! 221: ADDcc_I	addcc 	%r11, 0x0b5b, %r12
	.word 0xa190200b  ! 222: WRPR_GL_I	wrpr	%r0, 0x000b, %-
pmu_6_118:
	nop
	setx 0xfffffb1afffffa1c, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_6_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d91c008  ! 225: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
intveclr_6_120:
	setx 0xd939b5c2ae1ac7bb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01971  ! 227: FqTOd	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x93500000  ! 229: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x879021de  ! 230: WRPR_TT_I	wrpr	%r0, 0x01de, %tt
mondo_6_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d93000d  ! 231: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
splash_htba_6_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 233: FqTOd	dis not found

	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_6_126:
	nop
	setx 0xfffffbd6fffffe69, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00166  ! 236: FABSq	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x9080e56b  ! 238: ADDcc_I	addcc 	%r3, 0x056b, %r8
	.word 0x87802080  ! 239: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87902305  ! 240: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169aebc  ! 241: SDIVX_I	sdivx	%r6, 0x0ebc, %r8
	.word 0x91d02034  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_6_129:
	set user_data_start, %r31
	.word 0x8584bd1b  ! 243: WRCCR_I	wr	%r18, 0x1d1b, %ccr
	.word 0xa1902001  ! 244: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_6_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f8, %f14
	.word 0x93b48311  ! 245: ALIGNADDRESS	alignaddr	%r18, %r17, %r9
splash_hpstate_6_131:
	.word 0x819820c5  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c5, %hpstate
splash_lsu_6_132:
	setx 0x388f5b276253977b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_6_133:
	setx 0xcc77acc6f8eac484, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 251: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_6_134:
	setx 0xe0d70ccfaa061020, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_135:
	.word 0x8f902003  ! 255: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_6_136:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_137-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_137:
	.word 0x91914004  ! 257: WRPR_PIL_R	wrpr	%r5, %r4, %pil
	.word 0x8d9023f9  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x03f9, %pstate
	.word 0xd2800b00  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 260: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_6_138:
	set user_data_start, %r31
	.word 0x85812700  ! 261: WRCCR_I	wr	%r4, 0x0700, %ccr
change_to_randtl_6_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_139:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_6_140-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_140:
	.word 0x9192c009  ! 263: WRPR_PIL_R	wrpr	%r11, %r9, %pil
cwp_6_141:
    set user_data_start, %o7
	.word 0x93902001  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_6_142:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_143:
	taddcctv %r10, 0x18e7, %r11
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d3418  ! 267: SDIVX_I	sdivx	%r20, 0xfffff418, %r18
	.word 0x9b464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x8d903868  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x1868, %pstate
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
	.word 0x93414000  ! 270: RDPC	rd	%pc, %r9
DS_6_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f12, %f10
	.word 0x91b00313  ! 271: ALIGNADDRESS	alignaddr	%r0, %r19, %r8
splash_cmpr_6_147:
	setx 0xef011ba187e3ac80, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790210a  ! 273: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
pmu_6_148:
	nop
	setx 0xfffff126fffff1b2, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_6_150:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 276: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	setx 0x7c1666796a6ef2f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_6_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d940002  ! 279: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_6_154:
	tsubcctv %r26, 0x1957, %r3
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_6_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_155:
	.word 0x8f902001  ! 282: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9190ec9a  ! 283: WRPR_PIL_I	wrpr	%r3, 0x0c9a, %pil
	.word 0x8d802004  ! 284: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r10
DS_6_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_6_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f10, %f18
	.word 0xa3b14312  ! 287: ALIGNADDRESS	alignaddr	%r5, %r18, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_158) + 0, 16, 16)) -> intp(3,0,17)
intvec_6_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_159:
	.word 0x97a289d0  ! 1: FDIVd	fdivd	%f10, %f16, %f42
	.word 0xe1320010  ! 1: STQF_R	-	%f16, [%r16, %r8]
	normalw
	.word 0xa9458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r20
debug_6_160:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_6_162:
	setx 0x8e6df167bf057e44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_6_163:
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7828009  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r9, %-
	.word 0xa190200e  ! 294: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9669b261  ! 295: UDIVX_I	udivx 	%r6, 0xfffff261, %r11
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_6_164:
    set user_data_start, %o7
	.word 0x93902002  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8780204f  ! 298: WRASI_I	wr	%r0, 0x004f, %asi
	setx 0x451aaea4e1db167d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_6_166:
	tsubcctv %r6, 0x15bb, %r12
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_6_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a00549  ! 1: FSQRTd	fsqrt	
	.word 0xa9a04823  ! 301: FADDs	fadds	%f1, %f3, %f20
	.word 0x9b464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_6_168:
	setx 0x7406c260dad27a53, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_169:
	setx 0xfb5b2ddec86e8938, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_170:
	setx 0xc37218a677182c20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_171:
	setx 0x411409ead11517f1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_172:
	.word 0xa3a209cc  ! 1: FDIVd	fdivd	%f8, %f12, %f48
	.word 0xf748557e	! Random illegal ?
	.word 0xa7a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x95a0082b  ! 309: FADDs	fadds	%f0, %f11, %f10
splash_lsu_6_173:
	setx 0x1433d1d3a1607675, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803bd5  ! 311: SIR	sir	0x1bd5
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01966  ! 312: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d206e  ! 313: SDIVX_I	sdivx	%r20, 0x006e, %r10
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0x93540000  ! 315: RDPR_GL	rdpr	%-, %r9
splash_hpstate_6_176:
	.word 0x81982ecc  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_6_177:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0x97414000  ! 320: RDPC	rd	%pc, %r11
splash_tba_6_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_6_180:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_6_181:
	.word 0x81982c1c  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1c, %hpstate
splash_cmpr_6_182:
	setx 0x4398c3eb84b2b416, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_183:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 325: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01965  ! 326: FqTOd	dis not found

	.word 0x87802016  ! 327: WRASI_I	wr	%r0, 0x0016, %asi
cwp_6_185:
    set user_data_start, %o7
	.word 0x93902004  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_6_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_188:
	setx 0x5074ece495ad87d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020c5  ! 333: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	.word 0xa984c014  ! 334: WR_SET_SOFTINT_R	wr	%r19, %r20, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_6_189:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_6_190:
    set user_data_start, %o7
	.word 0x93902007  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_6_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a4c9c8  ! 1: FDIVd	fdivd	%f50, %f8, %f10
	.word 0x97a20834  ! 338: FADDs	fadds	%f8, %f20, %f11
	.word 0x91520000  ! 339: RDPR_PIL	rdpr	%pil, %r8
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_6_192:
	nop
	setx 0xfffff645fffff43f, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d9037b3  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x17b3, %pstate
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
	.word 0x95414000  ! 344: RDPC	rd	%pc, %r10
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8780204f  ! 346: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01960  ! 349: FqTOd	dis not found

	.word 0xe6c80e40  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
splash_lsu_6_196:
	setx 0xabb29b8c19a2bce9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_197:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 353: RDPC	rd	%pc, %r20
	.word 0x879023e3  ! 354: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 355: FqTOd	dis not found

	.word 0xd2d80e40  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_199:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 357: RDPC	rd	%pc, %r12
memptr_6_200:
	set 0x60740000, %r31
	.word 0x8581fac9  ! 358: WRCCR_I	wr	%r7, 0x1ac9, %ccr
	rd %pc, %r19
	add %r19, (ivw_6_201-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_201:
	.word 0x91950008  ! 359: WRPR_PIL_R	wrpr	%r20, %r8, %pil
DS_6_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x83d02033  ! 361: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_cmpr_6_203:
	setx 0xb576f704419cb6fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802083  ! 364: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_6_204:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
cwp_6_205:
    set user_data_start, %o7
	.word 0x93902006  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd8c7e010  ! 368: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_206) + 8, 16, 16)) -> intp(6,0,21)
intvec_6_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_207:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 370: RDPC	rd	%pc, %r19
tagged_6_208:
	tsubcctv %r8, 0x114e, %r22
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_6_209:
	setx 0x34a9bb4d343690d3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0900e40  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x72, %r16
	.word 0xe097e020  ! 374: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
debug_6_210:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 375: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x91a00164  ! 378: FABSq	dis not found

DS_6_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe730c009  ! 1: STQF_R	-	%f19, [%r9, %r3]
	normalw
	.word 0x9b458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xab850007  ! 380: WR_CLEAR_SOFTINT_R	wr	%r20, %r7, %clear_softint
memptr_6_212:
	set 0x60540000, %r31
	.word 0x85822571  ! 381: WRCCR_I	wr	%r8, 0x0571, %ccr
	.word 0x87802004  ! 382: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d02032  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 50
	rd %pc, %r19
	add %r19, (ivw_6_213-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_213:
	.word 0x9194800d  ! 385: WRPR_PIL_R	wrpr	%r18, %r13, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_6_214:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c7f2e  ! 388: SDIVX_I	sdivx	%r17, 0xffffff2e, %r13
memptr_6_216:
	set user_data_start, %r31
	.word 0x8581e7f9  ! 389: WRCCR_I	wr	%r7, 0x07f9, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x879023df  ! 391: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
splash_cmpr_6_217:
	setx 0xd206805f57008124, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_6_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01961  ! 394: FqTOd	dis not found

	.word 0x91913aef  ! 395: WRPR_PIL_I	wrpr	%r4, 0x1aef, %pil
donret_6_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_220-donret_6_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa1902003  ! 397: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa981c014  ! 398: WR_SET_SOFTINT_R	wr	%r7, %r20, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_6_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 401: FqTOd	dis not found

cwp_6_223:
    set user_data_start, %o7
	.word 0x93902000  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 404: WRPR_GL_I	wrpr	%r0, 0x0005, %-
intveclr_6_224:
	setx 0xb49fa16234344f13, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa269bcdb  ! 406: UDIVX_I	udivx 	%r6, 0xfffffcdb, %r17
	.word 0xa1902008  ! 407: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_6_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01966  ! 409: FqTOd	dis not found

	.word 0x99680009  ! 410: SDIVX_R	sdivx	%r0, %r9, %r12
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91a349cb  ! 412: FDIVd	fdivd	%f44, %f42, %f8
DS_6_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_228)+40, 16, 16)) -> intp(6,1,3)
xir_6_228:
	.word 0xa982f094  ! 414: WR_SET_SOFTINT_I	wr	%r11, 0x1094, %set_softint
	.word 0x9750c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xb03d08787e1c732b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00161  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_230) + 32, 16, 16)) -> intp(7,0,12)
intvec_6_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_6_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_231-donret_6_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c804a0  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_232:
	setx 0xb3e6f3b401cdc1ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_233:
    set user_data_start, %o7
	.word 0x93902004  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_234)+16, 16, 16)) -> intp(6,1,3)
xir_6_234:
	.word 0xa980fee0  ! 428: WR_SET_SOFTINT_I	wr	%r3, 0x1ee0, %set_softint
memptr_6_235:
	set 0x60340000, %r31
	.word 0x8581ae28  ! 429: WRCCR_I	wr	%r6, 0x0e28, %ccr
splash_cmpr_6_236:
	setx 0xe7643f6f0f7623a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0x93520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_6_237:
	setx 0x3221c1d5a3d2b4ef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021e5  ! 434: WRPR_TT_I	wrpr	%r0, 0x01e5, %tt
intveclr_6_238:
	setx 0xbd2424cfb24687f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
change_to_randtl_6_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_239:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_6_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_240:
	.word 0x8f902002  ! 438: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_6_241:
	setx 0xd30eaa84a9215a3d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903f24  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x1f24, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_6_242:
	setx 0x4eebdd1ec6c1c5a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_6_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_6_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91c007  ! 447: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x87802020  ! 448: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568addf  ! 449: SDIVX_I	sdivx	%r2, 0x0ddf, %r10
splash_cmpr_6_246:
	setx 0xb27050866eef0daf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_247:
	.word 0x8f902002  ! 451: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_6_248:
	tsubcctv %r10, 0x1af6, %r13
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916afc77  ! 453: SDIVX_I	sdivx	%r11, 0xfffffc77, %r8
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_6_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_250:
	.word 0x8f902000  ! 455: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_6_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802083  ! 458: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xa190200b  ! 459: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_6_252:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 460: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xa784f54f  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x154f, %-
	.word 0xa950c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_6_253:
	setx 0x60bf896d65126298, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_254) + 40, 16, 16)) -> intp(7,0,20)
intvec_6_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa1414000  ! 465: RDPC	rd	%pc, %r16
splash_lsu_6_256:
	setx 0x1590deb58e5bbc43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d934001  ! 467: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
splash_lsu_6_258:
	setx 0x91bf09508660ac71, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_259:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800b40  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	.word 0x95b40ff4  ! 471: FONES	e	%f10
debug_6_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab84b815  ! 473: WR_CLEAR_SOFTINT_I	wr	%r18, 0x1815, %clear_softint
mondo_6_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 474: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
DS_6_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f10, %f20
	.word 0x91b4030b  ! 475: ALIGNADDRESS	alignaddr	%r16, %r11, %r8
debug_6_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_6_264:
	tsubcctv %r25, 0x131f, %r6
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa084346b  ! 478: ADDcc_I	addcc 	%r16, 0xfffff46b, %r16
splash_cmpr_6_265:
	setx 0x5c4198d78da8a821, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902001  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
intveclr_6_267:
	setx 0xd45443eaa661961a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_268) + 24, 16, 16)) -> intp(1,0,14)
intvec_6_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_269:
	.word 0x8f902002  ! 484: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 485: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_6_270:
	set user_data_start, %r31
	.word 0x8584ffa9  ! 486: WRCCR_I	wr	%r19, 0x1fa9, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_271:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 487: RDPC	rd	%pc, %r8
	.word 0x966c0012  ! 488: UDIVX_R	udivx 	%r16, %r18, %r11
	.word 0xa190200d  ! 489: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_272:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 490: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 492: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x92f98014  ! 493: SDIVcc_R	sdivcc 	%r6, %r20, %r9
	.word 0x8d902953  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0953, %pstate
mondo_6_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92c008  ! 495: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0x95a409a8  ! 496: FDIVs	fdivs	%f16, %f8, %f10
	.word 0xa1902002  ! 497: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879021ce  ! 498: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
mondo_5_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94400b  ! 1: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
tagged_5_1:
	taddcctv %r3, 0x133c, %r9
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0x92ac8001  ! 3: ANDNcc_R	andncc 	%r18, %r1, %r9
splash_cmpr_5_2:
	setx 0x7cbeb54a34c8f56d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_3:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 5: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_5_4:
	setx 0x5fef03f8ecda0b6a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa1902009  ! 8: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa545c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196a  ! 10: FqTOd	dis not found

DS_5_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 13: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x99454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
intveclr_5_7:
	setx 0xab8ce45d361e923d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad84e891  ! 16: WR_SOFTINT_REG_I	wr	%r19, 0x0891, %softint
debug_5_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_5_9:
	taddcctv %r6, 0x1dbd, %r9
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d02034  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_5_10:
	setx 0x1fb410564e12e185, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_12-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_12:
	.word 0x9194c011  ! 22: WRPR_PIL_R	wrpr	%r19, %r17, %pil
splash_tba_5_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200f  ! 25: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_5_15:
	setx 0x57417aa8c884346f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab806c1c  ! 27: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0c1c, %clear_softint
splash_tba_5_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a1c9e1  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x879023b2  ! 31: WRPR_TT_I	wrpr	%r0, 0x03b2, %tt
	.word 0x8d9033f2  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x13f2, %pstate
splash_hpstate_5_17:
	.word 0x81982ec7  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0x99a00169  ! 34: FABSq	dis not found

splash_tba_5_18:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_5_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_5_20:
	.word 0x819826d7  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_5_21:
	.word 0x81982b3e  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b3e, %hpstate
	.word 0xa1902004  ! 41: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902b48  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0b48, %pstate
	.word 0x99902000  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa190200c  ! 44: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93520000  ! 45: RDPR_PIL	rdpr	%pil, %r9
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd6800be0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
splash_hpstate_5_22:
	.word 0x81982654  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
splash_decr_5_23:
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa782c000  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r0, %-
DS_5_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa5b28308  ! 50: ALIGNADDRESS	alignaddr	%r10, %r8, %r18
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_5_25:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01968  ! 53: FqTOd	dis not found

splash_cmpr_5_27:
	setx 0x66d468ec7f6fee25, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_28:
	.word 0x8f902002  ! 55: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_5_29:
	set 0x60740000, %r31
	.word 0x85802cdb  ! 56: WRCCR_I	wr	%r0, 0x0cdb, %ccr
	.word 0xa8d233d3  ! 57: UMULcc_I	umulcc 	%r8, 0xfffff3d3, %r20
	.word 0xa7454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xd8d80e60  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x73, %r12
	.word 0xd88008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_5_30:
	.word 0xa1a209cd  ! 1: FDIVd	fdivd	%f8, %f44, %f16
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902961  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x0961, %pstate
intveclr_5_31:
	setx 0x26dbfe3e49dac069, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d91c00c  ! 67: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x9f8025c7  ! 68: SIR	sir	0x05c7
	.word 0xa190200d  ! 69: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_5_33:
	setx 0xd05f302665c7e457, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_5_34:
	setx 0xec5d0af2182f2129, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_35:
	.word 0x81982384  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0384, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_5_36:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
mondo_5_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d910013  ! 76: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_5_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 79: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903b91  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x1b91, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d02035  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 83: WRASI_I	wr	%r0, 0x0010, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_5_39:
	set user_data_start, %r31
	.word 0x8582ac36  ! 85: WRCCR_I	wr	%r10, 0x0c36, %ccr
splash_tba_5_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_5_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_42:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 89: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_5_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_43:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902003  ! 92: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d90257b  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x057b, %pstate
mondo_5_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91c008  ! 94: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0xab832dee  ! 95: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0dee, %clear_softint
DS_5_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
pmu_5_46:
	nop
	setx 0xfffff3e3fffffcfb, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_5_47:
    set user_data_start, %o7
	.word 0x93902006  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_5_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_48:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_5_50:
	setx 0xe3817def8b43bf93, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c804a0  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
splash_hpstate_5_51:
	.word 0x819820ad  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ad, %hpstate
debug_5_52:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 105: RDPC	rd	%pc, %r19
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa1902006  ! 107: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0xa5500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_54) + 8, 16, 16)) -> intp(3,0,7)
intvec_5_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 111: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cwp_5_55:
    set user_data_start, %o7
	.word 0x93902002  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_5_56:
	setx 0x4711e5a49fd4895d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_57:
	.word 0x8f902000  ! 114: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_58:
	setx 0x151b0384bb63b83a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_5_60:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_5_61:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_5_62:
	nop
	setx 0xfffff929fffff736, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_5_63:
    set user_data_start, %o7
	.word 0x93902005  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d903492  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1492, %pstate
mondo_5_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d950008  ! 122: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
debug_5_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976af5e9  ! 124: SDIVX_I	sdivx	%r11, 0xfffff5e9, %r11
	.word 0x879020ed  ! 125: WRPR_TT_I	wrpr	%r0, 0x00ed, %tt
	.word 0x9553c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x93a189c8  ! 127: FDIVd	fdivd	%f6, %f8, %f40
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97682f1b  ! 128: SDIVX_I	sdivx	%r0, 0x0f1b, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 129: FqTOd	dis not found

	.word 0x91a34dc4  ! 130: FdMULq	fdmulq	
cwp_5_69:
    set user_data_start, %o7
	.word 0x93902001  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_5_70:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_5_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950003  ! 135: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
debug_5_73:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902272  ! 137: WRPR_TT_I	wrpr	%r0, 0x0272, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_5_74:
	setx 0x149b65f961ea6a86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902538  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0538, %pstate
tagged_5_75:
	taddcctv %r26, 0x18c4, %r25
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_5_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_5_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_5_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xeb548148	! Random illegal ?
	.word 0x97a2c9d1  ! 1: FDIVd	fdivd	%f42, %f48, %f42
	.word 0x9ba04826  ! 145: FADDs	fadds	%f1, %f6, %f13
debug_5_79:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_5_81:
	taddcctv %r10, 0x1817, %r2
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_5_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f22, %f22
	.word 0x95b04306  ! 149: ALIGNADDRESS	alignaddr	%r1, %r6, %r10
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x91d02034  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd0d00e80  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0xab837175  ! 153: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1175, %clear_softint
	.word 0xd08008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_5_83:
	taddcctv %r12, 0x1a36, %r13
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_5_84:
	setx 0x01039c67e905654b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56abaf4  ! 157: SDIVX_I	sdivx	%r10, 0xfffffaf4, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b7f6a  ! 158: SDIVX_I	sdivx	%r13, 0xffffff6a, %r12
intveclr_5_87:
	setx 0xae4c012a9880107f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021db  ! 160: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
	.word 0x8d902e40  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0e40, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_5_88:
	tsubcctv %r16, 0x1a25, %r16
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_5_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0xa1a01a74  ! 166: FqTOi	fqtoi	
	.word 0x9545c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r10
tagged_5_90:
	tsubcctv %r6, 0x1daa, %r9
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_5_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_91:
	.word 0x8f902001  ! 169: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91a209cb  ! 170: FDIVd	fdivd	%f8, %f42, %f8
	.word 0xd8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01974  ! 172: FqTOd	dis not found

splash_tba_5_93:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902611  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x0611, %pstate
	.word 0x8790222b  ! 175: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0x879022f6  ! 176: WRPR_TT_I	wrpr	%r0, 0x02f6, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_5_94:
	setx 0x5e2f1806ef6ee2b5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe020  ! 179: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 180: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 181: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196a  ! 182: FqTOd	dis not found

DS_5_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_5_99:
	setx 0xe1336e7eab686b7e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e010  ! 188: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
debug_5_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 190: FqTOd	dis not found

mondo_5_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 191: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_decr_5_104:
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7844002  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r2, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d902391  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0391, %pstate
	.word 0x83d02034  ! 195: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802020  ! 196: WRASI_I	wr	%r0, 0x0020, %asi
mondo_5_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d90c00a  ! 197: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0x87902068  ! 198: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
memptr_5_106:
	set 0x60740000, %r31
	.word 0x8584bee0  ! 199: WRCCR_I	wr	%r18, 0x1ee0, %ccr
splash_lsu_5_107:
	setx 0x8ce6914f18efdf11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_108:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 201: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
debug_5_109:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0x99414000  ! 205: RDPC	rd	%pc, %r12
	.word 0x879021ef  ! 206: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0x95a00566  ! 207: FSQRTq	fsqrt	
splash_lsu_5_112:
	setx 0x340293a614bdfbf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a00164  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802083  ! 211: WRASI_I	wr	%r0, 0x0083, %asi
splash_cmpr_5_113:
	setx 0xb84386cb15ee1236, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_114)+0, 16, 16)) -> intp(5,1,3)
xir_5_114:
	.word 0xa982a159  ! 214: WR_SET_SOFTINT_I	wr	%r10, 0x0159, %set_softint
	.word 0x99a00164  ! 215: FABSq	dis not found

	.word 0x8780208b  ! 216: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0xe3bbd4695e468653, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_116:
	setx 0x4241d95680aedc1b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x908429a0  ! 221: ADDcc_I	addcc 	%r16, 0x09a0, %r8
	.word 0xa1902009  ! 222: WRPR_GL_I	wrpr	%r0, 0x0009, %-
pmu_5_118:
	nop
	setx 0xfffffb78fffffe54, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_5_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924008  ! 225: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
intveclr_5_120:
	setx 0x81386c084c15b162, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01967  ! 227: FqTOd	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xa3500000  ! 229: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x879020d0  ! 230: WRPR_TT_I	wrpr	%r0, 0x00d0, %tt
mondo_5_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 231: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
splash_htba_5_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01972  ! 233: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 234: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_5_126:
	nop
	setx 0xfffff594fffffb08, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a0016d  ! 236: FABSq	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0xa2823b0a  ! 238: ADDcc_I	addcc 	%r8, 0xfffffb0a, %r17
	.word 0x87802016  ! 239: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87902378  ! 240: WRPR_TT_I	wrpr	%r0, 0x0378, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16aa394  ! 241: SDIVX_I	sdivx	%r10, 0x0394, %r16
	.word 0x93d020b2  ! 242: Tcc_I	tne	icc_or_xcc, %r0 + 178
memptr_5_129:
	set user_data_start, %r31
	.word 0x8580fd98  ! 243: WRCCR_I	wr	%r3, 0x1d98, %ccr
	.word 0xa190200b  ! 244: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_5_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f26, %f18, %f10
	.word 0x99b08311  ! 245: ALIGNADDRESS	alignaddr	%r2, %r17, %r12
splash_hpstate_5_131:
	.word 0x81982785  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
splash_lsu_5_132:
	setx 0xfce999e62ac86393, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_5_133:
	setx 0x6a455c299f666346, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87802055  ! 251: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 253: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_5_134:
	setx 0x2acb24faa16d85be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_135:
	.word 0x8f902000  ! 255: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_5_136:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_137-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_137:
	.word 0x91948005  ! 257: WRPR_PIL_R	wrpr	%r18, %r5, %pil
	.word 0x8d90375a  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x175a, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 260: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_5_138:
	set user_data_start, %r31
	.word 0x8584a097  ! 261: WRCCR_I	wr	%r18, 0x0097, %ccr
change_to_randtl_5_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_139:
	.word 0x8f902000  ! 262: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_5_140-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_140:
	.word 0x91908014  ! 263: WRPR_PIL_R	wrpr	%r2, %r20, %pil
cwp_5_141:
    set user_data_start, %o7
	.word 0x93902004  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_5_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_143:
	taddcctv %r4, 0x18bc, %r20
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968bb7d  ! 267: SDIVX_I	sdivx	%r2, 0xfffffb7d, %r12
	.word 0x95464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x8d90239e  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x039e, %pstate
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
	.word 0xa1414000  ! 270: RDPC	rd	%pc, %r16
DS_5_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f18, %f26, %f14
	.word 0x93b28303  ! 271: ALIGNADDRESS	alignaddr	%r10, %r3, %r9
splash_cmpr_5_147:
	setx 0xf3179dcf82452152, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020ea  ! 273: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
pmu_5_148:
	nop
	setx 0xfffff142fffff240, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_5_150:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 276: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	setx 0xd35db20da61dacc0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_5_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 279: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_5_154:
	tsubcctv %r11, 0x101f, %r1
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_5_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_155:
	.word 0x8f902002  ! 282: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9190e6d6  ! 283: WRPR_PIL_I	wrpr	%r3, 0x06d6, %pil
	.word 0x8d802004  ! 284: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa5464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r18
DS_5_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_5_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f8, %f12
	.word 0x9bb4430b  ! 287: ALIGNADDRESS	alignaddr	%r17, %r11, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_158) + 8, 16, 16)) -> intp(3,0,8)
intvec_5_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_159:
	.word 0x97a1c9c1  ! 1: FDIVd	fdivd	%f38, %f32, %f42
	.word 0xd7308004  ! 1: STQF_R	-	%f11, [%r4, %r2]
	normalw
	.word 0x93458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r9
debug_5_160:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_5_162:
	setx 0x6ef8ff42e0356785, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_5_163:
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7824010  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r16, %-
	.word 0xa190200c  ! 294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x986b32fc  ! 295: UDIVX_I	udivx 	%r12, 0xfffff2fc, %r12
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_5_164:
    set user_data_start, %o7
	.word 0x93902005  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802055  ! 298: WRASI_I	wr	%r0, 0x0055, %asi
	setx 0xe2b8caf99b8148d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_5_166:
	tsubcctv %r4, 0x1097, %r18
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_5_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1a00541  ! 1: FSQRTd	fsqrt	
	.word 0x97a48829  ! 301: FADDs	fadds	%f18, %f9, %f11
	.word 0x97464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_5_168:
	setx 0x96c2e99f752d614b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_169:
	setx 0xccf2db6b5045def0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_170:
	setx 0x222271a555e54d98, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_171:
	setx 0xc3226d08469e2c5e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_172:
	.word 0x99a109d0  ! 1: FDIVd	fdivd	%f4, %f16, %f12
	.word 0xf9531da7	! Random illegal ?
	.word 0xa5a00541  ! 1: FSQRTd	fsqrt	
	.word 0xa9a4482c  ! 309: FADDs	fadds	%f17, %f12, %f20
splash_lsu_5_173:
	setx 0x1b6d2ad990f5a15d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f80379b  ! 311: SIR	sir	0x179b
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 312: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1697028  ! 313: SDIVX_I	sdivx	%r5, 0xfffff028, %r16
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0xa1540000  ! 315: RDPR_GL	rdpr	%-, %r16
splash_hpstate_5_176:
	.word 0x81982946  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0946, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_177:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0xa7414000  ! 320: RDPC	rd	%pc, %r19
splash_tba_5_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_5_180:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_5_181:
	.word 0x8198248f  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048f, %hpstate
splash_cmpr_5_182:
	setx 0x19604c18555874fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_183:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 325: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01970  ! 326: FqTOd	dis not found

	.word 0x87802089  ! 327: WRASI_I	wr	%r0, 0x0089, %asi
cwp_5_185:
    set user_data_start, %o7
	.word 0x93902002  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_5_187:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_188:
	setx 0x8be8eb8cb2a6a263, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902222  ! 333: WRPR_TT_I	wrpr	%r0, 0x0222, %tt
	.word 0xa981c000  ! 334: WR_SET_SOFTINT_R	wr	%r7, %r0, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_5_189:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_5_190:
    set user_data_start, %o7
	.word 0x93902007  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_5_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x97a1c9d1  ! 1: FDIVd	fdivd	%f38, %f48, %f42
	.word 0x93a40822  ! 338: FADDs	fadds	%f16, %f2, %f9
	.word 0x99520000  ! 339: RDPR_PIL	rdpr	%pil, %r12
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_5_192:
	nop
	setx 0xfffffa7afffffb78, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902032  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x0032, %pstate
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
	.word 0x9b414000  ! 344: RDPC	rd	%pc, %r13
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802088  ! 346: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_5_196:
	setx 0x9dc3de814a3729db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_197:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 353: RDPC	rd	%pc, %r10
	.word 0x879022fe  ! 354: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 355: FqTOd	dis not found

	.word 0xd2d804a0  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_199:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 357: RDPC	rd	%pc, %r13
memptr_5_200:
	set 0x60340000, %r31
	.word 0x85832433  ! 358: WRCCR_I	wr	%r12, 0x0433, %ccr
	rd %pc, %r19
	add %r19, (ivw_5_201-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_201:
	.word 0x91944014  ! 359: WRPR_PIL_R	wrpr	%r17, %r20, %pil
DS_5_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x83d02034  ! 361: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_cmpr_5_203:
	setx 0xec1c3337227fb1eb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802020  ! 364: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x99902003  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_5_204:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
cwp_5_205:
    set user_data_start, %o7
	.word 0x93902006  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd8c7e030  ! 368: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_206) + 24, 16, 16)) -> intp(3,0,20)
intvec_5_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_207:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 370: RDPC	rd	%pc, %r11
tagged_5_208:
	tsubcctv %r17, 0x1e17, %r21
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_5_209:
	setx 0xe485cc48eef95267, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e030  ! 374: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
debug_5_210:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 375: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x99a00170  ! 378: FABSq	dis not found

DS_5_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3330004  ! 1: STQF_R	-	%f17, [%r4, %r12]
	normalw
	.word 0xa9458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xab814009  ! 380: WR_CLEAR_SOFTINT_R	wr	%r5, %r9, %clear_softint
memptr_5_212:
	set 0x60740000, %r31
	.word 0x8581b0be  ! 381: WRCCR_I	wr	%r6, 0x10be, %ccr
	.word 0x87802088  ! 382: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d020b3  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 179
	rd %pc, %r19
	add %r19, (ivw_5_213-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_213:
	.word 0x91918004  ! 385: WRPR_PIL_R	wrpr	%r6, %r4, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_5_214:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c2a4e  ! 388: SDIVX_I	sdivx	%r16, 0x0a4e, %r11
memptr_5_216:
	set user_data_start, %r31
	.word 0x8581a7ae  ! 389: WRCCR_I	wr	%r6, 0x07ae, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x8790228f  ! 391: WRPR_TT_I	wrpr	%r0, 0x028f, %tt
splash_cmpr_5_217:
	setx 0xffa32b3ef4f124af, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_5_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 394: FqTOd	dis not found

	.word 0x91937024  ! 395: WRPR_PIL_I	wrpr	%r13, 0x1024, %pil
donret_5_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_220-donret_5_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa1902002  ! 397: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa9808001  ! 398: WR_SET_SOFTINT_R	wr	%r2, %r1, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_5_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01970  ! 401: FqTOd	dis not found

cwp_5_223:
    set user_data_start, %o7
	.word 0x93902003  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 404: WRPR_GL_I	wrpr	%r0, 0x0002, %-
intveclr_5_224:
	setx 0x92c3eed503d16365, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x986b3549  ! 406: UDIVX_I	udivx 	%r12, 0xfffff549, %r12
	.word 0xa190200b  ! 407: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_5_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01963  ! 409: FqTOd	dis not found

	.word 0x9b6a000b  ! 410: SDIVX_R	sdivx	%r8, %r11, %r13
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x99a309c2  ! 412: FDIVd	fdivd	%f12, %f2, %f12
DS_5_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_228)+40, 16, 16)) -> intp(5,1,3)
xir_5_228:
	.word 0xa9833198  ! 414: WR_SET_SOFTINT_I	wr	%r12, 0x1198, %set_softint
	.word 0x9350c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0x678e60377f51d71a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a00161  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_230) + 0, 16, 16)) -> intp(6,0,27)
intvec_5_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_5_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_231-donret_5_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c804a0  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_232:
	setx 0xb573f76f455e028d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_233:
    set user_data_start, %o7
	.word 0x93902005  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_234)+0, 16, 16)) -> intp(5,1,3)
xir_5_234:
	.word 0xa984bfb5  ! 428: WR_SET_SOFTINT_I	wr	%r18, 0x1fb5, %set_softint
memptr_5_235:
	set 0x60140000, %r31
	.word 0x8582b653  ! 429: WRCCR_I	wr	%r10, 0x1653, %ccr
splash_cmpr_5_236:
	setx 0x87767728a77881d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0xa1520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_5_237:
	setx 0xbe75883b84b937d0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902125  ! 434: WRPR_TT_I	wrpr	%r0, 0x0125, %tt
intveclr_5_238:
	setx 0x67915b1d5c84c1d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c00e40  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r19
change_to_randtl_5_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_239:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_5_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_240:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_241:
	setx 0x3009477a0bd69296, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9028c1  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x08c1, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_5_242:
	setx 0xbc7b0889037efecc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_5_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_5_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d928004  ! 447: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
	.word 0x87802055  ! 448: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d306e  ! 449: SDIVX_I	sdivx	%r20, 0xfffff06e, %r8
splash_cmpr_5_246:
	setx 0xd96344fb8067b273, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_247:
	.word 0x8f902002  ! 451: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_5_248:
	tsubcctv %r12, 0x1844, %r15
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a61b1  ! 453: SDIVX_I	sdivx	%r9, 0x01b1, %r10
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_5_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_250:
	.word 0x8f902000  ! 455: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_5_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780208b  ! 458: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xa190200a  ! 459: WRPR_GL_I	wrpr	%r0, 0x000a, %-
debug_5_252:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 460: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xa780653d  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x053d, %-
	.word 0x9550c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_5_253:
	setx 0x18d622cb11385263, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_254) + 48, 16, 16)) -> intp(2,0,29)
intvec_5_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
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
splash_lsu_5_256:
	setx 0x325a49ffd4bfb9cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d91000d  ! 467: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
splash_lsu_5_258:
	setx 0x154d01bb91579a87, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_259:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93b48ff1  ! 471: FONES	e	%f9
debug_5_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab802944  ! 473: WR_CLEAR_SOFTINT_I	wr	%r0, 0x0944, %clear_softint
mondo_5_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91c001  ! 474: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
DS_5_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f30, %f18
	.word 0x95b10300  ! 475: ALIGNADDRESS	alignaddr	%r4, %r0, %r10
debug_5_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_5_264:
	tsubcctv %r14, 0x153c, %r22
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa0843fcb  ! 478: ADDcc_I	addcc 	%r16, 0xffffffcb, %r16
splash_cmpr_5_265:
	setx 0xe01d07f56ad6ce83, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902005  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
intveclr_5_267:
	setx 0x4b4f6091c0a2dc85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_268) + 8, 16, 16)) -> intp(4,0,1)
intvec_5_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_269:
	.word 0x8f902001  ! 484: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 485: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_5_270:
	set user_data_start, %r31
	.word 0x8584a0db  ! 486: WRCCR_I	wr	%r18, 0x00db, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_271:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 487: RDPC	rd	%pc, %r11
	.word 0xa26a4004  ! 488: UDIVX_R	udivx 	%r9, %r4, %r17
	.word 0xa190200d  ! 489: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_272:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 490: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa4f80010  ! 493: SDIVcc_R	sdivcc 	%r0, %r16, %r18
	.word 0x8d902717  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0717, %pstate
mondo_5_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 495: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	.word 0xa1a1c9b1  ! 496: FDIVs	fdivs	%f7, %f17, %f16
	.word 0xa190200a  ! 497: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8790204e  ! 498: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
mondo_4_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d918001  ! 1: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
tagged_4_1:
	taddcctv %r22, 0x1631, %r22
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0xa8a80007  ! 3: ANDNcc_R	andncc 	%r0, %r7, %r20
splash_cmpr_4_2:
	setx 0xb31f06868514d37c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
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
wait_for_debug_4_3:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_3
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 5: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_cmpr_4_4:
	setx 0xdc3dd3f7f1edfad0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa190200d  ! 8: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa745c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01972  ! 10: FqTOd	dis not found

DS_4_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 13: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x95454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
intveclr_4_7:
	setx 0xa9bae7ac28117cd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad80b268  ! 16: WR_SOFTINT_REG_I	wr	%r2, 0x1268, %softint
debug_4_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_4_9:
	taddcctv %r8, 0x13ab, %r15
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d020b2  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_4_10:
	setx 0xc8217d37ab5206ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_12-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_12:
	.word 0x9190800a  ! 22: WRPR_PIL_R	wrpr	%r2, %r10, %pil
splash_tba_4_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa1902002  ! 25: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_4_15:
	setx 0x64808205ce15baf7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab833c3b  ! 27: WR_CLEAR_SOFTINT_I	wr	%r12, 0x1c3b, %clear_softint
splash_tba_4_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba049e6  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x879022cf  ! 31: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0x8d903a4f  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x1a4f, %pstate
splash_hpstate_4_17:
	.word 0x819827cc  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cc, %hpstate
	.word 0xa7a00171  ! 34: FABSq	dis not found

splash_tba_4_18:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_4_20:
	.word 0x81982d5d  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_4_21:
	.word 0x81982ad7  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad7, %hpstate
	.word 0xa190200d  ! 41: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902c68  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0c68, %pstate
	.word 0x99902001  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902003  ! 44: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93520000  ! 45: RDPR_PIL	rdpr	%pil, %r9
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd6800c80  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
splash_hpstate_4_22:
	.word 0x81982354  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0354, %hpstate
splash_decr_4_23:
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa781c006  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r6, %-
DS_4_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b14303  ! 50: ALIGNADDRESS	alignaddr	%r5, %r3, %r9
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_4_25:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01969  ! 53: FqTOd	dis not found

splash_cmpr_4_27:
	setx 0x2d44f350eca5596e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_28:
	.word 0x8f902000  ! 55: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_4_29:
	set 0x60540000, %r31
	.word 0x8580abd5  ! 56: WRCCR_I	wr	%r2, 0x0bd5, %ccr
	.word 0xa2d374bd  ! 57: UMULcc_I	umulcc 	%r13, 0xfffff4bd, %r17
	.word 0x91454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xd8d80e60  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x73, %r12
	.word 0xd88008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_4_30:
	.word 0x91a209d0  ! 1: FDIVd	fdivd	%f8, %f16, %f8
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902fa3  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x0fa3, %pstate
intveclr_4_31:
	setx 0x090c6770d7b1bf7a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d934001  ! 67: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0x9f802b22  ! 68: SIR	sir	0x0b22
	.word 0xa1902001  ! 69: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_4_33:
	setx 0x0508ce8c1b8fb9d9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_4_34:
	setx 0x22a646cb70634811, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_35:
	.word 0x81982317  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_4_36:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_36:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_36
    nop
debug_wait4_36:
    ld [%r23], %r2
    brnz %r2, debug_wait4_36
    nop
    ba,a debug_startwait4_36
continue_debug_4_36:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_36:
    cmp %r13, %r15
    bne,a wait_for_stat_4_36
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_36:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_36
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 75: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
mondo_4_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d92800b  ! 76: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_4_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902825  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0825, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d020b3  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8780204f  ! 83: WRASI_I	wr	%r0, 0x004f, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_4_39:
	set user_data_start, %r31
	.word 0x8582a50b  ! 85: WRCCR_I	wr	%r10, 0x050b, %ccr
splash_tba_4_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_4_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_42:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_42:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_42
    nop
debug_wait4_42:
    ld [%r23], %r2
    brnz %r2, debug_wait4_42
    nop
    ba,a debug_startwait4_42
continue_debug_4_42:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_42:
    cmp %r13, %r15
    bne,a wait_for_stat_4_42
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_42:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_42
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 89: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_4_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_43:
	.word 0x8f902003  ! 91: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa190200c  ! 92: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902af2  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0af2, %pstate
mondo_4_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d944010  ! 94: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xab832748  ! 95: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0748, %clear_softint
DS_4_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
pmu_4_46:
	nop
	setx 0xfffff8c6fffffa71, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_4_47:
    set user_data_start, %o7
	.word 0x93902000  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_4_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_48:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_4_50:
	setx 0x3ea24b0e7013296d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c80e80  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r20
splash_hpstate_4_51:
	.word 0x81982ff5  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ff5, %hpstate
debug_4_52:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_53:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 105: RDPC	rd	%pc, %r11
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa1902001  ! 107: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0x99500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_54) + 32, 16, 16)) -> intp(1,0,20)
intvec_4_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 111: WRPR_GL_I	wrpr	%r0, 0x0008, %-
cwp_4_55:
    set user_data_start, %o7
	.word 0x93902005  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_4_56:
	setx 0xab0e921120e11905, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_57:
	.word 0x8f902003  ! 114: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_4_58:
	setx 0x86181b7654984799, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_4_60:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_4_61:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_4_62:
	nop
	setx 0xfffff09fffffff13, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_4_63:
    set user_data_start, %o7
	.word 0x93902003  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903beb  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1beb, %pstate
mondo_4_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 122: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
debug_4_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf1d9  ! 124: SDIVX_I	sdivx	%r19, 0xfffff1d9, %r11
	.word 0x879023d6  ! 125: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
	.word 0xa153c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x93a049c2  ! 127: FDIVd	fdivd	%f32, %f2, %f40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cfa09  ! 128: SDIVX_I	sdivx	%r19, 0xfffffa09, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01971  ! 129: FqTOd	dis not found

	.word 0x95a44dc4  ! 130: FdMULq	fdmulq	
cwp_4_69:
    set user_data_start, %o7
	.word 0x93902005  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_4_70:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940006  ! 135: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
debug_4_73:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902391  ! 137: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_4_74:
	setx 0xec29fc98f546958b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a7f  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1a7f, %pstate
tagged_4_75:
	taddcctv %r20, 0x1b10, %r3
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_4_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_4_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xff66e8df	! Random illegal ?
	.word 0xa7a189d2  ! 1: FDIVd	fdivd	%f6, %f18, %f50
	.word 0x99a0c820  ! 145: FADDs	fadds	%f3, %f0, %f12
debug_4_79:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_4_81:
	taddcctv %r4, 0x19d0, %r21
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_4_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f2, %f18
	.word 0xa1b24307  ! 149: ALIGNADDRESS	alignaddr	%r9, %r7, %r16
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x91d02034  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab81a530  ! 153: WR_CLEAR_SOFTINT_I	wr	%r6, 0x0530, %clear_softint
	.word 0xd08008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_4_83:
	taddcctv %r20, 0x1c34, %r2
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_4_84:
	setx 0x6b5bb549ed6d0631, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96a3873  ! 157: SDIVX_I	sdivx	%r8, 0xfffff873, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d2093  ! 158: SDIVX_I	sdivx	%r20, 0x0093, %r18
intveclr_4_87:
	setx 0xf5c11943be06add5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020d1  ! 160: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	.word 0x8d903c78  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1c78, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_4_88:
	tsubcctv %r11, 0x1338, %r7
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_4_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0x99a01a73  ! 166: FqTOi	fqtoi	
	.word 0x9145c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r8
tagged_4_90:
	tsubcctv %r13, 0x1ff1, %r7
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_4_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_91:
	.word 0x8f902003  ! 169: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa7a0c9cc  ! 170: FDIVd	fdivd	%f34, %f12, %f50
	.word 0xd8c80e40  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196a  ! 172: FqTOd	dis not found

splash_tba_4_93:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d90329d  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x129d, %pstate
	.word 0x879022e8  ! 175: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
	.word 0x8790232f  ! 176: WRPR_TT_I	wrpr	%r0, 0x032f, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_4_94:
	setx 0x4e19dc91b8f82eae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe010  ! 179: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 180: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01961  ! 181: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01966  ! 182: FqTOd	dis not found

DS_4_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_4_99:
	setx 0x9065b826402b83f7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa5520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e030  ! 188: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
debug_4_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01970  ! 190: FqTOd	dis not found

mondo_4_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 191: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
splash_decr_4_104:
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa782c008  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r8, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d903b61  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x1b61, %pstate
	.word 0x91d02033  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802058  ! 196: WRASI_I	wr	%r0, 0x0058, %asi
mondo_4_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 197: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x8790215c  ! 198: WRPR_TT_I	wrpr	%r0, 0x015c, %tt
memptr_4_106:
	set 0x60540000, %r31
	.word 0x85816a90  ! 199: WRCCR_I	wr	%r5, 0x0a90, %ccr
splash_lsu_4_107:
	setx 0x6e7af49ccf76a08f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_108:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_108:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_108
    nop
debug_wait4_108:
    ld [%r23], %r2
    brnz %r2, debug_wait4_108
    nop
    ba,a debug_startwait4_108
continue_debug_4_108:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_108:
    cmp %r13, %r15
    bne,a wait_for_stat_4_108
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_108:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_108
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 201: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
debug_4_109:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0x95414000  ! 205: RDPC	rd	%pc, %r10
	.word 0x8790210e  ! 206: WRPR_TT_I	wrpr	%r0, 0x010e, %tt
	.word 0xa5a00569  ! 207: FSQRTq	fsqrt	
splash_lsu_4_112:
	setx 0xf72461aa107c49d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00174  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802055  ! 211: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_4_113:
	setx 0x2b68ebed31cce65b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_114)+8, 16, 16)) -> intp(4,1,3)
xir_4_114:
	.word 0xa9807d2b  ! 214: WR_SET_SOFTINT_I	wr	%r1, 0x1d2b, %set_softint
	.word 0xa1a00162  ! 215: FABSq	dis not found

	.word 0x87802016  ! 216: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0xb55f3313d449366b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_116:
	setx 0xe3c24bc659b28829, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9a84ad36  ! 221: ADDcc_I	addcc 	%r18, 0x0d36, %r13
	.word 0xa1902001  ! 222: WRPR_GL_I	wrpr	%r0, 0x0001, %-
pmu_4_118:
	nop
	setx 0xfffff12dfffffdd8, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d900006  ! 225: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
intveclr_4_120:
	setx 0x8bad2a48b7d68800, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01963  ! 227: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x99500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x879021ff  ! 230: WRPR_TT_I	wrpr	%r0, 0x01ff, %tt
mondo_4_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c007  ! 231: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
splash_htba_4_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01960  ! 233: FqTOd	dis not found

	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 234: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_4_126:
	nop
	setx 0xfffff4d1ffffff50, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a00169  ! 236: FABSq	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x98853d0e  ! 238: ADDcc_I	addcc 	%r20, 0xfffffd0e, %r12
	.word 0x87802088  ! 239: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902001  ! 240: WRPR_TT_I	wrpr	%r0, 0x0001, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969a281  ! 241: SDIVX_I	sdivx	%r6, 0x0281, %r12
	.word 0x91d020b2  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 178
memptr_4_129:
	set user_data_start, %r31
	.word 0x858132e4  ! 243: WRCCR_I	wr	%r4, 0x12e4, %ccr
	.word 0xa190200e  ! 244: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_4_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f28, %f0
	.word 0x99b2c30b  ! 245: ALIGNADDRESS	alignaddr	%r11, %r11, %r12
splash_hpstate_4_131:
	.word 0x81982c56  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c56, %hpstate
splash_lsu_4_132:
	setx 0xebf4a98ed0ab6c69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_4_133:
	setx 0x771c9c583e9924d8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802058  ! 251: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_134:
	setx 0xaea1063e6ebd6f0e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_135:
	.word 0x8f902003  ! 255: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_4_136:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_137-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_137:
	.word 0x91924012  ! 257: WRPR_PIL_R	wrpr	%r9, %r18, %pil
	.word 0x8d9038ed  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x18ed, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_138:
	set user_data_start, %r31
	.word 0x85852e11  ! 261: WRCCR_I	wr	%r20, 0x0e11, %ccr
change_to_randtl_4_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_139:
	.word 0x8f902000  ! 262: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_4_140-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_140:
	.word 0x9194400a  ! 263: WRPR_PIL_R	wrpr	%r17, %r10, %pil
cwp_4_141:
    set user_data_start, %o7
	.word 0x93902007  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_4_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_143:
	taddcctv %r14, 0x190d, %r15
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b712b  ! 267: SDIVX_I	sdivx	%r13, 0xfffff12b, %r12
	.word 0xa1464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0x8d90258d  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x058d, %pstate
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
	.word 0x95414000  ! 270: RDPC	rd	%pc, %r10
DS_4_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f22, %f30
	.word 0x9bb0430b  ! 271: ALIGNADDRESS	alignaddr	%r1, %r11, %r13
splash_cmpr_4_147:
	setx 0xd74063ff7dff1989, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902324  ! 273: WRPR_TT_I	wrpr	%r0, 0x0324, %tt
pmu_4_148:
	nop
	setx 0xfffff8dffffffa25, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_4_150:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_150:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_150
    nop
debug_wait4_150:
    ld [%r23], %r2
    brnz %r2, debug_wait4_150
    nop
    ba,a debug_startwait4_150
continue_debug_4_150:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_150:
    cmp %r13, %r15
    bne,a wait_for_stat_4_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_150:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_150
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 276: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	setx 0x625d4f9b7b69f8c5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 279: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_4_154:
	tsubcctv %r3, 0x1fc1, %r12
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_4_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_155:
	.word 0x8f902001  ! 282: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91937e34  ! 283: WRPR_PIL_I	wrpr	%r13, 0x1e34, %pil
	.word 0x8d802004  ! 284: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r8
DS_4_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_4_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f22, %f16
	.word 0x9bb48310  ! 287: ALIGNADDRESS	alignaddr	%r18, %r16, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_158) + 8, 16, 16)) -> intp(1,0,6)
intvec_4_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_159:
	.word 0xa3a049c5  ! 1: FDIVd	fdivd	%f32, %f36, %f48
	.word 0xd7334002  ! 1: STQF_R	-	%f11, [%r2, %r13]
	normalw
	.word 0x9b458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r13
debug_4_160:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_4_162:
	setx 0x9684f21ca5128072, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_4_163:
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7814000  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r0, %-
	.word 0xa1902005  ! 294: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x986ab33b  ! 295: UDIVX_I	udivx 	%r10, 0xfffff33b, %r12
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_4_164:
    set user_data_start, %o7
	.word 0x93902002  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802016  ! 298: WRASI_I	wr	%r0, 0x0016, %asi
	setx 0x8ca9f15aa20bfe22, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_4_166:
	tsubcctv %r25, 0x16e6, %r25
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_4_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a00553  ! 1: FSQRTd	fsqrt	
	.word 0x91a1c827  ! 301: FADDs	fadds	%f7, %f7, %f8
	.word 0x91464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_4_168:
	setx 0x670b8d7f8a4f53a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_169:
	setx 0x0d55e0e0073cb7e0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_170:
	setx 0x14fdd7ab5b2dcf12, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_171:
	setx 0xcb278c168064aa30, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_172:
	.word 0x9ba189c5  ! 1: FDIVd	fdivd	%f6, %f36, %f44
	.word 0xd957f813	! Random illegal ?
	.word 0x99a00540  ! 1: FSQRTd	fsqrt	
	.word 0x99a04828  ! 309: FADDs	fadds	%f1, %f8, %f12
splash_lsu_4_173:
	setx 0x8f2bb6942a19b2b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f80349d  ! 311: SIR	sir	0x149d
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196b  ! 312: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768b817  ! 313: SDIVX_I	sdivx	%r2, 0xfffff817, %r19
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0xa5540000  ! 315: RDPR_GL	rdpr	%-, %r18
splash_hpstate_4_176:
	.word 0x81982c5e  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5e, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 318: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_4_177:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0x93414000  ! 320: RDPC	rd	%pc, %r9
splash_tba_4_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_180:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_4_181:
	.word 0x81982c1e  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
splash_cmpr_4_182:
	setx 0xa4960152ef845405, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_183:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_183:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_183
    nop
debug_wait4_183:
    ld [%r23], %r2
    brnz %r2, debug_wait4_183
    nop
    ba,a debug_startwait4_183
continue_debug_4_183:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_183:
    cmp %r13, %r15
    bne,a wait_for_stat_4_183
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_183:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_183
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 325: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01965  ! 326: FqTOd	dis not found

	.word 0x87802004  ! 327: WRASI_I	wr	%r0, 0x0004, %asi
cwp_4_185:
    set user_data_start, %o7
	.word 0x93902007  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_4_187:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_188:
	setx 0x4d52fd63f12e7c92, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021d7  ! 333: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
	.word 0xa9804014  ! 334: WR_SET_SOFTINT_R	wr	%r1, %r20, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_4_189:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_4_190:
    set user_data_start, %o7
	.word 0x93902005  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_4_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a2c9cc  ! 1: FDIVd	fdivd	%f42, %f12, %f40
	.word 0x93a0c820  ! 338: FADDs	fadds	%f3, %f0, %f9
	.word 0x91520000  ! 339: RDPR_PIL	rdpr	%pil, %r8
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_4_192:
	nop
	setx 0xfffff036fffff314, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d903905  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x1905, %pstate
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
	.word 0x97414000  ! 344: RDPC	rd	%pc, %r11
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8780208a  ! 346: WRASI_I	wr	%r0, 0x008a, %asi
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01965  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_4_196:
	setx 0x9666a045d18df821, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_197:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 353: RDPC	rd	%pc, %r11
	.word 0x87902002  ! 354: WRPR_TT_I	wrpr	%r0, 0x0002, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 355: FqTOd	dis not found

	.word 0xd2d804a0  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_199:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 357: RDPC	rd	%pc, %r9
memptr_4_200:
	set 0x60340000, %r31
	.word 0x858328dc  ! 358: WRCCR_I	wr	%r12, 0x08dc, %ccr
	rd %pc, %r19
	add %r19, (ivw_4_201-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_201:
	.word 0x91950011  ! 359: WRPR_PIL_R	wrpr	%r20, %r17, %pil
DS_4_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91d020b4  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_4_203:
	setx 0xbba9b5c2834c2945, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802083  ! 364: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x99902003  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 366: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
cwp_4_205:
    set user_data_start, %o7
	.word 0x93902005  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd8c7e010  ! 368: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_206) + 40, 16, 16)) -> intp(6,0,28)
intvec_4_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_207:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 370: RDPC	rd	%pc, %r8
tagged_4_208:
	tsubcctv %r18, 0x108d, %r12
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_4_209:
	setx 0xfe1f89ddd60ab89f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e000  ! 374: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
debug_4_210:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_210:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_210
    nop
debug_wait4_210:
    ld [%r23], %r2
    brnz %r2, debug_wait4_210
    nop
    ba,a debug_startwait4_210
continue_debug_4_210:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_210:
    cmp %r13, %r15
    bne,a wait_for_stat_4_210
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_210:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_210
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 375: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x93a00160  ! 378: FABSq	dis not found

DS_4_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe934800d  ! 1: STQF_R	-	%f20, [%r13, %r18]
	normalw
	.word 0x95458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xab850011  ! 380: WR_CLEAR_SOFTINT_R	wr	%r20, %r17, %clear_softint
memptr_4_212:
	set 0x60140000, %r31
	.word 0x858035e7  ! 381: WRCCR_I	wr	%r0, 0x15e7, %ccr
	.word 0x8780204f  ! 382: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d02032  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 50
	rd %pc, %r19
	add %r19, (ivw_4_213-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_213:
	.word 0x91908013  ! 385: WRPR_PIL_R	wrpr	%r2, %r19, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_4_214:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976cae5e  ! 388: SDIVX_I	sdivx	%r18, 0x0e5e, %r11
memptr_4_216:
	set user_data_start, %r31
	.word 0x8584765d  ! 389: WRCCR_I	wr	%r17, 0x165d, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x879023f1  ! 391: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
splash_cmpr_4_217:
	setx 0x5fe56eb5b902d074, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_4_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 394: FqTOd	dis not found

	.word 0x9191ed72  ! 395: WRPR_PIL_I	wrpr	%r7, 0x0d72, %pil
donret_4_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_220-donret_4_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa1902006  ! 397: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa9804014  ! 398: WR_SET_SOFTINT_R	wr	%r1, %r20, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_4_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01961  ! 401: FqTOd	dis not found

cwp_4_223:
    set user_data_start, %o7
	.word 0x93902005  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 403: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 404: WRPR_GL_I	wrpr	%r0, 0x000a, %-
intveclr_4_224:
	setx 0x77e2cc8e8d917c06, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x986c7f74  ! 406: UDIVX_I	udivx 	%r17, 0xffffff74, %r12
	.word 0xa1902004  ! 407: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_4_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 409: FqTOd	dis not found

	.word 0x99684011  ! 410: SDIVX_R	sdivx	%r1, %r17, %r12
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93a1c9cd  ! 412: FDIVd	fdivd	%f38, %f44, %f40
DS_4_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_228)+24, 16, 16)) -> intp(4,1,3)
xir_4_228:
	.word 0xa980334f  ! 414: WR_SET_SOFTINT_I	wr	%r0, 0x134f, %set_softint
	.word 0xa350c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xc453df19024d7fd3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00174  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_230) + 16, 16, 16)) -> intp(0,0,11)
intvec_4_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_4_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_231-donret_4_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c80e60  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_232:
	setx 0x6e482c234dd4a1ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_233:
    set user_data_start, %o7
	.word 0x93902002  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_234)+16, 16, 16)) -> intp(4,1,3)
xir_4_234:
	.word 0xa981bbc0  ! 428: WR_SET_SOFTINT_I	wr	%r6, 0x1bc0, %set_softint
memptr_4_235:
	set 0x60340000, %r31
	.word 0x85816cb6  ! 429: WRCCR_I	wr	%r5, 0x0cb6, %ccr
splash_cmpr_4_236:
	setx 0x26545aaadcfd45d1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0x9b520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_4_237:
	setx 0xab5a535ae81f20e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902069  ! 434: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
intveclr_4_238:
	setx 0xbb01d2376d3aca4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c00e80  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r19
change_to_randtl_4_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_239:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_4_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_240:
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_241:
	setx 0xfbb9746c9035b5a9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9029e7  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x09e7, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_4_242:
	setx 0xd5ba7516bfa384b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_4_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_4_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d914000  ! 447: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
	.word 0x87802058  ! 448: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1683ad4  ! 449: SDIVX_I	sdivx	%r0, 0xfffffad4, %r16
splash_cmpr_4_246:
	setx 0xa0ad22a25e136d4b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_247:
	.word 0x8f902001  ! 451: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_4_248:
	tsubcctv %r6, 0x16bf, %r18
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c362e  ! 453: SDIVX_I	sdivx	%r16, 0xfffff62e, %r11
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_4_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_250:
	.word 0x8f902002  ! 455: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_4_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 457: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 458: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa1902002  ! 459: WRPR_GL_I	wrpr	%r0, 0x0002, %-
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
wait_for_debug_4_252:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_252
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 460: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xa784600e  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x000e, %-
	.word 0xa950c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_4_253:
	setx 0x1fb6c8964da867b4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_254) + 48, 16, 16)) -> intp(6,0,23)
intvec_4_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 465: RDPC	rd	%pc, %r12
splash_lsu_4_256:
	setx 0x00fe175db8c0b7d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d930000  ! 467: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
splash_lsu_4_258:
	setx 0xd8d757179a3166cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_259:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa9b20ff3  ! 471: FONES	e	%f20
debug_4_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab82e501  ! 473: WR_CLEAR_SOFTINT_I	wr	%r11, 0x0501, %clear_softint
mondo_4_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d918013  ! 474: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
DS_4_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f6, %f6
	.word 0x97b40309  ! 475: ALIGNADDRESS	alignaddr	%r16, %r9, %r11
debug_4_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_4_264:
	tsubcctv %r12, 0x1ba9, %r16
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0x96816dd0  ! 478: ADDcc_I	addcc 	%r5, 0x0dd0, %r11
splash_cmpr_4_265:
	setx 0x8bad98dc18af3283, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902001  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
intveclr_4_267:
	setx 0x3f965275c0d16320, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_268) + 32, 16, 16)) -> intp(6,0,29)
intvec_4_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_269:
	.word 0x8f902000  ! 484: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 485: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_4_270:
	set user_data_start, %r31
	.word 0x858035b7  ! 486: WRCCR_I	wr	%r0, 0x15b7, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 487: RDPC	rd	%pc, %r20
	.word 0xa06a0012  ! 488: UDIVX_R	udivx 	%r8, %r18, %r16
	.word 0xa1902009  ! 489: WRPR_GL_I	wrpr	%r0, 0x0009, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 490: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9afc000b  ! 493: SDIVcc_R	sdivcc 	%r16, %r11, %r13
	.word 0x8d902136  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0136, %pstate
mondo_4_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d920002  ! 495: WRPR_WSTATE_R	wrpr	%r8, %r2, %wstate
	.word 0x95a489b1  ! 496: FDIVs	fdivs	%f18, %f17, %f10
	.word 0xa1902007  ! 497: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879021f2  ! 498: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
mondo_3_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94400d  ! 1: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
tagged_3_1:
	taddcctv %r12, 0x1023, %r9
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0xa8a84014  ! 3: ANDNcc_R	andncc 	%r1, %r20, %r20
splash_cmpr_3_2:
	setx 0xdc63652323c0956d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_3:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 5: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_3_4:
	setx 0x3e9cb58e23991fc0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa1902006  ! 8: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9b45c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 10: FqTOd	dis not found

DS_3_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e030  ! 13: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x99454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
intveclr_3_7:
	setx 0x70d7dfa21cd00ec7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad82aa60  ! 16: WR_SOFTINT_REG_I	wr	%r10, 0x0a60, %softint
debug_3_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_3_9:
	taddcctv %r25, 0x1445, %r2
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d020b2  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_3_10:
	setx 0x685e444541d0f381, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_12-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_12:
	.word 0x91908007  ! 22: WRPR_PIL_R	wrpr	%r2, %r7, %pil
splash_tba_3_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200b  ! 25: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_3_15:
	setx 0x69090a6315e9d3e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab80e523  ! 27: WR_CLEAR_SOFTINT_I	wr	%r3, 0x0523, %clear_softint
splash_tba_3_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a349e7  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x87902382  ! 31: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
	.word 0x8d9023e1  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x03e1, %pstate
splash_hpstate_3_17:
	.word 0x81982845  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0845, %hpstate
	.word 0x91a00169  ! 34: FABSq	dis not found

splash_tba_3_18:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_3_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_3_20:
	.word 0x81982edf  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_3_21:
	.word 0x81982ddf  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddf, %hpstate
	.word 0xa190200a  ! 41: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d903e52  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1e52, %pstate
	.word 0x99902004  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902009  ! 44: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa5520000  ! 45: RDPR_PIL	rdpr	%pil, %r18
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd68008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_3_22:
	.word 0x81982545  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0545, %hpstate
splash_decr_3_23:
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7808004  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r4, %-
DS_3_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b20310  ! 50: ALIGNADDRESS	alignaddr	%r8, %r16, %r11
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_3_25:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01965  ! 53: FqTOd	dis not found

splash_cmpr_3_27:
	setx 0x38f1258261cdc580, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_28:
	.word 0x8f902002  ! 55: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_3_29:
	set 0x60340000, %r31
	.word 0x8581e7b3  ! 56: WRCCR_I	wr	%r7, 0x07b3, %ccr
	.word 0x92d17901  ! 57: UMULcc_I	umulcc 	%r5, 0xfffff901, %r9
	.word 0xa7454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xd8d804a0  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8800a80  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r12
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 61: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8c80e40  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
DS_3_30:
	.word 0x97a049cc  ! 1: FDIVd	fdivd	%f32, %f12, %f42
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903588  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1588, %pstate
intveclr_3_31:
	setx 0xfcc1eeebb25f0852, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d92c009  ! 67: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0x9f802def  ! 68: SIR	sir	0x0def
	.word 0xa1902009  ! 69: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_3_33:
	setx 0x88b3272e9f2af2b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_3_34:
	setx 0xfb18871dddb82eaf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_35:
	.word 0x8198278f  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_3_36:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
mondo_3_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d948005  ! 76: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0xe8800ac0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r20
debug_3_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 79: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902cf1  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0cf1, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d02034  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 83: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_3_39:
	set user_data_start, %r31
	.word 0x85812ead  ! 85: WRCCR_I	wr	%r4, 0x0ead, %ccr
splash_tba_3_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_42:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 89: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_3_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_43:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa190200f  ! 92: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d9031ec  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x11ec, %pstate
mondo_3_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d914011  ! 94: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0xab822a5e  ! 95: WR_CLEAR_SOFTINT_I	wr	%r8, 0x0a5e, %clear_softint
DS_3_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
pmu_3_46:
	nop
	setx 0xfffff771ffffffcd, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_3_47:
    set user_data_start, %o7
	.word 0x93902000  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_3_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_48:
	.word 0x8f902001  ! 99: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_3_50:
	setx 0x8b2e8f5484258f23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c80e40  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r20
splash_hpstate_3_51:
	.word 0x81982d24  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d24, %hpstate
debug_3_52:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_53:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 105: RDPC	rd	%pc, %r8
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa1902002  ! 107: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0x93500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_54) + 24, 16, 16)) -> intp(1,0,11)
intvec_3_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 111: WRPR_GL_I	wrpr	%r0, 0x0007, %-
cwp_3_55:
    set user_data_start, %o7
	.word 0x93902006  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_3_56:
	setx 0x707c51df315fb5d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_57:
	.word 0x8f902000  ! 114: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_3_58:
	setx 0x7fb3309225050edf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_3_60:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_3_61:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_3_62:
	nop
	setx 0xfffff88dfffff44e, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_3_63:
    set user_data_start, %o7
	.word 0x93902000  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903e07  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1e07, %pstate
mondo_3_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94000c  ! 122: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
debug_3_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a6044  ! 124: SDIVX_I	sdivx	%r9, 0x0044, %r11
	.word 0x879022fe  ! 125: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x9753c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0xa7a409c9  ! 127: FDIVd	fdivd	%f16, %f40, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9768fd2f  ! 128: SDIVX_I	sdivx	%r3, 0xfffffd2f, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 129: FqTOd	dis not found

	.word 0x91a48dca  ! 130: FdMULq	fdmulq	
cwp_3_69:
    set user_data_start, %o7
	.word 0x93902001  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_3_70:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_3_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d94800c  ! 135: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_3_73:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879021e9  ! 137: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_3_74:
	setx 0x8b4afddcf1abe735, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ae5  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0ae5, %pstate
tagged_3_75:
	taddcctv %r9, 0x1ec5, %r18
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_3_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_3_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_3_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3591b54	! Random illegal ?
	.word 0x97a349c5  ! 1: FDIVd	fdivd	%f44, %f36, %f42
	.word 0xa5a40822  ! 145: FADDs	fadds	%f16, %f2, %f18
debug_3_79:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_3_81:
	taddcctv %r18, 0x1aea, %r18
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_3_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f30, %f30
	.word 0x9bb14302  ! 149: ALIGNADDRESS	alignaddr	%r5, %r2, %r13
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x91d02034  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab822317  ! 153: WR_CLEAR_SOFTINT_I	wr	%r8, 0x0317, %clear_softint
	.word 0xd0800a80  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
tagged_3_83:
	taddcctv %r3, 0x14f0, %r23
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_3_84:
	setx 0x671295905b38a4ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a22bc  ! 157: SDIVX_I	sdivx	%r8, 0x02bc, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76865df  ! 158: SDIVX_I	sdivx	%r1, 0x05df, %r19
intveclr_3_87:
	setx 0x8a3ecc47334e3513, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020ac  ! 160: WRPR_TT_I	wrpr	%r0, 0x00ac, %tt
	.word 0x8d903464  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1464, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_3_88:
	tsubcctv %r5, 0x1820, %r23
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_3_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0x93a01a67  ! 166: FqTOi	fqtoi	
	.word 0x9545c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r10
tagged_3_90:
	tsubcctv %r22, 0x1d79, %r16
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_3_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_91:
	.word 0x8f902001  ! 169: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa3a0c9d4  ! 170: FDIVd	fdivd	%f34, %f20, %f48
	.word 0xd8c80e40  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 172: FqTOd	dis not found

splash_tba_3_93:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902a94  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x0a94, %pstate
	.word 0x87902195  ! 175: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
	.word 0x87902304  ! 176: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_3_94:
	setx 0x72c762f60c606d5d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe000  ! 179: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196b  ! 180: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 181: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01972  ! 182: FqTOd	dis not found

DS_3_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_3_99:
	setx 0x08d23df6d2045560, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e030  ! 188: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
debug_3_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01967  ! 190: FqTOd	dis not found

mondo_3_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 191: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
splash_decr_3_104:
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7848014  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r20, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d9032a7  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x12a7, %pstate
	.word 0x91d02034  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802016  ! 196: WRASI_I	wr	%r0, 0x0016, %asi
mondo_3_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 197: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0x87902043  ! 198: WRPR_TT_I	wrpr	%r0, 0x0043, %tt
memptr_3_106:
	set 0x60340000, %r31
	.word 0x8581f7e2  ! 199: WRCCR_I	wr	%r7, 0x17e2, %ccr
splash_lsu_3_107:
	setx 0xec81db5105ac23ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_108:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 201: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
debug_3_109:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0x9b414000  ! 205: RDPC	rd	%pc, %r13
	.word 0x8790207e  ! 206: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
	.word 0xa9a00567  ! 207: FSQRTq	fsqrt	
splash_lsu_3_112:
	setx 0x70718dfbf1e1e82d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a00163  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x8780201c  ! 211: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_3_113:
	setx 0x1751e48c8b28b093, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_114)+0, 16, 16)) -> intp(3,1,3)
xir_3_114:
	.word 0xa9812e6f  ! 214: WR_SET_SOFTINT_I	wr	%r4, 0x0e6f, %set_softint
	.word 0xa1a0016b  ! 215: FABSq	dis not found

	.word 0x87802010  ! 216: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0x3e9311ca2c573e94, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_116:
	setx 0x8d48d5a31fd1f14c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x90807e71  ! 221: ADDcc_I	addcc 	%r1, 0xfffffe71, %r8
	.word 0xa1902009  ! 222: WRPR_GL_I	wrpr	%r0, 0x0009, %-
pmu_3_118:
	nop
	setx 0xfffff633fffffd5c, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b2  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_3_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d91c006  ! 225: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
intveclr_3_120:
	setx 0x5c37a01ad51c42d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01971  ! 227: FqTOd	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xa3500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x87902163  ! 230: WRPR_TT_I	wrpr	%r0, 0x0163, %tt
mondo_3_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d95000d  ! 231: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
splash_htba_3_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 233: FqTOd	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_3_126:
	nop
	setx 0xfffff6cffffffaa4, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a00160  ! 236: FABSq	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x988278fd  ! 238: ADDcc_I	addcc 	%r9, 0xfffff8fd, %r12
	.word 0x87802004  ! 239: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8790220c  ! 240: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c6f78  ! 241: SDIVX_I	sdivx	%r17, 0x0f78, %r9
	.word 0x93d02034  ! 242: Tcc_I	tne	icc_or_xcc, %r0 + 52
memptr_3_129:
	set user_data_start, %r31
	.word 0x8584f61c  ! 243: WRCCR_I	wr	%r19, 0x161c, %ccr
	.word 0xa1902007  ! 244: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_3_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f4, %f26
	.word 0xa3b10310  ! 245: ALIGNADDRESS	alignaddr	%r4, %r16, %r17
splash_hpstate_3_131:
	.word 0x819824df  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04df, %hpstate
splash_lsu_3_132:
	setx 0xe4644b7db5767d53, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_3_133:
	setx 0x153a79caee5473b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802058  ! 251: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_134:
	setx 0xe22c0bb005f3b82b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_135:
	.word 0x8f902001  ! 255: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_3_136:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_137-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_137:
	.word 0x9191c012  ! 257: WRPR_PIL_R	wrpr	%r7, %r18, %pil
	.word 0x8d903488  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x1488, %pstate
	.word 0xd2800be0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 260: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_3_138:
	set user_data_start, %r31
	.word 0x8581a83a  ! 261: WRCCR_I	wr	%r6, 0x083a, %ccr
change_to_randtl_3_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_139:
	.word 0x8f902000  ! 262: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_3_140-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_140:
	.word 0x91920013  ! 263: WRPR_PIL_R	wrpr	%r8, %r19, %pil
cwp_3_141:
    set user_data_start, %o7
	.word 0x93902003  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_3_142:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_143:
	taddcctv %r7, 0x13ca, %r25
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368e8ec  ! 267: SDIVX_I	sdivx	%r3, 0x08ec, %r9
	.word 0xa9464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8d9020e8  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x00e8, %pstate
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
	.word 0x99414000  ! 270: RDPC	rd	%pc, %r12
DS_3_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f20, %f24
	.word 0x97b50306  ! 271: ALIGNADDRESS	alignaddr	%r20, %r6, %r11
splash_cmpr_3_147:
	setx 0x0c938709b574afe2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022cb  ! 273: WRPR_TT_I	wrpr	%r0, 0x02cb, %tt
pmu_3_148:
	nop
	setx 0xfffffe92fffff6a6, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_3_150:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 276: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	setx 0x9aaa57d8230eb76e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_3_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d930004  ! 279: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_3_154:
	tsubcctv %r7, 0x1c51, %r9
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_3_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_155:
	.word 0x8f902001  ! 282: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9194b07f  ! 283: WRPR_PIL_I	wrpr	%r18, 0x107f, %pil
	.word 0x8d802000  ! 284: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r12
DS_3_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_3_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f18, %f10
	.word 0x9bb4c309  ! 287: ALIGNADDRESS	alignaddr	%r19, %r9, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_158) + 8, 16, 16)) -> intp(6,0,20)
intvec_3_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_159:
	.word 0xa9a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f20
	.word 0xe7330009  ! 1: STQF_R	-	%f19, [%r9, %r12]
	normalw
	.word 0x95458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r10
debug_3_160:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_3_162:
	setx 0xa1971861670cd252, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_3_163:
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa784800d  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r13, %-
	.word 0xa190200c  ! 294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9a687b26  ! 295: UDIVX_I	udivx 	%r1, 0xfffffb26, %r13
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_3_164:
    set user_data_start, %o7
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802010  ! 298: WRASI_I	wr	%r0, 0x0010, %asi
	setx 0xa30096f021ef1513, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_3_166:
	tsubcctv %r20, 0x11c4, %r17
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_3_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa5a40831  ! 301: FADDs	fadds	%f16, %f17, %f18
	.word 0x9b464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_3_168:
	setx 0xe5f7372924f6da03, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_169:
	setx 0xbb98caffd6440805, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_170:
	setx 0xe48021123e2c1131, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_171:
	setx 0xac6237c3f0ec4a6c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_172:
	.word 0x97a4c9c3  ! 1: FDIVd	fdivd	%f50, %f34, %f42
	.word 0xcd6d8d6f	! Random illegal ?
	.word 0xa5a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa7a50832  ! 309: FADDs	fadds	%f20, %f18, %f19
splash_lsu_3_173:
	setx 0x5961ad573e7e6329, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802983  ! 311: SIR	sir	0x0983
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 312: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95697ede  ! 313: SDIVX_I	sdivx	%r5, 0xfffffede, %r10
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0x9b540000  ! 315: RDPR_GL	<illegal instruction>
splash_hpstate_3_176:
	.word 0x81982444  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_177:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0xa1414000  ! 320: RDPC	rd	%pc, %r16
splash_tba_3_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_3_180:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_3_181:
	.word 0x81982dd7  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
splash_cmpr_3_182:
	setx 0xd18894f4b499a0d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_183:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 325: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01963  ! 326: FqTOd	dis not found

	.word 0x87802083  ! 327: WRASI_I	wr	%r0, 0x0083, %asi
cwp_3_185:
    set user_data_start, %o7
	.word 0x93902003  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_3_187:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_188:
	setx 0x388ec7d78401ad87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021fa  ! 333: WRPR_TT_I	wrpr	%r0, 0x01fa, %tt
	.word 0xa9804001  ! 334: WR_SET_SOFTINT_R	wr	%r1, %r1, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_3_189:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_3_190:
    set user_data_start, %o7
	.word 0x93902005  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_3_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x97a109c7  ! 1: FDIVd	fdivd	%f4, %f38, %f42
	.word 0x99a04821  ! 338: FADDs	fadds	%f1, %f1, %f12
	.word 0x97520000  ! 339: RDPR_PIL	rdpr	%pil, %r11
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_3_192:
	nop
	setx 0xfffffdf4fffff549, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d9032ac  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x12ac, %pstate
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
	.word 0x9b414000  ! 344: RDPC	rd	%pc, %r13
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802089  ! 346: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 347: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_3_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 349: FqTOd	dis not found

	.word 0xe6c80e80  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r19
splash_lsu_3_196:
	setx 0xcf8ae139a2cd8eff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_197:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 353: RDPC	rd	%pc, %r11
	.word 0x879021c4  ! 354: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 355: FqTOd	dis not found

	.word 0xd2d804a0  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_199:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 357: RDPC	rd	%pc, %r20
memptr_3_200:
	set 0x60340000, %r31
	.word 0x8580efcc  ! 358: WRCCR_I	wr	%r3, 0x0fcc, %ccr
	rd %pc, %r19
	add %r19, (ivw_3_201-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_201:
	.word 0x9194c00b  ! 359: WRPR_PIL_R	wrpr	%r19, %r11, %pil
DS_3_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d02035  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_3_203:
	setx 0x2273eb92aea8e363, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802004  ! 364: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99902003  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_3_204:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 366: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
cwp_3_205:
    set user_data_start, %o7
	.word 0x93902000  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd8c7e010  ! 368: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_206) + 56, 16, 16)) -> intp(5,0,27)
intvec_3_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_207:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 370: RDPC	rd	%pc, %r11
tagged_3_208:
	tsubcctv %r16, 0x1519, %r3
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_3_209:
	setx 0x66c3b40eefffcf04, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e000  ! 374: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
debug_3_210:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 375: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x97a00170  ! 378: FABSq	dis not found

DS_3_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb350010  ! 1: STQF_R	-	%f13, [%r16, %r20]
	normalw
	.word 0x91458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xab84800a  ! 380: WR_CLEAR_SOFTINT_R	wr	%r18, %r10, %clear_softint
memptr_3_212:
	set 0x60540000, %r31
	.word 0x8582bd45  ! 381: WRCCR_I	wr	%r10, 0x1d45, %ccr
	.word 0x87802055  ! 382: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d020b4  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 180
	rd %pc, %r19
	add %r19, (ivw_3_213-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_213:
	.word 0x91914000  ! 385: WRPR_PIL_R	wrpr	%r5, %r0, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_3_214:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976d2341  ! 388: SDIVX_I	sdivx	%r20, 0x0341, %r11
memptr_3_216:
	set user_data_start, %r31
	.word 0x8581e28f  ! 389: WRCCR_I	wr	%r7, 0x028f, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x879020c5  ! 391: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
splash_cmpr_3_217:
	setx 0xa80011cde0f2c1d6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_3_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 394: FqTOd	dis not found

	.word 0x9192adc3  ! 395: WRPR_PIL_I	wrpr	%r10, 0x0dc3, %pil
donret_3_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_220-donret_3_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa190200f  ! 397: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa984c011  ! 398: WR_SET_SOFTINT_R	wr	%r19, %r17, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_3_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01964  ! 401: FqTOd	dis not found

cwp_3_223:
    set user_data_start, %o7
	.word 0x93902001  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 403: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 404: WRPR_GL_I	wrpr	%r0, 0x0001, %-
intveclr_3_224:
	setx 0x390ad4feb9287420, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x946d3cd3  ! 406: UDIVX_I	udivx 	%r20, 0xfffffcd3, %r10
	.word 0xa1902006  ! 407: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_3_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01960  ! 409: FqTOd	dis not found

	.word 0x99684012  ! 410: SDIVX_R	sdivx	%r1, %r18, %r12
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x97a449d4  ! 412: FDIVd	fdivd	%f48, %f20, %f42
DS_3_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_228)+32, 16, 16)) -> intp(3,1,3)
xir_3_228:
	.word 0xa98532bd  ! 414: WR_SET_SOFTINT_I	wr	%r20, 0x12bd, %set_softint
	.word 0x9950c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xd889daf34edff6ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00170  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_230) + 56, 16, 16)) -> intp(7,0,19)
intvec_3_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_3_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_231-donret_3_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c80e80  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_232:
	setx 0xabeb4fac1630443c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_233:
    set user_data_start, %o7
	.word 0x93902001  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_234)+32, 16, 16)) -> intp(3,1,3)
xir_3_234:
	.word 0xa98466f4  ! 428: WR_SET_SOFTINT_I	wr	%r17, 0x06f4, %set_softint
memptr_3_235:
	set 0x60140000, %r31
	.word 0x85847a8a  ! 429: WRCCR_I	wr	%r17, 0x1a8a, %ccr
splash_cmpr_3_236:
	setx 0x29e03fdcfb6a2ec3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0x91520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_3_237:
	setx 0xb8227d59a117ef67, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022d5  ! 434: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
intveclr_3_238:
	setx 0x611096294e19c5fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c00e40  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r19
change_to_randtl_3_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_239:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_3_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_240:
	.word 0x8f902002  ! 438: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_3_241:
	setx 0x1765282a5188eac5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903393  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x1393, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_3_242:
	setx 0xcbc006f2e9cdab7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 443: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_3_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_3_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d914002  ! 447: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	.word 0x87802004  ! 448: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c3240  ! 449: SDIVX_I	sdivx	%r16, 0xfffff240, %r13
splash_cmpr_3_246:
	setx 0x9a442c017f7e207b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_247:
	.word 0x8f902003  ! 451: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
tagged_3_248:
	tsubcctv %r5, 0x10ea, %r15
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c386f  ! 453: SDIVX_I	sdivx	%r16, 0xfffff86f, %r9
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_3_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_250:
	.word 0x8f902001  ! 455: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_3_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 458: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902003  ! 459: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_3_252:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 460: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa7807023  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x1023, %-
	.word 0xa750c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_3_253:
	setx 0xc72b847c1fbccd76, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_254) + 16, 16, 16)) -> intp(7,0,10)
intvec_3_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 465: RDPC	rd	%pc, %r13
splash_lsu_3_256:
	setx 0x44d6942958ad91f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d948010  ! 467: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
splash_lsu_3_258:
	setx 0x66bc31e65eac7727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_259:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x99b0cff3  ! 471: FONES	e	%f12
debug_3_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab827db2  ! 473: WR_CLEAR_SOFTINT_I	wr	%r9, 0x1db2, %clear_softint
mondo_3_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90000c  ! 474: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
DS_3_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f16, %f4
	.word 0x99b34305  ! 475: ALIGNADDRESS	alignaddr	%r13, %r5, %r12
debug_3_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_3_264:
	tsubcctv %r6, 0x193a, %r18
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa6806d91  ! 478: ADDcc_I	addcc 	%r1, 0x0d91, %r19
splash_cmpr_3_265:
	setx 0x5ed84e1adbd93619, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902003  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
intveclr_3_267:
	setx 0x1f081a0564405d9b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_268) + 32, 16, 16)) -> intp(5,0,21)
intvec_3_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_269:
	.word 0x8f902001  ! 484: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_270:
	set user_data_start, %r31
	.word 0x8584237e  ! 486: WRCCR_I	wr	%r16, 0x037e, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 487: RDPC	rd	%pc, %r19
	.word 0x9a6d0000  ! 488: UDIVX_R	udivx 	%r20, %r0, %r13
	.word 0xa190200b  ! 489: WRPR_GL_I	wrpr	%r0, 0x000b, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_272:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 490: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa8fc8009  ! 493: SDIVcc_R	sdivcc 	%r18, %r9, %r20
	.word 0x8d902ec6  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
mondo_3_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d944013  ! 495: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xa5a449b2  ! 496: FDIVs	fdivs	%f17, %f18, %f18
	.word 0xa190200c  ! 497: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902116  ! 498: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
mondo_2_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 1: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
tagged_2_1:
	taddcctv %r15, 0x18c2, %r9
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0xa6ac4000  ! 3: ANDNcc_R	andncc 	%r17, %r0, %r19
splash_cmpr_2_2:
	setx 0xb78db8e455ee7cda, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_3:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 5: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_2_4:
	setx 0xad7f4c405b7d207f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa1902003  ! 8: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa345c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01963  ! 10: FqTOd	dis not found

DS_2_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e010  ! 13: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x95454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
intveclr_2_7:
	setx 0xa4bfd9ab30f1561a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad80389c  ! 16: WR_SOFTINT_REG_I	wr	%r0, 0x189c, %softint
debug_2_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_2_9:
	taddcctv %r18, 0x1130, %r23
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d02033  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_2_10:
	setx 0xe88b08a450bdc6d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_12-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_12:
	.word 0x9192c005  ! 22: WRPR_PIL_R	wrpr	%r11, %r5, %pil
splash_tba_2_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200d  ! 25: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_lsu_2_15:
	setx 0xa97c85a100ad23cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab806087  ! 27: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0087, %clear_softint
splash_tba_2_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a109f2  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x879023f0  ! 31: WRPR_TT_I	wrpr	%r0, 0x03f0, %tt
	.word 0x8d903479  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x1479, %pstate
splash_hpstate_2_17:
	.word 0x81982d0d  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
	.word 0x95a00167  ! 34: FABSq	dis not found

splash_tba_2_18:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_2_20:
	.word 0x81982417  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0417, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_2_21:
	.word 0x81982555  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0xa190200a  ! 41: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d903a7a  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1a7a, %pstate
	.word 0x99902001  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902009  ! 44: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd68008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_2_22:
	.word 0x819828d4  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
splash_decr_2_23:
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7844007  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r7, %-
DS_2_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb4030c  ! 50: ALIGNADDRESS	alignaddr	%r16, %r12, %r13
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_2_25:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01966  ! 53: FqTOd	dis not found

splash_cmpr_2_27:
	setx 0x2f8512b3376ca5c8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_28:
	.word 0x8f902001  ! 55: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_2_29:
	set 0x60140000, %r31
	.word 0x85836c35  ! 56: WRCCR_I	wr	%r13, 0x0c35, %ccr
	.word 0x9ad4fbbe  ! 57: UMULcc_I	umulcc 	%r19, 0xfffffbbe, %r13
	.word 0x9b454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xd8d80e80  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0xd88008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_2_30:
	.word 0x93a189cd  ! 1: FDIVd	fdivd	%f6, %f44, %f40
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90310d  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x110d, %pstate
intveclr_2_31:
	setx 0xeb2b707d46e8575e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950004  ! 67: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0x9f8032d1  ! 68: SIR	sir	0x12d1
	.word 0xa190200f  ! 69: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_2_33:
	setx 0xee80b5b2d0e90b4e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_2_34:
	setx 0xe105763fb739be32, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_35:
	.word 0x8198294c  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_2_36:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 75: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
mondo_2_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910013  ! 76: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0xe8800c80  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
debug_2_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a2a  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0a2a, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d02032  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802089  ! 83: WRASI_I	wr	%r0, 0x0089, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_2_39:
	set user_data_start, %r31
	.word 0x85817621  ! 85: WRCCR_I	wr	%r5, 0x1621, %ccr
splash_tba_2_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_2_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_42:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 89: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_2_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_43:
	.word 0x8f902003  ! 91: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902005  ! 92: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902b68  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0b68, %pstate
mondo_2_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 94: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xab8437ec  ! 95: WR_CLEAR_SOFTINT_I	wr	%r16, 0x17ec, %clear_softint
DS_2_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
pmu_2_46:
	nop
	setx 0xfffff355fffff696, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_2_47:
    set user_data_start, %o7
	.word 0x93902007  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_2_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_48:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_2_50:
	setx 0x23806b5bdba5d719, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c80e60  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r20
splash_hpstate_2_51:
	.word 0x81982fed  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fed, %hpstate
debug_2_52:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 105: RDPC	rd	%pc, %r18
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa190200e  ! 107: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0xa9500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_54) + 16, 16, 16)) -> intp(2,0,16)
intvec_2_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 111: WRPR_GL_I	wrpr	%r0, 0x0006, %-
cwp_2_55:
    set user_data_start, %o7
	.word 0x93902000  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_2_56:
	setx 0xc24fde69fc327667, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_57:
	.word 0x8f902001  ! 114: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_2_58:
	setx 0xdd11bf91fea74639, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_2_60:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_2_61:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_2_62:
	nop
	setx 0xfffff7a2fffff057, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_2_63:
    set user_data_start, %o7
	.word 0x93902003  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903022  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1022, %pstate
mondo_2_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 122: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
debug_2_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c712c  ! 124: SDIVX_I	sdivx	%r17, 0xfffff12c, %r16
	.word 0x879020ad  ! 125: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0x9b53c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x91a449c6  ! 127: FDIVd	fdivd	%f48, %f6, %f8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96cf27f  ! 128: SDIVX_I	sdivx	%r19, 0xfffff27f, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196d  ! 129: FqTOd	dis not found

	.word 0xa7a44dd3  ! 130: FdMULq	fdmulq	
cwp_2_69:
    set user_data_start, %o7
	.word 0x93902007  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_2_70:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d930011  ! 135: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
debug_2_73:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879023b4  ! 137: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_2_74:
	setx 0x66c90c3d77320b64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90398d  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x198d, %pstate
tagged_2_75:
	taddcctv %r10, 0x1eea, %r20
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_2_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_2_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf77f0fe1	! Random illegal ?
	.word 0xa9a089c3  ! 1: FDIVd	fdivd	%f2, %f34, %f20
	.word 0x97a5082c  ! 145: FADDs	fadds	%f20, %f12, %f11
debug_2_79:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_2_81:
	taddcctv %r19, 0x1eb8, %r18
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_2_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f8, %f28
	.word 0x95b18312  ! 149: ALIGNADDRESS	alignaddr	%r6, %r18, %r10
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x93d02033  ! 151: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd0d00e80  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0xab81e93b  ! 153: WR_CLEAR_SOFTINT_I	wr	%r7, 0x093b, %clear_softint
	.word 0xd0800c00  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
tagged_2_83:
	taddcctv %r18, 0x12f1, %r7
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_2_84:
	setx 0xbb9f06535b8f7691, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569275f  ! 157: SDIVX_I	sdivx	%r4, 0x075f, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a75a0  ! 158: SDIVX_I	sdivx	%r9, 0xfffff5a0, %r11
intveclr_2_87:
	setx 0xf6b6b57ce25659fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902000  ! 160: WRPR_TT_I	wrpr	%r0, 0x0000, %tt
	.word 0x8d902b69  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0b69, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_2_88:
	tsubcctv %r19, 0x1221, %r25
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_2_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0x95a01a67  ! 166: FqTOi	fqtoi	
	.word 0x9545c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r10
tagged_2_90:
	tsubcctv %r4, 0x1399, %r1
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_2_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_91:
	.word 0x8f902000  ! 169: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93a1c9d4  ! 170: FDIVd	fdivd	%f38, %f20, %f40
	.word 0xd8c80e80  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 172: FqTOd	dis not found

splash_tba_2_93:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d9021f1  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x01f1, %pstate
	.word 0x8790212b  ! 175: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
	.word 0x87902088  ! 176: WRPR_TT_I	wrpr	%r0, 0x0088, %tt
	.word 0xe88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_2_94:
	setx 0x0a55e21c2dd35e5d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe030  ! 179: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 180: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01966  ! 181: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 182: FqTOd	dis not found

DS_2_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_2_99:
	setx 0xa476e9fe74708477, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e010  ! 188: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
debug_2_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 190: FqTOd	dis not found

mondo_2_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d930011  ! 191: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
splash_decr_2_104:
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7830012  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r18, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d903afd  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x1afd, %pstate
	.word 0x91d02035  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 196: WRASI_I	wr	%r0, 0x0004, %asi
mondo_2_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d900014  ! 197: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x8790224b  ! 198: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
memptr_2_106:
	set 0x60140000, %r31
	.word 0x8584ea45  ! 199: WRCCR_I	wr	%r19, 0x0a45, %ccr
splash_lsu_2_107:
	setx 0x41cb6a12ef93cd89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_108:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 201: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
debug_2_109:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0xa3414000  ! 205: RDPC	rd	%pc, %r17
	.word 0x879021be  ! 206: WRPR_TT_I	wrpr	%r0, 0x01be, %tt
	.word 0x95a0056d  ! 207: FSQRTq	fsqrt	
splash_lsu_2_112:
	setx 0xa47a05e362e2ee4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00171  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x8780201c  ! 211: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_2_113:
	setx 0xb57c2c7d3be2bc44, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_114)+48, 16, 16)) -> intp(2,1,3)
xir_2_114:
	.word 0xa984a971  ! 214: WR_SET_SOFTINT_I	wr	%r18, 0x0971, %set_softint
	.word 0x99a00172  ! 215: FABSq	dis not found

	.word 0x87802083  ! 216: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0xe1a0abaf782a0e8e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_116:
	setx 0xd822433e59e2e64b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0xa680200a  ! 221: ADDcc_I	addcc 	%r0, 0x000a, %r19
	.word 0xa190200a  ! 222: WRPR_GL_I	wrpr	%r0, 0x000a, %-
pmu_2_118:
	nop
	setx 0xffffff40fffff8e7, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d918004  ! 225: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
intveclr_2_120:
	setx 0xbf5e6d223942d36b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01968  ! 227: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xa1500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x879020dc  ! 230: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
mondo_2_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944008  ! 231: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
splash_htba_2_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01965  ! 233: FqTOd	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_2_126:
	nop
	setx 0xfffffa5ffffff543, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a00170  ! 236: FABSq	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0xa8823fdf  ! 238: ADDcc_I	addcc 	%r8, 0xffffffdf, %r20
	.word 0x87802055  ! 239: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8790227f  ! 240: WRPR_TT_I	wrpr	%r0, 0x027f, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cad47  ! 241: SDIVX_I	sdivx	%r18, 0x0d47, %r8
	.word 0x93d02032  ! 242: Tcc_I	tne	icc_or_xcc, %r0 + 50
memptr_2_129:
	set user_data_start, %r31
	.word 0x858062a9  ! 243: WRCCR_I	wr	%r1, 0x02a9, %ccr
	.word 0xa1902001  ! 244: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_2_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f14, %f4
	.word 0x97b04313  ! 245: ALIGNADDRESS	alignaddr	%r1, %r19, %r11
splash_hpstate_2_131:
	.word 0x81982195  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0195, %hpstate
splash_lsu_2_132:
	setx 0x497a4e85d2068927, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_2_133:
	setx 0x7e79082dc583d475, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802083  ! 251: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_134:
	setx 0xba182f26b5330900, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_135:
	.word 0x8f902003  ! 255: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_2_136:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_137-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_137:
	.word 0x91914011  ! 257: WRPR_PIL_R	wrpr	%r5, %r17, %pil
	.word 0x8d9028cc  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x08cc, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_2_138:
	set user_data_start, %r31
	.word 0x85813784  ! 261: WRCCR_I	wr	%r4, 0x1784, %ccr
change_to_randtl_2_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_139:
	.word 0x8f902002  ! 262: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_2_140-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_140:
	.word 0x9194c00b  ! 263: WRPR_PIL_R	wrpr	%r19, %r11, %pil
cwp_2_141:
    set user_data_start, %o7
	.word 0x93902004  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_2_142:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_143:
	taddcctv %r26, 0x1c00, %r22
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c2984  ! 267: SDIVX_I	sdivx	%r16, 0x0984, %r17
	.word 0x99464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x8d9033f0  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x13f0, %pstate
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
	.word 0x97414000  ! 270: RDPC	rd	%pc, %r11
DS_2_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f2, %f10
	.word 0xa1b48313  ! 271: ALIGNADDRESS	alignaddr	%r18, %r19, %r16
splash_cmpr_2_147:
	setx 0x332618f170531f18, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790220e  ! 273: WRPR_TT_I	wrpr	%r0, 0x020e, %tt
pmu_2_148:
	nop
	setx 0xfffff542fffff0ec, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_2_150:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 276: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	setx 0xe40740a137335133, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 279: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_2_154:
	tsubcctv %r24, 0x1c90, %r13
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_2_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_155:
	.word 0x8f902002  ! 282: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9190f656  ! 283: WRPR_PIL_I	wrpr	%r3, 0x1656, %pil
	.word 0x8d802000  ! 284: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r20
DS_2_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_2_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f30, %f12
	.word 0xa9b20309  ! 287: ALIGNADDRESS	alignaddr	%r8, %r9, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_158) + 40, 16, 16)) -> intp(0,0,7)
intvec_2_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_159:
	.word 0xa5a409d0  ! 1: FDIVd	fdivd	%f16, %f16, %f18
	.word 0xd7324012  ! 1: STQF_R	-	%f11, [%r18, %r9]
	normalw
	.word 0xa9458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r20
debug_2_160:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_2_162:
	setx 0xb3af24334bd66fc3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_2_163:
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7840013  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r19, %-
	.word 0xa190200c  ! 294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa6693c77  ! 295: UDIVX_I	udivx 	%r4, 0xfffffc77, %r19
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_2_164:
    set user_data_start, %o7
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802004  ! 298: WRASI_I	wr	%r0, 0x0004, %asi
	setx 0x11f3d2b7adaf70b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_166:
	tsubcctv %r22, 0x1008, %r23
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_2_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a00544  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c821  ! 301: FADDs	fadds	%f19, %f1, %f9
	.word 0x93464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_2_168:
	setx 0xe6d401d594ccf595, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_169:
	setx 0xa8ae24a4cf6a03fe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_170:
	setx 0xfb5c08df8fd4dddf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_171:
	setx 0x51ed82ee55dd2612, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_172:
	.word 0xa5a4c9d1  ! 1: FDIVd	fdivd	%f50, %f48, %f18
	.word 0x915b4dfa	! Random illegal ?
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0x9ba08822  ! 309: FADDs	fadds	%f2, %f2, %f13
splash_lsu_2_173:
	setx 0x3a9a88a8ab987a73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802d41  ! 311: SIR	sir	0x0d41
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 312: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169e944  ! 313: SDIVX_I	sdivx	%r7, 0x0944, %r16
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0x97540000  ! 315: RDPR_GL	<illegal instruction>
splash_hpstate_2_176:
	.word 0x81982b8d  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_177:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0x95414000  ! 320: RDPC	rd	%pc, %r10
splash_tba_2_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_180:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_2_181:
	.word 0x81982a5e  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5e, %hpstate
splash_cmpr_2_182:
	setx 0x08af8b34bff78292, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_183:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 325: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01962  ! 326: FqTOd	dis not found

	.word 0x87802088  ! 327: WRASI_I	wr	%r0, 0x0088, %asi
cwp_2_185:
    set user_data_start, %o7
	.word 0x93902004  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_2_187:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_188:
	setx 0x08ea2a137685b911, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023e7  ! 333: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	.word 0xa9848004  ! 334: WR_SET_SOFTINT_R	wr	%r18, %r4, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_2_189:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_2_190:
    set user_data_start, %o7
	.word 0x93902000  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_2_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a1c9cd  ! 1: FDIVd	fdivd	%f38, %f44, %f18
	.word 0xa3a34826  ! 338: FADDs	fadds	%f13, %f6, %f17
	.word 0xa5520000  ! 339: RDPR_PIL	rdpr	%pil, %r18
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_2_192:
	nop
	setx 0xfffff5fbfffff62c, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902e97  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
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
	.word 0xa9414000  ! 344: RDPC	rd	%pc, %r20
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802016  ! 346: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 347: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_2_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196b  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_2_196:
	setx 0x8a6e1290c4f497bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_197:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 353: RDPC	rd	%pc, %r12
	.word 0x8790212f  ! 354: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01969  ! 355: FqTOd	dis not found

	.word 0xd2d804a0  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_199:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 357: RDPC	rd	%pc, %r20
memptr_2_200:
	set 0x60140000, %r31
	.word 0x8581334b  ! 358: WRCCR_I	wr	%r4, 0x134b, %ccr
	rd %pc, %r19
	add %r19, (ivw_2_201-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_201:
	.word 0x91914004  ! 359: WRPR_PIL_R	wrpr	%r5, %r4, %pil
DS_2_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x91d02033  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_2_203:
	setx 0xa41f5c0c318a171a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802010  ! 364: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_2_204:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 366: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
cwp_2_205:
    set user_data_start, %o7
	.word 0x93902002  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd8c7e000  ! 368: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_206) + 0, 16, 16)) -> intp(7,0,15)
intvec_2_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_207:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 370: RDPC	rd	%pc, %r16
tagged_2_208:
	tsubcctv %r3, 0x16a0, %r9
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_2_209:
	setx 0xb6e8a48c2c062b1e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e030  ! 374: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
debug_2_210:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 375: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x95a0016a  ! 378: FABSq	dis not found

DS_2_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd334c00b  ! 1: STQF_R	-	%f9, [%r11, %r19]
	normalw
	.word 0x93458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xab818013  ! 380: WR_CLEAR_SOFTINT_R	wr	%r6, %r19, %clear_softint
memptr_2_212:
	set 0x60540000, %r31
	.word 0x858026aa  ! 381: WRCCR_I	wr	%r0, 0x06aa, %ccr
	.word 0x87802083  ! 382: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x83d02032  ! 384: Tcc_I	te	icc_or_xcc, %r0 + 50
	rd %pc, %r19
	add %r19, (ivw_2_213-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_213:
	.word 0x91950008  ! 385: WRPR_PIL_R	wrpr	%r20, %r8, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_2_214:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a7271  ! 388: SDIVX_I	sdivx	%r9, 0xfffff271, %r18
memptr_2_216:
	set user_data_start, %r31
	.word 0x8582b4c4  ! 389: WRCCR_I	wr	%r10, 0x14c4, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x879023fb  ! 391: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
splash_cmpr_2_217:
	setx 0xd6f83bbce29dc862, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_2_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01960  ! 394: FqTOd	dis not found

	.word 0x9194a140  ! 395: WRPR_PIL_I	wrpr	%r18, 0x0140, %pil
donret_2_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_220-donret_2_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa1902009  ! 397: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa9824010  ! 398: WR_SET_SOFTINT_R	wr	%r9, %r16, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_2_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 401: FqTOd	dis not found

cwp_2_223:
    set user_data_start, %o7
	.word 0x93902002  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 403: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 404: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_2_224:
	setx 0x5872ef3147744033, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9669bd4a  ! 406: UDIVX_I	udivx 	%r6, 0xfffffd4a, %r11
	.word 0xa190200a  ! 407: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_2_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 409: FqTOd	dis not found

	.word 0x956a8008  ! 410: SDIVX_R	sdivx	%r10, %r8, %r10
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x9ba089cb  ! 412: FDIVd	fdivd	%f2, %f42, %f44
DS_2_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_228)+48, 16, 16)) -> intp(2,1,3)
xir_2_228:
	.word 0xa982fb1c  ! 414: WR_SET_SOFTINT_I	wr	%r11, 0x1b1c, %set_softint
	.word 0x9550c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0x2f1785154abbec49, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00171  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_230) + 40, 16, 16)) -> intp(4,0,4)
intvec_2_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d80e60  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
donret_2_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_231-donret_2_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c804a0  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_232:
	setx 0x3bdfc028a9b813f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_233:
    set user_data_start, %o7
	.word 0x93902004  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_234)+32, 16, 16)) -> intp(2,1,3)
xir_2_234:
	.word 0xa981b6a9  ! 428: WR_SET_SOFTINT_I	wr	%r6, 0x16a9, %set_softint
memptr_2_235:
	set 0x60140000, %r31
	.word 0x858423f0  ! 429: WRCCR_I	wr	%r16, 0x03f0, %ccr
splash_cmpr_2_236:
	setx 0xd19642fec4672bb5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0x97520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_2_237:
	setx 0x41debd867316e98f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902018  ! 434: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
intveclr_2_238:
	setx 0xe572a303790dce06, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
change_to_randtl_2_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_239:
	.word 0x8f902001  ! 437: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_2_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_240:
	.word 0x8f902002  ! 438: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_241:
	setx 0xb65b2c20e74e14ee, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9037d4  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x17d4, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_2_242:
	setx 0xcd54da8e287f634a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 443: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_2_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_2_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c011  ! 447: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
	.word 0x87802089  ! 448: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b682337  ! 449: SDIVX_I	sdivx	%r0, 0x0337, %r13
splash_cmpr_2_246:
	setx 0xd06178f499e3f4ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_247:
	.word 0x8f902000  ! 451: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_2_248:
	tsubcctv %r7, 0x1cab, %r4
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936877fd  ! 453: SDIVX_I	sdivx	%r1, 0xfffff7fd, %r9
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_2_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_250:
	.word 0x8f902001  ! 455: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_2_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 458: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa1902005  ! 459: WRPR_GL_I	wrpr	%r0, 0x0005, %-
debug_2_252:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 460: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xa782f0b1  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x10b1, %-
	.word 0xa550c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_2_253:
	setx 0x8aab17e3279b4e07, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_254) + 16, 16, 16)) -> intp(5,0,4)
intvec_2_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 465: RDPC	rd	%pc, %r13
splash_lsu_2_256:
	setx 0xd1b600264f072591, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d918009  ! 467: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
splash_lsu_2_258:
	setx 0x6a6d736d0c7c3961, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_259:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa7b40fe6  ! 471: FONES	e	%f19
debug_2_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab82f878  ! 473: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1878, %clear_softint
mondo_2_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 474: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
DS_2_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f4, %f20
	.word 0x97b28303  ! 475: ALIGNADDRESS	alignaddr	%r10, %r3, %r11
debug_2_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_2_264:
	tsubcctv %r14, 0x1d30, %r23
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0x9480a11e  ! 478: ADDcc_I	addcc 	%r2, 0x011e, %r10
splash_cmpr_2_265:
	setx 0x122653dfc7588cc5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902003  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
intveclr_2_267:
	setx 0xf052ef322e5a6e61, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_268) + 24, 16, 16)) -> intp(7,0,12)
intvec_2_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_269:
	.word 0x8f902002  ! 484: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 485: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_2_270:
	set user_data_start, %r31
	.word 0x8582249a  ! 486: WRCCR_I	wr	%r8, 0x049a, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_271:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 487: RDPC	rd	%pc, %r10
	.word 0x966c8013  ! 488: UDIVX_R	udivx 	%r18, %r19, %r11
	.word 0xa190200d  ! 489: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_272:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 490: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 492: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa2fc0002  ! 493: SDIVcc_R	sdivcc 	%r16, %r2, %r17
	.word 0x8d903ef2  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x1ef2, %pstate
mondo_2_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948008  ! 495: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0xa5a409ab  ! 496: FDIVs	fdivs	%f16, %f11, %f18
	.word 0xa190200f  ! 497: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879021f8  ! 498: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
mondo_1_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 1: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
tagged_1_1:
	taddcctv %r6, 0x133f, %r14
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0xa6ab0002  ! 3: ANDNcc_R	andncc 	%r12, %r2, %r19
splash_cmpr_1_2:
	setx 0x15fcc956693fc983, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_3:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
splash_cmpr_1_4:
	setx 0x13e4bd9cc916b341, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa1902002  ! 8: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9545c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 10: FqTOd	dis not found

DS_1_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e000  ! 13: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0x91454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
intveclr_1_7:
	setx 0xc6d75392463420da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad82b2bd  ! 16: WR_SOFTINT_REG_I	wr	%r10, 0x12bd, %softint
debug_1_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_1_9:
	taddcctv %r24, 0x1d41, %r2
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d02032  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_1_10:
	setx 0x5f5c23c1cdcd3c27, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_12-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_12:
	.word 0x9193400d  ! 22: WRPR_PIL_R	wrpr	%r13, %r13, %pil
splash_tba_1_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200c  ! 25: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_1_15:
	setx 0xd82b2fccfeeec153, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab81b72e  ! 27: WR_CLEAR_SOFTINT_I	wr	%r6, 0x172e, %clear_softint
splash_tba_1_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba349e0  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x87902012  ! 31: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0x8d9024e3  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x04e3, %pstate
splash_hpstate_1_17:
	.word 0x819828c4  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c4, %hpstate
	.word 0xa7a00166  ! 34: FABSq	dis not found

splash_tba_1_18:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_1_20:
	.word 0x819824c7  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_1_21:
	.word 0x81982bb7  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bb7, %hpstate
	.word 0xa1902004  ! 41: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d903678  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1678, %pstate
	.word 0x99902005  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa1902006  ! 44: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9b520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd68008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_1_22:
	.word 0x81982f97  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f97, %hpstate
splash_decr_1_23:
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa780400d  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r13, %-
DS_1_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa7b0430c  ! 50: ALIGNADDRESS	alignaddr	%r1, %r12, %r19
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_1_25:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01960  ! 53: FqTOd	dis not found

splash_cmpr_1_27:
	setx 0xe0a190a1f0597727, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_28:
	.word 0x8f902001  ! 55: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_1_29:
	set 0x60540000, %r31
	.word 0x8581e8af  ! 56: WRCCR_I	wr	%r7, 0x08af, %ccr
	.word 0xa6d1257b  ! 57: UMULcc_I	umulcc 	%r4, 0x057b, %r19
	.word 0x99454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd8d804a0  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd88008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_1_30:
	.word 0xa5a489c9  ! 1: FDIVd	fdivd	%f18, %f40, %f18
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90261f  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x061f, %pstate
intveclr_1_31:
	setx 0x83fc8e03b000a4d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 67: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0x9f803d76  ! 68: SIR	sir	0x1d76
	.word 0xa190200b  ! 69: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_1_33:
	setx 0x2dc47d475fa152ef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_1_34:
	setx 0x8e3273eb3c056b41, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_35:
	.word 0x8198260c  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060c, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_1_36:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 75: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
mondo_1_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918013  ! 76: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_1_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902657  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x91d02035  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8780208a  ! 83: WRASI_I	wr	%r0, 0x008a, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_1_39:
	set user_data_start, %r31
	.word 0x8580e7d4  ! 85: WRCCR_I	wr	%r3, 0x07d4, %ccr
splash_tba_1_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_42:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 89: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_1_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_43:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902006  ! 92: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d902e7e  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0e7e, %pstate
mondo_1_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 94: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xab81e164  ! 95: WR_CLEAR_SOFTINT_I	wr	%r7, 0x0164, %clear_softint
DS_1_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
pmu_1_46:
	nop
	setx 0xfffffc5cfffffa36, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_1_47:
    set user_data_start, %o7
	.word 0x93902005  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_1_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_48:
	.word 0x8f902002  ! 99: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_1_50:
	setx 0x513cda77c5a8c3d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c804a0  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
splash_hpstate_1_51:
	.word 0x81982627  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0627, %hpstate
debug_1_52:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_53:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 105: RDPC	rd	%pc, %r10
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa190200f  ! 107: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0x91500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_54) + 56, 16, 16)) -> intp(0,0,27)
intvec_1_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 111: WRPR_GL_I	wrpr	%r0, 0x0009, %-
cwp_1_55:
    set user_data_start, %o7
	.word 0x93902000  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_1_56:
	setx 0x17cb7e8a07f96509, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_57:
	.word 0x8f902003  ! 114: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_1_58:
	setx 0xc8528f9c11c912b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_1_60:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_1_61:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_1_62:
	nop
	setx 0xfffff38cfffff773, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_1_63:
    set user_data_start, %o7
	.word 0x93902002  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d903f9f  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x1f9f, %pstate
mondo_1_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d918000  ! 122: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
debug_1_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3696008  ! 124: SDIVX_I	sdivx	%r5, 0x0008, %r17
	.word 0x87902190  ! 125: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x9153c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x95a349c8  ! 127: FDIVd	fdivd	%f44, %f8, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169b567  ! 128: SDIVX_I	sdivx	%r6, 0xfffff567, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 129: FqTOd	dis not found

	.word 0xa9a4cdc6  ! 130: FdMULq	fdmulq	
cwp_1_69:
    set user_data_start, %o7
	.word 0x93902002  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_1_70:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d948004  ! 135: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
debug_1_73:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790205d  ! 137: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_1_74:
	setx 0x1709355cdf68dce3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903369  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1369, %pstate
tagged_1_75:
	taddcctv %r2, 0x1e73, %r25
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_1_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_1_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf370dd4e	! Random illegal ?
	.word 0x99a289c3  ! 1: FDIVd	fdivd	%f10, %f34, %f12
	.word 0xa7a24833  ! 145: FADDs	fadds	%f9, %f19, %f19
debug_1_79:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_1_81:
	taddcctv %r5, 0x1350, %r17
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_1_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f18, %f16
	.word 0x93b20314  ! 149: ALIGNADDRESS	alignaddr	%r8, %r20, %r9
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x91d02035  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab852a3b  ! 153: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0a3b, %clear_softint
	.word 0xd08008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_1_83:
	taddcctv %r4, 0x1f31, %r18
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_1_84:
	setx 0xcb6f461f6e5eacf5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ae0af  ! 157: SDIVX_I	sdivx	%r11, 0x00af, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d292f  ! 158: SDIVX_I	sdivx	%r20, 0x092f, %r13
intveclr_1_87:
	setx 0x862aa4fee03f467e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902303  ! 160: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0x8d903e02  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1e02, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_1_88:
	tsubcctv %r11, 0x1d64, %r18
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_1_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0x99a01a67  ! 166: FqTOi	fqtoi	
	.word 0x9145c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r8
tagged_1_90:
	tsubcctv %r7, 0x1806, %r8
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_1_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_91:
	.word 0x8f902003  ! 169: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa3a209c7  ! 170: FDIVd	fdivd	%f8, %f38, %f48
	.word 0xd8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01968  ! 172: FqTOd	dis not found

splash_tba_1_93:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d902795  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x0795, %pstate
	.word 0x87902208  ! 175: WRPR_TT_I	wrpr	%r0, 0x0208, %tt
	.word 0x879020ec  ! 176: WRPR_TT_I	wrpr	%r0, 0x00ec, %tt
	.word 0xe8800ae0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
splash_cmpr_1_94:
	setx 0x2be0f88543d814c4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe000  ! 179: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01961  ! 180: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196d  ! 181: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01960  ! 182: FqTOd	dis not found

DS_1_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_1_99:
	setx 0x4154aee3722bcf66, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e020  ! 188: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
debug_1_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 190: FqTOd	dis not found

mondo_1_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d924012  ! 191: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
splash_decr_1_104:
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa781000a  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r10, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d903ea4  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x1ea4, %pstate
	.word 0x91d02033  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 196: WRASI_I	wr	%r0, 0x0089, %asi
mondo_1_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d920011  ! 197: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x87902163  ! 198: WRPR_TT_I	wrpr	%r0, 0x0163, %tt
memptr_1_106:
	set 0x60340000, %r31
	.word 0x8584e1d7  ! 199: WRCCR_I	wr	%r19, 0x01d7, %ccr
splash_lsu_1_107:
	setx 0xc6ac89f8a3c48f95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_108:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 201: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
debug_1_109:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0x97414000  ! 205: RDPC	rd	%pc, %r11
	.word 0x87902113  ! 206: WRPR_TT_I	wrpr	%r0, 0x0113, %tt
	.word 0x95a00573  ! 207: FSQRTq	fsqrt	
splash_lsu_1_112:
	setx 0x9ba8b5e178d46335, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00169  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802055  ! 211: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_1_113:
	setx 0x8ff9d19d28378ddc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_114)+40, 16, 16)) -> intp(1,1,3)
xir_1_114:
	.word 0xa9803761  ! 214: WR_SET_SOFTINT_I	wr	%r0, 0x1761, %set_softint
	.word 0x95a00160  ! 215: FABSq	dis not found

	.word 0x87802055  ! 216: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0x5155e928a42df4f1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_116:
	setx 0xefc91b4d81832018, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x92853104  ! 221: ADDcc_I	addcc 	%r20, 0xfffff104, %r9
	.word 0xa1902002  ! 222: WRPR_GL_I	wrpr	%r0, 0x0002, %-
pmu_1_118:
	nop
	setx 0xfffff8ebfffffef4, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 225: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
intveclr_1_120:
	setx 0xb719ca16cd45ba11, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01964  ! 227: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xa5500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x8790203b  ! 230: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
mondo_1_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d92c006  ! 231: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
splash_htba_1_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01969  ! 233: FqTOd	dis not found

	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_1_126:
	nop
	setx 0xfffff892ffffff2f, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00174  ! 236: FABSq	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x9480bb59  ! 238: ADDcc_I	addcc 	%r2, 0xfffffb59, %r10
	.word 0x87802010  ! 239: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x879021ce  ! 240: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956afa75  ! 241: SDIVX_I	sdivx	%r11, 0xfffffa75, %r10
	.word 0x91d02033  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 51
memptr_1_129:
	set user_data_start, %r31
	.word 0x85827b73  ! 243: WRCCR_I	wr	%r9, 0x1b73, %ccr
	.word 0xa1902000  ! 244: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_1_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f18, %f12, %f12
	.word 0x95b4c313  ! 245: ALIGNADDRESS	alignaddr	%r19, %r19, %r10
splash_hpstate_1_131:
	.word 0x819821c5  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
splash_lsu_1_132:
	setx 0xfe7aa04799c5353f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_1_133:
	setx 0xcbf836b7840e1433, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02033  ! 250: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802058  ! 251: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 253: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_134:
	setx 0x7d458119114dabb4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_135:
	.word 0x8f902001  ! 255: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_1_136:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_137-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_137:
	.word 0x91908003  ! 257: WRPR_PIL_R	wrpr	%r2, %r3, %pil
	.word 0x8d90273c  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x073c, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_138:
	set user_data_start, %r31
	.word 0x8584f078  ! 261: WRCCR_I	wr	%r19, 0x1078, %ccr
change_to_randtl_1_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_139:
	.word 0x8f902001  ! 262: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_1_140-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_140:
	.word 0x91920009  ! 263: WRPR_PIL_R	wrpr	%r8, %r9, %pil
cwp_1_141:
    set user_data_start, %o7
	.word 0x93902000  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_1_142:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_143:
	taddcctv %r17, 0x1c04, %r15
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91693014  ! 267: SDIVX_I	sdivx	%r4, 0xfffff014, %r8
	.word 0x99464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x8d9031dc  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x11dc, %pstate
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
	.word 0x97414000  ! 270: RDPC	rd	%pc, %r11
DS_1_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f14, %f20
	.word 0xa5b18304  ! 271: ALIGNADDRESS	alignaddr	%r6, %r4, %r18
splash_cmpr_1_147:
	setx 0xf578c18ef855ddb1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790224f  ! 273: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
pmu_1_148:
	nop
	setx 0xfffff9eefffff1d4, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_1_150:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 276: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	setx 0x17d104628a15a397, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d908001  ! 279: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_1_154:
	tsubcctv %r17, 0x16ae, %r8
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_1_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_155:
	.word 0x8f902002  ! 282: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91912387  ! 283: WRPR_PIL_I	wrpr	%r4, 0x0387, %pil
	.word 0x8d802004  ! 284: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r11
DS_1_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_1_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f0, %f8
	.word 0x97b20310  ! 287: ALIGNADDRESS	alignaddr	%r8, %r16, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_158) + 16, 16, 16)) -> intp(1,0,0)
intvec_1_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_159:
	.word 0x93a189d3  ! 1: FDIVd	fdivd	%f6, %f50, %f40
	.word 0xe7330006  ! 1: STQF_R	-	%f19, [%r6, %r12]
	normalw
	.word 0x91458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r8
debug_1_160:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_1_162:
	setx 0x8813d03edcd4ce8b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_1_163:
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa784c00d  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r13, %-
	.word 0xa190200e  ! 294: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa46d202a  ! 295: UDIVX_I	udivx 	%r20, 0x002a, %r18
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_1_164:
    set user_data_start, %o7
	.word 0x93902001  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802083  ! 298: WRASI_I	wr	%r0, 0x0083, %asi
	setx 0x3d01af562b425cf2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_1_166:
	tsubcctv %r7, 0x1fae, %r23
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_1_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa1a08829  ! 301: FADDs	fadds	%f2, %f9, %f16
	.word 0x93464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_1_168:
	setx 0x4905b7b1d33066a5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_169:
	setx 0x06ecbc253dc05a19, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_170:
	setx 0xfaefbaead8d97b49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_171:
	setx 0xdef2b0932bb2cfe2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_172:
	.word 0x95a0c9d0  ! 1: FDIVd	fdivd	%f34, %f16, %f10
	.word 0x91700a95	! Random illegal ?
	.word 0x97a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x91a44829  ! 309: FADDs	fadds	%f17, %f9, %f8
splash_lsu_1_173:
	setx 0xd20469fbb974f8b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e02  ! 311: SIR	sir	0x1e02
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 312: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99683c02  ! 313: SDIVX_I	sdivx	%r0, 0xfffffc02, %r12
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0xa5540000  ! 315: RDPR_GL	<illegal instruction>
splash_hpstate_1_176:
	.word 0x81982bc4  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 317: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_177:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0x9b414000  ! 320: RDPC	rd	%pc, %r13
splash_tba_1_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_180:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_1_181:
	.word 0x81982d8c  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
splash_cmpr_1_182:
	setx 0x9a74741254e8d22d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_183:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 325: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 326: FqTOd	dis not found

	.word 0x87802058  ! 327: WRASI_I	wr	%r0, 0x0058, %asi
cwp_1_185:
    set user_data_start, %o7
	.word 0x93902005  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 329: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_1_187:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_188:
	setx 0x795fbd98f02e80f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902297  ! 333: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0xa982c001  ! 334: WR_SET_SOFTINT_R	wr	%r11, %r1, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_1_189:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_1_190:
    set user_data_start, %o7
	.word 0x93902007  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_1_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f40
	.word 0x93a14824  ! 338: FADDs	fadds	%f5, %f4, %f9
	.word 0xa5520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_1_192:
	nop
	setx 0xfffff883fffff99a, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d903439  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x1439, %pstate
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
	.word 0x95414000  ! 344: RDPC	rd	%pc, %r10
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802004  ! 346: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_1_196:
	setx 0xaee257ffd6dafe6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_197:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 353: RDPC	rd	%pc, %r11
	.word 0x879020b6  ! 354: WRPR_TT_I	wrpr	%r0, 0x00b6, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01966  ! 355: FqTOd	dis not found

	.word 0xd2d80e80  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x74, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_199:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 357: RDPC	rd	%pc, %r9
memptr_1_200:
	set 0x60740000, %r31
	.word 0x8584a093  ! 358: WRCCR_I	wr	%r18, 0x0093, %ccr
	rd %pc, %r19
	add %r19, (ivw_1_201-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_201:
	.word 0x9195000a  ! 359: WRPR_PIL_R	wrpr	%r20, %r10, %pil
DS_1_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x91d02035  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_1_203:
	setx 0xdcdda2f6fdb7165a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802088  ! 364: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_1_204:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 366: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
cwp_1_205:
    set user_data_start, %o7
	.word 0x93902003  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd8c7e020  ! 368: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_206) + 56, 16, 16)) -> intp(2,0,29)
intvec_1_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_207:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 370: RDPC	rd	%pc, %r19
tagged_1_208:
	tsubcctv %r16, 0x156f, %r16
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_1_209:
	setx 0xceacdb49807c50a0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09004a0  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0xe097e020  ! 374: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
debug_1_210:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 375: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c004a0  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x91a00173  ! 378: FABSq	dis not found

DS_1_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5320011  ! 1: STQF_R	-	%f10, [%r17, %r8]
	normalw
	.word 0x9b458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xab81400a  ! 380: WR_CLEAR_SOFTINT_R	wr	%r5, %r10, %clear_softint
memptr_1_212:
	set 0x60340000, %r31
	.word 0x8584a64a  ! 381: WRCCR_I	wr	%r18, 0x064a, %ccr
	.word 0x87802088  ! 382: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x91d020b3  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 179
	rd %pc, %r19
	add %r19, (ivw_1_213-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_213:
	.word 0x9194c010  ! 385: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_1_214:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968b0f8  ! 388: SDIVX_I	sdivx	%r2, 0xfffff0f8, %r20
memptr_1_216:
	set user_data_start, %r31
	.word 0x85813811  ! 389: WRCCR_I	wr	%r4, 0x1811, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x879021a2  ! 391: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
splash_cmpr_1_217:
	setx 0xc69d3009a4a092fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_1_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01964  ! 394: FqTOd	dis not found

	.word 0x9194f9e6  ! 395: WRPR_PIL_I	wrpr	%r19, 0x19e6, %pil
donret_1_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_220-donret_1_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa190200c  ! 397: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa980c012  ! 398: WR_SET_SOFTINT_R	wr	%r3, %r18, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_1_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01960  ! 401: FqTOd	dis not found

cwp_1_223:
    set user_data_start, %o7
	.word 0x93902003  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 404: WRPR_GL_I	wrpr	%r0, 0x0000, %-
intveclr_1_224:
	setx 0x389baea120f9d471, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa06d376a  ! 406: UDIVX_I	udivx 	%r20, 0xfffff76a, %r16
	.word 0xa1902004  ! 407: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_1_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01969  ! 409: FqTOd	dis not found

	.word 0x956a8006  ! 410: SDIVX_R	sdivx	%r10, %r6, %r10
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0x97a249d2  ! 412: FDIVd	fdivd	%f40, %f18, %f42
DS_1_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_228)+16, 16, 16)) -> intp(1,1,3)
xir_1_228:
	.word 0xa984f271  ! 414: WR_SET_SOFTINT_I	wr	%r19, 0x1271, %set_softint
	.word 0x9550c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xe4e6b2a876dd21ac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00173  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_230) + 40, 16, 16)) -> intp(0,0,30)
intvec_1_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_1_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_231-donret_1_231), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c804a0  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_232:
	setx 0x588322ef589e4439, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_233:
    set user_data_start, %o7
	.word 0x93902000  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_234)+40, 16, 16)) -> intp(1,1,3)
xir_1_234:
	.word 0xa9802e2b  ! 428: WR_SET_SOFTINT_I	wr	%r0, 0x0e2b, %set_softint
memptr_1_235:
	set 0x60540000, %r31
	.word 0x85833ac4  ! 429: WRCCR_I	wr	%r12, 0x1ac4, %ccr
splash_cmpr_1_236:
	setx 0x3b44223048b2ce03, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0xa7520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_1_237:
	setx 0xd4b66366cea5fb98, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020bc  ! 434: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
intveclr_1_238:
	setx 0xbbaf16f8daf6e143, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c00e60  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r19
change_to_randtl_1_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_239:
	.word 0x8f902003  ! 437: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_1_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_240:
	.word 0x8f902001  ! 438: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_241:
	setx 0xc7004034b51c7365, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902f94  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x0f94, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_1_242:
	setx 0xc123caa1d2714bf6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_1_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_1_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d900007  ! 447: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0x87802088  ! 448: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b29cc  ! 449: SDIVX_I	sdivx	%r12, 0x09cc, %r16
splash_cmpr_1_246:
	setx 0xfbdc43dd1f33c7d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_247:
	.word 0x8f902001  ! 451: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_1_248:
	tsubcctv %r1, 0x1f7f, %r2
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ae91d  ! 453: SDIVX_I	sdivx	%r11, 0x091d, %r16
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_1_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_250:
	.word 0x8f902001  ! 455: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_1_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 457: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802083  ! 458: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xa190200c  ! 459: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_1_252:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 460: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa78378c3  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r13, 0x18c3, %-
	.word 0x9550c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_1_253:
	setx 0x2509ad0647bf5724, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_254) + 40, 16, 16)) -> intp(0,0,27)
intvec_1_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa9414000  ! 465: RDPC	rd	%pc, %r20
splash_lsu_1_256:
	setx 0x75e40ce7c4be6a7f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d950006  ! 467: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
splash_lsu_1_258:
	setx 0xbc8c9d4972f691f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_259:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x91b04ff1  ! 471: FONES	e	%f8
debug_1_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab8461d2  ! 473: WR_CLEAR_SOFTINT_I	wr	%r17, 0x01d2, %clear_softint
mondo_1_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 474: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
DS_1_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f20, %f22
	.word 0xa5b3430a  ! 475: ALIGNADDRESS	alignaddr	%r13, %r10, %r18
debug_1_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_1_264:
	tsubcctv %r5, 0x1b47, %r21
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa284f336  ! 478: ADDcc_I	addcc 	%r19, 0xfffff336, %r17
splash_cmpr_1_265:
	setx 0x10acdee1ad92f792, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902004  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_1_267:
	setx 0x2c8da9e040021d7c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_268) + 48, 16, 16)) -> intp(7,0,9)
intvec_1_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_269:
	.word 0x8f902000  ! 484: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 485: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_1_270:
	set user_data_start, %r31
	.word 0x8582aebe  ! 486: WRCCR_I	wr	%r10, 0x0ebe, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_271:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 487: RDPC	rd	%pc, %r9
	.word 0xa2690009  ! 488: UDIVX_R	udivx 	%r4, %r9, %r17
	.word 0xa1902008  ! 489: WRPR_GL_I	wrpr	%r0, 0x0008, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 490: RDPC	rd	%pc, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94fc0011  ! 493: SDIVcc_R	sdivcc 	%r16, %r17, %r10
	.word 0x8d902dce  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x0dce, %pstate
mondo_1_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d90000d  ! 495: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
	.word 0x9ba509aa  ! 496: FDIVs	fdivs	%f20, %f10, %f13
	.word 0xa1902007  ! 497: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902304  ! 498: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
mondo_0_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d900011  ! 1: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
tagged_0_1:
	taddcctv %r12, 0x1806, %r25
	.word 0xd007e373  ! 2: LDUW_I	lduw	[%r31 + 0x0373], %r8
	.word 0x90ad0003  ! 3: ANDNcc_R	andncc 	%r20, %r3, %r8
splash_cmpr_0_2:
	setx 0xc57885bb7e8de248, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
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
wait_for_debug_0_3:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_3
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 5: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_cmpr_0_4:
	setx 0x539ea1d7041eccbe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 6: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3a800001  ! 7: BCC	bcc,a	<label_0x1>
	.word 0xa190200d  ! 8: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9945c000  ! 9: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01965  ! 10: FqTOd	dis not found

DS_0_6:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xdb37c000  ! 12: STQF_R	-	%f13, [%r0, %r31]
	.word 0xdac7e020  ! 13: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xa5454000  ! 14: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
intveclr_0_7:
	setx 0xf7606a1015558c89, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 15: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad816ed8  ! 16: WR_SOFTINT_REG_I	wr	%r5, 0x0ed8, %softint
debug_0_8:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 17: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_9:
	taddcctv %r5, 0x12da, %r20
	.word 0xe407eed8  ! 18: LDUW_I	lduw	[%r31 + 0x0ed8], %r18
	.word 0x91d02033  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_0_10:
	setx 0xba23f90f06ecc9a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_11:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 21: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cmp_0_12:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_12:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_12
    nop
cmp_wait0_12:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_12
    nop
    ba,a cmp_startwait0_12
continue_cmp_0_12:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x8c, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950005  ! 22: WRPR_PIL_R	wrpr	%r20, %r5, %pil
splash_tba_0_13:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_14
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_14:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e005  ! 24: CASA_R	casa	[%r31] %asi, %r5, %r18
	.word 0xa190200c  ! 25: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_0_15:
	setx 0xd4d7f340d27492ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 26: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab826113  ! 27: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0113, %clear_softint
splash_tba_0_16:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a2c9ed  ! 29: FDIVq	dis not found

	.word 0x32800001  ! 30: BNE	bne,a	<label_0x1>
	.word 0x87902111  ! 31: WRPR_TT_I	wrpr	%r0, 0x0111, %tt
	.word 0x8d902c2d  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x0c2d, %pstate
splash_hpstate_0_17:
	.word 0x819821de  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01de, %hpstate
	.word 0xa3a00173  ! 34: FABSq	dis not found

splash_tba_0_18:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 35: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_0_19:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 36: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x24700001  ! 37: BPLE	<illegal instruction>
splash_hpstate_0_20:
	.word 0x8198281d  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	.word 0xe26fe113  ! 39: LDSTUB_I	ldstub	%r17, [%r31 + 0x0113]
splash_hpstate_0_21:
	.word 0x81982d14  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d14, %hpstate
	.word 0xa190200b  ! 41: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d90360e  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x160e, %pstate
	.word 0x99902003  ! 43: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa190200a  ! 44: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x97520000  ! 45: RDPR_PIL	<illegal instruction>
	.word 0xd6ffc033  ! 46: SWAPA_R	swapa	%r11, [%r31 + %r19] 0x01
	.word 0xd68008a0  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_0_22:
	.word 0x81982c4c  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
splash_decr_0_23:
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7800009  ! 49: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r9, %-
DS_0_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb14307  ! 50: ALIGNADDRESS	alignaddr	%r5, %r7, %r13
	.word 0x34800001  ! 51: BG	bg,a	<label_0x1>
debug_0_25:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01961  ! 53: FqTOd	dis not found

splash_cmpr_0_27:
	setx 0x1f258047cf4cf9b5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 54: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_28:
	.word 0x8f902002  ! 55: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_0_29:
	set 0x60340000, %r31
	.word 0x8582bbab  ! 56: WRCCR_I	wr	%r10, 0x1bab, %ccr
	.word 0x98d1a31e  ! 57: UMULcc_I	umulcc 	%r6, 0x031e, %r12
	.word 0x99454000  ! 58: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xd8d80e60  ! 59: LDXA_R	ldxa	[%r0, %r0] 0x73, %r12
	.word 0xd88008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
DS_0_30:
	.word 0xa9a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f20
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90370e  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x170e, %pstate
intveclr_0_31:
	setx 0x1f31993cf436a54a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d92c003  ! 67: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	.word 0x9f8030f3  ! 68: SIR	sir	0x10f3
	.word 0xa1902008  ! 69: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_0_33:
	setx 0x36cc90068a9c0ba9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x32700001  ! 71: BPNE	<illegal instruction>
splash_cmpr_0_34:
	setx 0x96c72e8fa3f7822a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_35:
	.word 0x819827df  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0xe877c000  ! 74: STX_R	stx	%r20, [%r31 + %r0]
debug_0_36:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_36:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_36
    nop
debug_wait0_36:
    ld [%r23], %r2
    brnz %r2, debug_wait0_36
    nop
    ba,a debug_startwait0_36
continue_debug_0_36:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_36:
    cmp %r13, %r15
    bne,a wait_for_stat_0_36
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_36:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_36
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
mondo_0_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d928004  ! 76: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
	.word 0xe88008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
debug_0_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 78: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 79: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903ae7  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x1ae7, %pstate
	.word 0xe86ff0f3  ! 81: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff0f3]
	.word 0x93d020b5  ! 82: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x87802055  ! 83: WRASI_I	wr	%r0, 0x0055, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r20
memptr_0_39:
	set user_data_start, %r31
	.word 0x85827df5  ! 85: WRCCR_I	wr	%r9, 0x1df5, %ccr
splash_tba_0_40:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_41:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 88: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_42:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_42:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_42
    nop
debug_wait0_42:
    ld [%r23], %r2
    brnz %r2, debug_wait0_42
    nop
    ba,a debug_startwait0_42
continue_debug_0_42:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_42:
    cmp %r13, %r15
    bne,a wait_for_stat_0_42
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_42:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_42
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 89: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x2c800001  ! 90: BNEG	bneg,a	<label_0x1>
change_to_randtl_0_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_43:
	.word 0x8f902001  ! 91: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902005  ! 92: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902da3  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0da3, %pstate
mondo_0_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94800b  ! 94: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0xab843f6c  ! 95: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1f6c, %clear_softint
DS_0_45:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 96: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
pmu_0_46:
	nop
	setx 0xfffff594fffff59f, %g1, %g7
	.word 0xa3800007  ! 97: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_0_47:
    set user_data_start, %o7
	.word 0x93902006  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_0_48:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_48:
	.word 0x8f902000  ! 99: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_49:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 100: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_lsu_0_50:
	setx 0x6b7377570d677081, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c804a0  ! 102: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
splash_hpstate_0_51:
	.word 0x81982855  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0855, %hpstate
debug_0_52:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 104: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_53
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 105: RDPC	rd	%pc, %r18
	.word 0xe457c000  ! 106: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xa1902001  ! 107: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x32800001  ! 108: BNE	bne,a	<label_0x1>
	.word 0xa1500000  ! 109: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_54) + 48, 16, 16)) -> intp(5,0,4)
intvec_0_54:
	.word 0x39400001  ! 110: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 111: WRPR_GL_I	wrpr	%r0, 0x0006, %-
cwp_0_55:
    set user_data_start, %o7
	.word 0x93902002  ! 112: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_0_56:
	setx 0x351146b55d6d98cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 113: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_57:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_57:
	.word 0x8f902003  ! 114: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_0_58:
	setx 0xd40acf64f7f599fc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 115: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 116: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_0_60:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_0_61:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 118: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_0_62:
	nop
	setx 0xfffff06ffffff62e, %g1, %g7
	.word 0xa3800007  ! 119: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_0_63:
    set user_data_start, %o7
	.word 0x93902001  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902f3b  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x0f3b, %pstate
mondo_0_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 122: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
debug_0_65:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 123: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cb093  ! 124: SDIVX_I	sdivx	%r18, 0xfffff093, %r10
	.word 0x8790200d  ! 125: WRPR_TT_I	wrpr	%r0, 0x000d, %tt
	.word 0x9153c000  ! 126: RDPR_FQ	<illegal instruction>
	.word 0x91a4c9d2  ! 127: FDIVd	fdivd	%f50, %f18, %f8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16caaf9  ! 128: SDIVX_I	sdivx	%r18, 0x0af9, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01960  ! 129: FqTOd	dis not found

	.word 0x95a44dc1  ! 130: FdMULq	fdmulq	
cwp_0_69:
    set user_data_start, %o7
	.word 0x93902003  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x34800001  ! 132: BG	bg,a	<label_0x1>
debug_0_70:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 133: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_0_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d92000d  ! 135: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
debug_0_73:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790202a  ! 137: WRPR_TT_I	wrpr	%r0, 0x002a, %tt
	.word 0xd5e7c02d  ! 138: CASA_I	casa	[%r31] 0x 1, %r13, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_0_74:
	setx 0xdd9e578b7f3f896a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902abe  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0abe, %pstate
tagged_0_75:
	taddcctv %r11, 0x132e, %r9
	.word 0xd407eaf9  ! 142: LDUW_I	lduw	[%r31 + 0x0af9], %r10
splash_htba_0_76:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_0_77:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 144: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_0_78:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xfd711128	! Random illegal ?
	.word 0x9ba089c6  ! 1: FDIVd	fdivd	%f2, %f6, %f44
	.word 0x9ba1c833  ! 145: FADDs	fadds	%f7, %f19, %f13
debug_0_79:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
tagged_0_81:
	taddcctv %r12, 0x1931, %r11
	.word 0xda07eaf9  ! 148: LDUW_I	lduw	[%r31 + 0x0af9], %r13
DS_0_82:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f28, %f30
	.word 0x91b30306  ! 149: ALIGNADDRESS	alignaddr	%r12, %r6, %r8
	.word 0xd09feaf9  ! 150: LDDA_I	ldda	[%r31, + 0x0af9] %asi, %r8
	.word 0x93d02034  ! 151: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd0d004a0  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xab84fae8  ! 153: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1ae8, %clear_softint
	.word 0xd08008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
tagged_0_83:
	taddcctv %r21, 0x15cf, %r13
	.word 0xd007fae8  ! 155: LDUW_I	lduw	[%r31 + 0xfffffae8], %r8
splash_cmpr_0_84:
	setx 0x125a234cc76f5244, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9768b822  ! 157: SDIVX_I	sdivx	%r2, 0xfffff822, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169e9a0  ! 158: SDIVX_I	sdivx	%r7, 0x09a0, %r8
intveclr_0_87:
	setx 0xb59827bff7bddb9c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902398  ! 160: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0x8d9038f1  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x18f1, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r8
tagged_0_88:
	tsubcctv %r18, 0x1bba, %r20
	.word 0xd007e9a0  ! 163: LDUW_I	lduw	[%r31 + 0x09a0], %r8
debug_0_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd06fe9a0  ! 165: LDSTUB_I	ldstub	%r8, [%r31 + 0x09a0]
	.word 0xa9a01a71  ! 166: FqTOi	fqtoi	
	.word 0xa545c000  ! 167: RD_TICK_CMPR_REG	rd	%-, %r18
tagged_0_90:
	tsubcctv %r6, 0x1619, %r25
	.word 0xe407e9a0  ! 168: LDUW_I	lduw	[%r31 + 0x09a0], %r18
change_to_randtl_0_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_91:
	.word 0x8f902000  ! 169: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99a209d3  ! 170: FDIVd	fdivd	%f8, %f50, %f12
	.word 0xd8c804a0  ! 171: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01965  ! 172: FqTOd	dis not found

splash_tba_0_93:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8d90232f  ! 174: WRPR_PSTATE_I	wrpr	%r0, 0x032f, %pstate
	.word 0x879023f1  ! 175: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0x8790239e  ! 176: WRPR_TT_I	wrpr	%r0, 0x039e, %tt
	.word 0xe8800b80  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r20
splash_cmpr_0_94:
	setx 0xdd4502c913b584bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 178: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88fe010  ! 179: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01967  ! 180: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01962  ! 181: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01962  ! 182: FqTOd	dis not found

DS_0_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_0_99:
	setx 0x9ffde72e351b1d1c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 184: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91520000  ! 186: RDPR_PIL	<illegal instruction>
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
	.word 0xd1e7e002  ! 187: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xd097e000  ! 188: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
debug_0_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 189: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01968  ! 190: FqTOd	dis not found

mondo_0_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d90400d  ! 191: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
splash_decr_0_104:
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7828004  ! 192: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r4, %-
	.word 0x32700001  ! 193: BPNE	<illegal instruction>
	.word 0x8d902b3f  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0b3f, %pstate
	.word 0x83d020b3  ! 195: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x87802088  ! 196: WRASI_I	wr	%r0, 0x0088, %asi
mondo_0_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d910003  ! 197: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
	.word 0x8790214a  ! 198: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
memptr_0_106:
	set 0x60740000, %r31
	.word 0x85837ff2  ! 199: WRCCR_I	wr	%r13, 0x1ff2, %ccr
splash_lsu_0_107:
	setx 0xac925c8702dd6443, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_108:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_108:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_108
    nop
debug_wait0_108:
    ld [%r23], %r2
    brnz %r2, debug_wait0_108
    nop
    ba,a debug_startwait0_108
continue_debug_0_108:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_108:
    cmp %r13, %r15
    bne,a wait_for_stat_0_108
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_108:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_108
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 201: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
debug_0_109:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_110:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 203: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe337c000  ! 204: STQF_R	-	%f17, [%r0, %r31]
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
	.word 0xa5414000  ! 205: RDPC	rd	%pc, %r18
	.word 0x879021c5  ! 206: WRPR_TT_I	wrpr	%r0, 0x01c5, %tt
	.word 0x91a00565  ! 207: FSQRTq	fsqrt	
splash_lsu_0_112:
	setx 0xb6564f622f2e038d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a00161  ! 209: FABSq	dis not found

	.word 0x3a800001  ! 210: BCC	bcc,a	<label_0x1>
	.word 0x87802004  ! 211: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_113:
	setx 0xc7a1de82cb6d9849, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277fff2  ! 213: STX_I	stx	%r9, [%r31 + 0xfffffff2]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_114)+0, 16, 16)) -> intp(0,1,3)
xir_0_114:
	.word 0xa982eb65  ! 214: WR_SET_SOFTINT_I	wr	%r11, 0x0b65, %set_softint
	.word 0x91a00173  ! 215: FABSq	dis not found

	.word 0x8780204f  ! 216: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x34800001  ! 217: BG	bg,a	<label_0x1>
	setx 0x54a68de70d655340, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_115:
	.word 0x39400001  ! 218: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_116:
	setx 0x3b1744ac34069a68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_117
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_117:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0xa2802059  ! 221: ADDcc_I	addcc 	%r0, 0x0059, %r17
	.word 0xa1902009  ! 222: WRPR_GL_I	wrpr	%r0, 0x0009, %-
pmu_0_118:
	nop
	setx 0xfffff699fffff64f, %g1, %g7
	.word 0xa3800007  ! 223: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 225: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
intveclr_0_120:
	setx 0x3365aa259b2ebf1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01972  ! 227: FqTOd	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_122:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 228: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x91500000  ! 229: RDPR_TPC	<illegal instruction>
	.word 0x8790221b  ! 230: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
mondo_0_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d91c001  ! 231: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
splash_htba_0_124:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196c  ! 233: FqTOd	dis not found

	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 234: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_0_126:
	nop
	setx 0xfffff547fffff598, %g1, %g7
	.word 0xa3800007  ! 235: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00162  ! 236: FABSq	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_127:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 237: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x98852738  ! 238: ADDcc_I	addcc 	%r20, 0x0738, %r12
	.word 0x8780204f  ! 239: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87902156  ! 240: WRPR_TT_I	wrpr	%r0, 0x0156, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cbf23  ! 241: SDIVX_I	sdivx	%r18, 0xffffff23, %r18
	.word 0x91d02034  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_0_129:
	set user_data_start, %r31
	.word 0x858277a2  ! 243: WRCCR_I	wr	%r9, 0x17a2, %ccr
	.word 0xa1902004  ! 244: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_0_130:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f18, %f22
	.word 0x93b08305  ! 245: ALIGNADDRESS	alignaddr	%r2, %r5, %r9
splash_hpstate_0_131:
	.word 0x81982f44  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
splash_lsu_0_132:
	setx 0x9d217e45912b05c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 248: BPGU	<illegal instruction>
splash_cmpr_0_133:
	setx 0xf2fccf1e3dfede3b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 251: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd29ff7a2  ! 252: LDDA_I	ldda	[%r31, + 0xfffff7a2] %asi, %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_134:
	setx 0x97c88a1c4437254b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 254: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_135:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_135:
	.word 0x8f902002  ! 255: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_0_136:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_137:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_137:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_137
    nop
cmp_wait0_137:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_137
    nop
    ba,a cmp_startwait0_137
continue_cmp_0_137:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbe, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c013  ! 257: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0x8d902608  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x0608, %pstate
	.word 0xd28008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 260: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_0_138:
	set user_data_start, %r31
	.word 0x8584a32e  ! 261: WRCCR_I	wr	%r18, 0x032e, %ccr
change_to_randtl_0_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_139:
	.word 0x8f902003  ! 262: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
cmp_0_140:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_140:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_140
    nop
cmp_wait0_140:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_140
    nop
    ba,a cmp_startwait0_140
continue_cmp_0_140:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190c012  ! 263: WRPR_PIL_R	wrpr	%r3, %r18, %pil
cwp_0_141:
    set user_data_start, %o7
	.word 0x93902000  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_142:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 265: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_143:
	taddcctv %r8, 0x160a, %r2
	.word 0xd207e32e  ! 266: LDUW_I	lduw	[%r31 + 0x032e], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b6100  ! 267: SDIVX_I	sdivx	%r13, 0x0100, %r9
	.word 0xa5464000  ! 268: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x8d903dd7  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x1dd7, %pstate
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
	.word 0xa1414000  ! 270: RDPC	rd	%pc, %r16
DS_0_146:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f6, %f26
	.word 0x99b44309  ! 271: ALIGNADDRESS	alignaddr	%r17, %r9, %r12
splash_cmpr_0_147:
	setx 0xe79cb19936684a1e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022b5  ! 273: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
pmu_0_148:
	nop
	setx 0xfffff15bfffff050, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_149
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_149:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 275: CASA_R	casa	[%r31] %asi, %r9, %r12
debug_0_150:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_150:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_150
    nop
debug_wait0_150:
    ld [%r23], %r2
    brnz %r2, debug_wait0_150
    nop
    ba,a debug_startwait0_150
continue_debug_0_150:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_150:
    cmp %r13, %r15
    bne,a wait_for_stat_0_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_150:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_150
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 276: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	setx 0xf0d2b71d0aa2b2bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_151:
	.word 0x39400001  ! 277: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 278: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_0_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944012  ! 279: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xd80fc000  ! 280: LDUB_R	ldub	[%r31 + %r0], %r12
tagged_0_154:
	tsubcctv %r25, 0x1617, %r26
	.word 0xd807e100  ! 281: LDUW_I	lduw	[%r31 + 0x0100], %r12
change_to_randtl_0_155:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_155:
	.word 0x8f902001  ! 282: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9194f84a  ! 283: WRPR_PIL_I	wrpr	%r19, 0x184a, %pil
	.word 0x8d802000  ! 284: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95464000  ! 285: RD_STICK_CMPR_REG	rd	%-, %r10
DS_0_156:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
DS_0_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f24, %f0
	.word 0xa7b0c302  ! 287: ALIGNADDRESS	alignaddr	%r3, %r2, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_158) + 8, 16, 16)) -> intp(2,0,11)
intvec_0_158:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_159:
	.word 0xa3a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f48
	.word 0xd332800b  ! 1: STQF_R	-	%f9, [%r11, %r10]
	normalw
	.word 0x99458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r12
debug_0_160:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_161:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 291: SAVE_R	save	%r31, %r0, %r31
intveclr_0_162:
	setx 0x814d414ceefadb09, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_0_163:
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa782400c  ! 293: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r12, %-
	.word 0xa190200c  ! 294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x966ced56  ! 295: UDIVX_I	udivx 	%r19, 0x0d56, %r11
	.word 0xd647ed56  ! 296: LDSW_I	ldsw	[%r31 + 0x0d56], %r11
cwp_0_164:
    set user_data_start, %o7
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802010  ! 298: WRASI_I	wr	%r0, 0x0010, %asi
	setx 0xe122f44174cb4eea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_165:
	.word 0x39400001  ! 299: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_166:
	tsubcctv %r17, 0x125a, %r14
	.word 0xd607ed56  ! 300: LDUW_I	lduw	[%r31 + 0x0d56], %r11
DS_0_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0x97a34827  ! 301: FADDs	fadds	%f13, %f7, %f11
	.word 0x95464000  ! 302: RD_STICK_CMPR_REG	rd	%-, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd537ed56  ! 304: STQF_I	-	%f10, [0x0d56, %r31]
splash_cmpr_0_168:
	setx 0x743050762483b78d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 305: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_169:
	setx 0xa7bd3fb867ec5b7e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_170:
	setx 0xb361d48ae2fffbf9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_171:
	setx 0x69d3a3f027c9eca5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 308: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_172:
	.word 0xa3a1c9cc  ! 1: FDIVd	fdivd	%f38, %f12, %f48
	.word 0xc77bcc9c	! Random illegal ?
	.word 0xa5a00543  ! 1: FSQRTd	fsqrt	
	.word 0xa5a4c820  ! 309: FADDs	fadds	%f19, %f0, %f18
splash_lsu_0_173:
	setx 0x1ff277cec2347209, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f8021a3  ! 311: SIR	sir	0x01a3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 312: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cf7ab  ! 313: SDIVX_I	sdivx	%r19, 0xfffff7ab, %r9
	.word 0xd327f7ab  ! 314: STF_I	st	%f9, [0x17ab, %r31]
	.word 0xa1540000  ! 315: RDPR_GL	<illegal instruction>
splash_hpstate_0_176:
	.word 0x81982585  ! 316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_177:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 319: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
	.word 0xa1414000  ! 320: RDPC	rd	%pc, %r16
splash_tba_0_179:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 321: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_0_180:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 322: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_0_181:
	.word 0x81982c87  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
splash_cmpr_0_182:
	setx 0x317629e6a2a6d876, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_183:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_183:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_183
    nop
debug_wait0_183:
    ld [%r23], %r2
    brnz %r2, debug_wait0_183
    nop
    ba,a debug_startwait0_183
continue_debug_0_183:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_183:
    cmp %r13, %r15
    bne,a wait_for_stat_0_183
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_183:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_183
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 325: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 326: FqTOd	dis not found

	.word 0x87802004  ! 327: WRASI_I	wr	%r0, 0x0004, %asi
cwp_0_185:
    set user_data_start, %o7
	.word 0x93902000  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 329: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_186:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e007  ! 330: CASA_R	casa	[%r31] %asi, %r7, %r13
debug_0_187:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 331: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_188:
	setx 0x8c2738de4ad83e4d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902254  ! 333: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0xa984c00c  ! 334: WR_SET_SOFTINT_R	wr	%r19, %r12, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_0_189:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 336: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_0_190:
    set user_data_start, %o7
	.word 0x93902001  ! 337: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a2c9c5  ! 1: FDIVd	fdivd	%f42, %f36, %f40
	.word 0x95a24829  ! 338: FADDs	fadds	%f9, %f9, %f10
	.word 0xa9520000  ! 339: RDPR_PIL	<illegal instruction>
	.word 0xe81ff7ab  ! 340: LDD_I	ldd	[%r31 + 0xfffff7ab], %r20
	.word 0xe83ff7ab  ! 341: STD_I	std	%r20, [%r31 + 0xfffff7ab]
pmu_0_192:
	nop
	setx 0xfffff7bdfffff808, %g1, %g7
	.word 0xa3800007  ! 342: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902e6b  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x0e6b, %pstate
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
	.word 0xa7414000  ! 344: RDPC	rd	%pc, %r19
	.word 0x81510000  ! 345: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802004  ! 346: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 347: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_194:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 348: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01964  ! 349: FqTOd	dis not found

	.word 0xe6c804a0  ! 350: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_0_196:
	setx 0x9e1009299a655e5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 352: BGE	bge,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_197
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_197:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 353: RDPC	rd	%pc, %r20
	.word 0x87902241  ! 354: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 355: FqTOd	dis not found

	.word 0xd2d80e40  ! 356: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_199
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_199:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 357: RDPC	rd	%pc, %r12
memptr_0_200:
	set 0x60740000, %r31
	.word 0x8582e9c2  ! 358: WRCCR_I	wr	%r11, 0x09c2, %ccr
cmp_0_201:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_201:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_201
    nop
cmp_wait0_201:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_201
    nop
    ba,a cmp_startwait0_201
continue_cmp_0_201:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x9e, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948013  ! 359: WRPR_PIL_R	wrpr	%r18, %r19, %pil
DS_0_202:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 360: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91d02034  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_203:
	setx 0xaf806aaab918b99a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd83fe9c2  ! 363: STD_I	std	%r12, [%r31 + 0x09c2]
	.word 0x87802080  ! 364: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
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
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 366: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
cwp_0_205:
    set user_data_start, %o7
	.word 0x93902004  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd8c7e010  ! 368: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_206) + 24, 16, 16)) -> intp(4,0,22)
intvec_0_206:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_207
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_207:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 370: RDPC	rd	%pc, %r16
tagged_0_208:
	tsubcctv %r2, 0x13f7, %r10
	.word 0xe007e9c2  ! 371: LDUW_I	lduw	[%r31 + 0x09c2], %r16
splash_cmpr_0_209:
	setx 0x619366f0409d7730, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 372: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0900e40  ! 373: LDUHA_R	lduha	[%r0, %r0] 0x72, %r16
	.word 0xe097e000  ! 374: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
debug_0_210:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_210:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_210
    nop
debug_wait0_210:
    ld [%r23], %r2
    brnz %r2, debug_wait0_210
    nop
    ba,a debug_startwait0_210
continue_debug_0_210:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_210:
    cmp %r13, %r15
    bne,a wait_for_stat_0_210
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_210:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_210
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 375: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xe077e9c2  ! 376: STX_I	stx	%r16, [%r31 + 0x09c2]
	.word 0xe0c00e60  ! 377: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
	.word 0xa7a0016b  ! 378: FABSq	dis not found

DS_0_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb300014  ! 1: STQF_R	-	%f13, [%r20, %r0]
	normalw
	.word 0xa7458000  ! 379: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xab82c004  ! 380: WR_CLEAR_SOFTINT_R	wr	%r11, %r4, %clear_softint
memptr_0_212:
	set 0x60540000, %r31
	.word 0x858224d4  ! 381: WRCCR_I	wr	%r8, 0x04d4, %ccr
	.word 0x87802004  ! 382: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe65fe4d4  ! 383: LDX_I	ldx	[%r31 + 0x04d4], %r19
	.word 0x93d020b3  ! 384: Tcc_I	tne	icc_or_xcc, %r0 + 179
cmp_0_213:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_213:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_213
    nop
cmp_wait0_213:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_213
    nop
    ba,a cmp_startwait0_213
continue_cmp_0_213:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 4, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c00c  ! 385: WRPR_PIL_R	wrpr	%r19, %r12, %pil
	.word 0x81510000  ! 386: RDPR_TICK	rdpr	%tick, %r0
debug_0_214:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 387: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68f4a9  ! 388: SDIVX_I	sdivx	%r3, 0xfffff4a9, %r13
memptr_0_216:
	set user_data_start, %r31
	.word 0x85837d7f  ! 389: WRCCR_I	wr	%r13, 0x1d7f, %ccr
	.word 0x30800001  ! 390: BA	ba,a	<label_0x1>
	.word 0x87902010  ! 391: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
splash_cmpr_0_217:
	setx 0x90acb37e8ae5464e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_0_218:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 393: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01968  ! 394: FqTOd	dis not found

	.word 0x9194bc7d  ! 395: WRPR_PIL_I	wrpr	%r18, 0x1c7d, %pil
donret_0_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_220-donret_0_220), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_220:
	.word 0xdafffc7d  ! 396: SWAPA_I	swapa	%r13, [%r31 + 0xfffffc7d] %asi
	.word 0xa1902002  ! 397: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa9840004  ! 398: WR_SET_SOFTINT_R	wr	%r16, %r4, %set_softint
	.word 0xda4ffc7d  ! 399: LDSB_I	ldsb	[%r31 + 0xfffffc7d], %r13
splash_htba_0_221:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 400: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01974  ! 401: FqTOd	dis not found

cwp_0_223:
    set user_data_start, %o7
	.word 0x93902005  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 404: WRPR_GL_I	wrpr	%r0, 0x0006, %-
intveclr_0_224:
	setx 0x1e1d04adc8af28c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9a69a78c  ! 406: UDIVX_I	udivx 	%r6, 0x078c, %r13
	.word 0xa1902009  ! 407: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_0_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 408: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01960  ! 409: FqTOd	dis not found

	.word 0x95688003  ! 410: SDIVX_R	sdivx	%r2, %r3, %r10
	.word 0x81510000  ! 411: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa7a2c9c5  ! 412: FDIVd	fdivd	%f42, %f36, %f50
DS_0_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 413: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_228)+48, 16, 16)) -> intp(0,1,3)
xir_0_228:
	.word 0xa9812a10  ! 414: WR_SET_SOFTINT_I	wr	%r4, 0x0a10, %set_softint
	.word 0x9350c000  ! 415: RDPR_TT	<illegal instruction>
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	setx 0xcb6e5ed502ee0057, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_229:
	.word 0x39400001  ! 417: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a0016b  ! 418: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_230) + 56, 16, 16)) -> intp(6,0,4)
intvec_0_230:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 420: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
donret_0_231:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_231-donret_0_231), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_231:
	.word 0xd4ffea10  ! 421: SWAPA_I	swapa	%r10, [%r31 + 0x0a10] %asi
	.word 0xd4c804a0  ! 422: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x2a800001  ! 423: BCS	bcs,a	<label_0x1>
	.word 0xd47fea10  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0a10]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_232:
	setx 0x33b8b94f742aa2cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_233:
    set user_data_start, %o7
	.word 0x93902002  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_234)+24, 16, 16)) -> intp(0,1,3)
xir_0_234:
	.word 0xa9806a1c  ! 428: WR_SET_SOFTINT_I	wr	%r1, 0x0a1c, %set_softint
memptr_0_235:
	set 0x60740000, %r31
	.word 0x85852149  ! 429: WRCCR_I	wr	%r20, 0x0149, %ccr
splash_cmpr_0_236:
	setx 0x1309eba259446703, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 430: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd437e149  ! 431: STH_I	sth	%r10, [%r31 + 0x0149]
	.word 0xa7520000  ! 432: RDPR_PIL	<illegal instruction>
splash_cmpr_0_237:
	setx 0x8c75367fd03cbc25, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 433: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902295  ! 434: WRPR_TT_I	wrpr	%r0, 0x0295, %tt
intveclr_0_238:
	setx 0xdb733bcac291a4ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 435: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6c004a0  ! 436: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
change_to_randtl_0_239:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_239:
	.word 0x8f902003  ! 437: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_randtl_0_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_240:
	.word 0x8f902002  ! 438: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_0_241:
	setx 0x1fb8c60bcfd7ba48, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 439: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9022b5  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x02b5, %pstate
	.word 0x2a800001  ! 441: BCS	bcs,a	<label_0x1>
intveclr_0_242:
	setx 0xe3ca9243cf48ce00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 442: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 443: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r19
DS_0_243:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe71fe149  ! 446: LDDF_I	ldd	[%r31, 0x0149], %f19
mondo_0_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 447: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x87802080  ! 448: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76826a0  ! 449: SDIVX_I	sdivx	%r0, 0x06a0, %r19
splash_cmpr_0_246:
	setx 0xae8d39b504268dbe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_247:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_247:
	.word 0x8f902000  ! 451: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_0_248:
	tsubcctv %r8, 0x19f8, %r6
	.word 0xe607e6a0  ! 452: LDUW_I	lduw	[%r31 + 0x06a0], %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692784  ! 453: SDIVX_I	sdivx	%r4, 0x0784, %r16
	.word 0xe09fc020  ! 454: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
change_to_randtl_0_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_250:
	.word 0x8f902002  ! 455: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_0_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 458: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa190200a  ! 459: WRPR_GL_I	wrpr	%r0, 0x000a, %-
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
wait_for_debug_0_252:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_252
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 460: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa7846313  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0313, %-
	.word 0x9550c000  ! 462: RDPR_TT	<illegal instruction>
splash_cmpr_0_253:
	setx 0xcebc77cb52c3ca1e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_254) + 0, 16, 16)) -> intp(1,0,6)
intvec_0_254:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x95414000  ! 465: RDPC	rd	%pc, %r10
splash_lsu_0_256:
	setx 0x339cad094c4fc7c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_257:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d908012  ! 467: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
splash_lsu_0_258:
	setx 0x1e0f9588714c7993, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_259:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9bb44fe7  ! 471: FONES	e	%f13
debug_0_260:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 472: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab826799  ! 473: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0799, %clear_softint
mondo_0_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d904003  ! 474: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
DS_0_262:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f10, %f8
	.word 0x93b0c314  ! 475: ALIGNADDRESS	alignaddr	%r3, %r20, %r9
debug_0_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_264:
	tsubcctv %r25, 0x1b31, %r21
	.word 0xd207e799  ! 477: LDUW_I	lduw	[%r31 + 0x0799], %r9
	.word 0xa2826f5c  ! 478: ADDcc_I	addcc 	%r9, 0x0f5c, %r17
splash_cmpr_0_265:
	setx 0xce782f7faaf38736, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 479: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 480: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99902004  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_0_267:
	setx 0x0a21082071cf1845, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_268) + 48, 16, 16)) -> intp(1,0,31)
intvec_0_268:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_269:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_269:
	.word 0x8f902003  ! 484: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 485: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_0_270:
	set user_data_start, %r31
	.word 0x8580615a  ! 486: WRCCR_I	wr	%r1, 0x015a, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 487: RDPC	rd	%pc, %r18
	.word 0xa4680002  ! 488: UDIVX_R	udivx 	%r0, %r2, %r18
	.word 0xa1902007  ! 489: WRPR_GL_I	wrpr	%r0, 0x0007, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 490: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r19
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x96fb0000  ! 493: SDIVcc_R	sdivcc 	%r12, %r0, %r11
	.word 0x8d903939  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x1939, %pstate
mondo_0_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c011  ! 495: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x97a089b3  ! 496: FDIVs	fdivs	%f2, %f19, %f11
	.word 0xa190200b  ! 497: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879021b0  ! 498: WRPR_TT_I	wrpr	%r0, 0x01b0, %tt
cmpenall_0_274:
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

	.xword	0x4f830fd0422a1948
	.xword	0xd99bae5ca7957a01
	.xword	0x4c09d5e6e2961fc2
	.xword	0xc67cb98e58a76ff2
	.xword	0xe88709c1aa57a08a
	.xword	0x9892299f50894dfe
	.xword	0xfa3a1346cf522c61
	.xword	0x1d8c5a67a92452da
	.xword	0x0d29d7fb3db50599
	.xword	0xc0525ecf1abee53e
	.xword	0xdb643b57c08b8b65
	.xword	0xa55c9ab4e33079d8
	.xword	0xd90288b30c80f973
	.xword	0x7c0edfe5eb66dfcd
	.xword	0x53a68bddfdc59820
	.xword	0x6bc37d9cf1d2c03b
	.xword	0x5e72d1f25d5da702
	.xword	0x9cfecce50ddc2035
	.xword	0x9b4707ca1a233cad
	.xword	0x02ec910d6158993c
	.xword	0xa0615983c9f9df04
	.xword	0x4214f27bd42df601
	.xword	0x5509a00df0b41db1
	.xword	0x77fb9766ed9f9d25
	.xword	0x423a01c96a1cd5c8
	.xword	0x2be40682947538fd
	.xword	0x59b64168c5c90394
	.xword	0x000edf41e91998a8
	.xword	0x42ccc34a49d3c4bc
	.xword	0x7e29988f0b9766a7
	.xword	0xe97432e47adf8d6d
	.xword	0x7a1dff9148865580
	.xword	0x71428af93bcddf67
	.xword	0x5d1cf537167f5a46
	.xword	0x878ebdaf2cb735db
	.xword	0x7de6dea6781a5036
	.xword	0x89d727fdf8c8200a
	.xword	0xe9ae5623e7ad348a
	.xword	0x1f198d2537cda6aa
	.xword	0xcaac009f4278aa22
	.xword	0x50169a02749cadaf
	.xword	0xf473761501858744
	.xword	0xf81743711d37e68e
	.xword	0x013140112218311e
	.xword	0xfa9fc0c93043357c
	.xword	0x9ef002daffce6e3b
	.xword	0x19a58bea6c325dd7
	.xword	0x44a7837bb593d5df
	.xword	0x224eb37c39e78d33
	.xword	0xf64b5c17f620c7c4
	.xword	0x6a014ec43450c7db
	.xword	0xcccd273aabce919a
	.xword	0x047d41127caa851e
	.xword	0x1c8d70b82f663c8d
	.xword	0xf7ebc737e13bd9ed
	.xword	0x10be9a92e3eaf308
	.xword	0xdbe26145a5bfcfec
	.xword	0xdd5cd8ba9ced73f2
	.xword	0x3ae186766fcbe742
	.xword	0xb74031fcf8365a39
	.xword	0xb5c40d178c8512e3
	.xword	0x8fa1d57c3746126a
	.xword	0x9c87612254009e00
	.xword	0x85418ef8e4dcb973
	.xword	0xfc8549f4514d5d1c
	.xword	0x5a0c693a1ce9de06
	.xword	0x52151487f7532191
	.xword	0x950fa8ae3f00c3fa
	.xword	0x14f71a83279b4535
	.xword	0xc6f56fa2b6c0666c
	.xword	0x57e3f1f735f816e9
	.xword	0x5636788ff7712868
	.xword	0x18fc52f1277759c7
	.xword	0xcfed5f98965c2888
	.xword	0xcb2c42f0b75062b9
	.xword	0xe063dd3b144d8f93
	.xword	0x4c96d5460d902d1a
	.xword	0x503c1436ae43fc4a
	.xword	0xbab10cb93f33ed07
	.xword	0xfe748371233a6628
	.xword	0xaa48a73c8fe51960
	.xword	0x652751d2ad8674bc
	.xword	0x1cef618f59eaebba
	.xword	0x436790783b3c3e29
	.xword	0xebde7be6eb2177ab
	.xword	0xf336cf87b7f401f0
	.xword	0x7233f40e838fef0f
	.xword	0xce07035c7b254ae8
	.xword	0x2b0edc958ab3daab
	.xword	0x06c3b911011e122d
	.xword	0x8fd9779d010004f1
	.xword	0x47a6b9426f5d6933
	.xword	0x51e0b1894ee008ef
	.xword	0xd2874b26b3de6fb7
	.xword	0xcf133986f199b84d
	.xword	0xc030de856c868a9e
	.xword	0xe474e78702fb0c03
	.xword	0x446cc6cc29f7e547
	.xword	0x86c7f0f21a7b636a
	.xword	0xa5b72520b5e18f40
	.xword	0xca838c80c663814d
	.xword	0x8fb66741926299f4
	.xword	0x515a29933ae34138
	.xword	0xf5ec5ad0b008b620
	.xword	0xac1e42874ff2e218
	.xword	0x8263e55734fdfd72
	.xword	0xf71f41fb87d6ca65
	.xword	0xd10884f15dacc511
	.xword	0x34a75fba52e41413
	.xword	0x439d567bb4e95c2a
	.xword	0xdd48713603753ddf
	.xword	0x419655404a302053
	.xword	0xc09f2d4357084764
	.xword	0x172f0bd56e1a769f
	.xword	0x96f2361729966a06
	.xword	0x577f69b6d2d0e3f9
	.xword	0xaaefef9d0a08a656
	.xword	0x77756f1299f6079f
	.xword	0x8eea91c89fe46ff7
	.xword	0x858ecace59b91e39
	.xword	0x322df52096b27fc4
	.xword	0x0c70b353d63094b5
	.xword	0x781f474ca50a0944
	.xword	0x7e242002e725deb5
	.xword	0x3d64c80b89669b43
	.xword	0x0fbe51d94e9fa1e1
	.xword	0x0d64aa9a68e2c85c
	.xword	0x326a43638a3d4af9
	.xword	0x21a1e732a11c2d7e
	.xword	0xff83f3affdf64d7a
	.xword	0xdbce9cb1b059d3dd
	.xword	0x2a22014a90c638f8
	.xword	0xeee1c48882769936
	.xword	0xa77012e9084798db
	.xword	0x21bde2e433c74d90
	.xword	0x9311e1da8bac2f93
	.xword	0x8f6fd49028c1e9a4
	.xword	0x396f1e494e6ffac4
	.xword	0x5eebc0583aa529e9
	.xword	0x96d1490b0c005acd
	.xword	0xaae4880845a72038
	.xword	0xa43477529ff5fdc3
	.xword	0xf8c60e39a84a56b0
	.xword	0x9fa45f7a7089fe01
	.xword	0x7c32952fbbcc6cbe
	.xword	0xbd66bafebb43fa57
	.xword	0x2e6d6c17a650391a
	.xword	0x61ac3a889219b2d7
	.xword	0xc3e86d9ca9e49b36
	.xword	0xad6a5a423aa37780
	.xword	0x491019f76bf07e54
	.xword	0x87801fff213e4f6a
	.xword	0x11a9e935895088c8
	.xword	0xfbb600af70021084
	.xword	0x2a8ef5f32ac1bc20
	.xword	0x047259814ee9bc12
	.xword	0xbc57f8ac557b3d17
	.xword	0x1dc96f7c9a95cd00
	.xword	0x45e3317ddca1d6ed
	.xword	0x368bfff4bf7ed293
	.xword	0x818adc2e22bbec94
	.xword	0x06d866425a0dea38
	.xword	0x9c2f4e2180b8e842
	.xword	0x90b6cfa303be67b9
	.xword	0xbd4c49579e3d7430
	.xword	0x201efe9a60e61582
	.xword	0x6e6252b501d34c1f
	.xword	0x7de3e40f9aade0f2
	.xword	0xbce8a98f944e3cd7
	.xword	0xd63e4104bc3615a1
	.xword	0xee5823bc0b11bbb5
	.xword	0x98c148e1621d23ea
	.xword	0x9a1341930a0c0f16
	.xword	0xb166175b4a9840ba
	.xword	0xc811f8bd7af9a649
	.xword	0x5516524b38c70af0
	.xword	0xf1c97aff1de7e553
	.xword	0x25be41d99ce46714
	.xword	0x794d038e315ba9b8
	.xword	0x293ed86e84b91f91
	.xword	0x357e2b0fa3c37e02
	.xword	0x140b2346446cac40
	.xword	0x4b6c12b5e510d7c3
	.xword	0x5cc672880ac2253e
	.xword	0xfb237d3a531c78b6
	.xword	0xc9131ec7ff0cbb83
	.xword	0x45c50f62a946c4ab
	.xword	0xdca4e6aa28b2d561
	.xword	0x5fe5a9a0c308d53d
	.xword	0xcaae61f92559c005
	.xword	0x183f827e14bae419
	.xword	0xbbeb0119ed62c5b0
	.xword	0xb2a3a74e936ed8e4
	.xword	0x70729f473caee8a8
	.xword	0x7dab9b6ebfcf7bde
	.xword	0xa302906ab0cd3f6d
	.xword	0x2951c8edd8c22ef8
	.xword	0xfa6bff5c9e8de863
	.xword	0x41e610f2a1f13632
	.xword	0xad6d05d8b31d6317
	.xword	0x2aee78319d2ddf92
	.xword	0x28356d299743b268
	.xword	0x00008d8ac480d9ce
	.xword	0xa672b6893d4803f7
	.xword	0x5114c0032c96bf7d
	.xword	0xc2c5f81063b34de2
	.xword	0x17c2e7e3ac0a8135
	.xword	0x52eca1007b59959b
	.xword	0xacdfa04694e58482
	.xword	0x54d1bf79358168f8
	.xword	0x2f7213793638a007
	.xword	0x9ec0197080637eae
	.xword	0x5ce35ed7007ede2b
	.xword	0x160bb2b819d41548
	.xword	0x1b1de7c392c58cf9
	.xword	0xbc5928fb8ac4afe2
	.xword	0x88c7d51050d6e693
	.xword	0x1bb72efd3a4c3f41
	.xword	0x31b3455e70610053
	.xword	0x0d4af59e036024e2
	.xword	0x9deea31c85a57021
	.xword	0x8cd533bf79ce19e2
	.xword	0xff7671c5f3bc55f5
	.xword	0x4c3cac1511165a8f
	.xword	0x020e7b4eef6ddd89
	.xword	0xa62805a56c71cf7a
	.xword	0x01955d90d925b48a
	.xword	0x9e1608122bdd2274
	.xword	0x6b8330e69f18576b
	.xword	0x8e27a0ff4e6bf93d
	.xword	0xf1231f0dc17ec1b8
	.xword	0xde7a97aa3c27df8b
	.xword	0xced5e6f59e6287e9
	.xword	0x7e67919a0cff6d9d
	.xword	0x5ece3ab39e157f06
	.xword	0x9f83ed35522dadf3
	.xword	0xcef123c749506175
	.xword	0xb0b51e526e0aa26e
	.xword	0x169c3255ee1aaf50
	.xword	0x90805ebd1fc08072
	.xword	0x819d62357649ace2
	.xword	0x766d4474ad128ceb
	.xword	0x1acae35a2f882d6d
	.xword	0xbb876b1db39d56a2
	.xword	0x216adc8fe715fb6f
	.xword	0x49eb4bdcc0a34525
	.xword	0xcb81f520264295e1
	.xword	0x74948975704eaafc
	.xword	0x2cff6cfda8655e46
	.xword	0x22c2f7df8331fdd7
	.xword	0x60e114ff2ca2f7e0
	.xword	0x52a90b4c198545b3
	.xword	0x8283efdb274656a8
	.xword	0xde87f5de1b741a35
	.xword	0x942b378cff7ac519
	.xword	0x46f86a3c1e5ce1ab

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
# 457 "diag.j"
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


attr_data {
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x5dc1569b9f90e5a7
	.xword	0x604f0d401eda9470
	.xword	0x10d02e41f3088df1
	.xword	0x624667c6f77fb3fe
	.xword	0x348d27c42dfb6ba8
	.xword	0xfc5aa900fdbca697
	.xword	0xf1f097d10ab9e059
	.xword	0x449744bb87406f94
	.xword	0x177f382438adae21
	.xword	0xefbb4837f695f50c
	.xword	0xa9793981965ac1a7
	.xword	0xd823c20267339f3b
	.xword	0xb05d5d7c8603aef1
	.xword	0xb71e315dab8e129b
	.xword	0x9164e7484d8ebb20
	.xword	0x7033c240278430b7
	.xword	0x9dd527d88376eaee
	.xword	0xebd531f1b7277225
	.xword	0x9c46a99db5092844
	.xword	0x87317314d4089f15
	.xword	0xdfb2939905325fed
	.xword	0x8cdc47f3f5a90d59
	.xword	0x3259110dae80a23b
	.xword	0x0eb845fdc5807187
	.xword	0xc0ef0e23bc98f5a7
	.xword	0xf7dcca3114c38029
	.xword	0xe0bc76d9c155e212
	.xword	0x7fc442e660ca5a5c
	.xword	0xd459f0e3cc19f878
	.xword	0x3531c2365c94fce7
	.xword	0xd2f593b698a65f7d
	.xword	0xc4fbb190f111f450



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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
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
	.xword	0xf45a89da36fa18a6
	.xword	0x080e10da59ce0fac
	.xword	0x89330f3820e825e5
	.xword	0x9d7a108d2996fb94
	.xword	0x96922ef74aca992b
	.xword	0xfca75f7b64672ca5
	.xword	0xf8c38c4d1327f77a
	.xword	0x3d36142942cc2b00
	.xword	0x5e3d9052e40252ae
	.xword	0x49a31129c801f9b0
	.xword	0xef429a590532b893
	.xword	0x9aedd764ce61dde8
	.xword	0x778f99f900d40f85
	.xword	0x7ab0839d26a6b0a7
	.xword	0x1ba15d7290ffb501
	.xword	0x5b7c5f7fc7be2afc
	.xword	0xca3ad803ef4a7223
	.xword	0x06490d5e6a8b0443
	.xword	0xcc9ce31bc940adfb
	.xword	0x26eb1ac49d7f20dd
	.xword	0x46b6cd8e0437e4da
	.xword	0x1506d7fbede37a33
	.xword	0xe7a4692d4e901c67
	.xword	0xc0dca5967813ea03
	.xword	0x5317cbe97483a2f4
	.xword	0x80ae7c2d44d645cb
	.xword	0xdaf83e84277053cc
	.xword	0x2e75d8afbf43ce95
	.xword	0x12ca2685c1a9585e
	.xword	0xea5fccba6ec7bb3d
	.xword	0x8d6e2a66edb24a6a
	.xword	0x7d8e1564cd0a0475



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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
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
	.xword	0xb2da6de1a5ca4186
	.xword	0x2c7951a22e2d26ba
	.xword	0x07ebff8574c3a670
	.xword	0x3c512d0f0fd2b0f8
	.xword	0xc1777d2b290ed790
	.xword	0xa450a4a874529b3a
	.xword	0x9ad89814be657f05
	.xword	0x01bf6fcf660621af
	.xword	0xcc5f39868b002e88
	.xword	0x7d479db16f6d6a3f
	.xword	0x078bbcc704b25e3b
	.xword	0xba48ed4638ef49b9
	.xword	0xb71774e874f00f80
	.xword	0xa07aa428a9a12fd0
	.xword	0x972dd8c19f6bbfac
	.xword	0x7d05760d02e7f0cc
	.xword	0x8c75cf59b985b715
	.xword	0xb96255347b258dbe
	.xword	0x3340ad05ee36c33d
	.xword	0x7bf22a3de6d05d10
	.xword	0xd7fda7a94976df5e
	.xword	0x57308bcc80ebf0cb
	.xword	0xe33c8fe3c43cba5c
	.xword	0x2ce4c75c56708aec
	.xword	0x5af8b3e88cdc7206
	.xword	0xdff52d3d213a2f8f
	.xword	0xa48c4fe5dcc03b8f
	.xword	0x494dde69197c9cd3
	.xword	0x57aa75fe6ebdfc29
	.xword	0xbcb550bbef142d8b
	.xword	0x34db06bd81508a78
	.xword	0x0e5f2a563e8ad9f5



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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
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
	.xword	0x3b30630d385efbb3
	.xword	0x2878f8a3082339e3
	.xword	0xd38f85c0cb1a08fd
	.xword	0x6d01508852cbb18e
	.xword	0x1e7d280987af95b8
	.xword	0xe57222c0c3a7d9f3
	.xword	0x4375da2804a91050
	.xword	0x82b9f6d8b3dfb7db
	.xword	0x12e5b72cfa0b7f00
	.xword	0x9d609aba72530c61
	.xword	0xa8be4f5463f60ed1
	.xword	0xa2d08d13c1a56f01
	.xword	0xa553ce640acca61e
	.xword	0x3563af97fe8ca0fb
	.xword	0x0630be4df646e1da
	.xword	0x4ef9e60001505d4e
	.xword	0x3a20776131c274f3
	.xword	0x6f2b65c2d3efa0d0
	.xword	0x92c6e6293f2d938b
	.xword	0x5638fa328165b1b0
	.xword	0x6ae96e007a68334b
	.xword	0xae774f8b8f382a1d
	.xword	0x935aae04ff94cfdd
	.xword	0x8a125f13dfc11647
	.xword	0x6d95a24f375f0634
	.xword	0xc7ea48e3962c42ca
	.xword	0x207b956816356c45
	.xword	0x823fa138086f6989
	.xword	0x1e3e75acaa45fd3a
	.xword	0xd76e84825ee24091
	.xword	0xce03929d9b966003
	.xword	0xfd7998b71b9cb2a0



#if 0
#endif

