/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_34.s
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
    done;nop
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
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g5, %g3 ;\
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
	mov 0x34, %r14
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
	mov 0x31, %r14
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
	mov 0x31, %r14
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
	mov 0xb0, %r14
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
debug_7_0:
	nop
	mov 8, %r18
splash_hpstate_7_1:
	.word 0x81982e9c  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
splash_hpstate_7_2:
	.word 0x8198279f  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_7_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_7_5:
	setx 0xdd95319325334fe1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_7_6:
	setx 0x1a45e80df8db9c35, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_7_7:
	setx 0x5fc607b0a23ffb54, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe28008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 11: FqTOd	dis not found

	.word 0xda880e60  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_7_9:
	.word 0x8198244c  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044c, %hpstate
mondo_7_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d924005  ! 16: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
mondo_7_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d934005  ! 17: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
	.word 0x91d02033  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802063  ! 19: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_7_12:
	setx 0xd60b52d52c6706c1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_13:
	setx 0xa8207136586836a3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01960  ! 22: FqTOd	dis not found

debug_7_15:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 23: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_7_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_16:
	.word 0x8f902000  ! 25: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 26: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01969  ! 27: FqTOd	dis not found

intveclr_7_18:
	setx 0xd82139dc3973fa5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803118  ! 29: SIR	sir	0x1118
	.word 0xa7a489c0  ! 30: FDIVd	fdivd	%f18, %f0, %f50
	.word 0x87802055  ! 31: WRASI_I	wr	%r0, 0x0055, %asi
debug_7_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_20:
	.word 0x93a00169  ! 33: FABSq	dis not found

	.word 0x8780201c  ! 34: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x9f8033bc  ! 35: SIR	sir	0x13bc
	.word 0x8d903ba4  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x1ba4, %pstate
	.word 0xa1902005  ! 37: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b6e9b  ! 38: SDIVX_I	sdivx	%r13, 0x0e9b, %r13
splash_tba_7_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_23:
	setx 0x92052247a1862c96, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a0c9c3  ! 41: FDIVd	fdivd	%f34, %f34, %f40
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
donret_7_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_24-donret_7_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_7_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200b  ! 47: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902354  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0354, %pstate
	.word 0x9f803f35  ! 49: SIR	sir	0x1f35
splash_tba_7_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_27)) -> intp(7,1,3)
xir_7_27:
	.word 0xa982fb63  ! 51: WR_SET_SOFTINT_I	wr	%r11, 0x1b63, %set_softint
	.word 0xa1902004  ! 52: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93d02032  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_randtl_7_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_28:
	.word 0x8f902001  ! 54: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_7_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94400d  ! 55: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_7_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_30:
	.word 0xa5a00168  ! 57: FABSq	dis not found

splash_tba_7_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_32)) -> intp(5,0,6)
intvec_7_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903405  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x1405, %pstate
change_to_randtl_7_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_33:
	.word 0x8f902001  ! 61: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902101  ! 62: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
tagged_7_34:
	tsubcctv %r7, 0x1a02, %r12
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802004  ! 64: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_7_35:
	taddcctv %r24, 0x11db, %r16
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x87902254  ! 66: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
mondo_7_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d918001  ! 67: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	.word 0x83d02035  ! 68: Tcc_I	te	icc_or_xcc, %r0 + 53
	setx 0xeeb3028a24aa817e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d930014  ! 70: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x9f8038aa  ! 71: SIR	sir	0x18aa
	.word 0x91d020b4  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xad81f87c  ! 73: WR_SOFTINT_REG_I	wr	%r7, 0x187c, %softint
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_7_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_39:
	.word 0x8f902000  ! 75: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_7_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa7a48834  ! 78: FADDs	fadds	%f18, %f20, %f19
DS_7_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x95b48301  ! 79: ALIGNADDRESS	alignaddr	%r18, %r1, %r10
splash_tba_7_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01964  ! 81: FqTOd	dis not found

	.word 0xa282b368  ! 82: ADDcc_I	addcc 	%r10, 0xfffff368, %r17
	setx 0xfb314528097b4dff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_46:
	.word 0x95a00160  ! 84: FABSq	dis not found

intveclr_7_47:
	setx 0x03dba8400ce0a4d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01973  ! 86: FqTOd	dis not found

	.word 0x99902001  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
intveclr_7_49:
	setx 0x8117477e9738ff4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 91: FqTOd	dis not found

	.word 0xd0c7e020  ! 92: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0xa980c009  ! 93: WR_SET_SOFTINT_R	wr	%r3, %r9, %set_softint
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_7_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_51:
	.word 0x8f902002  ! 95: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd0d7e000  ! 96: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_7_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_52-donret_7_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_7_53:
	setx 0x0fd1178d51fcb4ba, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_54)) -> intp(2,0,10)
intvec_7_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_55:
	setx 0x8d3719b467e64ecc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd08008a0  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_tba_7_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_57:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 104: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_58:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 105: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_59:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 106: RDPC	rd	%pc, %r8
splash_cmpr_7_60:
	setx 0x9bfe946dbbc00873, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d9030bf  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x10bf, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d00e40  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r20
	.word 0xa76b4008  ! 112: SDIVX_R	sdivx	%r13, %r8, %r19
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x8980e52a7c7859b9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d900003  ! 115: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
tagged_7_63:
	taddcctv %r1, 0x14d4, %r24
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa190200b  ! 118: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	rd %pc, %r19
	add %r19, (ivw_7_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_64:
	.word 0x95a00162  ! 119: FABSq	dis not found

	.word 0x87802016  ! 120: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8790238c  ! 121: WRPR_TT_I	wrpr	%r0, 0x038c, %tt
	.word 0x93902007  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	setx 0x5cc196182492c2a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_66:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 124: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_7_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902004  ! 128: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_7_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 129: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
debug_7_69:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 130: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_7_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_7_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_71-donret_7_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_72:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 133: RDPC	rd	%pc, %r17
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_7_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f2, %f10, %f8
	.word 0xa5b48304  ! 135: ALIGNADDRESS	alignaddr	%r18, %r4, %r18
	.word 0x87802014  ! 136: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xad81e7c8  ! 137: WR_SOFTINT_REG_I	wr	%r7, 0x07c8, %softint
	.word 0x8d903616  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1616, %pstate
	.word 0x87802010  ! 139: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_7_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad84be53  ! 141: WR_SOFTINT_REG_I	wr	%r18, 0x1e53, %softint
	.word 0x93902006  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a409c5  ! 143: FDIVd	fdivd	%f16, %f36, %f12
mondo_7_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90800d  ! 144: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x93902003  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x919378e9  ! 147: WRPR_PIL_I	wrpr	%r13, 0x18e9, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
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
	.word 0xa3414000  ! 148: RDPC	rd	%pc, %r17
	.word 0x8d90205d  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_77:
	.word 0x95a00172  ! 151: FABSq	dis not found

	.word 0xa3480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
change_to_randtl_7_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_78:
	.word 0x8f902000  ! 153: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_7_79:
	.word 0x81982e95  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e95, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0xa9540000  ! 157: RDPR_GL	rdpr	%-, %r20
splash_cmpr_7_80:
	setx 0x62d0d30463d2ddf7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d903e19  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x1e19, %pstate
	.word 0x87802020  ! 161: WRASI_I	wr	%r0, 0x0020, %asi
change_to_randtl_7_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_81:
	.word 0x8f902000  ! 162: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x83d020b5  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x9f80304f  ! 164: SIR	sir	0x104f
	.word 0x9190664c  ! 165: WRPR_PIL_I	wrpr	%r1, 0x064c, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87902267  ! 167: WRPR_TT_I	wrpr	%r0, 0x0267, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6800c00  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
splash_hpstate_7_82:
	.word 0x81982b5f  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
change_to_randtl_7_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_83:
	.word 0x8f902001  ! 171: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_7_84:
	.word 0x81982af4  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0af4, %hpstate
	.word 0xd68008a0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	rd %pc, %r19
	add %r19, (ivw_7_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_85:
	.word 0x95a00173  ! 174: FABSq	dis not found

	.word 0x99540000  ! 175: RDPR_GL	rdpr	%-, %r12
	.word 0xa980800d  ! 176: WR_SET_SOFTINT_R	wr	%r2, %r13, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_7_86:
	tsubcctv %r17, 0x16ad, %r7
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_7_87:
	setx 0x6f8e91f8fba4b556, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa44d0012  ! 180: MULX_R	mulx 	%r20, %r18, %r18
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_88:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196d  ! 182: FqTOd	dis not found

debug_7_90:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 183: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7683504  ! 185: SDIVX_I	sdivx	%r0, 0xfffff504, %r19
	.word 0x91d02032  ! 186: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_7_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d90400b  ! 187: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
intveclr_7_93:
	setx 0x811b3df78baab3e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5500000  ! 189: RDPR_TPC	rdpr	%tpc, %r18
splash_lsu_7_94:
	setx 0x2d4f26ed1c6c114b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1703cae  ! 191: POPC_I	popc	0x1cae, %r16
mondo_7_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 192: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_lsu_7_96:
	setx 0x0db9141978316715, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba2c9d4  ! 1: FDIVd	fdivd	%f42, %f20, %f44
	.word 0x97a44832  ! 194: FADDs	fadds	%f17, %f18, %f11
	.word 0xa9a449c5  ! 195: FDIVd	fdivd	%f48, %f36, %f20
splash_cmpr_7_98:
	setx 0x83d577d2c2cef2df, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x879020c5  ! 198: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
splash_hpstate_7_99:
	.word 0x81982867  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0867, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_7_100:
	tsubcctv %r8, 0x1a82, %r15
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e030  ! 204: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
debug_7_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_102:
	setx 0x0de934612cfbab30, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_103:
	.word 0x8f902000  ! 207: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_7_104:
	setx 0x0267da23a032b0f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_7_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_105:
	.word 0x91a00167  ! 210: FABSq	dis not found

	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_7_106:
	nop
	setx 0xfffff499fffff78d, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 214: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x91d02032  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_7_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_7_108:
	setx 0xc177d90f02987395, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802004  ! 220: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd6800ba0  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
splash_tba_7_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9745c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902000  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_7_110:
	setx 0x1f0c4df149c3c8d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_111:
	setx 0x09eb547f45300b6d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 230: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xda800bc0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac004a0  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_cmpr_7_113:
	setx 0x3bcd12f239ccc781, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d914011  ! 235: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
splash_lsu_7_115:
	setx 0xf76142debf555bdb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d914012  ! 237: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	setx 0x2715cefaa95051f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_7_118:
	tsubcctv %r1, 0x1920, %r17
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa1902003  ! 240: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802004  ! 241: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x92c26e00  ! 242: ADDCcc_I	addccc 	%r9, 0x0e00, %r9
	.word 0x8790205b  ! 243: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
intveclr_7_119:
	setx 0xba99160118e56bed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8036f0  ! 245: SIR	sir	0x16f0
	.word 0x8d9032aa  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x12aa, %pstate
splash_cmpr_7_120:
	setx 0x3c1272459d2afac3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_121:
	setx 0x9e1fdd7005c67b8b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 249: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c3a9f  ! 250: SDIVX_I	sdivx	%r16, 0xfffffa9f, %r9
	.word 0x83d02032  ! 251: Tcc_I	te	icc_or_xcc, %r0 + 50
change_to_randtl_7_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_123:
	.word 0x8f902002  ! 252: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d90400b  ! 254: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
tagged_7_125:
	taddcctv %r26, 0x134c, %r14
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_7_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd56427a4	! Random illegal ?
	.word 0x93a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f40
	.word 0xa5a1c825  ! 256: FADDs	fadds	%f7, %f5, %f18
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_7_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d902943  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x0943, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa3540000  ! 262: RDPR_GL	rdpr	%-, %r17
pmu_7_128:
	nop
	setx 0xfffff1f9fffff8a4, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_129:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 264: RDPC	rd	%pc, %r20
	.word 0xa1902002  ! 265: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802004  ! 266: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_7_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d90c003  ! 268: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
debug_7_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91942020  ! 270: WRPR_PIL_I	wrpr	%r16, 0x0020, %pil
mondo_7_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d900012  ! 271: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
debug_7_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800ba0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	.word 0xd4cfe020  ! 274: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0x8d902fe1  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0fe1, %pstate
splash_hpstate_7_134:
	.word 0x8198248e  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x542054299bb1bcb9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
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
	.word 0x99414000  ! 279: RDPC	rd	%pc, %r12
splash_cmpr_7_137:
	setx 0x328658b9b3bbc1eb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_138:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 281: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xa190200c  ! 282: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe497e030  ! 283: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
splash_cmpr_7_139:
	setx 0x2fb93a9c65ec50a0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_7_140:
	setx 0x53039cdae1d91eb2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_141:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 287: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_7_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa8c47e4a  ! 289: ADDCcc_I	addccc 	%r17, 0xfffffe4a, %r20
	.word 0x8790212d  ! 290: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe020  ! 292: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
mondo_7_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d91800b  ! 293: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_144)) -> intp(6,0,6)
intvec_7_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f803180  ! 296: SIR	sir	0x1180
	.word 0x93902006  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a2eb0  ! 298: SDIVX_I	sdivx	%r8, 0x0eb0, %r17
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_7_146:
	setx 0x14f64b86d2761aa1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba149c6  ! 1: FDIVd	fdivd	%f36, %f6, %f44
	normalw
	.word 0x93458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_7_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_148:
	.word 0x95a0016a  ! 303: FABSq	dis not found

	.word 0xd48804a0  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x94d8800a  ! 305: SMULcc_R	smulcc 	%r2, %r10, %r10
splash_cmpr_7_149:
	setx 0x9d07f48f75b0593e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xa1a30d2c  ! 308: FsMULd	fsmuld	%f12, %f12, %f16
debug_7_150:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 309: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x93902004  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_7_151:
	taddcctv %r24, 0x1782, %r24
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac80e60  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976830e3  ! 313: SDIVX_I	sdivx	%r0, 0xfffff0e3, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_153)) -> intp(7,1,3)
xir_7_153:
	.word 0xa9826419  ! 314: WR_SET_SOFTINT_I	wr	%r9, 0x0419, %set_softint
splash_hpstate_7_154:
	.word 0x81982597  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0597, %hpstate
splash_tba_7_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99703eac  ! 318: POPC_I	popc	0x1eac, %r12
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
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
	.word 0xa7414000  ! 320: RDPC	rd	%pc, %r19
	setx 0x716a7c587edb93e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903002  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x1002, %pstate
	.word 0xa9848006  ! 323: WR_SET_SOFTINT_R	wr	%r18, %r6, %set_softint
intveclr_7_158:
	setx 0xbc21b3b832048eca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x0639b52d173934a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903723  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x1723, %pstate
change_to_randtl_7_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16cfc08  ! 328: SDIVX_I	sdivx	%r19, 0xfffffc08, %r16
	.word 0xa1902000  ! 329: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_7_162:
	setx 0x959043c2512b75c9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_163:
	setx 0x114b0c94cc7492bc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_164:
	setx 0xa37e19903f6cfa9b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x93a409c0  ! 1: FDIVd	fdivd	%f16, %f0, %f40
	.word 0x9ba00545  ! 1: FSQRTd	fsqrt	
	.word 0x99a04827  ! 333: FADDs	fadds	%f1, %f7, %f12
pmu_7_166:
	nop
	setx 0xfffffc65fffff1c9, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01964  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_7_168:
	setx 0xc18f7ce3c4bb68e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 338: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_7_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa3a4c826  ! 339: FADDs	fadds	%f19, %f6, %f17
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_7_170:
	setx 0xb787fbe4d7969cec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 342: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
splash_cmpr_7_172:
	setx 0xae9adbdb337ddd46, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d92c009  ! 344: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0x87902161  ! 345: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
splash_hpstate_7_174:
	.word 0x819822a4  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02a4, %hpstate
	.word 0x9b45c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x93540000  ! 348: RDPR_GL	rdpr	%-, %r9
	.word 0xda8804a0  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
splash_cmpr_7_175:
	setx 0xe5c1f2396722e698, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902180  ! 351: WRPR_TT_I	wrpr	%r0, 0x0180, %tt
	rd %pc, %r19
	add %r19, (ivw_7_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_176:
	.word 0xa3a00166  ! 352: FABSq	dis not found

	.word 0xa3a000cb  ! 353: FNEGd	fnegd	%f42, %f48
splash_hpstate_7_177:
	.word 0x819825bc  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05bc, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_7_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d92c00a  ! 356: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
tagged_7_179:
	taddcctv %r25, 0x1cd0, %r17
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab834010  ! 358: WR_CLEAR_SOFTINT_R	wr	%r13, %r16, %clear_softint
	.word 0xa1902002  ! 359: WRPR_GL_I	wrpr	%r0, 0x0002, %-
pmu_7_180:
	nop
	setx 0xfffff783fffffd94, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_7_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9ba289c2  ! 364: FDIVd	fdivd	%f10, %f2, %f44
mondo_7_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90c011  ! 365: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
debug_7_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1a449d3  ! 367: FDIVd	fdivd	%f48, %f50, %f16
debug_7_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c80e60  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0xd497e020  ! 370: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c00e80  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x93902000  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_7_186:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_187:
	setx 0x16dfc4c48c8e8a7f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d00e40  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
debug_7_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_189:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 377: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x87902069  ! 378: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
splash_cmpr_7_190:
	setx 0x85cd8b165c318386, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 380: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_7_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 382: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_192:
	.word 0xa7a0016a  ! 383: FABSq	dis not found

	.word 0x83d02032  ! 384: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_7_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_7_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_7_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 387: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_196)) -> intp(7,1,3)
xir_7_196:
	.word 0xa98279f7  ! 388: WR_SET_SOFTINT_I	wr	%r9, 0x19f7, %set_softint
debug_7_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_198)) -> intp(7,1,3)
xir_7_198:
	.word 0xa9847bbf  ! 390: WR_SET_SOFTINT_I	wr	%r17, 0x1bbf, %set_softint
	.word 0x8780204f  ! 391: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xad8122e9  ! 392: WR_SOFTINT_REG_I	wr	%r4, 0x02e9, %softint
splash_cmpr_7_199:
	setx 0xf1a1ef2f7bad2288, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_200)) -> intp(7,0,8)
intvec_7_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_201:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b5  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 181
change_to_randtl_7_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_202:
	.word 0x8f902001  ! 397: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_7_203:
	taddcctv %r2, 0x16d8, %r9
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x879022de  ! 399: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
splash_lsu_7_204:
	setx 0xdab21a6988582fab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d920006  ! 401: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
splash_hpstate_7_206:
	.word 0x81982e97  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e97, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769237d  ! 403: SDIVX_I	sdivx	%r4, 0x037d, %r11
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x83d02032  ! 405: Tcc_I	te	icc_or_xcc, %r0 + 50
debug_7_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903f4c  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x1f4c, %pstate
mondo_7_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950000  ! 408: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
splash_hpstate_7_210:
	.word 0x81982527  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0527, %hpstate
DS_7_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa9a00543  ! 1: FSQRTd	fsqrt	
	.word 0x93a08832  ! 410: FADDs	fadds	%f2, %f18, %f9
splash_cmpr_7_212:
	setx 0xba6de89825d35aba, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_7_213:
	taddcctv %r23, 0x1b2d, %r5
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_7_214:
	.word 0x91a449c2  ! 1: FDIVd	fdivd	%f48, %f2, %f8
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_7_215:
	setx 0x1072cf5a4e3a71f8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 418: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
splash_tba_7_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802c6d  ! 420: SIR	sir	0x0c6d
splash_lsu_7_218:
	setx 0xbabcd60f87148cbb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_219:
	.word 0x81982c24  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c24, %hpstate
	rd %pc, %r19
	add %r19, (ivw_7_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_220:
	.word 0xa1a00169  ! 423: FABSq	dis not found

	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_221:
	taddcctv %r6, 0x1064, %r3
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_7_222:
	.word 0x93a489c8  ! 1: FDIVd	fdivd	%f18, %f8, %f40
	allclean
	.word 0x9bb34306  ! 426: ALIGNADDRESS	alignaddr	%r13, %r6, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_7_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_223:
	.word 0x8f902000  ! 428: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902005  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_tba_7_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802088  ! 432: WRASI_I	wr	%r0, 0x0088, %asi
pmu_7_225:
	nop
	setx 0xfffff30ffffffc06, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_7_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 436: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cefa7  ! 437: SDIVX_I	sdivx	%r19, 0x0fa7, %r11
splash_hpstate_7_229:
	.word 0x8198225c  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	.word 0x8790207e  ! 439: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
splash_htba_7_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_7_231:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 442: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
tagged_7_232:
	tsubcctv %r16, 0x1015, %r21
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_7_233:
	setx 0x4c2a33a5cb083f11, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_7_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_234:
	.word 0x97a00174  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_7_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_235:
	.word 0x99a0016d  ! 447: FABSq	dis not found

mondo_7_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d930005  ! 448: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0xa782ed2d  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0d2d, %-
splash_tba_7_237:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_238:
	setx 0xe72b4453bd07dab7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_239:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 453: RDPC	rd	%pc, %r13
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_7_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad82f309  ! 457: WR_SOFTINT_REG_I	wr	%r11, 0x1309, %softint
mondo_7_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 458: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x99902002  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87802016  ! 460: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99a189aa  ! 461: FDIVs	fdivs	%f6, %f10, %f12
mondo_7_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d904000  ! 462: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_243:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 463: RDPC	rd	%pc, %r12
	.word 0x8d90396a  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x196a, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_244:
	setx 0xe16b1418b103b547, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_7_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_7_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 470: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0x87902152  ! 471: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x0d4724cf90245eb1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_248:
	setx 0xab0dffcdd0fe2737, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 475: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01961  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_250)) -> intp(2,0,4)
intvec_7_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_251:
	.word 0x91a1c9c1  ! 1: FDIVd	fdivd	%f38, %f32, %f8
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b5  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_7_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_252:
	.word 0x91a00173  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
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
	.word 0x91414000  ! 482: RDPC	rd	%pc, %r8
splash_hpstate_7_254:
	.word 0x81982f15  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
intveclr_7_255:
	setx 0x6705d023978e8f48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_256:
	setx 0x1d7a8d2ea54fbf10, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab84c002  ! 486: WR_CLEAR_SOFTINT_R	wr	%r19, %r2, %clear_softint
	.word 0x8d802000  ! 487: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_7_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_7_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_7_259:
	setx 0x236a11dbbea1e070, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_7_260:
	.word 0x81982a87  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_7_261:
	setx 0xa5b578c5d36786a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_262:
	.word 0xa3a449c9  ! 1: FDIVd	fdivd	%f48, %f40, %f48
	.word 0xed7c888b	! Random illegal ?
	.word 0x99a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xa9a50831  ! 495: FADDs	fadds	%f20, %f17, %f20
	.word 0x93d020b5  ! 496: Tcc_I	tne	icc_or_xcc, %r0 + 181
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9b450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r13
splash_hpstate_7_264:
	.word 0x81982376  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0376, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99686991  ! 501: SDIVX_I	sdivx	%r1, 0x0991, %r12
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_7_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802080  ! 504: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd28008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_7_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91000b  ! 506: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0xa945c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x90f80009  ! 508: SDIVcc_R	sdivcc 	%r0, %r9, %r8
	.word 0x8d902395  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x0395, %pstate
splash_cmpr_7_268:
	setx 0xe0594e1c9fe8c560, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 511: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200e  ! 512: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_7_269:
	setx 0xf8bed1db7f03120e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_270:
	tsubcctv %r15, 0x1e07, %r15
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_7_271:
	setx 0xd3ac66f00b4e00e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0x9c89bbdcf81d20f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_7_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_274:
	.word 0xa9a00163  ! 520: FABSq	dis not found

mondo_7_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d93400b  ! 521: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
tagged_7_276:
	tsubcctv %r1, 0x1cbe, %r5
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_277:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 523: RDPC	rd	%pc, %r13
DS_7_278:
	.word 0x99a289cc  ! 1: FDIVd	fdivd	%f10, %f12, %f12
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_7_279:
	setx 0x2663eddb92335eab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169b169  ! 528: SDIVX_I	sdivx	%r6, 0xfffff169, %r8
mondo_7_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d940005  ! 529: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xdad7e020  ! 530: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d903655  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x1655, %pstate
splash_cmpr_7_282:
	setx 0x41d1f4f530401599, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_hpstate_7_284:
	.word 0x81982d44  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
debug_7_285:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 536: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_286:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 537: RDPC	rd	%pc, %r13
	setx 0x5473a5aa18977fee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9840009  ! 539: WR_SET_SOFTINT_R	wr	%r16, %r9, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_288:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 540: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_lsu_7_289:
	setx 0x3cb7e1cce041aa2f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 544: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_7_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_290:
	.word 0xa1a00167  ! 545: FABSq	dis not found

mondo_7_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92000b  ! 546: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
donret_7_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_292-donret_7_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_293:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 548: RDPC	rd	%pc, %r9
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_294:
	setx 0x5f7c3264451488dd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 551: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
tagged_7_296:
	tsubcctv %r2, 0x14d4, %r8
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_7_297:
	setx 0x4a0a057a405d346d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902f4c  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x0f4c, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_7_298:
	setx 0x862d0f44336a6a49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 558: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93d020b4  ! 559: Tcc_I	tne	icc_or_xcc, %r0 + 180
debug_7_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x92db400b  ! 561: SMULcc_R	smulcc 	%r13, %r11, %r9
DS_7_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7300011  ! 1: STQF_R	-	%f11, [%r17, %r0]
	normalw
	.word 0xa7458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe6800bc0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	.word 0xe6800ae0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r19
	.word 0x95464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r10
DS_7_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9327ddc  ! 1: STQF_I	-	%f12, [0x1ddc, %r9]
	normalw
	.word 0x91458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa682e1fd  ! 568: ADDcc_I	addcc 	%r11, 0x01fd, %r19
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d903bc1  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x1bc1, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_7_302:
	tsubcctv %r18, 0x1a2c, %r6
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569afaa  ! 573: SDIVX_I	sdivx	%r6, 0x0faa, %r10
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802080  ! 575: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa5540000  ! 576: RDPR_GL	rdpr	%-, %r18
change_to_randtl_7_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_304:
	.word 0x8f902001  ! 577: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_7_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 579: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_7_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_306:
	.word 0x91a00172  ! 581: FABSq	dis not found

pmu_7_307:
	nop
	setx 0xfffff43bfffff693, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_7_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_308-donret_7_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_7_309:
	setx 0xa54b055aab93eaf1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93a509d1  ! 586: FDIVd	fdivd	%f20, %f48, %f40
	.word 0x8d903ba0  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x1ba0, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 588: RDPC	rd	%pc, %r17
splash_hpstate_7_312:
	.word 0x81982b5e  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5e, %hpstate
	.word 0x91d02034  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_7_313:
	setx 0x5afc436afaae2c43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_7_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_7_315:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 593: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
debug_7_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_7_317:
	setx 0xccf60f40f47979cf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902ae5  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x0ae5, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe020  ! 602: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa1464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0x87802010  ! 605: WRASI_I	wr	%r0, 0x0010, %asi
tagged_7_318:
	tsubcctv %r4, 0x1f28, %r15
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_7_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 607: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
mondo_7_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92c011  ! 608: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d3a58  ! 609: SDIVX_I	sdivx	%r20, 0xfffffa58, %r13
debug_7_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_323:
	taddcctv %r12, 0x10d8, %r23
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_7_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d904004  ! 612: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0x93902002  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_7_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_326:
	.word 0x95a0016d  ! 615: FABSq	dis not found

DS_7_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802020  ! 617: WRASI_I	wr	%r0, 0x0020, %asi
splash_htba_7_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0x97500000  ! 620: RDPR_TPC	rdpr	%tpc, %r11
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d934012  ! 622: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
mondo_7_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90800b  ! 623: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
debug_7_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9020d5  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x00d5, %pstate
	.word 0xa96b400d  ! 626: SDIVX_R	sdivx	%r13, %r13, %r20
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_332:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 627: RDPC	rd	%pc, %r12
pmu_7_333:
	nop
	setx 0xfffffafffffff65f, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902204  ! 631: WRPR_TT_I	wrpr	%r0, 0x0204, %tt
	.word 0x8d903def  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x1def, %pstate
	.word 0xab800005  ! 633: WR_CLEAR_SOFTINT_R	wr	%r0, %r5, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_7_334:
	setx 0x7c5345bf99ece7ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91520000  ! 637: RDPR_PIL	<illegal instruction>
DS_7_335:
	.word 0xa7a1c9c1  ! 1: FDIVd	fdivd	%f38, %f32, %f50
	pdist %f30, %f30, %f20
	.word 0x99b08311  ! 638: ALIGNADDRESS	alignaddr	%r2, %r17, %r12
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902000  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_7_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 641: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	setx 0xe62018e18b121624, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_338:
	.word 0x95a00167  ! 643: FABSq	dis not found

mondo_7_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d930007  ! 644: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
mondo_7_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d92c011  ! 645: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
debug_7_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_342:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_7_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_7_344:
	.word 0x81982b4d  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4d, %hpstate
splash_tba_7_345:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab828012  ! 653: WR_CLEAR_SOFTINT_R	wr	%r10, %r18, %clear_softint
	.word 0xa190200f  ! 654: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_7_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_7_348:
	nop
	setx 0xfffffa06fffff5bf, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_7_349:
	setx 0xd207ab4dd3f7841f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_350:
	setx 0xfb60438a85a66037, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_351:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 661: RDPC	rd	%pc, %r9
mondo_7_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d950007  ! 662: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x8d903a1b  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x1a1b, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c2495  ! 664: SDIVX_I	sdivx	%r16, 0x0495, %r11
	.word 0x95a289ca  ! 665: FDIVd	fdivd	%f10, %f10, %f10
	.word 0x8790207a  ! 666: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
change_to_randtl_7_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_354:
	.word 0x8f902002  ! 667: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_7_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b2  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902000  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_7_356:
	setx 0x2941cdcb2f1cdc50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_357:
	taddcctv %r21, 0x1baa, %r11
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902000  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xdadfe000  ! 676: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8780204f  ! 677: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_7_358:
	setx 0xfa0033f7e1775874, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 679: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_7_359:
	.word 0x81982886  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
debug_7_360:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 682: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x93902001  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x99540000  ! 684: RDPR_GL	rdpr	%-, %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_361:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 685: RDPC	rd	%pc, %r11
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_7_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_364:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 689: RDPC	rd	%pc, %r12
change_to_randtl_7_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_365:
	.word 0x8f902000  ! 690: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x9ba309ac  ! 692: FDIVs	fdivs	%f12, %f12, %f13
splash_cmpr_7_366:
	setx 0x4ede11ccfcd6e48b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 694: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe030  ! 696: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
intveclr_7_367:
	setx 0x741d61f6edf1365a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_368:
	.word 0x81982f8e  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8e, %hpstate
	.word 0x8d903dd8  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x1dd8, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e030  ! 701: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
splash_tba_7_369:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_370:
	setx 0xbaed1ba864cb0b9f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_371:
	.word 0x8f902003  ! 706: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xa190200d  ! 708: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_7_372)) -> intp(2,0,25)
intvec_7_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_7_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_373:
	.word 0x8f902002  ! 711: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_7_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940009  ! 712: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
splash_hpstate_7_375:
	.word 0x81982fe6  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fe6, %hpstate
splash_cmpr_7_376:
	setx 0x70770921a97aa555, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 715: WRPR_GL_I	wrpr	%r0, 0x000d, %-
intveclr_7_377:
	setx 0xed06c59274638633, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_7_378)) -> intp(7,1,3)
xir_7_378:
	.word 0xa982f092  ! 717: WR_SET_SOFTINT_I	wr	%r11, 0x1092, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 718: FqTOd	dis not found

intveclr_7_380:
	setx 0x13d5ea2b2c09454b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91500000  ! 720: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xa7520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196d  ! 723: FqTOd	dis not found

splash_htba_7_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x7eeddc474573fc9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_7_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 727: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
intveclr_7_385:
	setx 0xc22298d52b5d5390, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_7_386:
	setx 0xd0737f10c1ddb0c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 731: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902229  ! 732: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0xa2f9a275  ! 734: SDIVcc_I	sdivcc 	%r6, 0x0275, %r17
pmu_7_387:
	nop
	setx 0xffffff42fffff203, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_7_388:
	nop
	setx 0xfffff51ffffffdcf, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 737: WRASI_I	wr	%r0, 0x0004, %asi
	rd %pc, %r19
	add %r19, (ivw_7_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_389:
	.word 0xa7a00174  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_7_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 741: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 742: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x9ba01a6c  ! 744: FqTOi	fqtoi	
mondo_7_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 745: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
tagged_7_392:
	tsubcctv %r1, 0x1427, %r25
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x83d02033  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 748: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_7_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d930005  ! 753: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
splash_lsu_7_394:
	setx 0xa7e17efe02ae784d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_7_395:
	taddcctv %r11, 0x140d, %r19
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_7_396:
	tsubcctv %r14, 0x1c73, %r11
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996875c5  ! 758: SDIVX_I	sdivx	%r1, 0xfffff5c5, %r12
	.word 0x8780204f  ! 759: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_7_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_399:
	setx 0x7207987c9c282cb2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe4800ba0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0x9ba4c9f2  ! 763: FDIVq	dis not found

debug_7_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_401:
	taddcctv %r12, 0x1e25, %r14
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_7_402:
	setx 0xdbf8d1cacab5b5e3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_403:
	.word 0x8f902001  ! 769: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802020  ! 772: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_7_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_7_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d908003  ! 774: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
debug_7_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_7_407:
	setx 0xdb8f7a6328f99c57, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902007  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_7_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d920010  ! 779: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
intveclr_7_409:
	setx 0xed343d728b4cfd8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790209a  ! 781: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_410:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 783: RDPC	rd	%pc, %r8
	.word 0xd6800b00  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
tagged_7_411:
	taddcctv %r23, 0x1913, %r13
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d903444  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x1444, %pstate
intveclr_7_412:
	setx 0x9c3ef27af0cf88b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_7_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_413:
	.word 0x8f902001  ! 789: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_7_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_414:
	.word 0x8f902002  ! 791: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9ba48d26  ! 792: FsMULd	fsmuld	%f18, %f6, %f44
splash_tba_7_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 7, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_416:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 797: RDPC	rd	%pc, %r9
	.word 0xe28008a0  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_7_417:
	taddcctv %r6, 0x1e56, %r23
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
debug_6_0:
	nop
	mov 8, %r18
splash_hpstate_6_1:
	.word 0x81982e17  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e17, %hpstate
splash_hpstate_6_2:
	.word 0x819825c7  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_6_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_3:
	.word 0x8f902002  ! 4: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_6_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_6_5:
	setx 0x726fa711d59fb865, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_6_6:
	setx 0x834f7178921f5903, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_6_7:
	setx 0xa413e74633029a0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe2800a60  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 11: FqTOd	dis not found

	.word 0xda8804a0  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_6_9:
	.word 0x81982026  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0026, %hpstate
mondo_6_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 16: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
mondo_6_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94c007  ! 17: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0x91d02032  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802058  ! 19: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_6_12:
	setx 0xad18c40c0bad354b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_13:
	setx 0xcdbfc1abd2eada14, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 22: FqTOd	dis not found

debug_6_15:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 23: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xd4800b20  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
change_to_randtl_6_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_16:
	.word 0x8f902002  ! 25: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 27: FqTOd	dis not found

intveclr_6_18:
	setx 0x0c90d99e11e967ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803a4b  ! 29: SIR	sir	0x1a4b
	.word 0x91a409c3  ! 30: FDIVd	fdivd	%f16, %f34, %f8
	.word 0x8780201c  ! 31: WRASI_I	wr	%r0, 0x001c, %asi
debug_6_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_20:
	.word 0x91a00166  ! 33: FABSq	dis not found

	.word 0x8780204f  ! 34: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f802bb1  ! 35: SIR	sir	0x0bb1
	.word 0x8d902593  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x0593, %pstate
	.word 0xa190200d  ! 37: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76b2952  ! 38: SDIVX_I	sdivx	%r12, 0x0952, %r19
splash_tba_6_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_23:
	setx 0xb918563aa525e52f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a449c8  ! 41: FDIVd	fdivd	%f48, %f8, %f12
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 43: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e80  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
donret_6_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_24-donret_6_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_6_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902008  ! 47: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d9022a4  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x02a4, %pstate
	.word 0x9f803e78  ! 49: SIR	sir	0x1e78
splash_tba_6_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_27)) -> intp(6,1,3)
xir_6_27:
	.word 0xa9842900  ! 51: WR_SET_SOFTINT_I	wr	%r16, 0x0900, %set_softint
	.word 0xa190200b  ! 52: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d020b3  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 179
change_to_randtl_6_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_28:
	.word 0x8f902001  ! 54: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_6_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 55: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_6_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_30:
	.word 0x95a00160  ! 57: FABSq	dis not found

splash_tba_6_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_32)) -> intp(0,0,27)
intvec_6_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90301c  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x101c, %pstate
change_to_randtl_6_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_33:
	.word 0x8f902001  ! 61: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879023f8  ! 62: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
tagged_6_34:
	tsubcctv %r2, 0x1d12, %r6
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802000  ! 64: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_6_35:
	taddcctv %r22, 0x1029, %r7
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8790204a  ! 66: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
mondo_6_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d904006  ! 67: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0x91d02034  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 52
	setx 0x875282b6f7730b6e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d928003  ! 70: WRPR_WSTATE_R	wrpr	%r10, %r3, %wstate
	.word 0x9f803255  ! 71: SIR	sir	0x1255
	.word 0x91d020b3  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xad833097  ! 73: WR_SOFTINT_REG_I	wr	%r12, 0x1097, %softint
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_6_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_39:
	.word 0x8f902002  ! 75: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_6_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x9ba08833  ! 78: FADDs	fadds	%f2, %f19, %f13
DS_6_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b4c307  ! 79: ALIGNADDRESS	alignaddr	%r19, %r7, %r17
splash_tba_6_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 81: FqTOd	dis not found

	.word 0x9881b5d4  ! 82: ADDcc_I	addcc 	%r6, 0xfffff5d4, %r12
	setx 0x257ec87fe97fc58e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_46:
	.word 0x91a00161  ! 84: FABSq	dis not found

intveclr_6_47:
	setx 0xfb586ba3ff463e33, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01970  ! 86: FqTOd	dis not found

	.word 0x99902004  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_6_49:
	setx 0x56f89c1e468204d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 90: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 91: FqTOd	dis not found

	.word 0xd0c7e030  ! 92: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xa9848003  ! 93: WR_SET_SOFTINT_R	wr	%r18, %r3, %set_softint
	.word 0xd0800aa0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r8
change_to_randtl_6_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_51:
	.word 0x8f902000  ! 95: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd0d7e030  ! 96: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_6_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_52-donret_6_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_6_53:
	setx 0x80894ebf6509a4f7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_54)) -> intp(3,0,12)
intvec_6_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_55:
	setx 0x109ec1c0f37956c8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0800b80  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
splash_tba_6_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_57:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 104: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_58:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 105: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_59:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 106: RDPC	rd	%pc, %r9
splash_cmpr_6_60:
	setx 0x525206eb2a703317, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d902a97  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x0a97, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d004a0  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x956ac010  ! 112: SDIVX_R	sdivx	%r11, %r16, %r10
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x0b31c4721fa7818f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d950014  ! 115: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
tagged_6_63:
	taddcctv %r9, 0x16ee, %r19
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa1902004  ! 118: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	rd %pc, %r19
	add %r19, (ivw_6_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_64:
	.word 0x95a00173  ! 119: FABSq	dis not found

	.word 0x87802010  ! 120: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x879021a2  ! 121: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
	.word 0x93902005  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	setx 0x026a5d2119d8e128, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_66:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 124: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_6_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa190200e  ! 128: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_6_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d934010  ! 129: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
debug_6_69:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 130: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_6_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_6_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_71-donret_6_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_72:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 133: RDPC	rd	%pc, %r9
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_6_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f18, %f22, %f10
	.word 0xa9b04314  ! 135: ALIGNADDRESS	alignaddr	%r1, %r20, %r20
	.word 0x87802089  ! 136: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xad84efb6  ! 137: WR_SOFTINT_REG_I	wr	%r19, 0x0fb6, %softint
	.word 0x8d902a0d  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x87802088  ! 139: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_6_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad82ad0f  ! 141: WR_SOFTINT_REG_I	wr	%r10, 0x0d0f, %softint
	.word 0x93902000  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91a289d3  ! 143: FDIVd	fdivd	%f10, %f50, %f8
mondo_6_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950002  ! 144: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x91922669  ! 147: WRPR_PIL_I	wrpr	%r8, 0x0669, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
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
	.word 0x99414000  ! 148: RDPC	rd	%pc, %r12
	.word 0x8d902475  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0475, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_77:
	.word 0xa3a00172  ! 151: FABSq	dis not found

	.word 0x95480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
change_to_randtl_6_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_78:
	.word 0x8f902000  ! 153: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_6_79:
	.word 0x81982fc6  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0xa9540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_6_80:
	setx 0xf9974160c713b28d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d9031b8  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x11b8, %pstate
	.word 0x87802063  ! 161: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_6_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_81:
	.word 0x8f902000  ! 162: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x83d02034  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9f8037ed  ! 164: SIR	sir	0x17ed
	.word 0x9192bbd3  ! 165: WRPR_PIL_I	wrpr	%r10, 0x1bd3, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8790203f  ! 167: WRPR_TT_I	wrpr	%r0, 0x003f, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_6_82:
	.word 0x81982a1f  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
change_to_randtl_6_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_83:
	.word 0x8f902001  ! 171: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_6_84:
	.word 0x819824e7  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04e7, %hpstate
	.word 0xd68008a0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	rd %pc, %r19
	add %r19, (ivw_6_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_85:
	.word 0x97a00173  ! 174: FABSq	dis not found

	.word 0x9b540000  ! 175: RDPR_GL	rdpr	%-, %r13
	.word 0xa981c013  ! 176: WR_SET_SOFTINT_R	wr	%r7, %r19, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_6_86:
	tsubcctv %r4, 0x1e4e, %r11
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_6_87:
	setx 0xc04c342d72a56c79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa44d0000  ! 180: MULX_R	mulx 	%r20, %r0, %r18
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_88:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 181: RDPC	rd	%pc, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 182: FqTOd	dis not found

debug_6_90:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 183: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93902000  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95692611  ! 185: SDIVX_I	sdivx	%r4, 0x0611, %r10
	.word 0x83d020b4  ! 186: Tcc_I	te	icc_or_xcc, %r0 + 180
mondo_6_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90000a  ! 187: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
intveclr_6_93:
	setx 0x41befb3d075de8d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_6_94:
	setx 0x97085162c7b58f13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b702733  ! 191: POPC_I	popc	0x0733, %r13
mondo_6_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 192: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_lsu_6_96:
	setx 0x33a894f3180f12b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a449cb  ! 1: FDIVd	fdivd	%f48, %f42, %f16
	.word 0x91a08829  ! 194: FADDs	fadds	%f2, %f9, %f8
	.word 0xa9a409d3  ! 195: FDIVd	fdivd	%f16, %f50, %f20
splash_cmpr_6_98:
	setx 0x0816864ade086499, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87902048  ! 198: WRPR_TT_I	wrpr	%r0, 0x0048, %tt
splash_hpstate_6_99:
	.word 0x819820d5  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d5, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_6_100:
	tsubcctv %r18, 0x11a7, %r21
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e000  ! 204: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
debug_6_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_102:
	setx 0x5ae8883394b2f2b5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_103:
	.word 0x8f902003  ! 207: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_6_104:
	setx 0xaee8d461ad472594, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_6_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_105:
	.word 0xa5a00163  ! 210: FABSq	dis not found

	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 211: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_6_106:
	nop
	setx 0xfffff202fffff2af, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 214: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x91d02035  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_6_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_6_108:
	setx 0x6b39f5deab54ecdb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802000  ! 220: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800c00  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
splash_tba_6_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9745c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_6_110:
	setx 0x62b8adeaeb728a7a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_111:
	setx 0x9e5df52853267813, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902002  ! 230: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xda800c20  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac004a0  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_cmpr_6_113:
	setx 0xa47657ef055cb0fc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d918008  ! 235: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
splash_lsu_6_115:
	setx 0xf762f68944961d3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d928014  ! 237: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	setx 0x5a7928bf6dc2c0f1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_6_118:
	tsubcctv %r14, 0x109a, %r21
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa190200c  ! 240: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802063  ! 241: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa2c2eeba  ! 242: ADDCcc_I	addccc 	%r11, 0x0eba, %r17
	.word 0x87902225  ! 243: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
intveclr_6_119:
	setx 0x9c47b5f0899eb2a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803ead  ! 245: SIR	sir	0x1ead
	.word 0x8d902a3f  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x0a3f, %pstate
splash_cmpr_6_120:
	setx 0xcf029ec05ff485d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_121:
	setx 0x1f7ac87b93c236e6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902009  ! 249: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1693350  ! 250: SDIVX_I	sdivx	%r4, 0xfffff350, %r16
	.word 0x91d02033  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_6_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_123:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 253: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_6_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d90800b  ! 254: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
tagged_6_125:
	taddcctv %r15, 0x1d56, %r26
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_6_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d665455	! Random illegal ?
	.word 0x93a509cc  ! 1: FDIVd	fdivd	%f20, %f12, %f40
	.word 0xa9a34829  ! 256: FADDs	fadds	%f13, %f9, %f20
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_6_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d903963  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1963, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x97540000  ! 262: RDPR_GL	<illegal instruction>
pmu_6_128:
	nop
	setx 0xffffff46fffff7ba, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_129:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 264: RDPC	rd	%pc, %r13
	.word 0xa1902007  ! 265: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802020  ! 266: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_6_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d904005  ! 268: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
debug_6_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9194e40c  ! 270: WRPR_PIL_I	wrpr	%r19, 0x040c, %pil
mondo_6_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d948001  ! 271: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
debug_6_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe030  ! 274: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x8d902a85  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0a85, %pstate
splash_hpstate_6_134:
	.word 0x81982a9c  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9c, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x30fc86c4b9777b1e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
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
	.word 0x91414000  ! 279: RDPC	rd	%pc, %r8
splash_cmpr_6_137:
	setx 0xcefc3fe9e76b2237, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_138:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 281: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xa1902000  ! 282: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe497e000  ! 283: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
splash_cmpr_6_139:
	setx 0x15c9e1ffcce5dc83, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_6_140:
	setx 0x4fc8b2aa870953ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_141:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 287: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_6_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x92c46b68  ! 289: ADDCcc_I	addccc 	%r17, 0x0b68, %r9
	.word 0x87902121  ! 290: WRPR_TT_I	wrpr	%r0, 0x0121, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe000  ! 292: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
mondo_6_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d904002  ! 293: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_144)) -> intp(6,0,14)
intvec_6_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x9f802cb1  ! 296: SIR	sir	0x0cb1
	.word 0x93902002  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b2e02  ! 298: SDIVX_I	sdivx	%r12, 0x0e02, %r13
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_6_146:
	setx 0xb1c8e04f94870dc2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a289d3  ! 1: FDIVd	fdivd	%f10, %f50, %f20
	normalw
	.word 0xa9458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_6_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_148:
	.word 0x99a00172  ! 303: FABSq	dis not found

	.word 0xd48804a0  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xa6d98006  ! 305: SMULcc_R	smulcc 	%r6, %r6, %r19
splash_cmpr_6_149:
	setx 0x2dfecc90e8bd435d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xa5a40d2a  ! 308: FsMULd	fsmuld	%f16, %f10, %f18
debug_6_150:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 309: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x93902001  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_6_151:
	taddcctv %r23, 0x1386, %r8
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac804a0  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76ae360  ! 313: SDIVX_I	sdivx	%r11, 0x0360, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_153)) -> intp(6,1,3)
xir_6_153:
	.word 0xa984a26f  ! 314: WR_SET_SOFTINT_I	wr	%r18, 0x026f, %set_softint
splash_hpstate_6_154:
	.word 0x8198260c  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060c, %hpstate
splash_tba_6_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97702a12  ! 318: POPC_I	popc	0x0a12, %r11
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
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
	.word 0x99414000  ! 320: RDPC	rd	%pc, %r12
	setx 0x62f272c4e2dd25f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902cec  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0cec, %pstate
	.word 0xa981c013  ! 323: WR_SET_SOFTINT_R	wr	%r7, %r19, %set_softint
intveclr_6_158:
	setx 0x04ad250cf78cd022, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x5d5481c265d5aeb3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c2b  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x1c2b, %pstate
change_to_randtl_6_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a3d97  ! 328: SDIVX_I	sdivx	%r8, 0xfffffd97, %r18
	.word 0xa1902004  ! 329: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_6_162:
	setx 0x1d6c708b0c5da5d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_163:
	setx 0x413f3ae2d0b17cde, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_164:
	setx 0xca6366810ca7b6dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a149cd  ! 1: FDIVd	fdivd	%f36, %f44, %f18
	.word 0x95a00547  ! 1: FSQRTd	fsqrt	
	.word 0x97a0882a  ! 333: FADDs	fadds	%f2, %f10, %f11
pmu_6_166:
	nop
	setx 0xfffff75dfffff8b0, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_6_168:
	setx 0xc7f378ebbbec189a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00544  ! 1: FSQRTd	fsqrt	
	.word 0x95a0c820  ! 339: FADDs	fadds	%f3, %f0, %f10
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_6_170:
	setx 0xcb46109be350ec92, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 342: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
splash_cmpr_6_172:
	setx 0xb06c7248e2f15181, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d93000d  ! 344: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
	.word 0x87902244  ! 345: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
splash_hpstate_6_174:
	.word 0x81982615  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
	.word 0xa345c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x95540000  ! 348: RDPR_GL	rdpr	%-, %r10
	.word 0xda880e60  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
splash_cmpr_6_175:
	setx 0x383175639d31560b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023ab  ! 351: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
	rd %pc, %r19
	add %r19, (ivw_6_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_176:
	.word 0x97a00170  ! 352: FABSq	dis not found

	.word 0x99a000d3  ! 353: FNEGd	fnegd	%f50, %f12
splash_hpstate_6_177:
	.word 0x8198247d  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x047d, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_6_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d950000  ! 356: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
tagged_6_179:
	taddcctv %r1, 0x188b, %r5
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab808006  ! 358: WR_CLEAR_SOFTINT_R	wr	%r2, %r6, %clear_softint
	.word 0xa190200d  ! 359: WRPR_GL_I	wrpr	%r0, 0x000d, %-
pmu_6_180:
	nop
	setx 0xfffff2acfffff0ac, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_6_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a2c9ca  ! 364: FDIVd	fdivd	%f42, %f10, %f8
mondo_6_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d930000  ! 365: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
debug_6_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9a409d2  ! 367: FDIVd	fdivd	%f16, %f18, %f20
debug_6_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e020  ! 370: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902002  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_6_186:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_187:
	setx 0x4e1a0cc4e6aeaeb5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_6_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_189:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 377: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x87902258  ! 378: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
splash_cmpr_6_190:
	setx 0x56d2939869fd0fa2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 380: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_6_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d908006  ! 382: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_192:
	.word 0x95a00174  ! 383: FABSq	dis not found

	.word 0x93d02033  ! 384: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_6_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_6_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_194:
	.word 0x8f902002  ! 386: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_6_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d908000  ! 387: WRPR_WSTATE_R	wrpr	%r2, %r0, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_196)) -> intp(6,1,3)
xir_6_196:
	.word 0xa984efb6  ! 388: WR_SET_SOFTINT_I	wr	%r19, 0x0fb6, %set_softint
debug_6_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_198)) -> intp(6,1,3)
xir_6_198:
	.word 0xa9853f65  ! 390: WR_SET_SOFTINT_I	wr	%r20, 0x1f65, %set_softint
	.word 0x87802058  ! 391: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xad853c78  ! 392: WR_SOFTINT_REG_I	wr	%r20, 0x1c78, %softint
splash_cmpr_6_199:
	setx 0x83a11c61ab6aa450, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_200)) -> intp(1,0,23)
intvec_6_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_201:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_6_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_6_203:
	taddcctv %r12, 0x15df, %r10
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x8790237d  ! 399: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
splash_lsu_6_204:
	setx 0x3b9b9d401741efab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 401: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
splash_hpstate_6_206:
	.word 0x81982c5e  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5e, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d200c  ! 403: SDIVX_I	sdivx	%r20, 0x000c, %r10
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x91d02033  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_6_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903a94  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x1a94, %pstate
mondo_6_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 408: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
splash_hpstate_6_210:
	.word 0x81982514  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
DS_6_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa1a44834  ! 410: FADDs	fadds	%f17, %f20, %f16
splash_cmpr_6_212:
	setx 0x506b05f416eb052d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_6_213:
	taddcctv %r9, 0x1e16, %r19
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_6_214:
	.word 0x97a1c9c7  ! 1: FDIVd	fdivd	%f38, %f38, %f42
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_6_215:
	setx 0xf605995f4fc95476, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d908007  ! 418: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
splash_tba_6_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803396  ! 420: SIR	sir	0x1396
splash_lsu_6_218:
	setx 0xd0757e4ea2a4a94b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_219:
	.word 0x81982ecd  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
	rd %pc, %r19
	add %r19, (ivw_6_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_220:
	.word 0x95a00162  ! 423: FABSq	dis not found

	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_6_221:
	taddcctv %r12, 0x1948, %r3
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_6_222:
	.word 0xa7a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f50
	allclean
	.word 0x91b20304  ! 426: ALIGNADDRESS	alignaddr	%r8, %r4, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_6_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_223:
	.word 0x8f902000  ! 428: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902004  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_tba_6_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802014  ! 432: WRASI_I	wr	%r0, 0x0014, %asi
pmu_6_225:
	nop
	setx 0xfffff64dfffff55e, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_6_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d914008  ! 436: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c7ca8  ! 437: SDIVX_I	sdivx	%r17, 0xfffffca8, %r8
splash_hpstate_6_229:
	.word 0x81982d44  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	.word 0x879020be  ! 439: WRPR_TT_I	wrpr	%r0, 0x00be, %tt
splash_htba_6_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_6_231:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 442: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
tagged_6_232:
	tsubcctv %r4, 0x1ba1, %r2
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_6_233:
	setx 0xeffb22d5c9b5dd6e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_6_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_234:
	.word 0x93a00169  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_6_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_235:
	.word 0x95a00165  ! 447: FABSq	dis not found

mondo_6_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d928001  ! 448: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	.word 0xa784297f  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x097f, %-
splash_tba_6_237:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_238:
	setx 0xcb6254ff413d97ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_239:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 453: RDPC	rd	%pc, %r17
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_6_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad803cb2  ! 457: WR_SOFTINT_REG_I	wr	%r0, 0x1cb2, %softint
mondo_6_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d934012  ! 458: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0x99902001  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802058  ! 460: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9ba489b1  ! 461: FDIVs	fdivs	%f18, %f17, %f13
mondo_6_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948000  ! 462: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 463: RDPC	rd	%pc, %r20
	.word 0x8d9020ec  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x00ec, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_6_244:
	setx 0xf584c9cf62b2b637, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_6_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_6_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 470: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x879020a6  ! 471: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xcd1e8b044402c550, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_248:
	setx 0x1ab25fe63ffd182f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780201c  ! 475: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_250)) -> intp(3,0,15)
intvec_6_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_251:
	.word 0x97a449c2  ! 1: FDIVd	fdivd	%f48, %f2, %f42
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02034  ! 479: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_6_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_252:
	.word 0x99a00169  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
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
	.word 0xa1414000  ! 482: RDPC	rd	%pc, %r16
splash_hpstate_6_254:
	.word 0x8198229f  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
intveclr_6_255:
	setx 0x6008bce7e2bf2742, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_256:
	setx 0x85fbc7675f9fd29f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab83400d  ! 486: WR_CLEAR_SOFTINT_R	wr	%r13, %r13, %clear_softint
	.word 0x8d802004  ! 487: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_6_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_6_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_cmpr_6_259:
	setx 0xa12906b999bcabb4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_6_260:
	.word 0x819820cf  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cf, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_6_261:
	setx 0xd7a64435800c0afb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_262:
	.word 0x95a509c0  ! 1: FDIVd	fdivd	%f20, %f0, %f10
	.word 0xdd501664	! Random illegal ?
	.word 0xa1a00553  ! 1: FSQRTd	fsqrt	
	.word 0x9ba10834  ! 495: FADDs	fadds	%f4, %f20, %f13
	.word 0x91d02034  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r20
splash_hpstate_6_264:
	.word 0x81982167  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0167, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a379b  ! 501: SDIVX_I	sdivx	%r8, 0xfffff79b, %r10
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_6_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802089  ! 504: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd28008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_6_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d918014  ! 506: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0xa545c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0xa4fc4005  ! 508: SDIVcc_R	sdivcc 	%r17, %r5, %r18
	.word 0x8d902c3e  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x0c3e, %pstate
splash_cmpr_6_268:
	setx 0xddeb5f364b4fd23a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 511: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200f  ! 512: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_6_269:
	setx 0x4ccee864acc294ef, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_270:
	tsubcctv %r17, 0x10cc, %r1
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_6_271:
	setx 0xc5c4a4fa6c27e2f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0x2126afda0f10da0f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_6_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_274:
	.word 0x91a00172  ! 520: FABSq	dis not found

mondo_6_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 521: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
tagged_6_276:
	tsubcctv %r25, 0x1de1, %r26
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_277:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 523: RDPC	rd	%pc, %r13
DS_6_278:
	.word 0x99a409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f12
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_6_279:
	setx 0x30efdda4f3ff21b9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68ec14  ! 528: SDIVX_I	sdivx	%r3, 0x0c14, %r13
mondo_6_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d93400c  ! 529: WRPR_WSTATE_R	wrpr	%r13, %r12, %wstate
	.word 0xdad7e010  ! 530: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d9029d6  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x09d6, %pstate
splash_cmpr_6_282:
	setx 0xfe335d38a1453db9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_hpstate_6_284:
	.word 0x81982a06  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
debug_6_285:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 536: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_286:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 537: RDPC	rd	%pc, %r8
	setx 0xd7be018449bc6251, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9808011  ! 539: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_288:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 540: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_lsu_6_289:
	setx 0xb06130ece3f0959b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 544: WRASI_I	wr	%r0, 0x001c, %asi
	rd %pc, %r19
	add %r19, (ivw_6_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_290:
	.word 0x95a0016a  ! 545: FABSq	dis not found

mondo_6_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d908005  ! 546: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
donret_6_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_292-donret_6_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_293:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 548: RDPC	rd	%pc, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_294:
	setx 0xfa60d112b2d20e0e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d90c009  ! 551: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
tagged_6_296:
	tsubcctv %r16, 0x10b5, %r8
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_6_297:
	setx 0x34ac0d70e30c2368, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902817  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x0817, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_6_298:
	setx 0x3e3febbe8a69cb11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 558: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d020b4  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_6_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9ad90003  ! 561: SMULcc_R	smulcc 	%r4, %r3, %r13
DS_6_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5330004  ! 1: STQF_R	-	%f18, [%r4, %r12]
	normalw
	.word 0x93458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe6800b00  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	.word 0xe68008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9b464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r13
DS_6_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1302846  ! 1: STQF_I	-	%f8, [0x0846, %r0]
	normalw
	.word 0xa5458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9881b67e  ! 568: ADDcc_I	addcc 	%r6, 0xfffff67e, %r12
	.word 0xe0900e60  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x73, %r16
	.word 0x8d903111  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x1111, %pstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_6_302:
	tsubcctv %r19, 0x1135, %r5
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d2281  ! 573: SDIVX_I	sdivx	%r20, 0x0281, %r10
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802080  ! 575: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9b540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_6_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_304:
	.word 0x8f902001  ! 577: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2d00e60  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
mondo_6_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940003  ! 579: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_6_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_306:
	.word 0x99a00172  ! 581: FABSq	dis not found

pmu_6_307:
	nop
	setx 0xfffffc82fffff72a, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_6_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_308-donret_6_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_6_309:
	setx 0x6be3a19b388f7aa6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93a509c5  ! 586: FDIVd	fdivd	%f20, %f36, %f40
	.word 0x8d9025bc  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x05bc, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_311:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 588: RDPC	rd	%pc, %r12
splash_hpstate_6_312:
	.word 0x81982e76  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e76, %hpstate
	.word 0x83d020b5  ! 590: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_lsu_6_313:
	setx 0x53f15ce1e5413593, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_6_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_6_315:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 593: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
debug_6_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_6_317:
	setx 0xff92f886bb50565d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903128  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x1128, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe000  ! 602: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe0800c00  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r16
	.word 0xa7464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x87802055  ! 605: WRASI_I	wr	%r0, 0x0055, %asi
tagged_6_318:
	tsubcctv %r22, 0x1417, %r1
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_6_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d910008  ! 607: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
mondo_6_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d930010  ! 608: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d2146  ! 609: SDIVX_I	sdivx	%r20, 0x0146, %r10
debug_6_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_323:
	taddcctv %r21, 0x1b78, %r7
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_6_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d930000  ! 612: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
	.word 0x93902006  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_6_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_326:
	.word 0x97a00164  ! 615: FABSq	dis not found

DS_6_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802063  ! 617: WRASI_I	wr	%r0, 0x0063, %asi
splash_htba_6_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0x93500000  ! 620: RDPR_TPC	rdpr	%tpc, %r9
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d92c008  ! 622: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
mondo_6_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950002  ! 623: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
debug_6_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90391b  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x191b, %pstate
	.word 0xa968400b  ! 626: SDIVX_R	sdivx	%r1, %r11, %r20
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_332:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 627: RDPC	rd	%pc, %r8
pmu_6_333:
	nop
	setx 0xfffffc1afffff804, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902079  ! 631: WRPR_TT_I	wrpr	%r0, 0x0079, %tt
	.word 0x8d9026a6  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x06a6, %pstate
	.word 0xab848013  ! 633: WR_CLEAR_SOFTINT_R	wr	%r18, %r19, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_6_334:
	setx 0xf32c94b095cd94ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b520000  ! 637: RDPR_PIL	<illegal instruction>
DS_6_335:
	.word 0x9ba0c9d3  ! 1: FDIVd	fdivd	%f34, %f50, %f44
	pdist %f12, %f12, %f2
	.word 0x93b44305  ! 638: ALIGNADDRESS	alignaddr	%r17, %r5, %r9
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902003  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_6_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d914002  ! 641: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	setx 0x100c8eb9d521ff53, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_338:
	.word 0x9ba00171  ! 643: FABSq	dis not found

mondo_6_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 644: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
mondo_6_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94800c  ! 645: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_6_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_342:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02032  ! 648: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_tba_6_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_6_344:
	.word 0x81982d96  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d96, %hpstate
splash_tba_6_345:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab80800a  ! 653: WR_CLEAR_SOFTINT_R	wr	%r2, %r10, %clear_softint
	.word 0xa1902000  ! 654: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_6_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_6_348:
	nop
	setx 0xfffff5c9fffff76e, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_6_349:
	setx 0xfb298499df2121db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_350:
	setx 0x914223e5c1b013fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_351:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 661: RDPC	rd	%pc, %r10
mondo_6_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d91c00d  ! 662: WRPR_WSTATE_R	wrpr	%r7, %r13, %wstate
	.word 0x8d9031d3  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x11d3, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976aa681  ! 664: SDIVX_I	sdivx	%r10, 0x0681, %r11
	.word 0x97a4c9d2  ! 665: FDIVd	fdivd	%f50, %f18, %f42
	.word 0x87902317  ! 666: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
change_to_randtl_6_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_354:
	.word 0x8f902002  ! 667: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_6_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902006  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_6_356:
	setx 0x22d6e842b4eee062, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_357:
	taddcctv %r21, 0x1dc4, %r23
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902007  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xdadfe030  ! 676: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x87802004  ! 677: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_6_358:
	setx 0xb9fcbf31a27d0583, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802016  ! 679: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_6_359:
	.word 0x8198294c  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
debug_6_360:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 682: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93902004  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9b540000  ! 684: RDPR_GL	rdpr	%-, %r13
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_361:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 685: RDPC	rd	%pc, %r13
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_6_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_364:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 689: RDPC	rd	%pc, %r12
change_to_randtl_6_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_365:
	.word 0x8f902003  ! 690: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x95a089a8  ! 692: FDIVs	fdivs	%f2, %f8, %f10
splash_cmpr_6_366:
	setx 0xbbb5113fe71e1d16, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe030  ! 696: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
intveclr_6_367:
	setx 0x8c5ff1e57628903c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_368:
	.word 0x81982287  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0287, %hpstate
	.word 0x8d9037b9  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x17b9, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e020  ! 701: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
splash_tba_6_369:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_370:
	setx 0xb95513b9ba69831a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_371:
	.word 0x8f902001  ! 706: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xa1902002  ! 708: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_6_372)) -> intp(2,0,5)
intvec_6_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_6_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_373:
	.word 0x8f902002  ! 711: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_6_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 712: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
splash_hpstate_6_375:
	.word 0x8198221f  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021f, %hpstate
splash_cmpr_6_376:
	setx 0xcae0c7b302d44908, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200b  ! 715: WRPR_GL_I	wrpr	%r0, 0x000b, %-
intveclr_6_377:
	setx 0x8f03d6e045c1262d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_6_378)) -> intp(6,1,3)
xir_6_378:
	.word 0xa9853b5f  ! 717: WR_SET_SOFTINT_I	wr	%r20, 0x1b5f, %set_softint
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01969  ! 718: FqTOd	dis not found

intveclr_6_380:
	setx 0xbe9685c18490908c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 720: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x9b520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 723: FqTOd	dis not found

splash_htba_6_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x6b2ab4d8f4b85aff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_6_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d948007  ! 727: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
intveclr_6_385:
	setx 0xf535663609784911, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_6_386:
	setx 0x8b8df3107015de71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902000  ! 731: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902245  ! 732: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0x94fb712d  ! 734: SDIVcc_I	sdivcc 	%r13, 0xfffff12d, %r10
pmu_6_387:
	nop
	setx 0xfffff729fffff944, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_6_388:
	nop
	setx 0xfffff535fffff617, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802014  ! 737: WRASI_I	wr	%r0, 0x0014, %asi
	rd %pc, %r19
	add %r19, (ivw_6_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_389:
	.word 0xa3a00173  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_6_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d904014  ! 741: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x97a01a69  ! 744: FqTOi	fqtoi	
mondo_6_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92c00d  ! 745: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
tagged_6_392:
	tsubcctv %r24, 0x1bb5, %r8
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x83d020b2  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x87802088  ! 748: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_6_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 753: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_lsu_6_394:
	setx 0xa0f129d86bcbcbdf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_6_395:
	taddcctv %r23, 0x1fbd, %r6
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_6_396:
	tsubcctv %r2, 0x151f, %r6
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a61bb  ! 758: SDIVX_I	sdivx	%r9, 0x01bb, %r18
	.word 0x87802016  ! 759: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_6_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_399:
	setx 0xd93c928af5d9c156, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe48008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x95a149ec  ! 763: FDIVq	dis not found

debug_6_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_401:
	taddcctv %r25, 0x1fad, %r2
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_6_402:
	setx 0xdb9f5df4655ce8ca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_403:
	.word 0x8f902002  ! 769: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802016  ! 772: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_6_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_6_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 774: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
debug_6_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd2800c20  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
splash_cmpr_6_407:
	setx 0x803c354888175a8b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_6_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944000  ! 779: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
intveclr_6_409:
	setx 0xe90fdcd7f76c9a1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021e8  ! 781: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_410:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 783: RDPC	rd	%pc, %r13
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_6_411:
	taddcctv %r5, 0x1ef8, %r26
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d902eef  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x0eef, %pstate
intveclr_6_412:
	setx 0x0a347ae10a3b0bc3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_6_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_413:
	.word 0x8f902001  ! 789: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_6_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_414:
	.word 0x8f902001  ! 791: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99a0cd25  ! 792: FsMULd	fsmuld	%f3, %f36, %f12
splash_tba_6_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 6, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_416:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 797: RDPC	rd	%pc, %r13
	.word 0xe2800c40  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
tagged_6_417:
	taddcctv %r10, 0x19a1, %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
debug_5_0:
	nop
	mov 8, %r18
splash_hpstate_5_1:
	.word 0x81982744  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0744, %hpstate
splash_hpstate_5_2:
	.word 0x81982e16  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e16, %hpstate
	.word 0xe2800a80  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
change_to_randtl_5_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_3:
	.word 0x8f902002  ! 4: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_5_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_5_5:
	setx 0xf6c9ae1ebc1cb0e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_5_6:
	setx 0x0dc3a4793230ad2f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_5_7:
	setx 0x18aeb93d4bab5310, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe2800c40  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01964  ! 11: FqTOd	dis not found

	.word 0xda8804a0  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_5_9:
	.word 0x8198298d  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098d, %hpstate
mondo_5_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 16: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
mondo_5_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d90800b  ! 17: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	.word 0x91d02035  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802058  ! 19: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_5_12:
	setx 0x88b72bbb80520af7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_13:
	setx 0xf202b08b393cf5b1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 22: FqTOd	dis not found

debug_5_15:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 23: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_5_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_16:
	.word 0x8f902002  ! 25: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01963  ! 27: FqTOd	dis not found

intveclr_5_18:
	setx 0xd2c49f9b8a6438dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802275  ! 29: SIR	sir	0x0275
	.word 0xa7a189c0  ! 30: FDIVd	fdivd	%f6, %f0, %f50
	.word 0x87802055  ! 31: WRASI_I	wr	%r0, 0x0055, %asi
debug_5_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_20:
	.word 0x97a00161  ! 33: FABSq	dis not found

	.word 0x87802058  ! 34: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9f803027  ! 35: SIR	sir	0x1027
	.word 0x8d903a18  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x1a18, %pstate
	.word 0xa1902005  ! 37: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936966e2  ! 38: SDIVX_I	sdivx	%r5, 0x06e2, %r9
splash_tba_5_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_23:
	setx 0x1b9992af1a73a769, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a309c4  ! 41: FDIVd	fdivd	%f12, %f4, %f50
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e40  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r12
donret_5_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_24-donret_5_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_5_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 47: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d903dbb  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1dbb, %pstate
	.word 0x9f803b84  ! 49: SIR	sir	0x1b84
splash_tba_5_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_27)) -> intp(5,1,3)
xir_5_27:
	.word 0xa98075b9  ! 51: WR_SET_SOFTINT_I	wr	%r1, 0x15b9, %set_softint
	.word 0xa1902006  ! 52: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d020b3  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 179
change_to_randtl_5_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_28:
	.word 0x8f902001  ! 54: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_5_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90400b  ! 55: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_5_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_30:
	.word 0x99a0016d  ! 57: FABSq	dis not found

splash_tba_5_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_32)) -> intp(2,0,2)
intvec_5_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902da8  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x0da8, %pstate
change_to_randtl_5_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_33:
	.word 0x8f902002  ! 61: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8790225a  ! 62: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
tagged_5_34:
	tsubcctv %r10, 0x140b, %r24
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802000  ! 64: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_5_35:
	taddcctv %r18, 0x1563, %r26
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x879022c6  ! 66: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
mondo_5_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d920013  ! 67: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0x83d020b2  ! 68: Tcc_I	te	icc_or_xcc, %r0 + 178
	setx 0x9f992b85d60428e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 70: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x9f802439  ! 71: SIR	sir	0x0439
	.word 0x91d02035  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xad807aab  ! 73: WR_SOFTINT_REG_I	wr	%r1, 0x1aab, %softint
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_5_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_39:
	.word 0x8f902003  ! 75: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_5_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x97a18833  ! 78: FADDs	fadds	%f6, %f19, %f11
DS_5_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb4c30d  ! 79: ALIGNADDRESS	alignaddr	%r19, %r13, %r13
splash_tba_5_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01969  ! 81: FqTOd	dis not found

	.word 0x9880e6b3  ! 82: ADDcc_I	addcc 	%r3, 0x06b3, %r12
	setx 0x9517516b3e0afcfb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_46:
	.word 0xa7a00171  ! 84: FABSq	dis not found

intveclr_5_47:
	setx 0x5f349fb0babadc69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01964  ! 86: FqTOd	dis not found

	.word 0x99902002  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
intveclr_5_49:
	setx 0xc4fc253ded929295, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 89: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01964  ! 91: FqTOd	dis not found

	.word 0xd0c7e000  ! 92: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0xa9850011  ! 93: WR_SET_SOFTINT_R	wr	%r20, %r17, %set_softint
	.word 0xd0800b80  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
change_to_randtl_5_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_51:
	.word 0x8f902002  ! 95: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd0d7e000  ! 96: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_5_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_52-donret_5_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_5_53:
	setx 0x6d620bff2518bc2a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_54)) -> intp(6,0,12)
intvec_5_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_55:
	setx 0x99134faa3295dbb4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd08008a0  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_tba_5_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_57:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 104: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_58:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 105: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_59:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 106: RDPC	rd	%pc, %r19
splash_cmpr_5_60:
	setx 0x9554d6acd17762e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d903c89  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x1c89, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d004a0  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0xa968800c  ! 112: SDIVX_R	sdivx	%r2, %r12, %r20
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x4f3085fd5121c5f7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 115: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
tagged_5_63:
	taddcctv %r1, 0x12a8, %r12
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa1902007  ! 118: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	rd %pc, %r19
	add %r19, (ivw_5_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_64:
	.word 0xa1a00171  ! 119: FABSq	dis not found

	.word 0x87802010  ! 120: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87902168  ! 121: WRPR_TT_I	wrpr	%r0, 0x0168, %tt
	.word 0x93902000  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	setx 0x5532e2b9fab8eb38, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_66:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 124: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_5_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 126: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902007  ! 128: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_5_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 129: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
debug_5_69:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 130: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_5_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_5_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_71-donret_5_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_72:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 133: RDPC	rd	%pc, %r10
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_5_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f0, %f18, %f24
	.word 0x97b1c311  ! 135: ALIGNADDRESS	alignaddr	%r7, %r17, %r11
	.word 0x87802055  ! 136: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xad80ffdb  ! 137: WR_SOFTINT_REG_I	wr	%r3, 0x1fdb, %softint
	.word 0x8d90324c  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x124c, %pstate
	.word 0x8780201c  ! 139: WRASI_I	wr	%r0, 0x001c, %asi
splash_tba_5_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad80abff  ! 141: WR_SOFTINT_REG_I	wr	%r2, 0x0bff, %softint
	.word 0x93902002  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa5a289c5  ! 143: FDIVd	fdivd	%f10, %f36, %f18
mondo_5_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d92c010  ! 144: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x93902002  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9194efe4  ! 147: WRPR_PIL_I	wrpr	%r19, 0x0fe4, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
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
	.word 0xa7414000  ! 148: RDPC	rd	%pc, %r19
	.word 0x8d9024ac  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x04ac, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_77:
	.word 0x99a00172  ! 151: FABSq	dis not found

	.word 0xa7480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
change_to_randtl_5_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_78:
	.word 0x8f902000  ! 153: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_5_79:
	.word 0x81982697  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0xa7540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_5_80:
	setx 0x0082cde402b14cd4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d902d58  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x0d58, %pstate
	.word 0x87802089  ! 161: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_5_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_81:
	.word 0x8f902001  ! 162: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d020b3  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9f802ef1  ! 164: SIR	sir	0x0ef1
	.word 0x9191380f  ! 165: WRPR_PIL_I	wrpr	%r4, 0x180f, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8790200f  ! 167: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_5_82:
	.word 0x81982447  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0447, %hpstate
change_to_randtl_5_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_83:
	.word 0x8f902002  ! 171: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_5_84:
	.word 0x81982bce  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
	.word 0xd6800bc0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	rd %pc, %r19
	add %r19, (ivw_5_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_85:
	.word 0xa9a00167  ! 174: FABSq	dis not found

	.word 0x91540000  ! 175: RDPR_GL	rdpr	%-, %r8
	.word 0xa981c009  ! 176: WR_SET_SOFTINT_R	wr	%r7, %r9, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_5_86:
	tsubcctv %r20, 0x1183, %r25
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_5_87:
	setx 0x1fdcb583a4950795, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa24a000d  ! 180: MULX_R	mulx 	%r8, %r13, %r17
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_88:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 181: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 182: FqTOd	dis not found

debug_5_90:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 183: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x93902001  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a21e8  ! 185: SDIVX_I	sdivx	%r8, 0x01e8, %r9
	.word 0x83d02032  ! 186: Tcc_I	te	icc_or_xcc, %r0 + 50
mondo_5_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d924013  ! 187: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
intveclr_5_93:
	setx 0x21fc5101c4a15d68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_5_94:
	setx 0xca4d0b6137d30d87, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93702c32  ! 191: POPC_I	popc	0x0c32, %r9
mondo_5_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 192: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_lsu_5_96:
	setx 0x5769c183e40cf927, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a209cd  ! 1: FDIVd	fdivd	%f8, %f44, %f20
	.word 0x9ba30831  ! 194: FADDs	fadds	%f12, %f17, %f13
	.word 0x97a349c4  ! 195: FDIVd	fdivd	%f44, %f4, %f42
splash_cmpr_5_98:
	setx 0xa92eace6ea94bc8e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8790224d  ! 198: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
splash_hpstate_5_99:
	.word 0x81982c2f  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c2f, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_5_100:
	tsubcctv %r10, 0x1b63, %r9
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e000  ! 204: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
debug_5_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_102:
	setx 0x6b9806f64463e5b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_103:
	.word 0x8f902000  ! 207: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_104:
	setx 0x1efd62ae4b072186, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_5_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_105:
	.word 0x99a0016d  ! 210: FABSq	dis not found

	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 212: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_5_106:
	nop
	setx 0xfffffdc1fffff101, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802010  ! 214: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x91d02033  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_5_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_5_108:
	setx 0x50f29d3ba9424915, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802004  ! 220: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd68008a0  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_5_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9545c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802004  ! 225: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902001  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_5_110:
	setx 0x302abbda020ac61f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_111:
	setx 0x56a42842b4b931c3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 230: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda800ac0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac004a0  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_cmpr_5_113:
	setx 0xb4d790b55da038fc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d950003  ! 235: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
splash_lsu_5_115:
	setx 0xc9ca5a2ff553d92f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d92c00b  ! 237: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	setx 0xb2536533ee3b70e3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_5_118:
	tsubcctv %r14, 0x135b, %r10
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa190200e  ! 240: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87802014  ! 241: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x98c4facb  ! 242: ADDCcc_I	addccc 	%r19, 0xfffffacb, %r12
	.word 0x87902233  ! 243: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
intveclr_5_119:
	setx 0x9a1e099023584fce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8029aa  ! 245: SIR	sir	0x09aa
	.word 0x8d903d1f  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x1d1f, %pstate
splash_cmpr_5_120:
	setx 0x0ad369d698358488, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_121:
	setx 0x0d19af1804f72058, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 249: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569f8ba  ! 250: SDIVX_I	sdivx	%r7, 0xfffff8ba, %r10
	.word 0x91d02035  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_5_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_123:
	.word 0x8f902003  ! 252: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 253: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_5_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940003  ! 254: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
tagged_5_125:
	taddcctv %r17, 0x1699, %r25
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_5_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5717d83	! Random illegal ?
	.word 0xa5a509c8  ! 1: FDIVd	fdivd	%f20, %f8, %f18
	.word 0x97a14830  ! 256: FADDs	fadds	%f5, %f16, %f11
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_5_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d9030f6  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x10f6, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1540000  ! 262: RDPR_GL	<illegal instruction>
pmu_5_128:
	nop
	setx 0xffffff40fffffe8c, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_129:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 264: RDPC	rd	%pc, %r9
	.word 0xa190200a  ! 265: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87802010  ! 266: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_5_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d910010  ! 268: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
debug_5_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x919374d6  ! 270: WRPR_PIL_I	wrpr	%r13, 0x14d6, %pil
mondo_5_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d908006  ! 271: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
debug_5_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe020  ! 274: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0x8d9037f3  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x17f3, %pstate
splash_hpstate_5_134:
	.word 0x81982c57  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0xca050c45c1788de7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
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
	.word 0xa3414000  ! 279: RDPC	rd	%pc, %r17
splash_cmpr_5_137:
	setx 0x4f9a848f68bb745e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_138:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 281: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xa1902009  ! 282: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe497e020  ! 283: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
splash_cmpr_5_139:
	setx 0xdd3b91f4a3c82b74, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_5_140:
	setx 0x3a750a4467bb2e9c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_141:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 287: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_5_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x92c37219  ! 289: ADDCcc_I	addccc 	%r13, 0xfffff219, %r9
	.word 0x87902018  ! 290: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe030  ! 292: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_5_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d94000a  ! 293: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_144)) -> intp(4,0,7)
intvec_5_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802f7b  ! 296: SIR	sir	0x0f7b
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c7741  ! 298: SDIVX_I	sdivx	%r17, 0xfffff741, %r13
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_5_146:
	setx 0x8bdd8a944497beb1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a2c9d2  ! 1: FDIVd	fdivd	%f42, %f18, %f10
	normalw
	.word 0xa9458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_5_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_148:
	.word 0x99a00167  ! 303: FABSq	dis not found

	.word 0xd4880e40  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x72, %r10
	.word 0xa4d84010  ! 305: SMULcc_R	smulcc 	%r1, %r16, %r18
splash_cmpr_5_149:
	setx 0xa77b87aac21243f8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0x97a2cd2b  ! 308: FsMULd	fsmuld	%f11, %f42, %f42
debug_5_150:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 309: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x93902001  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_5_151:
	taddcctv %r5, 0x14e8, %r13
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac80e60  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968b450  ! 313: SDIVX_I	sdivx	%r2, 0xfffff450, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_153)) -> intp(5,1,3)
xir_5_153:
	.word 0xa984a115  ! 314: WR_SET_SOFTINT_I	wr	%r18, 0x0115, %set_softint
splash_hpstate_5_154:
	.word 0x81982c5c  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5c, %hpstate
splash_tba_5_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99703ac3  ! 318: POPC_I	popc	0x1ac3, %r12
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
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
	.word 0x95414000  ! 320: RDPC	rd	%pc, %r10
	setx 0x0e028778bce6d184, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c78  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0c78, %pstate
	.word 0xa981000c  ! 323: WR_SET_SOFTINT_R	wr	%r4, %r12, %set_softint
intveclr_5_158:
	setx 0xf0526182fe4afa57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x1320b189ce603eb9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903274  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x1274, %pstate
change_to_randtl_5_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_160:
	.word 0x8f902001  ! 327: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ab563  ! 328: SDIVX_I	sdivx	%r10, 0xfffff563, %r20
	.word 0xa1902003  ! 329: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_5_162:
	setx 0x6fc088251c497892, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_163:
	setx 0x7b2f37b097577ca7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_164:
	setx 0x40070bfda8baa860, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a089d1  ! 1: FDIVd	fdivd	%f2, %f48, %f10
	.word 0x99a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x97a28824  ! 333: FADDs	fadds	%f10, %f4, %f11
pmu_5_166:
	nop
	setx 0xfffffdd1fffffef9, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_5_168:
	setx 0xcf7b8a68b754e4f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 338: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_5_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa3a2c826  ! 339: FADDs	fadds	%f11, %f6, %f17
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_5_170:
	setx 0x7fd95291aa924900, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 342: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
splash_cmpr_5_172:
	setx 0x50ce19b00bd63793, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d900007  ! 344: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0x8790213a  ! 345: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
splash_hpstate_5_174:
	.word 0x8198299e  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
	.word 0xa345c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xa7540000  ! 348: RDPR_GL	rdpr	%-, %r19
	.word 0xda8804a0  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
splash_cmpr_5_175:
	setx 0x9921b59598633d42, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021a4  ! 351: WRPR_TT_I	wrpr	%r0, 0x01a4, %tt
	rd %pc, %r19
	add %r19, (ivw_5_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_176:
	.word 0x95a00172  ! 352: FABSq	dis not found

	.word 0xa3a000d0  ! 353: FNEGd	fnegd	%f16, %f48
splash_hpstate_5_177:
	.word 0x81982756  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0756, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_5_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940002  ! 356: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
tagged_5_179:
	taddcctv %r22, 0x14f3, %r9
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab848011  ! 358: WR_CLEAR_SOFTINT_R	wr	%r18, %r17, %clear_softint
	.word 0xa190200d  ! 359: WRPR_GL_I	wrpr	%r0, 0x000d, %-
pmu_5_180:
	nop
	setx 0xfffffefdfffff261, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_5_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7a349c7  ! 364: FDIVd	fdivd	%f44, %f38, %f50
mondo_5_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d90400a  ! 365: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
debug_5_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9a4c9d2  ! 367: FDIVd	fdivd	%f50, %f18, %f20
debug_5_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c80e60  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0xd497e010  ! 370: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902003  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_5_186:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_187:
	setx 0x699a5b311da554d7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_5_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_189:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 377: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8790216e  ! 378: WRPR_TT_I	wrpr	%r0, 0x016e, %tt
splash_cmpr_5_190:
	setx 0xdc8261541095bffa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902008  ! 380: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_5_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d92c010  ! 382: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_192:
	.word 0x99a00166  ! 383: FABSq	dis not found

	.word 0x93d02033  ! 384: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_5_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_5_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_5_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 387: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_196)) -> intp(5,1,3)
xir_5_196:
	.word 0xa9846aae  ! 388: WR_SET_SOFTINT_I	wr	%r17, 0x0aae, %set_softint
debug_5_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_198)) -> intp(5,1,3)
xir_5_198:
	.word 0xa9817dd4  ! 390: WR_SET_SOFTINT_I	wr	%r5, 0x1dd4, %set_softint
	.word 0x87802058  ! 391: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xad823208  ! 392: WR_SOFTINT_REG_I	wr	%r8, 0x1208, %softint
splash_cmpr_5_199:
	setx 0x2e7ed2b8f7c408ba, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_200)) -> intp(5,0,20)
intvec_5_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_201:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02034  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_5_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_5_203:
	taddcctv %r20, 0x1d92, %r9
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x87902330  ! 399: WRPR_TT_I	wrpr	%r0, 0x0330, %tt
splash_lsu_5_204:
	setx 0x6ab69ae9f216314b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d924002  ! 401: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
splash_hpstate_5_206:
	.word 0x8198258c  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058c, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968e01a  ! 403: SDIVX_I	sdivx	%r3, 0x001a, %r12
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x93d02034  ! 405: Tcc_I	tne	icc_or_xcc, %r0 + 52
debug_5_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902bdf  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x0bdf, %pstate
mondo_5_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d928014  ! 408: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
splash_hpstate_5_210:
	.word 0x81982d5e  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
DS_5_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a00543  ! 1: FSQRTd	fsqrt	
	.word 0xa9a40829  ! 410: FADDs	fadds	%f16, %f9, %f20
splash_cmpr_5_212:
	setx 0xd15469046c931972, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_5_213:
	taddcctv %r16, 0x11ef, %r20
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_5_214:
	.word 0xa5a509c1  ! 1: FDIVd	fdivd	%f20, %f32, %f18
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_5_215:
	setx 0x10260ec55acc138b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d904005  ! 418: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
splash_tba_5_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803528  ! 420: SIR	sir	0x1528
splash_lsu_5_218:
	setx 0x21c2ae36ae8e26a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_219:
	.word 0x819824e6  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04e6, %hpstate
	rd %pc, %r19
	add %r19, (ivw_5_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_220:
	.word 0xa3a00173  ! 423: FABSq	dis not found

	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_221:
	taddcctv %r10, 0x147e, %r20
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_5_222:
	.word 0x91a249cd  ! 1: FDIVd	fdivd	%f40, %f44, %f8
	allclean
	.word 0xa1b30305  ! 426: ALIGNADDRESS	alignaddr	%r12, %r5, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_5_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_223:
	.word 0x8f902003  ! 428: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99902003  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_tba_5_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802089  ! 432: WRASI_I	wr	%r0, 0x0089, %asi
pmu_5_225:
	nop
	setx 0xfffff7aafffffe4d, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_5_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d91c009  ! 436: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5697b8b  ! 437: SDIVX_I	sdivx	%r5, 0xfffffb8b, %r18
splash_hpstate_5_229:
	.word 0x81982d0e  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0e, %hpstate
	.word 0x879021c0  ! 439: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
splash_htba_5_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_5_231:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 442: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
tagged_5_232:
	tsubcctv %r21, 0x19b3, %r9
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_5_233:
	setx 0x8e34c6a416682bf2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_5_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_234:
	.word 0x9ba00173  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_5_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_235:
	.word 0xa5a00174  ! 447: FABSq	dis not found

mondo_5_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 448: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0xa780b1b4  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r2, 0x11b4, %-
splash_tba_5_237:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_238:
	setx 0x54579f169be8ca42, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_239:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 453: RDPC	rd	%pc, %r13
	.word 0xd6800b80  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
DS_5_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad84ab28  ! 457: WR_SOFTINT_REG_I	wr	%r18, 0x0b28, %softint
mondo_5_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d924003  ! 458: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	.word 0x99902000  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8780201c  ! 460: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x97a409b3  ! 461: FDIVs	fdivs	%f16, %f19, %f11
mondo_5_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d928004  ! 462: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_243:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 463: RDPC	rd	%pc, %r13
	.word 0x8d903226  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x1226, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 465: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_5_244:
	setx 0x6f2f4a70018df057, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_5_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_5_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940002  ! 470: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0x879023db  ! 471: WRPR_TT_I	wrpr	%r0, 0x03db, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xd16c6fdee32eac6a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_248:
	setx 0x97cd6e00dd7281a3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 475: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196b  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_250)) -> intp(4,0,17)
intvec_5_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_251:
	.word 0x93a049c8  ! 1: FDIVd	fdivd	%f32, %f8, %f40
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b2  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_5_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_252:
	.word 0x9ba00164  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
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
	.word 0x97414000  ! 482: RDPC	rd	%pc, %r11
splash_hpstate_5_254:
	.word 0x81982296  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
intveclr_5_255:
	setx 0x8b19556f854a9e61, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_256:
	setx 0x4384aba9c5845e94, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab804013  ! 486: WR_CLEAR_SOFTINT_R	wr	%r1, %r19, %clear_softint
	.word 0x8d802004  ! 487: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_5_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_5_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_cmpr_5_259:
	setx 0x6c1895921b99e22d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_5_260:
	.word 0x81982a87  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_5_261:
	setx 0xfa17b6419217b5d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_262:
	.word 0x9ba409cb  ! 1: FDIVd	fdivd	%f16, %f42, %f44
	.word 0x8164c2b3	! Random illegal ?
	.word 0xa7a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x95a40825  ! 495: FADDs	fadds	%f16, %f5, %f10
	.word 0x91d020b4  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 497: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_5_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_hpstate_5_264:
	.word 0x81982874  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0874, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c6644  ! 501: SDIVX_I	sdivx	%r17, 0x0644, %r13
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_5_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802080  ! 504: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd2800b40  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
mondo_5_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d930014  ! 506: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xa945c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x96f90012  ! 508: SDIVcc_R	sdivcc 	%r4, %r18, %r11
	.word 0x8d903c1a  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x1c1a, %pstate
splash_cmpr_5_268:
	setx 0xb80eb91f507e55f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 511: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa190200b  ! 512: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_5_269:
	setx 0x33ba9898c5cdb9b7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_270:
	tsubcctv %r19, 0x17ad, %r23
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_5_271:
	setx 0xa743c5f9f5612d01, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0xca4dac8078b832b4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_5_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_274:
	.word 0x91a00171  ! 520: FABSq	dis not found

mondo_5_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 521: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
tagged_5_276:
	tsubcctv %r4, 0x1942, %r17
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_277:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 523: RDPC	rd	%pc, %r9
DS_5_278:
	.word 0xa7a0c9c8  ! 1: FDIVd	fdivd	%f34, %f8, %f50
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_5_279:
	setx 0x215f1b35170f53e5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97693fa9  ! 528: SDIVX_I	sdivx	%r4, 0xffffffa9, %r11
mondo_5_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91c001  ! 529: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
	.word 0xdad7e030  ! 530: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d9025f0  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x05f0, %pstate
splash_cmpr_5_282:
	setx 0xd878301e85c232e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_hpstate_5_284:
	.word 0x8198219e  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019e, %hpstate
debug_5_285:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 536: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_286:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 537: RDPC	rd	%pc, %r8
	setx 0x5b50f5e0972c0405, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa980800a  ! 539: WR_SET_SOFTINT_R	wr	%r2, %r10, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_288:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 540: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0900e80  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
splash_lsu_5_289:
	setx 0xe75275841bfbf2dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 544: WRASI_I	wr	%r0, 0x0058, %asi
	rd %pc, %r19
	add %r19, (ivw_5_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_290:
	.word 0x99a00169  ! 545: FABSq	dis not found

mondo_5_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d928006  ! 546: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
donret_5_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_292-donret_5_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_293:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 548: RDPC	rd	%pc, %r16
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_294:
	setx 0x805ad596b4a96ab7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d91c00a  ! 551: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
tagged_5_296:
	tsubcctv %r24, 0x1710, %r24
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_5_297:
	setx 0x0bd91e3ff22e7c95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903da9  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x1da9, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_5_298:
	setx 0x9ec7161a34fce2ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 557: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 558: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02032  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_5_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x92d84014  ! 561: SMULcc_R	smulcc 	%r1, %r20, %r9
DS_5_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9304014  ! 1: STQF_R	-	%f20, [%r20, %r1]
	normalw
	.word 0x9b458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa1464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r16
DS_5_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1342482  ! 1: STQF_I	-	%f8, [0x0482, %r16]
	normalw
	.word 0x99458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x94847f16  ! 568: ADDcc_I	addcc 	%r17, 0xffffff16, %r10
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d902b3b  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x0b3b, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 571: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_302:
	tsubcctv %r24, 0x136e, %r1
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99682ed4  ! 573: SDIVX_I	sdivx	%r0, 0x0ed4, %r12
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802016  ! 575: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x97540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_5_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_304:
	.word 0x8f902001  ! 577: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_5_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d920001  ! 579: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_5_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_306:
	.word 0x91a0016a  ! 581: FABSq	dis not found

pmu_5_307:
	nop
	setx 0xfffffa7dfffff425, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_5_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_308-donret_5_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_5_309:
	setx 0x4540ce2248ba8f06, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9ba2c9c3  ! 586: FDIVd	fdivd	%f42, %f34, %f44
	.word 0x8d903390  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x1390, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 588: RDPC	rd	%pc, %r17
splash_hpstate_5_312:
	.word 0x81982b75  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b75, %hpstate
	.word 0x83d02032  ! 590: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_5_313:
	setx 0x734541a2b231b1a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_5_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_5_315:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 593: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_5_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_5_317:
	setx 0x17001e9166dd1d9d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903972  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x1972, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe000  ! 602: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe0800a80  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r16
	.word 0x95464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x87802088  ! 605: WRASI_I	wr	%r0, 0x0088, %asi
tagged_5_318:
	tsubcctv %r16, 0x1558, %r12
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_5_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d944007  ! 607: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
mondo_5_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d92800a  ! 608: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c255f  ! 609: SDIVX_I	sdivx	%r16, 0x055f, %r13
debug_5_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_323:
	taddcctv %r14, 0x117f, %r5
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_5_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d90c013  ! 612: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0x93902001  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_5_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_326:
	.word 0xa9a00174  ! 615: FABSq	dis not found

DS_5_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8780201c  ! 617: WRASI_I	wr	%r0, 0x001c, %asi
splash_htba_5_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0x91500000  ! 620: RDPR_TPC	rdpr	%tpc, %r8
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d944004  ! 622: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
mondo_5_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 623: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
debug_5_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903c68  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x1c68, %pstate
	.word 0x95694000  ! 626: SDIVX_R	sdivx	%r5, %r0, %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_332:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 627: RDPC	rd	%pc, %r16
pmu_5_333:
	nop
	setx 0xfffff7c4fffffefb, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902128  ! 631: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0x8d902d6a  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0d6a, %pstate
	.word 0xab830013  ! 633: WR_CLEAR_SOFTINT_R	wr	%r12, %r19, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_5_334:
	setx 0xc6a27ec7e782bc17, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91520000  ! 637: RDPR_PIL	<illegal instruction>
DS_5_335:
	.word 0x93a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f40
	pdist %f20, %f12, %f30
	.word 0x95b28310  ! 638: ALIGNADDRESS	alignaddr	%r10, %r16, %r10
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902000  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_5_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940000  ! 641: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	setx 0x9b5cc8e0b64cc800, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_338:
	.word 0x91a00164  ! 643: FABSq	dis not found

mondo_5_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 644: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
mondo_5_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d91400a  ! 645: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
debug_5_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_342:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_5_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_5_344:
	.word 0x819825dc  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
splash_tba_5_345:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab82800d  ! 653: WR_CLEAR_SOFTINT_R	wr	%r10, %r13, %clear_softint
	.word 0xa190200f  ! 654: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_5_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_5_348:
	nop
	setx 0xfffffa3ffffff02f, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_5_349:
	setx 0x79b9266c574995c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_350:
	setx 0x7d259af501e3f4d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_351:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 661: RDPC	rd	%pc, %r12
mondo_5_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d94c00c  ! 662: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x8d9029d7  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x09d7, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c6aef  ! 664: SDIVX_I	sdivx	%r17, 0x0aef, %r20
	.word 0x99a2c9c0  ! 665: FDIVd	fdivd	%f42, %f0, %f12
	.word 0x8790219d  ! 666: WRPR_TT_I	wrpr	%r0, 0x019d, %tt
change_to_randtl_5_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_354:
	.word 0x8f902002  ! 667: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_5_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d020b4  ! 669: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902001  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_5_356:
	setx 0x1f0f47356e2a27fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_357:
	taddcctv %r4, 0x1b8a, %r25
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902000  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xdadfe010  ! 676: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87802010  ! 677: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_5_358:
	setx 0x548e8ce3bc787a50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 679: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_5_359:
	.word 0x8198260f  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
debug_5_360:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 682: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x93902004  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91540000  ! 684: RDPR_GL	rdpr	%-, %r8
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_361:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 685: RDPC	rd	%pc, %r17
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_5_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_5_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_364:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 689: RDPC	rd	%pc, %r19
change_to_randtl_5_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_365:
	.word 0x8f902001  ! 690: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x97a089a2  ! 692: FDIVs	fdivs	%f2, %f2, %f11
splash_cmpr_5_366:
	setx 0x52485a875ed5e8e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 694: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe020  ! 696: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
intveclr_5_367:
	setx 0x47067cddf25778c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_368:
	.word 0x819823ce  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ce, %hpstate
	.word 0x8d902204  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0204, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e030  ! 701: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
splash_tba_5_369:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 704: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_370:
	setx 0xa87163859010253b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_371:
	.word 0x8f902001  ! 706: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x95454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0xa190200c  ! 708: WRPR_GL_I	wrpr	%r0, 0x000c, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_5_372)) -> intp(0,0,25)
intvec_5_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_5_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_373:
	.word 0x8f902002  ! 711: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_5_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94000d  ! 712: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
splash_hpstate_5_375:
	.word 0x81982c4f  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4f, %hpstate
splash_cmpr_5_376:
	setx 0x30568b2e46ebc5dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902008  ! 715: WRPR_GL_I	wrpr	%r0, 0x0008, %-
intveclr_5_377:
	setx 0x3ae7d6f7aa17f920, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_5_378)) -> intp(5,1,3)
xir_5_378:
	.word 0xa984eb7e  ! 717: WR_SET_SOFTINT_I	wr	%r19, 0x0b7e, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01965  ! 718: FqTOd	dis not found

intveclr_5_380:
	setx 0x4a24f69014efd912, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99500000  ! 720: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x95520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 723: FqTOd	dis not found

splash_htba_5_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x9861770a029a6995, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_5_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 727: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
intveclr_5_385:
	setx 0xee02b953b741c277, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_5_386:
	setx 0x35833c4a3c0720e4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 731: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902198  ! 732: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0xa0fc7fc5  ! 734: SDIVcc_I	sdivcc 	%r17, 0xffffffc5, %r16
pmu_5_387:
	nop
	setx 0xfffffa64fffff56b, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_5_388:
	nop
	setx 0xfffff70dfffff8af, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802016  ! 737: WRASI_I	wr	%r0, 0x0016, %asi
	rd %pc, %r19
	add %r19, (ivw_5_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_389:
	.word 0xa3a00168  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_5_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92800d  ! 741: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x91a01a6a  ! 744: FqTOi	fqtoi	
mondo_5_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944008  ! 745: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
tagged_5_392:
	tsubcctv %r12, 0x1cc9, %r5
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x91d02032  ! 747: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8780204f  ! 748: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2800b20  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_5_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94c00b  ! 753: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
splash_lsu_5_394:
	setx 0x79ac9382ba36d005, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_5_395:
	taddcctv %r23, 0x16ae, %r1
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_5_396:
	tsubcctv %r19, 0x17c9, %r15
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c7148  ! 758: SDIVX_I	sdivx	%r17, 0xfffff148, %r12
	.word 0x87802089  ! 759: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_5_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_399:
	setx 0x960aa8976a1bc640, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe48008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x95a349e9  ! 763: FDIVq	dis not found

debug_5_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_401:
	taddcctv %r16, 0x1725, %r20
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_5_402:
	setx 0xa219a2ba9b54ab58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_403:
	.word 0x8f902001  ! 769: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802020  ! 772: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_5_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_5_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d900002  ! 774: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
debug_5_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd2800ae0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
splash_cmpr_5_407:
	setx 0xc6d2ca42fd0b905f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_5_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d908010  ! 779: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
intveclr_5_409:
	setx 0x84434e7a64722022, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790219b  ! 781: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_410:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 783: RDPC	rd	%pc, %r20
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_5_411:
	taddcctv %r16, 0x1570, %r15
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d9029e9  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x09e9, %pstate
intveclr_5_412:
	setx 0x26b1fe1512e51690, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_5_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_413:
	.word 0x8f902003  ! 789: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_5_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_414:
	.word 0x8f902000  ! 791: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9a18d21  ! 792: FsMULd	fsmuld	%f6, %f32, %f20
splash_tba_5_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 5, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_416:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 797: RDPC	rd	%pc, %r13
	.word 0xe28008a0  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_5_417:
	taddcctv %r24, 0x1278, %r17
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
debug_4_0:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_0:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_0
    nop
debug_wait4_0:
    ld [%r23], %r2
    brnz %r2, debug_wait4_0
    nop
    ba,a debug_startwait4_0
continue_debug_4_0:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_0:
    cmp %r13, %r15
    bne,a wait_for_stat_4_0
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_0:
    cmp %r14, %r15
    bne,a wait_for_debug_4_0
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
splash_hpstate_4_1:
	.word 0x8198231c  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031c, %hpstate
splash_hpstate_4_2:
	.word 0x8198241c  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041c, %hpstate
	.word 0xe2800c60  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r17
change_to_randtl_4_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_3:
	.word 0x8f902003  ! 4: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_4_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_4_5:
	setx 0xe1a47c530e72c8f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_6:
	setx 0xf5b59dee45fd0a3d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_7:
	setx 0xc8e176365750c2dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe28008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01968  ! 11: FqTOd	dis not found

	.word 0xda8804a0  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_4_9:
	.word 0x81982efd  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0efd, %hpstate
mondo_4_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d928010  ! 16: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
mondo_4_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 17: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0x91d020b2  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802088  ! 19: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_4_12:
	setx 0xc3a5a56d08bda42e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_13:
	setx 0xf706c3f93d55ad7f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01966  ! 22: FqTOd	dis not found

debug_4_15:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_15:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_15
    nop
debug_wait4_15:
    ld [%r23], %r2
    brnz %r2, debug_wait4_15
    nop
    ba,a debug_startwait4_15
continue_debug_4_15:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_15:
    cmp %r13, %r15
    bne,a wait_for_stat_4_15
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_15:
    cmp %r14, %r15
    bne,a wait_for_debug_4_15
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 23: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_4_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_16:
	.word 0x8f902002  ! 25: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 26: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 27: FqTOd	dis not found

intveclr_4_18:
	setx 0x00888fe83c07370f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8028e4  ! 29: SIR	sir	0x08e4
	.word 0x99a349d3  ! 30: FDIVd	fdivd	%f44, %f50, %f12
	.word 0x87802089  ! 31: WRASI_I	wr	%r0, 0x0089, %asi
debug_4_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_20:
	.word 0xa5a00168  ! 33: FABSq	dis not found

	.word 0x87802055  ! 34: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f80228c  ! 35: SIR	sir	0x028c
	.word 0x8d903c0f  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x1c0f, %pstate
	.word 0xa1902000  ! 37: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5683d41  ! 38: SDIVX_I	sdivx	%r0, 0xfffffd41, %r18
splash_tba_4_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_23:
	setx 0xb475e667db7281e9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a089c1  ! 41: FDIVd	fdivd	%f2, %f32, %f48
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 43: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
donret_4_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_24-donret_4_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_4_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200f  ! 47: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d903ff2  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1ff2, %pstate
	.word 0x9f802603  ! 49: SIR	sir	0x0603
splash_tba_4_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_27)) -> intp(4,1,3)
xir_4_27:
	.word 0xa981f00d  ! 51: WR_SET_SOFTINT_I	wr	%r7, 0x100d, %set_softint
	.word 0xa190200c  ! 52: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93d02033  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 51
change_to_randtl_4_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_28:
	.word 0x8f902002  ! 54: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_4_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 55: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_4_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_30:
	.word 0x97a00172  ! 57: FABSq	dis not found

splash_tba_4_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_32)) -> intp(7,0,5)
intvec_4_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903cfe  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x1cfe, %pstate
change_to_randtl_4_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_33:
	.word 0x8f902001  ! 61: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8790213c  ! 62: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
tagged_4_34:
	tsubcctv %r21, 0x1b9b, %r24
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802004  ! 64: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_4_35:
	taddcctv %r12, 0x123b, %r1
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x879022f6  ! 66: WRPR_TT_I	wrpr	%r0, 0x02f6, %tt
mondo_4_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d91800d  ! 67: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	.word 0x83d020b3  ! 68: Tcc_I	te	icc_or_xcc, %r0 + 179
	setx 0x62efa26e67082b93, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90c00b  ! 70: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	.word 0x9f8026d4  ! 71: SIR	sir	0x06d4
	.word 0x91d02034  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xad852c49  ! 73: WR_SOFTINT_REG_I	wr	%r20, 0x0c49, %softint
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_4_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_39:
	.word 0x8f902000  ! 75: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_4_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a00548  ! 1: FSQRTd	fsqrt	
	.word 0xa5a00833  ! 78: FADDs	fadds	%f0, %f19, %f18
DS_4_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b4830a  ! 79: ALIGNADDRESS	alignaddr	%r18, %r10, %r8
splash_tba_4_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196b  ! 81: FqTOd	dis not found

	.word 0x9684ed76  ! 82: ADDcc_I	addcc 	%r19, 0x0d76, %r11
	setx 0x4e89ab840cad6a64, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_46:
	.word 0x91a00163  ! 84: FABSq	dis not found

intveclr_4_47:
	setx 0xaa41fa891475bc6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01962  ! 86: FqTOd	dis not found

	.word 0x99902004  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_4_49:
	setx 0x32b235a5ce3c47d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 178
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 91: FqTOd	dis not found

	.word 0xd0c7e020  ! 92: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0xa9800005  ! 93: WR_SET_SOFTINT_R	wr	%r0, %r5, %set_softint
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_4_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_51:
	.word 0x8f902002  ! 95: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd0d7e000  ! 96: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_4_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_52-donret_4_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_4_53:
	setx 0xeae65f5799c1f1ea, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_54)) -> intp(5,0,9)
intvec_4_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_55:
	setx 0xd7613ac3b5c5c23d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0800b00  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
splash_tba_4_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_57:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_57:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_57
    nop
debug_wait4_57:
    ld [%r23], %r2
    brnz %r2, debug_wait4_57
    nop
    ba,a debug_startwait4_57
continue_debug_4_57:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_57:
    cmp %r13, %r15
    bne,a wait_for_stat_4_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_57:
    cmp %r14, %r15
    bne,a wait_for_debug_4_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 104: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_58:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 105: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_59:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 106: RDPC	rd	%pc, %r11
splash_cmpr_4_60:
	setx 0x54cd3aca8a40eb6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d9021e9  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x01e9, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d004a0  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x9b6c8004  ! 112: SDIVX_R	sdivx	%r18, %r4, %r13
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x5e0735b39f3a8497, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d90c00c  ! 115: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
tagged_4_63:
	taddcctv %r21, 0x1eaf, %r10
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa190200d  ! 118: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	rd %pc, %r19
	add %r19, (ivw_4_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_64:
	.word 0x99a00167  ! 119: FABSq	dis not found

	.word 0x87802004  ! 120: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879022ae  ! 121: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
	.word 0x93902004  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	setx 0x8e804538bbad16af, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_66:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_66:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_66
    nop
debug_wait4_66:
    ld [%r23], %r2
    brnz %r2, debug_wait4_66
    nop
    ba,a debug_startwait4_66
continue_debug_4_66:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_66:
    cmp %r13, %r15
    bne,a wait_for_stat_4_66
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_66:
    cmp %r14, %r15
    bne,a wait_for_debug_4_66
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 124: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_4_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa190200c  ! 128: WRPR_GL_I	wrpr	%r0, 0x000c, %-
mondo_4_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d950010  ! 129: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
debug_4_69:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_69:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_69
    nop
debug_wait4_69:
    ld [%r23], %r2
    brnz %r2, debug_wait4_69
    nop
    ba,a debug_startwait4_69
continue_debug_4_69:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_69:
    cmp %r13, %r15
    bne,a wait_for_stat_4_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_69:
    cmp %r14, %r15
    bne,a wait_for_debug_4_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 130: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_4_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_4_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_71-donret_4_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_72:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 133: RDPC	rd	%pc, %r13
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_4_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f20, %f8
	.word 0x91b4030a  ! 135: ALIGNADDRESS	alignaddr	%r16, %r10, %r8
	.word 0x8780201c  ! 136: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xad853fc2  ! 137: WR_SOFTINT_REG_I	wr	%r20, 0x1fc2, %softint
	.word 0x8d902109  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0109, %pstate
	.word 0x87802014  ! 139: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_4_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad82e2ce  ! 141: WR_SOFTINT_REG_I	wr	%r11, 0x02ce, %softint
	.word 0x93902004  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99a1c9d4  ! 143: FDIVd	fdivd	%f38, %f20, %f12
mondo_4_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d930010  ! 144: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0x93902003  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9194b611  ! 147: WRPR_PIL_I	wrpr	%r18, 0x1611, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
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
	.word 0x9b414000  ! 148: RDPC	rd	%pc, %r13
	.word 0x8d902204  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0204, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_77:
	.word 0xa5a00167  ! 151: FABSq	dis not found

	.word 0xa7480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
change_to_randtl_4_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_78:
	.word 0x8f902002  ! 153: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_4_79:
	.word 0x81982256  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0x99540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_4_80:
	setx 0x2f8bc704b8d895bc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d90254a  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x054a, %pstate
	.word 0x87802058  ! 161: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_4_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_81:
	.word 0x8f902002  ! 162: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d020b4  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9f803c1f  ! 164: SIR	sir	0x1c1f
	.word 0x9192f7f0  ! 165: WRPR_PIL_I	wrpr	%r11, 0x17f0, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87902263  ! 167: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_4_82:
	.word 0x819828cc  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
change_to_randtl_4_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_83:
	.word 0x8f902002  ! 171: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_4_84:
	.word 0x8198296f  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x096f, %hpstate
	.word 0xd68008a0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	rd %pc, %r19
	add %r19, (ivw_4_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_85:
	.word 0xa7a00165  ! 174: FABSq	dis not found

	.word 0x9b540000  ! 175: RDPR_GL	rdpr	%-, %r13
	.word 0xa9830002  ! 176: WR_SET_SOFTINT_R	wr	%r12, %r2, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_4_86:
	tsubcctv %r10, 0x1ee6, %r12
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_4_87:
	setx 0xc591d2b1e12f4795, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa048800b  ! 180: MULX_R	mulx 	%r2, %r11, %r16
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_88:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 181: RDPC	rd	%pc, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01974  ! 182: FqTOd	dis not found

debug_4_90:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_90:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_90
    nop
debug_wait4_90:
    ld [%r23], %r2
    brnz %r2, debug_wait4_90
    nop
    ba,a debug_startwait4_90
continue_debug_4_90:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_90:
    cmp %r13, %r15
    bne,a wait_for_stat_4_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_90:
    cmp %r14, %r15
    bne,a wait_for_debug_4_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 183: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x93902000  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99687b61  ! 185: SDIVX_I	sdivx	%r1, 0xfffffb61, %r12
	.word 0x91d020b4  ! 186: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_4_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 187: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
intveclr_4_93:
	setx 0x6463004269be6cc9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_4_94:
	setx 0x52baae2fef3ea97d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95703060  ! 191: POPC_I	popc	0x1060, %r10
mondo_4_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 192: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
splash_lsu_4_96:
	setx 0x76297328a0e85585, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x93a249c2  ! 1: FDIVd	fdivd	%f40, %f2, %f40
	.word 0xa1a10832  ! 194: FADDs	fadds	%f4, %f18, %f16
	.word 0x97a309c8  ! 195: FDIVd	fdivd	%f12, %f8, %f42
splash_cmpr_4_98:
	setx 0xb77c74430758a33c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8790235f  ! 198: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
splash_hpstate_4_99:
	.word 0x8198253e  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x053e, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_4_100:
	tsubcctv %r11, 0x1ff2, %r9
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e020  ! 204: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
debug_4_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_102:
	setx 0x539fd930321daba3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_103:
	.word 0x8f902002  ! 207: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_4_104:
	setx 0xf662b313580bdec9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_4_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_105:
	.word 0x99a00168  ! 210: FABSq	dis not found

	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 211: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_4_106:
	nop
	setx 0xfffff222fffff2a2, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802014  ! 214: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa1480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x91d02033  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_4_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_4_108:
	setx 0xbf9b1faed6997e8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802000  ! 220: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800a80  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
splash_tba_4_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9345c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_4_110:
	setx 0xa751d61d114bb913, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_111:
	setx 0x670e81e893d27677, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 230: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xda8008a0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac00e80  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
splash_cmpr_4_113:
	setx 0xd71cb5b586b6bcca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d92c001  ! 235: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
splash_lsu_4_115:
	setx 0x9952252c0b67ecb1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948006  ! 237: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	setx 0x98e69003704bd1b1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_4_118:
	tsubcctv %r5, 0x18f0, %r26
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa1902008  ! 240: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802004  ! 241: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x96c1ef04  ! 242: ADDCcc_I	addccc 	%r7, 0x0f04, %r11
	.word 0x879022dd  ! 243: WRPR_TT_I	wrpr	%r0, 0x02dd, %tt
intveclr_4_119:
	setx 0x46a5ddaad51788fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803d1f  ! 245: SIR	sir	0x1d1f
	.word 0x8d902202  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
splash_cmpr_4_120:
	setx 0x06d2d03c63ad067b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_121:
	setx 0x97da9344d5e07d4e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 249: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369a75e  ! 250: SDIVX_I	sdivx	%r6, 0x075e, %r9
	.word 0x91d02033  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_4_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_123:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 254: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
tagged_4_125:
	taddcctv %r3, 0x1627, %r2
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_4_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8b46427c	! Random illegal ?
	.word 0xa1a289d1  ! 1: FDIVd	fdivd	%f10, %f48, %f16
	.word 0xa9a4482b  ! 256: FADDs	fadds	%f17, %f11, %f20
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_4_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d90207b  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x007b, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x99540000  ! 262: RDPR_GL	<illegal instruction>
pmu_4_128:
	nop
	setx 0xfffffc77fffff8f5, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_129:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 264: RDPC	rd	%pc, %r8
	.word 0xa1902005  ! 265: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802088  ! 266: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_4_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 268: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
debug_4_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9192271b  ! 270: WRPR_PIL_I	wrpr	%r8, 0x071b, %pil
mondo_4_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d928000  ! 271: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
debug_4_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800b80  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0xd4cfe020  ! 274: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0x8d90289a  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
splash_hpstate_4_134:
	.word 0x819822c5  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c5, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x7ec1d678b77007d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
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
	.word 0xa3414000  ! 279: RDPC	rd	%pc, %r17
splash_cmpr_4_137:
	setx 0x5219e60d7ca0d047, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_138:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_138:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_138
    nop
debug_wait4_138:
    ld [%r23], %r2
    brnz %r2, debug_wait4_138
    nop
    ba,a debug_startwait4_138
continue_debug_4_138:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_138:
    cmp %r13, %r15
    bne,a wait_for_stat_4_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_138:
    cmp %r14, %r15
    bne,a wait_for_debug_4_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 281: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xa1902008  ! 282: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe497e000  ! 283: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
splash_cmpr_4_139:
	setx 0x4fd16011bef68372, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_4_140:
	setx 0xe73ec15436a6e880, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 287: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_4_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa2c46dcc  ! 289: ADDCcc_I	addccc 	%r17, 0x0dcc, %r17
	.word 0x87902115  ! 290: WRPR_TT_I	wrpr	%r0, 0x0115, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe030  ! 292: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_4_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d91400d  ! 293: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_144)) -> intp(6,0,16)
intvec_4_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802b0f  ! 296: SIR	sir	0x0b0f
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c7957  ! 298: SDIVX_I	sdivx	%r17, 0xfffff957, %r18
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_4_146:
	setx 0xb9ad2ad170a2f1d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a249d1  ! 1: FDIVd	fdivd	%f40, %f48, %f42
	normalw
	.word 0x99458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_4_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_148:
	.word 0x97a0016a  ! 303: FABSq	dis not found

	.word 0xd48804a0  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x9ada8011  ! 305: SMULcc_R	smulcc 	%r10, %r17, %r13
splash_cmpr_4_149:
	setx 0x732b317b14f98162, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0x91a04d2a  ! 308: FsMULd	fsmuld	%f1, %f10, %f8
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_150:
    cmp %r14, %r15
    bne,a wait_for_debug_4_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 309: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x93902003  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_4_151:
	taddcctv %r23, 0x174d, %r19
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac804a0  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d3298  ! 313: SDIVX_I	sdivx	%r20, 0xfffff298, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_153)) -> intp(4,1,3)
xir_4_153:
	.word 0xa981a5e6  ! 314: WR_SET_SOFTINT_I	wr	%r6, 0x05e6, %set_softint
splash_hpstate_4_154:
	.word 0x81982785  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
splash_tba_4_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 317: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97702bf2  ! 318: POPC_I	popc	0x0bf2, %r11
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
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
	.word 0x93414000  ! 320: RDPC	rd	%pc, %r9
	setx 0xf8bc4e647ebc7c4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902eb9  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0eb9, %pstate
	.word 0xa980800d  ! 323: WR_SET_SOFTINT_R	wr	%r2, %r13, %set_softint
intveclr_4_158:
	setx 0x46f3dfff7fc473b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x39a7a96ec2930c69, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023c0  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x03c0, %pstate
change_to_randtl_4_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d20bc  ! 328: SDIVX_I	sdivx	%r20, 0x00bc, %r10
	.word 0xa1902001  ! 329: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_4_162:
	setx 0x2b7610dce31de708, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_163:
	setx 0xa9984dba192c1003, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_164:
	setx 0x893a43b0ab9a56b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f12
	.word 0x97a00544  ! 1: FSQRTd	fsqrt	
	.word 0x97a4482d  ! 333: FADDs	fadds	%f17, %f13, %f11
pmu_4_166:
	nop
	setx 0xfffff12dfffff950, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01969  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_4_168:
	setx 0x98edde78fb527607, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x97a00547  ! 1: FSQRTd	fsqrt	
	.word 0x97a44820  ! 339: FADDs	fadds	%f17, %f0, %f11
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_4_170:
	setx 0x549b26bdf460f33f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d948013  ! 342: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
splash_cmpr_4_172:
	setx 0x9dd9d94bd2efd942, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d904000  ! 344: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
	.word 0x879023ec  ! 345: WRPR_TT_I	wrpr	%r0, 0x03ec, %tt
splash_hpstate_4_174:
	.word 0x819823ae  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ae, %hpstate
	.word 0x9545c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x91540000  ! 348: RDPR_GL	<illegal instruction>
	.word 0xda880e80  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
splash_cmpr_4_175:
	setx 0x3678d60ad451302f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022ed  ! 351: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
	rd %pc, %r19
	add %r19, (ivw_4_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_176:
	.word 0x91a00173  ! 352: FABSq	dis not found

	.word 0x9ba000c5  ! 353: FNEGd	fnegd	%f36, %f44
splash_hpstate_4_177:
	.word 0x8198220e  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020e, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_4_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94400c  ! 356: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
tagged_4_179:
	taddcctv %r6, 0x10f1, %r20
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab81c00a  ! 358: WR_CLEAR_SOFTINT_R	wr	%r7, %r10, %clear_softint
	.word 0xa1902007  ! 359: WRPR_GL_I	wrpr	%r0, 0x0007, %-
pmu_4_180:
	nop
	setx 0xfffff42cfffffbef, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_4_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x99a489c5  ! 364: FDIVd	fdivd	%f18, %f36, %f12
mondo_4_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 365: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
debug_4_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a4c9d3  ! 367: FDIVd	fdivd	%f50, %f50, %f12
debug_4_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e010  ! 370: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902007  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_4_186:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_187:
	setx 0xb4b7a26d2c45af0f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_4_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_189:
    cmp %r14, %r15
    bne,a wait_for_debug_4_189
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 377: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x87902157  ! 378: WRPR_TT_I	wrpr	%r0, 0x0157, %tt
splash_cmpr_4_190:
	setx 0x57ace53ddde4cc31, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902005  ! 380: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_4_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d904012  ! 382: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_192:
	.word 0x97a00173  ! 383: FABSq	dis not found

	.word 0x83d02032  ! 384: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_4_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_4_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_194:
	.word 0x8f902001  ! 386: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_4_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 387: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_196)) -> intp(4,1,3)
xir_4_196:
	.word 0xa982793a  ! 388: WR_SET_SOFTINT_I	wr	%r9, 0x193a, %set_softint
debug_4_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_198)) -> intp(4,1,3)
xir_4_198:
	.word 0xa980b6f6  ! 390: WR_SET_SOFTINT_I	wr	%r2, 0x16f6, %set_softint
	.word 0x87802058  ! 391: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xad8473e0  ! 392: WR_SOFTINT_REG_I	wr	%r17, 0x13e0, %softint
splash_cmpr_4_199:
	setx 0xeac311494364cd17, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_200)) -> intp(4,0,21)
intvec_4_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_201:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02035  ! 396: Tcc_I	tne	icc_or_xcc, %r0 + 53
change_to_randtl_4_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_202:
	.word 0x8f902000  ! 397: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_4_203:
	taddcctv %r26, 0x15a1, %r3
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x87902014  ! 399: WRPR_TT_I	wrpr	%r0, 0x0014, %tt
splash_lsu_4_204:
	setx 0x1afb7fd00c66c1fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d908007  ! 401: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
splash_hpstate_4_206:
	.word 0x819821dc  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7696b0b  ! 403: SDIVX_I	sdivx	%r5, 0x0b0b, %r19
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x91d02034  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_4_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90329d  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x129d, %pstate
mondo_4_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91000a  ! 408: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
splash_hpstate_4_210:
	.word 0x819826ef  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ef, %hpstate
DS_4_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x95a00547  ! 1: FSQRTd	fsqrt	
	.word 0x91a50820  ! 410: FADDs	fadds	%f20, %f0, %f8
splash_cmpr_4_212:
	setx 0xe3969703e6e859be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_4_213:
	taddcctv %r23, 0x1741, %r20
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_4_214:
	.word 0xa7a4c9d1  ! 1: FDIVd	fdivd	%f50, %f48, %f50
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_4_215:
	setx 0xbb6c041a3a6e721c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d90c010  ! 418: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
splash_tba_4_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803515  ! 420: SIR	sir	0x1515
splash_lsu_4_218:
	setx 0x3c7569353e34d8bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_219:
	.word 0x819824d4  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d4, %hpstate
	rd %pc, %r19
	add %r19, (ivw_4_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_220:
	.word 0x93a00173  ! 423: FABSq	dis not found

	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_221:
	taddcctv %r25, 0x1366, %r15
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_4_222:
	.word 0x91a4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f8
	allclean
	.word 0x91b04313  ! 426: ALIGNADDRESS	alignaddr	%r1, %r19, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_4_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_223:
	.word 0x8f902002  ! 428: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99902002  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_tba_4_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802014  ! 432: WRASI_I	wr	%r0, 0x0014, %asi
pmu_4_225:
	nop
	setx 0xfffffb8afffffc34, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_4_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d914010  ! 436: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936aa4db  ! 437: SDIVX_I	sdivx	%r10, 0x04db, %r9
splash_hpstate_4_229:
	.word 0x81982606  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0x8790231c  ! 439: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
splash_htba_4_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_4_231:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_231:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_231
    nop
debug_wait4_231:
    ld [%r23], %r2
    brnz %r2, debug_wait4_231
    nop
    ba,a debug_startwait4_231
continue_debug_4_231:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_231:
    cmp %r13, %r15
    bne,a wait_for_stat_4_231
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_231:
    cmp %r14, %r15
    bne,a wait_for_debug_4_231
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 442: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
tagged_4_232:
	tsubcctv %r17, 0x1862, %r16
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_4_233:
	setx 0x970c112ea4f9769c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 445: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_4_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_234:
	.word 0x9ba0016d  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_4_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_235:
	.word 0xa9a0016d  ! 447: FABSq	dis not found

mondo_4_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d90c00a  ! 448: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0xa7817a78  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x1a78, %-
splash_tba_4_237:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_238:
	setx 0x8ead962d5a2a23f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_239:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 453: RDPC	rd	%pc, %r8
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_4_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad836d6f  ! 457: WR_SOFTINT_REG_I	wr	%r13, 0x0d6f, %softint
mondo_4_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 458: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x99902002  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87802004  ! 460: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93a449b3  ! 461: FDIVs	fdivs	%f17, %f19, %f9
mondo_4_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d93000a  ! 462: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_243:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 463: RDPC	rd	%pc, %r11
	.word 0x8d902e98  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 465: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_4_244:
	setx 0xaee0bb0de5628539, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_4_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_4_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940009  ! 470: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0x87902279  ! 471: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x781e5f7c199d2752, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_248:
	setx 0x8f3fe3ae386e057c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 475: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01966  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_250)) -> intp(1,0,26)
intvec_4_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_251:
	.word 0x99a2c9c0  ! 1: FDIVd	fdivd	%f42, %f0, %f12
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_4_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_252:
	.word 0xa5a00163  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
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
	.word 0x93414000  ! 482: RDPC	rd	%pc, %r9
splash_hpstate_4_254:
	.word 0x819829d5  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d5, %hpstate
intveclr_4_255:
	setx 0xf7474a7d78ea95c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_256:
	setx 0x8efa1f125d4e7615, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab82000d  ! 486: WR_CLEAR_SOFTINT_R	wr	%r8, %r13, %clear_softint
	.word 0x8d802004  ! 487: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_4_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_4_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_cmpr_4_259:
	setx 0x99f347268810e511, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_4_260:
	.word 0x8198225d  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_4_261:
	setx 0xd465c3383b4a0b2f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_262:
	.word 0x97a009c1  ! 1: FDIVd	fdivd	%f0, %f32, %f42
	.word 0xc97de7fe	! Random illegal ?
	.word 0x91a00546  ! 1: FSQRTd	fsqrt	
	.word 0x97a48826  ! 495: FADDs	fadds	%f18, %f6, %f11
	.word 0x91d020b3  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_4_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9b450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r13
splash_hpstate_4_264:
	.word 0x81982c1e  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c376c  ! 501: SDIVX_I	sdivx	%r16, 0xfffff76c, %r10
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_4_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802063  ! 504: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd28008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_4_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d90c009  ! 506: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0x9945c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x90fc4010  ! 508: SDIVcc_R	sdivcc 	%r17, %r16, %r8
	.word 0x8d9028dd  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x08dd, %pstate
splash_cmpr_4_268:
	setx 0x8fffb0a543f78654, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 511: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200e  ! 512: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_4_269:
	setx 0x8a2c518299b860f1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_270:
	tsubcctv %r25, 0x1c9e, %r16
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_4_271:
	setx 0xef5a6be1b29bd5e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0xb16baf9bdf588fc2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_4_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_274:
	.word 0x9ba0016d  ! 520: FABSq	dis not found

mondo_4_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92c007  ! 521: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
tagged_4_276:
	tsubcctv %r7, 0x1012, %r17
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_277:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 523: RDPC	rd	%pc, %r12
DS_4_278:
	.word 0x91a509c4  ! 1: FDIVd	fdivd	%f20, %f4, %f8
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_4_279:
	setx 0x633a03f159195008, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad80e80  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ce651  ! 528: SDIVX_I	sdivx	%r19, 0x0651, %r9
mondo_4_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d928012  ! 529: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0xdad7e020  ! 530: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d903097  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x1097, %pstate
splash_cmpr_4_282:
	setx 0xf7a485c37cb35cee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_hpstate_4_284:
	.word 0x8198229e  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029e, %hpstate
debug_4_285:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_285:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_285
    nop
debug_wait4_285:
    ld [%r23], %r2
    brnz %r2, debug_wait4_285
    nop
    ba,a debug_startwait4_285
continue_debug_4_285:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_285:
    cmp %r13, %r15
    bne,a wait_for_stat_4_285
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_285:
    cmp %r14, %r15
    bne,a wait_for_debug_4_285
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 536: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_286:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 537: RDPC	rd	%pc, %r16
	setx 0x10c216a1c2fe4c71, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9848007  ! 539: WR_SET_SOFTINT_R	wr	%r18, %r7, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_288:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 540: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_lsu_4_289:
	setx 0xae37a32df2761cd7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 544: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_4_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_290:
	.word 0x93a00173  ! 545: FABSq	dis not found

mondo_4_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d940003  ! 546: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
donret_4_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_292-donret_4_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_293:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 548: RDPC	rd	%pc, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_294:
	setx 0x8728e4775256a1d8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d934012  ! 551: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
tagged_4_296:
	tsubcctv %r15, 0x1e3c, %r1
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_4_297:
	setx 0xddfa4af0d38afff9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90269c  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x069c, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_4_298:
	setx 0x3bf1e2ef845980b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 558: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d020b2  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_4_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x96d9000a  ! 561: SMULcc_R	smulcc 	%r4, %r10, %r11
DS_4_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd134000a  ! 1: STQF_R	-	%f8, [%r10, %r16]
	normalw
	.word 0xa3458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x97464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r11
DS_4_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5307ace  ! 1: STQF_I	-	%f10, [0x1ace, %r1]
	normalw
	.word 0xa5458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa282b8b6  ! 568: ADDcc_I	addcc 	%r10, 0xfffff8b6, %r17
	.word 0xe0900e60  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x73, %r16
	.word 0x8d902cf2  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x0cf2, %pstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_4_302:
	tsubcctv %r17, 0x12a0, %r3
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76afede  ! 573: SDIVX_I	sdivx	%r11, 0xfffffede, %r19
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x8780204f  ! 575: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa3540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_4_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_304:
	.word 0x8f902002  ! 577: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_4_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d910005  ! 579: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_4_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_306:
	.word 0x99a00169  ! 581: FABSq	dis not found

pmu_4_307:
	nop
	setx 0xfffffb3cfffff379, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_308-donret_4_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_4_309:
	setx 0xfffe2f3d189ef181, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa5a289c8  ! 586: FDIVd	fdivd	%f10, %f8, %f18
	.word 0x8d9037cd  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x17cd, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 588: RDPC	rd	%pc, %r18
splash_hpstate_4_312:
	.word 0x81982d75  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d75, %hpstate
	.word 0x93d02034  ! 590: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_4_313:
	setx 0xaf7cbf79a2c12915, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_4_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_4_315:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_315:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_315
    nop
debug_wait4_315:
    ld [%r23], %r2
    brnz %r2, debug_wait4_315
    nop
    ba,a debug_startwait4_315
continue_debug_4_315:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_315:
    cmp %r13, %r15
    bne,a wait_for_stat_4_315
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_315:
    cmp %r14, %r15
    bne,a wait_for_debug_4_315
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 593: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
debug_4_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_4_317:
	setx 0xff0f87b826af925f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903b8a  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x1b8a, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe020  ! 602: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa9464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x87802004  ! 605: WRASI_I	wr	%r0, 0x0004, %asi
tagged_4_318:
	tsubcctv %r1, 0x157d, %r6
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_4_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d924013  ! 607: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
mondo_4_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d930014  ! 608: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569f936  ! 609: SDIVX_I	sdivx	%r7, 0xfffff936, %r18
debug_4_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_323:
	taddcctv %r11, 0x108e, %r16
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_4_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d934006  ! 612: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0x93902005  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_4_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_326:
	.word 0xa3a00172  ! 615: FABSq	dis not found

DS_4_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802058  ! 617: WRASI_I	wr	%r0, 0x0058, %asi
splash_htba_4_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0x93500000  ! 620: RDPR_TPC	rdpr	%tpc, %r9
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 621: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_4_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d918012  ! 622: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
mondo_4_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 623: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
debug_4_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90348c  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x148c, %pstate
	.word 0xa36b0006  ! 626: SDIVX_R	sdivx	%r12, %r6, %r17
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_332:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 627: RDPC	rd	%pc, %r9
pmu_4_333:
	nop
	setx 0xfffffef0fffffe80, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x879023fe  ! 631: WRPR_TT_I	wrpr	%r0, 0x03fe, %tt
	.word 0x8d903b1f  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x1b1f, %pstate
	.word 0xab818014  ! 633: WR_CLEAR_SOFTINT_R	wr	%r6, %r20, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_4_334:
	setx 0xb4b45764fb538c3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1520000  ! 637: RDPR_PIL	<illegal instruction>
DS_4_335:
	.word 0xa5a309cc  ! 1: FDIVd	fdivd	%f12, %f12, %f18
	pdist %f8, %f16, %f0
	.word 0x97b0c304  ! 638: ALIGNADDRESS	alignaddr	%r3, %r4, %r11
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902003  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_4_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d91c006  ! 641: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
	setx 0x0c9e288c2a4e4a9d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_338:
	.word 0x9ba00163  ! 643: FABSq	dis not found

mondo_4_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91800a  ! 644: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
mondo_4_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d934010  ! 645: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
debug_4_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_342:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_4_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_4_344:
	.word 0x8198205e  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005e, %hpstate
splash_tba_4_345:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab818013  ! 653: WR_CLEAR_SOFTINT_R	wr	%r6, %r19, %clear_softint
	.word 0xa1902000  ! 654: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_4_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_4_348:
	nop
	setx 0xfffff3d3fffff1b9, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_4_349:
	setx 0x9f79efc764ab9551, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_350:
	setx 0xf063da80eb4321ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_351:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 661: RDPC	rd	%pc, %r12
mondo_4_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 662: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x8d902c7e  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x0c7e, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569e758  ! 664: SDIVX_I	sdivx	%r7, 0x0758, %r10
	.word 0x99a349d1  ! 665: FDIVd	fdivd	%f44, %f48, %f12
	.word 0x8790218a  ! 666: WRPR_TT_I	wrpr	%r0, 0x018a, %tt
change_to_randtl_4_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_354:
	.word 0x8f902000  ! 667: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_4_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902006  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_4_356:
	setx 0x555b5cde1fc13dfb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_357:
	taddcctv %r13, 0x1b9b, %r4
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902001  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xdadfe000  ! 676: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x87802020  ! 677: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_4_358:
	setx 0x7ee7beff5c58467f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 679: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_4_359:
	.word 0x81982e04  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e04, %hpstate
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
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 682: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x93902003  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93540000  ! 684: RDPR_GL	rdpr	%-, %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_361:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 685: RDPC	rd	%pc, %r12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_4_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_364:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 689: RDPC	rd	%pc, %r18
change_to_randtl_4_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_365:
	.word 0x8f902000  ! 690: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd8880e60  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
	.word 0x9ba409b1  ! 692: FDIVs	fdivs	%f16, %f17, %f13
splash_cmpr_4_366:
	setx 0x96be0d461d701371, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe030  ! 696: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
intveclr_4_367:
	setx 0x8e98c0aa46ba6355, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_368:
	.word 0x8198238e  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038e, %hpstate
	.word 0x8d903a32  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x1a32, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e000  ! 701: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
splash_tba_4_369:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8800ac0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r12
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_370:
	setx 0xce2838516b23230a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_371:
	.word 0x8f902003  ! 706: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa5454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xa190200a  ! 708: WRPR_GL_I	wrpr	%r0, 0x000a, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_4_372)) -> intp(5,0,21)
intvec_4_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_4_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_373:
	.word 0x8f902001  ! 711: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_4_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d918004  ! 712: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
splash_hpstate_4_375:
	.word 0x81982f6d  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f6d, %hpstate
splash_cmpr_4_376:
	setx 0x73e95b31722a7f7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 715: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_4_377:
	setx 0x4ab9d12a633960d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_4_378)) -> intp(4,1,3)
xir_4_378:
	.word 0xa984e9bf  ! 717: WR_SET_SOFTINT_I	wr	%r19, 0x09bf, %set_softint
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01961  ! 718: FqTOd	dis not found

intveclr_4_380:
	setx 0xabebdbc78dc7c680, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91500000  ! 720: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xa5520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 723: FqTOd	dis not found

splash_htba_4_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x8f37cd17d85cf00b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2800c20  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
mondo_4_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d904008  ! 727: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
intveclr_4_385:
	setx 0xda456b58b6bb2d91, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_4_386:
	setx 0x9804dca2f0acbedd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 731: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8790229d  ! 732: WRPR_TT_I	wrpr	%r0, 0x029d, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0xa2f97479  ! 734: SDIVcc_I	sdivcc 	%r5, 0xfffff479, %r17
pmu_4_387:
	nop
	setx 0xfffff455fffffd23, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_388:
	nop
	setx 0xffffff05fffff819, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802020  ! 737: WRASI_I	wr	%r0, 0x0020, %asi
	rd %pc, %r19
	add %r19, (ivw_4_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_389:
	.word 0x91a00164  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_4_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d950012  ! 741: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x95a01a74  ! 744: FqTOi	fqtoi	
mondo_4_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d918005  ! 745: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
tagged_4_392:
	tsubcctv %r10, 0x16e5, %r19
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x83d02035  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x87802063  ! 748: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_4_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d93000d  ! 753: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
splash_lsu_4_394:
	setx 0xbd5fec8ddf37634f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_4_395:
	taddcctv %r11, 0x163f, %r2
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_4_396:
	tsubcctv %r3, 0x18d7, %r15
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169ebfd  ! 758: SDIVX_I	sdivx	%r7, 0x0bfd, %r8
	.word 0x87802004  ! 759: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_4_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_399:
	setx 0x7e7548ba9cd12786, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe48008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x9ba049f3  ! 763: FDIVq	dis not found

debug_4_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_401:
	taddcctv %r13, 0x165a, %r7
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_4_402:
	setx 0x2d00587e61130851, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_403:
	.word 0x8f902003  ! 769: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802014  ! 772: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_4_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_4_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92c007  ! 774: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
debug_4_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_4_407:
	setx 0xfc96e3928b0673b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_4_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910001  ! 779: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
intveclr_4_409:
	setx 0x8b9dd4c92bfc7182, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879023a9  ! 781: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_410:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 783: RDPC	rd	%pc, %r10
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_4_411:
	taddcctv %r24, 0x1dd3, %r6
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d9038db  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x18db, %pstate
intveclr_4_412:
	setx 0xd052b2a7d11a1367, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_4_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_413:
	.word 0x8f902002  ! 789: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_4_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_414:
	.word 0x8f902002  ! 791: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa5a24d20  ! 792: FsMULd	fsmuld	%f9, %f0, %f18
splash_tba_4_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 794: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 4, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_416:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 797: RDPC	rd	%pc, %r10
	.word 0xe2800b00  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
tagged_4_417:
	taddcctv %r2, 0x1359, %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
debug_3_0:
	nop
	mov 8, %r18
splash_hpstate_3_1:
	.word 0x81982f84  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
splash_hpstate_3_2:
	.word 0x81982797  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_3_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_3_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_3_5:
	setx 0xdf83fa4924a4f722, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_3_6:
	setx 0xf4aba72631d19edd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_3_7:
	setx 0x6876719936f14136, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe2800b00  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01960  ! 11: FqTOd	dis not found

	.word 0xda880e60  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_3_9:
	.word 0x819821ae  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ae, %hpstate
mondo_3_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d914012  ! 16: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
mondo_3_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d92400a  ! 17: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x91d02033  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802016  ! 19: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_3_12:
	setx 0xf1519a7d50279495, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_13:
	setx 0x96f8ecdb9f5fb930, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01960  ! 22: FqTOd	dis not found

debug_3_15:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 23: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_3_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_16:
	.word 0x8f902001  ! 25: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196d  ! 27: FqTOd	dis not found

intveclr_3_18:
	setx 0xce1639241c3679c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8020af  ! 29: SIR	sir	0x00af
	.word 0x97a489c9  ! 30: FDIVd	fdivd	%f18, %f40, %f42
	.word 0x87802055  ! 31: WRASI_I	wr	%r0, 0x0055, %asi
debug_3_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_20:
	.word 0x93a00166  ! 33: FABSq	dis not found

	.word 0x87802020  ! 34: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9f803d2d  ! 35: SIR	sir	0x1d2d
	.word 0x8d9023f5  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x03f5, %pstate
	.word 0xa1902008  ! 37: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96af5cf  ! 38: SDIVX_I	sdivx	%r11, 0xfffff5cf, %r20
splash_tba_3_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_23:
	setx 0x8c6df95bfe72d282, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a0c9d1  ! 41: FDIVd	fdivd	%f34, %f48, %f12
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e40  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r12
donret_3_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_24-donret_3_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_3_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902007  ! 47: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d902866  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0866, %pstate
	.word 0x9f80284a  ! 49: SIR	sir	0x084a
splash_tba_3_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_27)) -> intp(3,1,3)
xir_3_27:
	.word 0xa984fba5  ! 51: WR_SET_SOFTINT_I	wr	%r19, 0x1ba5, %set_softint
	.word 0xa190200a  ! 52: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02034  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_3_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_28:
	.word 0x8f902001  ! 54: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_3_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 55: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_3_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_30:
	.word 0xa3a00172  ! 57: FABSq	dis not found

splash_tba_3_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_32)) -> intp(1,0,7)
intvec_3_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038ad  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x18ad, %pstate
change_to_randtl_3_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_33:
	.word 0x8f902002  ! 61: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87902121  ! 62: WRPR_TT_I	wrpr	%r0, 0x0121, %tt
tagged_3_34:
	tsubcctv %r6, 0x14bc, %r11
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802000  ! 64: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_3_35:
	taddcctv %r12, 0x1738, %r13
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x879020b3  ! 66: WRPR_TT_I	wrpr	%r0, 0x00b3, %tt
mondo_3_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d91400c  ! 67: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0x91d020b2  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 178
	setx 0x2eebdc78caaf8b59, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d91c003  ! 70: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x9f802808  ! 71: SIR	sir	0x0808
	.word 0x91d02033  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xad81ac0a  ! 73: WR_SOFTINT_REG_I	wr	%r6, 0x0c0a, %softint
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_39:
	.word 0x8f902003  ! 75: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_3_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa9a4482b  ! 78: FADDs	fadds	%f17, %f11, %f20
DS_3_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b28312  ! 79: ALIGNADDRESS	alignaddr	%r10, %r18, %r9
splash_tba_3_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01969  ! 81: FqTOd	dis not found

	.word 0x92833ea5  ! 82: ADDcc_I	addcc 	%r12, 0xfffffea5, %r9
	setx 0x1a54b987fbde837d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_46:
	.word 0x97a00167  ! 84: FABSq	dis not found

intveclr_3_47:
	setx 0xfa9591d470fcc2ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 86: FqTOd	dis not found

	.word 0x99902000  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
intveclr_3_49:
	setx 0x345fed5bcc004cc6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 91: FqTOd	dis not found

	.word 0xd0c7e020  ! 92: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0xa9808013  ! 93: WR_SET_SOFTINT_R	wr	%r2, %r19, %set_softint
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_3_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_51:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0d7e010  ! 96: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_3_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_52-donret_3_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_3_53:
	setx 0x89ae3faaca69ba46, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_54)) -> intp(3,0,1)
intvec_3_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_55:
	setx 0x704da8619d9e844a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0800b20  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r8
splash_tba_3_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_57:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 104: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_58:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 105: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_59:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 106: RDPC	rd	%pc, %r11
splash_cmpr_3_60:
	setx 0x8aa0ee9d26d42824, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d903f2d  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x1f2d, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d00e40  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r20
	.word 0x97690002  ! 112: SDIVX_R	sdivx	%r4, %r2, %r11
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 113: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0xa8aa80a8b93e5a06, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940004  ! 115: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
tagged_3_63:
	taddcctv %r3, 0x12df, %r14
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa1902009  ! 118: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	rd %pc, %r19
	add %r19, (ivw_3_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_64:
	.word 0x93a00160  ! 119: FABSq	dis not found

	.word 0x87802014  ! 120: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879023a3  ! 121: WRPR_TT_I	wrpr	%r0, 0x03a3, %tt
	.word 0x93902006  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx 0x8c21f0f4ea7d944a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_66:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 124: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
debug_3_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902001  ! 128: WRPR_GL_I	wrpr	%r0, 0x0001, %-
mondo_3_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 129: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
debug_3_69:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 130: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_3_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_3_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_71-donret_3_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_72:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 133: RDPC	rd	%pc, %r13
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_3_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f4, %f4
	.word 0x93b3430c  ! 135: ALIGNADDRESS	alignaddr	%r13, %r12, %r9
	.word 0x87802088  ! 136: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xad823dbb  ! 137: WR_SOFTINT_REG_I	wr	%r8, 0x1dbb, %softint
	.word 0x8d90222f  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x022f, %pstate
	.word 0x87802088  ! 139: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_3_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad827a99  ! 141: WR_SOFTINT_REG_I	wr	%r9, 0x1a99, %softint
	.word 0x93902001  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9ba089c1  ! 143: FDIVd	fdivd	%f2, %f32, %f44
mondo_3_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94c00c  ! 144: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9191312c  ! 147: WRPR_PIL_I	wrpr	%r4, 0x112c, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
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
	.word 0xa1414000  ! 148: RDPC	rd	%pc, %r16
	.word 0x8d9036fb  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x16fb, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_77:
	.word 0x97a00172  ! 151: FABSq	dis not found

	.word 0x97480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
change_to_randtl_3_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_78:
	.word 0x8f902002  ! 153: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_3_79:
	.word 0x8198291d  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091d, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0x95540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_3_80:
	setx 0x891fd3ca1f1c24ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d9032bd  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x12bd, %pstate
	.word 0x87802055  ! 161: WRASI_I	wr	%r0, 0x0055, %asi
change_to_randtl_3_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_81:
	.word 0x8f902003  ! 162: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d020b5  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x9f802e06  ! 164: SIR	sir	0x0e06
	.word 0x9191783c  ! 165: WRPR_PIL_I	wrpr	%r5, 0x183c, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x879020d2  ! 167: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_3_82:
	.word 0x81982b8d  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
change_to_randtl_3_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_83:
	.word 0x8f902001  ! 171: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_3_84:
	.word 0x81982a06  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
	.word 0xd6800ac0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
	rd %pc, %r19
	add %r19, (ivw_3_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_85:
	.word 0x93a0016c  ! 174: FABSq	dis not found

	.word 0x9b540000  ! 175: RDPR_GL	rdpr	%-, %r13
	.word 0xa9840008  ! 176: WR_SET_SOFTINT_R	wr	%r16, %r8, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_3_86:
	tsubcctv %r10, 0x1cd1, %r10
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_3_87:
	setx 0xa59b4b95cc0e40f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x924c8013  ! 180: MULX_R	mulx 	%r18, %r19, %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_88:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 181: RDPC	rd	%pc, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 182: FqTOd	dis not found

debug_3_90:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 183: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93902005  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa168b491  ! 185: SDIVX_I	sdivx	%r2, 0xfffff491, %r16
	.word 0x93d020b3  ! 186: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_3_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d900012  ! 187: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
intveclr_3_93:
	setx 0x09ef6db00876a031, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_3_94:
	setx 0x838df36a0fe42e9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x937024d6  ! 191: POPC_I	popc	0x04d6, %r9
mondo_3_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c007  ! 192: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
splash_lsu_3_96:
	setx 0xd2c51389974cd8cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a509ca  ! 1: FDIVd	fdivd	%f20, %f10, %f8
	.word 0x99a34822  ! 194: FADDs	fadds	%f13, %f2, %f12
	.word 0x97a449d1  ! 195: FDIVd	fdivd	%f48, %f48, %f42
splash_cmpr_3_98:
	setx 0x1b8e49f32bc49803, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87902339  ! 198: WRPR_TT_I	wrpr	%r0, 0x0339, %tt
splash_hpstate_3_99:
	.word 0x8198266d  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x066d, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_3_100:
	tsubcctv %r8, 0x1d5f, %r5
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e000  ! 204: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
debug_3_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_102:
	setx 0xca5d1bdc23d3b3f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_103:
	.word 0x8f902002  ! 207: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_3_104:
	setx 0xd090339087f86e59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_3_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_105:
	.word 0xa7a0016d  ! 210: FABSq	dis not found

	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_3_106:
	nop
	setx 0xfffffa49fffff3b2, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802089  ! 214: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x99480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x91d02033  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_3_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_3_108:
	setx 0x55e64a2d43c15cd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802000  ! 220: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800b60  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
splash_tba_3_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9145c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_3_110:
	setx 0xe6b4fd9b47f2f41d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_111:
	setx 0xebc3ae065d3cee31, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200a  ! 230: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xda800aa0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac00e40  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
splash_cmpr_3_113:
	setx 0x04e06c8e2453beb9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 235: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
splash_lsu_3_115:
	setx 0x6a2d54a98a50fd1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d91c004  ! 237: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	setx 0x6ccc6b3e32c82205, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_3_118:
	tsubcctv %r17, 0x1924, %r19
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa190200f  ! 240: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802014  ! 241: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa8c427cd  ! 242: ADDCcc_I	addccc 	%r16, 0x07cd, %r20
	.word 0x87902301  ! 243: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
intveclr_3_119:
	setx 0xa6333ef3c3a093c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803cbe  ! 245: SIR	sir	0x1cbe
	.word 0x8d9022cf  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x02cf, %pstate
splash_cmpr_3_120:
	setx 0xb407b2c2b50dfe57, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_121:
	setx 0x9cf6ae67681acf67, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 249: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91687f08  ! 250: SDIVX_I	sdivx	%r1, 0xffffff08, %r8
	.word 0x91d02032  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_3_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_123:
	.word 0x8f902003  ! 252: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 253: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_3_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d910014  ! 254: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
tagged_3_125:
	taddcctv %r6, 0x105f, %r9
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_3_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe343b915	! Random illegal ?
	.word 0xa7a489ca  ! 1: FDIVd	fdivd	%f18, %f10, %f50
	.word 0x97a20823  ! 256: FADDs	fadds	%f8, %f3, %f11
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_3_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d90315b  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x115b, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x97540000  ! 262: RDPR_GL	<illegal instruction>
pmu_3_128:
	nop
	setx 0xfffffb98fffff848, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_129:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 264: RDPC	rd	%pc, %r18
	.word 0xa1902008  ! 265: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802016  ! 266: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_3_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 268: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
debug_3_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x919274de  ! 270: WRPR_PIL_I	wrpr	%r9, 0x14de, %pil
mondo_3_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d918003  ! 271: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
debug_3_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800b40  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	.word 0xd4cfe010  ! 274: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0x8d903639  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1639, %pstate
splash_hpstate_3_134:
	.word 0x819827d7  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x89474062d184b07a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
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
	.word 0xa1414000  ! 279: RDPC	rd	%pc, %r16
splash_cmpr_3_137:
	setx 0xc285e67428c8a8ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_138:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 281: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xa1902009  ! 282: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe497e010  ! 283: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
splash_cmpr_3_139:
	setx 0x077cfcc364034b22, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_3_140:
	setx 0x70b1c46784634228, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_141:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 287: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_3_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa2c2e68d  ! 289: ADDCcc_I	addccc 	%r11, 0x068d, %r17
	.word 0x879021da  ! 290: WRPR_TT_I	wrpr	%r0, 0x01da, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe030  ! 292: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_3_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d950007  ! 293: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_144)) -> intp(2,0,29)
intvec_3_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x9f8021a9  ! 296: SIR	sir	0x01a9
	.word 0x93902005  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b2c5c  ! 298: SDIVX_I	sdivx	%r12, 0x0c5c, %r9
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_3_146:
	setx 0x7d5be3dd9e2317ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a509c5  ! 1: FDIVd	fdivd	%f20, %f36, %f42
	normalw
	.word 0xa9458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_3_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_148:
	.word 0x95a0016d  ! 303: FABSq	dis not found

	.word 0xd4880e60  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0xa4da0001  ! 305: SMULcc_R	smulcc 	%r8, %r1, %r18
splash_cmpr_3_149:
	setx 0xe9645f18636b6ce9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xa5a44d30  ! 308: FsMULd	fsmuld	%f17, %f16, %f18
debug_3_150:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 309: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x93902006  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_3_151:
	taddcctv %r20, 0x1b98, %r19
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac80e40  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769bf43  ! 313: SDIVX_I	sdivx	%r6, 0xffffff43, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_153)) -> intp(3,1,3)
xir_3_153:
	.word 0xa9847e84  ! 314: WR_SET_SOFTINT_I	wr	%r17, 0x1e84, %set_softint
splash_hpstate_3_154:
	.word 0x81982646  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0646, %hpstate
splash_tba_3_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa77020e7  ! 318: POPC_I	popc	0x00e7, %r19
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
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
	.word 0xa9414000  ! 320: RDPC	rd	%pc, %r20
	setx 0xf08ad28a278fc2a0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9020b8  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x00b8, %pstate
	.word 0xa9810003  ! 323: WR_SET_SOFTINT_R	wr	%r4, %r3, %set_softint
intveclr_3_158:
	setx 0xaef6f5ddf34509ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xb43622202ecc81a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903415  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x1415, %pstate
change_to_randtl_3_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d28ab  ! 328: SDIVX_I	sdivx	%r20, 0x08ab, %r8
	.word 0xa190200a  ! 329: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_3_162:
	setx 0x0b6a6757191d721c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_163:
	setx 0xad10867733737fc8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_164:
	setx 0xfe3308ba5fcbd81a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a109cc  ! 1: FDIVd	fdivd	%f4, %f12, %f8
	.word 0x95a00547  ! 1: FSQRTd	fsqrt	
	.word 0x95a04822  ! 333: FADDs	fadds	%f1, %f2, %f10
pmu_3_166:
	nop
	setx 0xfffff9fcfffff94e, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01974  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_3_168:
	setx 0xba2b26a4e2949039, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x99a28821  ! 339: FADDs	fadds	%f10, %f1, %f12
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_3_170:
	setx 0x9dfd8285c6bfa3dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d92c010  ! 342: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
splash_cmpr_3_172:
	setx 0xe6c30e82bb06cc58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 344: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
	.word 0x87902399  ! 345: WRPR_TT_I	wrpr	%r0, 0x0399, %tt
splash_hpstate_3_174:
	.word 0x819820bd  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00bd, %hpstate
	.word 0x9345c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x99540000  ! 348: RDPR_GL	<illegal instruction>
	.word 0xda880e80  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
splash_cmpr_3_175:
	setx 0xc67172d104a3829c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902200  ! 351: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	rd %pc, %r19
	add %r19, (ivw_3_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_176:
	.word 0x95a0016d  ! 352: FABSq	dis not found

	.word 0x99a000c1  ! 353: FNEGd	fnegd	%f32, %f12
splash_hpstate_3_177:
	.word 0x8198283f  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x083f, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_3_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d940007  ! 356: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
tagged_3_179:
	taddcctv %r24, 0x1a58, %r18
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab848011  ! 358: WR_CLEAR_SOFTINT_R	wr	%r18, %r17, %clear_softint
	.word 0xa1902000  ! 359: WRPR_GL_I	wrpr	%r0, 0x0000, %-
pmu_3_180:
	nop
	setx 0xfffffaaafffffa7c, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_3_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a189c2  ! 364: FDIVd	fdivd	%f6, %f2, %f8
mondo_3_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 365: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
debug_3_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a2c9d0  ! 367: FDIVd	fdivd	%f42, %f16, %f12
debug_3_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e020  ! 370: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4c00e80  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x93902006  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_3_186:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_187:
	setx 0xe5897da429b38dea, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_3_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_189:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 377: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x87902143  ! 378: WRPR_TT_I	wrpr	%r0, 0x0143, %tt
splash_cmpr_3_190:
	setx 0x14d9b9dfaa9ca83e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 380: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_3_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d918006  ! 382: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_192:
	.word 0x99a00173  ! 383: FABSq	dis not found

	.word 0x91d02032  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_3_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_3_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_3_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d910006  ! 387: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_196)) -> intp(3,1,3)
xir_3_196:
	.word 0xa9823f16  ! 388: WR_SET_SOFTINT_I	wr	%r8, 0x1f16, %set_softint
debug_3_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_198)) -> intp(3,1,3)
xir_3_198:
	.word 0xa9822033  ! 390: WR_SET_SOFTINT_I	wr	%r8, 0x0033, %set_softint
	.word 0x87802088  ! 391: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xad82e185  ! 392: WR_SOFTINT_REG_I	wr	%r11, 0x0185, %softint
splash_cmpr_3_199:
	setx 0xc7d3703d500cd322, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_200)) -> intp(7,0,5)
intvec_3_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_201:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b5  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 181
change_to_randtl_3_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_3_203:
	taddcctv %r16, 0x13f6, %r8
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x879022a7  ! 399: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
splash_lsu_3_204:
	setx 0xd265727870fab043, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d92000c  ! 401: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
splash_hpstate_3_206:
	.word 0x819828ce  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36aa64d  ! 403: SDIVX_I	sdivx	%r10, 0x064d, %r17
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x83d02035  ! 405: Tcc_I	te	icc_or_xcc, %r0 + 53
debug_3_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9030ef  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x10ef, %pstate
mondo_3_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d91000a  ! 408: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
splash_hpstate_3_210:
	.word 0x81982b9e  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
DS_3_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x91a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa7a2c828  ! 410: FADDs	fadds	%f11, %f8, %f19
splash_cmpr_3_212:
	setx 0x1fe809367182073b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_3_213:
	taddcctv %r14, 0x116c, %r7
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_3_214:
	.word 0xa9a509c4  ! 1: FDIVd	fdivd	%f20, %f4, %f20
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_3_215:
	setx 0x97fd0e95abdf9605, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d914014  ! 418: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
splash_tba_3_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802f02  ! 420: SIR	sir	0x0f02
splash_lsu_3_218:
	setx 0xefd01a462edf2595, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_219:
	.word 0x8198294e  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	rd %pc, %r19
	add %r19, (ivw_3_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_220:
	.word 0x95a00169  ! 423: FABSq	dis not found

	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_221:
	taddcctv %r22, 0x1e7e, %r22
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_3_222:
	.word 0xa3a4c9c0  ! 1: FDIVd	fdivd	%f50, %f0, %f48
	allclean
	.word 0xa7b34311  ! 426: ALIGNADDRESS	alignaddr	%r13, %r17, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_3_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_223:
	.word 0x8f902001  ! 428: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99902001  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_3_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802004  ! 432: WRASI_I	wr	%r0, 0x0004, %asi
pmu_3_225:
	nop
	setx 0xfffff26cfffff357, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_3_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d930009  ! 436: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d3172  ! 437: SDIVX_I	sdivx	%r20, 0xfffff172, %r13
splash_hpstate_3_229:
	.word 0x8198221f  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021f, %hpstate
	.word 0x87902398  ! 439: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
splash_htba_3_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_3_231:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 442: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
tagged_3_232:
	tsubcctv %r16, 0x1e24, %r13
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_3_233:
	setx 0x1f09935e170b5684, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 445: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_3_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_234:
	.word 0x97a00174  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_3_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_235:
	.word 0x9ba00174  ! 447: FABSq	dis not found

mondo_3_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 448: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xa78074f6  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x14f6, %-
splash_tba_3_237:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_238:
	setx 0x7c85136936a1d5e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_239:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 453: RDPC	rd	%pc, %r10
	.word 0xd6800b80  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
DS_3_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad816363  ! 457: WR_SOFTINT_REG_I	wr	%r5, 0x0363, %softint
mondo_3_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d900000  ! 458: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
	.word 0x99902001  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802088  ! 460: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95a149a2  ! 461: FDIVs	fdivs	%f5, %f2, %f10
mondo_3_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d940000  ! 462: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 463: RDPC	rd	%pc, %r17
	.word 0x8d9038a8  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x18a8, %pstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 465: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_3_244:
	setx 0x0d9eb4892e91946f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_3_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_3_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 470: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0x87902002  ! 471: WRPR_TT_I	wrpr	%r0, 0x0002, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x0d69714db8c04e86, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_248:
	setx 0x41ae781225d270e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 475: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01967  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_250)) -> intp(5,0,3)
intvec_3_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_251:
	.word 0x9ba489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f44
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d020b4  ! 479: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_3_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_252:
	.word 0x95a00161  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
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
	.word 0x99414000  ! 482: RDPC	rd	%pc, %r12
splash_hpstate_3_254:
	.word 0x8198215f  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015f, %hpstate
intveclr_3_255:
	setx 0x91478988406180f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_256:
	setx 0xf15b3ca6b265dcf8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab844013  ! 486: WR_CLEAR_SOFTINT_R	wr	%r17, %r19, %clear_softint
	.word 0x8d802000  ! 487: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_3_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_3_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_cmpr_3_259:
	setx 0xf61a63f6276004f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_3_260:
	.word 0x81982b07  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b07, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_3_261:
	setx 0x13cb651de7769fd5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_262:
	.word 0x97a0c9d1  ! 1: FDIVd	fdivd	%f34, %f48, %f42
	.word 0x9941f29e	! Random illegal ?
	.word 0xa9a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa7a50830  ! 495: FADDs	fadds	%f20, %f16, %f19
	.word 0x91d02034  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_hpstate_3_264:
	.word 0x8198237d  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x037d, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c710d  ! 501: SDIVX_I	sdivx	%r17, 0xfffff10d, %r9
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_3_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802004  ! 504: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd28008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_3_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d93400a  ! 506: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
	.word 0x9745c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x9afd0009  ! 508: SDIVcc_R	sdivcc 	%r20, %r9, %r13
	.word 0x8d903b79  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x1b79, %pstate
splash_cmpr_3_268:
	setx 0x4e94815c5c90bd64, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200a  ! 511: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa190200d  ! 512: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_3_269:
	setx 0xa557370c1f7e39bc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_270:
	tsubcctv %r5, 0x1be3, %r11
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_3_271:
	setx 0xcd85211d769e646b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0x6d9461f9ce74efb3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_3_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_274:
	.word 0x9ba00171  ! 520: FABSq	dis not found

mondo_3_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 521: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
tagged_3_276:
	tsubcctv %r10, 0x1356, %r3
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_277:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 523: RDPC	rd	%pc, %r19
DS_3_278:
	.word 0xa5a4c9cb  ! 1: FDIVd	fdivd	%f50, %f42, %f18
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_3_279:
	setx 0xffbc97c3f43411d9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad80e60  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x73, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a7d63  ! 528: SDIVX_I	sdivx	%r9, 0xfffffd63, %r9
mondo_3_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92400b  ! 529: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
	.word 0xdad7e000  ! 530: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d90306f  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x106f, %pstate
splash_cmpr_3_282:
	setx 0xc8508e090e724d45, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_hpstate_3_284:
	.word 0x8198239e  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039e, %hpstate
debug_3_285:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 536: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_286:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 537: RDPC	rd	%pc, %r8
	setx 0x52862270c3fdd405, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa981c001  ! 539: WR_SET_SOFTINT_R	wr	%r7, %r1, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_288:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 540: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_lsu_3_289:
	setx 0x86afbfb914d033c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 544: WRASI_I	wr	%r0, 0x0055, %asi
	rd %pc, %r19
	add %r19, (ivw_3_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_290:
	.word 0x93a00173  ! 545: FABSq	dis not found

mondo_3_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d918000  ! 546: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
donret_3_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_292-donret_3_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_293:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 548: RDPC	rd	%pc, %r19
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_294:
	setx 0x20b4126b2e1c1da3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d94c00a  ! 551: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
tagged_3_296:
	tsubcctv %r23, 0x1473, %r23
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_3_297:
	setx 0x7109eea3d88c7266, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9028ce  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_3_298:
	setx 0x4d9cb278efcf63f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 558: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02035  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_3_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x94db4011  ! 561: SMULcc_R	smulcc 	%r13, %r17, %r10
DS_3_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe731c002  ! 1: STQF_R	-	%f19, [%r2, %r7]
	normalw
	.word 0xa3458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x91464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r8
DS_3_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe930230c  ! 1: STQF_I	-	%f20, [0x030c, %r0]
	normalw
	.word 0x99458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x948020b3  ! 568: ADDcc_I	addcc 	%r0, 0x00b3, %r10
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d90336e  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x136e, %pstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_3_302:
	tsubcctv %r7, 0x1ecb, %r13
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa369a894  ! 573: SDIVX_I	sdivx	%r6, 0x0894, %r17
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802063  ! 575: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x97540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_3_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_304:
	.word 0x8f902002  ! 577: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd2d00e60  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
mondo_3_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d940008  ! 579: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_3_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_306:
	.word 0x99a00165  ! 581: FABSq	dis not found

pmu_3_307:
	nop
	setx 0xfffff8cffffff165, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_3_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_308-donret_3_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_3_309:
	setx 0x656cc0b8f72fae82, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93a1c9d1  ! 586: FDIVd	fdivd	%f38, %f48, %f40
	.word 0x8d902625  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x0625, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_311:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 588: RDPC	rd	%pc, %r12
splash_hpstate_3_312:
	.word 0x81982e8d  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8d, %hpstate
	.word 0x91d020b4  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_3_313:
	setx 0xd162dc848ebf41b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_3_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_3_315:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 593: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_3_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_3_317:
	setx 0x841df4c18b8c6329, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d90265f  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x065f, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 601: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe000  ! 602: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9b464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x87802063  ! 605: WRASI_I	wr	%r0, 0x0063, %asi
tagged_3_318:
	tsubcctv %r4, 0x1f01, %r26
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_3_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d91c010  ! 607: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
mondo_3_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d910010  ! 608: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36caaff  ! 609: SDIVX_I	sdivx	%r18, 0x0aff, %r17
debug_3_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_323:
	taddcctv %r2, 0x17d0, %r16
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_3_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d904013  ! 612: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x93902005  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_3_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_326:
	.word 0x99a00160  ! 615: FABSq	dis not found

DS_3_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802010  ! 617: WRASI_I	wr	%r0, 0x0010, %asi
splash_htba_3_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0xa9500000  ! 620: RDPR_TPC	rdpr	%tpc, %r20
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c013  ! 622: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
mondo_3_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d930006  ! 623: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
debug_3_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902d07  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x0d07, %pstate
	.word 0x956c4005  ! 626: SDIVX_R	sdivx	%r17, %r5, %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_332:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 627: RDPC	rd	%pc, %r9
pmu_3_333:
	nop
	setx 0xfffffcbdfffff582, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902388  ! 631: WRPR_TT_I	wrpr	%r0, 0x0388, %tt
	.word 0x8d902d6b  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0d6b, %pstate
	.word 0xab83000d  ! 633: WR_CLEAR_SOFTINT_R	wr	%r12, %r13, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_3_334:
	setx 0xc151ece8429f35fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91520000  ! 637: RDPR_PIL	<illegal instruction>
DS_3_335:
	.word 0xa1a349c4  ! 1: FDIVd	fdivd	%f44, %f4, %f16
	pdist %f10, %f26, %f18
	.word 0xa5b28302  ! 638: ALIGNADDRESS	alignaddr	%r10, %r2, %r18
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902004  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
mondo_3_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 641: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	setx 0xef3b5198a44de5ac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_338:
	.word 0x99a00173  ! 643: FABSq	dis not found

mondo_3_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 644: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
mondo_3_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d928006  ! 645: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
debug_3_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_342:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_3_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_3_344:
	.word 0x8198290e  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090e, %hpstate
splash_tba_3_345:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab80000a  ! 653: WR_CLEAR_SOFTINT_R	wr	%r0, %r10, %clear_softint
	.word 0xa1902002  ! 654: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_3_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_3_348:
	nop
	setx 0xfffff980fffff682, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_3_349:
	setx 0x8cfba1e1a8503493, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_350:
	setx 0xb9c345e7e230d42f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_351:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 661: RDPC	rd	%pc, %r17
mondo_3_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d930001  ! 662: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
	.word 0x8d9033f7  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x13f7, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ca0d1  ! 664: SDIVX_I	sdivx	%r18, 0x00d1, %r8
	.word 0x91a4c9ca  ! 665: FDIVd	fdivd	%f50, %f10, %f8
	.word 0x879022c7  ! 666: WRPR_TT_I	wrpr	%r0, 0x02c7, %tt
change_to_randtl_3_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_354:
	.word 0x8f902000  ! 667: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_3_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02034  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902001  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_3_356:
	setx 0x76efc08e8dcab144, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_357:
	taddcctv %r18, 0x10f3, %r1
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902001  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xdadfe000  ! 676: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x87802016  ! 677: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_3_358:
	setx 0x33fef2c37b6d91be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 679: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_3_359:
	.word 0x819829cf  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cf, %hpstate
debug_3_360:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 682: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x93902006  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91540000  ! 684: RDPR_GL	rdpr	%-, %r8
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_361:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 685: RDPC	rd	%pc, %r8
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 686: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_3_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_3_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_364:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 689: RDPC	rd	%pc, %r12
change_to_randtl_3_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_365:
	.word 0x8f902001  ! 690: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x95a489ac  ! 692: FDIVs	fdivs	%f18, %f12, %f10
splash_cmpr_3_366:
	setx 0x35b1d97ae937590a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe020  ! 696: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
intveclr_3_367:
	setx 0xd9890742f446e5bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_368:
	.word 0x8198280c  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080c, %hpstate
	.word 0x8d902234  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0234, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e010  ! 701: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
splash_tba_3_369:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_370:
	setx 0x37a6d84080125695, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_371:
	.word 0x8f902001  ! 706: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x97454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xa1902001  ! 708: WRPR_GL_I	wrpr	%r0, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_3_372)) -> intp(4,0,21)
intvec_3_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_3_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_373:
	.word 0x8f902001  ! 711: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_3_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d92c007  ! 712: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
splash_hpstate_3_375:
	.word 0x8198262d  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x062d, %hpstate
splash_cmpr_3_376:
	setx 0x040cfd11ac0afa49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200b  ! 715: WRPR_GL_I	wrpr	%r0, 0x000b, %-
intveclr_3_377:
	setx 0xc66db164434ff3c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_3_378)) -> intp(3,1,3)
xir_3_378:
	.word 0xa981b2af  ! 717: WR_SET_SOFTINT_I	wr	%r6, 0x12af, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01966  ! 718: FqTOd	dis not found

intveclr_3_380:
	setx 0x3b250656a6e8657a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9500000  ! 720: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x95520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01960  ! 723: FqTOd	dis not found

splash_htba_3_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x4509bf94111ca9cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2800c80  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
mondo_3_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d92800a  ! 727: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
intveclr_3_385:
	setx 0x85678fb23012e4b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_3_386:
	setx 0x5a8691ecd2d57a3f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 731: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8790223b  ! 732: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0x92f86a60  ! 734: SDIVcc_I	sdivcc 	%r1, 0x0a60, %r9
pmu_3_387:
	nop
	setx 0xfffffdebfffff444, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_3_388:
	nop
	setx 0xfffffe75fffff525, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802055  ! 737: WRASI_I	wr	%r0, 0x0055, %asi
	rd %pc, %r19
	add %r19, (ivw_3_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_389:
	.word 0xa5a00174  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_3_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d92c005  ! 741: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 742: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x99a01a63  ! 744: FqTOi	fqtoi	
mondo_3_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c004  ! 745: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
tagged_3_392:
	tsubcctv %r14, 0x12b3, %r20
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x91d020b2  ! 747: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802055  ! 748: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_3_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 753: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_lsu_3_394:
	setx 0x09011fd0177b5be5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_3_395:
	taddcctv %r1, 0x18b2, %r12
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_3_396:
	tsubcctv %r11, 0x1453, %r9
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16cfd76  ! 758: SDIVX_I	sdivx	%r19, 0xfffffd76, %r16
	.word 0x87802004  ! 759: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_3_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_399:
	setx 0xb51e2c70a2212bfd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe4800b20  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x95a189e5  ! 763: FDIVq	dis not found

debug_3_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_401:
	taddcctv %r7, 0x1016, %r9
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_3_402:
	setx 0x9e7d4375f59c4e65, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_403:
	.word 0x8f902001  ! 769: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8780204f  ! 772: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_3_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_3_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d94000c  ! 774: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
debug_3_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_3_407:
	setx 0x0c41136169a5e834, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_3_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d910001  ! 779: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
intveclr_3_409:
	setx 0x256d14e4471e0786, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790237d  ! 781: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_410:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 783: RDPC	rd	%pc, %r11
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_3_411:
	taddcctv %r24, 0x10a5, %r25
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d9021fb  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x01fb, %pstate
intveclr_3_412:
	setx 0x05e69088438da393, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_3_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_413:
	.word 0x8f902002  ! 789: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_3_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_414:
	.word 0x8f902002  ! 791: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x95a40d26  ! 792: FsMULd	fsmuld	%f16, %f6, %f10
splash_tba_3_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 794: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 3, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_416:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 797: RDPC	rd	%pc, %r19
	.word 0xe28008a0  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_3_417:
	taddcctv %r3, 0x1025, %r17
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
debug_2_0:
	nop
	mov 8, %r18
splash_hpstate_2_1:
	.word 0x8198250d  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
splash_hpstate_2_2:
	.word 0x8198251f  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051f, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_2_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_2_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_2_5:
	setx 0x029076f5e0c4894a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_6:
	setx 0x313f1374784b6f4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_7:
	setx 0x12d5cc285a50a774, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe2800ac0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196a  ! 11: FqTOd	dis not found

	.word 0xda8804a0  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_2_9:
	.word 0x81982196  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
mondo_2_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d908014  ! 16: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
mondo_2_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d95000c  ! 17: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x91d02032  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802014  ! 19: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_2_12:
	setx 0x7f9a346d192756dd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_13:
	setx 0x7019811fe6765cce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01973  ! 22: FqTOd	dis not found

debug_2_15:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 23: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_2_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_16:
	.word 0x8f902001  ! 25: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 27: FqTOd	dis not found

intveclr_2_18:
	setx 0x392ed4870ff51a2d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802936  ! 29: SIR	sir	0x0936
	.word 0x91a289c1  ! 30: FDIVd	fdivd	%f10, %f32, %f8
	.word 0x87802010  ! 31: WRASI_I	wr	%r0, 0x0010, %asi
debug_2_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_20:
	.word 0x91a0016b  ! 33: FABSq	dis not found

	.word 0x87802063  ! 34: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x9f802901  ! 35: SIR	sir	0x0901
	.word 0x8d90243a  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x043a, %pstate
	.word 0xa1902001  ! 37: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68767e  ! 38: SDIVX_I	sdivx	%r1, 0xfffff67e, %r13
splash_tba_2_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_23:
	setx 0xe197398206372ba0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a049c2  ! 41: FDIVd	fdivd	%f32, %f2, %f42
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
donret_2_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_24-donret_2_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_2_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902009  ! 47: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902e64  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0e64, %pstate
	.word 0x9f803733  ! 49: SIR	sir	0x1733
splash_tba_2_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_27)) -> intp(2,1,3)
xir_2_27:
	.word 0xa9847852  ! 51: WR_SET_SOFTINT_I	wr	%r17, 0x1852, %set_softint
	.word 0xa1902009  ! 52: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93d020b5  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 181
change_to_randtl_2_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_28:
	.word 0x8f902000  ! 54: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_2_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d900005  ! 55: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_2_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_30:
	.word 0x91a00164  ! 57: FABSq	dis not found

splash_tba_2_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_32)) -> intp(3,0,28)
intvec_2_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90374e  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x174e, %pstate
change_to_randtl_2_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_33:
	.word 0x8f902000  ! 61: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8790218f  ! 62: WRPR_TT_I	wrpr	%r0, 0x018f, %tt
tagged_2_34:
	tsubcctv %r22, 0x12ac, %r11
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802004  ! 64: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_2_35:
	taddcctv %r17, 0x183b, %r17
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x879020a4  ! 66: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
mondo_2_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 67: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x83d02033  ! 68: Tcc_I	te	icc_or_xcc, %r0 + 51
	setx 0xc83fc7c4b6f074cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d900013  ! 70: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0x9f803f29  ! 71: SIR	sir	0x1f29
	.word 0x93d020b4  ! 72: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xad82a312  ! 73: WR_SOFTINT_REG_I	wr	%r10, 0x0312, %softint
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_39:
	.word 0x8f902000  ! 75: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_2_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x9ba2c82b  ! 78: FADDs	fadds	%f11, %f11, %f13
DS_2_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b08303  ! 79: ALIGNADDRESS	alignaddr	%r2, %r3, %r12
splash_tba_2_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01963  ! 81: FqTOd	dis not found

	.word 0x9a8434ef  ! 82: ADDcc_I	addcc 	%r16, 0xfffff4ef, %r13
	setx 0x5a2e77f5fa219d23, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_46:
	.word 0xa1a00172  ! 84: FABSq	dis not found

intveclr_2_47:
	setx 0xdfdb3a7b4e23797f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01963  ! 86: FqTOd	dis not found

	.word 0x99902003  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
intveclr_2_49:
	setx 0x29f2021e98cba62b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 90: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196a  ! 91: FqTOd	dis not found

	.word 0xd0c7e020  ! 92: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0xa980c014  ! 93: WR_SET_SOFTINT_R	wr	%r3, %r20, %set_softint
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_2_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_51:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0d7e010  ! 96: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_2_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_52-donret_2_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_2_53:
	setx 0x50becad93a5e653c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_54)) -> intp(2,0,31)
intvec_2_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_55:
	setx 0x136a5233d6fb8ba4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd08008a0  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_tba_2_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_57:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 104: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_58:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 105: RDPC	rd	%pc, %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_59:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 106: RDPC	rd	%pc, %r17
splash_cmpr_2_60:
	setx 0x03e06bcd7b4d0020, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d902079  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x0079, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d00e60  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r20
	.word 0x916a0011  ! 112: SDIVX_R	sdivx	%r8, %r17, %r8
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x8f2703128216eba0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91c007  ! 115: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
tagged_2_63:
	taddcctv %r15, 0x1186, %r10
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa190200a  ! 118: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	rd %pc, %r19
	add %r19, (ivw_2_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_64:
	.word 0x93a0016c  ! 119: FABSq	dis not found

	.word 0x87802004  ! 120: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8790218d  ! 121: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	.word 0x93902002  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	setx 0xebc8e8846ba55d63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_66:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 124: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_2_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 126: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902003  ! 128: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_2_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d920006  ! 129: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
debug_2_69:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 130: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_2_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_2_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_71-donret_2_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_72:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 133: RDPC	rd	%pc, %r12
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_2_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f28, %f30
	.word 0xa3b50300  ! 135: ALIGNADDRESS	alignaddr	%r20, %r0, %r17
	.word 0x87802004  ! 136: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xad81ed1e  ! 137: WR_SOFTINT_REG_I	wr	%r7, 0x0d1e, %softint
	.word 0x8d902b7a  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0b7a, %pstate
	.word 0x87802020  ! 139: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_2_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad84ff22  ! 141: WR_SOFTINT_REG_I	wr	%r19, 0x1f22, %softint
	.word 0x93902004  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91a289c1  ! 143: FDIVd	fdivd	%f10, %f32, %f8
mondo_2_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 144: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x93902001  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9194ec9b  ! 147: WRPR_PIL_I	wrpr	%r19, 0x0c9b, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
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
	.word 0xa7414000  ! 148: RDPC	rd	%pc, %r19
	.word 0x8d902697  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_77:
	.word 0x91a0016a  ! 151: FABSq	dis not found

	.word 0x99480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
change_to_randtl_2_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_78:
	.word 0x8f902000  ! 153: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_2_79:
	.word 0x819825d7  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0x93540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_2_80:
	setx 0x42c5bf5a5455c411, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d902b06  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x0b06, %pstate
	.word 0x87802020  ! 161: WRASI_I	wr	%r0, 0x0020, %asi
change_to_randtl_2_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_81:
	.word 0x8f902003  ! 162: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x83d02034  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9f803113  ! 164: SIR	sir	0x1113
	.word 0x9194ba50  ! 165: WRPR_PIL_I	wrpr	%r18, 0x1a50, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8790220c  ! 167: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_hpstate_2_82:
	.word 0x81982a1d  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1d, %hpstate
change_to_randtl_2_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_83:
	.word 0x8f902003  ! 171: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_hpstate_2_84:
	.word 0x81982ae6  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ae6, %hpstate
	.word 0xd6800a60  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
	rd %pc, %r19
	add %r19, (ivw_2_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_85:
	.word 0x99a00172  ! 174: FABSq	dis not found

	.word 0x91540000  ! 175: RDPR_GL	rdpr	%-, %r8
	.word 0xa984c013  ! 176: WR_SET_SOFTINT_R	wr	%r19, %r19, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_2_86:
	tsubcctv %r7, 0x17f7, %r9
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_2_87:
	setx 0x71ddac27e03be5ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x944d000c  ! 180: MULX_R	mulx 	%r20, %r12, %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_88:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 181: RDPC	rd	%pc, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 182: FqTOd	dis not found

debug_2_90:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 183: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93902002  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569f979  ! 185: SDIVX_I	sdivx	%r7, 0xfffff979, %r10
	.word 0x91d02034  ! 186: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_2_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d910000  ! 187: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
intveclr_2_93:
	setx 0x05bb1553e40cda82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_2_94:
	setx 0xfdb46aab7e684a7b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3702f68  ! 191: POPC_I	popc	0x0f68, %r17
mondo_2_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d908008  ! 192: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
splash_lsu_2_96:
	setx 0x37d00794a883734d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x93a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f40
	.word 0x9ba30822  ! 194: FADDs	fadds	%f12, %f2, %f13
	.word 0x93a509c3  ! 195: FDIVd	fdivd	%f20, %f34, %f40
splash_cmpr_2_98:
	setx 0x8e3eb64997a880b2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8790203e  ! 198: WRPR_TT_I	wrpr	%r0, 0x003e, %tt
splash_hpstate_2_99:
	.word 0x8198209d  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009d, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_2_100:
	tsubcctv %r9, 0x1eb8, %r26
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e000  ! 204: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
debug_2_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_102:
	setx 0xae07ce3a5b603649, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_103:
	.word 0x8f902002  ! 207: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_104:
	setx 0x8f9cc9ed58c8193f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 209: WRFPRS_I	wr	%r0, 0x0004, %fprs
	rd %pc, %r19
	add %r19, (ivw_2_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_105:
	.word 0x99a00172  ! 210: FABSq	dis not found

	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_2_106:
	nop
	setx 0xfffff7cdfffff35b, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 214: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x91d02033  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_2_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_2_108:
	setx 0xb097c0e0c2128727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802000  ! 220: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68008a0  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_2_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9345c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902002  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_2_110:
	setx 0x7f4fb965d8723ccd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_111:
	setx 0xc6f5e0c1f293010c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902005  ! 230: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xda800c80  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac004a0  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_cmpr_2_113:
	setx 0x3e69a174c07d6261, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d92800d  ! 235: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
splash_lsu_2_115:
	setx 0x87efa508b0ce33a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92c013  ! 237: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	setx 0x196f83feb4c89971, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_118:
	tsubcctv %r5, 0x11a3, %r26
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa1902003  ! 240: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802020  ! 241: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x92c4a55d  ! 242: ADDCcc_I	addccc 	%r18, 0x055d, %r9
	.word 0x87902253  ! 243: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
intveclr_2_119:
	setx 0xed217e405ed9a042, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80320c  ! 245: SIR	sir	0x120c
	.word 0x8d9037c9  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x17c9, %pstate
splash_cmpr_2_120:
	setx 0x0977e7956a4f7b6a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_121:
	setx 0x3114ecbd67fadc41, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 249: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769eb98  ! 250: SDIVX_I	sdivx	%r7, 0x0b98, %r11
	.word 0x91d02033  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_2_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_123:
	.word 0x8f902001  ! 252: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 254: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
tagged_2_125:
	taddcctv %r9, 0x1175, %r19
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_2_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb5671f50	! Random illegal ?
	.word 0x91a289d0  ! 1: FDIVd	fdivd	%f10, %f16, %f8
	.word 0xa3a48821  ! 256: FADDs	fadds	%f18, %f1, %f17
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_2_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d903345  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1345, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa3540000  ! 262: RDPR_GL	<illegal instruction>
pmu_2_128:
	nop
	setx 0xfffff6d9fffff9a2, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_129:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 264: RDPC	rd	%pc, %r10
	.word 0xa190200d  ! 265: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802016  ! 266: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_2_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c008  ! 268: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
debug_2_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x919524c4  ! 270: WRPR_PIL_I	wrpr	%r20, 0x04c4, %pil
mondo_2_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d948010  ! 271: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
debug_2_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800c80  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0xd4cfe010  ! 274: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0x8d903820  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1820, %pstate
splash_hpstate_2_134:
	.word 0x81982715  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0715, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x2a0e17945008a883, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
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
	.word 0x93414000  ! 279: RDPC	rd	%pc, %r9
splash_cmpr_2_137:
	setx 0x4e11b387dc50fb5e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_138:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 281: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xa1902006  ! 282: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe497e010  ! 283: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
splash_cmpr_2_139:
	setx 0x7d59afc9e0c41c0e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_2_140:
	setx 0xf4776b067b8081a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_141:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 287: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_2_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa2c1e350  ! 289: ADDCcc_I	addccc 	%r7, 0x0350, %r17
	.word 0x87902229  ! 290: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe030  ! 292: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_2_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d900014  ! 293: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_144)) -> intp(4,0,30)
intvec_2_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 295: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x9f8035fb  ! 296: SIR	sir	0x15fb
	.word 0x93902003  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769edcb  ! 298: SDIVX_I	sdivx	%r7, 0x0dcb, %r11
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_2_146:
	setx 0x7cd8f5a7a068e096, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f18
	normalw
	.word 0xa3458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_2_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_148:
	.word 0x95a00169  ! 303: FABSq	dis not found

	.word 0xd4880e80  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0xa2dc4011  ! 305: SMULcc_R	smulcc 	%r17, %r17, %r17
splash_cmpr_2_149:
	setx 0xb24e6293615a5f74, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xa9a24d26  ! 308: FsMULd	fsmuld	%f9, %f6, %f20
debug_2_150:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 309: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x93902002  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_2_151:
	taddcctv %r11, 0x1ded, %r16
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac804a0  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769bb9b  ! 313: SDIVX_I	sdivx	%r6, 0xfffffb9b, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_153)) -> intp(2,1,3)
xir_2_153:
	.word 0xa9853984  ! 314: WR_SET_SOFTINT_I	wr	%r20, 0x1984, %set_softint
splash_hpstate_2_154:
	.word 0x819822dc  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dc, %hpstate
splash_tba_2_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 317: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93703e53  ! 318: POPC_I	popc	0x1e53, %r9
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
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
	.word 0xa5414000  ! 320: RDPC	rd	%pc, %r18
	setx 0xa5148c2b8113bb2a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f5e  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0f5e, %pstate
	.word 0xa9830000  ! 323: WR_SET_SOFTINT_R	wr	%r12, %r0, %set_softint
intveclr_2_158:
	setx 0xe2bf946ccc1d13de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x3e25c9a27b1b5f07, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d4a  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x1d4a, %pstate
change_to_randtl_2_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56977f3  ! 328: SDIVX_I	sdivx	%r5, 0xfffff7f3, %r18
	.word 0xa1902002  ! 329: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_2_162:
	setx 0x04a699222f9e75b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_163:
	setx 0x8fabf3a74ec39c4c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_164:
	setx 0x6c8bbc0f37a7c43f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f42
	.word 0x97a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa3a18828  ! 333: FADDs	fadds	%f6, %f8, %f17
pmu_2_166:
	nop
	setx 0xfffffd2cfffff8bb, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01971  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_2_168:
	setx 0x0bf2209ec849099f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba00548  ! 1: FSQRTd	fsqrt	
	.word 0x9ba00821  ! 339: FADDs	fadds	%f0, %f1, %f13
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_2_170:
	setx 0x31eb0411cc75d1b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 342: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
splash_cmpr_2_172:
	setx 0x6eb2cc15c69654c1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d940000  ! 344: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	.word 0x879020f0  ! 345: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
splash_hpstate_2_174:
	.word 0x81982575  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0575, %hpstate
	.word 0x9945c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x99540000  ! 348: RDPR_GL	<illegal instruction>
	.word 0xda8804a0  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
splash_cmpr_2_175:
	setx 0x50e0f61cda60685e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902267  ! 351: WRPR_TT_I	wrpr	%r0, 0x0267, %tt
	rd %pc, %r19
	add %r19, (ivw_2_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_176:
	.word 0x9ba00168  ! 352: FABSq	dis not found

	.word 0x93a000c6  ! 353: FNEGd	fnegd	%f6, %f40
splash_hpstate_2_177:
	.word 0x819828af  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08af, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_2_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 356: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
tagged_2_179:
	taddcctv %r8, 0x16ad, %r10
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab80800a  ! 358: WR_CLEAR_SOFTINT_R	wr	%r2, %r10, %clear_softint
	.word 0xa1902005  ! 359: WRPR_GL_I	wrpr	%r0, 0x0005, %-
pmu_2_180:
	nop
	setx 0xfffffe88fffff24c, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_2_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a509c9  ! 364: FDIVd	fdivd	%f20, %f40, %f8
mondo_2_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91c00b  ! 365: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
debug_2_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9ba009c2  ! 367: FDIVd	fdivd	%f0, %f2, %f44
debug_2_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e000  ! 370: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4c00e40  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
	.word 0x93902006  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_2_186:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_187:
	setx 0xe65ff70ab449cbd1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_2_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_189:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 377: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x879022ec  ! 378: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
splash_cmpr_2_190:
	setx 0x7701918fedece3f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 380: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_2_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d944008  ! 382: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_192:
	.word 0xa7a00166  ! 383: FABSq	dis not found

	.word 0x93d020b3  ! 384: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_tba_2_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_2_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_2_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d91c005  ! 387: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_196)) -> intp(2,1,3)
xir_2_196:
	.word 0xa9833e1d  ! 388: WR_SET_SOFTINT_I	wr	%r12, 0x1e1d, %set_softint
debug_2_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_198)) -> intp(2,1,3)
xir_2_198:
	.word 0xa9817344  ! 390: WR_SET_SOFTINT_I	wr	%r5, 0x1344, %set_softint
	.word 0x8780204f  ! 391: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xad802b6b  ! 392: WR_SOFTINT_REG_I	wr	%r0, 0x0b6b, %softint
splash_cmpr_2_199:
	setx 0x9e3472bd6147db48, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_200)) -> intp(6,0,9)
intvec_2_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_201:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_2_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_2_203:
	taddcctv %r19, 0x16b6, %r12
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x879022f2  ! 399: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
splash_lsu_2_204:
	setx 0x7208eb7a887cc0b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d930001  ! 401: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
splash_hpstate_2_206:
	.word 0x8198201d  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ca688  ! 403: SDIVX_I	sdivx	%r18, 0x0688, %r11
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x91d02033  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_2_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9036c8  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x16c8, %pstate
mondo_2_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d904005  ! 408: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
splash_hpstate_2_210:
	.word 0x81982846  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0846, %hpstate
DS_2_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a00543  ! 1: FSQRTd	fsqrt	
	.word 0x91a0c831  ! 410: FADDs	fadds	%f3, %f17, %f8
splash_cmpr_2_212:
	setx 0xdec1dcf0f83ddd2c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_2_213:
	taddcctv %r18, 0x1ba3, %r13
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_2_214:
	.word 0x99a409c0  ! 1: FDIVd	fdivd	%f16, %f0, %f12
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_2_215:
	setx 0x3a06796464c8ebaa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d940001  ! 418: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
splash_tba_2_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803809  ! 420: SIR	sir	0x1809
splash_lsu_2_218:
	setx 0xd61addfc943f42e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_219:
	.word 0x81982976  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0976, %hpstate
	rd %pc, %r19
	add %r19, (ivw_2_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_220:
	.word 0x9ba00160  ! 423: FABSq	dis not found

	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 424: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_2_221:
	taddcctv %r3, 0x14f8, %r21
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_2_222:
	.word 0x9ba009cd  ! 1: FDIVd	fdivd	%f0, %f44, %f44
	allclean
	.word 0x93b0030a  ! 426: ALIGNADDRESS	alignaddr	%r0, %r10, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_2_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_223:
	.word 0x8f902000  ! 428: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99902002  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_tba_2_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802010  ! 432: WRASI_I	wr	%r0, 0x0010, %asi
pmu_2_225:
	nop
	setx 0xfffffc8ffffff589, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_2_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d95000d  ! 436: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68393e  ! 437: SDIVX_I	sdivx	%r0, 0xfffff93e, %r13
splash_hpstate_2_229:
	.word 0x81982807  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
	.word 0x87902069  ! 439: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
splash_htba_2_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_2_231:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 442: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
tagged_2_232:
	tsubcctv %r23, 0x135e, %r20
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_2_233:
	setx 0x8689747f55b4914b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_2_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_234:
	.word 0x95a0016c  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_2_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_235:
	.word 0x95a00164  ! 447: FABSq	dis not found

mondo_2_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d900005  ! 448: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
	.word 0xa7836fc6  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r13, 0x0fc6, %-
splash_tba_2_237:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_238:
	setx 0x728054bac51c7941, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_239:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 453: RDPC	rd	%pc, %r10
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_2_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad837844  ! 457: WR_SOFTINT_REG_I	wr	%r13, 0x1844, %softint
mondo_2_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 458: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0x99902001  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802080  ! 460: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x95a249ac  ! 461: FDIVs	fdivs	%f9, %f12, %f10
mondo_2_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d910006  ! 462: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 463: RDPC	rd	%pc, %r16
	.word 0x8d90328a  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x128a, %pstate
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 465: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_2_244:
	setx 0x3a0f206587139fc1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_2_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_2_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d928012  ! 470: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0x87902118  ! 471: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x964272aa2d2e7705, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_248:
	setx 0xf3fd3c970f743e0e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 475: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196d  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_250)) -> intp(4,0,16)
intvec_2_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_251:
	.word 0x9ba409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f44
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_2_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_252:
	.word 0x95a00174  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
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
	.word 0xa3414000  ! 482: RDPC	rd	%pc, %r17
splash_hpstate_2_254:
	.word 0x81982314  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0314, %hpstate
intveclr_2_255:
	setx 0x1b4a1f0049fdad75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_256:
	setx 0x9223ae0600327c52, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab850006  ! 486: WR_CLEAR_SOFTINT_R	wr	%r20, %r6, %clear_softint
	.word 0x8d802000  ! 487: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_2_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_2_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_2_259:
	setx 0x966e6fad1e062c4b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_2_260:
	.word 0x8198254e  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_2_261:
	setx 0xb54756b7791d20b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_262:
	.word 0x93a409ca  ! 1: FDIVd	fdivd	%f16, %f10, %f40
	.word 0xdb78ae8f	! Random illegal ?
	.word 0x99a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a34828  ! 495: FADDs	fadds	%f13, %f8, %f9
	.word 0x91d020b3  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_hpstate_2_264:
	.word 0x819821ef  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ef, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56cb1de  ! 501: SDIVX_I	sdivx	%r18, 0xfffff1de, %r18
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_2_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802088  ! 504: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd2800be0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
mondo_2_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d91c002  ! 506: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0xa745c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x90fd000c  ! 508: SDIVcc_R	sdivcc 	%r20, %r12, %r8
	.word 0x8d903fad  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x1fad, %pstate
splash_cmpr_2_268:
	setx 0xe5fc4f5721f97199, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 511: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa190200a  ! 512: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_2_269:
	setx 0x464bbe5d35a24c80, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_270:
	tsubcctv %r24, 0x143f, %r25
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_2_271:
	setx 0xcd01cc503a6bcb99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0x949a2073989de2dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_2_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_274:
	.word 0xa9a00171  ! 520: FABSq	dis not found

mondo_2_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 521: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
tagged_2_276:
	tsubcctv %r12, 0x15bf, %r17
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_277:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 523: RDPC	rd	%pc, %r8
DS_2_278:
	.word 0x9ba289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f44
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_2_279:
	setx 0x2fd21c70261eab5b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c6b84  ! 528: SDIVX_I	sdivx	%r17, 0x0b84, %r10
mondo_2_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92c012  ! 529: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0xdad7e020  ! 530: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d9026aa  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x06aa, %pstate
splash_cmpr_2_282:
	setx 0xe23f569d19901980, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_hpstate_2_284:
	.word 0x81982e54  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
debug_2_285:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 536: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_286:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 537: RDPC	rd	%pc, %r12
	setx 0x28bb625fadb73add, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9834000  ! 539: WR_SET_SOFTINT_R	wr	%r13, %r0, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_288:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 540: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0900e40  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
splash_lsu_2_289:
	setx 0x4cbf0820182e729f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 544: WRASI_I	wr	%r0, 0x0010, %asi
	rd %pc, %r19
	add %r19, (ivw_2_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_290:
	.word 0x97a00170  ! 545: FABSq	dis not found

mondo_2_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 546: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
donret_2_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_292-donret_2_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_293:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 548: RDPC	rd	%pc, %r20
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_294:
	setx 0x6d005a3c1548a61d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d910003  ! 551: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
tagged_2_296:
	tsubcctv %r15, 0x1707, %r21
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_2_297:
	setx 0x0640ee1c93c8a936, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903c68  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x1c68, %pstate
	.word 0xdac00e40  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
splash_lsu_2_298:
	setx 0xe737495ef246a3ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 557: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 558: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x83d020b2  ! 559: Tcc_I	te	icc_or_xcc, %r0 + 178
debug_2_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x90db4002  ! 561: SMULcc_R	smulcc 	%r13, %r2, %r8
DS_2_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb314012  ! 1: STQF_R	-	%f13, [%r18, %r5]
	normalw
	.word 0x99458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6800a60  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0xa9464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r20
DS_2_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd532fdaf  ! 1: STQF_I	-	%f10, [0x1daf, %r11]
	normalw
	.word 0x99458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9284b96c  ! 568: ADDcc_I	addcc 	%r18, 0xfffff96c, %r9
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d902fff  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x0fff, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 571: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_2_302:
	tsubcctv %r11, 0x16db, %r3
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d21ba  ! 573: SDIVX_I	sdivx	%r20, 0x01ba, %r12
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802088  ! 575: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_2_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_304:
	.word 0x8f902000  ! 577: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_2_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c013  ! 579: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_2_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_306:
	.word 0x95a00167  ! 581: FABSq	dis not found

pmu_2_307:
	nop
	setx 0xfffffdf5fffff437, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_308-donret_2_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_2_309:
	setx 0x08edcb72784c0772, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a289d2  ! 586: FDIVd	fdivd	%f10, %f18, %f12
	.word 0x8d90296f  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x096f, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_311:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 588: RDPC	rd	%pc, %r10
splash_hpstate_2_312:
	.word 0x819827bd  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07bd, %hpstate
	.word 0x91d02032  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_2_313:
	setx 0xd5bbbf55a4b8ad99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_2_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_2_315:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 593: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_2_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_2_317:
	setx 0x6202217c11415753, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902215  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe020  ! 602: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x95464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x87802080  ! 605: WRASI_I	wr	%r0, 0x0080, %asi
tagged_2_318:
	tsubcctv %r5, 0x1a6c, %r20
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_2_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94c00a  ! 607: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
mondo_2_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d900008  ! 608: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56ce763  ! 609: SDIVX_I	sdivx	%r19, 0x0763, %r18
debug_2_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_323:
	taddcctv %r10, 0x1fd1, %r12
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_2_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d900014  ! 612: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x93902000  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_2_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_326:
	.word 0xa9a00163  ! 615: FABSq	dis not found

DS_2_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802058  ! 617: WRASI_I	wr	%r0, 0x0058, %asi
splash_htba_2_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0x91500000  ! 620: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 622: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
mondo_2_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 623: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
debug_2_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902bb4  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x0bb4, %pstate
	.word 0x9569c013  ! 626: SDIVX_R	sdivx	%r7, %r19, %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_332:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 627: RDPC	rd	%pc, %r20
pmu_2_333:
	nop
	setx 0xfffff3d7fffffb99, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902200  ! 631: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0x8d90362d  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x162d, %pstate
	.word 0xab84800a  ! 633: WR_CLEAR_SOFTINT_R	wr	%r18, %r10, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_2_334:
	setx 0xf7c1ea1e5ca8f822, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3520000  ! 637: RDPR_PIL	<illegal instruction>
DS_2_335:
	.word 0xa9a489ca  ! 1: FDIVd	fdivd	%f18, %f10, %f20
	pdist %f26, %f8, %f28
	.word 0x91b40309  ! 638: ALIGNADDRESS	alignaddr	%r16, %r9, %r8
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902004  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
mondo_2_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d92c000  ! 641: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	setx 0xb2f60bfff8623fef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_338:
	.word 0xa3a0016d  ! 643: FABSq	dis not found

mondo_2_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d900000  ! 644: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
mondo_2_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94800c  ! 645: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_2_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_342:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_2_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_2_344:
	.word 0x81982e8f  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
splash_tba_2_345:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab834003  ! 653: WR_CLEAR_SOFTINT_R	wr	%r13, %r3, %clear_softint
	.word 0xa1902003  ! 654: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_2_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_2_348:
	nop
	setx 0xfffffcc4fffff897, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_2_349:
	setx 0x1c61e7592b9eea1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_350:
	setx 0x19555f7bd9eadddf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_351:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 661: RDPC	rd	%pc, %r8
mondo_2_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94000a  ! 662: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	.word 0x8d902c01  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x0c01, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95693697  ! 664: SDIVX_I	sdivx	%r4, 0xfffff697, %r10
	.word 0x91a089ca  ! 665: FDIVd	fdivd	%f2, %f10, %f8
	.word 0x87902056  ! 666: WRPR_TT_I	wrpr	%r0, 0x0056, %tt
change_to_randtl_2_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_354:
	.word 0x8f902001  ! 667: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_2_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902003  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_2_356:
	setx 0xf2d1a2163926c962, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_357:
	taddcctv %r12, 0x188f, %r18
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902007  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xdadfe010  ! 676: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87802089  ! 677: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_2_358:
	setx 0xd158e8ffd6a68635, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 679: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_2_359:
	.word 0x81982a1e  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1e, %hpstate
debug_2_360:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 682: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x93902005  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x97540000  ! 684: RDPR_GL	rdpr	%-, %r11
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_361:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 685: RDPC	rd	%pc, %r13
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 686: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_2_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_2_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_364:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 689: RDPC	rd	%pc, %r10
change_to_randtl_2_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_365:
	.word 0x8f902003  ! 690: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd8880e60  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
	.word 0xa7a289a5  ! 692: FDIVs	fdivs	%f10, %f5, %f19
splash_cmpr_2_366:
	setx 0x71a4a99cf844633f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe020  ! 696: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
intveclr_2_367:
	setx 0xb358c937494d2404, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_368:
	.word 0x81982f07  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
	.word 0x8d902d86  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0d86, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e030  ! 701: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
splash_tba_2_369:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 704: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_2_370:
	setx 0xe189f6579ff771ca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_371:
	.word 0x8f902003  ! 706: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xa1902008  ! 708: WRPR_GL_I	wrpr	%r0, 0x0008, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_2_372)) -> intp(3,0,12)
intvec_2_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_2_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_373:
	.word 0x8f902002  ! 711: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_2_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d91c00b  ! 712: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
splash_hpstate_2_375:
	.word 0x81982265  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0265, %hpstate
splash_cmpr_2_376:
	setx 0x308f037f53110411, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200b  ! 715: WRPR_GL_I	wrpr	%r0, 0x000b, %-
intveclr_2_377:
	setx 0xb2925a8f35b99e16, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_2_378)) -> intp(2,1,3)
xir_2_378:
	.word 0xa9812f37  ! 717: WR_SET_SOFTINT_I	wr	%r4, 0x0f37, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196c  ! 718: FqTOd	dis not found

intveclr_2_380:
	setx 0xc913b1c2b4f383cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xa7520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01974  ! 723: FqTOd	dis not found

splash_htba_2_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0xe48157bbe61beb93, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_2_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d908005  ! 727: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
intveclr_2_385:
	setx 0xac07712870e55a5f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_2_386:
	setx 0x1cd3f3d4abeb8515, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902009  ! 731: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902147  ! 732: WRPR_TT_I	wrpr	%r0, 0x0147, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0x96faf101  ! 734: SDIVcc_I	sdivcc 	%r11, 0xfffff101, %r11
pmu_2_387:
	nop
	setx 0xfffffeaefffff8c3, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_388:
	nop
	setx 0xfffff734fffff530, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802016  ! 737: WRASI_I	wr	%r0, 0x0016, %asi
	rd %pc, %r19
	add %r19, (ivw_2_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_389:
	.word 0x9ba00168  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_2_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d94000d  ! 741: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0xa7a01a71  ! 744: FqTOi	fqtoi	
mondo_2_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d914010  ! 745: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
tagged_2_392:
	tsubcctv %r15, 0x1fb2, %r14
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x91d02032  ! 747: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 748: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 750: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_2_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91800d  ! 753: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
splash_lsu_2_394:
	setx 0xa42d91765ca4850b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_2_395:
	taddcctv %r4, 0x1ace, %r25
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_2_396:
	tsubcctv %r7, 0x15b4, %r11
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ae072  ! 758: SDIVX_I	sdivx	%r11, 0x0072, %r16
	.word 0x87802063  ! 759: WRASI_I	wr	%r0, 0x0063, %asi
splash_tba_2_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_399:
	setx 0x3c7e89a77c5523a1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe4800b00  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x95a009e3  ! 763: FDIVq	dis not found

debug_2_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_401:
	taddcctv %r20, 0x1c0a, %r18
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_2_402:
	setx 0xa71ae5d7e71e9199, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_403:
	.word 0x8f902001  ! 769: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8780204f  ! 772: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_2_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_2_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d900009  ! 774: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
debug_2_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_2_407:
	setx 0x7af471d55d03446b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_2_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d904003  ! 779: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
intveclr_2_409:
	setx 0x9e92536d4a891c8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022d4  ! 781: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_410:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 783: RDPC	rd	%pc, %r9
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_2_411:
	taddcctv %r5, 0x122f, %r12
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d90330b  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x130b, %pstate
intveclr_2_412:
	setx 0x289255931bf343aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_2_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_413:
	.word 0x8f902001  ! 789: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_2_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_414:
	.word 0x8f902002  ! 791: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa7a04d32  ! 792: FsMULd	fsmuld	%f1, %f18, %f50
splash_tba_2_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 2, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_416:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 797: RDPC	rd	%pc, %r13
	.word 0xe28008a0  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_2_417:
	taddcctv %r7, 0x1d3a, %r10
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
debug_1_0:
	nop
	mov 8, %r18
splash_hpstate_1_1:
	.word 0x81982cc7  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
splash_hpstate_1_2:
	.word 0x81982f16  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f16, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_1_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_3:
	.word 0x8f902001  ! 4: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_1_4:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_1_5:
	setx 0x08690ba9962cf4d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_6:
	setx 0x6d1ea5c753685fc9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_7:
	setx 0x637dbb490728b1a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe28008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01966  ! 11: FqTOd	dis not found

	.word 0xda8804a0  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac00e60  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
splash_hpstate_1_9:
	.word 0x81982abf  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0abf, %hpstate
mondo_1_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92800a  ! 16: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
mondo_1_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d910003  ! 17: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
	.word 0x93d020b2  ! 18: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x87802088  ! 19: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_1_12:
	setx 0x84873e3ab3155ef4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_13:
	setx 0xb7db01686575cb1b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196b  ! 22: FqTOd	dis not found

debug_1_15:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 23: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_1_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_16:
	.word 0x8f902002  ! 25: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01968  ! 27: FqTOd	dis not found

intveclr_1_18:
	setx 0x355eda105754af2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803027  ! 29: SIR	sir	0x1027
	.word 0x91a009d1  ! 30: FDIVd	fdivd	%f0, %f48, %f8
	.word 0x87802010  ! 31: WRASI_I	wr	%r0, 0x0010, %asi
debug_1_19:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_20-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_20:
	.word 0x91a00164  ! 33: FABSq	dis not found

	.word 0x87802089  ! 34: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9f802f2e  ! 35: SIR	sir	0x0f2e
	.word 0x8d903bf0  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x1bf0, %pstate
	.word 0xa1902001  ! 37: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c21c0  ! 38: SDIVX_I	sdivx	%r16, 0x01c0, %r12
splash_tba_1_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_23:
	setx 0x8c50f0a097579b6f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a149c5  ! 41: FDIVd	fdivd	%f36, %f36, %f10
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
donret_1_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_24-donret_1_24), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_1_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 47: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d903e89  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1e89, %pstate
	.word 0x9f803669  ! 49: SIR	sir	0x1669
splash_tba_1_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_27)) -> intp(1,1,3)
xir_1_27:
	.word 0xa9847458  ! 51: WR_SET_SOFTINT_I	wr	%r17, 0x1458, %set_softint
	.word 0xa1902007  ! 52: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02034  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_1_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_28:
	.word 0x8f902001  ! 54: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_1_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 55: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
	rd %pc, %r19
	add %r19, (ivw_1_30-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_30:
	.word 0xa3a00164  ! 57: FABSq	dis not found

splash_tba_1_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_32)) -> intp(6,0,27)
intvec_1_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90335c  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x135c, %pstate
change_to_randtl_1_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_33:
	.word 0x8f902002  ! 61: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8790210f  ! 62: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
tagged_1_34:
	tsubcctv %r11, 0x1ba9, %r17
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802000  ! 64: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_1_35:
	taddcctv %r9, 0x1bae, %r15
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8790225f  ! 66: WRPR_TT_I	wrpr	%r0, 0x025f, %tt
mondo_1_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d918001  ! 67: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	.word 0x91d02035  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x9037d1f4614d4929, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d92c001  ! 70: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
	.word 0x9f803e76  ! 71: SIR	sir	0x1e76
	.word 0x91d020b2  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xad807a1c  ! 73: WR_SOFTINT_REG_I	wr	%r1, 0x1a1c, %softint
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 74: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_1_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_39:
	.word 0x8f902002  ! 75: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_1_40:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa9a08829  ! 78: FADDs	fadds	%f2, %f9, %f20
DS_1_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b14311  ! 79: ALIGNADDRESS	alignaddr	%r5, %r17, %r8
splash_tba_1_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 81: FqTOd	dis not found

	.word 0xa8812898  ! 82: ADDcc_I	addcc 	%r4, 0x0898, %r20
	setx 0x20bcae617c0a9cbb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_46-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_46:
	.word 0x97a00167  ! 84: FABSq	dis not found

intveclr_1_47:
	setx 0xedcbd70c25683263, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 86: FqTOd	dis not found

	.word 0x99902000  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
intveclr_1_49:
	setx 0x1eeddaf9c82b076a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 180
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 90: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 91: FqTOd	dis not found

	.word 0xd0c7e030  ! 92: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xa982c013  ! 93: WR_SET_SOFTINT_R	wr	%r11, %r19, %set_softint
	.word 0xd08008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_1_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_51:
	.word 0x8f902003  ! 95: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0d7e010  ! 96: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_1_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_52-donret_1_52), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_1_53:
	setx 0xe032dc9429b95c75, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_54)) -> intp(3,0,12)
intvec_1_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_55:
	setx 0x90d0ec607b49dd28, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0800c20  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
splash_tba_1_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_57:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 104: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_58:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 105: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_59:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 106: RDPC	rd	%pc, %r12
splash_cmpr_1_60:
	setx 0x86254200fc416abe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d90296d  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x096d, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d004a0  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0xa96a8013  ! 112: SDIVX_R	sdivx	%r10, %r19, %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x3f8f9f4707bf3199, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d918011  ! 115: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
tagged_1_63:
	taddcctv %r13, 0x181c, %r12
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa1902007  ! 118: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	rd %pc, %r19
	add %r19, (ivw_1_64-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_64:
	.word 0x95a00169  ! 119: FABSq	dis not found

	.word 0x87802014  ! 120: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902315  ! 121: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
	.word 0x93902001  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0xa9a483b22d1726e6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_66:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 124: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_1_67:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902002  ! 128: WRPR_GL_I	wrpr	%r0, 0x0002, %-
mondo_1_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 129: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
debug_1_69:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 130: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_1_70:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_1_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_71-donret_1_71), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_72:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 133: RDPC	rd	%pc, %r18
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_1_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f18, %f0
	.word 0x93b4c303  ! 135: ALIGNADDRESS	alignaddr	%r19, %r3, %r9
	.word 0x87802089  ! 136: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xad80671d  ! 137: WR_SOFTINT_REG_I	wr	%r1, 0x071d, %softint
	.word 0x8d9023f5  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x03f5, %pstate
	.word 0x87802088  ! 139: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_1_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad82aa28  ! 141: WR_SOFTINT_REG_I	wr	%r10, 0x0a28, %softint
	.word 0x93902003  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x97a349d1  ! 143: FDIVd	fdivd	%f44, %f48, %f42
mondo_1_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c00a  ! 144: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x93902006  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9190f4ed  ! 147: WRPR_PIL_I	wrpr	%r3, 0x14ed, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0xa5414000  ! 148: RDPC	rd	%pc, %r18
	.word 0x8d903edb  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x1edb, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_77-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_77:
	.word 0xa1a00169  ! 151: FABSq	dis not found

	.word 0x97480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
change_to_randtl_1_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_78:
	.word 0x8f902002  ! 153: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_1_79:
	.word 0x8198218c  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018c, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0x95540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_1_80:
	setx 0xb6c76a9e0990bf2e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d9036b6  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x16b6, %pstate
	.word 0x87802010  ! 161: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_1_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_81:
	.word 0x8f902002  ! 162: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02034  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f8025af  ! 164: SIR	sir	0x05af
	.word 0x9191e943  ! 165: WRPR_PIL_I	wrpr	%r7, 0x0943, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x879022a3  ! 167: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6800b60  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
splash_hpstate_1_82:
	.word 0x8198209d  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009d, %hpstate
change_to_randtl_1_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_83:
	.word 0x8f902002  ! 171: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_1_84:
	.word 0x81982ef5  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ef5, %hpstate
	.word 0xd6800be0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
	rd %pc, %r19
	add %r19, (ivw_1_85-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_85:
	.word 0xa1a00162  ! 174: FABSq	dis not found

	.word 0xa1540000  ! 175: RDPR_GL	rdpr	%-, %r16
	.word 0xa9824011  ! 176: WR_SET_SOFTINT_R	wr	%r9, %r17, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_1_86:
	tsubcctv %r11, 0x10e7, %r15
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_1_87:
	setx 0x8684f625e6d3ce05, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa449c012  ! 180: MULX_R	mulx 	%r7, %r18, %r18
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_88:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 181: RDPC	rd	%pc, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01965  ! 182: FqTOd	dis not found

debug_1_90:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 183: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93902002  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b6663  ! 185: SDIVX_I	sdivx	%r13, 0x0663, %r12
	.word 0x93d02035  ! 186: Tcc_I	tne	icc_or_xcc, %r0 + 53
mondo_1_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d914013  ! 187: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
intveclr_1_93:
	setx 0x2bd93aa66fa2ad21, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_1_94:
	setx 0x413547ff0e8f9451, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9702a5f  ! 191: POPC_I	popc	0x0a5f, %r20
mondo_1_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 192: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
splash_lsu_1_96:
	setx 0xb4f13a1514c495ef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a1c9c2  ! 1: FDIVd	fdivd	%f38, %f2, %f10
	.word 0x91a24834  ! 194: FADDs	fadds	%f9, %f20, %f8
	.word 0x9ba409ca  ! 195: FDIVd	fdivd	%f16, %f10, %f44
splash_cmpr_1_98:
	setx 0x90e1a7faabf23121, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87902263  ! 198: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
splash_hpstate_1_99:
	.word 0x81982fd4  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd4, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_1_100:
	tsubcctv %r14, 0x1f7a, %r23
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e000  ! 204: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
debug_1_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_102:
	setx 0x479dee7c6629c4df, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_103:
	.word 0x8f902002  ! 207: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_1_104:
	setx 0x9d60b66b04d31fbf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_1_105-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_105:
	.word 0xa9a00174  ! 210: FABSq	dis not found

	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 212: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_1_106:
	nop
	setx 0xfffff300fffff655, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802016  ! 214: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x93d020b2  ! 216: Tcc_I	tne	icc_or_xcc, %r0 + 178
debug_1_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_1_108:
	setx 0x02aa1ab566c1d1eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802004  ! 220: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd68008a0  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_1_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9b45c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802004  ! 225: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902006  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_1_110:
	setx 0x9d0a0e7753b3a13d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_111:
	setx 0xf97e136bcf651bf7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_112:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 230: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xda8008a0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac00e80  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
splash_cmpr_1_113:
	setx 0x1a2477db229f729f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d94c009  ! 235: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
splash_lsu_1_115:
	setx 0x2220d291832bd8cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d91c014  ! 237: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	setx 0x348bc74a1bb18a2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_1_118:
	tsubcctv %r22, 0x1865, %r2
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa1902000  ! 240: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8780201c  ! 241: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x92c075ee  ! 242: ADDCcc_I	addccc 	%r1, 0xfffff5ee, %r9
	.word 0x8790204d  ! 243: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
intveclr_1_119:
	setx 0x0ec930f60696db98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80275a  ! 245: SIR	sir	0x075a
	.word 0x8d9029b6  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x09b6, %pstate
splash_cmpr_1_120:
	setx 0x7ff4ec5c6b2a3bf4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_121:
	setx 0xf6605ac4b3c67f06, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 249: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c610d  ! 250: SDIVX_I	sdivx	%r17, 0x010d, %r18
	.word 0x83d020b3  ! 251: Tcc_I	te	icc_or_xcc, %r0 + 179
change_to_randtl_1_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_123:
	.word 0x8f902001  ! 252: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 254: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
tagged_1_125:
	taddcctv %r26, 0x1d7d, %r16
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_1_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81798f56	! Random illegal ?
	.word 0x9ba1c9d4  ! 1: FDIVd	fdivd	%f38, %f20, %f44
	.word 0xa1a4882c  ! 256: FADDs	fadds	%f18, %f12, %f16
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_1_127:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d90232d  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x032d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x97540000  ! 262: RDPR_GL	<illegal instruction>
pmu_1_128:
	nop
	setx 0xfffffa9bfffffae1, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_129:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 264: RDPC	rd	%pc, %r16
	.word 0xa1902008  ! 265: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802004  ! 266: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_1_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90400b  ! 268: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
debug_1_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91942939  ! 270: WRPR_PIL_I	wrpr	%r16, 0x0939, %pil
mondo_1_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d91c00c  ! 271: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
debug_1_133:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe000  ! 274: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x8d903b81  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x1b81, %pstate
splash_hpstate_1_134:
	.word 0x81982686  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0686, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0xaa2e368d889e188d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0x93414000  ! 279: RDPC	rd	%pc, %r9
splash_cmpr_1_137:
	setx 0xb7f881ecbfe615a9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_138:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 281: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xa1902008  ! 282: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe497e030  ! 283: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
splash_cmpr_1_139:
	setx 0xdedf8efccf13de54, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_1_140:
	setx 0xae0a7902197867e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_141:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 287: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_1_142:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x96c231ca  ! 289: ADDCcc_I	addccc 	%r8, 0xfffff1ca, %r11
	.word 0x879020c8  ! 290: WRPR_TT_I	wrpr	%r0, 0x00c8, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe030  ! 292: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r8
mondo_1_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 293: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_144)) -> intp(5,0,2)
intvec_1_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 295: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9f8035e1  ! 296: SIR	sir	0x15e1
	.word 0x93902002  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916939d4  ! 298: SDIVX_I	sdivx	%r4, 0xfffff9d4, %r8
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_1_146:
	setx 0x68e793c369d32cc1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a2c9c5  ! 1: FDIVd	fdivd	%f42, %f36, %f18
	normalw
	.word 0x95458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
	rd %pc, %r19
	add %r19, (ivw_1_148-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_148:
	.word 0x95a00164  ! 303: FABSq	dis not found

	.word 0xd4880e80  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0x92dc4011  ! 305: SMULcc_R	smulcc 	%r17, %r17, %r9
splash_cmpr_1_149:
	setx 0x371bc93beb764806, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0xa7a10d2d  ! 308: FsMULd	fsmuld	%f4, %f44, %f50
debug_1_150:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 309: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x93902007  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_1_151:
	taddcctv %r16, 0x17b8, %r1
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac804a0  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6872a5  ! 313: SDIVX_I	sdivx	%r1, 0xfffff2a5, %r13
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_153)) -> intp(1,1,3)
xir_1_153:
	.word 0xa9843e92  ! 314: WR_SET_SOFTINT_I	wr	%r16, 0x1e92, %set_softint
splash_hpstate_1_154:
	.word 0x81982a55  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
splash_tba_1_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93703bc0  ! 318: POPC_I	popc	0x1bc0, %r9
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0x99414000  ! 320: RDPC	rd	%pc, %r12
	setx 0x88c4df41e14f0e9f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90349a  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x149a, %pstate
	.word 0xa9814007  ! 323: WR_SET_SOFTINT_R	wr	%r5, %r7, %set_softint
intveclr_1_158:
	setx 0x6c1a311b430d7736, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x4c293471b8de6e52, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90375b  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x175b, %pstate
change_to_randtl_1_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_160:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76d2cf3  ! 328: SDIVX_I	sdivx	%r20, 0x0cf3, %r19
	.word 0xa190200f  ! 329: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_1_162:
	setx 0x89a357e80da5e7ab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_163:
	setx 0xd31e42af14b2bdca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_164:
	setx 0x21fd9f7dd7ef6288, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a089c0  ! 1: FDIVd	fdivd	%f2, %f0, %f16
	.word 0xa9a00552  ! 1: FSQRTd	fsqrt	
	.word 0x91a3082b  ! 333: FADDs	fadds	%f12, %f11, %f8
pmu_1_166:
	nop
	setx 0xfffff01bfffffd78, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01962  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_1_168:
	setx 0x6cd404dfc4c9f282, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_1_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a00553  ! 1: FSQRTd	fsqrt	
	.word 0x95a1c833  ! 339: FADDs	fadds	%f7, %f19, %f10
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_1_170:
	setx 0x37c5eaaf417b00be, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 342: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
splash_cmpr_1_172:
	setx 0x8b8e873aca5b462b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d904006  ! 344: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0x87902006  ! 345: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
splash_hpstate_1_174:
	.word 0x819820a7  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00a7, %hpstate
	.word 0x9345c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x93540000  ! 348: RDPR_GL	<illegal instruction>
	.word 0xda880e80  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
splash_cmpr_1_175:
	setx 0x0f0b104c35d89dd9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022ce  ! 351: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
	rd %pc, %r19
	add %r19, (ivw_1_176-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_176:
	.word 0xa9a00174  ! 352: FABSq	dis not found

	.word 0x91a000c7  ! 353: FNEGd	fnegd	%f38, %f8
splash_hpstate_1_177:
	.word 0x819826bc  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06bc, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_1_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d93400b  ! 356: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
tagged_1_179:
	taddcctv %r5, 0x1f83, %r14
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab84c002  ! 358: WR_CLEAR_SOFTINT_R	wr	%r19, %r2, %clear_softint
	.word 0xa190200d  ! 359: WRPR_GL_I	wrpr	%r0, 0x000d, %-
pmu_1_180:
	nop
	setx 0xfffff82efffff91d, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_1_181:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7a349c8  ! 364: FDIVd	fdivd	%f44, %f8, %f50
mondo_1_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c002  ! 365: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
debug_1_184:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa3a309d2  ! 367: FDIVd	fdivd	%f12, %f18, %f48
debug_1_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e000  ! 370: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4c004a0  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902002  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_1_186:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_187:
	setx 0xd898f7b901b5d794, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d004a0  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
debug_1_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_189:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 377: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x87902375  ! 378: WRPR_TT_I	wrpr	%r0, 0x0375, %tt
splash_cmpr_1_190:
	setx 0xd02a861e6d3cc020, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902006  ! 380: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_1_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 382: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_192-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_192:
	.word 0xa5a00171  ! 383: FABSq	dis not found

	.word 0x83d02035  ! 384: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_tba_1_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_1_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_1_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d904011  ! 387: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_196)) -> intp(1,1,3)
xir_1_196:
	.word 0xa981a17a  ! 388: WR_SET_SOFTINT_I	wr	%r6, 0x017a, %set_softint
debug_1_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_198)) -> intp(1,1,3)
xir_1_198:
	.word 0xa9826313  ! 390: WR_SET_SOFTINT_I	wr	%r9, 0x0313, %set_softint
	.word 0x87802063  ! 391: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xad82ff4a  ! 392: WR_SOFTINT_REG_I	wr	%r11, 0x1f4a, %softint
splash_cmpr_1_199:
	setx 0x9a09b57da25c121d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_200)) -> intp(0,0,21)
intvec_1_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_201:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02032  ! 396: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_randtl_1_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_1_203:
	taddcctv %r15, 0x15f4, %r21
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x8790209b  ! 399: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
splash_lsu_1_204:
	setx 0x64101a07a6d2e8cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 401: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
splash_hpstate_1_206:
	.word 0x8198215d  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a6abd  ! 403: SDIVX_I	sdivx	%r9, 0x0abd, %r19
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x91d02035  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_1_208:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902017  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x0017, %pstate
mondo_1_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d904005  ! 408: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
splash_hpstate_1_210:
	.word 0x81982cb6  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cb6, %hpstate
DS_1_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a00551  ! 1: FSQRTd	fsqrt	
	.word 0x99a50834  ! 410: FADDs	fadds	%f20, %f20, %f12
splash_cmpr_1_212:
	setx 0xbc47c7cee6866e72, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_1_213:
	taddcctv %r13, 0x1120, %r17
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_1_214:
	.word 0xa9a509c8  ! 1: FDIVd	fdivd	%f20, %f8, %f20
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_1_215:
	setx 0x1fd593a5760cca15, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90400c  ! 418: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
splash_tba_1_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803094  ! 420: SIR	sir	0x1094
splash_lsu_1_218:
	setx 0x98c47360cf4a35ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_219:
	.word 0x81982297  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0297, %hpstate
	rd %pc, %r19
	add %r19, (ivw_1_220-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_220:
	.word 0x99a0016a  ! 423: FABSq	dis not found

	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 424: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_1_221:
	taddcctv %r15, 0x1e5a, %r20
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_1_222:
	.word 0x91a249c4  ! 1: FDIVd	fdivd	%f40, %f4, %f8
	allclean
	.word 0xa5b4c30b  ! 426: ALIGNADDRESS	alignaddr	%r19, %r11, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_1_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_223:
	.word 0x8f902002  ! 428: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99902003  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_tba_1_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8780201c  ! 432: WRASI_I	wr	%r0, 0x001c, %asi
pmu_1_225:
	nop
	setx 0xfffff590ffffff2b, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_1_226:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d940003  ! 436: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36a6c1a  ! 437: SDIVX_I	sdivx	%r9, 0x0c1a, %r17
splash_hpstate_1_229:
	.word 0x81982057  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	.word 0x8790217f  ! 439: WRPR_TT_I	wrpr	%r0, 0x017f, %tt
splash_htba_1_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_1_231:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 442: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
tagged_1_232:
	tsubcctv %r26, 0x18de, %r2
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_1_233:
	setx 0x9de023734b72819d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	rd %pc, %r19
	add %r19, (ivw_1_234-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_234:
	.word 0xa1a00170  ! 446: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_1_235-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_235:
	.word 0xa1a00162  ! 447: FABSq	dis not found

mondo_1_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 448: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xa784ad67  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x0d67, %-
splash_tba_1_237:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_238:
	setx 0x8fb2b4a796f82bfa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_239:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 453: RDPC	rd	%pc, %r16
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_1_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad81f79d  ! 457: WR_SOFTINT_REG_I	wr	%r7, 0x179d, %softint
mondo_1_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c000  ! 458: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
	.word 0x99902003  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87802010  ! 460: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93a449ac  ! 461: FDIVs	fdivs	%f17, %f12, %f9
mondo_1_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 462: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_243:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 463: RDPC	rd	%pc, %r11
	.word 0x8d903a13  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x1a13, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_1_244:
	setx 0x2d2678fe7fe55261, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_1_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_1_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d90400b  ! 470: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
	.word 0x87902331  ! 471: WRPR_TT_I	wrpr	%r0, 0x0331, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0x7ff99b71d5b5df9e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_248:
	setx 0xbb823d166dd377e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802063  ! 475: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_250)) -> intp(1,0,1)
intvec_1_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_251:
	.word 0x97a0c9d2  ! 1: FDIVd	fdivd	%f34, %f18, %f42
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d020b5  ! 479: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x34700001  ! 480: BPG	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_1_252-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_252:
	.word 0xa3a00162  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0xa9414000  ! 482: RDPC	rd	%pc, %r20
splash_hpstate_1_254:
	.word 0x8198219c  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
intveclr_1_255:
	setx 0x48d2a1ef397f576a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_256:
	setx 0x8decfdbdb952a5de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab840001  ! 486: WR_CLEAR_SOFTINT_R	wr	%r16, %r1, %clear_softint
	.word 0x8d802004  ! 487: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_1_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_1_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_1_259:
	setx 0xeb09f8b7c2775308, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_1_260:
	.word 0x819828cd  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_1_261:
	setx 0x9b57eb0e0dc3a147, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_262:
	.word 0xa3a089c5  ! 1: FDIVd	fdivd	%f2, %f36, %f48
	.word 0xa36d3c84	! Random illegal ?
	.word 0xa5a00552  ! 1: FSQRTd	fsqrt	
	.word 0x9ba4c830  ! 495: FADDs	fadds	%f19, %f16, %f13
	.word 0x91d020b3  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r10
splash_hpstate_1_264:
	.word 0x81982ba7  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ba7, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a6e3c  ! 501: SDIVX_I	sdivx	%r9, 0x0e3c, %r10
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_1_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802089  ! 504: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd2800b80  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
mondo_1_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 506: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xa545c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x94f94007  ! 508: SDIVcc_R	sdivcc 	%r5, %r7, %r10
	.word 0x8d902e53  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x0e53, %pstate
splash_cmpr_1_268:
	setx 0xfddfaf734436721c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 511: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902001  ! 512: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_1_269:
	setx 0xd5e1e639783014b2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_270:
	tsubcctv %r18, 0x19d2, %r13
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_1_271:
	setx 0xbc69aa48826d51a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0xed96d41de249da3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
	rd %pc, %r19
	add %r19, (ivw_1_274-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_274:
	.word 0xa1a0016c  ! 520: FABSq	dis not found

mondo_1_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 521: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
tagged_1_276:
	tsubcctv %r25, 0x1e95, %r10
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_277:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 523: RDPC	rd	%pc, %r12
DS_1_278:
	.word 0x95a349d0  ! 1: FDIVd	fdivd	%f44, %f16, %f10
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_1_279:
	setx 0xf5aa5f5a75a37bd9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad80e40  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x72, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91683b53  ! 528: SDIVX_I	sdivx	%r0, 0xfffffb53, %r8
mondo_1_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d934014  ! 529: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0xdad7e020  ! 530: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d903bf2  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x1bf2, %pstate
splash_cmpr_1_282:
	setx 0x88f7715532ce1a45, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_hpstate_1_284:
	.word 0x8198238c  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038c, %hpstate
debug_1_285:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 536: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_286:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 537: RDPC	rd	%pc, %r8
	setx 0x1e3383d517374ac5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa984000a  ! 539: WR_SET_SOFTINT_R	wr	%r16, %r10, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_288:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 540: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0900e60  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
splash_lsu_1_289:
	setx 0xa47cb98cd0da28c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 544: WRASI_I	wr	%r0, 0x0088, %asi
	rd %pc, %r19
	add %r19, (ivw_1_290-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_290:
	.word 0x91a00163  ! 545: FABSq	dis not found

mondo_1_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 546: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
donret_1_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_292-donret_1_292), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_293:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 548: RDPC	rd	%pc, %r13
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_294:
	setx 0xb82ea2b82a05d683, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d914013  ! 551: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
tagged_1_296:
	tsubcctv %r12, 0x183e, %r24
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_1_297:
	setx 0x79e3906ec27059d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90344e  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x144e, %pstate
	.word 0xdac00e40  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
splash_lsu_1_298:
	setx 0xba06dc2988860e2f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 557: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 558: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02033  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_1_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa8da0006  ! 561: SMULcc_R	smulcc 	%r8, %r6, %r20
DS_1_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1328014  ! 1: STQF_R	-	%f8, [%r20, %r10]
	normalw
	.word 0x97458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6800ac0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
	.word 0x91464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r8
DS_1_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1312c44  ! 1: STQF_I	-	%f8, [0x0c44, %r4]
	normalw
	.word 0xa5458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9684744e  ! 568: ADDcc_I	addcc 	%r17, 0xfffff44e, %r11
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d90304d  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x104d, %pstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 571: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_1_302:
	tsubcctv %r3, 0x17d0, %r6
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d3e15  ! 573: SDIVX_I	sdivx	%r20, 0xfffffe15, %r12
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802063  ! 575: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa3540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_1_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_304:
	.word 0x8f902001  ! 577: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_1_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d908008  ! 579: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
	rd %pc, %r19
	add %r19, (ivw_1_306-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_306:
	.word 0x91a00172  ! 581: FABSq	dis not found

pmu_1_307:
	nop
	setx 0xfffff2c5fffffd66, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_308-donret_1_308), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_1_309:
	setx 0xf88c180ba6782d50, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_310:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a289d4  ! 586: FDIVd	fdivd	%f10, %f20, %f12
	.word 0x8d90313e  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x113e, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 588: RDPC	rd	%pc, %r18
splash_hpstate_1_312:
	.word 0x81982f25  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f25, %hpstate
	.word 0x91d02034  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_1_313:
	setx 0x3d39a5523cb321bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_1_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_1_315:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 593: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_1_316:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_1_317:
	setx 0x5a4c4e7c0f9be444, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903ed5  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x1ed5, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe010  ! 602: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9b464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x87802080  ! 605: WRASI_I	wr	%r0, 0x0080, %asi
tagged_1_318:
	tsubcctv %r13, 0x1b55, %r18
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_1_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 607: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
mondo_1_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d91000c  ! 608: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36cfb01  ! 609: SDIVX_I	sdivx	%r19, 0xfffffb01, %r17
debug_1_322:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_323:
	taddcctv %r19, 0x1de9, %r5
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_1_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950001  ! 612: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x93902006  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_1_325:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_326-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_326:
	.word 0x95a0016a  ! 615: FABSq	dis not found

DS_1_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802016  ! 617: WRASI_I	wr	%r0, 0x0016, %asi
splash_htba_1_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0xa7500000  ! 620: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d90c00c  ! 622: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
mondo_1_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 623: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
debug_1_331:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902bbf  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x0bbf, %pstate
	.word 0xa76a0002  ! 626: SDIVX_R	sdivx	%r8, %r2, %r19
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_332:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 627: RDPC	rd	%pc, %r13
pmu_1_333:
	nop
	setx 0xfffff32cfffff7f0, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8790219c  ! 631: WRPR_TT_I	wrpr	%r0, 0x019c, %tt
	.word 0x8d9034bf  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x14bf, %pstate
	.word 0xab82c012  ! 633: WR_CLEAR_SOFTINT_R	wr	%r11, %r18, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_1_334:
	setx 0xf2661c7f7104fff0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1520000  ! 637: RDPR_PIL	<illegal instruction>
DS_1_335:
	.word 0xa3a4c9c2  ! 1: FDIVd	fdivd	%f50, %f2, %f48
	pdist %f28, %f18, %f2
	.word 0x93b04303  ! 638: ALIGNADDRESS	alignaddr	%r1, %r3, %r9
	.word 0xd8880e40  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
	.word 0x99902003  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_1_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d900011  ! 641: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	setx 0xfe0fd5d8158b5dc4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_338-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_338:
	.word 0xa3a00167  ! 643: FABSq	dis not found

mondo_1_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d94400a  ! 644: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
mondo_1_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d924000  ! 645: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
debug_1_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_342:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02035  ! 648: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_tba_1_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_1_344:
	.word 0x8198235e  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035e, %hpstate
splash_tba_1_345:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_346:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab84c012  ! 653: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
	.word 0xa1902007  ! 654: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_1_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_1_348:
	nop
	setx 0xfffff8acfffff0c5, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_1_349:
	setx 0x0f8b5d0818562769, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_350:
	setx 0x18da2c8c3998d345, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_351:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 661: RDPC	rd	%pc, %r16
mondo_1_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d92400a  ! 662: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x8d903cf1  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x1cf1, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c2665  ! 664: SDIVX_I	sdivx	%r16, 0x0665, %r10
	.word 0x93a409c2  ! 665: FDIVd	fdivd	%f16, %f2, %f40
	.word 0x8790206a  ! 666: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
change_to_randtl_1_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_354:
	.word 0x8f902000  ! 667: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_1_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b4  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902006  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_1_356:
	setx 0x01363b84979fcb1a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_357:
	taddcctv %r15, 0x12aa, %r7
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902005  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xdadfe010  ! 676: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x87802014  ! 677: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_1_358:
	setx 0x7634e751274becb4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780201c  ! 679: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_1_359:
	.word 0x81982606  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
debug_1_360:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 682: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93902003  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa7540000  ! 684: RDPR_GL	rdpr	%-, %r19
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_361:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 685: RDPC	rd	%pc, %r20
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_1_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_1_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_364:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 689: RDPC	rd	%pc, %r16
change_to_randtl_1_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_365:
	.word 0x8f902000  ! 690: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x91a449b4  ! 692: FDIVs	fdivs	%f17, %f20, %f8
splash_cmpr_1_366:
	setx 0x1ce36f4dd87e813f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe010  ! 696: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
intveclr_1_367:
	setx 0x8ee925e216c64e03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_368:
	.word 0x81982695  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0695, %hpstate
	.word 0x8d9026a5  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x06a5, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e030  ! 701: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
splash_tba_1_369:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_370:
	setx 0xef87d9b92461e0cf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_371:
	.word 0x8f902003  ! 706: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa3454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xa1902007  ! 708: WRPR_GL_I	wrpr	%r0, 0x0007, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_1_372)) -> intp(6,0,29)
intvec_1_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_1_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_373:
	.word 0x8f902000  ! 711: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_1_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d93400a  ! 712: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
splash_hpstate_1_375:
	.word 0x81982d5e  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
splash_cmpr_1_376:
	setx 0x1fb629ecf4c81be4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 715: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_1_377:
	setx 0xd7c1b551e3dff5b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_1_378)) -> intp(1,1,3)
xir_1_378:
	.word 0xa98139c0  ! 717: WR_SET_SOFTINT_I	wr	%r4, 0x19c0, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01965  ! 718: FqTOd	dis not found

intveclr_1_380:
	setx 0x4c590fbf20752659, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xa1520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01966  ! 723: FqTOd	dis not found

splash_htba_1_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x2ac5a8f7cacfdfe3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_1_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d94c004  ! 727: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
intveclr_1_385:
	setx 0x6740dd6913c0cc76, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_1_386:
	setx 0x34a06424294ea77d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 731: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790222d  ! 732: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0x9afa6148  ! 734: SDIVcc_I	sdivcc 	%r9, 0x0148, %r13
pmu_1_387:
	nop
	setx 0xfffff81afffff803, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_388:
	nop
	setx 0xfffff50efffff784, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802089  ! 737: WRASI_I	wr	%r0, 0x0089, %asi
	rd %pc, %r19
	add %r19, (ivw_1_389-.+4), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_389:
	.word 0x99a00164  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_1_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d920009  ! 741: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x97a01a63  ! 744: FqTOi	fqtoi	
mondo_1_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d93400d  ! 745: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
tagged_1_392:
	tsubcctv %r15, 0x1966, %r9
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x83d02034  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 748: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2800aa0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_1_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 753: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
splash_lsu_1_394:
	setx 0x76603842090dd92f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_1_395:
	taddcctv %r13, 0x1ffe, %r12
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_1_396:
	tsubcctv %r7, 0x1eb1, %r20
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c68b6  ! 758: SDIVX_I	sdivx	%r17, 0x08b6, %r8
	.word 0x87802016  ! 759: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_1_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_399:
	setx 0x4bb62a997d2f9d97, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe48008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa9a509ea  ! 763: FDIVq	dis not found

debug_1_400:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_401:
	taddcctv %r14, 0x1120, %r13
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_1_402:
	setx 0xbadc4932c04f1e51, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_403:
	.word 0x8f902002  ! 769: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8780204f  ! 772: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_1_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_1_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d91c008  ! 774: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
debug_1_406:
	nop
	rd %pc, %r19
	add %r19, 64, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_1_407:
	setx 0x3a91ba8c30965d81, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_1_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d924012  ! 779: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
intveclr_1_409:
	setx 0x6f4db5ce1453ec27, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020d4  ! 781: WRPR_TT_I	wrpr	%r0, 0x00d4, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_410:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 783: RDPC	rd	%pc, %r10
	.word 0xd68008a0  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
tagged_1_411:
	taddcctv %r9, 0x1651, %r12
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d903174  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x1174, %pstate
intveclr_1_412:
	setx 0x9127a7d06ae89329, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_1_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_413:
	.word 0x8f902000  ! 789: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_1_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_414:
	.word 0x8f902000  ! 791: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9a44d27  ! 792: FsMULd	fsmuld	%f17, %f38, %f20
splash_tba_1_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_416:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 797: RDPC	rd	%pc, %r9
	.word 0xe2800c40  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
tagged_1_417:
	taddcctv %r7, 0x1f46, %r8
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
debug_0_0:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_0:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_0
    nop
debug_wait0_0:
    ld [%r23], %r2
    brnz %r2, debug_wait0_0
    nop
    ba,a debug_startwait0_0
continue_debug_0_0:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_0:
    cmp %r13, %r15
    bne,a wait_for_stat_0_0
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_0:
    cmp %r14, %r15
    bne,a wait_for_debug_0_0
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
splash_hpstate_0_1:
	.word 0x81982b1f  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1f, %hpstate
splash_hpstate_0_2:
	.word 0x81982d85  ! 2: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
	.word 0xe28008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_0_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_3:
	.word 0x8f902003  ! 4: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_4:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_5:
	setx 0x8a31cc610b72d783, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_6:
	setx 0xbf863fc742572025, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_7:
	setx 0xb90db7e02c0f496b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 8: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe2800c00  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01961  ! 11: FqTOd	dis not found

	.word 0xda880e80  ! 12: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 14: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_hpstate_0_9:
	.word 0x81982507  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
mondo_0_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 16: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
mondo_0_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d908014  ! 17: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0x91d020b5  ! 18: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802020  ! 19: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_0_12:
	setx 0xb468d25694d3a87b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 20: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_13:
	setx 0x87c4b3e9c01adc4b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 22: FqTOd	dis not found

debug_0_15:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_15:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_15
    nop
debug_wait0_15:
    ld [%r23], %r2
    brnz %r2, debug_wait0_15
    nop
    ba,a debug_startwait0_15
continue_debug_0_15:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_15:
    cmp %r13, %r15
    bne,a wait_for_stat_0_15
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_15:
    cmp %r14, %r15
    bne,a wait_for_debug_0_15
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 23: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xd48008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_0_16:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_16:
	.word 0x8f902002  ! 25: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 27: FqTOd	dis not found

intveclr_0_18:
	setx 0xaed7176f818cfbc8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80242e  ! 29: SIR	sir	0x042e
	.word 0xa7a4c9d2  ! 30: FDIVd	fdivd	%f50, %f18, %f50
	.word 0x87802016  ! 31: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_19:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_20:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_20:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_20
    nop
cmp_wait0_20:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_20
    nop
    ba,a cmp_startwait0_20
continue_cmp_0_20:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x94, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00166  ! 33: FABSq	dis not found

	.word 0x87802004  ! 34: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f8032cb  ! 35: SIR	sir	0x12cb
	.word 0x8d902005  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x0005, %pstate
	.word 0xa1902001  ! 37: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b6a6e  ! 38: SDIVX_I	sdivx	%r13, 0x0a6e, %r9
splash_tba_0_22:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_23:
	setx 0xed8ab4555dfd4921, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a449c4  ! 41: FDIVd	fdivd	%f48, %f4, %f12
	.word 0xd93fc000  ! 42: STDF_R	std	%f12, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 43: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
donret_0_24:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_24-donret_0_24), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_24:
	.word 0xd8ffea6e  ! 45: SWAPA_I	swapa	%r12, [%r31 + 0x0a6e] %asi
DS_0_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 46: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902000  ! 47: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d903278  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1278, %pstate
	.word 0x9f8024f3  ! 49: SIR	sir	0x04f3
splash_tba_0_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 50: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_27)) -> intp(0,1,3)
xir_0_27:
	.word 0xa98477ba  ! 51: WR_SET_SOFTINT_I	wr	%r17, 0x17ba, %set_softint
	.word 0xa1902009  ! 52: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d020b5  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 181
change_to_randtl_0_28:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_28:
	.word 0x8f902002  ! 54: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_0_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c004  ! 55: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0xd937c000  ! 56: STQF_R	-	%f12, [%r0, %r31]
cmp_0_30:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_30:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_30
    nop
cmp_wait0_30:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_30
    nop
    ba,a cmp_startwait0_30
continue_cmp_0_30:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 28, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00170  ! 57: FABSq	dis not found

splash_tba_0_31:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_32)) -> intp(5,0,10)
intvec_0_32:
	.word 0x39400001  ! 59: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90322e  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x122e, %pstate
change_to_randtl_0_33:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_33:
	.word 0x8f902000  ! 61: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8790231a  ! 62: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
tagged_0_34:
	tsubcctv %r26, 0x1175, %r20
	.word 0xda07f7ba  ! 63: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x8d802004  ! 64: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_0_35:
	taddcctv %r19, 0x1319, %r24
	.word 0xda07f7ba  ! 65: LDUW_I	lduw	[%r31 + 0xfffff7ba], %r13
	.word 0x87902375  ! 66: WRPR_TT_I	wrpr	%r0, 0x0375, %tt
mondo_0_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d928007  ! 67: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	.word 0x91d02032  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 50
	setx 0xd019d6ccf0de6990, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_37:
	.word 0x39400001  ! 69: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918001  ! 70: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	.word 0x9f8026f3  ! 71: SIR	sir	0x06f3
	.word 0x91d02034  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xad816cd2  ! 73: WR_SOFTINT_REG_I	wr	%r5, 0x0cd2, %softint
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_0_39:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_39:
	.word 0x8f902000  ! 75: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda0fc000  ! 76: LDUB_R	ldub	[%r31 + %r0], %r13
debug_0_40:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 77: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_41:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba00543  ! 1: FSQRTd	fsqrt	
	.word 0xa7a30826  ! 78: FADDs	fadds	%f12, %f6, %f19
DS_0_42:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b18306  ! 79: ALIGNADDRESS	alignaddr	%r6, %r6, %r18
splash_tba_0_43:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 80: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01965  ! 81: FqTOd	dis not found

	.word 0xa082677d  ! 82: ADDcc_I	addcc 	%r9, 0x077d, %r16
	setx 0x662e1797b6d5925a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_45:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_0_46:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_46:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_46
    nop
cmp_wait0_46:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_46
    nop
    ba,a cmp_startwait0_46
continue_cmp_0_46:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xd8, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00172  ! 84: FABSq	dis not found

intveclr_0_47:
	setx 0x710be3d33c270c0f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01966  ! 86: FqTOd	dis not found

	.word 0x99902004  ! 87: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_0_49:
	setx 0x17327dd3419f2c79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 90: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01965  ! 91: FqTOd	dis not found

	.word 0xd0c7e030  ! 92: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xa982000b  ! 93: WR_SET_SOFTINT_R	wr	%r8, %r11, %set_softint
	.word 0xd0800b00  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
change_to_randtl_0_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_51:
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0d7e030  ! 96: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 97: LDX_R	ldx	[%r31 + %r0], %r8
donret_0_52:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_52-donret_0_52), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_52:
	.word 0xd0ffe77d  ! 98: SWAPA_I	swapa	%r8, [%r31 + 0x077d] %asi
splash_cmpr_0_53:
	setx 0xb670ed9163485038, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(5,0,11)
intvec_0_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_55:
	setx 0x6bbe2bad24366662, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0800c00  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
splash_tba_0_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_57:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_57:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_57
    nop
debug_wait0_57:
    ld [%r23], %r2
    brnz %r2, debug_wait0_57
    nop
    ba,a debug_startwait0_57
continue_debug_0_57:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_57:
    cmp %r13, %r15
    bne,a wait_for_stat_0_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_57:
    cmp %r14, %r15
    bne,a wait_for_debug_0_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00852  ! 104: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_58
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_58:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 105: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_59:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 106: RDPC	rd	%pc, %r20
splash_cmpr_0_60:
	setx 0xf94a94af6c746d07, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe86fe77d  ! 108: LDSTUB_I	ldstub	%r20, [%r31 + 0x077d]
	.word 0x8d90236b  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x036b, %pstate
	.word 0x81510000  ! 110: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe8d00e60  ! 111: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r20
	.word 0x976c0003  ! 112: SDIVX_R	sdivx	%r16, %r3, %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xb165d753a6982213, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_61:
	.word 0x39400001  ! 114: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 115: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
tagged_0_63:
	taddcctv %r2, 0x10ba, %r22
	.word 0xd607e77d  ! 116: LDUW_I	lduw	[%r31 + 0x077d], %r11
	.word 0xd637e77d  ! 117: STH_I	sth	%r11, [%r31 + 0x077d]
	.word 0xa1902001  ! 118: WRPR_GL_I	wrpr	%r0, 0x0001, %-
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
    and %r14, 0x72, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00160  ! 119: FABSq	dis not found

	.word 0x87802014  ! 120: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879021c0  ! 121: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
	.word 0x93902001  ! 122: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0xb03d0244f99884cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_65:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_66:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_66:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_66
    nop
debug_wait0_66:
    ld [%r23], %r2
    brnz %r2, debug_wait0_66
    nop
    ba,a debug_startwait0_66
continue_debug_0_66:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_66:
    cmp %r13, %r15
    bne,a wait_for_stat_0_66
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_66:
    cmp %r14, %r15
    bne,a wait_for_debug_0_66
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
debug_0_67:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902009  ! 128: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d92c010  ! 129: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
debug_0_69:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_69:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_69
    nop
debug_wait0_69:
    ld [%r23], %r2
    brnz %r2, debug_wait0_69
    nop
    ba,a debug_startwait0_69
continue_debug_0_69:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_69:
    cmp %r13, %r15
    bne,a wait_for_stat_0_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_69:
    cmp %r14, %r15
    bne,a wait_for_debug_0_69
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 130: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_0_70:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 131: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
donret_0_71:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_71-donret_0_71), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_71:
	.word 0xdaffe77d  ! 132: SWAPA_I	swapa	%r13, [%r31 + 0x077d] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_72
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_72
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_72:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 133: RDPC	rd	%pc, %r16
	.word 0x26700001  ! 134: BPL	<illegal instruction>
DS_0_73:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f10, %f0
	.word 0x9bb4c304  ! 135: ALIGNADDRESS	alignaddr	%r19, %r4, %r13
	.word 0x87802080  ! 136: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xad84336c  ! 137: WR_SOFTINT_REG_I	wr	%r16, 0x136c, %softint
	.word 0x8d9020a6  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x00a6, %pstate
	.word 0x87802089  ! 139: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_0_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad8266bd  ! 141: WR_SOFTINT_REG_I	wr	%r9, 0x06bd, %softint
	.word 0x93902000  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa7a1c9c8  ! 143: FDIVd	fdivd	%f38, %f8, %f50
mondo_0_75:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d91c003  ! 144: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x93902003  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe7e7c023  ! 146: CASA_I	casa	[%r31] 0x 1, %r3, %r19
	.word 0x9194f2e9  ! 147: WRPR_PIL_I	wrpr	%r19, 0x12e9, %pil
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0xa1414000  ! 148: RDPC	rd	%pc, %r16
	.word 0x8d903378  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x1378, %pstate
	.word 0x36800001  ! 150: BGE	bge,a	<label_0x1>
cmp_0_77:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_77:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_77
    nop
cmp_wait0_77:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_77
    nop
    ba,a cmp_startwait0_77
continue_cmp_0_77:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x8c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00160  ! 151: FABSq	dis not found

	.word 0x99480000  ! 152: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
change_to_randtl_0_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_78:
	.word 0x8f902001  ! 153: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_0_79:
	.word 0x81982f94  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f94, %hpstate
	.word 0x2c700001  ! 156: BPNEG	<illegal instruction>
	.word 0x97540000  ! 157: RDPR_GL	<illegal instruction>
splash_cmpr_0_80:
	setx 0xa954bb4d5dfdf20e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 158: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd73fc000  ! 159: STDF_R	std	%f11, [%r0, %r31]
	.word 0x8d903cc6  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x1cc6, %pstate
	.word 0x87802016  ! 161: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_0_81:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_81:
	.word 0x8f902000  ! 162: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93d02033  ! 163: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9f802f2a  ! 164: SIR	sir	0x0f2a
	.word 0x9190f6eb  ! 165: WRPR_PIL_I	wrpr	%r3, 0x16eb, %pil
	.word 0xd717c000  ! 166: LDQF_R	-	[%r31, %r0], %f11
	.word 0x879021ee  ! 167: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6800c60  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
splash_hpstate_0_82:
	.word 0x819828c4  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c4, %hpstate
change_to_randtl_0_83:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_83:
	.word 0x8f902002  ! 171: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_0_84:
	.word 0x81982697  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0xd68008a0  ! 173: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
cmp_0_85:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_85:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_85
    nop
cmp_wait0_85:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_85
    nop
    ba,a cmp_startwait0_85
continue_cmp_0_85:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00172  ! 174: FABSq	dis not found

	.word 0x97540000  ! 175: RDPR_GL	rdpr	%-, %r11
	.word 0xa9834003  ! 176: WR_SET_SOFTINT_R	wr	%r13, %r3, %set_softint
	.word 0x24700001  ! 177: BPLE	<illegal instruction>
tagged_0_86:
	tsubcctv %r24, 0x183d, %r15
	.word 0xd607f6eb  ! 178: LDUW_I	lduw	[%r31 + 0xfffff6eb], %r11
intveclr_0_87:
	setx 0xf4d4e6d186892ecf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x904a8002  ! 180: MULX_R	mulx 	%r10, %r2, %r8
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_88
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_88:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 181: RDPC	rd	%pc, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 182: FqTOd	dis not found

debug_0_90:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_90:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_90
    nop
debug_wait0_90:
    ld [%r23], %r2
    brnz %r2, debug_wait0_90
    nop
    ba,a debug_startwait0_90
continue_debug_0_90:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_90:
    cmp %r13, %r15
    bne,a wait_for_stat_0_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_90:
    cmp %r14, %r15
    bne,a wait_for_debug_0_90
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 183: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x93902002  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c2be7  ! 185: SDIVX_I	sdivx	%r16, 0x0be7, %r12
	.word 0x93d020b5  ! 186: Tcc_I	tne	icc_or_xcc, %r0 + 181
mondo_0_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d950000  ! 187: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
intveclr_0_93:
	setx 0x65e640ee0e6d0d00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b500000  ! 189: RDPR_TPC	<illegal instruction>
splash_lsu_0_94:
	setx 0x0704340e0cbcf105, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa170340c  ! 191: POPC_I	popc	0x140c, %r16
mondo_0_95:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c000  ! 192: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
splash_lsu_0_96:
	setx 0xd100e4da459f8107, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f44
	.word 0x9ba0882c  ! 194: FADDs	fadds	%f2, %f12, %f13
	.word 0x99a489c3  ! 195: FDIVd	fdivd	%f18, %f34, %f12
splash_cmpr_0_98:
	setx 0xdca8f9271281db25, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 197: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x879020af  ! 198: WRPR_TT_I	wrpr	%r0, 0x00af, %tt
splash_hpstate_0_99:
	.word 0x81982b3c  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b3c, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 200: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd937f40c  ! 201: STQF_I	-	%f12, [0x140c, %r31]
	.word 0x3c700001  ! 202: BPPOS	<illegal instruction>
tagged_0_100:
	tsubcctv %r16, 0x1062, %r6
	.word 0xd807f40c  ! 203: LDUW_I	lduw	[%r31 + 0xfffff40c], %r12
	.word 0xd8d7e010  ! 204: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
debug_0_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 205: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_102:
	setx 0x3baaf3695beaac13, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 206: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_103:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_103:
	.word 0x8f902001  ! 207: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_0_104:
	setx 0x442eaaba780f2651, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 208: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
cmp_0_105:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_105:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_105
    nop
cmp_wait0_105:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_105
    nop
    ba,a cmp_startwait0_105
continue_cmp_0_105:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xec, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00169  ! 210: FABSq	dis not found

	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_0_106:
	nop
	setx 0xffffffcafffff457, %g1, %g7
	.word 0xa3800007  ! 213: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802014  ! 214: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x97480000  ! 215: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x91d02034  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_0_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 217: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_108:
	setx 0x3c1cd64c8be3f087, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 218: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd66ff40c  ! 219: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff40c]
	.word 0x8d802000  ! 220: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68008a0  ! 221: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_0_109:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9b45c000  ! 223: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x3a700001  ! 224: BPCC	<illegal instruction>
	.word 0x8d802000  ! 225: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902000  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_0_110:
	setx 0xc970b34686bf9ae1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_111:
	setx 0xb21dddca2aeae621, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_112:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 229: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902009  ! 230: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xda8008a0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda6ff40c  ! 232: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff40c]
	.word 0xdac004a0  ! 233: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_cmpr_0_113:
	setx 0x380a37e67f48341b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 234: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_114:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 235: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
splash_lsu_0_115:
	setx 0x8f030489ffbb7b11, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_116:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d948001  ! 237: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	setx 0x3b260a707bb7db9d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_117:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_118:
	tsubcctv %r20, 0x1620, %r17
	.word 0xda07f40c  ! 239: LDUW_I	lduw	[%r31 + 0xfffff40c], %r13
	.word 0xa190200f  ! 240: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802004  ! 241: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa6c4f3cf  ! 242: ADDCcc_I	addccc 	%r19, 0xfffff3cf, %r19
	.word 0x879021ba  ! 243: WRPR_TT_I	wrpr	%r0, 0x01ba, %tt
intveclr_0_119:
	setx 0xd1174e76e6566c01, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8030ab  ! 245: SIR	sir	0x10ab
	.word 0x8d902912  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x0912, %pstate
splash_cmpr_0_120:
	setx 0xc5267e00099f798b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_121:
	setx 0x20560ee9eeee51ed, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 249: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16961bf  ! 250: SDIVX_I	sdivx	%r5, 0x01bf, %r16
	.word 0x93d02034  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_randtl_0_123:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_123:
	.word 0x8f902003  ! 252: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_124:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d92c014  ! 254: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
tagged_0_125:
	taddcctv %r11, 0x1f22, %r7
	.word 0xe007e1bf  ! 255: LDUW_I	lduw	[%r31 + 0x01bf], %r16
DS_0_126:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x876689dd	! Random illegal ?
	.word 0xa9a209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f20
	.word 0x93a4c834  ! 256: FADDs	fadds	%f19, %f20, %f9
	.word 0x34800001  ! 257: BG	bg,a	<label_0x1>
debug_0_127:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 259: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d9027b8  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x07b8, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9b540000  ! 262: RDPR_GL	<illegal instruction>
pmu_0_128:
	nop
	setx 0xfffff2fdfffff69c, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_129
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_129:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 264: RDPC	rd	%pc, %r10
	.word 0xa1902000  ! 265: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8780204f  ! 266: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd4c004a0  ! 267: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
mondo_0_130:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 268: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
debug_0_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 269: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91917080  ! 270: WRPR_PIL_I	wrpr	%r5, 0x1080, %pil
mondo_0_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d928013  ! 271: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
debug_0_133:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 272: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4800bc0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0xd4cfe030  ! 274: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x8d9020b2  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x00b2, %pstate
splash_hpstate_0_134:
	.word 0x8198215e  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
	.word 0xd41ff080  ! 277: LDD_I	ldd	[%r31 + 0xfffff080], %r10
	setx 0x4c3e1241d872bc15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_135:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0xa5414000  ! 279: RDPC	rd	%pc, %r18
splash_cmpr_0_137:
	setx 0xa36cb925546e9b22, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 280: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_138:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_138:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_138
    nop
debug_wait0_138:
    ld [%r23], %r2
    brnz %r2, debug_wait0_138
    nop
    ba,a debug_startwait0_138
continue_debug_0_138:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_138:
    cmp %r13, %r15
    bne,a wait_for_stat_0_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_138:
    cmp %r14, %r15
    bne,a wait_for_debug_0_138
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 281: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xa190200d  ! 282: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe497e000  ! 283: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
splash_cmpr_0_139:
	setx 0xafbb9248fa52a164, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 285: BVC	bvc,a	<label_0x1>
splash_cmpr_0_140:
	setx 0x08e44eb51c3d2777, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 286: WR_STICK_REG_R	wr	%r0, %r1, %-
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
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 287: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
debug_0_142:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 288: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x90c1bc91  ! 289: ADDCcc_I	addccc 	%r6, 0xfffffc91, %r8
	.word 0x8790234b  ! 290: WRPR_TT_I	wrpr	%r0, 0x034b, %tt
	.word 0x81b01021  ! 291: SIAM	siam	1
	.word 0xd08fe010  ! 292: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
mondo_0_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d950014  ! 293: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_144)) -> intp(3,0,4)
intvec_0_144:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 295: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9f8025a9  ! 296: SIR	sir	0x05a9
	.word 0x93902007  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69a9ad  ! 298: SDIVX_I	sdivx	%r6, 0x09ad, %r13
	.word 0xdb37c000  ! 299: STQF_R	-	%f13, [%r0, %r31]
splash_cmpr_0_146:
	setx 0xcc4a6a4062169481, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_147:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a309c8  ! 1: FDIVd	fdivd	%f12, %f8, %f12
	normalw
	.word 0x91458000  ! 301: RD_SOFTINT_REG	rd	%softint, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 302: LDX_R	ldx	[%r31 + %r0], %r8
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
    and %r14, 0xd2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00170  ! 303: FABSq	dis not found

	.word 0xd48804a0  ! 304: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x98dc4007  ! 305: SMULcc_R	smulcc 	%r17, %r7, %r12
splash_cmpr_0_149:
	setx 0x31286cd31c551fb2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20800001  ! 307: BN	bn,a	<label_0x1>
	.word 0x9ba28d33  ! 308: FsMULd	fsmuld	%f10, %f50, %f44
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_150:
    cmp %r14, %r15
    bne,a wait_for_debug_0_150
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 309: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93902002  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_0_151:
	taddcctv %r21, 0x1f22, %r12
	.word 0xda07e9ad  ! 311: LDUW_I	lduw	[%r31 + 0x09ad], %r13
	.word 0xdac804a0  ! 312: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cf316  ! 313: SDIVX_I	sdivx	%r19, 0xfffff316, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_153)) -> intp(0,1,3)
xir_0_153:
	.word 0xa9852a41  ! 314: WR_SET_SOFTINT_I	wr	%r20, 0x0a41, %set_softint
splash_hpstate_0_154:
	.word 0x81982a47  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a47, %hpstate
splash_tba_0_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 316: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 317: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9702ebd  ! 318: POPC_I	popc	0x0ebd, %r20
	.word 0x22800001  ! 319: BE	be,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0x93414000  ! 320: RDPC	rd	%pc, %r9
	setx 0x24fc26df5a0b517b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_157:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902556  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0556, %pstate
	.word 0xa9840002  ! 323: WR_SET_SOFTINT_R	wr	%r16, %r2, %set_softint
intveclr_0_158:
	setx 0xa9988d3d336c0da4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 324: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xd5465bd32ad1e1de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_159:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90379d  ! 326: WRPR_PSTATE_I	wrpr	%r0, 0x179d, %pstate
change_to_randtl_0_160:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_160:
	.word 0x8f902001  ! 327: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a3819  ! 328: SDIVX_I	sdivx	%r8, 0xfffff819, %r9
	.word 0xa190200b  ! 329: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_0_162:
	setx 0x16f5adc298c46556, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_163:
	setx 0x5331d334ce3f52ee, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 331: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_164:
	setx 0x1dfce6f66c4f08dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 332: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a1c9cb  ! 1: FDIVd	fdivd	%f38, %f42, %f10
	.word 0x95a00541  ! 1: FSQRTd	fsqrt	
	.word 0x99a1882d  ! 333: FADDs	fadds	%f6, %f13, %f12
pmu_0_166:
	nop
	setx 0xfffff91afffff93e, %g1, %g7
	.word 0xa3800007  ! 334: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01974  ! 335: FqTOd	dis not found

	.word 0xd06ff819  ! 336: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff819]
splash_cmpr_0_168:
	setx 0xbaf6ba9315be0716, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 337: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa7a3482c  ! 339: FADDs	fadds	%f13, %f12, %f19
	.word 0x36700001  ! 340: BPGE	<illegal instruction>
splash_cmpr_0_170:
	setx 0xc12faa65cfb88cfb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d928005  ! 342: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
splash_cmpr_0_172:
	setx 0xf45d56d6f149959b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 343: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d90400a  ! 344: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0x8790211e  ! 345: WRPR_TT_I	wrpr	%r0, 0x011e, %tt
splash_hpstate_0_174:
	.word 0x819828fc  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08fc, %hpstate
	.word 0x9145c000  ! 347: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x9b540000  ! 348: RDPR_GL	<illegal instruction>
	.word 0xda880e40  ! 349: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
splash_cmpr_0_175:
	setx 0x90c759204d3e2197, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021d7  ! 351: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
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
    and %r14, 0x82, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00168  ! 352: FABSq	dis not found

	.word 0xa9a000c1  ! 353: FNEGd	fnegd	%f32, %f20
splash_hpstate_0_177:
	.word 0x8198208c  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0xe89004a0  ! 355: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
mondo_0_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d920013  ! 356: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
tagged_0_179:
	taddcctv %r15, 0x1f7d, %r19
	.word 0xe807f819  ! 357: LDUW_I	lduw	[%r31 + 0xfffff819], %r20
	.word 0xab848011  ! 358: WR_CLEAR_SOFTINT_R	wr	%r18, %r17, %clear_softint
	.word 0xa1902003  ! 359: WRPR_GL_I	wrpr	%r0, 0x0003, %-
pmu_0_180:
	nop
	setx 0xfffff29bfffffe30, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20700001  ! 361: BPN	<illegal instruction>
debug_0_181:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a0c9d4  ! 364: FDIVd	fdivd	%f34, %f20, %f8
mondo_0_183:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94000d  ! 365: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
debug_0_184:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 366: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x95a049c2  ! 367: FDIVd	fdivd	%f32, %f2, %f10
debug_0_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4c804a0  ! 369: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd497e010  ! 370: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0xd4c00e40  ! 371: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
	.word 0x93902002  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_0_186:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_187:
	setx 0x7654dc49cee5c5fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 374: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4d00e40  ! 375: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
debug_0_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 376: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_189:
    cmp %r14, %r15
    bne,a wait_for_debug_0_189
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 377: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x87902211  ! 378: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
splash_cmpr_0_190:
	setx 0xe10034a85540046c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 380: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81460000  ! 381: RD_STICK_REG	stbar
mondo_0_191:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d940006  ! 382: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
cmp_0_192:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_192:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_192
    nop
cmp_wait0_192:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_192
    nop
    ba,a cmp_startwait0_192
continue_cmp_0_192:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x94, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a00173  ! 383: FABSq	dis not found

	.word 0x91d02032  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_0_193:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_0_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_194:
	.word 0x8f902000  ! 386: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_0_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 387: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_196)) -> intp(0,1,3)
xir_0_196:
	.word 0xa9846a80  ! 388: WR_SET_SOFTINT_I	wr	%r17, 0x0a80, %set_softint
debug_0_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_198)) -> intp(0,1,3)
xir_0_198:
	.word 0xa98176e9  ! 390: WR_SET_SOFTINT_I	wr	%r5, 0x16e9, %set_softint
	.word 0x87802063  ! 391: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xad84f561  ! 392: WR_SOFTINT_REG_I	wr	%r19, 0x1561, %softint
splash_cmpr_0_199:
	setx 0xbbb6417ea187b4f6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 393: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_200)) -> intp(4,0,15)
intvec_0_200:
	.word 0x39400001  ! 394: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_201:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02034  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_0_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_202:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_0_203:
	taddcctv %r12, 0x1e04, %r8
	.word 0xe807f561  ! 398: LDUW_I	lduw	[%r31 + 0xfffff561], %r20
	.word 0x879021d2  ! 399: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
splash_lsu_0_204:
	setx 0xc21152649cfe265b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_205:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d90c007  ! 401: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
splash_hpstate_0_206:
	.word 0x81982416  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0416, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99683baa  ! 403: SDIVX_I	sdivx	%r0, 0xfffffbaa, %r12
	.word 0xd937fbaa  ! 404: STQF_I	-	%f12, [0x1baa, %r31]
	.word 0x91d02035  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_208:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 406: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902b00  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x0b00, %pstate
mondo_0_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 408: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
splash_hpstate_0_210:
	.word 0x81982aa5  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aa5, %hpstate
DS_0_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a00542  ! 1: FSQRTd	fsqrt	
	.word 0x95a08828  ! 410: FADDs	fadds	%f2, %f8, %f10
splash_cmpr_0_212:
	setx 0xcfc20cd0a9adfa47, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 411: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r10
tagged_0_213:
	taddcctv %r20, 0x1cdc, %r2
	.word 0xd407fbaa  ! 413: LDUW_I	lduw	[%r31 + 0xfffffbaa], %r10
	.word 0xd49fc020  ! 414: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x20700001  ! 415: BPN	<illegal instruction>
DS_0_214:
	.word 0x99a309d4  ! 1: FDIVd	fdivd	%f12, %f20, %f12
	.word 0xbfe7c000  ! 416: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_0_215:
	setx 0xb36f838d1fe334b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 417: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_216:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90c005  ! 418: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
splash_tba_0_217:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 419: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f803fc5  ! 420: SIR	sir	0x1fc5
splash_lsu_0_218:
	setx 0x7a62a823350a5147, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_219:
	.word 0x819823ff  ! 422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ff, %hpstate
cmp_0_220:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_220:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_220
    nop
cmp_wait0_220:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_220
    nop
    ba,a cmp_startwait0_220
continue_cmp_0_220:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfc, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a0016a  ! 423: FABSq	dis not found

	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_221:
	taddcctv %r7, 0x10e0, %r13
	.word 0xd807ffc5  ! 425: LDUW_I	lduw	[%r31 + 0xffffffc5], %r12
DS_0_222:
	.word 0xa1a449c6  ! 1: FDIVd	fdivd	%f48, %f6, %f16
	allclean
	.word 0x9bb1430b  ! 426: ALIGNADDRESS	alignaddr	%r5, %r11, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 427: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_0_223:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_223:
	.word 0x8f902003  ! 428: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99902003  ! 429: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_tba_0_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802020  ! 432: WRASI_I	wr	%r0, 0x0020, %asi
pmu_0_225:
	nop
	setx 0xfffff0d8fffffb84, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c700001  ! 434: BPPOS	<illegal instruction>
debug_0_226:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 436: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97683009  ! 437: SDIVX_I	sdivx	%r0, 0xfffff009, %r11
splash_hpstate_0_229:
	.word 0x819829ce  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ce, %hpstate
	.word 0x879022c4  ! 439: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
splash_htba_0_230:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 440: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_231:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_231:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_231
    nop
debug_wait0_231:
    ld [%r23], %r2
    brnz %r2, debug_wait0_231
    nop
    ba,a debug_startwait0_231
continue_debug_0_231:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_231:
    cmp %r13, %r15
    bne,a wait_for_stat_0_231
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_231:
    cmp %r14, %r15
    bne,a wait_for_debug_0_231
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 442: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
tagged_0_232:
	tsubcctv %r16, 0x1e72, %r4
	.word 0xd607f009  ! 443: LDUW_I	lduw	[%r31 + 0xfffff009], %r11
splash_cmpr_0_233:
	setx 0xb8062a758075d61e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 445: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
	.word 0xa7a00162  ! 446: FABSq	dis not found

cmp_0_235:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_235:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_235
    nop
cmp_wait0_235:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_235
    nop
    ba,a cmp_startwait0_235
continue_cmp_0_235:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x44, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00165  ! 447: FABSq	dis not found

mondo_0_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 448: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xa7852b17  ! 449: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0b17, %-
splash_tba_0_237:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_238:
	setx 0x744f8fefc3bcda60, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 452: BCS	bcs,a	<label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_239
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_239:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 453: RDPC	rd	%pc, %r11
	.word 0xd68008a0  ! 454: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_0_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 455: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd60fc000  ! 456: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xad816ef5  ! 457: WR_SOFTINT_REG_I	wr	%r5, 0x0ef5, %softint
mondo_0_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d914013  ! 458: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x99902001  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802058  ! 460: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93a489ad  ! 461: FDIVs	fdivs	%f18, %f13, %f9
mondo_0_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d908013  ! 462: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_243
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_243
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_243:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 463: RDPC	rd	%pc, %r18
	.word 0x8d90201c  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_244:
	setx 0x794d24ea1dc73839, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 467: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe537eef5  ! 468: STQF_I	-	%f18, [0x0ef5, %r31]
splash_htba_0_245:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 469: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_0_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91000b  ! 470: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x87902308  ! 471: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r18
	setx 0xe189169412c4b5ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_247:
	.word 0x39400001  ! 473: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_248:
	setx 0xe2e534caedfd27a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 474: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780201c  ! 475: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 476: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_250)) -> intp(7,0,25)
intvec_0_250:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_251:
	.word 0xa5a109d1  ! 1: FDIVd	fdivd	%f4, %f48, %f18
	.word 0xbfefc000  ! 478: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x34700001  ! 480: BPG	<illegal instruction>
cmp_0_252:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_252:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_252
    nop
cmp_wait0_252:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_252
    nop
    ba,a cmp_startwait0_252
continue_cmp_0_252:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a00164  ! 481: FABSq	dis not found

    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
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
	.word 0x93414000  ! 482: RDPC	rd	%pc, %r9
splash_hpstate_0_254:
	.word 0x819821d6  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
intveclr_0_255:
	setx 0x8a7700c2bacc8ae2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_256:
	setx 0x084d87709ff36211, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab80800b  ! 486: WR_CLEAR_SOFTINT_R	wr	%r2, %r11, %clear_softint
	.word 0x8d802000  ! 487: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_257:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_258:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 489: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_0_259:
	setx 0xbf7e9e3fb27dfb4e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 490: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 491: BPVC	<illegal instruction>
splash_hpstate_0_260:
	.word 0x8198258f  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0x20800001  ! 493: BN	bn,a	<label_0x1>
splash_lsu_0_261:
	setx 0xb85d6a7d827cbbbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_262:
	.word 0x95a349c2  ! 1: FDIVd	fdivd	%f44, %f2, %f10
	.word 0xfb69acce	! Random illegal ?
	.word 0xa5a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x91a18831  ! 495: FADDs	fadds	%f6, %f17, %f8
	.word 0x93d020b2  ! 496: Tcc_I	tne	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_263:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 498: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93450000  ! 499: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_hpstate_0_264:
	.word 0x8198203c  ! 500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x003c, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93693f1b  ! 501: SDIVX_I	sdivx	%r4, 0xffffff1b, %r9
	.word 0xd2ffc031  ! 502: SWAPA_R	swapa	%r9, [%r31 + %r17] 0x01
debug_0_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802010  ! 504: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd28008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_0_267:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d914011  ! 506: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0x9545c000  ! 507: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xa2f94008  ! 508: SDIVcc_R	sdivcc 	%r5, %r8, %r17
	.word 0x8d9029a6  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x09a6, %pstate
splash_cmpr_0_268:
	setx 0xe9deb0ec29700151, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902007  ! 511: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200c  ! 512: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_0_269:
	setx 0x8d0c5b72757b3f99, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 513: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_270:
	tsubcctv %r2, 0x12ba, %r4
	.word 0xe207ff1b  ! 514: LDUW_I	lduw	[%r31 + 0xffffff1b], %r17
intveclr_0_271:
	setx 0x4728b0cbe92133b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 515: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_272:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 516: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe277c000  ! 517: STX_R	stx	%r17, [%r31 + %r0]
	setx 0x197946f37bbdea53, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_273:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe337ff1b  ! 519: STQF_I	-	%f17, [0x1f1b, %r31]
cmp_0_274:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_274:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_274
    nop
cmp_wait0_274:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_274
    nop
    ba,a cmp_startwait0_274
continue_cmp_0_274:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 26, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a00163  ! 520: FABSq	dis not found

mondo_0_275:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d924008  ! 521: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
tagged_0_276:
	tsubcctv %r14, 0x1969, %r22
	.word 0xd807ff1b  ! 522: LDUW_I	lduw	[%r31 + 0xffffff1b], %r12
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_277
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_277:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 523: RDPC	rd	%pc, %r13
DS_0_278:
	.word 0x9ba309c0  ! 1: FDIVd	fdivd	%f12, %f0, %f44
	.word 0xbfefc000  ! 524: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_0_279:
	setx 0xa81f3af679940165, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 526: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 527: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68e048  ! 528: SDIVX_I	sdivx	%r3, 0x0048, %r13
mondo_0_281:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 529: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	.word 0xdad7e030  ! 530: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d9024e8  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x04e8, %pstate
splash_cmpr_0_282:
	setx 0x1c1099af9a7feb1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_283:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 534: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_hpstate_0_284:
	.word 0x8198205c  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
debug_0_285:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_285:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_285
    nop
debug_wait0_285:
    ld [%r23], %r2
    brnz %r2, debug_wait0_285
    nop
    ba,a debug_startwait0_285
continue_debug_0_285:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_285:
    cmp %r13, %r15
    bne,a wait_for_stat_0_285
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_285:
    cmp %r14, %r15
    bne,a wait_for_debug_0_285
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 536: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_286
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_286
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_286:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 537: RDPC	rd	%pc, %r19
	setx 0x14ead579b15816c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_287:
	.word 0x39400001  ! 538: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9830005  ! 539: WR_SET_SOFTINT_R	wr	%r12, %r5, %set_softint
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_288
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_288:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 540: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 542: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_lsu_0_289:
	setx 0x6a2d3e372570a0bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 543: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 544: WRASI_I	wr	%r0, 0x0089, %asi
cmp_0_290:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_290:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_290
    nop
cmp_wait0_290:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_290
    nop
    ba,a cmp_startwait0_290
continue_cmp_0_290:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x50, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a00163  ! 545: FABSq	dis not found

mondo_0_291:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d918013  ! 546: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
donret_0_292:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_292-donret_0_292), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_292:
	.word 0xd6ffe048  ! 547: SWAPA_I	swapa	%r11, [%r31 + 0x0048] %asi
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_293
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_293
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_293:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 548: RDPC	rd	%pc, %r13
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 549: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_294:
	setx 0x3159a2634ed2d6a5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 550: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_295:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 551: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
tagged_0_296:
	tsubcctv %r12, 0x172f, %r7
	.word 0xda07e048  ! 552: LDUW_I	lduw	[%r31 + 0x0048], %r13
splash_cmpr_0_297:
	setx 0x4d996f8112dfe077, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 553: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9023c1  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x03c1, %pstate
	.word 0xdac004a0  ! 555: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_lsu_0_298:
	setx 0xdb2c4878a281f0e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 558: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83d02032  ! 559: Tcc_I	te	icc_or_xcc, %r0 + 50
debug_0_299:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa2dc4006  ! 561: SMULcc_R	smulcc 	%r17, %r6, %r17
DS_0_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7304012  ! 1: STQF_R	-	%f11, [%r18, %r1]
	normalw
	.word 0xa7458000  ! 562: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa1464000  ! 565: RD_STICK_CMPR_REG	rd	%-, %r16
DS_0_301:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd934af19  ! 1: STQF_I	-	%f12, [0x0f19, %r18]
	normalw
	.word 0x95458000  ! 566: RD_SOFTINT_REG	rd	%softint, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 567: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa084e6fb  ! 568: ADDcc_I	addcc 	%r19, 0x06fb, %r16
	.word 0xe09004a0  ! 569: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x8d903a72  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x1a72, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 571: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_302:
	tsubcctv %r9, 0x1155, %r2
	.word 0xe007e6fb  ! 572: LDUW_I	lduw	[%r31 + 0x06fb], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68355c  ! 573: SDIVX_I	sdivx	%r0, 0xfffff55c, %r13
	.word 0xdb37f55c  ! 574: STQF_I	-	%f13, [0x155c, %r31]
	.word 0x87802055  ! 575: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93540000  ! 576: RDPR_GL	<illegal instruction>
change_to_randtl_0_304:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_304:
	.word 0x8f902001  ! 577: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd2d004a0  ! 578: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
mondo_0_305:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 579: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 580: LDX_R	ldx	[%r31 + %r0], %r9
cmp_0_306:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_306:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_306
    nop
cmp_wait0_306:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_306
    nop
    ba,a cmp_startwait0_306
continue_cmp_0_306:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 54, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00160  ! 581: FABSq	dis not found

pmu_0_307:
	nop
	setx 0xfffff33afffff114, %g1, %g7
	.word 0xa3800007  ! 582: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_0_308:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_308-donret_0_308), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_308:
	.word 0xe2fff55c  ! 583: SWAPA_I	swapa	%r17, [%r31 + 0xfffff55c] %asi
splash_cmpr_0_309:
	setx 0x7da508fad9d60e97, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 584: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_310:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 585: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa5a0c9c4  ! 586: FDIVd	fdivd	%f34, %f4, %f18
	.word 0x8d903d85  ! 587: WRPR_PSTATE_I	wrpr	%r0, 0x1d85, %pstate
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_311
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 588: RDPC	rd	%pc, %r16
splash_hpstate_0_312:
	.word 0x81982a9f  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
	.word 0x91d02033  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_0_313:
	setx 0xb8d656e3ec634345, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 591: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_0_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_315:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_315:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_315
    nop
debug_wait0_315:
    ld [%r23], %r2
    brnz %r2, debug_wait0_315
    nop
    ba,a debug_startwait0_315
continue_debug_0_315:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_315:
    cmp %r13, %r15
    bne,a wait_for_stat_0_315
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_315:
    cmp %r14, %r15
    bne,a wait_for_debug_0_315
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 593: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
debug_0_316:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 594: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe07ff55c  ! 595: SWAP_I	swap	%r16, [%r31 + 0xfffff55c]
splash_cmpr_0_317:
	setx 0x53c876323266880f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe007c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 599: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902c89  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0cfe000  ! 602: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0xe08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93464000  ! 604: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x87802055  ! 605: WRASI_I	wr	%r0, 0x0055, %asi
tagged_0_318:
	tsubcctv %r15, 0x10e0, %r22
	.word 0xd207f55c  ! 606: LDUW_I	lduw	[%r31 + 0xfffff55c], %r9
mondo_0_319:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d930012  ! 607: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
mondo_0_320:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d94c006  ! 608: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cff00  ! 609: SDIVX_I	sdivx	%r19, 0xffffff00, %r9
debug_0_322:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 610: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_323:
	taddcctv %r10, 0x14cc, %r16
	.word 0xd207ff00  ! 611: LDUW_I	lduw	[%r31 + 0xffffff00], %r9
mondo_0_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d924005  ! 612: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
	.word 0x93902005  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_325:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 614: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_326:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_326:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_326
    nop
cmp_wait0_326:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_326
    nop
    ba,a cmp_startwait0_326
continue_cmp_0_326:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x62, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a0016c  ! 615: FABSq	dis not found

DS_0_327:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 616: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 617: WRASI_I	wr	%r0, 0x0004, %asi
splash_htba_0_328:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 618: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe64fff00  ! 619: LDSB_I	ldsb	[%r31 + 0xffffff00], %r19
	.word 0xa9500000  ! 620: RDPR_TPC	<illegal instruction>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d910003  ! 622: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
mondo_0_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d904013  ! 623: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
debug_0_331:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902d87  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x0d87, %pstate
	.word 0x9b68800a  ! 626: SDIVX_R	sdivx	%r2, %r10, %r13
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_332
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_332
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_332:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 627: RDPC	rd	%pc, %r18
pmu_0_333:
	nop
	setx 0xfffff4f5fffffc70, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe527ff00  ! 629: STF_I	st	%f18, [0x1f00, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x87902348  ! 631: WRPR_TT_I	wrpr	%r0, 0x0348, %tt
	.word 0x8d9033f0  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x13f0, %pstate
	.word 0xab808006  ! 633: WR_CLEAR_SOFTINT_R	wr	%r2, %r6, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 634: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x34700001  ! 635: BPG	<illegal instruction>
splash_cmpr_0_334:
	setx 0x5486179822d08149, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99520000  ! 637: RDPR_PIL	<illegal instruction>
DS_0_335:
	.word 0x95a409ca  ! 1: FDIVd	fdivd	%f16, %f10, %f10
	pdist %f24, %f10, %f2
	.word 0x99b4830b  ! 638: ALIGNADDRESS	alignaddr	%r18, %r11, %r12
	.word 0xd88804a0  ! 639: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99902001  ! 640: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_0_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d904005  ! 641: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	setx 0xca0840ff6b05ede7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_337:
	.word 0x39400001  ! 642: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_0_338:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_338:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_338
    nop
cmp_wait0_338:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_338
    nop
    ba,a cmp_startwait0_338
continue_cmp_0_338:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfc, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a00174  ! 643: FABSq	dis not found

mondo_0_339:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d904011  ! 644: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
mondo_0_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94c007  ! 645: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
debug_0_341:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_342:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02032  ! 648: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_0_343:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 649: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_hpstate_0_344:
	.word 0x81982296  ! 650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
splash_tba_0_345:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_346:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 652: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab824006  ! 653: WR_CLEAR_SOFTINT_R	wr	%r9, %r6, %clear_softint
	.word 0xa190200d  ! 654: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_0_347:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
pmu_0_348:
	nop
	setx 0xfffff74afffff50e, %g1, %g7
	.word 0xa3800007  ! 656: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38700001  ! 657: BPGU	<illegal instruction>
	.word 0xd537ff00  ! 658: STQF_I	-	%f10, [0x1f00, %r31]
splash_lsu_0_349:
	setx 0x812d1d6df1d101cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_350:
	setx 0x5e5332dbdd2feeb3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 660: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_351
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_351
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_351:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 661: RDPC	rd	%pc, %r13
mondo_0_352:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94400c  ! 662: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x8d903f82  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x1f82, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568fef5  ! 664: SDIVX_I	sdivx	%r3, 0xfffffef5, %r10
	.word 0x9ba089c8  ! 665: FDIVd	fdivd	%f2, %f8, %f44
	.word 0x87902224  ! 666: WRPR_TT_I	wrpr	%r0, 0x0224, %tt
change_to_randtl_0_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_354:
	.word 0x8f902002  ! 667: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_0_355:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xda1fc000  ! 670: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x93902003  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xdb37fef5  ! 672: STQF_I	-	%f13, [0x1ef5, %r31]
splash_cmpr_0_356:
	setx 0x2602e311221ae446, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 673: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_357:
	taddcctv %r1, 0x13b6, %r16
	.word 0xda07fef5  ! 674: LDUW_I	lduw	[%r31 + 0xfffffef5], %r13
	.word 0x93902003  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xdadfe020  ! 676: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x87802055  ! 677: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_358:
	setx 0xbe821de06e711545, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 678: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802010  ! 679: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xda0ffef5  ! 680: LDUB_I	ldub	[%r31 + 0xfffffef5], %r13
splash_hpstate_0_359:
	.word 0x81982447  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0447, %hpstate
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
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00852  ! 682: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x93902007  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99540000  ! 684: RDPR_GL	<illegal instruction>
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_361
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_361
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_361:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 685: RDPC	rd	%pc, %r13
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_362:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 687: SAVE_R	save	%r31, %r0, %r31
DS_0_363:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_364
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_364
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_364:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 689: RDPC	rd	%pc, %r12
change_to_randtl_0_365:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_365:
	.word 0x8f902002  ! 690: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd88804a0  ! 691: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x99a289ac  ! 692: FDIVs	fdivs	%f10, %f12, %f12
splash_cmpr_0_366:
	setx 0xa60771939246d8e2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd86ffef5  ! 695: LDSTUB_I	ldstub	%r12, [%r31 + 0xfffffef5]
	.word 0xd8dfe000  ! 696: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
intveclr_0_367:
	setx 0x228ec32a4897a3d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_368:
	.word 0x81982495  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0495, %hpstate
	.word 0x8d902ee8  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0ee8, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8d7e020  ! 701: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
splash_tba_0_369:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 702: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 704: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_370:
	setx 0x9bd9735472c0c091, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 705: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_371:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_371:
	.word 0x8f902003  ! 706: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91454000  ! 707: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xa1902005  ! 708: WRPR_GL_I	wrpr	%r0, 0x0005, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_372)) -> intp(7,0,2)
intvec_0_372:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 710: RD_STICK_REG	stbar
change_to_randtl_0_373:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_373:
	.word 0x8f902001  ! 711: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_0_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c00c  ! 712: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
splash_hpstate_0_375:
	.word 0x81982915  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
splash_cmpr_0_376:
	setx 0x93292a4ea8769a11, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200c  ! 715: WRPR_GL_I	wrpr	%r0, 0x000c, %-
intveclr_0_377:
	setx 0x93213fb001d31075, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 716: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_378)) -> intp(0,1,3)
xir_0_378:
	.word 0xa983275c  ! 717: WR_SET_SOFTINT_I	wr	%r12, 0x075c, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01961  ! 718: FqTOd	dis not found

intveclr_0_380:
	setx 0xa1b49ee7a1cbfc71, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 719: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 720: RDPR_TPC	<illegal instruction>
	.word 0xa7520000  ! 721: RDPR_PIL	<illegal instruction>
	.word 0xe727c000  ! 722: STF_R	st	%f19, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 723: FqTOd	dis not found

splash_htba_0_382:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 724: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	setx 0x6c9697b315a83e68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_383:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 726: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_0_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d910011  ! 727: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
intveclr_0_385:
	setx 0xfa72384de1d67243, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 729: BPNEG	<illegal instruction>
splash_cmpr_0_386:
	setx 0xf8779101c76fb23c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 730: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 731: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87902107  ! 732: WRPR_TT_I	wrpr	%r0, 0x0107, %tt
	.word 0xd21fe75c  ! 733: LDD_I	ldd	[%r31 + 0x075c], %r9
	.word 0xa0f87bf1  ! 734: SDIVcc_I	sdivcc 	%r1, 0xfffffbf1, %r16
pmu_0_387:
	nop
	setx 0xfffff4a4fffff0ff, %g1, %g7
	.word 0xa3800007  ! 735: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_0_388:
	nop
	setx 0xfffffa26fffffbd6, %g1, %g7
	.word 0xa3800007  ! 736: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802089  ! 737: WRASI_I	wr	%r0, 0x0089, %asi
cmp_0_389:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_389:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_389
    nop
cmp_wait0_389:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_389
    nop
    ba,a cmp_startwait0_389
continue_cmp_0_389:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a00165  ! 738: FABSq	dis not found

	.word 0xe117c000  ! 739: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe04fc000  ! 740: LDSB_R	ldsb	[%r31 + %r0], %r16
mondo_0_390:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948007  ! 741: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09ffbf1  ! 743: LDDA_I	ldda	[%r31, + 0xfffffbf1] %asi, %r16
	.word 0x93a01a67  ! 744: FqTOi	fqtoi	
mondo_0_391:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 745: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
tagged_0_392:
	tsubcctv %r21, 0x15d8, %r10
	.word 0xd207fbf1  ! 746: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0x91d02033  ! 747: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 748: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd31ffbf1  ! 749: LDDF_I	ldd	[%r31, 0x1bf1], %f9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd327fbf1  ! 752: STF_I	st	%f9, [0x1bf1, %r31]
mondo_0_393:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d940008  ! 753: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
splash_lsu_0_394:
	setx 0x3f0cfcdf77aabe0b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 754: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_395:
	taddcctv %r26, 0x1267, %r24
	.word 0xd207fbf1  ! 755: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
tagged_0_396:
	tsubcctv %r13, 0x1758, %r7
	.word 0xd207fbf1  ! 756: LDUW_I	lduw	[%r31 + 0xfffffbf1], %r9
	.word 0xd327fbf1  ! 757: STF_I	st	%f9, [0x1bf1, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa568eb02  ! 758: SDIVX_I	sdivx	%r3, 0x0b02, %r18
	.word 0x87802055  ! 759: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_0_398:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_399:
	setx 0xdd5832e24e3c73c7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe48008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93a209ea  ! 763: FDIVq	dis not found

debug_0_400:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 764: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_401:
	taddcctv %r9, 0x1df3, %r9
	.word 0xd207eb02  ! 765: LDUW_I	lduw	[%r31 + 0x0b02], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x36700001  ! 767: BPGE	<illegal instruction>
splash_cmpr_0_402:
	setx 0xaee51945710bd0e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 768: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_403:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_403:
	.word 0x8f902001  ! 769: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd31feb02  ! 770: LDDF_I	ldd	[%r31, 0x0b02], %f9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802080  ! 772: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_0_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_405:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d934002  ! 774: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
debug_0_406:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_0_407:
	setx 0xa40b8395648154b8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 777: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 778: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_0_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d914009  ! 779: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
intveclr_0_409:
	setx 0x50c65fe6e85c02c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020a4  ! 781: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 782: LDX_R	ldx	[%r31 + %r0], %r9
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_410
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_410
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_410:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 783: RDPC	rd	%pc, %r11
	.word 0xd6800b40  ! 784: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
tagged_0_411:
	taddcctv %r4, 0x1920, %r6
	.word 0xd607eb02  ! 785: LDUW_I	lduw	[%r31 + 0x0b02], %r11
	.word 0x8d9023d6  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x03d6, %pstate
intveclr_0_412:
	setx 0x01b85eb6ec251275, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 787: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd607c000  ! 788: LDUW_R	lduw	[%r31 + %r0], %r11
change_to_randtl_0_413:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_413:
	.word 0x8f902003  ! 789: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x26800001  ! 790: BL	bl,a	<label_0x1>
change_to_randtl_0_414:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_414:
	.word 0x8f902001  ! 791: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x95a2cd29  ! 792: FsMULd	fsmuld	%f11, %f40, %f10
splash_tba_0_415:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 794: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd407c000  ! 796: LDUW_R	lduw	[%r31 + %r0], %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter1, %r23
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_416
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_416
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_416:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 797: RDPC	rd	%pc, %r17
	.word 0xe28008a0  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_0_417:
	taddcctv %r6, 0x1578, %r5
cmpenall_0_418:
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

	.xword	0x70aa3c7632d6d592
	.xword	0xe8ed525876c0dc8a
	.xword	0xdff6d252f8e05ef6
	.xword	0x56b01304a10e5d1e
	.xword	0x7b584b3cb9871986
	.xword	0x83e7b432de6cb83c
	.xword	0xef0d621ea000bc06
	.xword	0x087054a840bb2168
	.xword	0x285dc14283b47dfe
	.xword	0xc6282747c965cafd
	.xword	0xd7cbb02aab0415eb
	.xword	0x08bc6ce07a74f3e2
	.xword	0x600c306a44ab08d7
	.xword	0x1d9a6c6e2fdd5d5a
	.xword	0x625c002185048635
	.xword	0x6ea8e2431f1e58eb
	.xword	0x91aa22d85c084133
	.xword	0xc513e0be098a9371
	.xword	0x1bf7bfe4deea2a36
	.xword	0x14a1022f1a3884f5
	.xword	0xd7b3db2c215c5ab1
	.xword	0x1f8652a8ed47eae3
	.xword	0xf2d370daa5b1e17e
	.xword	0xae7dedef9a91e215
	.xword	0x62d7af2f91335cf5
	.xword	0xaca10ab2b59abac6
	.xword	0x44d58cbd295ca59e
	.xword	0xaededf55ea6ee494
	.xword	0xb6ef8fbe4a132557
	.xword	0xf3f383a0db92ac99
	.xword	0x2aeb01a1e181f682
	.xword	0x4d64f7550073250f
	.xword	0xe10f4a0e547da2c8
	.xword	0xe9ae934518afa2b2
	.xword	0x3330bdb5abadbc25
	.xword	0x223e85ee21c1f1c4
	.xword	0x654a072ccd8c7219
	.xword	0x7b5df0aa2c1ae6f3
	.xword	0x2437878035403fe8
	.xword	0x4aa5372e688220c3
	.xword	0x6e562d47c940a8dc
	.xword	0xc31d06035f26a9ba
	.xword	0xf8ba86b86c0745b4
	.xword	0x7f00aa0a4fc48486
	.xword	0xc579f3c8c9aa452b
	.xword	0x268ab2227e413100
	.xword	0xc1989ec7c2e20eff
	.xword	0x91d0ce72ce65b9fe
	.xword	0xf301b5518ede6acc
	.xword	0x912ad33539d4fd4c
	.xword	0x850beae60f58e1c8
	.xword	0xcd84291076f525b4
	.xword	0xfae651916d3637c4
	.xword	0xdb65c9ec07d97660
	.xword	0x42e07d95ecd40613
	.xword	0xa792d58fe90dbe87
	.xword	0xa07d2a84bf3f63a2
	.xword	0x0a012e2013a22cc9
	.xword	0xcb331371c548d5d0
	.xword	0xd4dfdfe759b9e88b
	.xword	0x04fc96f61305cab2
	.xword	0x2b2ec45f8863aadc
	.xword	0x750880365e2609f6
	.xword	0x49a807649300431b
	.xword	0xcb8dce08a360a061
	.xword	0x0ae914970ff2602d
	.xword	0x156e5810701754ac
	.xword	0x80ab8d1dad69645f
	.xword	0x88845c3d36e032cd
	.xword	0x2027a93c6bebaa26
	.xword	0x4397345cc8d37380
	.xword	0xb3680eddc13cfc8a
	.xword	0x699f46874569b6cc
	.xword	0x30363fdc94d437ea
	.xword	0x51a4768fa883ab3e
	.xword	0x5c5cd5f5c75b893b
	.xword	0x56d1b60326ebe3e2
	.xword	0x9bad17b5a1463be0
	.xword	0x3d4d5dc2b86184ef
	.xword	0x8a83c704b878ed18
	.xword	0x94e2a7bcec128773
	.xword	0x8902c28d4cf904ac
	.xword	0x7d4cb93b59cb977d
	.xword	0x75de5134b61999cf
	.xword	0xcb919401c9ac2d41
	.xword	0x9ca4dd28ab9c9632
	.xword	0xd83235ddd10a7ce7
	.xword	0xa4157bdba1ec93ae
	.xword	0xbe7c9a38b1ee7d80
	.xword	0xf04280908426c521
	.xword	0x4bc7e300a2b61789
	.xword	0x7941a13e18db7a39
	.xword	0xdde9ff36972dc761
	.xword	0xcaa79b6230e620af
	.xword	0xc888f751152c582a
	.xword	0x0e7abfdaccb49d51
	.xword	0x77bcf646a08e2b15
	.xword	0xde5765ae0652b3b6
	.xword	0x088f273d6fc2f2fa
	.xword	0xf03a80f1d54530c5
	.xword	0x4581a715251c29f2
	.xword	0x197cecab3978bd72
	.xword	0x69dfdbe119d9ba51
	.xword	0x041a813c7b6f7662
	.xword	0x8b5cd04e220cb70b
	.xword	0x19243be8afebe934
	.xword	0x94931a7e7de44024
	.xword	0x2624247740d4e0d6
	.xword	0x02366349510f9f24
	.xword	0xaa2fb071e4fb16ea
	.xword	0xbc52b6af9f531060
	.xword	0xed889c0c95f7d433
	.xword	0x11de5a3e673b4993
	.xword	0x7d4b65e33adc143f
	.xword	0x3e0c96fddbfb6d22
	.xword	0xc5d64c624a9bd0a4
	.xword	0xb806ab3efb0ba711
	.xword	0x8a86e11cf6fdb7d5
	.xword	0x8bedf8626d9bc06b
	.xword	0x4a0fbce2f584b274
	.xword	0xea859e7c32db2f26
	.xword	0xaa9f9f8d00aa77f9
	.xword	0x817891a6fd2aa8b6
	.xword	0x70372ff62001a8ed
	.xword	0x68ccb529af5d4a22
	.xword	0x240390fab6726218
	.xword	0xc6c48fa2599fa813
	.xword	0x4e61fd9ba1a8b8cc
	.xword	0xc5db664170d691e1
	.xword	0xe1071b7f71acab3d
	.xword	0x902250ce4dfa5531
	.xword	0x819a664c22c1eb31
	.xword	0xd88b9dd27b80bb41
	.xword	0x8fc94de4bec89ee4
	.xword	0x5e1204841da52eea
	.xword	0x3e6e61c2f058aedd
	.xword	0xa49bd2d61aae42ee
	.xword	0x33e123f678fa1313
	.xword	0xde0cc057739fa1a7
	.xword	0xf8cf49a6c10101ea
	.xword	0x9acd0da6ebc74d9e
	.xword	0xfd7d9ae9ffa711e8
	.xword	0xdd23370ae600d211
	.xword	0x9fd90f629db317be
	.xword	0xc364eec26d792e7f
	.xword	0x69f7e10923c9c608
	.xword	0x9205883c81c0e630
	.xword	0x40aa133121243026
	.xword	0xd49f6088a86333e9
	.xword	0x09089882d1be6811
	.xword	0x1a8ba754944b01e6
	.xword	0x16d915ed5856ee12
	.xword	0x2148c5c56520a690
	.xword	0x4eac9d473dae3126
	.xword	0x868abb131501c654
	.xword	0x1da7c07597fa6c86
	.xword	0x1239ba7b5dc40afe
	.xword	0x07569779ef5e787d
	.xword	0xc77cce5cdc17dcba
	.xword	0x02943a86d18bc36d
	.xword	0x1a56440b4eedf98a
	.xword	0x35e10565e4a8d820
	.xword	0xf24d23b042e86544
	.xword	0x8412309d775d5dbb
	.xword	0x5b0185d19f2c3df0
	.xword	0x041871f1f3dad167
	.xword	0x68c5a03ac0960316
	.xword	0x92b993ca829866b3
	.xword	0xd0a2f6623b429738
	.xword	0x4cda5232c72048c5
	.xword	0x619875b39a8c18c8
	.xword	0xd4633124bf974e0e
	.xword	0x39953f8bc28ab9c2
	.xword	0x6a9ff11e7f1e2cce
	.xword	0x16a2102aa7c787a6
	.xword	0x5c86bbf01deb9e1f
	.xword	0x8ddff8c91a41d13b
	.xword	0xed422eb7a5f485a1
	.xword	0x6da2244b6e9e4432
	.xword	0x457defba1d4bacb3
	.xword	0x391878ebb852cefd
	.xword	0xdb76a54bfdfcc953
	.xword	0x390af3c7d32b6ecd
	.xword	0x4d67ec39aa2d177d
	.xword	0xfe33458c896d3325
	.xword	0x0f8d0a36ad296716
	.xword	0xa2cea2f123362ae2
	.xword	0xf1264406bf7554de
	.xword	0xab83a8891401369f
	.xword	0xeb6186e35d966057
	.xword	0x386985059b051bd8
	.xword	0x4006cb94f6bfed95
	.xword	0x08a0a9fb75084d00
	.xword	0x703c106ad3f0fd9c
	.xword	0xf616caafa34a1e03
	.xword	0xd8e32cd0346904ac
	.xword	0x1f3eaf4966ac1ee2
	.xword	0x4bcd668dbbabdd38
	.xword	0x15654b77deb00824
	.xword	0x8f0ccc4cc9b2744b
	.xword	0xde7946fd1a4389db
	.xword	0xbde713e879cc729c
	.xword	0x14db45e5b9b88519
	.xword	0x37fd2926363177cd
	.xword	0xec5b8ab1a776026c
	.xword	0x2995d795dc0f4767
	.xword	0x04b2f78a359274fe
	.xword	0x6968c9fb8f82e6f8
	.xword	0xb707234a92fbf412
	.xword	0x8868f654f53d4f66
	.xword	0x5d7df8d14b382bb3
	.xword	0x1efb367fd0a18078
	.xword	0x372937d11e996ea1
	.xword	0xd01f9bf4065c3730
	.xword	0x94de1374e959e30c
	.xword	0x19df1518add9930a
	.xword	0x3bff63edd9aaef88
	.xword	0xe3d89100523637c7
	.xword	0x6946ede79f693963
	.xword	0xc8489b7ca912ce5b
	.xword	0x9821d9592743ae78
	.xword	0xb62679d778f05dd8
	.xword	0x554de86104bed973
	.xword	0x1e779df86bd852f7
	.xword	0xe8e3a7e8bbe74530
	.xword	0x4b8ffa2c4bed0afc
	.xword	0xe17fa186ebeda914
	.xword	0x086e230b58a58a24
	.xword	0xf72b94b1f8f1db1e
	.xword	0x2f7ad8aa4baf5bc9
	.xword	0x2d58b284927d4c9d
	.xword	0xbb7e780ae1fda418
	.xword	0x188850e29a0a0abc
	.xword	0x426b05eb2191c92a
	.xword	0x45448a77fa895e01
	.xword	0xac3bbe4faa450823
	.xword	0x62684f2b54250282
	.xword	0xdbc2dbd524e95140
	.xword	0xe20ad2804b754e87
	.xword	0xceef23cce1e0393b
	.xword	0xa1ee44c132cfe663
	.xword	0x7459193c6020785a
	.xword	0xac20c6ea76e9ab29
	.xword	0x8143265dc5bd4481
	.xword	0x78d08329c2f4658f
	.xword	0x5ec5d432a70b1624
	.xword	0x87df917e759e3fbb
	.xword	0x9d7ce0b1713639e9
	.xword	0xacfb16892989011e
	.xword	0xfcb664a804efa514
	.xword	0xdd21764a9cd9c5c1
	.xword	0x083b15615861a415
	.xword	0xcb7c04942a21b46d
	.xword	0xef7ddfaafad5b663
	.xword	0x303a3e0490387ce9
	.xword	0xc3bc7ee35fb85375

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

