/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_42.s
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
	mov 0xb1, %r14
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
	mov 0x33, %r14
	mov 0x31, %r30
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
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_7_0:
	set user_data_start, %r31
	.word 0x85816d66  ! 2: WRCCR_I	wr	%r5, 0x0d66, %ccr
DS_7_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa1902008  ! 5: WRPR_GL_I	wrpr	%r0, 0x0008, %-
change_to_randtl_7_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_2:
	.word 0x8f902002  ! 6: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_7_3:
	setx 0x7ca22cc8b0037dd1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 8: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x87802088  ! 9: WRASI_I	wr	%r0, 0x0088, %asi
donret_7_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_5-donret_7_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_7_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_6:
	.word 0x8f902001  ! 11: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_7_7:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_7_8:
	setx 0x07ec9a0eb48554fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902749  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x0749, %pstate
	.word 0x879023df  ! 16: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_9:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 17: RDPC	rd	%pc, %r8
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_7_10:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_7_11:
    set user_data_start, %o7
	.word 0x93902000  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9b45c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8d90225c  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x025c, %pstate
splash_lsu_7_12:
	setx 0xa993cbe23b7c2f89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 25: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x95a00163  ! 26: FABSq	dis not found

splash_lsu_7_13:
	setx 0x419b7cb06ef96a09, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_14:
	set 0x60340000, %r31
	.word 0x8580b416  ! 28: WRCCR_I	wr	%r2, 0x1416, %ccr
splash_hpstate_7_15:
	.word 0x81982ebd  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ebd, %hpstate
	.word 0x99464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x91d02035  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_7_16:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_7_17:
    set user_data_start, %o7
	.word 0x93902004  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe48804a0  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
splash_hpstate_7_18:
	.word 0x8198239c  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039c, %hpstate
cwp_7_19:
    set user_data_start, %o7
	.word 0x93902000  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 37: RDPC	rd	%pc, %r8
	.word 0x87802088  ! 38: WRASI_I	wr	%r0, 0x0088, %asi
DS_7_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b24307  ! 39: ALIGNADDRESS	alignaddr	%r9, %r7, %r16
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d902160  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0160, %pstate
	.word 0xe8c80e40  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r20
debug_7_22:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d930013  ! 44: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_24) + 8, 16, 16)) -> intp(5,0,28)
intvec_7_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902782  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0782, %pstate
	.word 0xab812f18  ! 47: WR_CLEAR_SOFTINT_I	wr	%r4, 0x0f18, %clear_softint
memptr_7_25:
	set 0x60740000, %r31
	.word 0x8580a247  ! 48: WRCCR_I	wr	%r2, 0x0247, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_7_26:
	.word 0x81982fce  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fce, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d903a8a  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x1a8a, %pstate
	.word 0x91d02032  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_7_27:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 54: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 56: RDPC	rd	%pc, %r16
	.word 0x87902059  ! 57: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	.word 0x90da4000  ! 58: SMULcc_R	smulcc 	%r9, %r0, %r8
	setx 0xbdb61eb7cbf6ee9f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_30:
	.word 0x819825ef  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ef, %hpstate
	.word 0xa1902000  ! 61: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_hpstate_7_31:
	.word 0x81982497  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0497, %hpstate
donret_7_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_32-donret_7_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01969  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e020  ! 66: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
mondo_7_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d924002  ! 68: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_35:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 69: RDPC	rd	%pc, %r19
	.word 0x9ba20d2d  ! 70: FsMULd	fsmuld	%f8, %f44, %f44
splash_hpstate_7_36:
	.word 0x81982726  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0726, %hpstate
splash_cmpr_7_37:
	setx 0xff22bb4a8d327346, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_38:
	setx 0x5a62db5556342acc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_7_39:
	set user_data_start, %r31
	.word 0x8582a9cf  ! 76: WRCCR_I	wr	%r10, 0x09cf, %ccr
intveclr_7_40:
	setx 0x457848cd3cc8b8d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_htba_7_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_7_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_7_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_43:
	.word 0x8f902000  ! 82: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902008  ! 83: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_7_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d020b4  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 180
memptr_7_45:
	set user_data_start, %r31
	.word 0x8582b527  ! 87: WRCCR_I	wr	%r10, 0x1527, %ccr
	.word 0xd2d004a0  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_tba_7_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xf60f46393c0228cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ca41b  ! 92: SDIVX_I	sdivx	%r18, 0x041b, %r12
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_7_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 94: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
splash_tba_7_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa1540000  ! 97: RDPR_GL	rdpr	%-, %r16
	.word 0x8790228c  ! 98: WRPR_TT_I	wrpr	%r0, 0x028c, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_7_51:
	setx 0x02499137b5d8884f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_52-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_52:
	.word 0x91934007  ! 101: WRPR_PIL_R	wrpr	%r13, %r7, %pil
splash_tba_7_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b30305  ! 103: ALIGNADDRESS	alignaddr	%r12, %r5, %r8
cwp_7_55:
    set user_data_start, %o7
	.word 0x93902007  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902538  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x0538, %pstate
	.word 0x8780208b  ! 106: WRASI_I	wr	%r0, 0x008b, %asi
DS_7_56:
	.word 0x99a109c7  ! 1: FDIVd	fdivd	%f4, %f38, %f12
	.word 0xff58f5f3	! Random illegal ?
	.word 0xd912c010  ! 1: LDQF_R	-	[%r11, %r16], %f12
	.word 0xa5a44827  ! 107: FADDs	fadds	%f17, %f7, %f18
	.word 0x87802058  ! 108: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa190200c  ! 109: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_57:
	setx 0x70051625bd8f1a55, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_58)+48, 16, 16)) -> intp(7,1,3)
xir_7_58:
	.word 0xa9807226  ! 112: WR_SET_SOFTINT_I	wr	%r1, 0x1226, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_7_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_7_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_60-donret_7_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa1902005  ! 116: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd297e020  ! 117: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0xa7a0016a  ! 119: FABSq	dis not found

memptr_7_61:
	set 0x60140000, %r31
	.word 0x85847084  ! 120: WRCCR_I	wr	%r17, 0x1084, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa1902003  ! 122: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_hpstate_7_62:
	.word 0x81982507  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
mondo_7_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d93000b  ! 124: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
splash_hpstate_7_64:
	.word 0x819826d7  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0x91450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x87902284  ! 127: WRPR_TT_I	wrpr	%r0, 0x0284, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_65)+0, 16, 16)) -> intp(7,1,3)
xir_7_65:
	.word 0xa9827285  ! 128: WR_SET_SOFTINT_I	wr	%r9, 0x1285, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_7_66:
	setx 0x8876b654892d5fb7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_67:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_7_68:
	set 0x60540000, %r31
	.word 0x8584787e  ! 132: WRCCR_I	wr	%r17, 0x187e, %ccr
tagged_7_69:
	taddcctv %r25, 0x1b36, %r16
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01971  ! 134: FqTOd	dis not found

splash_tba_7_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_72:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 136: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa5a30d2d  ! 137: FsMULd	fsmuld	%f12, %f44, %f18
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_7_73:
	setx 0x18465355fcce15ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa545c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0xa9840000  ! 141: WR_SET_SOFTINT_R	wr	%r16, %r0, %set_softint
	.word 0x93a349c0  ! 142: FDIVd	fdivd	%f44, %f0, %f40
tagged_7_74:
	tsubcctv %r24, 0x16c4, %r15
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_7_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
donret_7_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_76-donret_7_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d903b1a  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x1b1a, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879021f2  ! 148: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_7_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_77:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_7_78:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_79:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_80) + 0, 16, 16)) -> intp(5,0,15)
intvec_7_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_81:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9810008  ! 155: WR_SET_SOFTINT_R	wr	%r4, %r8, %set_softint
splash_lsu_7_82:
	setx 0xab7bceff817d456b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_83:
	setx 0x643879a994fdb39d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_7_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8780201c  ! 160: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902c31  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0c31, %pstate
	.word 0xa1902001  ! 162: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_7_86:
    set user_data_start, %o7
	.word 0x93902000  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
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
	.word 0x95414000  ! 165: RDPC	rd	%pc, %r10
DS_7_88:
	.word 0x91a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f8
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_7_89:
    set user_data_start, %o7
	.word 0x93902003  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01970  ! 168: FqTOd	dis not found

splash_cmpr_7_91:
	setx 0x7de4f2d9b25a6469, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_93:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_94:
	setx 0xd456bb0346eb9610, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902002  ! 173: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196a  ! 176: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76c72e5  ! 177: SDIVX_I	sdivx	%r17, 0xfffff2e5, %r19
tagged_7_97:
	taddcctv %r10, 0x1e32, %r18
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_7_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c3caa  ! 180: SDIVX_I	sdivx	%r16, 0xfffffcaa, %r9
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_100:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 181: RDPC	rd	%pc, %r8
intveclr_7_101:
	setx 0x308ee9558fce2258, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 183: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36a2a50  ! 184: SDIVX_I	sdivx	%r8, 0x0a50, %r17
	.word 0x879020af  ! 185: WRPR_TT_I	wrpr	%r0, 0x00af, %tt
	.word 0xdac804a0  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
debug_7_103:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe030  ! 188: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
intveclr_7_104:
	setx 0x3a1b15b866fd5c3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 51
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_7_105:
	.word 0x8198246d  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x046d, %hpstate
debug_7_106:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_7_108:
	setx 0x8c4c1375299cdc37, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_7_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91903d22  ! 198: WRPR_PIL_I	wrpr	%r0, 0x1d22, %pil
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 199: RDPC	rd	%pc, %r17
	.word 0x99a049d1  ! 200: FDIVd	fdivd	%f32, %f48, %f12
debug_7_111:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 201: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01967  ! 202: FqTOd	dis not found

DS_7_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f22, %f18
	.word 0xa3b50312  ! 203: ALIGNADDRESS	alignaddr	%r20, %r18, %r17
splash_tba_7_114:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01962  ! 205: FqTOd	dis not found

intveclr_7_116:
	setx 0xd1f104d5ff5e166e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_7_117:
	.word 0x81982d5e  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0x87902304  ! 209: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
debug_7_118:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad836558  ! 211: WR_SOFTINT_REG_I	wr	%r13, 0x0558, %softint
	.word 0x8d90366b  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x166b, %pstate
debug_7_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_7_121:
	setx 0xa9f13a3a51a6656b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_7_122:
	setx 0x46dfbf692e2ea778, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_123:
	setx 0x69adf51e6276cd8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_7_124:
	setx 0xfc1a219ba778a9d4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_125:
	setx 0xc96abadf48791fab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_7_126:
	tsubcctv %r22, 0x1f99, %r1
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_7_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 226: FqTOd	dis not found

debug_7_129:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 227: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
tagged_7_130:
	tsubcctv %r13, 0x1040, %r24
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d9038df  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x18df, %pstate
	.word 0xa1a00174  ! 230: FABSq	dis not found

debug_7_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cadbb  ! 233: SDIVX_I	sdivx	%r18, 0x0dbb, %r9
tagged_7_133:
	taddcctv %r11, 0x1030, %r7
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_134:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 235: RDPC	rd	%pc, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa369731a  ! 236: SDIVX_I	sdivx	%r5, 0xfffff31a, %r17
	.word 0x8d902c04  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
DS_7_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_7_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_tba_7_138:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_7_139:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa1902008  ! 244: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_7_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0xa3a00172  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_7_141:
    set user_data_start, %o7
	.word 0x93902000  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_7_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 250: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0xa1902004  ! 251: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_7_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa1902009  ! 255: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_7_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01971  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d903290  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1290, %pstate
mondo_7_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 261: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_148-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_148:
	.word 0x9194c00b  ! 262: WRPR_PIL_R	wrpr	%r19, %r11, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x3403d8fd14f54aae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e000  ! 266: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
DS_7_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f28, %f8
	.word 0x99b10302  ! 267: ALIGNADDRESS	alignaddr	%r4, %r2, %r12
	.word 0x8d903bbb  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1bbb, %pstate
splash_lsu_7_152:
	setx 0x1e5ed5a899b7c921, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_153:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 270: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_7_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd75fc594	! Random illegal ?
	.word 0x91a289d2  ! 1: FDIVd	fdivd	%f10, %f18, %f8
	.word 0x99a0c832  ! 273: FADDs	fadds	%f3, %f18, %f12
	rd %pc, %r19
	add %r19, (ivw_7_157-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_157:
	.word 0x9192800d  ! 274: WRPR_PIL_R	wrpr	%r10, %r13, %pil
	.word 0x8d902d9a  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0d9a, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0xa5414000  ! 277: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_159:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 278: RDPC	rd	%pc, %r10
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_7_160:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_161)+48, 16, 16)) -> intp(7,1,3)
xir_7_161:
	.word 0xa984628e  ! 282: WR_SET_SOFTINT_I	wr	%r17, 0x028e, %set_softint
tagged_7_162:
	tsubcctv %r3, 0x18d9, %r3
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x83d02034  ! 284: Tcc_I	te	icc_or_xcc, %r0 + 52
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_163:
	taddcctv %r23, 0x1225, %r7
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902c39  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0c39, %pstate
debug_7_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_7_165:
	setx 0x1d93e3b89c477b45, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 291: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
debug_7_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_7_168:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_169:
	setx 0x99d1ffa06e8bcec9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_170:
	tsubcctv %r24, 0x1570, %r4
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902004  ! 297: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x93690013  ! 300: SDIVX_R	sdivx	%r4, %r19, %r9
	.word 0x8790228b  ! 301: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
change_to_randtl_7_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_171:
	.word 0x8f902003  ! 302: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902004  ! 303: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_hpstate_7_172:
	.word 0x8198294e  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	rd %pc, %r19
	add %r19, (ivw_7_173-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_173:
	.word 0x91900005  ! 305: WRPR_PIL_R	wrpr	%r0, %r5, %pil
cwp_7_174:
    set user_data_start, %o7
	.word 0x93902000  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_7_175:
	setx 0xdc65ad75170e2309, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_7_176:
	setx 0xe4d4b6afd9d04944, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 309: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01968  ! 310: FqTOd	dis not found

	.word 0x8d903456  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1456, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902307  ! 313: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 314: FqTOd	dis not found

	.word 0xd88fe030  ! 315: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
cwp_7_180:
    set user_data_start, %o7
	.word 0x93902000  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_hpstate_7_181:
	.word 0x81982007  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
debug_7_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_7_183:
	.word 0xa7a0c9d3  ! 1: FDIVd	fdivd	%f34, %f50, %f50
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1148002  ! 1: LDQF_R	-	[%r18, %r2], %f8
	.word 0xa5a2c829  ! 319: FADDs	fadds	%f11, %f9, %f18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01972  ! 320: FqTOd	dis not found

DS_7_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_7_186:
	setx 0x4fb20041e4200686, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 323: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_7_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_7_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_188:
	.word 0x8f902002  ! 326: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_7_189:
	setx 0xa1a90ebe907f8833, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 328: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_7_190:
	.word 0x81982756  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0756, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_7_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903bfc  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x1bfc, %pstate
intveclr_7_192:
	setx 0x6eaca510cd59f227, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 335: WRASI_I	wr	%r0, 0x0016, %asi
DS_7_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
tagged_7_194:
	tsubcctv %r19, 0x103b, %r19
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_7_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_195:
	.word 0x8f902000  ! 338: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd4800c00  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x8d802004  ! 340: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_7_196:
	setx 0xa39aeb6aec605748, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902084  ! 343: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad82fc3b  ! 345: WR_SOFTINT_REG_I	wr	%r11, 0x1c3b, %softint
debug_7_198:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 346: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_7_199:
	taddcctv %r5, 0x1d8f, %r10
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_7_200:
	tsubcctv %r14, 0x1542, %r2
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_7_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_201-donret_7_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_7_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d924004  ! 352: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
	setx 0x071811e9111f158c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_7_204:
	setx 0x0462ad5eda3f3b2f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_205:
	set 0x60340000, %r31
	.word 0x8581fe72  ! 355: WRCCR_I	wr	%r7, 0x1e72, %ccr
	.word 0xa190200c  ! 356: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa9a00172  ! 358: FABSq	dis not found

	.word 0x91540000  ! 359: RDPR_GL	rdpr	%-, %r8
change_to_randtl_7_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_206:
	.word 0x8f902001  ! 360: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02034  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab84c002  ! 362: WR_CLEAR_SOFTINT_R	wr	%r19, %r2, %clear_softint
	.word 0x8d903acd  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x1acd, %pstate
	.word 0x91d02032  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_7_207:
	setx 0xfe01b436aeceb1ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_208:
	.word 0x81982784  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
debug_7_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_7_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d90c012  ! 368: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	setx 0x15786cbbf8bd018b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d9020c5  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0x9150c000  ! 372: RDPR_TT	rdpr	%tt, %r8
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd08008a0  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802083  ! 376: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x87802014  ! 377: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa1a48dc8  ! 378: FdMULq	fdmulq	
splash_tba_7_213:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d020b2  ! 380: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01962  ! 381: FqTOd	dis not found

splash_cmpr_7_215:
	setx 0x35d255c5b1fb6646, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_216:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 383: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	setx 0x49c5a7ca081dfb63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 387: RDPC	rd	%pc, %r12
splash_hpstate_7_219:
	.word 0x8198265d  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
splash_tba_7_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_7_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_222:
	setx 0xf44b59721c5ecdf1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xeb9f99f23e8b1064, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0d16f26  ! 393: UMULcc_I	umulcc 	%r5, 0x0f26, %r16
	.word 0xd697e010  ! 394: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x91d020b4  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x95703da9  ! 397: POPC_I	popc	0x1da9, %r10
splash_lsu_7_224:
	setx 0xfe94b5ace0fb8ffb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902300  ! 399: WRPR_TT_I	wrpr	%r0, 0x0300, %tt
splash_cmpr_7_225:
	setx 0xcbc0c3b0058e7821, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_7_226:
	set 0x60140000, %r31
	.word 0x8581e26a  ! 401: WRCCR_I	wr	%r7, 0x026a, %ccr
cwp_7_227:
    set user_data_start, %o7
	.word 0x93902007  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802dcc  ! 403: SIR	sir	0x0dcc
mondo_7_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d920014  ! 404: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0xab806fde  ! 405: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0fde, %clear_softint
	.word 0xa1902002  ! 406: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_7_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_7_230:
	tsubcctv %r7, 0x1c1c, %r18
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x95540000  ! 409: RDPR_GL	rdpr	%-, %r10
mondo_7_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d908008  ! 410: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
debug_7_232:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_233:
	setx 0x0f8150be5c8ffe81, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_7_235:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879022a7  ! 416: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
debug_7_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_7_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 418: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
tagged_7_238:
	tsubcctv %r20, 0x1af0, %r6
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36ae081  ! 420: SDIVX_I	sdivx	%r11, 0x0081, %r17
	.word 0x87902198  ! 421: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0x91d020b4  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1693d1f  ! 424: SDIVX_I	sdivx	%r4, 0xfffffd1f, %r16
	rd %pc, %r19
	add %r19, (ivw_7_241-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_241:
	.word 0x91940011  ! 425: WRPR_PIL_R	wrpr	%r16, %r17, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96d3d86  ! 426: SDIVX_I	sdivx	%r20, 0xfffffd86, %r20
splash_cmpr_7_243:
	setx 0x6f174f10459ad5d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_244:
	setx 0xec2fd9a110c2cd30, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b6c0013  ! 429: SDIVX_R	sdivx	%r16, %r19, %r13
	setx 0x0a12ee4eaf0a3f4d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
pmu_7_247:
	nop
	setx 0xfffff80dfffffbb8, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_7_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_248:
	.word 0x8f902001  ! 433: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa1902009  ! 435: WRPR_GL_I	wrpr	%r0, 0x0009, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_7_250:
	setx 0x11c183cb6a9fbff7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_7_251:
	setx 0x3da88885429cb94f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_252:
	setx 0xdc2e093f45a46205, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x99540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_253:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 443: RDPC	rd	%pc, %r11
splash_htba_7_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_7_255:
	taddcctv %r16, 0x1d5b, %r18
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_7_256:
	set 0x60140000, %r31
	.word 0x85827f3e  ! 446: WRCCR_I	wr	%r9, 0x1f3e, %ccr
tagged_7_257:
	taddcctv %r23, 0x1856, %r11
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x8780201c  ! 449: WRASI_I	wr	%r0, 0x001c, %asi
splash_tba_7_258:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b6a0013  ! 451: SDIVX_R	sdivx	%r8, %r19, %r13
	rd %pc, %r19
	add %r19, (ivw_7_259-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_259:
	.word 0x91934001  ! 452: WRPR_PIL_R	wrpr	%r13, %r1, %pil
	rd %pc, %r19
	add %r19, (ivw_7_260-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_260:
	.word 0x9192800c  ! 453: WRPR_PIL_R	wrpr	%r10, %r12, %pil
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_261:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 454: RDPC	rd	%pc, %r19
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_262:
	setx 0x1ee32efb4c768814, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 457: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_7_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb32b615  ! 1: STQF_I	-	%f13, [0x1615, %r10]
	normalw
	.word 0x97458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r11
memptr_7_264:
	set user_data_start, %r31
	.word 0x858424da  ! 459: WRCCR_I	wr	%r16, 0x04da, %ccr
debug_7_265:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_7_266:
	setx 0xfd09cda0e2027234, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba1c9c0  ! 463: FDIVd	fdivd	%f38, %f0, %f44
splash_htba_7_267:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e020  ! 465: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
splash_lsu_7_268:
	setx 0x435508dd2650aef5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x91ecd2eca91e8b5d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
splash_cmpr_7_270:
	setx 0xf0e65d0960ab7756, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_7_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e000  ! 472: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_7_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a0c9cd  ! 1: FDIVd	fdivd	%f34, %f44, %f42
	normalw
	.word 0xa5458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x879023c0  ! 474: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
splash_cmpr_7_273:
	setx 0x8ae6d86a07f02d81, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f6, %f12
	.word 0x99b20313  ! 476: ALIGNADDRESS	alignaddr	%r8, %r19, %r12
	.word 0x8d903781  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x1781, %pstate
mondo_7_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d900014  ! 478: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_7_276:
	tsubcctv %r24, 0x1006, %r11
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_7_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x99450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xd0cfe000  ! 484: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_7_278:
	setx 0x6cb1c7879a5d3fe3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_7_279:
    set user_data_start, %o7
	.word 0x93902003  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9f803a0a  ! 489: SIR	sir	0x1a0a
cwp_7_280:
    set user_data_start, %o7
	.word 0x93902006  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_7_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_281:
	.word 0x8f902003  ! 491: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
donret_7_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_282-donret_7_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d02035  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_7_283:
	setx 0x1b11b36651f229e0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_284:
	setx 0x71b2a06d04f285d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_7_285:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_7_286:
	tsubcctv %r21, 0x1dac, %r21
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_6_0:
	set user_data_start, %r31
	.word 0x85802b32  ! 2: WRCCR_I	wr	%r0, 0x0b32, %ccr
DS_6_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa190200f  ! 5: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_6_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_2:
	.word 0x8f902002  ! 6: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_6_3:
	setx 0xfbcca64deecc876e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d914009  ! 8: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
	.word 0x87802089  ! 9: WRASI_I	wr	%r0, 0x0089, %asi
donret_6_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_5-donret_6_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_6_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_6:
	.word 0x8f902001  ! 11: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_6_7:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_6_8:
	setx 0x76f67548c4ccf9eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f63  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x0f63, %pstate
	.word 0x87902281  ! 16: WRPR_TT_I	wrpr	%r0, 0x0281, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_9:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 17: RDPC	rd	%pc, %r8
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_6_10:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_6_11:
    set user_data_start, %o7
	.word 0x93902004  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9945c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x8d902a61  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0a61, %pstate
splash_lsu_6_12:
	setx 0xbab72d676f35c155, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 25: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93a00162  ! 26: FABSq	dis not found

splash_lsu_6_13:
	setx 0x5772faba03747397, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_14:
	set 0x60740000, %r31
	.word 0x8584f300  ! 28: WRCCR_I	wr	%r19, 0x1300, %ccr
splash_hpstate_6_15:
	.word 0x81982f55  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0x99464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x91d020b2  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_6_16:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_6_17:
    set user_data_start, %o7
	.word 0x93902004  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe48804a0  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
splash_hpstate_6_18:
	.word 0x819823d6  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d6, %hpstate
cwp_6_19:
    set user_data_start, %o7
	.word 0x93902001  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_20:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 37: RDPC	rd	%pc, %r10
	.word 0x8780201c  ! 38: WRASI_I	wr	%r0, 0x001c, %asi
DS_6_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x93b08306  ! 39: ALIGNADDRESS	alignaddr	%r2, %r6, %r9
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d903c1e  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x1c1e, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_6_22:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d900001  ! 44: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_24) + 16, 16, 16)) -> intp(4,0,21)
intvec_6_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902755  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0755, %pstate
	.word 0xab8029b8  ! 47: WR_CLEAR_SOFTINT_I	wr	%r0, 0x09b8, %clear_softint
memptr_6_25:
	set 0x60340000, %r31
	.word 0x8581e2f0  ! 48: WRCCR_I	wr	%r7, 0x02f0, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_6_26:
	.word 0x8198249f  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d9029d3  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x09d3, %pstate
	.word 0x91d02034  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_6_27:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 54: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_28:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 56: RDPC	rd	%pc, %r13
	.word 0x8790231a  ! 57: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	.word 0xa0d80009  ! 58: SMULcc_R	smulcc 	%r0, %r9, %r16
	setx 0x6b023e1ffdc8bcd6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_30:
	.word 0x81982cdf  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdf, %hpstate
	.word 0xa1902008  ! 61: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_hpstate_6_31:
	.word 0x8198278c  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078c, %hpstate
donret_6_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_32-donret_6_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196a  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e010  ! 66: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
mondo_6_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 68: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_35:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 69: RDPC	rd	%pc, %r20
	.word 0x9ba30d30  ! 70: FsMULd	fsmuld	%f12, %f16, %f44
splash_hpstate_6_36:
	.word 0x8198228f  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
splash_cmpr_6_37:
	setx 0xf57b8869d7cb3390, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_38:
	setx 0xa7dcda901002813f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_6_39:
	set user_data_start, %r31
	.word 0x85832b2e  ! 76: WRCCR_I	wr	%r12, 0x0b2e, %ccr
intveclr_6_40:
	setx 0x784d89559e9b41c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_htba_6_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_6_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_6_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_43:
	.word 0x8f902001  ! 82: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902003  ! 83: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_6_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d020b4  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 180
memptr_6_45:
	set user_data_start, %r31
	.word 0x8584b67f  ! 87: WRCCR_I	wr	%r18, 0x167f, %ccr
	.word 0xd2d004a0  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_tba_6_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x8e23eabfc28baaf7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ce5a3  ! 92: SDIVX_I	sdivx	%r19, 0x05a3, %r13
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_6_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d944009  ! 94: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
splash_tba_6_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b3  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa9540000  ! 97: RDPR_GL	rdpr	%-, %r20
	.word 0x879022d4  ! 98: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_6_51:
	setx 0xf14b7dd0f562570f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_52-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_52:
	.word 0x91910008  ! 101: WRPR_PIL_R	wrpr	%r4, %r8, %pil
splash_tba_6_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b50304  ! 103: ALIGNADDRESS	alignaddr	%r20, %r4, %r11
cwp_6_55:
    set user_data_start, %o7
	.word 0x93902001  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903b5b  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1b5b, %pstate
	.word 0x8780208a  ! 106: WRASI_I	wr	%r0, 0x008a, %asi
DS_6_56:
	.word 0x99a189c0  ! 1: FDIVd	fdivd	%f6, %f0, %f12
	.word 0xb359b197	! Random illegal ?
	.word 0xd7118013  ! 1: LDQF_R	-	[%r6, %r19], %f11
	.word 0x91a4c82d  ! 107: FADDs	fadds	%f19, %f13, %f8
	.word 0x87802083  ! 108: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xa1902004  ! 109: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_57:
	setx 0xd22a2a1c07deacd9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_58)+16, 16, 16)) -> intp(6,1,3)
xir_6_58:
	.word 0xa981f28b  ! 112: WR_SET_SOFTINT_I	wr	%r7, 0x128b, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_6_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_6_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_60-donret_6_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa1902008  ! 116: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd297e010  ! 117: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0x9ba00168  ! 119: FABSq	dis not found

memptr_6_61:
	set 0x60140000, %r31
	.word 0x85852077  ! 120: WRCCR_I	wr	%r20, 0x0077, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa1902006  ! 122: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_hpstate_6_62:
	.word 0x81982c57  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
mondo_6_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d910010  ! 124: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
splash_hpstate_6_64:
	.word 0x819827d5  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d5, %hpstate
	.word 0x97450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x87902232  ! 127: WRPR_TT_I	wrpr	%r0, 0x0232, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_65)+0, 16, 16)) -> intp(6,1,3)
xir_6_65:
	.word 0xa982f84b  ! 128: WR_SET_SOFTINT_I	wr	%r11, 0x184b, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_6_66:
	setx 0x0d34d3b774ab3161, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_67:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_6_68:
	set 0x60340000, %r31
	.word 0x8584fd95  ! 132: WRCCR_I	wr	%r19, 0x1d95, %ccr
tagged_6_69:
	taddcctv %r10, 0x1620, %r23
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01970  ! 134: FqTOd	dis not found

splash_tba_6_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_72:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 136: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x99a08d33  ! 137: FsMULd	fsmuld	%f2, %f50, %f12
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_6_73:
	setx 0x52b821b5d8766aed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa145c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xa9830000  ! 141: WR_SET_SOFTINT_R	wr	%r12, %r0, %set_softint
	.word 0x99a449c3  ! 142: FDIVd	fdivd	%f48, %f34, %f12
tagged_6_74:
	tsubcctv %r6, 0x171e, %r26
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_6_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
donret_6_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_76-donret_6_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d9036dc  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x16dc, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879020ef  ! 148: WRPR_TT_I	wrpr	%r0, 0x00ef, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_6_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_77:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_6_78:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_79:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_80) + 0, 16, 16)) -> intp(1,0,0)
intvec_6_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_81:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa980c00c  ! 155: WR_SET_SOFTINT_R	wr	%r3, %r12, %set_softint
splash_lsu_6_82:
	setx 0xebb20a1a05b7fcc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_83:
	setx 0x497b064d16e0aea9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_6_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802088  ! 160: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d903be6  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1be6, %pstate
	.word 0xa190200d  ! 162: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_6_86:
    set user_data_start, %o7
	.word 0x93902000  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
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
	.word 0x9b414000  ! 165: RDPC	rd	%pc, %r13
DS_6_88:
	.word 0xa1a249d3  ! 1: FDIVd	fdivd	%f40, %f50, %f16
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_6_89:
    set user_data_start, %o7
	.word 0x93902000  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01971  ! 168: FqTOd	dis not found

splash_cmpr_6_91:
	setx 0x4e9119b44ea7165d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_93:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_94:
	setx 0x70f2bbcdf1ee959e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902005  ! 173: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 176: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a259e  ! 177: SDIVX_I	sdivx	%r8, 0x059e, %r9
tagged_6_97:
	taddcctv %r17, 0x1164, %r15
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_6_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ae4fa  ! 180: SDIVX_I	sdivx	%r11, 0x04fa, %r19
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_100:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 181: RDPC	rd	%pc, %r10
intveclr_6_101:
	setx 0x1e15c74fea425496, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 183: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a6d7e  ! 184: SDIVX_I	sdivx	%r9, 0x0d7e, %r11
	.word 0x879021b5  ! 185: WRPR_TT_I	wrpr	%r0, 0x01b5, %tt
	.word 0xdac804a0  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
debug_6_103:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe020  ! 188: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
intveclr_6_104:
	setx 0x3139dd7c4c33a926, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_6_105:
	.word 0x8198274f  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074f, %hpstate
debug_6_106:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_6_108:
	setx 0xd8a7305ccea05593, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_6_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91946202  ! 198: WRPR_PIL_I	wrpr	%r17, 0x0202, %pil
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_110:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 199: RDPC	rd	%pc, %r10
	.word 0xa5a249c5  ! 200: FDIVd	fdivd	%f40, %f36, %f18
debug_6_111:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 201: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 202: FqTOd	dis not found

DS_6_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f26, %f22, %f12
	.word 0xa1b50310  ! 203: ALIGNADDRESS	alignaddr	%r20, %r16, %r16
splash_tba_6_114:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01963  ! 205: FqTOd	dis not found

intveclr_6_116:
	setx 0x137e9bef2fc2047f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_6_117:
	.word 0x819825f5  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05f5, %hpstate
	.word 0x87902146  ! 209: WRPR_TT_I	wrpr	%r0, 0x0146, %tt
debug_6_118:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad802a9f  ! 211: WR_SOFTINT_REG_I	wr	%r0, 0x0a9f, %softint
	.word 0x8d90372e  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x172e, %pstate
debug_6_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_6_121:
	setx 0x0c41d6d74905cb91, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_6_122:
	setx 0x91eeb66da025a5d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_123:
	setx 0x5c0cbc744a4abdb1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_6_124:
	setx 0xd4dd1102e0df5d05, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_125:
	setx 0x91834b2f63e67453, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_6_126:
	tsubcctv %r7, 0x1c4b, %r4
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_6_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01965  ! 226: FqTOd	dis not found

debug_6_129:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 227: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
tagged_6_130:
	tsubcctv %r7, 0x18f0, %r14
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d902159  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x0159, %pstate
	.word 0xa5a00167  ! 230: FABSq	dis not found

debug_6_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97683137  ! 233: SDIVX_I	sdivx	%r0, 0xfffff137, %r11
tagged_6_133:
	taddcctv %r22, 0x10d9, %r24
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_134:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 235: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916abc0b  ! 236: SDIVX_I	sdivx	%r10, 0xfffffc0b, %r8
	.word 0x8d90339f  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x139f, %pstate
DS_6_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_6_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_tba_6_138:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_6_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa1902008  ! 244: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_6_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0x93a00165  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_6_141:
    set user_data_start, %o7
	.word 0x93902004  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_6_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d924012  ! 250: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xa1902003  ! 251: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe4800c60  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
debug_6_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa1902005  ! 255: WRPR_GL_I	wrpr	%r0, 0x0005, %-
debug_6_145:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d90227c  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x027c, %pstate
mondo_6_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d900007  ! 261: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_148-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_148:
	.word 0x91914001  ! 262: WRPR_PIL_R	wrpr	%r5, %r1, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xbcf84f943a9302ed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e000  ! 266: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
DS_6_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f20, %f12
	.word 0x9bb14304  ! 267: ALIGNADDRESS	alignaddr	%r5, %r4, %r13
	.word 0x8d902493  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
splash_lsu_6_152:
	setx 0xb8e251d38b75298b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_153:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 270: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_6_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xef657255	! Random illegal ?
	.word 0x9ba289cd  ! 1: FDIVd	fdivd	%f10, %f44, %f44
	.word 0x93a5082c  ! 273: FADDs	fadds	%f20, %f12, %f9
	rd %pc, %r19
	add %r19, (ivw_6_157-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_157:
	.word 0x9194000d  ! 274: WRPR_PIL_R	wrpr	%r16, %r13, %pil
	.word 0x8d902702  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0702, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0x9b414000  ! 277: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 278: RDPC	rd	%pc, %r19
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_6_160:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_161)+16, 16, 16)) -> intp(6,1,3)
xir_6_161:
	.word 0xa9806ab0  ! 282: WR_SET_SOFTINT_I	wr	%r1, 0x0ab0, %set_softint
tagged_6_162:
	tsubcctv %r15, 0x1249, %r19
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x91d02033  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 285: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_6_163:
	taddcctv %r19, 0x1251, %r2
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903211  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1211, %pstate
debug_6_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_6_165:
	setx 0xd2fbb00f9a8e7435, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 291: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
debug_6_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_6_168:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_169:
	setx 0x547be68873e9d1d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_170:
	tsubcctv %r16, 0x1d76, %r6
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902003  ! 297: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x99698008  ! 300: SDIVX_R	sdivx	%r6, %r8, %r12
	.word 0x879021d0  ! 301: WRPR_TT_I	wrpr	%r0, 0x01d0, %tt
change_to_randtl_6_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_171:
	.word 0x8f902003  ! 302: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902001  ! 303: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_hpstate_6_172:
	.word 0x8198200c  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	rd %pc, %r19
	add %r19, (ivw_6_173-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_173:
	.word 0x91910006  ! 305: WRPR_PIL_R	wrpr	%r4, %r6, %pil
cwp_6_174:
    set user_data_start, %o7
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_6_175:
	setx 0xde3d51722213d846, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_6_176:
	setx 0xc7764f98077915f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 309: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 310: FqTOd	dis not found

	.word 0x8d9036a6  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x16a6, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023e7  ! 313: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01970  ! 314: FqTOd	dis not found

	.word 0xd88fe010  ! 315: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
cwp_6_180:
    set user_data_start, %o7
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_hpstate_6_181:
	.word 0x81982d8c  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
debug_6_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_6_183:
	.word 0x99a009c6  ! 1: FDIVd	fdivd	%f0, %f6, %f12
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd111c003  ! 1: LDQF_R	-	[%r7, %r3], %f8
	.word 0xa7a40828  ! 319: FADDs	fadds	%f16, %f8, %f19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 320: FqTOd	dis not found

DS_6_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_6_186:
	setx 0x08a4ef2a012a927d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902002  ! 323: WRPR_GL_I	wrpr	%r0, 0x0002, %-
debug_6_187:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02034  ! 325: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_randtl_6_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_188:
	.word 0x8f902000  ! 326: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_6_189:
	setx 0xa7a92e41f7eea5bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 328: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_6_190:
	.word 0x81982586  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_6_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903f24  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x1f24, %pstate
intveclr_6_192:
	setx 0x2b344014ec4e7b6c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 335: WRASI_I	wr	%r0, 0x0089, %asi
DS_6_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_6_194:
	tsubcctv %r13, 0x18e4, %r13
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_6_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_195:
	.word 0x8f902000  ! 338: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd48008a0  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_6_196:
	setx 0x6c19cc57661cea4e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902369  ! 343: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad82a7f0  ! 345: WR_SOFTINT_REG_I	wr	%r10, 0x07f0, %softint
debug_6_198:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 346: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_6_199:
	taddcctv %r25, 0x1df9, %r8
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_6_200:
	tsubcctv %r23, 0x16b1, %r25
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_6_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_201-donret_6_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_6_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d904003  ! 352: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
	setx 0x6c69f6dc9d94d082, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_6_204:
	setx 0xda9f2dfedbdce4fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_205:
	set 0x60740000, %r31
	.word 0x8581b41f  ! 355: WRCCR_I	wr	%r6, 0x141f, %ccr
	.word 0xa1902008  ! 356: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa5a00172  ! 358: FABSq	dis not found

	.word 0x97540000  ! 359: RDPR_GL	rdpr	%-, %r11
change_to_randtl_6_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_206:
	.word 0x8f902002  ! 360: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02034  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab814005  ! 362: WR_CLEAR_SOFTINT_R	wr	%r5, %r5, %clear_softint
	.word 0x8d903fc2  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x1fc2, %pstate
	.word 0x91d02032  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_6_207:
	setx 0x9ada5331478a8fd3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_208:
	.word 0x81982f5e  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
debug_6_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_6_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908012  ! 368: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	setx 0x620cadc2e55d12fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d903cf9  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x1cf9, %pstate
	.word 0x9150c000  ! 372: RDPR_TT	rdpr	%tt, %r8
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd0800c80  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802016  ! 376: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802004  ! 377: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95a14dc7  ! 378: FdMULq	fdmulq	
splash_tba_6_213:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d020b2  ! 380: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01972  ! 381: FqTOd	dis not found

splash_cmpr_6_215:
	setx 0x98cd813d6e4fe74c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_216:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 383: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	setx 0x2cb59b1e0217d359, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x97414000  ! 387: RDPC	rd	%pc, %r11
splash_hpstate_6_219:
	.word 0x81982aff  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aff, %hpstate
splash_tba_6_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_6_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_222:
	setx 0xdd112cf231404323, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x2ba018b8321ab47e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x90d4f3f5  ! 393: UMULcc_I	umulcc 	%r19, 0xfffff3f5, %r8
	.word 0xd697e020  ! 394: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x83d02033  ! 396: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x91703983  ! 397: POPC_I	popc	0x1983, %r8
splash_lsu_6_224:
	setx 0x2e8b232bdcc8f9c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902209  ! 399: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
splash_cmpr_6_225:
	setx 0x4b961df53edfed4b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_6_226:
	set 0x60740000, %r31
	.word 0x8580f753  ! 401: WRCCR_I	wr	%r3, 0x1753, %ccr
cwp_6_227:
    set user_data_start, %o7
	.word 0x93902002  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802e58  ! 403: SIR	sir	0x0e58
mondo_6_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d950008  ! 404: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0xab8435a6  ! 405: WR_CLEAR_SOFTINT_I	wr	%r16, 0x15a6, %clear_softint
	.word 0xa190200f  ! 406: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_6_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_6_230:
	tsubcctv %r3, 0x181d, %r20
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x9b540000  ! 409: RDPR_GL	rdpr	%-, %r13
mondo_6_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d920000  ! 410: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
debug_6_232:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_233:
	setx 0x57cef40f9ebbfcb6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_6_235:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902313  ! 416: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
debug_6_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_6_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90c001  ! 418: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
tagged_6_238:
	tsubcctv %r17, 0x1ea8, %r6
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a7268  ! 420: SDIVX_I	sdivx	%r9, 0xfffff268, %r8
	.word 0x8790218f  ! 421: WRPR_TT_I	wrpr	%r0, 0x018f, %tt
	.word 0x91d02032  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c6cda  ! 424: SDIVX_I	sdivx	%r17, 0x0cda, %r16
	rd %pc, %r19
	add %r19, (ivw_6_241-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_241:
	.word 0x91920012  ! 425: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969a9f2  ! 426: SDIVX_I	sdivx	%r6, 0x09f2, %r20
splash_cmpr_6_243:
	setx 0xa4c2649049ffb565, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_244:
	setx 0xb902ef0f3efe9a6a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa16b400c  ! 429: SDIVX_R	sdivx	%r13, %r12, %r16
	setx 0x24e6698dcd21f485, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
pmu_6_247:
	nop
	setx 0xfffffb93fffffff9, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_6_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_248:
	.word 0x8f902001  ! 433: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa190200e  ! 435: WRPR_GL_I	wrpr	%r0, 0x000e, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_6_250:
	setx 0xf3178384bf261ded, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800a60  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
splash_lsu_6_251:
	setx 0x8c1f192a597e8007, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_252:
	setx 0xfacbf2c76248c0ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x9b540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 443: RDPC	rd	%pc, %r17
splash_htba_6_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_6_255:
	taddcctv %r8, 0x1540, %r16
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_6_256:
	set 0x60140000, %r31
	.word 0x85852e2c  ! 446: WRCCR_I	wr	%r20, 0x0e2c, %ccr
tagged_6_257:
	taddcctv %r12, 0x1afe, %r3
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802088  ! 449: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_6_258:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa36b4012  ! 451: SDIVX_R	sdivx	%r13, %r18, %r17
	rd %pc, %r19
	add %r19, (ivw_6_259-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_259:
	.word 0x9194c014  ! 452: WRPR_PIL_R	wrpr	%r19, %r20, %pil
	rd %pc, %r19
	add %r19, (ivw_6_260-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_260:
	.word 0x91928013  ! 453: WRPR_PIL_R	wrpr	%r10, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_261:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 454: RDPC	rd	%pc, %r18
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 455: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_6_262:
	setx 0x11471a809e0e6b6b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_6_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe5343b47  ! 1: STQF_I	-	%f18, [0x1b47, %r16]
	normalw
	.word 0xa9458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r20
memptr_6_264:
	set user_data_start, %r31
	.word 0x85853ac6  ! 459: WRCCR_I	wr	%r20, 0x1ac6, %ccr
debug_6_265:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_6_266:
	setx 0x47ba5d82448cf3e2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a209c2  ! 463: FDIVd	fdivd	%f8, %f2, %f20
splash_htba_6_267:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e030  ! 465: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
splash_lsu_6_268:
	setx 0x2baed7b958b6ef81, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x31acc13c15692329, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
splash_cmpr_6_270:
	setx 0xf5e74a32b58934d1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_6_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e010  ! 472: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
DS_6_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f10
	normalw
	.word 0xa5458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8790225e  ! 474: WRPR_TT_I	wrpr	%r0, 0x025e, %tt
splash_cmpr_6_273:
	setx 0x53a235793c67f37c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f4, %f16
	.word 0x93b24301  ! 476: ALIGNADDRESS	alignaddr	%r9, %r1, %r9
	.word 0x8d902138  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0138, %pstate
mondo_6_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d904000  ! 478: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
	.word 0xda800be0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r13
tagged_6_276:
	tsubcctv %r6, 0x1c04, %r23
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_6_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0xa9450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xd0cfe030  ! 484: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_6_278:
	setx 0xa8c3b3fac0ec6593, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_6_279:
    set user_data_start, %o7
	.word 0x93902007  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802c93  ! 489: SIR	sir	0x0c93
cwp_6_280:
    set user_data_start, %o7
	.word 0x93902003  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_6_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_281:
	.word 0x8f902001  ! 491: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_6_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_282-donret_6_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d020b2  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_6_283:
	setx 0x644306b32dbc3a25, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_284:
	setx 0xee41238b82fba48d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_6_285:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_6_286:
	tsubcctv %r13, 0x1424, %r9
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_5_0:
	set user_data_start, %r31
	.word 0x8581f4fd  ! 2: WRCCR_I	wr	%r7, 0x14fd, %ccr
DS_5_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa190200f  ! 5: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_5_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_2:
	.word 0x8f902002  ! 6: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_5_3:
	setx 0xb07685251dd7ee8c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c009  ! 8: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0x87802088  ! 9: WRASI_I	wr	%r0, 0x0088, %asi
donret_5_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_5-donret_5_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_5_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_6:
	.word 0x8f902001  ! 11: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_5_7:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_5_8:
	setx 0x71d4073e802da25d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c32  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x0c32, %pstate
	.word 0x87902360  ! 16: WRPR_TT_I	wrpr	%r0, 0x0360, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_9:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 17: RDPC	rd	%pc, %r11
	.word 0xd8c80e60  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r12
debug_5_10:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_5_11:
    set user_data_start, %o7
	.word 0x93902006  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9145c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x8d9020f4  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x00f4, %pstate
splash_lsu_5_12:
	setx 0x149687628fe380df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 25: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x97a0016d  ! 26: FABSq	dis not found

splash_lsu_5_13:
	setx 0x912b4d57d6a4926f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_14:
	set 0x60540000, %r31
	.word 0x8580fb6c  ! 28: WRCCR_I	wr	%r3, 0x1b6c, %ccr
splash_hpstate_5_15:
	.word 0x819825b5  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05b5, %hpstate
	.word 0x95464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x83d02033  ! 31: Tcc_I	te	icc_or_xcc, %r0 + 51
debug_5_16:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_5_17:
    set user_data_start, %o7
	.word 0x93902005  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe48804a0  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
splash_hpstate_5_18:
	.word 0x81982b1e  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
cwp_5_19:
    set user_data_start, %o7
	.word 0x93902002  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 37: RDPC	rd	%pc, %r8
	.word 0x8780204f  ! 38: WRASI_I	wr	%r0, 0x004f, %asi
DS_5_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b44306  ! 39: ALIGNADDRESS	alignaddr	%r17, %r6, %r8
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d903350  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x1350, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_5_22:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910013  ! 44: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_24) + 56, 16, 16)) -> intp(7,0,22)
intvec_5_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903cf8  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x1cf8, %pstate
	.word 0xab8027e1  ! 47: WR_CLEAR_SOFTINT_I	wr	%r0, 0x07e1, %clear_softint
memptr_5_25:
	set 0x60740000, %r31
	.word 0x85803fe7  ! 48: WRCCR_I	wr	%r0, 0x1fe7, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_5_26:
	.word 0x81982e8f  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	.word 0xe8900e40  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x72, %r20
	.word 0x8d90385c  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x185c, %pstate
	.word 0x91d02033  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_5_27:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 54: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 56: RDPC	rd	%pc, %r17
	.word 0x879023df  ! 57: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0xa2dac013  ! 58: SMULcc_R	smulcc 	%r11, %r19, %r17
	setx 0xf673886ea663a40d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_30:
	.word 0x81982554  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0xa1902003  ! 61: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_hpstate_5_31:
	.word 0x81982e95  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e95, %hpstate
donret_5_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_32-donret_5_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e000  ! 66: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0x87802088  ! 67: WRASI_I	wr	%r0, 0x0088, %asi
mondo_5_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94c000  ! 68: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_35:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 69: RDPC	rd	%pc, %r13
	.word 0x95a2cd33  ! 70: FsMULd	fsmuld	%f11, %f50, %f10
splash_hpstate_5_36:
	.word 0x81982aa5  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aa5, %hpstate
splash_cmpr_5_37:
	setx 0x303223742dc2cfff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_38:
	setx 0x2b2474fe8c0249db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_5_39:
	set user_data_start, %r31
	.word 0x8584a83e  ! 76: WRCCR_I	wr	%r18, 0x083e, %ccr
intveclr_5_40:
	setx 0xa60091f451e4dad0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd2800b00  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_htba_5_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_5_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_5_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_43:
	.word 0x8f902000  ! 82: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902004  ! 83: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_5_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x93d02034  ! 86: Tcc_I	tne	icc_or_xcc, %r0 + 52
memptr_5_45:
	set user_data_start, %r31
	.word 0x85853343  ! 87: WRCCR_I	wr	%r20, 0x1343, %ccr
	.word 0xd2d004a0  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_tba_5_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x5e9e1593bc8063c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cb3bb  ! 92: SDIVX_I	sdivx	%r18, 0xfffff3bb, %r9
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_5_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d904007  ! 94: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
splash_tba_5_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9b540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x879020b0  ! 98: WRPR_TT_I	wrpr	%r0, 0x00b0, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_5_51:
	setx 0x0926ee1c5f575ffb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_52-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_52:
	.word 0x91940001  ! 101: WRPR_PIL_R	wrpr	%r16, %r1, %pil
splash_tba_5_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b28305  ! 103: ALIGNADDRESS	alignaddr	%r10, %r5, %r10
cwp_5_55:
    set user_data_start, %o7
	.word 0x93902006  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d903ad2  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1ad2, %pstate
	.word 0x87802016  ! 106: WRASI_I	wr	%r0, 0x0016, %asi
DS_5_56:
	.word 0xa9a489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f20
	.word 0xad676dcc	! Random illegal ?
	.word 0xe9140011  ! 1: LDQF_R	-	[%r16, %r17], %f20
	.word 0x95a2882c  ! 107: FADDs	fadds	%f10, %f12, %f10
	.word 0x87802016  ! 108: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa190200f  ! 109: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_57:
	setx 0x37a5ed96b59c8f92, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_58)+40, 16, 16)) -> intp(5,1,3)
xir_5_58:
	.word 0xa9852622  ! 112: WR_SET_SOFTINT_I	wr	%r20, 0x0622, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_5_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
donret_5_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_60-donret_5_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa1902005  ! 116: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd297e010  ! 117: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0x91a00169  ! 119: FABSq	dis not found

memptr_5_61:
	set 0x60740000, %r31
	.word 0x85822bdd  ! 120: WRCCR_I	wr	%r8, 0x0bdd, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa1902008  ! 122: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_hpstate_5_62:
	.word 0x81982cdf  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdf, %hpstate
mondo_5_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d90000d  ! 124: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
splash_hpstate_5_64:
	.word 0x81982b9c  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9c, %hpstate
	.word 0xa3450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0x87902195  ! 127: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_65)+8, 16, 16)) -> intp(5,1,3)
xir_5_65:
	.word 0xa984f02b  ! 128: WR_SET_SOFTINT_I	wr	%r19, 0x102b, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_5_66:
	setx 0x84bc357932c0da45, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_67:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_5_68:
	set 0x60740000, %r31
	.word 0x85833647  ! 132: WRCCR_I	wr	%r12, 0x1647, %ccr
tagged_5_69:
	taddcctv %r8, 0x149f, %r4
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01965  ! 134: FqTOd	dis not found

splash_tba_5_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_72:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 136: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x9ba48d29  ! 137: FsMULd	fsmuld	%f18, %f40, %f44
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_5_73:
	setx 0x4100d9de78be5c85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa145c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xa9840001  ! 141: WR_SET_SOFTINT_R	wr	%r16, %r1, %set_softint
	.word 0x99a409d0  ! 142: FDIVd	fdivd	%f16, %f16, %f12
tagged_5_74:
	tsubcctv %r18, 0x1a56, %r5
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_5_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_5_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_76-donret_5_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d90229f  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x029f, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879022bb  ! 148: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_5_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_77:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_5_78:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_79:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_80) + 32, 16, 16)) -> intp(3,0,15)
intvec_5_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_81:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9844010  ! 155: WR_SET_SOFTINT_R	wr	%r17, %r16, %set_softint
splash_lsu_5_82:
	setx 0xf24749c83a3883a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_83:
	setx 0x150de76913ee4a41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_5_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802014  ! 160: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d903d8e  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1d8e, %pstate
	.word 0xa1902008  ! 162: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_5_86:
    set user_data_start, %o7
	.word 0x93902006  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
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
	.word 0xa5414000  ! 165: RDPC	rd	%pc, %r18
DS_5_88:
	.word 0xa3a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f48
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_5_89:
    set user_data_start, %o7
	.word 0x93902005  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01966  ! 168: FqTOd	dis not found

splash_cmpr_5_91:
	setx 0xfcd3da6f8639d82f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_93:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_94:
	setx 0xc93f7a49c835b9e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902000  ! 173: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 174: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 176: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a257e  ! 177: SDIVX_I	sdivx	%r8, 0x057e, %r20
tagged_5_97:
	taddcctv %r8, 0x137c, %r14
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_5_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76aadd4  ! 180: SDIVX_I	sdivx	%r10, 0x0dd4, %r19
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_100:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 181: RDPC	rd	%pc, %r13
intveclr_5_101:
	setx 0xb82ee394dca8b386, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 183: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69acd1  ! 184: SDIVX_I	sdivx	%r6, 0x0cd1, %r13
	.word 0x879023b2  ! 185: WRPR_TT_I	wrpr	%r0, 0x03b2, %tt
	.word 0xdac804a0  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
debug_5_103:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe000  ! 188: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
intveclr_5_104:
	setx 0x8a0623611ad19473, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02034  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_5_105:
	.word 0x8198253c  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x053c, %hpstate
debug_5_106:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_5_108:
	setx 0x3e2d86777fa3c811, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_5_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x919274c6  ! 198: WRPR_PIL_I	wrpr	%r9, 0x14c6, %pil
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 199: RDPC	rd	%pc, %r17
	.word 0x95a009c0  ! 200: FDIVd	fdivd	%f0, %f0, %f10
debug_5_111:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 201: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 202: FqTOd	dis not found

DS_5_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f2, %f12
	.word 0x99b00312  ! 203: ALIGNADDRESS	alignaddr	%r0, %r18, %r12
splash_tba_5_114:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 205: FqTOd	dis not found

intveclr_5_116:
	setx 0x24fb5b9b8fa237c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_5_117:
	.word 0x81982516  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0516, %hpstate
	.word 0x8790212e  ! 209: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
debug_5_118:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad8037de  ! 211: WR_SOFTINT_REG_I	wr	%r0, 0x17de, %softint
	.word 0x8d9030c4  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x10c4, %pstate
debug_5_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_5_121:
	setx 0xcbb474a56b5327f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_5_122:
	setx 0x9c98a8e5ddae6358, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_123:
	setx 0x02f358e4e2cecd99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_5_124:
	setx 0x6cc59e282d715274, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_125:
	setx 0x70fa3d697acccbf8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_5_126:
	tsubcctv %r10, 0x15d2, %r22
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_5_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196c  ! 226: FqTOd	dis not found

debug_5_129:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 227: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
tagged_5_130:
	tsubcctv %r7, 0x1643, %r25
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d903416  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x1416, %pstate
	.word 0x95a00169  ! 230: FABSq	dis not found

debug_5_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168f609  ! 233: SDIVX_I	sdivx	%r3, 0xfffff609, %r8
tagged_5_133:
	taddcctv %r8, 0x16ff, %r3
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_134:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 235: RDPC	rd	%pc, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99682135  ! 236: SDIVX_I	sdivx	%r0, 0x0135, %r12
	.word 0x8d902b9c  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0b9c, %pstate
DS_5_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_5_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_tba_5_138:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_5_139:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa1902004  ! 244: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_5_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0xa7a00167  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_5_141:
    set user_data_start, %o7
	.word 0x93902004  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_5_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d92c013  ! 250: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0xa190200c  ! 251: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_5_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa190200b  ! 255: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_5_145:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d902696  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x0696, %pstate
mondo_5_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d91c012  ! 261: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_148-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_148:
	.word 0x91910013  ! 262: WRPR_PIL_R	wrpr	%r4, %r19, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x31bc092c6dcf5097, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e020  ! 266: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
DS_5_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f20, %f12
	.word 0x93b4830d  ! 267: ALIGNADDRESS	alignaddr	%r18, %r13, %r9
	.word 0x8d902f16  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0f16, %pstate
splash_lsu_5_152:
	setx 0x8aa511034f9e21ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_153:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 270: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_5_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xfd48cff6	! Random illegal ?
	.word 0x95a089cc  ! 1: FDIVd	fdivd	%f2, %f12, %f10
	.word 0x9ba00833  ! 273: FADDs	fadds	%f0, %f19, %f13
	rd %pc, %r19
	add %r19, (ivw_5_157-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_157:
	.word 0x9193000c  ! 274: WRPR_PIL_R	wrpr	%r12, %r12, %pil
	.word 0x8d90218a  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x018a, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0x91414000  ! 277: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_159:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 278: RDPC	rd	%pc, %r10
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_5_160:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_161)+16, 16, 16)) -> intp(5,1,3)
xir_5_161:
	.word 0xa98078d8  ! 282: WR_SET_SOFTINT_I	wr	%r1, 0x18d8, %set_softint
tagged_5_162:
	tsubcctv %r15, 0x1f5a, %r10
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x91d02034  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 285: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_5_163:
	taddcctv %r23, 0x1fef, %r12
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802004  ! 287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9029e4  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x09e4, %pstate
debug_5_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_5_165:
	setx 0x7b755ef1cee897e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 291: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
debug_5_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_5_168:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_169:
	setx 0xc381758bbabef41b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_170:
	tsubcctv %r2, 0x1fe5, %r8
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902007  ! 297: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x9b6ac00b  ! 300: SDIVX_R	sdivx	%r11, %r11, %r13
	.word 0x8790227e  ! 301: WRPR_TT_I	wrpr	%r0, 0x027e, %tt
change_to_randtl_5_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_171:
	.word 0x8f902000  ! 302: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902006  ! 303: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_hpstate_5_172:
	.word 0x819823cc  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cc, %hpstate
	rd %pc, %r19
	add %r19, (ivw_5_173-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_173:
	.word 0x9192c00d  ! 305: WRPR_PIL_R	wrpr	%r11, %r13, %pil
cwp_5_174:
    set user_data_start, %o7
	.word 0x93902006  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
intveclr_5_175:
	setx 0x4efbffd4952af02b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_5_176:
	setx 0xf9d24aaca8bbb865, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c00d  ! 309: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 310: FqTOd	dis not found

	.word 0x8d903055  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1055, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790200f  ! 313: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 314: FqTOd	dis not found

	.word 0xd88fe020  ! 315: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
cwp_5_180:
    set user_data_start, %o7
	.word 0x93902007  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_hpstate_5_181:
	.word 0x819820d6  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
debug_5_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_5_183:
	.word 0x9ba0c9c9  ! 1: FDIVd	fdivd	%f34, %f40, %f44
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1108003  ! 1: LDQF_R	-	[%r2, %r3], %f8
	.word 0x99a34826  ! 319: FADDs	fadds	%f13, %f6, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 320: FqTOd	dis not found

DS_5_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_5_186:
	setx 0xe0281f95464169cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 323: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_5_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 178
change_to_randtl_5_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_188:
	.word 0x8f902000  ! 326: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_5_189:
	setx 0x522937dcc7d68bb3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 328: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_5_190:
	.word 0x8198294e  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_5_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903abf  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x1abf, %pstate
intveclr_5_192:
	setx 0xfa00ec0b77b2113d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 335: WRASI_I	wr	%r0, 0x0020, %asi
DS_5_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
tagged_5_194:
	tsubcctv %r12, 0x1f13, %r25
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_5_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_195:
	.word 0x8f902003  ! 338: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd4800c80  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_5_196:
	setx 0xf9d580eaf0e0059c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902011  ! 343: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad80e2dd  ! 345: WR_SOFTINT_REG_I	wr	%r3, 0x02dd, %softint
debug_5_198:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 346: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_5_199:
	taddcctv %r17, 0x1663, %r17
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_5_200:
	tsubcctv %r19, 0x17b2, %r15
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_5_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_201-donret_5_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_5_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 352: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	setx 0x1006d4bad11a19fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_5_204:
	setx 0x1239a0f3cf6d5d29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_205:
	set 0x60140000, %r31
	.word 0x85837d1a  ! 355: WRCCR_I	wr	%r13, 0x1d1a, %ccr
	.word 0xa190200e  ! 356: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa9a0016d  ! 358: FABSq	dis not found

	.word 0xa3540000  ! 359: RDPR_GL	rdpr	%-, %r17
change_to_randtl_5_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_206:
	.word 0x8f902000  ! 360: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d020b3  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xab828002  ! 362: WR_CLEAR_SOFTINT_R	wr	%r10, %r2, %clear_softint
	.word 0x8d903aef  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x1aef, %pstate
	.word 0x91d02035  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_5_207:
	setx 0x365cee13bf38f9d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_208:
	.word 0x819827dd  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
debug_5_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_5_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d900012  ! 368: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	setx 0x5c369cd4b7ea7475, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d9034e6  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x14e6, %pstate
	.word 0xa350c000  ! 372: RDPR_TT	rdpr	%tt, %r17
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd0800b60  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802058  ! 376: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8780201c  ! 377: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x9ba4cdd1  ! 378: FdMULq	fdmulq	
splash_tba_5_213:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 380: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 381: FqTOd	dis not found

splash_cmpr_5_215:
	setx 0x2541c23f4a0d55de, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_216:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 383: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	setx 0xb282f886433244f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 387: RDPC	rd	%pc, %r12
splash_hpstate_5_219:
	.word 0x81982abe  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0abe, %hpstate
splash_tba_5_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_5_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_222:
	setx 0xa1cf5753eb83d44c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x1d42d7339e5b8950, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ad03aad  ! 393: UMULcc_I	umulcc 	%r0, 0xfffffaad, %r13
	.word 0xd697e030  ! 394: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x83d020b5  ! 396: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa3703ad5  ! 397: POPC_I	popc	0x1ad5, %r17
splash_lsu_5_224:
	setx 0xb8a29e2108d629bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902372  ! 399: WRPR_TT_I	wrpr	%r0, 0x0372, %tt
splash_cmpr_5_225:
	setx 0x49393c7d7e5bca8c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_5_226:
	set 0x60540000, %r31
	.word 0x8581a9c5  ! 401: WRCCR_I	wr	%r6, 0x09c5, %ccr
cwp_5_227:
    set user_data_start, %o7
	.word 0x93902000  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802eb6  ! 403: SIR	sir	0x0eb6
mondo_5_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d90c013  ! 404: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0xab837e0c  ! 405: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1e0c, %clear_softint
	.word 0xa1902001  ! 406: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_5_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_5_230:
	tsubcctv %r3, 0x15b3, %r26
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x91540000  ! 409: RDPR_GL	rdpr	%-, %r8
mondo_5_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d90c001  ! 410: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
debug_5_232:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_233:
	setx 0x452cb66fa3cdacad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_5_235:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879021de  ! 416: WRPR_TT_I	wrpr	%r0, 0x01de, %tt
debug_5_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_5_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d90c006  ! 418: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
tagged_5_238:
	tsubcctv %r12, 0x16dc, %r24
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b79e1  ! 420: SDIVX_I	sdivx	%r13, 0xfffff9e1, %r12
	.word 0x87902312  ! 421: WRPR_TT_I	wrpr	%r0, 0x0312, %tt
	.word 0x91d02035  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd8d80e40  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b7305  ! 424: SDIVX_I	sdivx	%r13, 0xfffff305, %r12
	rd %pc, %r19
	add %r19, (ivw_5_241-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_241:
	.word 0x9193400a  ! 425: WRPR_PIL_R	wrpr	%r13, %r10, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c3404  ! 426: SDIVX_I	sdivx	%r16, 0xfffff404, %r20
splash_cmpr_5_243:
	setx 0x3235e2458eb08aaf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_244:
	setx 0x065b2cc0f769aa62, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b690009  ! 429: SDIVX_R	sdivx	%r4, %r9, %r13
	setx 0x4fa006a2e38bcda6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
pmu_5_247:
	nop
	setx 0xfffff323fffff77e, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_5_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_248:
	.word 0x8f902002  ! 433: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa1902006  ! 435: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_5_250:
	setx 0xc26f4fdbc29480a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_5_251:
	setx 0x0c46881db4665025, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_252:
	setx 0x0bffe8e06e564f23, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_253:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 443: RDPC	rd	%pc, %r8
splash_htba_5_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_5_255:
	taddcctv %r12, 0x1e89, %r16
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_5_256:
	set 0x60340000, %r31
	.word 0x8584668e  ! 446: WRCCR_I	wr	%r17, 0x068e, %ccr
tagged_5_257:
	taddcctv %r9, 0x111c, %r15
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x8780208a  ! 449: WRASI_I	wr	%r0, 0x008a, %asi
splash_tba_5_258:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b6c8005  ! 451: SDIVX_R	sdivx	%r18, %r5, %r13
	rd %pc, %r19
	add %r19, (ivw_5_259-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_259:
	.word 0x91918012  ! 452: WRPR_PIL_R	wrpr	%r6, %r18, %pil
	rd %pc, %r19
	add %r19, (ivw_5_260-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_260:
	.word 0x91924002  ! 453: WRPR_PIL_R	wrpr	%r9, %r2, %pil
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_261:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 454: RDPC	rd	%pc, %r10
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 455: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_262:
	setx 0x9f5c5fc9bf4540b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 457: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_5_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb30ae26  ! 1: STQF_I	-	%f13, [0x0e26, %r2]
	normalw
	.word 0x91458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r8
memptr_5_264:
	set user_data_start, %r31
	.word 0x85812756  ! 459: WRCCR_I	wr	%r4, 0x0756, %ccr
debug_5_265:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_5_266:
	setx 0x6c75b9e91516bbf8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a509c0  ! 463: FDIVd	fdivd	%f20, %f0, %f50
splash_htba_5_267:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e000  ! 465: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
splash_lsu_5_268:
	setx 0x2be68a86de8c7089, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x9522fe2970bc09f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_cmpr_5_270:
	setx 0xf2e650094e6f311c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_5_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e000  ! 472: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_5_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a4c9d2  ! 1: FDIVd	fdivd	%f50, %f18, %f12
	normalw
	.word 0xa3458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8790229a  ! 474: WRPR_TT_I	wrpr	%r0, 0x029a, %tt
splash_cmpr_5_273:
	setx 0x3e1467a60deb88fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f14, %f6
	.word 0xa1b30308  ! 476: ALIGNADDRESS	alignaddr	%r12, %r8, %r16
	.word 0x8d902779  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0779, %pstate
mondo_5_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d904010  ! 478: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_5_276:
	tsubcctv %r2, 0x198b, %r25
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_5_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x95450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd0cfe010  ! 484: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_5_278:
	setx 0xfeeece227644139c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_5_279:
    set user_data_start, %o7
	.word 0x93902001  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802867  ! 489: SIR	sir	0x0867
cwp_5_280:
    set user_data_start, %o7
	.word 0x93902007  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_5_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_281:
	.word 0x8f902002  ! 491: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
donret_5_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_282-donret_5_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d02034  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_5_283:
	setx 0x72b52de7ece8b868, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_284:
	setx 0x588de74376930fe3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_5_285:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_5_286:
	tsubcctv %r18, 0x1d42, %r4
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_4_0:
	set user_data_start, %r31
	.word 0x85836593  ! 2: WRCCR_I	wr	%r13, 0x0593, %ccr
DS_4_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa190200b  ! 5: WRPR_GL_I	wrpr	%r0, 0x000b, %-
change_to_randtl_4_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_2:
	.word 0x8f902002  ! 6: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_4_3:
	setx 0xfc9128da29745422, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d904012  ! 8: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x8780201c  ! 9: WRASI_I	wr	%r0, 0x001c, %asi
donret_4_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_5-donret_4_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_4_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_6:
	.word 0x8f902000  ! 11: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_4_7:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_4_8:
	setx 0xab76c19ed7042dcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028c3  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	.word 0x8790212d  ! 16: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_9:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 17: RDPC	rd	%pc, %r8
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_4_10:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_4_11:
    set user_data_start, %o7
	.word 0x93902007  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9b45c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8d903ba6  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x1ba6, %pstate
splash_lsu_4_12:
	setx 0x729a39a511a3555b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 25: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x95a00172  ! 26: FABSq	dis not found

splash_lsu_4_13:
	setx 0x480340c6d5773d5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_14:
	set 0x60740000, %r31
	.word 0x85847844  ! 28: WRCCR_I	wr	%r17, 0x1844, %ccr
splash_hpstate_4_15:
	.word 0x81982215  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0215, %hpstate
	.word 0x9b464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x91d020b5  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_4_16:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_4_17:
    set user_data_start, %o7
	.word 0x93902005  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe4880e60  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
splash_hpstate_4_18:
	.word 0x81982965  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0965, %hpstate
cwp_4_19:
    set user_data_start, %o7
	.word 0x93902000  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_20:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 37: RDPC	rd	%pc, %r11
	.word 0x87802004  ! 38: WRASI_I	wr	%r0, 0x0004, %asi
DS_4_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa9b44311  ! 39: ALIGNADDRESS	alignaddr	%r17, %r17, %r20
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d9026e6  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x06e6, %pstate
	.word 0xe8c80e60  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r20
debug_4_22:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d918006  ! 44: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_24) + 48, 16, 16)) -> intp(4,0,21)
intvec_4_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902189  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0189, %pstate
	.word 0xab82e9e1  ! 47: WR_CLEAR_SOFTINT_I	wr	%r11, 0x09e1, %clear_softint
memptr_4_25:
	set 0x60340000, %r31
	.word 0x8584ae3c  ! 48: WRCCR_I	wr	%r18, 0x0e3c, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_4_26:
	.word 0x8198298f  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d902220  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0220, %pstate
	.word 0x91d02033  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 51
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
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 54: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 56: RDPC	rd	%pc, %r20
	.word 0x87902068  ! 57: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
	.word 0xa6d9c00c  ! 58: SMULcc_R	smulcc 	%r7, %r12, %r19
	setx 0x562ef9f3b7dcdf5b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_30:
	.word 0x81982d5d  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
	.word 0xa190200c  ! 61: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_hpstate_4_31:
	.word 0x81982304  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0304, %hpstate
donret_4_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_32-donret_4_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01963  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e030  ! 66: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x87802083  ! 67: WRASI_I	wr	%r0, 0x0083, %asi
mondo_4_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d950014  ! 68: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_35:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 69: RDPC	rd	%pc, %r9
	.word 0x95a18d28  ! 70: FsMULd	fsmuld	%f6, %f8, %f10
splash_hpstate_4_36:
	.word 0x819827fc  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07fc, %hpstate
splash_cmpr_4_37:
	setx 0xcf00937035c12255, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_38:
	setx 0x003cc7c88cc24ba0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_4_39:
	set user_data_start, %r31
	.word 0x8581f3a9  ! 76: WRCCR_I	wr	%r7, 0x13a9, %ccr
intveclr_4_40:
	setx 0x08a6b2bb4ef6d8b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd2800b00  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_htba_4_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_4_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_43:
	.word 0x8f902002  ! 82: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902009  ! 83: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_4_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d02033  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 51
memptr_4_45:
	set user_data_start, %r31
	.word 0x8580e636  ! 87: WRCCR_I	wr	%r3, 0x0636, %ccr
	.word 0xd2d00e40  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r9
splash_tba_4_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x1a27fef2a764c22e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36a7ea4  ! 92: SDIVX_I	sdivx	%r9, 0xfffffea4, %r17
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_4_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d92400b  ! 94: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
splash_tba_4_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b5  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x91540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x879021f4  ! 98: WRPR_TT_I	wrpr	%r0, 0x01f4, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_4_51:
	setx 0xb0e3eef16ed47dc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_52-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_52:
	.word 0x9193000d  ! 101: WRPR_PIL_R	wrpr	%r12, %r13, %pil
splash_tba_4_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b18314  ! 103: ALIGNADDRESS	alignaddr	%r6, %r20, %r11
cwp_4_55:
    set user_data_start, %o7
	.word 0x93902005  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90207d  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x007d, %pstate
	.word 0x87802088  ! 106: WRASI_I	wr	%r0, 0x0088, %asi
DS_4_56:
	.word 0xa1a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f16
	.word 0xdb46ec5e	! Random illegal ?
	.word 0xd514800c  ! 1: LDQF_R	-	[%r18, %r12], %f10
	.word 0x93a20827  ! 107: FADDs	fadds	%f8, %f7, %f9
	.word 0x87802020  ! 108: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa190200c  ! 109: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 110: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_4_57:
	setx 0x144997f6dfa18f45, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_58)+0, 16, 16)) -> intp(4,1,3)
xir_4_58:
	.word 0xa9812c6f  ! 112: WR_SET_SOFTINT_I	wr	%r4, 0x0c6f, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_4_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
donret_4_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_60-donret_4_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa190200c  ! 116: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd297e010  ! 117: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0xa3a0016a  ! 119: FABSq	dis not found

memptr_4_61:
	set 0x60140000, %r31
	.word 0x85813d22  ! 120: WRCCR_I	wr	%r4, 0x1d22, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa1902007  ! 122: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_hpstate_4_62:
	.word 0x819820dd  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
mondo_4_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d90c003  ! 124: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
splash_hpstate_4_64:
	.word 0x819825d4  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0xa7450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x879021fe  ! 127: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_65)+8, 16, 16)) -> intp(4,1,3)
xir_4_65:
	.word 0xa98338b1  ! 128: WR_SET_SOFTINT_I	wr	%r12, 0x18b1, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_4_66:
	setx 0xdb09113b00e02e11, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_67:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_4_68:
	set 0x60140000, %r31
	.word 0x85826dba  ! 132: WRCCR_I	wr	%r9, 0x0dba, %ccr
tagged_4_69:
	taddcctv %r16, 0x1686, %r9
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196d  ! 134: FqTOd	dis not found

splash_tba_4_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_72:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_72:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_72
    nop
debug_wait4_72:
    ld [%r23], %r2
    brnz %r2, debug_wait4_72
    nop
    ba,a debug_startwait4_72
continue_debug_4_72:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_72:
    cmp %r13, %r15
    bne,a wait_for_stat_4_72
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_72:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_72
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 136: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x9ba34d22  ! 137: FsMULd	fsmuld	%f13, %f2, %f44
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_4_73:
	setx 0xde47e686628efa13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa9840005  ! 141: WR_SET_SOFTINT_R	wr	%r16, %r5, %set_softint
	.word 0x9ba009d3  ! 142: FDIVd	fdivd	%f0, %f50, %f44
tagged_4_74:
	tsubcctv %r17, 0x14f7, %r15
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_4_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_4_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_76-donret_4_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d90237c  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x037c, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879022f4  ! 148: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_4_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_77:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_4_78:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_79:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_80) + 24, 16, 16)) -> intp(3,0,15)
intvec_4_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_81:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa981c008  ! 155: WR_SET_SOFTINT_R	wr	%r7, %r8, %set_softint
splash_lsu_4_82:
	setx 0x9e31fbdc53d8add1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_83:
	setx 0x2ec82088b56c190d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_4_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802080  ! 160: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d9037d1  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x17d1, %pstate
	.word 0xa1902002  ! 162: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_4_86:
    set user_data_start, %o7
	.word 0x93902001  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
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
	.word 0x91414000  ! 165: RDPC	rd	%pc, %r8
DS_4_88:
	.word 0x93a089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f40
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_4_89:
    set user_data_start, %o7
	.word 0x93902001  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 168: FqTOd	dis not found

splash_cmpr_4_91:
	setx 0x1e78a20449242a09, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_93:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_94:
	setx 0x7ca98f3773ad7936, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200a  ! 173: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196d  ! 176: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368764e  ! 177: SDIVX_I	sdivx	%r1, 0xfffff64e, %r9
tagged_4_97:
	taddcctv %r2, 0x10d0, %r17
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_4_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a36c9  ! 180: SDIVX_I	sdivx	%r8, 0xfffff6c9, %r10
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_100:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 181: RDPC	rd	%pc, %r20
intveclr_4_101:
	setx 0xb36cd35b47aa5e5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 183: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cb3f0  ! 184: SDIVX_I	sdivx	%r18, 0xfffff3f0, %r10
	.word 0x879023ad  ! 185: WRPR_TT_I	wrpr	%r0, 0x03ad, %tt
	.word 0xdac804a0  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
debug_4_103:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe030  ! 188: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
intveclr_4_104:
	setx 0xa7d2bace983a3f25, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 191: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_hpstate_4_105:
	.word 0x81982897  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0897, %hpstate
debug_4_106:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_4_108:
	setx 0xeecfff0e5800aef5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_4_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9192ea03  ! 198: WRPR_PIL_I	wrpr	%r11, 0x0a03, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 199: RDPC	rd	%pc, %r19
	.word 0xa1a409c4  ! 200: FDIVd	fdivd	%f16, %f4, %f16
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
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 201: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01971  ! 202: FqTOd	dis not found

DS_4_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f16, %f22
	.word 0x99b14308  ! 203: ALIGNADDRESS	alignaddr	%r5, %r8, %r12
splash_tba_4_114:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01960  ! 205: FqTOd	dis not found

intveclr_4_116:
	setx 0x317fc352854a988b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_4_117:
	.word 0x819824bd  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04bd, %hpstate
	.word 0x87902000  ! 209: WRPR_TT_I	wrpr	%r0, 0x0000, %tt
debug_4_118:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad82b8cd  ! 211: WR_SOFTINT_REG_I	wr	%r10, 0x18cd, %softint
	.word 0x8d9027d9  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x07d9, %pstate
debug_4_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_4_121:
	setx 0xfaf972512e50567f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_4_122:
	setx 0x8d9f1d003bc8fa7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_123:
	setx 0xd84039c8f6c9660f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_4_124:
	setx 0xd169dd46d9a58155, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_125:
	setx 0x07529c3a159d17ed, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_4_126:
	tsubcctv %r9, 0x1a04, %r20
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_4_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01963  ! 226: FqTOd	dis not found

debug_4_129:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_129:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_129
    nop
debug_wait4_129:
    ld [%r23], %r2
    brnz %r2, debug_wait4_129
    nop
    ba,a debug_startwait4_129
continue_debug_4_129:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_129:
    cmp %r13, %r15
    bne,a wait_for_stat_4_129
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_129:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_129
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 227: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
tagged_4_130:
	tsubcctv %r12, 0x1a2e, %r20
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d90262c  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x062c, %pstate
	.word 0x91a00164  ! 230: FABSq	dis not found

debug_4_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a7cac  ! 233: SDIVX_I	sdivx	%r9, 0xfffffcac, %r13
tagged_4_133:
	taddcctv %r22, 0x1f33, %r25
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_134:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 235: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996862b2  ! 236: SDIVX_I	sdivx	%r1, 0x02b2, %r12
	.word 0x8d9030da  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x10da, %pstate
DS_4_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_4_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
splash_tba_4_138:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa190200b  ! 244: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_4_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0x9ba00170  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_4_141:
    set user_data_start, %o7
	.word 0x93902006  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_4_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d91c011  ! 250: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0xa1902000  ! 251: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_4_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa1902004  ! 255: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_4_145:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196b  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d903a48  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1a48, %pstate
mondo_4_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 261: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_148-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_148:
	.word 0x91904011  ! 262: WRPR_PIL_R	wrpr	%r1, %r17, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x632d02259ed7b1e6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e010  ! 266: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
DS_4_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f12, %f30
	.word 0x95b30310  ! 267: ALIGNADDRESS	alignaddr	%r12, %r16, %r10
	.word 0x8d902fb4  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0fb4, %pstate
splash_lsu_4_152:
	setx 0x52aeeaabefc86b41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 270: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_4_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdd42954f	! Random illegal ?
	.word 0x93a009c9  ! 1: FDIVd	fdivd	%f0, %f40, %f40
	.word 0x9ba24833  ! 273: FADDs	fadds	%f9, %f19, %f13
	rd %pc, %r19
	add %r19, (ivw_4_157-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_157:
	.word 0x9193000b  ! 274: WRPR_PIL_R	wrpr	%r12, %r11, %pil
	.word 0x8d902cf9  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0cf9, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0x9b414000  ! 277: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_159:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 278: RDPC	rd	%pc, %r13
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_4_160:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_161)+32, 16, 16)) -> intp(4,1,3)
xir_4_161:
	.word 0xa980e30a  ! 282: WR_SET_SOFTINT_I	wr	%r3, 0x030a, %set_softint
tagged_4_162:
	tsubcctv %r21, 0x1795, %r15
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x91d02032  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_163:
	taddcctv %r19, 0x1dee, %r15
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802004  ! 287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902449  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
debug_4_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_4_165:
	setx 0x46ca7d8a614f5a61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d948009  ! 291: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
debug_4_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_4_168:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_169:
	setx 0xdc0b104da66649d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_170:
	tsubcctv %r25, 0x1667, %r11
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902008  ! 297: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x9b6cc011  ! 300: SDIVX_R	sdivx	%r19, %r17, %r13
	.word 0x879022f8  ! 301: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
change_to_randtl_4_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_171:
	.word 0x8f902002  ! 302: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa190200d  ! 303: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_hpstate_4_172:
	.word 0x81982d4f  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	rd %pc, %r19
	add %r19, (ivw_4_173-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_173:
	.word 0x91948002  ! 305: WRPR_PIL_R	wrpr	%r18, %r2, %pil
cwp_4_174:
    set user_data_start, %o7
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_4_175:
	setx 0xb599265373c9e2da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_176:
	setx 0x09cbcfcb1e88f756, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d92400c  ! 309: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 310: FqTOd	dis not found

	.word 0x8d9034c9  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x14c9, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790208d  ! 313: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01968  ! 314: FqTOd	dis not found

	.word 0xd88fe020  ! 315: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
cwp_4_180:
    set user_data_start, %o7
	.word 0x93902007  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_hpstate_4_181:
	.word 0x81982b9d  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
debug_4_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_4_183:
	.word 0x99a009ca  ! 1: FDIVd	fdivd	%f0, %f10, %f12
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb144014  ! 1: LDQF_R	-	[%r17, %r20], %f13
	.word 0x93a1082d  ! 319: FADDs	fadds	%f4, %f13, %f9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01964  ! 320: FqTOd	dis not found

DS_4_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_4_186:
	setx 0xebb40bc78a9e3582, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 323: WRPR_GL_I	wrpr	%r0, 0x0007, %-
debug_4_187:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d020b4  ! 325: Tcc_I	tne	icc_or_xcc, %r0 + 180
change_to_randtl_4_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_188:
	.word 0x8f902001  ! 326: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_4_189:
	setx 0x3c7c49c8cc1130bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 328: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_4_190:
	.word 0x8198220f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020f, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_4_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902fc0  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x0fc0, %pstate
intveclr_4_192:
	setx 0xb855d7dbaa2ebf31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 335: WRASI_I	wr	%r0, 0x0089, %asi
DS_4_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
tagged_4_194:
	tsubcctv %r16, 0x1b53, %r17
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_4_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_195:
	.word 0x8f902002  ! 338: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd4800c00  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_4_196:
	setx 0x3698259374c3cc82, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x879023e7  ! 343: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad837bc5  ! 345: WR_SOFTINT_REG_I	wr	%r13, 0x1bc5, %softint
debug_4_198:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_198:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_198
    nop
debug_wait4_198:
    ld [%r23], %r2
    brnz %r2, debug_wait4_198
    nop
    ba,a debug_startwait4_198
continue_debug_4_198:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_198:
    cmp %r13, %r15
    bne,a wait_for_stat_4_198
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_198:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_198
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 346: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_4_199:
	taddcctv %r23, 0x1940, %r19
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_4_200:
	tsubcctv %r17, 0x110b, %r10
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_4_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_201-donret_4_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_4_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d934011  ! 352: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	setx 0x7b0a244cd2547a66, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_204:
	setx 0xf50a58fbf3d49219, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_205:
	set 0x60740000, %r31
	.word 0x85833fe5  ! 355: WRCCR_I	wr	%r12, 0x1fe5, %ccr
	.word 0xa1902008  ! 356: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x97a00174  ! 358: FABSq	dis not found

	.word 0x97540000  ! 359: RDPR_GL	<illegal instruction>
change_to_randtl_4_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_206:
	.word 0x8f902000  ! 360: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x83d02035  ! 361: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xab81800a  ! 362: WR_CLEAR_SOFTINT_R	wr	%r6, %r10, %clear_softint
	.word 0x8d902d34  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x0d34, %pstate
	.word 0x91d02033  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_4_207:
	setx 0x7ad8b852553cea7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_208:
	.word 0x819821df  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
debug_4_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_4_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 368: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	setx 0xbd6907e137cd9775, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d9038c0  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x18c0, %pstate
	.word 0x9350c000  ! 372: RDPR_TT	<illegal instruction>
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd08008a0  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802055  ! 376: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802004  ! 377: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa3a14dca  ! 378: FdMULq	fdmulq	
splash_tba_4_213:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02035  ! 380: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01960  ! 381: FqTOd	dis not found

splash_cmpr_4_215:
	setx 0xa46fe04215334e48, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_216:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_216:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_216
    nop
debug_wait4_216:
    ld [%r23], %r2
    brnz %r2, debug_wait4_216
    nop
    ba,a debug_startwait4_216
continue_debug_4_216:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_216:
    cmp %r13, %r15
    bne,a wait_for_stat_4_216
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_216:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_216
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 383: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	setx 0x2c4b8b31b6c83982, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 387: RDPC	rd	%pc, %r13
splash_hpstate_4_219:
	.word 0x81982dde  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
splash_tba_4_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_222:
	setx 0x1b4632bb3cf14df6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xcb67f00ce9b68049, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa8d4fd26  ! 393: UMULcc_I	umulcc 	%r19, 0xfffffd26, %r20
	.word 0xd697e010  ! 394: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x93d020b2  ! 396: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x95703cab  ! 397: POPC_I	popc	0x1cab, %r10
splash_lsu_4_224:
	setx 0x4f1a9e55a8710ebb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022a1  ! 399: WRPR_TT_I	wrpr	%r0, 0x02a1, %tt
splash_cmpr_4_225:
	setx 0x95a8b5d1fc4a7d7f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_226:
	set 0x60740000, %r31
	.word 0x8584270a  ! 401: WRCCR_I	wr	%r16, 0x070a, %ccr
cwp_4_227:
    set user_data_start, %o7
	.word 0x93902001  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f8021a6  ! 403: SIR	sir	0x01a6
mondo_4_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 404: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0xab80e809  ! 405: WR_CLEAR_SOFTINT_I	wr	%r3, 0x0809, %clear_softint
	.word 0xa190200a  ! 406: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_4_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_4_230:
	tsubcctv %r19, 0x1d88, %r20
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0xa9540000  ! 409: RDPR_GL	rdpr	%-, %r20
mondo_4_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 410: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
debug_4_232:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_233:
	setx 0xbaf995fcbeb3f703, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_4_235:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790237d  ! 416: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
debug_4_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_4_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944006  ! 418: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
tagged_4_238:
	tsubcctv %r8, 0x16ea, %r6
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d3f0e  ! 420: SDIVX_I	sdivx	%r20, 0xffffff0e, %r12
	.word 0x8790204d  ! 421: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
	.word 0x91d020b5  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c6364  ! 424: SDIVX_I	sdivx	%r17, 0x0364, %r17
	rd %pc, %r19
	add %r19, (ivw_4_241-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_241:
	.word 0x91904004  ! 425: WRPR_PIL_R	wrpr	%r1, %r4, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c233a  ! 426: SDIVX_I	sdivx	%r16, 0x033a, %r20
splash_cmpr_4_243:
	setx 0x631392bc4ed468bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_244:
	setx 0x9272317b00dfa301, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x996c8009  ! 429: SDIVX_R	sdivx	%r18, %r9, %r12
	setx 0x069f2488adea380a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
pmu_4_247:
	nop
	setx 0xfffff82ffffffab3, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_248:
	.word 0x8f902002  ! 433: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa190200f  ! 435: WRPR_GL_I	wrpr	%r0, 0x000f, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_4_250:
	setx 0x98767964c2052eb1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800b00  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
splash_lsu_4_251:
	setx 0xba9acbae63c24709, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_252:
	setx 0xd380cccd6aead2de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x95540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_253:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 443: RDPC	rd	%pc, %r10
splash_htba_4_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_4_255:
	taddcctv %r3, 0x1458, %r2
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_4_256:
	set 0x60540000, %r31
	.word 0x8584f5e9  ! 446: WRCCR_I	wr	%r19, 0x15e9, %ccr
tagged_4_257:
	taddcctv %r16, 0x1083, %r7
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802004  ! 449: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_4_258:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x956a8009  ! 451: SDIVX_R	sdivx	%r10, %r9, %r10
	rd %pc, %r19
	add %r19, (ivw_4_259-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_259:
	.word 0x9191c005  ! 452: WRPR_PIL_R	wrpr	%r7, %r5, %pil
	rd %pc, %r19
	add %r19, (ivw_4_260-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_260:
	.word 0x91918005  ! 453: WRPR_PIL_R	wrpr	%r6, %r5, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_261:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 454: RDPC	rd	%pc, %r13
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_262:
	setx 0xeee1030cf10f6caa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_4_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb34eb4a  ! 1: STQF_I	-	%f13, [0x0b4a, %r19]
	normalw
	.word 0x99458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r12
memptr_4_264:
	set user_data_start, %r31
	.word 0x8582bbca  ! 459: WRCCR_I	wr	%r10, 0x1bca, %ccr
debug_4_265:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_4_266:
	setx 0x758cf8bc5fbde967, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a209c4  ! 463: FDIVd	fdivd	%f8, %f4, %f16
splash_htba_4_267:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e030  ! 465: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
splash_lsu_4_268:
	setx 0xbe0f0c3206685f41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xe8d326bdabd69844, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_cmpr_4_270:
	setx 0x6384a269c940172a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_4_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e000  ! 472: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_4_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f10
	normalw
	.word 0x95458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x87902339  ! 474: WRPR_TT_I	wrpr	%r0, 0x0339, %tt
splash_cmpr_4_273:
	setx 0x3ddc93368e370e10, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f6, %f30
	.word 0xa5b0c312  ! 476: ALIGNADDRESS	alignaddr	%r3, %r18, %r18
	.word 0x8d9020e0  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x00e0, %pstate
mondo_4_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 478: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_4_276:
	tsubcctv %r15, 0x1274, %r10
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_4_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x93450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xd0cfe020  ! 484: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_4_278:
	setx 0x8350adfcf94f61d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_4_279:
    set user_data_start, %o7
	.word 0x93902005  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f8025f1  ! 489: SIR	sir	0x05f1
cwp_4_280:
    set user_data_start, %o7
	.word 0x93902001  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_4_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_281:
	.word 0x8f902001  ! 491: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
donret_4_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_282-donret_4_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d02033  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_4_283:
	setx 0xebd83c4d489351f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_284:
	setx 0x87cecbd2ba6447a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_4_285:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_286:
	tsubcctv %r2, 0x1cd1, %r24
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_3_0:
	set user_data_start, %r31
	.word 0x8580f106  ! 2: WRCCR_I	wr	%r3, 0x1106, %ccr
DS_3_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa1902004  ! 5: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_3_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_2:
	.word 0x8f902000  ! 6: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_3_3:
	setx 0x2926439ca28e567b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d928010  ! 8: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0x87802014  ! 9: WRASI_I	wr	%r0, 0x0014, %asi
donret_3_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_5-donret_3_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_3_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_6:
	.word 0x8f902002  ! 11: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
cwp_3_7:
    set user_data_start, %o7
	.word 0x93902007  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_3_8:
	setx 0x037626ba4dbc9ec7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9024c6  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x04c6, %pstate
	.word 0x87902154  ! 16: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_9:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 17: RDPC	rd	%pc, %r10
	.word 0xd8c80e80  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
debug_3_10:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_3_11:
    set user_data_start, %o7
	.word 0x93902000  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9b45c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8d902f5f  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0f5f, %pstate
splash_lsu_3_12:
	setx 0x14933c4fa204ab33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 25: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa3a0016d  ! 26: FABSq	dis not found

splash_lsu_3_13:
	setx 0x294d579b062aa6ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_14:
	set 0x60140000, %r31
	.word 0x8580e8f4  ! 28: WRCCR_I	wr	%r3, 0x08f4, %ccr
splash_hpstate_3_15:
	.word 0x81982b74  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b74, %hpstate
	.word 0x93464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x93d020b4  ! 31: Tcc_I	tne	icc_or_xcc, %r0 + 180
debug_3_16:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_3_17:
    set user_data_start, %o7
	.word 0x93902005  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe4880e80  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
splash_hpstate_3_18:
	.word 0x81982e14  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e14, %hpstate
cwp_3_19:
    set user_data_start, %o7
	.word 0x93902006  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_20:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 37: RDPC	rd	%pc, %r16
	.word 0x87802058  ! 38: WRASI_I	wr	%r0, 0x0058, %asi
DS_3_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa7b04304  ! 39: ALIGNADDRESS	alignaddr	%r1, %r4, %r19
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d90359f  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x159f, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_3_22:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d910010  ! 44: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_24) + 0, 16, 16)) -> intp(5,0,8)
intvec_3_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032a9  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x12a9, %pstate
	.word 0xab823fd6  ! 47: WR_CLEAR_SOFTINT_I	wr	%r8, 0x1fd6, %clear_softint
memptr_3_25:
	set 0x60540000, %r31
	.word 0x8583335f  ! 48: WRCCR_I	wr	%r12, 0x135f, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_3_26:
	.word 0x819821c7  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d902a6a  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0a6a, %pstate
	.word 0x91d02032  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_3_27:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 54: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_28:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 56: RDPC	rd	%pc, %r9
	.word 0x87902248  ! 57: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
	.word 0x92dc0012  ! 58: SMULcc_R	smulcc 	%r16, %r18, %r9
	setx 0x220b55a5f6cab886, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_30:
	.word 0x819828ec  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ec, %hpstate
	.word 0xa1902006  ! 61: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_hpstate_3_31:
	.word 0x8198221c  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021c, %hpstate
donret_3_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_32-donret_3_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e030  ! 66: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
mondo_3_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 68: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_35:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 69: RDPC	rd	%pc, %r11
	.word 0xa3a14d24  ! 70: FsMULd	fsmuld	%f5, %f4, %f48
splash_hpstate_3_36:
	.word 0x81982317  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
splash_cmpr_3_37:
	setx 0x299818976dc9df69, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_38:
	setx 0x1894e32ef7ca894f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_3_39:
	set user_data_start, %r31
	.word 0x85836c10  ! 76: WRCCR_I	wr	%r13, 0x0c10, %ccr
intveclr_3_40:
	setx 0xa20eeb76c84fd677, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd2800b40  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
splash_htba_3_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_3_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93d02033  ! 81: Tcc_I	tne	icc_or_xcc, %r0 + 51
change_to_randtl_3_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_43:
	.word 0x8f902002  ! 82: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa190200b  ! 83: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_3_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d02035  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 53
memptr_3_45:
	set user_data_start, %r31
	.word 0x8582fd7e  ! 87: WRCCR_I	wr	%r11, 0x1d7e, %ccr
	.word 0xd2d004a0  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_tba_3_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xa7f247462ae2895c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16af2af  ! 92: SDIVX_I	sdivx	%r11, 0xfffff2af, %r16
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_3_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
splash_tba_3_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02035  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9b540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x87902001  ! 98: WRPR_TT_I	wrpr	%r0, 0x0001, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_3_51:
	setx 0x56b43f7e9180a851, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_52-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_52:
	.word 0x91944006  ! 101: WRPR_PIL_R	wrpr	%r17, %r6, %pil
splash_tba_3_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b1830a  ! 103: ALIGNADDRESS	alignaddr	%r6, %r10, %r18
cwp_3_55:
    set user_data_start, %o7
	.word 0x93902002  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d903d38  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1d38, %pstate
	.word 0x87802020  ! 106: WRASI_I	wr	%r0, 0x0020, %asi
DS_3_56:
	.word 0x9ba449cc  ! 1: FDIVd	fdivd	%f48, %f12, %f44
	.word 0xed589064	! Random illegal ?
	.word 0xe7144007  ! 1: LDQF_R	-	[%r17, %r7], %f19
	.word 0x99a1882a  ! 107: FADDs	fadds	%f6, %f10, %f12
	.word 0x8780204f  ! 108: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa1902001  ! 109: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 110: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_3_57:
	setx 0xbc2ddd3e39513e22, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_58)+0, 16, 16)) -> intp(3,1,3)
xir_3_58:
	.word 0xa982a95a  ! 112: WR_SET_SOFTINT_I	wr	%r10, 0x095a, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_3_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_3_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_60-donret_3_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa190200a  ! 116: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd297e020  ! 117: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0x97a00171  ! 119: FABSq	dis not found

memptr_3_61:
	set 0x60740000, %r31
	.word 0x85836bec  ! 120: WRCCR_I	wr	%r13, 0x0bec, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa190200e  ! 122: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_hpstate_3_62:
	.word 0x819829c6  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c6, %hpstate
mondo_3_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d930008  ! 124: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
splash_hpstate_3_64:
	.word 0x81982b1d  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0xa5450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0x87902278  ! 127: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_65)+24, 16, 16)) -> intp(3,1,3)
xir_3_65:
	.word 0xa9847020  ! 128: WR_SET_SOFTINT_I	wr	%r17, 0x1020, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_3_66:
	setx 0xefb97bc80fe14a51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_67:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_3_68:
	set 0x60540000, %r31
	.word 0x858435a8  ! 132: WRCCR_I	wr	%r16, 0x15a8, %ccr
tagged_3_69:
	taddcctv %r14, 0x1fa1, %r15
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 134: FqTOd	dis not found

splash_tba_3_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_72:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 136: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x93a4cd2c  ! 137: FsMULd	fsmuld	%f19, %f12, %f40
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_3_73:
	setx 0x9a2a64eea9565477, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9545c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xa982c003  ! 141: WR_SET_SOFTINT_R	wr	%r11, %r3, %set_softint
	.word 0x93a1c9d2  ! 142: FDIVd	fdivd	%f38, %f18, %f40
tagged_3_74:
	tsubcctv %r23, 0x105b, %r26
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_3_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
donret_3_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_76-donret_3_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d90251c  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x051c, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x87902056  ! 148: WRPR_TT_I	wrpr	%r0, 0x0056, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_3_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_77:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_3_78:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_79:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_80) + 56, 16, 16)) -> intp(4,0,22)
intvec_3_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_81:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9848002  ! 155: WR_SET_SOFTINT_R	wr	%r18, %r2, %set_softint
splash_lsu_3_82:
	setx 0x07eae1fe3d5e95af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_83:
	setx 0x057b2bae927acc01, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_3_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802010  ! 160: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d90231f  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x031f, %pstate
	.word 0xa1902008  ! 162: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_3_86:
    set user_data_start, %o7
	.word 0x93902007  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
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
	.word 0xa3414000  ! 165: RDPC	rd	%pc, %r17
DS_3_88:
	.word 0x95a089ca  ! 1: FDIVd	fdivd	%f2, %f10, %f10
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_3_89:
    set user_data_start, %o7
	.word 0x93902000  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196c  ! 168: FqTOd	dis not found

splash_cmpr_3_91:
	setx 0x8333d8550abf1353, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_93:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_94:
	setx 0xac104eb2852ddc87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 173: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 176: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b27c3  ! 177: SDIVX_I	sdivx	%r12, 0x07c3, %r11
tagged_3_97:
	taddcctv %r17, 0x1a52, %r1
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_3_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ce237  ! 180: SDIVX_I	sdivx	%r19, 0x0237, %r10
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_100:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
intveclr_3_101:
	setx 0x67f07d3479903e9c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 183: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b35e2  ! 184: SDIVX_I	sdivx	%r12, 0xfffff5e2, %r12
	.word 0x87902242  ! 185: WRPR_TT_I	wrpr	%r0, 0x0242, %tt
	.word 0xdac80e40  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r13
debug_3_103:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe020  ! 188: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
intveclr_3_104:
	setx 0x17c5751e50d3f751, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 191: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_hpstate_3_105:
	.word 0x81982b2f  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b2f, %hpstate
debug_3_106:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_3_108:
	setx 0x9084672a50f21bdd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_3_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x919167ba  ! 198: WRPR_PIL_I	wrpr	%r5, 0x07ba, %pil
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_110:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 199: RDPC	rd	%pc, %r10
	.word 0xa7a149d3  ! 200: FDIVd	fdivd	%f36, %f50, %f50
debug_3_111:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 201: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196c  ! 202: FqTOd	dis not found

DS_3_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f6, %f28
	.word 0x93b40306  ! 203: ALIGNADDRESS	alignaddr	%r16, %r6, %r9
splash_tba_3_114:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01964  ! 205: FqTOd	dis not found

intveclr_3_116:
	setx 0x78ed9017bf2e6c85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_3_117:
	.word 0x81982485  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
	.word 0x879021c7  ! 209: WRPR_TT_I	wrpr	%r0, 0x01c7, %tt
debug_3_118:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad84ee3f  ! 211: WR_SOFTINT_REG_I	wr	%r19, 0x0e3f, %softint
	.word 0x8d902268  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x0268, %pstate
debug_3_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02034  ! 214: Tcc_I	tne	icc_or_xcc, %r0 + 52
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_3_121:
	setx 0x63d57ba9bb89d1a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_3_122:
	setx 0xb9fad25d50b04c5f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_123:
	setx 0x51f1decc841388a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_3_124:
	setx 0xd2ea9fa516754f57, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_125:
	setx 0x388f26b5fe8c1e23, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_3_126:
	tsubcctv %r1, 0x15b1, %r20
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_3_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196d  ! 226: FqTOd	dis not found

debug_3_129:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 227: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
tagged_3_130:
	tsubcctv %r2, 0x1458, %r16
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d9036b2  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x16b2, %pstate
	.word 0x93a00160  ! 230: FABSq	dis not found

debug_3_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16cecab  ! 233: SDIVX_I	sdivx	%r19, 0x0cab, %r16
tagged_3_133:
	taddcctv %r7, 0x14e8, %r1
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_134:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 235: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cf975  ! 236: SDIVX_I	sdivx	%r19, 0xfffff975, %r8
	.word 0x8d90373e  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x173e, %pstate
DS_3_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_3_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_tba_3_138:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_3_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa190200b  ! 244: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_3_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0x97a00171  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_3_141:
    set user_data_start, %o7
	.word 0x93902001  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_3_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 250: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xa1902000  ! 251: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe4800b00  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
debug_3_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa190200c  ! 255: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_3_145:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d903360  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1360, %pstate
mondo_3_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94000c  ! 261: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_148-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_148:
	.word 0x9192400d  ! 262: WRPR_PIL_R	wrpr	%r9, %r13, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xa34138939c5fd56b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e000  ! 266: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
DS_3_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f16, %f16
	.word 0x95b30301  ! 267: ALIGNADDRESS	alignaddr	%r12, %r1, %r10
	.word 0x8d9031cd  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x11cd, %pstate
splash_lsu_3_152:
	setx 0xbbdedb135b49cbb5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_153:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 270: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_3_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc35dabc9	! Random illegal ?
	.word 0xa5a409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f18
	.word 0x97a0882c  ! 273: FADDs	fadds	%f2, %f12, %f11
	rd %pc, %r19
	add %r19, (ivw_3_157-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_157:
	.word 0x9191c004  ! 274: WRPR_PIL_R	wrpr	%r7, %r4, %pil
	.word 0x8d903c9a  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1c9a, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0xa3414000  ! 277: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 278: RDPC	rd	%pc, %r17
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_3_160:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_161)+48, 16, 16)) -> intp(3,1,3)
xir_3_161:
	.word 0xa983722e  ! 282: WR_SET_SOFTINT_I	wr	%r13, 0x122e, %set_softint
tagged_3_162:
	tsubcctv %r16, 0x1044, %r11
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x83d020b5  ! 284: Tcc_I	te	icc_or_xcc, %r0 + 181
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 285: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_3_163:
	taddcctv %r15, 0x191a, %r13
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9038c8  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x18c8, %pstate
debug_3_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_3_165:
	setx 0x4e7a6d25e03a21bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 291: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
debug_3_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_3_168:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_169:
	setx 0x54fb9c781a7a43be, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_170:
	tsubcctv %r24, 0x18fa, %r6
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902009  ! 297: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x9369400c  ! 300: SDIVX_R	sdivx	%r5, %r12, %r9
	.word 0x87902112  ! 301: WRPR_TT_I	wrpr	%r0, 0x0112, %tt
change_to_randtl_3_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_171:
	.word 0x8f902003  ! 302: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa190200c  ! 303: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_hpstate_3_172:
	.word 0x8198299c  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099c, %hpstate
	rd %pc, %r19
	add %r19, (ivw_3_173-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_173:
	.word 0x91928009  ! 305: WRPR_PIL_R	wrpr	%r10, %r9, %pil
cwp_3_174:
    set user_data_start, %o7
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_3_175:
	setx 0xd0b3a44fe55b62d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_3_176:
	setx 0xd1453680d6546c0e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d95000a  ! 309: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01962  ! 310: FqTOd	dis not found

	.word 0x8d903b68  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1b68, %pstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 312: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879023a7  ! 313: WRPR_TT_I	wrpr	%r0, 0x03a7, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01962  ! 314: FqTOd	dis not found

	.word 0xd88fe010  ! 315: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
cwp_3_180:
    set user_data_start, %o7
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_hpstate_3_181:
	.word 0x81982146  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
debug_3_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_3_183:
	.word 0xa5a149d3  ! 1: FDIVd	fdivd	%f36, %f50, %f18
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3124009  ! 1: LDQF_R	-	[%r9, %r9], %f9
	.word 0xa9a20831  ! 319: FADDs	fadds	%f8, %f17, %f20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01965  ! 320: FqTOd	dis not found

DS_3_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_3_186:
	setx 0xde3e37305e9efb5b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 323: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_3_187:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_3_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_188:
	.word 0x8f902000  ! 326: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_3_189:
	setx 0x4d594a16c3ded77a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 328: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_3_190:
	.word 0x81982c8f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_3_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902fab  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x0fab, %pstate
intveclr_3_192:
	setx 0x8dbaa077326f5eb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 335: WRASI_I	wr	%r0, 0x0058, %asi
DS_3_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
tagged_3_194:
	tsubcctv %r12, 0x1eff, %r20
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_3_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_195:
	.word 0x8f902000  ! 338: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd4800a80  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0x8d802004  ! 340: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_3_196:
	setx 0xbb0f8c8fc9f18fcc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902025  ! 343: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad80a7ce  ! 345: WR_SOFTINT_REG_I	wr	%r2, 0x07ce, %softint
debug_3_198:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 346: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_3_199:
	taddcctv %r11, 0x1cf9, %r14
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_3_200:
	tsubcctv %r5, 0x18cd, %r19
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_3_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_201-donret_3_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_3_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d924003  ! 352: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	setx 0x351400b9ae982e4d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_3_204:
	setx 0x1c976d1b77fbcbbb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_205:
	set 0x60340000, %r31
	.word 0x8581aa78  ! 355: WRCCR_I	wr	%r6, 0x0a78, %ccr
	.word 0xa1902008  ! 356: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x99a00167  ! 358: FABSq	dis not found

	.word 0x97540000  ! 359: RDPR_GL	<illegal instruction>
change_to_randtl_3_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_206:
	.word 0x8f902000  ! 360: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02034  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab808007  ! 362: WR_CLEAR_SOFTINT_R	wr	%r2, %r7, %clear_softint
	.word 0x8d902c98  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x0c98, %pstate
	.word 0x93d02035  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_3_207:
	setx 0xc24e2c2f13c56f93, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_208:
	.word 0x8198298f  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
debug_3_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_3_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d924009  ! 368: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
	setx 0x2e8afd7aac7df569, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d902571  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0571, %pstate
	.word 0x9150c000  ! 372: RDPR_TT	<illegal instruction>
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd08008a0  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x8780201c  ! 376: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802080  ! 377: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa5a2cdd4  ! 378: FdMULq	fdmulq	
splash_tba_3_213:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d020b4  ! 380: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01968  ! 381: FqTOd	dis not found

splash_cmpr_3_215:
	setx 0xc3277e2cb6bdcfa6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_216:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 383: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	setx 0x40f1ca208c435f28, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x97414000  ! 387: RDPC	rd	%pc, %r11
splash_hpstate_3_219:
	.word 0x81982f75  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f75, %hpstate
splash_tba_3_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_3_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_222:
	setx 0x105b7da25e8cfce7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xa5d06fdeed35f4a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6d46394  ! 393: UMULcc_I	umulcc 	%r17, 0x0394, %r19
	.word 0xd697e030  ! 394: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x91d02034  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9770235a  ! 397: POPC_I	popc	0x035a, %r11
splash_lsu_3_224:
	setx 0x0149df845243f27d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021c0  ! 399: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
splash_cmpr_3_225:
	setx 0xaad5bdf1ba1f5e81, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_3_226:
	set 0x60740000, %r31
	.word 0x858232d3  ! 401: WRCCR_I	wr	%r8, 0x12d3, %ccr
cwp_3_227:
    set user_data_start, %o7
	.word 0x93902002  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f803435  ! 403: SIR	sir	0x1435
mondo_3_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 404: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xab8470df  ! 405: WR_CLEAR_SOFTINT_I	wr	%r17, 0x10df, %clear_softint
	.word 0xa190200c  ! 406: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_3_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_3_230:
	tsubcctv %r4, 0x1b78, %r15
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x93540000  ! 409: RDPR_GL	<illegal instruction>
mondo_3_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d934001  ! 410: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
debug_3_232:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_233:
	setx 0x2c13ddc219ca3a61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_3_235:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879022cb  ! 416: WRPR_TT_I	wrpr	%r0, 0x02cb, %tt
debug_3_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_3_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d948003  ! 418: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
tagged_3_238:
	tsubcctv %r13, 0x13a3, %r1
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c7bf1  ! 420: SDIVX_I	sdivx	%r17, 0xfffffbf1, %r10
	.word 0x8790200b  ! 421: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
	.word 0x91d020b2  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c61e7  ! 424: SDIVX_I	sdivx	%r17, 0x01e7, %r16
	rd %pc, %r19
	add %r19, (ivw_3_241-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_241:
	.word 0x9190c014  ! 425: WRPR_PIL_R	wrpr	%r3, %r20, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969ef1e  ! 426: SDIVX_I	sdivx	%r7, 0x0f1e, %r12
splash_cmpr_3_243:
	setx 0x3c2e580c0331581f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_244:
	setx 0x74db0145c16f6f01, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7680005  ! 429: SDIVX_R	sdivx	%r0, %r5, %r19
	setx 0xa2e9b420fc5cdef3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
pmu_3_247:
	nop
	setx 0xfffff463fffff9b1, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_3_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_248:
	.word 0x8f902000  ! 433: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa1902002  ! 435: WRPR_GL_I	wrpr	%r0, 0x0002, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_3_250:
	setx 0x361b9713597960e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_3_251:
	setx 0xaea04a047331da1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_252:
	setx 0xd24fe53a2caf3e1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x95540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_253:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 443: RDPC	rd	%pc, %r11
splash_htba_3_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_3_255:
	taddcctv %r10, 0x18a4, %r19
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_3_256:
	set 0x60140000, %r31
	.word 0x858078ba  ! 446: WRCCR_I	wr	%r1, 0x18ba, %ccr
tagged_3_257:
	taddcctv %r23, 0x1bd2, %r24
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802080  ! 449: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_3_258:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x976a0013  ! 451: SDIVX_R	sdivx	%r8, %r19, %r11
	rd %pc, %r19
	add %r19, (ivw_3_259-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_259:
	.word 0x91928003  ! 452: WRPR_PIL_R	wrpr	%r10, %r3, %pil
	rd %pc, %r19
	add %r19, (ivw_3_260-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_260:
	.word 0x9194c003  ! 453: WRPR_PIL_R	wrpr	%r19, %r3, %pil
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_261:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 454: RDPC	rd	%pc, %r18
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 455: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_3_262:
	setx 0xfb372606096544fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_3_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe53162c0  ! 1: STQF_I	-	%f18, [0x02c0, %r5]
	normalw
	.word 0x97458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r11
memptr_3_264:
	set user_data_start, %r31
	.word 0x85827c90  ! 459: WRCCR_I	wr	%r9, 0x1c90, %ccr
debug_3_265:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_3_266:
	setx 0x60397fe8396c7e5d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a0c9c7  ! 463: FDIVd	fdivd	%f34, %f38, %f12
splash_htba_3_267:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e000  ! 465: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
splash_lsu_3_268:
	setx 0xecea25b2c7484d61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xde7c3e8584ca3450, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
splash_cmpr_3_270:
	setx 0x72541d38ecbd158b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_3_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e000  ! 472: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_3_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a049c9  ! 1: FDIVd	fdivd	%f32, %f40, %f18
	normalw
	.word 0x99458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8790216a  ! 474: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
splash_cmpr_3_273:
	setx 0xc616688047737265, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f20, %f12
	.word 0x97b08311  ! 476: ALIGNADDRESS	alignaddr	%r2, %r17, %r11
	.word 0x8d902ff2  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0ff2, %pstate
mondo_3_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d914012  ! 478: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_3_276:
	tsubcctv %r6, 0x19a0, %r16
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_3_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0xa1450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xd0cfe000  ! 484: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_3_278:
	setx 0x49392c534816aa9f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 487: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cwp_3_279:
    set user_data_start, %o7
	.word 0x93902005  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f80374b  ! 489: SIR	sir	0x174b
cwp_3_280:
    set user_data_start, %o7
	.word 0x93902001  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_3_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_281:
	.word 0x8f902003  ! 491: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
donret_3_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_282-donret_3_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d020b2  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_3_283:
	setx 0x00347691d66e82f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_284:
	setx 0x0be33478489c1d87, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_3_285:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_3_286:
	tsubcctv %r9, 0x1484, %r17
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_2_0:
	set user_data_start, %r31
	.word 0x85847a7e  ! 2: WRCCR_I	wr	%r17, 0x1a7e, %ccr
DS_2_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa1902003  ! 5: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_2_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_2:
	.word 0x8f902000  ! 6: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_3:
	setx 0x410633c3fb13c09c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 8: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
	.word 0x8780204f  ! 9: WRASI_I	wr	%r0, 0x004f, %asi
donret_2_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_5-donret_2_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_2_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_6:
	.word 0x8f902000  ! 11: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_2_7:
    set user_data_start, %o7
	.word 0x93902006  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_2_8:
	setx 0x87bc8742d233cdab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037ce  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x17ce, %pstate
	.word 0x8790201b  ! 16: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_9:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 17: RDPC	rd	%pc, %r10
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_2_10:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_2_11:
    set user_data_start, %o7
	.word 0x93902007  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa545c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8d902f92  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0f92, %pstate
splash_lsu_2_12:
	setx 0x8e7ba3fb2c540663, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 25: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1a00173  ! 26: FABSq	dis not found

splash_lsu_2_13:
	setx 0x20be929a28f5644d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_14:
	set 0x60740000, %r31
	.word 0x8580ae93  ! 28: WRCCR_I	wr	%r2, 0x0e93, %ccr
splash_hpstate_2_15:
	.word 0x8198220e  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020e, %hpstate
	.word 0x99464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x93d020b2  ! 31: Tcc_I	tne	icc_or_xcc, %r0 + 178
debug_2_16:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_2_17:
    set user_data_start, %o7
	.word 0x93902006  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe4880e60  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
splash_hpstate_2_18:
	.word 0x81982476  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0476, %hpstate
cwp_2_19:
    set user_data_start, %o7
	.word 0x93902000  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_20:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 37: RDPC	rd	%pc, %r8
	.word 0x8780204f  ! 38: WRASI_I	wr	%r0, 0x004f, %asi
DS_2_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b0c310  ! 39: ALIGNADDRESS	alignaddr	%r3, %r16, %r17
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d90237f  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x037f, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_2_22:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d904006  ! 44: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_24) + 24, 16, 16)) -> intp(4,0,24)
intvec_2_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903cca  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x1cca, %pstate
	.word 0xab80b5c0  ! 47: WR_CLEAR_SOFTINT_I	wr	%r2, 0x15c0, %clear_softint
memptr_2_25:
	set 0x60540000, %r31
	.word 0x85816495  ! 48: WRCCR_I	wr	%r5, 0x0495, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_2_26:
	.word 0x81982ace  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ace, %hpstate
	.word 0xe8900e40  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x72, %r20
	.word 0x8d902c41  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0c41, %pstate
	.word 0x91d02034  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_2_27:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 54: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 56: RDPC	rd	%pc, %r16
	.word 0x8790226e  ! 57: WRPR_TT_I	wrpr	%r0, 0x026e, %tt
	.word 0xa0dc8008  ! 58: SMULcc_R	smulcc 	%r18, %r8, %r16
	setx 0xc381c25a4576412e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_30:
	.word 0x819822bf  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02bf, %hpstate
	.word 0xa190200d  ! 61: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_hpstate_2_31:
	.word 0x81982405  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
donret_2_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_32-donret_2_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196b  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e010  ! 66: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
mondo_2_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c00d  ! 68: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_35:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 69: RDPC	rd	%pc, %r13
	.word 0x93a14d2d  ! 70: FsMULd	fsmuld	%f5, %f44, %f40
splash_hpstate_2_36:
	.word 0x81982096  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0096, %hpstate
splash_cmpr_2_37:
	setx 0xffe034c657e4f669, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_38:
	setx 0xe2d4a3a7e2f0f911, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_2_39:
	set user_data_start, %r31
	.word 0x8580bfd7  ! 76: WRCCR_I	wr	%r2, 0x1fd7, %ccr
intveclr_2_40:
	setx 0xc4b155bda71b6ad0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_htba_2_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_2_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_43:
	.word 0x8f902000  ! 82: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa190200e  ! 83: WRPR_GL_I	wrpr	%r0, 0x000e, %-
debug_2_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d02032  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_2_45:
	set user_data_start, %r31
	.word 0x8582ba39  ! 87: WRCCR_I	wr	%r10, 0x1a39, %ccr
	.word 0xd2d00e80  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
splash_tba_2_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x8de2d017260fc2e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36af113  ! 92: SDIVX_I	sdivx	%r11, 0xfffff113, %r17
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_2_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d900014  ! 94: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
splash_tba_2_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02035  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9b540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x8790232c  ! 98: WRPR_TT_I	wrpr	%r0, 0x032c, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_2_51:
	setx 0xac65c3c360f15ec9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_52-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_52:
	.word 0x91904013  ! 101: WRPR_PIL_R	wrpr	%r1, %r19, %pil
splash_tba_2_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b20309  ! 103: ALIGNADDRESS	alignaddr	%r8, %r9, %r10
cwp_2_55:
    set user_data_start, %o7
	.word 0x93902003  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903bc7  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x1bc7, %pstate
	.word 0x87802089  ! 106: WRASI_I	wr	%r0, 0x0089, %asi
DS_2_56:
	.word 0xa7a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f50
	.word 0x856b94d9	! Random illegal ?
	.word 0xe3100010  ! 1: LDQF_R	-	[%r0, %r16], %f17
	.word 0x9ba34829  ! 107: FADDs	fadds	%f13, %f9, %f13
	.word 0x87802004  ! 108: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200a  ! 109: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_57:
	setx 0xd3d5df50a61824bb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_58)+40, 16, 16)) -> intp(2,1,3)
xir_2_58:
	.word 0xa9836c70  ! 112: WR_SET_SOFTINT_I	wr	%r13, 0x0c70, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_2_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
donret_2_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_60-donret_2_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa1902001  ! 116: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd297e030  ! 117: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0x91a00174  ! 119: FABSq	dis not found

memptr_2_61:
	set 0x60140000, %r31
	.word 0x8581ecb2  ! 120: WRCCR_I	wr	%r7, 0x0cb2, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa1902001  ! 122: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_hpstate_2_62:
	.word 0x81982f15  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
mondo_2_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 124: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
splash_hpstate_2_64:
	.word 0x81982c47  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
	.word 0x9b450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0x8790208d  ! 127: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_65)+8, 16, 16)) -> intp(2,1,3)
xir_2_65:
	.word 0xa9802fab  ! 128: WR_SET_SOFTINT_I	wr	%r0, 0x0fab, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_2_66:
	setx 0x55a3972adf5349a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_67:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_2_68:
	set 0x60540000, %r31
	.word 0x8581b74d  ! 132: WRCCR_I	wr	%r6, 0x174d, %ccr
tagged_2_69:
	taddcctv %r12, 0x13c9, %r11
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01973  ! 134: FqTOd	dis not found

splash_tba_2_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_72:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 136: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xa3a28d30  ! 137: FsMULd	fsmuld	%f10, %f16, %f48
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_2_73:
	setx 0xa16c878195c9c693, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9945c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xa9830000  ! 141: WR_SET_SOFTINT_R	wr	%r12, %r0, %set_softint
	.word 0x99a089c0  ! 142: FDIVd	fdivd	%f2, %f0, %f12
tagged_2_74:
	tsubcctv %r1, 0x1e2b, %r4
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_2_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
donret_2_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_76-donret_2_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d903e0f  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x1e0f, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879023f2  ! 148: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_2_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_77:
	.word 0x8f902003  ! 150: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_tba_2_78:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_79:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_80) + 24, 16, 16)) -> intp(3,0,18)
intvec_2_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_81:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9834009  ! 155: WR_SET_SOFTINT_R	wr	%r13, %r9, %set_softint
splash_lsu_2_82:
	setx 0x234d5d7416b04301, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_83:
	setx 0xc66747f598a0e437, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_2_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802004  ! 160: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d903cc9  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1cc9, %pstate
	.word 0xa190200d  ! 162: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_2_86:
    set user_data_start, %o7
	.word 0x93902005  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
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
	.word 0xa9414000  ! 165: RDPC	rd	%pc, %r20
DS_2_88:
	.word 0xa3a049c3  ! 1: FDIVd	fdivd	%f32, %f34, %f48
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_2_89:
    set user_data_start, %o7
	.word 0x93902001  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01961  ! 168: FqTOd	dis not found

splash_cmpr_2_91:
	setx 0x3e95e50b6317c673, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_93:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_94:
	setx 0xc55d5316e96c0676, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 173: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 174: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196a  ! 176: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3683b6e  ! 177: SDIVX_I	sdivx	%r0, 0xfffffb6e, %r17
tagged_2_97:
	taddcctv %r15, 0x1360, %r11
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_2_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cb46e  ! 180: SDIVX_I	sdivx	%r18, 0xfffff46e, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_100:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 181: RDPC	rd	%pc, %r9
intveclr_2_101:
	setx 0xa78a9db4a263c901, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 183: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36d3a04  ! 184: SDIVX_I	sdivx	%r20, 0xfffffa04, %r17
	.word 0x87902011  ! 185: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
	.word 0xdac80e60  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
debug_2_103:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe000  ! 188: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
intveclr_2_104:
	setx 0x68be8d1152d7bd5b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_2_105:
	.word 0x8198243c  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x043c, %hpstate
debug_2_106:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_2_108:
	setx 0xcb850e72d025482b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_2_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91933efa  ! 198: WRPR_PIL_I	wrpr	%r12, 0x1efa, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 199: RDPC	rd	%pc, %r16
	.word 0xa9a409cc  ! 200: FDIVd	fdivd	%f16, %f12, %f20
debug_2_111:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 201: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01963  ! 202: FqTOd	dis not found

DS_2_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f26, %f14
	.word 0xa7b2030c  ! 203: ALIGNADDRESS	alignaddr	%r8, %r12, %r19
splash_tba_2_114:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 205: FqTOd	dis not found

intveclr_2_116:
	setx 0x02ce9c61681c071a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_2_117:
	.word 0x81982e96  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
	.word 0x879022d2  ! 209: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
debug_2_118:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad807bda  ! 211: WR_SOFTINT_REG_I	wr	%r1, 0x1bda, %softint
	.word 0x8d902d9d  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x0d9d, %pstate
debug_2_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 214: Tcc_I	te	icc_or_xcc, %r0 + 51
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_2_121:
	setx 0x4e9484befee50aa9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_2_122:
	setx 0x5abda08530b55e79, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_123:
	setx 0x2e4f8f8423d87c3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_2_124:
	setx 0x2bbda6933ba2a4f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_125:
	setx 0xff76c06beb3e0473, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_2_126:
	tsubcctv %r20, 0x1624, %r7
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_2_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 226: FqTOd	dis not found

debug_2_129:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 227: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
tagged_2_130:
	tsubcctv %r25, 0x1fe2, %r7
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d902d7a  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x0d7a, %pstate
	.word 0xa9a00162  ! 230: FABSq	dis not found

debug_2_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16cae9f  ! 233: SDIVX_I	sdivx	%r18, 0x0e9f, %r16
tagged_2_133:
	taddcctv %r21, 0x1095, %r26
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_134:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 235: RDPC	rd	%pc, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168facb  ! 236: SDIVX_I	sdivx	%r3, 0xfffffacb, %r8
	.word 0x8d903b0a  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1b0a, %pstate
DS_2_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_2_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
splash_tba_2_138:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa1902008  ! 244: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_2_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0xa9a00169  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_2_141:
    set user_data_start, %o7
	.word 0x93902006  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_2_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 250: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xa190200f  ! 251: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_2_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa190200f  ! 255: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_2_145:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196d  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d902832  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x0832, %pstate
mondo_2_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d91400d  ! 261: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_148-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_148:
	.word 0x91900000  ! 262: WRPR_PIL_R	wrpr	%r0, %r0, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x5bb7501ac1042e2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e030  ! 266: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
DS_2_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f10, %f8
	.word 0x93b0030d  ! 267: ALIGNADDRESS	alignaddr	%r0, %r13, %r9
	.word 0x8d902852  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
splash_lsu_2_152:
	setx 0x8350f2f7e0d4f8d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_153:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 270: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_2_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa57bfcdf	! Random illegal ?
	.word 0x93a1c9c2  ! 1: FDIVd	fdivd	%f38, %f2, %f40
	.word 0xa1a30820  ! 273: FADDs	fadds	%f12, %f0, %f16
	rd %pc, %r19
	add %r19, (ivw_2_157-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_157:
	.word 0x91924006  ! 274: WRPR_PIL_R	wrpr	%r9, %r6, %pil
	.word 0x8d903294  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1294, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0x93414000  ! 277: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_159:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 278: RDPC	rd	%pc, %r11
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_2_160:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_161)+40, 16, 16)) -> intp(2,1,3)
xir_2_161:
	.word 0xa980277c  ! 282: WR_SET_SOFTINT_I	wr	%r0, 0x077c, %set_softint
tagged_2_162:
	tsubcctv %r11, 0x159c, %r9
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x83d02035  ! 284: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_163:
	taddcctv %r3, 0x1395, %r18
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a01  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0a01, %pstate
debug_2_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_2_165:
	setx 0xde3ef56dd221649b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d910006  ! 291: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
debug_2_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_2_168:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_169:
	setx 0x025ac28381b44d2d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_170:
	tsubcctv %r18, 0x1276, %r5
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa190200e  ! 297: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x9b6a800c  ! 300: SDIVX_R	sdivx	%r10, %r12, %r13
	.word 0x8790214b  ! 301: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
change_to_randtl_2_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_171:
	.word 0x8f902000  ! 302: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa190200a  ! 303: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_2_172:
	.word 0x81982f8d  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8d, %hpstate
	rd %pc, %r19
	add %r19, (ivw_2_173-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_173:
	.word 0x9193000c  ! 305: WRPR_PIL_R	wrpr	%r12, %r12, %pil
cwp_2_174:
    set user_data_start, %o7
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_2_175:
	setx 0x0ec041fdcd9f166c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_176:
	setx 0x4c153fa3fcdf502c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94400b  ! 309: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 310: FqTOd	dis not found

	.word 0x8d903557  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1557, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 312: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021a3  ! 313: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01968  ! 314: FqTOd	dis not found

	.word 0xd88fe010  ! 315: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
cwp_2_180:
    set user_data_start, %o7
	.word 0x93902004  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_hpstate_2_181:
	.word 0x8198279e  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
debug_2_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_2_183:
	.word 0x95a049c7  ! 1: FDIVd	fdivd	%f32, %f38, %f10
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7124000  ! 1: LDQF_R	-	[%r9, %r0], %f19
	.word 0x91a34831  ! 319: FADDs	fadds	%f13, %f17, %f8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01961  ! 320: FqTOd	dis not found

DS_2_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_2_186:
	setx 0x173d56fd6c053576, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902000  ! 323: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_2_187:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_2_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_188:
	.word 0x8f902000  ! 326: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_2_189:
	setx 0x8f219d621753e820, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 328: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_2_190:
	.word 0x81982514  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_2_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903933  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x1933, %pstate
intveclr_2_192:
	setx 0xd2395b9b2513edb0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 335: WRASI_I	wr	%r0, 0x0014, %asi
DS_2_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_2_194:
	tsubcctv %r14, 0x1023, %r6
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_2_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_195:
	.word 0x8f902002  ! 338: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd48008a0  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_2_196:
	setx 0x3174502a9be2be8a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x8790201d  ! 343: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad81302c  ! 345: WR_SOFTINT_REG_I	wr	%r4, 0x102c, %softint
debug_2_198:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 346: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_2_199:
	taddcctv %r26, 0x16e5, %r1
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_2_200:
	tsubcctv %r8, 0x1550, %r19
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_2_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_201-donret_2_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_2_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d920007  ! 352: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	setx 0x94523b5eeec0607a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_204:
	setx 0x0faacf9fad0cbb75, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_205:
	set 0x60540000, %r31
	.word 0x8580a3cb  ! 355: WRCCR_I	wr	%r2, 0x03cb, %ccr
	.word 0xa1902005  ! 356: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93a00174  ! 358: FABSq	dis not found

	.word 0xa7540000  ! 359: RDPR_GL	<illegal instruction>
change_to_randtl_2_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_206:
	.word 0x8f902002  ! 360: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02035  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xab840005  ! 362: WR_CLEAR_SOFTINT_R	wr	%r16, %r5, %clear_softint
	.word 0x8d9029bc  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x09bc, %pstate
	.word 0x93d020b2  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_lsu_2_207:
	setx 0x6c9755d8bca47f13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_208:
	.word 0x81982e86  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e86, %hpstate
debug_2_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_2_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d918001  ! 368: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	setx 0xa83ea5388817ddcb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d902323  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0323, %pstate
	.word 0xa750c000  ! 372: RDPR_TT	<illegal instruction>
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd0800c40  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802014  ! 376: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802004  ! 377: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1a0cdc0  ! 378: FdMULq	fdmulq	
splash_tba_2_213:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02032  ! 380: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 381: FqTOd	dis not found

splash_cmpr_2_215:
	setx 0x881b126f4447713d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_216:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 383: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	setx 0xb3eb3f59b75a623a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 387: RDPC	rd	%pc, %r13
splash_hpstate_2_219:
	.word 0x81982c46  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
splash_tba_2_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_222:
	setx 0xb8e7b376f188ff37, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x2db45ccfe63ab634, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x90d06ed3  ! 393: UMULcc_I	umulcc 	%r1, 0x0ed3, %r8
	.word 0xd697e010  ! 394: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x91d020b2  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9b7020b1  ! 397: POPC_I	popc	0x00b1, %r13
splash_lsu_2_224:
	setx 0xf0c4c26748c86225, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790232f  ! 399: WRPR_TT_I	wrpr	%r0, 0x032f, %tt
splash_cmpr_2_225:
	setx 0x93beeba16214ab05, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_226:
	set 0x60340000, %r31
	.word 0x8584f074  ! 401: WRCCR_I	wr	%r19, 0x1074, %ccr
cwp_2_227:
    set user_data_start, %o7
	.word 0x93902002  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f80317d  ! 403: SIR	sir	0x117d
mondo_2_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 404: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xab8178bd  ! 405: WR_CLEAR_SOFTINT_I	wr	%r5, 0x18bd, %clear_softint
	.word 0xa1902000  ! 406: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_2_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_2_230:
	tsubcctv %r22, 0x1554, %r16
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x95540000  ! 409: RDPR_GL	<illegal instruction>
mondo_2_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d92c002  ! 410: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
debug_2_232:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_233:
	setx 0xd584d34ca9ac6d59, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_2_235:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790215e  ! 416: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
debug_2_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_2_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 418: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
tagged_2_238:
	tsubcctv %r24, 0x106f, %r26
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569e23f  ! 420: SDIVX_I	sdivx	%r7, 0x023f, %r18
	.word 0x879022d3  ! 421: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0x91d02035  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cbe12  ! 424: SDIVX_I	sdivx	%r18, 0xfffffe12, %r12
	rd %pc, %r19
	add %r19, (ivw_2_241-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_241:
	.word 0x9191c009  ! 425: WRPR_PIL_R	wrpr	%r7, %r9, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68b79e  ! 426: SDIVX_I	sdivx	%r2, 0xfffff79e, %r13
splash_cmpr_2_243:
	setx 0xa9fc8aed21be9bf9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_244:
	setx 0xd934b23fbf9ae62b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x976b4002  ! 429: SDIVX_R	sdivx	%r13, %r2, %r11
	setx 0x34a35fdf392624fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
pmu_2_247:
	nop
	setx 0xfffff1a4fffff866, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_248:
	.word 0x8f902002  ! 433: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa1902008  ! 435: WRPR_GL_I	wrpr	%r0, 0x0008, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_2_250:
	setx 0xb4db8dadba070bd5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_2_251:
	setx 0x83d439b1f1a615b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_252:
	setx 0x520e658f24aae3ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x9b540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 443: RDPC	rd	%pc, %r18
splash_htba_2_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_2_255:
	taddcctv %r8, 0x1dae, %r3
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_2_256:
	set 0x60540000, %r31
	.word 0x8584b286  ! 446: WRCCR_I	wr	%r18, 0x1286, %ccr
tagged_2_257:
	taddcctv %r14, 0x17bc, %r19
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802010  ! 449: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_2_258:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x956c8011  ! 451: SDIVX_R	sdivx	%r18, %r17, %r10
	rd %pc, %r19
	add %r19, (ivw_2_259-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_259:
	.word 0x91910000  ! 452: WRPR_PIL_R	wrpr	%r4, %r0, %pil
	rd %pc, %r19
	add %r19, (ivw_2_260-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_260:
	.word 0x9194c005  ! 453: WRPR_PIL_R	wrpr	%r19, %r5, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_261:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 454: RDPC	rd	%pc, %r12
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_262:
	setx 0x75d51ccd7a16ac1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_2_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9303ab1  ! 1: STQF_I	-	%f12, [0x1ab1, %r0]
	normalw
	.word 0x99458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r12
memptr_2_264:
	set user_data_start, %r31
	.word 0x8580f7d2  ! 459: WRCCR_I	wr	%r3, 0x17d2, %ccr
debug_2_265:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_2_266:
	setx 0x3b03daed0eb06c28, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a209d1  ! 463: FDIVd	fdivd	%f8, %f48, %f8
splash_htba_2_267:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e020  ! 465: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
splash_lsu_2_268:
	setx 0x8cbddd799007cf73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x69dcdbf965bd4792, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_cmpr_2_270:
	setx 0x3dc5c5d558432734, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_2_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e030  ! 472: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
DS_2_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a2c9c3  ! 1: FDIVd	fdivd	%f42, %f34, %f48
	normalw
	.word 0x97458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x87902103  ! 474: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
splash_cmpr_2_273:
	setx 0xc387b8f7e97f6855, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f22, %f28
	.word 0x95b04310  ! 476: ALIGNADDRESS	alignaddr	%r1, %r16, %r10
	.word 0x8d903ec5  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x1ec5, %pstate
mondo_2_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d900002  ! 478: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_2_276:
	tsubcctv %r5, 0x16ec, %r12
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_2_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x99450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xd0cfe000  ! 484: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_2_278:
	setx 0xf305e9fc6c925107, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 487: Tcc_R	te	icc_or_xcc, %r0 + %r30
cwp_2_279:
    set user_data_start, %o7
	.word 0x93902006  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f803b5b  ! 489: SIR	sir	0x1b5b
cwp_2_280:
    set user_data_start, %o7
	.word 0x93902005  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_2_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_281:
	.word 0x8f902000  ! 491: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_2_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_282-donret_2_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d02034  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_2_283:
	setx 0xd9b1ae47b7c2237c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_284:
	setx 0x9d0abc24279d419f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_2_285:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_286:
	tsubcctv %r12, 0x13d9, %r6
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_1_0:
	set user_data_start, %r31
	.word 0x8580e4b0  ! 2: WRCCR_I	wr	%r3, 0x04b0, %ccr
DS_1_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa190200f  ! 5: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_1_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_2:
	.word 0x8f902001  ! 6: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_3:
	setx 0x380016b748b4951b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d940008  ! 8: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x87802014  ! 9: WRASI_I	wr	%r0, 0x0014, %asi
donret_1_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_5-donret_1_5-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_1_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_6:
	.word 0x8f902000  ! 11: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_1_7:
    set user_data_start, %o7
	.word 0x93902004  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_1_8:
	setx 0x2e21ed1c24b77aa1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037fd  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x17fd, %pstate
	.word 0x8790226f  ! 16: WRPR_TT_I	wrpr	%r0, 0x026f, %tt
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_9:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 17: RDPC	rd	%pc, %r11
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_1_10:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_1_11:
    set user_data_start, %o7
	.word 0x93902000  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa545c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8d90353c  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x153c, %pstate
splash_lsu_1_12:
	setx 0xf5087db557c551a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 25: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x97a0016a  ! 26: FABSq	dis not found

splash_lsu_1_13:
	setx 0xe4bde0501c1fd595, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_14:
	set 0x60340000, %r31
	.word 0x8582fadf  ! 28: WRCCR_I	wr	%r11, 0x1adf, %ccr
splash_hpstate_1_15:
	.word 0x819821d7  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d7, %hpstate
	.word 0x93464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x91d02032  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_1_16:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_1_17:
    set user_data_start, %o7
	.word 0x93902004  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe48804a0  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
splash_hpstate_1_18:
	.word 0x81982844  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
cwp_1_19:
    set user_data_start, %o7
	.word 0x93902000  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_20:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 37: RDPC	rd	%pc, %r12
	.word 0x87802055  ! 38: WRASI_I	wr	%r0, 0x0055, %asi
DS_1_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x95b1c305  ! 39: ALIGNADDRESS	alignaddr	%r7, %r5, %r10
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d90212e  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x012e, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_1_22:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 44: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_24) + 56, 16, 16)) -> intp(3,0,18)
intvec_1_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e78  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0e78, %pstate
	.word 0xab8177ac  ! 47: WR_CLEAR_SOFTINT_I	wr	%r5, 0x17ac, %clear_softint
memptr_1_25:
	set 0x60340000, %r31
	.word 0x858165f8  ! 48: WRCCR_I	wr	%r5, 0x05f8, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_1_26:
	.word 0x81982457  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d902b92  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0b92, %pstate
	.word 0x93d02034  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 52
debug_1_27:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 54: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_28:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 56: RDPC	rd	%pc, %r12
	.word 0x87902189  ! 57: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0x94d84010  ! 58: SMULcc_R	smulcc 	%r1, %r16, %r10
	setx 0xeb3a6202c560af85, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_30:
	.word 0x81982b66  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b66, %hpstate
	.word 0xa190200d  ! 61: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_hpstate_1_31:
	.word 0x8198268c  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
donret_1_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_32-donret_1_32), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e020  ! 66: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
	.word 0x87802004  ! 67: WRASI_I	wr	%r0, 0x0004, %asi
mondo_1_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 68: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_35:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 69: RDPC	rd	%pc, %r19
	.word 0x99a18d34  ! 70: FsMULd	fsmuld	%f6, %f20, %f12
splash_hpstate_1_36:
	.word 0x81982f67  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f67, %hpstate
splash_cmpr_1_37:
	setx 0x367027d47ebb2ffe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_38:
	setx 0x91c52c81e45a8476, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_1_39:
	set user_data_start, %r31
	.word 0x8580e435  ! 76: WRCCR_I	wr	%r3, 0x0435, %ccr
intveclr_1_40:
	setx 0x531d9fd4cd9309ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_htba_1_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b5  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 181
change_to_randtl_1_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_43:
	.word 0x8f902001  ! 82: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902008  ! 83: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_1_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d02034  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_1_45:
	set user_data_start, %r31
	.word 0x85802d6a  ! 87: WRCCR_I	wr	%r0, 0x0d6a, %ccr
	.word 0xd2d004a0  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_tba_1_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x35cfe760efb01d92, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 91: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a2df4  ! 92: SDIVX_I	sdivx	%r8, 0x0df4, %r9
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_1_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c001  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
splash_tba_1_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02034  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x95540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x87902394  ! 98: WRPR_TT_I	wrpr	%r0, 0x0394, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_1_51:
	setx 0x6b9e378bc4bcacff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_52-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_52:
	.word 0x91928007  ! 101: WRPR_PIL_R	wrpr	%r10, %r7, %pil
splash_tba_1_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb50302  ! 103: ALIGNADDRESS	alignaddr	%r20, %r2, %r13
cwp_1_55:
    set user_data_start, %o7
	.word 0x93902007  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90209f  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
	.word 0x8780201c  ! 106: WRASI_I	wr	%r0, 0x001c, %asi
DS_1_56:
	.word 0xa3a009ca  ! 1: FDIVd	fdivd	%f0, %f10, %f48
	.word 0x85480a26	! Random illegal ?
	.word 0xd3140004  ! 1: LDQF_R	-	[%r16, %r4], %f9
	.word 0x97a48822  ! 107: FADDs	fadds	%f18, %f2, %f11
	.word 0x87802088  ! 108: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902005  ! 109: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_57:
	setx 0x5512affc781f1ddb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_58)+8, 16, 16)) -> intp(1,1,3)
xir_1_58:
	.word 0xa98233d9  ! 112: WR_SET_SOFTINT_I	wr	%r8, 0x13d9, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_1_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
donret_1_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_60-donret_1_60), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa1902002  ! 116: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd297e000  ! 117: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0xa9a00164  ! 119: FABSq	dis not found

memptr_1_61:
	set 0x60340000, %r31
	.word 0x8582bca0  ! 120: WRCCR_I	wr	%r10, 0x1ca0, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa190200a  ! 122: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_1_62:
	.word 0x819823de  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03de, %hpstate
mondo_1_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c011  ! 124: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
splash_hpstate_1_64:
	.word 0x81982904  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0904, %hpstate
	.word 0x9b450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0x879021d7  ! 127: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_65)+0, 16, 16)) -> intp(1,1,3)
xir_1_65:
	.word 0xa9822f2a  ! 128: WR_SET_SOFTINT_I	wr	%r8, 0x0f2a, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_1_66:
	setx 0xdcca031e6884b552, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_67:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_1_68:
	set 0x60740000, %r31
	.word 0x85812fc4  ! 132: WRCCR_I	wr	%r4, 0x0fc4, %ccr
tagged_1_69:
	taddcctv %r13, 0x1fe6, %r26
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 134: FqTOd	dis not found

splash_tba_1_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_72:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 136: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xa5a0cd28  ! 137: FsMULd	fsmuld	%f3, %f8, %f18
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_1_73:
	setx 0x2d892fa69f4b951b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9945c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xa9820006  ! 141: WR_SET_SOFTINT_R	wr	%r8, %r6, %set_softint
	.word 0x99a289d0  ! 142: FDIVd	fdivd	%f10, %f16, %f12
tagged_1_74:
	tsubcctv %r19, 0x17e4, %r8
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_1_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
donret_1_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_76-donret_1_76), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d903c2f  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x1c2f, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x879021f1  ! 148: WRPR_TT_I	wrpr	%r0, 0x01f1, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_1_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_77:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_1_78:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_79:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_80) + 0, 16, 16)) -> intp(7,0,8)
intvec_1_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_81:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa980800d  ! 155: WR_SET_SOFTINT_R	wr	%r2, %r13, %set_softint
splash_lsu_1_82:
	setx 0x41051e0742b4deeb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_83:
	setx 0x62331b7915c493cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_1_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8780208b  ! 160: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x8d903fe8  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x1fe8, %pstate
	.word 0xa1902009  ! 162: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_1_86:
    set user_data_start, %o7
	.word 0x93902007  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
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
	.word 0xa9414000  ! 165: RDPC	rd	%pc, %r20
DS_1_88:
	.word 0x93a0c9d1  ! 1: FDIVd	fdivd	%f34, %f48, %f40
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_1_89:
    set user_data_start, %o7
	.word 0x93902001  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01970  ! 168: FqTOd	dis not found

splash_cmpr_1_91:
	setx 0xadd3d6092955f74c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_93:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_94:
	setx 0x73fdee52bdb33d00, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902002  ! 173: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 174: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 176: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368e85d  ! 177: SDIVX_I	sdivx	%r3, 0x085d, %r17
tagged_1_97:
	taddcctv %r23, 0x1883, %r25
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_1_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c33f4  ! 180: SDIVX_I	sdivx	%r16, 0xfffff3f4, %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_100:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 181: RDPC	rd	%pc, %r19
intveclr_1_101:
	setx 0xf28943b8c658bbe5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 183: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ca0c8  ! 184: SDIVX_I	sdivx	%r18, 0x00c8, %r12
	.word 0x87902009  ! 185: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	.word 0xdac80e80  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r13
debug_1_103:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe010  ! 188: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
intveclr_1_104:
	setx 0x6fae68670b863ca3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_1_105:
	.word 0x81982e47  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
debug_1_106:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_1_108:
	setx 0x6c70cc4e1f434517, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_1_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9190bd02  ! 198: WRPR_PIL_I	wrpr	%r2, 0x1d02, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_110:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 199: RDPC	rd	%pc, %r12
	.word 0x97a0c9c4  ! 200: FDIVd	fdivd	%f34, %f4, %f42
debug_1_111:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 201: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01964  ! 202: FqTOd	dis not found

DS_1_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f24, %f2
	.word 0x95b2c311  ! 203: ALIGNADDRESS	alignaddr	%r11, %r17, %r10
splash_tba_1_114:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01962  ! 205: FqTOd	dis not found

intveclr_1_116:
	setx 0xb9138b961d1f31f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_1_117:
	.word 0x81982cc4  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc4, %hpstate
	.word 0x879020a5  ! 209: WRPR_TT_I	wrpr	%r0, 0x00a5, %tt
debug_1_118:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad82af0a  ! 211: WR_SOFTINT_REG_I	wr	%r10, 0x0f0a, %softint
	.word 0x8d9035c3  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x15c3, %pstate
debug_1_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_1_121:
	setx 0x9045d9b0ab9b0ec7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_1_122:
	setx 0x1266ce04c98bf497, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_123:
	setx 0x60fa4c19365e7680, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_1_124:
	setx 0x56c17547e5866198, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_125:
	setx 0x74481fadc9d064c0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_1_126:
	tsubcctv %r10, 0x1436, %r7
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_1_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 226: FqTOd	dis not found

debug_1_129:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 227: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
tagged_1_130:
	tsubcctv %r11, 0x1027, %r11
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d9024e4  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x04e4, %pstate
	.word 0xa9a00164  ! 230: FABSq	dis not found

debug_1_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368e38e  ! 233: SDIVX_I	sdivx	%r3, 0x038e, %r17
tagged_1_133:
	taddcctv %r17, 0x14c2, %r14
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_134:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 235: RDPC	rd	%pc, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5692e8d  ! 236: SDIVX_I	sdivx	%r4, 0x0e8d, %r18
	.word 0x8d90342c  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x142c, %pstate
DS_1_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_1_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
splash_tba_1_138:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_139:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa190200c  ! 244: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_1_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0x95a00171  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_1_141:
    set user_data_start, %o7
	.word 0x93902004  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_1_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d90000a  ! 250: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0xa190200c  ! 251: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_1_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa190200a  ! 255: WRPR_GL_I	wrpr	%r0, 0x000a, %-
debug_1_145:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d902ee6  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x0ee6, %pstate
mondo_1_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94c00a  ! 261: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_148-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_148:
	.word 0x91924002  ! 262: WRPR_PIL_R	wrpr	%r9, %r2, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x155271a13af990a3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e000  ! 266: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
DS_1_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f8, %f30
	.word 0x99b4c305  ! 267: ALIGNADDRESS	alignaddr	%r19, %r5, %r12
	.word 0x8d902330  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0330, %pstate
splash_lsu_1_152:
	setx 0x474c6661278f278d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_153:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 270: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_1_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcb76144b	! Random illegal ?
	.word 0x95a489d4  ! 1: FDIVd	fdivd	%f18, %f20, %f10
	.word 0x9ba14828  ! 273: FADDs	fadds	%f5, %f8, %f13
	rd %pc, %r19
	add %r19, (ivw_1_157-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_157:
	.word 0x91910004  ! 274: WRPR_PIL_R	wrpr	%r4, %r4, %pil
	.word 0x8d90297a  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x097a, %pstate
	.word 0xe0c00e60  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
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
	.word 0x95414000  ! 277: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_159:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 278: RDPC	rd	%pc, %r8
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_1_160:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_161)+0, 16, 16)) -> intp(1,1,3)
xir_1_161:
	.word 0xa984bd18  ! 282: WR_SET_SOFTINT_I	wr	%r18, 0x1d18, %set_softint
tagged_1_162:
	tsubcctv %r5, 0x1001, %r15
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x91d020b2  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_163:
	taddcctv %r24, 0x1515, %r11
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802000  ! 287: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90204e  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
debug_1_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_1_165:
	setx 0x49793e393f7fd507, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94000d  ! 291: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
debug_1_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_1_168:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_169:
	setx 0x9d93e95113b759b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_170:
	tsubcctv %r4, 0x13d7, %r13
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902007  ! 297: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x9b680011  ! 300: SDIVX_R	sdivx	%r0, %r17, %r13
	.word 0x8790209f  ! 301: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
change_to_randtl_1_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_171:
	.word 0x8f902003  ! 302: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902007  ! 303: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_hpstate_1_172:
	.word 0x81982016  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0016, %hpstate
	rd %pc, %r19
	add %r19, (ivw_1_173-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_173:
	.word 0x91910013  ! 305: WRPR_PIL_R	wrpr	%r4, %r19, %pil
cwp_1_174:
    set user_data_start, %o7
	.word 0x93902007  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_1_175:
	setx 0x22fe52b7c015e6f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_176:
	setx 0xbee4617be02131df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d924013  ! 309: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01974  ! 310: FqTOd	dis not found

	.word 0x8d9039ff  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x19ff, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020f2  ! 313: WRPR_TT_I	wrpr	%r0, 0x00f2, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 314: FqTOd	dis not found

	.word 0xd88fe020  ! 315: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
cwp_1_180:
    set user_data_start, %o7
	.word 0x93902002  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_1_181:
	.word 0x819820de  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
debug_1_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_1_183:
	.word 0xa7a309d2  ! 1: FDIVd	fdivd	%f12, %f18, %f50
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb140004  ! 1: LDQF_R	-	[%r16, %r4], %f13
	.word 0xa3a2c828  ! 319: FADDs	fadds	%f11, %f8, %f17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196b  ! 320: FqTOd	dis not found

DS_1_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_1_186:
	setx 0xba069fc5a7e2c005, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 323: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_1_187:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 178
change_to_randtl_1_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_188:
	.word 0x8f902001  ! 326: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_1_189:
	setx 0xb12a7627fcc22715, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 328: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_1_190:
	.word 0x819826d4  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_1_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903788  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x1788, %pstate
intveclr_1_192:
	setx 0x1d77b62057e8f7e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 335: WRASI_I	wr	%r0, 0x008b, %asi
DS_1_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
tagged_1_194:
	tsubcctv %r1, 0x10c7, %r20
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_1_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_195:
	.word 0x8f902000  ! 338: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd48008a0  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_1_196:
	setx 0xdd5ccf9ff979491e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902133  ! 343: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad81f9f7  ! 345: WR_SOFTINT_REG_I	wr	%r7, 0x19f7, %softint
debug_1_198:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 346: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_1_199:
	taddcctv %r24, 0x18f8, %r8
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_1_200:
	tsubcctv %r19, 0x12d5, %r24
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_1_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_201-donret_1_201-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_1_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 352: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	setx 0x472e2423848d6bbd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_204:
	setx 0x292ace1526449807, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_205:
	set 0x60540000, %r31
	.word 0x8580798c  ! 355: WRCCR_I	wr	%r1, 0x198c, %ccr
	.word 0xa1902003  ! 356: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x95a00172  ! 358: FABSq	dis not found

	.word 0xa5540000  ! 359: RDPR_GL	<illegal instruction>
change_to_randtl_1_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_206:
	.word 0x8f902000  ! 360: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x83d02033  ! 361: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xab850011  ! 362: WR_CLEAR_SOFTINT_R	wr	%r20, %r17, %clear_softint
	.word 0x8d902ef0  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x0ef0, %pstate
	.word 0x91d02034  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_1_207:
	setx 0x72caa156f1511b61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_208:
	.word 0x819828cc  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
debug_1_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_1_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d948007  ! 368: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	setx 0xcb6ea2a714d3e4ee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d902cce  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x0cce, %pstate
	.word 0x9550c000  ! 372: RDPR_TT	<illegal instruction>
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd0800ae0  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x87802058  ! 376: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802080  ! 377: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93a1cdc7  ! 378: FdMULq	fdmulq	
splash_tba_1_213:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02032  ! 380: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01964  ! 381: FqTOd	dis not found

splash_cmpr_1_215:
	setx 0xd5154db571650a14, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_216:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 383: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	setx 0xaf181f96050c983b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 387: RDPC	rd	%pc, %r12
splash_hpstate_1_219:
	.word 0x81982a77  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a77, %hpstate
splash_tba_1_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_222:
	setx 0x2ccabf6e75c54a3e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xf9b2b9415a8c8f3f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0d1b8f3  ! 393: UMULcc_I	umulcc 	%r6, 0xfffff8f3, %r16
	.word 0xd697e000  ! 394: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x93d02032  ! 396: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x9b7027f5  ! 397: POPC_I	popc	0x07f5, %r13
splash_lsu_1_224:
	setx 0x71e73724f1bb1a73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022ee  ! 399: WRPR_TT_I	wrpr	%r0, 0x02ee, %tt
splash_cmpr_1_225:
	setx 0xc2063c84b9622da3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_226:
	set 0x60740000, %r31
	.word 0x8581e9fc  ! 401: WRCCR_I	wr	%r7, 0x09fc, %ccr
cwp_1_227:
    set user_data_start, %o7
	.word 0x93902004  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802f5f  ! 403: SIR	sir	0x0f5f
mondo_1_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d910005  ! 404: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
	.word 0xab832760  ! 405: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0760, %clear_softint
	.word 0xa190200b  ! 406: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_1_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_1_230:
	tsubcctv %r16, 0x105c, %r25
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x91540000  ! 409: RDPR_GL	<illegal instruction>
mondo_1_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d944008  ! 410: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
debug_1_232:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_233:
	setx 0xf88bd274c6040bef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_1_235:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902380  ! 416: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
debug_1_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_1_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d92000c  ! 418: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
tagged_1_238:
	tsubcctv %r23, 0x1bee, %r15
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a381c  ! 420: SDIVX_I	sdivx	%r8, 0xfffff81c, %r19
	.word 0x87902302  ! 421: WRPR_TT_I	wrpr	%r0, 0x0302, %tt
	.word 0x93d02033  ! 422: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76c2541  ! 424: SDIVX_I	sdivx	%r16, 0x0541, %r19
	rd %pc, %r19
	add %r19, (ivw_1_241-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_241:
	.word 0x9190c00d  ! 425: WRPR_PIL_R	wrpr	%r3, %r13, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cb7d9  ! 426: SDIVX_I	sdivx	%r18, 0xfffff7d9, %r20
splash_cmpr_1_243:
	setx 0x3f3f2b250a25f4eb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_244:
	setx 0x9e694bce31e43bb2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa76ac008  ! 429: SDIVX_R	sdivx	%r11, %r8, %r19
	setx 0x71ea2aac626228d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
pmu_1_247:
	nop
	setx 0xfffff0fffffff3ba, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_248:
	.word 0x8f902000  ! 433: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa190200b  ! 435: WRPR_GL_I	wrpr	%r0, 0x000b, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_1_250:
	setx 0x12206d1ef730437f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800c20  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
splash_lsu_1_251:
	setx 0x44e039ba08075a17, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_252:
	setx 0xeda334a5496c6fb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa7540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_253:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 443: RDPC	rd	%pc, %r9
splash_htba_1_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_1_255:
	taddcctv %r5, 0x169c, %r17
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_1_256:
	set 0x60140000, %r31
	.word 0x8584e890  ! 446: WRCCR_I	wr	%r19, 0x0890, %ccr
tagged_1_257:
	taddcctv %r12, 0x144d, %r1
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802004  ! 449: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_1_258:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99688000  ! 451: SDIVX_R	sdivx	%r2, %r0, %r12
	rd %pc, %r19
	add %r19, (ivw_1_259-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_259:
	.word 0x91940006  ! 452: WRPR_PIL_R	wrpr	%r16, %r6, %pil
	rd %pc, %r19
	add %r19, (ivw_1_260-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_260:
	.word 0x91918013  ! 453: WRPR_PIL_R	wrpr	%r6, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_261:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 454: RDPC	rd	%pc, %r13
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_262:
	setx 0x3b123dbaf5464d2d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_1_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3343727  ! 1: STQF_I	-	%f9, [0x1727, %r16]
	normalw
	.word 0xa9458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r20
memptr_1_264:
	set user_data_start, %r31
	.word 0x8580f71a  ! 459: WRCCR_I	wr	%r3, 0x171a, %ccr
debug_1_265:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_1_266:
	setx 0x5f1c198d3802bc50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a349d2  ! 463: FDIVd	fdivd	%f44, %f18, %f12
splash_htba_1_267:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e020  ! 465: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
splash_lsu_1_268:
	setx 0xe587e36a7372c217, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xb6cb48b33f53d164, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
splash_cmpr_1_270:
	setx 0xe563f5ecd425b73b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_1_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e020  ! 472: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
DS_1_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a249cb  ! 1: FDIVd	fdivd	%f40, %f42, %f10
	normalw
	.word 0x9b458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x87902012  ! 474: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
splash_cmpr_1_273:
	setx 0x348cf3183bff60e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f6, %f12
	.word 0xa9b20300  ! 476: ALIGNADDRESS	alignaddr	%r8, %r0, %r20
	.word 0x8d902c65  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0c65, %pstate
mondo_1_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d90c002  ! 478: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
	.word 0xda800b40  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
tagged_1_276:
	tsubcctv %r12, 0x1f1b, %r3
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_1_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x91450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd0cfe010  ! 484: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_1_278:
	setx 0x198e8671bc094728, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_1_279:
    set user_data_start, %o7
	.word 0x93902001  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f803443  ! 489: SIR	sir	0x1443
cwp_1_280:
    set user_data_start, %o7
	.word 0x93902006  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_1_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_281:
	.word 0x8f902003  ! 491: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
donret_1_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_282-donret_1_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x91d020b4  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_1_283:
	setx 0x41e9c4d19aa18c02, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_284:
	setx 0x999e782fca899227, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_1_285:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_286:
	tsubcctv %r11, 0x13e6, %r19
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x26700001  ! 1: BPL	<illegal instruction>
memptr_0_0:
	set user_data_start, %r31
	.word 0x85837a57  ! 2: WRCCR_I	wr	%r13, 0x1a57, %ccr
DS_0_1:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 3: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe46ffa57  ! 4: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffffa57]
	.word 0xa1902001  ! 5: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_0_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_2:
	.word 0x8f902002  ! 6: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_0_3:
	setx 0xf38b48f56dd7590a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d910003  ! 8: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
	.word 0x87802058  ! 9: WRASI_I	wr	%r0, 0x0058, %asi
donret_0_5:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_5-donret_0_5-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_5:
	.word 0xe4fffa57  ! 10: SWAPA_I	swapa	%r18, [%r31 + 0xfffffa57] %asi
change_to_randtl_0_6:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_6:
	.word 0x8f902000  ! 11: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_0_7:
    set user_data_start, %o7
	.word 0x93902004  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
splash_lsu_0_8:
	setx 0xbcf474366f7c3565, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037e4  ! 15: WRPR_PSTATE_I	wrpr	%r0, 0x17e4, %pstate
	.word 0x87902089  ! 16: WRPR_TT_I	wrpr	%r0, 0x0089, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_9
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_9:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 17: RDPC	rd	%pc, %r12
	.word 0xd8c804a0  ! 18: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
debug_0_10:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 19: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 20: LDSB_R	ldsb	[%r31 + %r0], %r12
cwp_0_11:
    set user_data_start, %o7
	.word 0x93902004  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa745c000  ! 22: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x8d902abf  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0abf, %pstate
splash_lsu_0_12:
	setx 0x236232471b356571, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 24: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 25: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1a00171  ! 26: FABSq	dis not found

splash_lsu_0_13:
	setx 0xfc91e210d64f037d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 27: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_14:
	set 0x60540000, %r31
	.word 0x8582baea  ! 28: WRCCR_I	wr	%r10, 0x1aea, %ccr
splash_hpstate_0_15:
	.word 0x81982dc7  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0xa5464000  ! 30: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x91d020b5  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_0_16:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cwp_0_17:
    set user_data_start, %o7
	.word 0x93902004  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe4880e40  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
splash_hpstate_0_18:
	.word 0x81982487  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
cwp_0_19:
    set user_data_start, %o7
	.word 0x93902004  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_20
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_20:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 37: RDPC	rd	%pc, %r9
	.word 0x87802080  ! 38: WRASI_I	wr	%r0, 0x0080, %asi
DS_0_21:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa9b28302  ! 39: ALIGNADDRESS	alignaddr	%r10, %r2, %r20
	.word 0xe80ffaea  ! 40: LDUB_I	ldub	[%r31 + 0xfffffaea], %r20
	.word 0x8d902a51  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0xe8c804a0  ! 42: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
debug_0_22:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 43: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d910006  ! 44: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_24) + 8, 16, 16)) -> intp(4,0,7)
intvec_0_24:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90250a  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x050a, %pstate
	.word 0xab84fca4  ! 47: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1ca4, %clear_softint
memptr_0_25:
	set 0x60140000, %r31
	.word 0x8582e315  ! 48: WRCCR_I	wr	%r11, 0x0315, %ccr
	.word 0xe927c000  ! 49: STF_R	st	%f20, [%r0, %r31]
splash_hpstate_0_26:
	.word 0x81982605  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
	.word 0xe89004a0  ! 51: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d902446  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0446, %pstate
	.word 0x91d02032  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 50
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
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 54: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xe81fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_28
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_28:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 56: RDPC	rd	%pc, %r10
	.word 0x87902296  ! 57: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
	.word 0x98d88009  ! 58: SMULcc_R	smulcc 	%r2, %r9, %r12
	setx 0x476afed580085009, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_29:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_30:
	.word 0x819822c7  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xa190200a  ! 61: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_0_31:
	.word 0x81982d0d  ! 62: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
donret_0_32:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_32-donret_0_32), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_32:
	.word 0xd8ffe315  ! 63: SWAPA_I	swapa	%r12, [%r31 + 0x0315] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196b  ! 64: FqTOd	dis not found

	.word 0x26700001  ! 65: BPL	<illegal instruction>
	.word 0xe6c7e000  ! 66: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0x87802088  ! 67: WRASI_I	wr	%r0, 0x0088, %asi
mondo_0_34:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d930013  ! 68: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_35
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_35:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 69: RDPC	rd	%pc, %r8
	.word 0x93a2cd33  ! 70: FsMULd	fsmuld	%f11, %f50, %f40
splash_hpstate_0_36:
	.word 0x81982c1e  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
splash_cmpr_0_37:
	setx 0x359fd16a7007f4a0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_38:
	setx 0xfa56d004bc624203, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 74: BPG	<illegal instruction>
	.word 0x22700001  ! 75: BPE	<illegal instruction>
memptr_0_39:
	set user_data_start, %r31
	.word 0x85823dc6  ! 76: WRCCR_I	wr	%r8, 0x1dc6, %ccr
intveclr_0_40:
	setx 0xea65aae83ba8c431, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_htba_0_41:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_0_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 80: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_0_43:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_43:
	.word 0x8f902003  ! 82: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa190200d  ! 83: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_0_44:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 84: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x91d020b3  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 179
memptr_0_45:
	set user_data_start, %r31
	.word 0x8584b786  ! 87: WRCCR_I	wr	%r18, 0x1786, %ccr
	.word 0xd2d00e80  ! 88: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
splash_tba_0_46:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 89: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x284e4f84b48114ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_47:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a7dc9  ! 92: SDIVX_I	sdivx	%r9, 0xfffffdc9, %r8
	.word 0x38700001  ! 93: BPGU	<illegal instruction>
mondo_0_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d940008  ! 94: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
splash_tba_0_50:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 95: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02035  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99540000  ! 97: RDPR_GL	<illegal instruction>
	.word 0x8790226c  ! 98: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
	.word 0xd8d804a0  ! 99: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
splash_lsu_0_51:
	setx 0xe5488dd70652cd4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cmp_0_52:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_52:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_52
    nop
cmp_wait0_52:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_52
    nop
    ba,a cmp_startwait0_52
continue_cmp_0_52:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x58, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940012  ! 101: WRPR_PIL_R	wrpr	%r16, %r18, %pil
splash_tba_0_53:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 102: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_54:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b34303  ! 103: ALIGNADDRESS	alignaddr	%r13, %r3, %r8
cwp_0_55:
    set user_data_start, %o7
	.word 0x93902002  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d9031bd  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x11bd, %pstate
	.word 0x8780201c  ! 106: WRASI_I	wr	%r0, 0x001c, %asi
DS_0_56:
	.word 0xa7a009cd  ! 1: FDIVd	fdivd	%f0, %f44, %f50
	.word 0x8d4cdba6	! Random illegal ?
	.word 0xe3150013  ! 1: LDQF_R	-	[%r20, %r19], %f17
	.word 0x93a3482d  ! 107: FADDs	fadds	%f13, %f13, %f9
	.word 0x87802080  ! 108: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1902009  ! 109: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_57:
	setx 0x7c08015def06a50b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 111: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_58)+56, 16, 16)) -> intp(0,1,3)
xir_0_58:
	.word 0xa9846e90  ! 112: WR_SET_SOFTINT_I	wr	%r17, 0x0e90, %set_softint
	.word 0xd327ee90  ! 113: STF_I	st	%f9, [0x0e90, %r31]
DS_0_59:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 114: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
donret_0_60:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_60-donret_0_60), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_60:
	.word 0xd2ffee90  ! 115: SWAPA_I	swapa	%r9, [%r31 + 0x0e90] %asi
	.word 0xa190200e  ! 116: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd297e020  ! 117: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0xd23fc000  ! 118: STD_R	std	%r9, [%r31 + %r0]
	.word 0x91a00167  ! 119: FABSq	dis not found

memptr_0_61:
	set 0x60140000, %r31
	.word 0x85817b63  ! 120: WRCCR_I	wr	%r5, 0x1b63, %ccr
	.word 0xd09ffb63  ! 121: LDDA_I	ldda	[%r31, + 0xfffffb63] %asi, %r8
	.word 0xa190200a  ! 122: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_0_62:
	.word 0x81982e4d  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4d, %hpstate
mondo_0_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d908014  ! 124: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
splash_hpstate_0_64:
	.word 0x81982a1f  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	.word 0x99450000  ! 126: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0x8790239e  ! 127: WRPR_TT_I	wrpr	%r0, 0x039e, %tt
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_65)+32, 16, 16)) -> intp(0,1,3)
xir_0_65:
	.word 0xa9843820  ! 128: WR_SET_SOFTINT_I	wr	%r16, 0x1820, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_0_66:
	setx 0x28bb3c0d396459d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 130: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_67:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_0_68:
	set 0x60740000, %r31
	.word 0x8585370a  ! 132: WRCCR_I	wr	%r20, 0x170a, %ccr
tagged_0_69:
	taddcctv %r4, 0x1f23, %r21
	.word 0xd807f70a  ! 133: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01968  ! 134: FqTOd	dis not found

splash_tba_0_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 135: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_72:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_72:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_72
    nop
debug_wait0_72:
    ld [%r23], %r2
    brnz %r2, debug_wait0_72
    nop
    ba,a debug_startwait0_72
continue_debug_0_72:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_72:
    cmp %r13, %r15
    bne,a wait_for_stat_0_72
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_72:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_72
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 136: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x97a18d31  ! 137: FsMULd	fsmuld	%f6, %f48, %f42
	.word 0xd727f70a  ! 138: STF_I	st	%f11, [0x170a, %r31]
splash_lsu_0_73:
	setx 0xf6b2621c27198397, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 139: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 140: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa9814012  ! 141: WR_SET_SOFTINT_R	wr	%r5, %r18, %set_softint
	.word 0x99a0c9c9  ! 142: FDIVd	fdivd	%f34, %f40, %f12
tagged_0_74:
	tsubcctv %r10, 0x1adc, %r10
	.word 0xd807f70a  ! 143: LDUW_I	lduw	[%r31 + 0xfffff70a], %r12
DS_0_75:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
donret_0_76:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_76-donret_0_76), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_76:
	.word 0xd8fff70a  ! 145: SWAPA_I	swapa	%r12, [%r31 + 0xfffff70a] %asi
	.word 0x8d90366d  ! 146: WRPR_PSTATE_I	wrpr	%r0, 0x166d, %pstate
	.word 0x2c700001  ! 147: BPNEG	<illegal instruction>
	.word 0x8790219a  ! 148: WRPR_TT_I	wrpr	%r0, 0x019a, %tt
	.word 0x3a700001  ! 149: BPCC	<illegal instruction>
change_to_randtl_0_77:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_77:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_0_78:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 151: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_79:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_80) + 48, 16, 16)) -> intp(0,0,31)
intvec_0_80:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_81:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 154: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa985000d  ! 155: WR_SET_SOFTINT_R	wr	%r20, %r13, %set_softint
splash_lsu_0_82:
	setx 0xcaa3144d24254f7f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_83:
	setx 0x4d9fb3a8567e6a43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 157: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_84:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 158: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_0_85:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 159: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802088  ! 160: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d9035f4  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x15f4, %pstate
	.word 0xa1902001  ! 162: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd93ff70a  ! 163: STDF_I	std	%f12, [0x170a, %r31]
cwp_0_86:
    set user_data_start, %o7
	.word 0x93902005  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
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
	.word 0xa5414000  ! 165: RDPC	rd	%pc, %r18
DS_0_88:
	.word 0x95a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f10
	.word 0xbfe7c000  ! 166: SAVE_R	save	%r31, %r0, %r31
cwp_0_89:
    set user_data_start, %o7
	.word 0x93902005  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 168: FqTOd	dis not found

splash_cmpr_0_91:
	setx 0x56fb45be9523a3e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 169: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_93:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 171: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_94:
	setx 0x375fa641fd9cce32, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902006  ! 173: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c700001  ! 175: BPNEG	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01968  ! 176: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c64f3  ! 177: SDIVX_I	sdivx	%r17, 0x04f3, %r18
tagged_0_97:
	taddcctv %r15, 0x14f6, %r22
	.word 0xe407e4f3  ! 178: LDUW_I	lduw	[%r31 + 0x04f3], %r18
debug_0_98:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 179: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b3d2d  ! 180: SDIVX_I	sdivx	%r12, 0xfffffd2d, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_100
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_100
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_100:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 181: RDPC	rd	%pc, %r10
intveclr_0_101:
	setx 0xdc95317172f5f5e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 183: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c2125  ! 184: SDIVX_I	sdivx	%r16, 0x0125, %r13
	.word 0x87902279  ! 185: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	.word 0xdac804a0  ! 186: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
debug_0_103:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 187: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdacfe010  ! 188: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
intveclr_0_104:
	setx 0x3befcf33f5a29baf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 190: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_hpstate_0_105:
	.word 0x8198256e  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x056e, %hpstate
debug_0_106:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
	.word 0xdbe7e008  ! 194: CASA_R	casa	[%r31] %asi, %r8, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 195: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_0_108:
	setx 0xb197650520fcb60d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_0_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9194365b  ! 198: WRPR_PIL_I	wrpr	%r16, 0x165b, %pil
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_110:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 199: RDPC	rd	%pc, %r9
	.word 0x97a009c8  ! 200: FDIVd	fdivd	%f0, %f8, %f42
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
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 201: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01969  ! 202: FqTOd	dis not found

DS_0_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f14, %f2
	.word 0x97b34311  ! 203: ALIGNADDRESS	alignaddr	%r13, %r17, %r11
splash_tba_0_114:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 204: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01963  ! 205: FqTOd	dis not found

intveclr_0_116:
	setx 0xe05b2f0e6c55294c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 206: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 207: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_0_117:
	.word 0x81982526  ! 208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0526, %hpstate
	.word 0x87902085  ! 209: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
debug_0_118:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad8533f3  ! 211: WR_SOFTINT_REG_I	wr	%r20, 0x13f3, %softint
	.word 0x8d902c11  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x0c11, %pstate
debug_0_119:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_120:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e003  ! 215: CASA_R	casa	[%r31] %asi, %r3, %r17
splash_lsu_0_121:
	setx 0xb847fc49ff198089, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe337c000  ! 217: STQF_R	-	%f17, [%r0, %r31]
splash_cmpr_0_122:
	setx 0x22e028bcbe650269, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_123:
	setx 0x5ff71eec1345225e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 219: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_0_124:
	setx 0xbffaab571fca4a71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_125:
	setx 0xa5993e4030c2bdd2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe31fc000  ! 223: LDDF_R	ldd	[%r31, %r0], %f17
tagged_0_126:
	tsubcctv %r12, 0x15a1, %r17
	.word 0xe207f3f3  ! 224: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r17
splash_tba_0_127:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 225: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196d  ! 226: FqTOd	dis not found

debug_0_129:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_129:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_129
    nop
debug_wait0_129:
    ld [%r23], %r2
    brnz %r2, debug_wait0_129
    nop
    ba,a debug_startwait0_129
continue_debug_0_129:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_129:
    cmp %r13, %r15
    bne,a wait_for_stat_0_129
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_129:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_129
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 227: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
tagged_0_130:
	tsubcctv %r11, 0x1a9f, %r17
	.word 0xd807f3f3  ! 228: LDUW_I	lduw	[%r31 + 0xfffff3f3], %r12
	.word 0x8d902840  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x0840, %pstate
	.word 0x91a00167  ! 230: FABSq	dis not found

debug_0_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 231: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x34700001  ! 232: BPG	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b3212  ! 233: SDIVX_I	sdivx	%r12, 0xfffff212, %r12
tagged_0_133:
	taddcctv %r25, 0x193b, %r12
	.word 0xd807f212  ! 234: LDUW_I	lduw	[%r31 + 0xfffff212], %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_134
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_134
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_134:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 235: RDPC	rd	%pc, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa368a769  ! 236: SDIVX_I	sdivx	%r2, 0x0769, %r17
	.word 0x8d902fc3  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0fc3, %pstate
DS_0_136:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
splash_tba_0_137:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 239: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97480000  ! 240: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_tba_0_138:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 241: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_0_139:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737e769  ! 243: STQF_I	-	%f11, [0x0769, %r31]
	.word 0xa190200a  ! 244: WRPR_GL_I	wrpr	%r0, 0x000a, %-
debug_0_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd66fe769  ! 246: LDSTUB_I	ldstub	%r11, [%r31 + 0x0769]
	.word 0xa5a00173  ! 247: FABSq	dis not found

	.word 0x3a700001  ! 248: BPCC	<illegal instruction>
cwp_0_141:
    set user_data_start, %o7
	.word 0x93902006  ! 249: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_142:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d92c008  ! 250: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0xa190200f  ! 251: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe48008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_0_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_144:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 254: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa1902008  ! 255: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_145:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 256: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 258: FqTOd	dis not found

	.word 0xe46fe769  ! 259: LDSTUB_I	ldstub	%r18, [%r31 + 0x0769]
	.word 0x8d903f3a  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1f3a, %pstate
mondo_0_147:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 261: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
cmp_0_148:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_148:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_148
    nop
cmp_wait0_148:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_148
    nop
    ba,a cmp_startwait0_148
continue_cmp_0_148:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91920013  ! 262: WRPR_PIL_R	wrpr	%r8, %r19, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 263: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xfed9a4fc5e9d9b7d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_149:
	.word 0x39400001  ! 264: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xe5e7e013  ! 265: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xe497e000  ! 266: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
DS_0_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f10, %f10
	.word 0xa9b4030a  ! 267: ALIGNADDRESS	alignaddr	%r16, %r10, %r20
	.word 0x8d902a7b  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0a7b, %pstate
splash_lsu_0_152:
	setx 0x62f78a00826ffb75, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 270: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
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
	.word 0xe9e7e00a  ! 271: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_tba_0_155:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 272: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_156:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb7574d09	! Random illegal ?
	.word 0xa9a0c9c7  ! 1: FDIVd	fdivd	%f34, %f38, %f20
	.word 0xa1a4082b  ! 273: FADDs	fadds	%f16, %f11, %f16
cmp_0_157:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_157:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_157
    nop
cmp_wait0_157:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_157
    nop
    ba,a cmp_startwait0_157
continue_cmp_0_157:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x4c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934004  ! 274: WRPR_PIL_R	wrpr	%r13, %r4, %pil
	.word 0x8d903d07  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1d07, %pstate
	.word 0xe0c004a0  ! 276: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
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
	.word 0xa3414000  ! 277: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 278: RDPC	rd	%pc, %r19
	.word 0x81460000  ! 279: RD_STICK_REG	stbar
debug_0_160:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 280: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe66fe769  ! 281: LDSTUB_I	ldstub	%r19, [%r31 + 0x0769]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_161)+24, 16, 16)) -> intp(0,1,3)
xir_0_161:
	.word 0xa98463f9  ! 282: WR_SET_SOFTINT_I	wr	%r17, 0x03f9, %set_softint
tagged_0_162:
	tsubcctv %r11, 0x15e6, %r12
	.word 0xe607e3f9  ! 283: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x83d02035  ! 284: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 285: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_0_163:
	taddcctv %r5, 0x1a6e, %r24
	.word 0xe607e3f9  ! 286: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0x8d802004  ! 287: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90374b  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x174b, %pstate
debug_0_164:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 289: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_165:
	setx 0x38cd32a4388576d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_166:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d95000d  ! 291: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
debug_0_167:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 292: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 293: LDX_R	ldx	[%r31 + %r0], %r19
splash_tba_0_168:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 294: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_169:
	setx 0x55dad5b24367bf2a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 295: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_170:
	tsubcctv %r18, 0x1ae6, %r8
	.word 0xe607e3f9  ! 296: LDUW_I	lduw	[%r31 + 0x03f9], %r19
	.word 0xa1902006  ! 297: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe727e3f9  ! 298: STF_I	st	%f19, [0x03f9, %r31]
	.word 0xe69fc020  ! 299: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x996c4000  ! 300: SDIVX_R	sdivx	%r17, %r0, %r12
	.word 0x87902266  ! 301: WRPR_TT_I	wrpr	%r0, 0x0266, %tt
change_to_randtl_0_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_171:
	.word 0x8f902002  ! 302: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902002  ! 303: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_hpstate_0_172:
	.word 0x81982a0e  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0e, %hpstate
cmp_0_173:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_173:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_173
    nop
cmp_wait0_173:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_173
    nop
    ba,a cmp_startwait0_173
continue_cmp_0_173:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x86, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934003  ! 305: WRPR_PIL_R	wrpr	%r13, %r3, %pil
cwp_0_174:
    set user_data_start, %o7
	.word 0x93902007  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_175:
	setx 0xebcd5f6d4f69132c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 307: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_176:
	setx 0x8782cd501e5962cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_177:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d920006  ! 309: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01961  ! 310: FqTOd	dis not found

	.word 0x8d903286  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1286, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023d6  ! 313: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01962  ! 314: FqTOd	dis not found

	.word 0xd88fe000  ! 315: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
cwp_0_180:
    set user_data_start, %o7
	.word 0x93902001  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_hpstate_0_181:
	.word 0x81982acf  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
debug_0_182:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 318: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_183:
	.word 0x91a509c7  ! 1: FDIVd	fdivd	%f20, %f38, %f8
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1150009  ! 1: LDQF_R	-	[%r20, %r9], %f8
	.word 0x95a2082c  ! 319: FADDs	fadds	%f8, %f12, %f10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01964  ! 320: FqTOd	dis not found

DS_0_185:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 321: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_0_186:
	setx 0x39dd8a0eed8f8ea2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 323: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_0_187:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_0_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_188:
	.word 0x8f902002  ! 326: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_0_189:
	setx 0xad89819f88577d83, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 327: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 328: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x26700001  ! 329: BPL	<illegal instruction>
splash_hpstate_0_190:
	.word 0x81982c5f  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5f, %hpstate
	.word 0xd527c000  ! 331: STF_R	st	%f10, [%r0, %r31]
debug_0_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 332: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d9022f7  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x02f7, %pstate
intveclr_0_192:
	setx 0x5d7c295883bc3cc7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 335: WRASI_I	wr	%r0, 0x0010, %asi
DS_0_193:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_0_194:
	tsubcctv %r8, 0x1947, %r26
	.word 0xd407e3f9  ! 337: LDUW_I	lduw	[%r31 + 0x03f9], %r10
change_to_randtl_0_195:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_195:
	.word 0x8f902003  ! 338: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd48008a0  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 340: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_0_196:
	setx 0xa0ab8b54a73e0366, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_197:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 342: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87902200  ! 343: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0x2a700001  ! 344: BPCS	<illegal instruction>
	.word 0xad823efd  ! 345: WR_SOFTINT_REG_I	wr	%r8, 0x1efd, %softint
debug_0_198:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_198:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_198
    nop
debug_wait0_198:
    ld [%r23], %r2
    brnz %r2, debug_wait0_198
    nop
    ba,a debug_startwait0_198
continue_debug_0_198:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_198:
    cmp %r13, %r15
    bne,a wait_for_stat_0_198
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_198:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_198
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00492  ! 346: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x34800001  ! 347: BG	bg,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r10
tagged_0_199:
	taddcctv %r3, 0x100a, %r7
	.word 0xd407fefd  ! 349: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
tagged_0_200:
	tsubcctv %r12, 0x153e, %r23
	.word 0xd407fefd  ! 350: LDUW_I	lduw	[%r31 + 0xfffffefd], %r10
donret_0_201:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_201-donret_0_201-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_201:
	.word 0xd4fffefd  ! 351: SWAPA_I	swapa	%r10, [%r31 + 0xfffffefd] %asi
mondo_0_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 352: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	setx 0xcc59a02f581fa604, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_203:
	.word 0x39400001  ! 353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_204:
	setx 0xa8c15bf30d56c91f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_205:
	set 0x60740000, %r31
	.word 0x8581229d  ! 355: WRCCR_I	wr	%r4, 0x029d, %ccr
	.word 0xa1902003  ! 356: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91a00161  ! 358: FABSq	dis not found

	.word 0xa7540000  ! 359: RDPR_GL	<illegal instruction>
change_to_randtl_0_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_206:
	.word 0x8f902000  ! 360: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02034  ! 361: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab82c00a  ! 362: WR_CLEAR_SOFTINT_R	wr	%r11, %r10, %clear_softint
	.word 0x8d902d36  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x0d36, %pstate
	.word 0x93d020b5  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_lsu_0_207:
	setx 0xcfa7494b6375ba03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_208:
	.word 0x81982bcc  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
debug_0_209:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 367: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d93400a  ! 368: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
	setx 0x8b2a60f7ed5c82fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_211:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe60fe29d  ! 370: LDUB_I	ldub	[%r31 + 0x029d], %r19
	.word 0x8d9035a1  ! 371: WRPR_PSTATE_I	wrpr	%r0, 0x15a1, %pstate
	.word 0x9150c000  ! 372: RDPR_TT	<illegal instruction>
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
	.word 0xd1e7e00a  ! 373: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd08008a0  ! 374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x22800001  ! 375: BE	be,a	<label_0x1>
	.word 0x8780208b  ! 376: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87802058  ! 377: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9ba08dc7  ! 378: FdMULq	fdmulq	
splash_tba_0_213:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 379: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02034  ! 380: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 381: FqTOd	dis not found

splash_cmpr_0_215:
	setx 0x5fea2e5a79edecf5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_216:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_216:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_216
    nop
debug_wait0_216:
    ld [%r23], %r2
    brnz %r2, debug_wait0_216
    nop
    ba,a debug_startwait0_216
continue_debug_0_216:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_216:
    cmp %r13, %r15
    bne,a wait_for_stat_0_216
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_216:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_216
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 383: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	setx 0x39fab0a48578f675, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_217:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91480000  ! 385: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x26800001  ! 386: BL	bl,a	<label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa1414000  ! 387: RDPC	rd	%pc, %r16
splash_hpstate_0_219:
	.word 0x81982467  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0467, %hpstate
splash_tba_0_220:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 389: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_0_221:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 390: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_222:
	setx 0x5ce024b9c54dab31, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 391: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x3ebed2e0d93ee1ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_223:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x96d1e4d5  ! 393: UMULcc_I	umulcc 	%r7, 0x04d5, %r11
	.word 0xd697e000  ! 394: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x20700001  ! 395: BPN	<illegal instruction>
	.word 0x91d020b5  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa3702bca  ! 397: POPC_I	popc	0x0bca, %r17
splash_lsu_0_224:
	setx 0xa7a3c165aad315b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020e0  ! 399: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
splash_cmpr_0_225:
	setx 0x9ca50cf40a35f160, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 400: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_0_226:
	set 0x60740000, %r31
	.word 0x858270bd  ! 401: WRCCR_I	wr	%r9, 0x10bd, %ccr
cwp_0_227:
    set user_data_start, %o7
	.word 0x93902000  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f803c81  ! 403: SIR	sir	0x1c81
mondo_0_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d940002  ! 404: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0xab8435d2  ! 405: WR_CLEAR_SOFTINT_I	wr	%r16, 0x15d2, %clear_softint
	.word 0xa1902001  ! 406: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_0_229:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 407: RESTORE_R	restore	%r31, %r0, %r31
tagged_0_230:
	tsubcctv %r5, 0x19ec, %r26
	.word 0xe207f5d2  ! 408: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r17
	.word 0x99540000  ! 409: RDPR_GL	<illegal instruction>
mondo_0_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 410: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
debug_0_232:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_233:
	setx 0x29e6c86bef5ea49d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 412: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 413: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xd927c000  ! 414: STF_R	st	%f12, [%r0, %r31]
debug_0_235:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 415: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902012  ! 416: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
debug_0_236:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 417: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_237:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d914002  ! 418: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
tagged_0_238:
	tsubcctv %r18, 0x1377, %r15
	.word 0xd807f5d2  ! 419: LDUW_I	lduw	[%r31 + 0xfffff5d2], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c21c8  ! 420: SDIVX_I	sdivx	%r16, 0x01c8, %r12
	.word 0x879022c3  ! 421: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0x93d02035  ! 422: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd8d804a0  ! 423: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ae4ca  ! 424: SDIVX_I	sdivx	%r11, 0x04ca, %r12
cmp_0_241:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_241:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_241
    nop
cmp_wait0_241:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_241
    nop
    ba,a cmp_startwait0_241
continue_cmp_0_241:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 60, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c009  ! 425: WRPR_PIL_R	wrpr	%r11, %r9, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c3183  ! 426: SDIVX_I	sdivx	%r16, 0xfffff183, %r16
splash_cmpr_0_243:
	setx 0x36b8112c379e0dea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 427: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_244:
	setx 0x3601586a2b134b04, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 428: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa36c400b  ! 429: SDIVX_R	sdivx	%r17, %r11, %r17
	setx 0x504d5a527df0eb08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_245:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_246:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 431: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
pmu_0_247:
	nop
	setx 0xfffff734fffff507, %g1, %g7
	.word 0xa3800007  ! 432: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_0_248:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_248:
	.word 0x8f902001  ! 433: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe257c000  ! 434: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xa1902000  ! 435: WRPR_GL_I	wrpr	%r0, 0x0000, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_249
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_249:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 436: CASA_R	casa	[%r31] %asi, %r11, %r17
splash_lsu_0_250:
	setx 0x7d09bc94e4a0b083, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_0_251:
	setx 0xfb3bd5a35b23dcdd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_252:
	setx 0xbaa7581729aa25a8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 440: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91540000  ! 442: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_253
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_253:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 443: RDPC	rd	%pc, %r12
splash_htba_0_254:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_0_255:
	taddcctv %r7, 0x15ae, %r20
	.word 0xd807f183  ! 445: LDUW_I	lduw	[%r31 + 0xfffff183], %r12
memptr_0_256:
	set 0x60140000, %r31
	.word 0x858463fe  ! 446: WRCCR_I	wr	%r17, 0x03fe, %ccr
tagged_0_257:
	taddcctv %r10, 0x1195, %r19
	.word 0xd807e3fe  ! 447: LDUW_I	lduw	[%r31 + 0x03fe], %r12
	.word 0xd91fe3fe  ! 448: LDDF_I	ldd	[%r31, 0x03fe], %f12
	.word 0x87802004  ! 449: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_0_258:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 450: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x956c8014  ! 451: SDIVX_R	sdivx	%r18, %r20, %r10
cmp_0_259:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_259:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_259
    nop
cmp_wait0_259:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_259
    nop
    ba,a cmp_startwait0_259
continue_cmp_0_259:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x5c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194400c  ! 452: WRPR_PIL_R	wrpr	%r17, %r12, %pil
cmp_0_260:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_260:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_260
    nop
cmp_wait0_260:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_260
    nop
    ba,a cmp_startwait0_260
continue_cmp_0_260:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91920013  ! 453: WRPR_PIL_R	wrpr	%r8, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_261
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_261
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_261:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 454: RDPC	rd	%pc, %r11
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_262:
	setx 0xace42645db25b99f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 456: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd130236e  ! 1: STQF_I	-	%f8, [0x036e, %r0]
	normalw
	.word 0xa5458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r18
memptr_0_264:
	set user_data_start, %r31
	.word 0x858536cd  ! 459: WRCCR_I	wr	%r20, 0x16cd, %ccr
debug_0_265:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 460: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe527f6cd  ! 461: STF_I	st	%f18, [0x16cd, %r31]
splash_cmpr_0_266:
	setx 0x8cda232788990468, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 462: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a509c9  ! 463: FDIVd	fdivd	%f20, %f40, %f42
splash_htba_0_267:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 464: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd6c7e020  ! 465: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
splash_lsu_0_268:
	setx 0x4f8cbf3b08a44ee3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x1ba48515db9d4616, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_269:
	.word 0x39400001  ! 467: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
splash_cmpr_0_270:
	setx 0x75c066e297e0240d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 470: BPGE	<illegal instruction>
DS_0_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4d7e010  ! 472: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
DS_0_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a089c8  ! 1: FDIVd	fdivd	%f2, %f8, %f18
	normalw
	.word 0xa9458000  ! 473: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x879020e4  ! 474: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
splash_cmpr_0_273:
	setx 0x0fa87ee1f69e3a16, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 475: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_274:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f4, %f10
	.word 0x9bb00307  ! 476: ALIGNADDRESS	alignaddr	%r0, %r7, %r13
	.word 0x8d902737  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0737, %pstate
mondo_0_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d908005  ! 478: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
	.word 0xda8008a0  ! 479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_0_276:
	tsubcctv %r7, 0x118f, %r19
	.word 0xda07f6cd  ! 480: LDUW_I	lduw	[%r31 + 0xfffff6cd], %r13
splash_htba_0_277:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 481: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	.word 0x91450000  ! 483: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd0cfe000  ! 484: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_0_278:
	setx 0xcd9496a33bc2b8ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 486: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_0_279:
    set user_data_start, %o7
	.word 0x93902005  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f8030df  ! 489: SIR	sir	0x10df
cwp_0_280:
    set user_data_start, %o7
	.word 0x93902005  ! 490: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_0_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_281:
	.word 0x8f902000  ! 491: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
donret_0_282:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_282-donret_0_282), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_282:
	.word 0xd0fff0df  ! 492: SWAPA_I	swapa	%r8, [%r31 + 0xfffff0df] %asi
	.word 0x93d020b3  ! 493: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x36800001  ! 494: BGE	bge,a	<label_0x1>
splash_cmpr_0_283:
	setx 0xa58223d941851f71, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_284:
	setx 0x230b485a0c80d851, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 496: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_0_285:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 497: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_0_286:
	tsubcctv %r16, 0x1c33, %r8
	.word 0xd007f0df  ! 498: LDUW_I	lduw	[%r31 + 0xfffff0df], %r8
cmpenall_0_287:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_287:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_287
    nop
cmpenall_wait0_287:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_287
    nop
    ba,a cmpenall_startwait0_287
continue_cmpenall_0_287:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_287:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_287
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_287:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_287
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

	.xword	0xcec8eb6a953d1f00
	.xword	0x25b4fece7f7c7268
	.xword	0xeb8865c0c4de012f
	.xword	0xd31274224c2464e3
	.xword	0x678f9a630eb2a6f1
	.xword	0x957dfa7391717f8a
	.xword	0xdaffcaf574ce418e
	.xword	0x7afb443cb04b9676
	.xword	0x904c56fcf33cd44c
	.xword	0x55e21ae95d846d42
	.xword	0x5d60f833e3c6f571
	.xword	0xc833f19945064b0f
	.xword	0x5af84637c2f9a43c
	.xword	0x682365dc956f1695
	.xword	0xe4946ff173b9b2fc
	.xword	0x4d3cc238fcd0cdb3
	.xword	0x2f991ecad539442b
	.xword	0x0566ec4fc09f8aff
	.xword	0x5e7a12dabb12adb2
	.xword	0x74c986ff3edf5229
	.xword	0xc185cdd943a4fce2
	.xword	0x4b112149f61b87d2
	.xword	0x9d58d42b6db87b71
	.xword	0x7fc0cf8c0da6899e
	.xword	0x35ef2d0f6a494729
	.xword	0x8932a8e58240a925
	.xword	0x5ca21f9e60a3bbb8
	.xword	0xb2e4fc274d6bbc77
	.xword	0x31b51e524136b715
	.xword	0x90b158bc0d1f285d
	.xword	0x53ab60c082e9aa93
	.xword	0x9d6ed75f5d7ca0d4
	.xword	0xe85fc7d76bcad481
	.xword	0xda86bbc7d760a2da
	.xword	0xf7caeb8e07bf8e7b
	.xword	0x5c43c120f6bf9564
	.xword	0x61513b03c6a371a0
	.xword	0x169c3c25d188f382
	.xword	0xc6af84e62105876e
	.xword	0x1c514da38c65cf9b
	.xword	0xd902ab2b92af933e
	.xword	0x6ab78a52420f741b
	.xword	0x3a36df706fe686ac
	.xword	0xb4f1e5d1d02d9e87
	.xword	0xacb5601ed4fc5b01
	.xword	0x0c1a21e734efb971
	.xword	0x47f274fb55a9efeb
	.xword	0xb98e1caf3486daec
	.xword	0x564be41a8b115825
	.xword	0x7b2f466e5c374797
	.xword	0x8fff6a4044e9ed44
	.xword	0xf844f33634711f3f
	.xword	0x295a5fca7ffeb0b1
	.xword	0x98f0caabf5698c58
	.xword	0x86e9b885a25d344d
	.xword	0x8a99be144a48bf5c
	.xword	0x7d543fe99e78a488
	.xword	0x731af2c81e45336b
	.xword	0x960681ddfe11226e
	.xword	0x11af2a808ad99e9d
	.xword	0xe270f7f7779303f9
	.xword	0xbd5afbe9910e6c3f
	.xword	0xf35ab394e15f2bf7
	.xword	0xb651764fc6c43291
	.xword	0x5b7c7f5ce8a7784c
	.xword	0x33c58fa49c57d6c8
	.xword	0xf4b94b97c2f8eb92
	.xword	0xdec6f45ddb18fa5d
	.xword	0x86d4163352d4d8cf
	.xword	0x75b552784a80eb98
	.xword	0x63fc0ad4717b52e6
	.xword	0x90a852d533c4d4bc
	.xword	0x6a4cee6a53876022
	.xword	0x8a016cc72e6b179a
	.xword	0xbcaaa1c94d9c359b
	.xword	0xedc7759dac00712f
	.xword	0xb9139f582a1aa5fc
	.xword	0x2a227b5943e67f4b
	.xword	0xe5bcdab95b3323b6
	.xword	0x16f5331895fe8655
	.xword	0xb591e01e275c775b
	.xword	0x94e07940999fb263
	.xword	0xf970fd995d2aca78
	.xword	0x9f7065d30ec5368e
	.xword	0x3b91eabbc9df6511
	.xword	0x4a55efbe8c92dcde
	.xword	0x40d30c5ecdc1d2f8
	.xword	0x1bb767d9279fea2b
	.xword	0xbccb4f7280df6bf7
	.xword	0xc30476334f4487bc
	.xword	0x4f9efef50b1848e0
	.xword	0x8ed20df350fe992e
	.xword	0x2ebaff11045933ed
	.xword	0xa772b3c9ed378501
	.xword	0xd10b03b636d479c7
	.xword	0x089cb469740cf728
	.xword	0x93f8c9a02254bc18
	.xword	0x078bd62f54757631
	.xword	0xa293d63a47ac12ca
	.xword	0x96c11e4a20ea85ca
	.xword	0xcaa2e68230c0107b
	.xword	0x5679171370454d5e
	.xword	0x39c39ce37b42c29d
	.xword	0x145a49b2659c4322
	.xword	0x6abc61e536b20a57
	.xword	0xa3bc62bf055c23a0
	.xword	0xcb8f64158a960ad7
	.xword	0x8f74388080cfbbda
	.xword	0x1e589ea9e1741810
	.xword	0x766b93142bb3ee62
	.xword	0x37e0a55282a1eb84
	.xword	0x752b2b968eeb2b22
	.xword	0xbb6b4966eedd47ad
	.xword	0x1fbdb029cb93bec8
	.xword	0xce76420eb58a1f93
	.xword	0x0554e96277f38a50
	.xword	0xde66727806f010b7
	.xword	0x3f9a12380fca24da
	.xword	0xae711e175384d813
	.xword	0x4a711a7b54f2c700
	.xword	0xd5eaa199e5af802a
	.xword	0x3fb09b2b250e90a4
	.xword	0xbda9a3d233d07f55
	.xword	0xd3583f2f211dfec9
	.xword	0x27588712c6ab2358
	.xword	0xcbf0d94e850c9107
	.xword	0x3b0f33350af61b8d
	.xword	0xb6406bd28e8e8f77
	.xword	0x40d66b7a1b63000b
	.xword	0x1d08e67d0c87a1e3
	.xword	0xa929547b82f14d1d
	.xword	0xc8f7c340730ad9e0
	.xword	0x6b696d03ea872735
	.xword	0xdef753b8916c34f5
	.xword	0x46e21f0d2395063e
	.xword	0x6c8eb14b6d5e2c8c
	.xword	0x6c0e61023a220140
	.xword	0xdd68524c6aa6692e
	.xword	0x852d793f5adc5a48
	.xword	0x9f85dd0578cfbf11
	.xword	0x89d2465161887afd
	.xword	0x2e48efb150e5b919
	.xword	0xffd1f2d857193865
	.xword	0x66f751c456f34481
	.xword	0x6b19201344786db9
	.xword	0x34bff7563ce5e849
	.xword	0x1ad7b3eedc94904a
	.xword	0x81d1620d604a0d4f
	.xword	0xc71e8a11ca5740e3
	.xword	0x43d93d98c2d19f74
	.xword	0x6a8dbf3d72b88251
	.xword	0x0fcc2007cbaaa82c
	.xword	0x103a5df7a54f5124
	.xword	0x2bc069c11acb3db4
	.xword	0xfb2b35a6c475ca64
	.xword	0x1155bd655be8ea06
	.xword	0x0c18374c60431442
	.xword	0xcb75a18cd4301c68
	.xword	0x04dfcfaae7a08910
	.xword	0x801f6ff9e93839c5
	.xword	0x3b13fe0f8798d8a3
	.xword	0xff1513c2ef296b72
	.xword	0x1cace272d9fa1ae2
	.xword	0xa35aa5cea4517d18
	.xword	0xf6f5c60cd511b8ae
	.xword	0x9bf4085030430324
	.xword	0xaecb92e3059dd198
	.xword	0xf5c8a19cf5638d37
	.xword	0xfb002122c366dbcd
	.xword	0xe29a9aea73e178c4
	.xword	0xb7fee5ef2810679d
	.xword	0x46ee75bb6bea66f1
	.xword	0xe1605275f32f3c32
	.xword	0xef3bff79a76b7308
	.xword	0x6b539bf3d0534054
	.xword	0x7d9b947172f1cd61
	.xword	0x602899052bf235f8
	.xword	0x083c5677b4bde6b9
	.xword	0xe82b905753fcecb5
	.xword	0x01d344cfc508a322
	.xword	0xa227036e23639a4a
	.xword	0xad3244cb32b4ea72
	.xword	0xd2a68c8f2c122f41
	.xword	0x18cc583ec6071df6
	.xword	0x53a7c132e64e4ee4
	.xword	0x1877c5933cf3dab5
	.xword	0x6e7492d7203701e9
	.xword	0x736ad1899c026906
	.xword	0xc8b1606af54b0773
	.xword	0xcb6314f406a34f14
	.xword	0xef1114f520826e8a
	.xword	0x6df703d85fc2ba69
	.xword	0xc06a9b3eab0e89db
	.xword	0xa318c2be352160fc
	.xword	0x289a85be57a42a44
	.xword	0xd16e3bc2df90580a
	.xword	0x2e6f5a404e3b3c57
	.xword	0xd575d73dcc2e62b7
	.xword	0x7ec434258e2b316f
	.xword	0xc31cb810aad19997
	.xword	0x4be6e2d1fba3b88a
	.xword	0x90322e9171b92ec1
	.xword	0x5ff2b98cdee585e1
	.xword	0x65a42c0a5056cd36
	.xword	0x73ca14521771da9a
	.xword	0xf6a8d6e780df6894
	.xword	0xe153847484ebe779
	.xword	0xcc82e5786375fcf0
	.xword	0xd5dee46ed61b3a5a
	.xword	0xb43c8c1ef5a22e0b
	.xword	0x9c492307d4db9d26
	.xword	0x4d9694116a97be4b
	.xword	0x860a57b1e98a9bd0
	.xword	0x78cbd815afc3f192
	.xword	0x6c606822e8fb1624
	.xword	0x3586be46a9ad2fd2
	.xword	0xdf02401c40189800
	.xword	0xe4f07247a8118ab5
	.xword	0x374b241c724e3674
	.xword	0xb9d483e93044dc39
	.xword	0xf32e25547c3dac66
	.xword	0x410e90569b2c2fe2
	.xword	0x34ac7c1e5487a3a6
	.xword	0x790ed581e0747125
	.xword	0x2db8c624d30a787b
	.xword	0x93514b6a92dc9345
	.xword	0xccf3d5ec6577a4b9
	.xword	0x3f1707223fc5bebf
	.xword	0xc801b264d41daa1a
	.xword	0x12eed708ccf50d18
	.xword	0x7f86f9a84f29597d
	.xword	0xa08aca0e0dd5bdcc
	.xword	0x18ca290008c5553d
	.xword	0x4d09d08e2728e7c4
	.xword	0xc8eb1d3c7739ba3a
	.xword	0x643ef5bd40d19afc
	.xword	0x14d30a242fdc3c36
	.xword	0x31032fb5e7a6b24c
	.xword	0x1912fcaa88e808a9
	.xword	0x38953e33146a6406
	.xword	0x562937dc57daa69a
	.xword	0x1a7e78730a17afd1
	.xword	0xb817d26a2d78af25
	.xword	0x19853107adbd6916
	.xword	0xfe23fc3cd039b101
	.xword	0xa83a6c8687e8359f
	.xword	0x1fa1c63fdfd4c333
	.xword	0xa7149eaba3c75261
	.xword	0x7fa34b4f832c3c23
	.xword	0x7f41d15a90b28ab1
	.xword	0xfa35db3e5edc5c3a
	.xword	0x402af8d559de1a62
	.xword	0x2b79e5581af4a47a
	.xword	0xd6b02c6e5d257910
	.xword	0xddcf39b29305d96d
	.xword	0x738d8802675564c1

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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x1702f1197d7f92ee
	.xword	0x3de3dd9c84be2996
	.xword	0x8c973bff6bb7a61a
	.xword	0x827699e8d55c2042
	.xword	0x249a25e9d6f7abfa
	.xword	0x64e8379bf9f92740
	.xword	0xfa3cc0c52baaeeb4
	.xword	0x1f198e5da494c870
	.xword	0xce5411709cf1201f
	.xword	0xf201677999e418f8
	.xword	0xb484f21eeef623f6
	.xword	0x0dbb05ecef2b40af
	.xword	0xe2a8fe13daccd420
	.xword	0xec3ca2718ac27e68
	.xword	0x845aabe36b48dc6e
	.xword	0x7cb2fcd6c3f7c88e
	.xword	0x7e14225ad1b5dbf0
	.xword	0x9f745c010922f08d
	.xword	0x2bf8c9e994221c77
	.xword	0x7345cbf0b8a7740f
	.xword	0x4d9f3947601b8c26
	.xword	0x760fb3e1ca1b5913
	.xword	0xa9b409623245886f
	.xword	0x5aae545214b12d56
	.xword	0xf98fc4f712f1ef32
	.xword	0x5964134b689e7c9e
	.xword	0xd7d1f5c8a1199015
	.xword	0x922b472ce549d72b
	.xword	0xb8ff554d0040526e
	.xword	0x3130241e2c9be620
	.xword	0x6a5b5285e6a097f6
	.xword	0x05d5c318739073ce



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
	.xword	0x9c5be49d55ea40ff
	.xword	0x90229470a9cfc7d4
	.xword	0x28dc34a635fe3304
	.xword	0xed8d3d8dec649ad5
	.xword	0x433fedada71feb4d
	.xword	0xb0d38dd15b34aed1
	.xword	0xd57adfe813d0c165
	.xword	0x3ad8a515aa91423c
	.xword	0x07339641a6d95d76
	.xword	0x4db94f8b289dda75
	.xword	0x29ba0119a7639895
	.xword	0xee20c7e7e8116f95
	.xword	0x5357f78e72c2e629
	.xword	0x31650432320f50cc
	.xword	0x344b121261e02fe1
	.xword	0xcba21f856df59acb
	.xword	0x72581b406f17986f
	.xword	0xc8d7c249e40e40e9
	.xword	0x2098a97609ee857c
	.xword	0x5ea3b6cb23ee7fe8
	.xword	0x83b7e1a22fddba2b
	.xword	0xb9c9ca5f4243dd23
	.xword	0x39184817a4896129
	.xword	0xa29e553253731446
	.xword	0x2561f4cb55140638
	.xword	0xf457fc50adb1fb40
	.xword	0x5bd581ff854b5c33
	.xword	0x1719225127435999
	.xword	0x1dc2f0497222b6f2
	.xword	0x1f313a668b08e881
	.xword	0x877b3ff0a5c8f2a6
	.xword	0x91b3443a607fca09



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
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	.xword	0xc167b57ed5b4898f
	.xword	0xd978ee1a80e2610f
	.xword	0x38a7629087cfdbaa
	.xword	0x652e6b0b3deaf418
	.xword	0x3655f912cbbb97cc
	.xword	0xe86508bcda6205f4
	.xword	0xd5fa3e59e6bb4e8b
	.xword	0xa027f8d8847783d3
	.xword	0x3fb9536cdf44876f
	.xword	0x0d772106467a7467
	.xword	0x5c72e77a46845622
	.xword	0xb4418f191e5dd134
	.xword	0xe482f820e52936c8
	.xword	0xc8bd2d7cb4a345a9
	.xword	0xb4fe5a12cbeb228d
	.xword	0xbf285eff077443d7
	.xword	0x15f1225739c2cfaf
	.xword	0x7cf7d6c9d78f191a
	.xword	0xb6fba9c47034fd10
	.xword	0x431153003937ebb1
	.xword	0x9e237a8156dfb927
	.xword	0x6a970c7ff894a1cc
	.xword	0xa1abc02eae5a23f3
	.xword	0x2be4b7a057b5817f
	.xword	0x2e98166e193fa401
	.xword	0x4db2d0b6d30a2b8a
	.xword	0x0cbe8132e80f487c
	.xword	0x049535268535e327
	.xword	0xbf31f32c28dc4972
	.xword	0x01bd69223e6bf96e
	.xword	0xa73874aa9fdc8c05
	.xword	0x6cd20613e705ba6d



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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	.xword	0xd94bc1a5824802df
	.xword	0x93ef2226167d0d31
	.xword	0x17d6e2d1314f3db5
	.xword	0x75d8f9c1bba5886c
	.xword	0x7f9ada297b6b7218
	.xword	0xb28a46bd2d92b669
	.xword	0x62521c3cace2fe1f
	.xword	0x15f3116233536b4c
	.xword	0x6e4a1a0c1d086f7d
	.xword	0xdf0667bab4b3eb33
	.xword	0x4d657bef1c94f9b2
	.xword	0x93e78ac69445e575
	.xword	0xd7f02ac21fe448f1
	.xword	0x80c6535eea8b49f1
	.xword	0xfb976319867cb339
	.xword	0x8ab1c875d7cb3d34
	.xword	0xb1031f704bcbcd13
	.xword	0x6983f5004a91466c
	.xword	0x570ff03ab734b601
	.xword	0x77952f1b8fe188cf
	.xword	0x719ce58c1d6c17db
	.xword	0x02b8c8be2f21b43d
	.xword	0xd21583b85ea67895
	.xword	0xbf65499c30887b1a
	.xword	0x739195813427deac
	.xword	0x4b016a2e4695d858
	.xword	0xfc05015a91708459
	.xword	0x518940e8d74db576
	.xword	0x34c7ca6559d1a830
	.xword	0xb350a2b624f37de6
	.xword	0x822b24226233db7c
	.xword	0x8ea3af2215c425e0



#if 0
#endif

