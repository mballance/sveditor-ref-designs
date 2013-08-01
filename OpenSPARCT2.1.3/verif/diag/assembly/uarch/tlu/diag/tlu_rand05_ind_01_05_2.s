/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_05_2.s
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
	mov 0x34, %r14
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
	.word 0xa9840007  ! 1: WR_SET_SOFTINT_R	wr	%r16, %r7, %set_softint
	.word 0x9f802557  ! 2: SIR	sir	0x0557
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01970  ! 4: FqTOd	dis not found

splash_lsu_7_1:
	setx 0x4199f808f262b76b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_2:
	setx 0x201359bd66f7f3a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d914001  ! 7: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0x97454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x9ba34dd2  ! 9: FdMULq	fdmulq	
DS_7_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xa8800000  ! 11: ADDcc_R	addcc 	%r0, %r0, %r20
cwp_7_5:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d9022f5  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x02f5, %pstate
	.word 0xe8dfe030  ! 15: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x87902369  ! 16: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_7_6:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 18: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa3520000  ! 19: RDPR_PIL	rdpr	%pil, %r17
	.word 0x8d90386d  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x186d, %pstate
intveclr_7_7:
	setx 0xde27312c69f36f52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 22: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_7_9:
	set user_data_start, %r31
	.word 0x85846ee9  ! 24: WRCCR_I	wr	%r17, 0x0ee9, %ccr
	.word 0x91d02034  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_7_10:
	tsubcctv %r25, 0x10a1, %r6
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x87902038  ! 27: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0x8d802000  ! 28: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6800b40  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
	.word 0x87902022  ! 30: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_11:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 31: RDPC	rd	%pc, %r11
debug_7_12:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 32: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_7_13:
	.word 0x81982387  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0387, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x879020bb  ! 38: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0xd17d34c5c81d6fd1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_16:
	.word 0x81982e47  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
pmu_7_17:
	nop
	setx 0xfffff2ffffffffd3, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_7_18:
	setx 0x0ce94305b4574305, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_7_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_7_20:
	tsubcctv %r11, 0x18ea, %r3
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9808013  ! 47: WR_SET_SOFTINT_R	wr	%r2, %r19, %set_softint
cwp_7_21:
    set user_data_start, %o7
	.word 0x93902000  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_22) + 48, 16, 16)) -> intp(2,0,30)
intvec_7_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab834014  ! 50: WR_CLEAR_SOFTINT_R	wr	%r13, %r20, %clear_softint
	.word 0x93d020b5  ! 51: Tcc_I	tne	icc_or_xcc, %r0 + 181
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_7_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad83297b  ! 56: WR_SOFTINT_REG_I	wr	%r12, 0x097b, %softint
	setx 0xd5bb32004f5e3bbc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 58: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x97500000  ! 60: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_7_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_7_27:
	set user_data_start, %r31
	.word 0x8580e996  ! 63: WRCCR_I	wr	%r3, 0x0996, %ccr
splash_tba_7_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_7_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa4dd0002  ! 66: SMULcc_R	smulcc 	%r20, %r2, %r18
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
	.word 0x91414000  ! 67: RDPC	rd	%pc, %r8
	.word 0x8d902375  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0375, %pstate
	.word 0x9150c000  ! 69: RDPR_TT	rdpr	%tt, %r8
memptr_7_31:
	set 0x60140000, %r31
	.word 0x8582764f  ! 70: WRCCR_I	wr	%r9, 0x164f, %ccr
mondo_7_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d930006  ! 71: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x94fa0009  ! 74: SDIVcc_R	sdivcc 	%r8, %r9, %r10
	.word 0xd49004a0  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_7_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a149ca  ! 1: FDIVd	fdivd	%f36, %f10, %f12
	normalw
	.word 0xa7458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r19
cwp_7_34:
    set user_data_start, %o7
	.word 0x93902006  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_35)+56, 16, 16)) -> intp(7,1,3)
xir_7_35:
	.word 0xa980bef2  ! 78: WR_SET_SOFTINT_I	wr	%r2, 0x1ef2, %set_softint
memptr_7_36:
	set user_data_start, %r31
	.word 0x85822832  ! 79: WRCCR_I	wr	%r8, 0x0832, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 80: RDPC	rd	%pc, %r17
	.word 0xd6c804a0  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 82: RDPC	rd	%pc, %r20
debug_7_39:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 83: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
cwp_7_40:
    set user_data_start, %o7
	.word 0x93902003  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd68008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_7_41:
	setx 0xf6593fbae678504b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c79ee  ! 87: SDIVX_I	sdivx	%r17, 0xfffff9ee, %r9
debug_7_43:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902ae1  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0ae1, %pstate
	.word 0x9f802dfd  ! 90: SIR	sir	0x0dfd
	.word 0xa1902001  ! 91: WRPR_GL_I	wrpr	%r0, 0x0001, %-
mondo_7_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d950006  ! 92: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0x93d02035  ! 93: Tcc_I	tne	icc_or_xcc, %r0 + 53
mondo_7_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d900007  ! 94: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0xa1902002  ! 95: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790208a  ! 96: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_7_47:
	set 0x60340000, %r31
	.word 0x8585379a  ! 100: WRCCR_I	wr	%r20, 0x179a, %ccr
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_7_49:
	nop
	setx 0xfffffc06fffff6a9, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_7_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f4, %f14
	.word 0xa1b1c30d  ! 103: ALIGNADDRESS	alignaddr	%r7, %r13, %r16
	.word 0x87902219  ! 104: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
splash_cmpr_7_51:
	setx 0xf38784f63c86b852, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 106: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe6800be0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_52) + 0, 16, 16)) -> intp(0,0,29)
intvec_7_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_7_53:
    set user_data_start, %o7
	.word 0x93902006  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_7_54:
	set user_data_start, %r31
	.word 0x8580b67d  ! 111: WRCCR_I	wr	%r2, 0x167d, %ccr
intveclr_7_55:
	setx 0xf69c4546272c3e8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xa9540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0x9b450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0x904ac014  ! 116: MULX_R	mulx 	%r11, %r20, %r8
	.word 0x9f8037d2  ! 117: SIR	sir	0x17d2
	.word 0xd497e000  ! 118: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_56) + 8, 16, 16)) -> intp(2,0,24)
intvec_7_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_57:
	setx 0x7eb8e6db5128e71a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_7_58:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x83d020b2  ! 127: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x91a00168  ! 128: FABSq	dis not found

	.word 0x99500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x87902219  ! 130: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
splash_cmpr_7_60:
	setx 0xe503675f4e674978, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_7_61:
    set user_data_start, %o7
	.word 0x93902006  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90200e  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x000e, %pstate
	.word 0x87802016  ! 135: WRASI_I	wr	%r0, 0x0016, %asi
cwp_7_62:
    set user_data_start, %o7
	.word 0x93902007  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902000  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0xa4827da6  ! 139: ADDcc_I	addcc 	%r9, 0xfffffda6, %r18
debug_7_63:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 140: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0xd48008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_64:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_65:
	setx 0x98964e31c2c34563, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_66:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_7_67:
	setx 0x9b0c0f41e14f72b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790215b  ! 147: WRPR_TT_I	wrpr	%r0, 0x015b, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_7_68:
	set 0x60140000, %r31
	.word 0x8582b36a  ! 149: WRCCR_I	wr	%r10, 0x136a, %ccr
splash_lsu_7_69:
	setx 0xdad4868ac36f1ce5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_70:
	setx 0xdaaf828d74f01360, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_72) + 32, 16, 16)) -> intp(5,0,31)
intvec_7_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902186  ! 154: WRPR_TT_I	wrpr	%r0, 0x0186, %tt
debug_7_73:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_7_74:
	setx 0x7e6e0d5fbfc5dc0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 158: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e020  ! 159: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
DS_7_75:
	.word 0x93a249c5  ! 1: FDIVd	fdivd	%f40, %f36, %f40
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe2880e80  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x74, %r17
	.word 0x91d02032  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe28008a0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_7_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f12, %f12
	.word 0x99b08308  ! 164: ALIGNADDRESS	alignaddr	%r2, %r8, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_77:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 165: RDPC	rd	%pc, %r12
splash_cmpr_7_78:
	setx 0xd5ed40d798903c5a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903e71  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x1e71, %pstate
	rd %pc, %r19
	add %r19, (ivw_7_79-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_79:
	.word 0x91914010  ! 168: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0xa784f9e8  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x19e8, %-
debug_7_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_7_81:
    set user_data_start, %o7
	.word 0x93902003  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916abeff  ! 172: SDIVX_I	sdivx	%r10, 0xfffffeff, %r8
	setx 0xe8286c049b0e2902, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902377  ! 174: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a764c  ! 175: SDIVX_I	sdivx	%r9, 0xfffff64c, %r8
debug_7_85:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe2800ae0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r17
tagged_7_86:
	tsubcctv %r23, 0x1d64, %r6
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d9023b0  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x03b0, %pstate
	.word 0x8780208b  ! 181: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xa1902003  ! 182: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_7_87:
	setx 0x72f36ef76e22e6bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 184: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_7_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d908006  ! 185: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_7_89:
	.word 0x81982d4f  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
intveclr_7_90:
	setx 0x37b9b710d75d78a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_7_91-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_91:
	.word 0x91948012  ! 189: WRPR_PIL_R	wrpr	%r18, %r18, %pil
debug_7_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 191: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_7_93:
	setx 0x4a68167adb34e891, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a00162  ! 193: FABSq	dis not found

	.word 0xa78063c8  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x03c8, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_94:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 195: RDPC	rd	%pc, %r20
	.word 0x8790210c  ! 196: WRPR_TT_I	wrpr	%r0, 0x010c, %tt
intveclr_7_95:
	setx 0xa529eac9afcd4a62, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_96:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_7_97:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_98-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_98:
	.word 0x91940007  ! 200: WRPR_PIL_R	wrpr	%r16, %r7, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_7_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d94c00c  ! 202: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
DS_7_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd8800b80  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r12
splash_tba_7_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_7_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91c00c  ! 206: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	setx 0x086f0b410572cf16, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_104:
	.word 0x8f902000  ! 208: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 209: FqTOd	dis not found

splash_cmpr_7_106:
	setx 0xecfc1478f990fdea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790216c  ! 212: WRPR_TT_I	wrpr	%r0, 0x016c, %tt
	.word 0x91a109d1  ! 213: FDIVd	fdivd	%f4, %f48, %f8
mondo_7_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d904004  ! 214: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_7_108:
	setx 0xb3a7499186650d74, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_7_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_7_110-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_110:
	.word 0x91900013  ! 219: WRPR_PIL_R	wrpr	%r0, %r19, %pil
splash_cmpr_7_111:
	setx 0xf926324ea864e0d0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa5a00165  ! 223: FABSq	dis not found

memptr_7_112:
	set 0x60340000, %r31
	.word 0x8581b2ef  ! 224: WRCCR_I	wr	%r6, 0x12ef, %ccr
splash_hpstate_7_113:
	.word 0x81982346  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
DS_7_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd57bcdd5	! Random illegal ?
	.word 0xe510c004  ! 1: LDQF_R	-	[%r3, %r4], %f18
	.word 0xa9a24831  ! 226: FADDs	fadds	%f9, %f17, %f20
splash_cmpr_7_115:
	setx 0x1704d72f4cdc83a5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_116:
    set user_data_start, %o7
	.word 0x93902003  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe4900e80  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
memptr_7_117:
	set user_data_start, %r31
	.word 0x85823d78  ! 230: WRCCR_I	wr	%r8, 0x1d78, %ccr
	.word 0x91d02033  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200f  ! 232: WRPR_GL_I	wrpr	%r0, 0x000f, %-
mondo_7_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 233: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
change_to_randtl_7_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_119:
	.word 0x8f902001  ! 234: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cb811  ! 236: SDIVX_I	sdivx	%r18, 0xfffff811, %r18
	.word 0x8d903c1c  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1c1c, %pstate
mondo_7_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d90c013  ! 238: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0xad82f2a5  ! 239: WR_SOFTINT_REG_I	wr	%r11, 0x12a5, %softint
	.word 0xa1902004  ! 240: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd29004a0  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd2800be0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
splash_cmpr_7_122:
	setx 0x1098063920013b7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_123:
	taddcctv %r10, 0x1188, %r21
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_7_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x8d902789  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0789, %pstate
debug_7_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e020  ! 249: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
memptr_7_126:
	set user_data_start, %r31
	.word 0x8582f4eb  ! 250: WRCCR_I	wr	%r11, 0x14eb, %ccr
	.word 0x8d802004  ! 251: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_7_127:
	.word 0x81982354  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0354, %hpstate
tagged_7_128:
	tsubcctv %r17, 0x171b, %r24
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 254: RDPC	rd	%pc, %r12
	.word 0x8780208a  ! 255: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_7_130:
	setx 0xf0676c8b7445adef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa780400a  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r10, %-
splash_htba_7_132:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_7_133:
	nop
	setx 0xfffff8aafffffb98, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95686bd5  ! 262: SDIVX_I	sdivx	%r1, 0x0bd5, %r10
	.word 0x879023e0  ! 263: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956b7e24  ! 264: SDIVX_I	sdivx	%r13, 0xfffffe24, %r10
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_7_137:
	setx 0x7f89fd52063d5911, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 269: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_7_138:
	setx 0xe1083cce814b0eee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_139:
	.word 0x8198220d  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020d, %hpstate
	.word 0x87902338  ! 272: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
splash_tba_7_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_141:
	setx 0x002d58acffb6f9ab, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_142:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_7_143:
	setx 0x3d00e620530cc59f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d80e60  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x73, %r12
	.word 0x8d902cf3  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x0cf3, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 279: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_7_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 280: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
tagged_7_145:
	taddcctv %r5, 0x17f2, %r22
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad832a92  ! 282: WR_SOFTINT_REG_I	wr	%r12, 0x0a92, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_146) + 56, 16, 16)) -> intp(2,0,30)
intvec_7_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_7_147:
	set user_data_start, %r31
	.word 0x8580e3f5  ! 284: WRCCR_I	wr	%r3, 0x03f5, %ccr
splash_cmpr_7_148:
	setx 0xa128290b66cb5b3b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa984000c  ! 286: WR_SET_SOFTINT_R	wr	%r16, %r12, %set_softint
	.word 0x9f80347f  ! 287: SIR	sir	0x147f
	.word 0x879023ee  ! 288: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
	.word 0x91d020b3  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_7_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879022d2  ! 291: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_150:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 292: RDPC	rd	%pc, %r10
debug_7_151:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_152:
	.word 0x9190c000  ! 294: WRPR_PIL_R	wrpr	%r3, %r0, %pil
	setx 0xdcfda4989ae10ebe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_7_154:
	set 0x60740000, %r31
	.word 0x85847d90  ! 296: WRCCR_I	wr	%r17, 0x1d90, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_7_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_156:
	setx 0x934b98191694958c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02032  ! 300: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_7_157:
	setx 0x80bb088479770106, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_7_158-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_158:
	.word 0x91924001  ! 302: WRPR_PIL_R	wrpr	%r9, %r1, %pil
splash_hpstate_7_159:
	.word 0x8198287c  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x087c, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 305: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xd4800b80  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
splash_lsu_7_161:
	setx 0x688097456bdbd24b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_7_162:
	setx 0xbdabeccb3d1a817b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_7_163:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_164:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 311: RDPC	rd	%pc, %r13
DS_7_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b44308  ! 312: ALIGNADDRESS	alignaddr	%r17, %r8, %r17
	.word 0xab80a239  ! 313: WR_CLEAR_SOFTINT_I	wr	%r2, 0x0239, %clear_softint
	.word 0xd8d004a0  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 315: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_7_167:
	setx 0x64091c21c1bdca0b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_cmpr_7_168:
	setx 0xf5c9486a86e988cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_169:
	setx 0x44402af59f56f219, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_170:
	setx 0x329e4f0510dbb0de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_171:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 322: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xd6d00e80  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r11
splash_tba_7_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa7804011  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r17, %-
	.word 0xd6c7e020  ! 327: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad81ec0e  ! 329: WR_SOFTINT_REG_I	wr	%r7, 0x0c0e, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 331: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 332: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36969f3  ! 333: SDIVX_I	sdivx	%r5, 0x09f3, %r17
	.word 0xa5a14d22  ! 334: FsMULd	fsmuld	%f5, %f2, %f18
	.word 0x8d90262e  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x062e, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_7_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a1c9c1  ! 1: FDIVd	fdivd	%f38, %f32, %f40
	.word 0xa1a28820  ! 337: FADDs	fadds	%f10, %f0, %f16
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa1414000  ! 338: RDPC	rd	%pc, %r16
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_7_178:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_7_180:
	setx 0x37ea8f5bedd051e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_7_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_181-donret_7_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_7_183:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_7_184-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_184:
	.word 0x9194400b  ! 348: WRPR_PIL_R	wrpr	%r17, %r11, %pil
debug_7_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_7_186:
	tsubcctv %r3, 0x1359, %r14
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa190200b  ! 352: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_7_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a00542  ! 1: FSQRTd	fsqrt	
	.word 0x9ba10822  ! 353: FADDs	fadds	%f4, %f2, %f13
tagged_7_188:
	tsubcctv %r6, 0x1601, %r10
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 355: FqTOd	dis not found

debug_7_190:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97520000  ! 358: RDPR_PIL	rdpr	%pil, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_192:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 359: RDPC	rd	%pc, %r11
memptr_7_193:
	set 0x60140000, %r31
	.word 0x85826e80  ! 360: WRCCR_I	wr	%r9, 0x0e80, %ccr
mondo_7_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 361: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
pmu_7_195:
	nop
	setx 0xfffff488fffff06f, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_7_196:
	setx 0xe9e92fc006e14ccc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa7814011  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r17, %-
	.word 0xe8880e80  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
debug_7_198:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 368: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
mondo_7_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d91800d  ! 369: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686007  ! 371: SDIVX_I	sdivx	%r1, 0x0007, %r9
splash_tba_7_201:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_7_202:
	set 0x60140000, %r31
	.word 0x8580acee  ! 374: WRCCR_I	wr	%r2, 0x0cee, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_203:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 376: RDPC	rd	%pc, %r11
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_7_204:
	.word 0x91a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f8
	allclean
	.word 0xa3b18309  ! 378: ALIGNADDRESS	alignaddr	%r6, %r9, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c3024  ! 379: SDIVX_I	sdivx	%r16, 0xfffff024, %r19
	.word 0x919369d5  ! 380: WRPR_PIL_I	wrpr	%r13, 0x09d5, %pil
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 381: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800b40  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r8
change_to_randtl_7_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_206:
	.word 0x8f902002  ! 384: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	rd %pc, %r19
	add %r19, (ivw_7_207-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_207:
	.word 0x91934008  ! 385: WRPR_PIL_R	wrpr	%r13, %r8, %pil
	.word 0x93d020b4  ! 386: Tcc_I	tne	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_208:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 387: RDPC	rd	%pc, %r19
	.word 0x8d903ef1  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x1ef1, %pstate
memptr_7_209:
	set 0x60340000, %r31
	.word 0x8580a3ea  ! 389: WRCCR_I	wr	%r2, 0x03ea, %ccr
memptr_7_210:
	set user_data_start, %r31
	.word 0x85843022  ! 390: WRCCR_I	wr	%r16, 0x1022, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902004  ! 392: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_7_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9350005  ! 1: STQF_R	-	%f12, [%r5, %r20]
	normalw
	.word 0x99458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d902178  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0178, %pstate
change_to_randtl_7_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_213:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x97688012  ! 398: SDIVX_R	sdivx	%r2, %r18, %r11
splash_lsu_7_214:
	setx 0x7bf697d1fbf7b7f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xa9818005  ! 1: WR_SET_SOFTINT_R	wr	%r6, %r5, %set_softint
	.word 0x9f803270  ! 2: SIR	sir	0x1270
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01972  ! 4: FqTOd	dis not found

splash_lsu_6_1:
	setx 0xb1df58906ed66ba5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_2:
	setx 0xb5487d82ee34ea23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c00b  ! 7: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
	.word 0xa7454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x97a00dd2  ! 9: FdMULq	fdmulq	
DS_6_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9883400c  ! 11: ADDcc_R	addcc 	%r13, %r12, %r12
cwp_6_5:
    set user_data_start, %o7
	.word 0x93902002  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d902f73  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0f73, %pstate
	.word 0xe8dfe030  ! 15: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x87902236  ! 16: WRPR_TT_I	wrpr	%r0, 0x0236, %tt
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_6_6:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 18: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x91520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d9028b5  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x08b5, %pstate
intveclr_6_7:
	setx 0x85768236ed0c6377, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d91000a  ! 22: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_6_9:
	set user_data_start, %r31
	.word 0x85812891  ! 24: WRCCR_I	wr	%r4, 0x0891, %ccr
	.word 0x93d020b2  ! 25: Tcc_I	tne	icc_or_xcc, %r0 + 178
tagged_6_10:
	tsubcctv %r23, 0x1340, %r5
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x879023c2  ! 27: WRPR_TT_I	wrpr	%r0, 0x03c2, %tt
	.word 0x8d802004  ! 28: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd6800c20  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0x87902317  ! 30: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_11:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 31: RDPC	rd	%pc, %r17
debug_6_12:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 32: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_6_13:
	.word 0x8198221d  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x879021b4  ! 38: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0xe5d783f86d9caaf2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_16:
	.word 0x81982e47  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
pmu_6_17:
	nop
	setx 0xfffff56cfffffff9, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_6_18:
	setx 0x7afe9e9a37445719, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_6_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_6_20:
	tsubcctv %r17, 0x1357, %r6
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa981c003  ! 47: WR_SET_SOFTINT_R	wr	%r7, %r3, %set_softint
cwp_6_21:
    set user_data_start, %o7
	.word 0x93902003  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_22) + 16, 16, 16)) -> intp(5,0,11)
intvec_6_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab81c006  ! 50: WR_CLEAR_SOFTINT_R	wr	%r7, %r6, %clear_softint
	.word 0x91d02035  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_6_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad80ef98  ! 56: WR_SOFTINT_REG_I	wr	%r3, 0x0f98, %softint
	setx 0xfc6b557264996c95, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 58: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x9b500000  ! 60: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_6_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_6_27:
	set user_data_start, %r31
	.word 0x8580e37d  ! 63: WRCCR_I	wr	%r3, 0x037d, %ccr
splash_tba_6_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_6_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x90d94005  ! 66: SMULcc_R	smulcc 	%r5, %r5, %r8
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
	.word 0x95414000  ! 67: RDPC	rd	%pc, %r10
	.word 0x8d902576  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0576, %pstate
	.word 0x9350c000  ! 69: RDPR_TT	rdpr	%tt, %r9
memptr_6_31:
	set 0x60740000, %r31
	.word 0x8580ab56  ! 70: WRCCR_I	wr	%r2, 0x0b56, %ccr
mondo_6_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d944000  ! 71: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x92fa8011  ! 74: SDIVcc_R	sdivcc 	%r10, %r17, %r9
	.word 0xd4900e40  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x72, %r10
DS_6_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa9a149c3  ! 1: FDIVd	fdivd	%f36, %f34, %f20
	normalw
	.word 0xa1458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r16
cwp_6_34:
    set user_data_start, %o7
	.word 0x93902005  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_35)+32, 16, 16)) -> intp(6,1,3)
xir_6_35:
	.word 0xa982be74  ! 78: WR_SET_SOFTINT_I	wr	%r10, 0x1e74, %set_softint
memptr_6_36:
	set user_data_start, %r31
	.word 0x8580efc2  ! 79: WRCCR_I	wr	%r3, 0x0fc2, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 80: RDPC	rd	%pc, %r18
	.word 0xd6c80e40  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_38:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 82: RDPC	rd	%pc, %r12
debug_6_39:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 83: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
cwp_6_40:
    set user_data_start, %o7
	.word 0x93902006  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd68008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_6_41:
	setx 0x6064a08574d1ea30, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976af554  ! 87: SDIVX_I	sdivx	%r11, 0xfffff554, %r11
debug_6_43:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902430  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0430, %pstate
	.word 0x9f80372c  ! 90: SIR	sir	0x172c
	.word 0xa1902008  ! 91: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_6_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 92: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x91d02032  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_6_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d914007  ! 94: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0xa1902002  ! 95: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790208e  ! 96: WRPR_TT_I	wrpr	%r0, 0x008e, %tt
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_6_47:
	set 0x60140000, %r31
	.word 0x85823c9c  ! 100: WRCCR_I	wr	%r8, 0x1c9c, %ccr
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_6_49:
	nop
	setx 0xffffffa0fffff741, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_6_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f20, %f28
	.word 0x95b48307  ! 103: ALIGNADDRESS	alignaddr	%r18, %r7, %r10
	.word 0x879023a9  ! 104: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
splash_cmpr_6_51:
	setx 0x573c6304432db35c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 106: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe68008a0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_52) + 56, 16, 16)) -> intp(4,0,8)
intvec_6_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_6_53:
    set user_data_start, %o7
	.word 0x93902007  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_6_54:
	set user_data_start, %r31
	.word 0x85852b3a  ! 111: WRCCR_I	wr	%r20, 0x0b3a, %ccr
intveclr_6_55:
	setx 0x4ec8494daef70a9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xa5540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0xa1450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xa048c011  ! 116: MULX_R	mulx 	%r3, %r17, %r16
	.word 0x9f802042  ! 117: SIR	sir	0x0042
	.word 0xd497e020  ! 118: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_56) + 0, 16, 16)) -> intp(3,0,27)
intvec_6_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_57:
	setx 0xa35c8e0d5d39a2d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c00e80  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
debug_6_58:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d02033  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa3a00167  ! 128: FABSq	dis not found

	.word 0x95500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x879023a4  ! 130: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
splash_cmpr_6_60:
	setx 0x61565642e7ad1a5f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_6_61:
    set user_data_start, %o7
	.word 0x93902006  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902405  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x0405, %pstate
	.word 0x87802004  ! 135: WRASI_I	wr	%r0, 0x0004, %asi
cwp_6_62:
    set user_data_start, %o7
	.word 0x93902006  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99902001  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0xa2837d40  ! 139: ADDcc_I	addcc 	%r13, 0xfffffd40, %r17
debug_6_63:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 140: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xd48008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_64:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_65:
	setx 0xe63e2d32b5a65552, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_66:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_6_67:
	setx 0x6f539fca73ab26b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902377  ! 147: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_6_68:
	set 0x60140000, %r31
	.word 0x8580f0db  ! 149: WRCCR_I	wr	%r3, 0x10db, %ccr
splash_lsu_6_69:
	setx 0xb1f74751c97a23ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_70:
	setx 0x37416f9ede106236, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_72) + 32, 16, 16)) -> intp(3,0,19)
intvec_6_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902161  ! 154: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
debug_6_73:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_6_74:
	setx 0x25718348568e043a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 158: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e000  ! 159: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_6_75:
	.word 0xa5a4c9c8  ! 1: FDIVd	fdivd	%f50, %f8, %f18
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x91d02033  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe28008a0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_6_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f22, %f22, %f30
	.word 0x91b50301  ! 164: ALIGNADDRESS	alignaddr	%r20, %r1, %r8
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_77:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 165: RDPC	rd	%pc, %r17
splash_cmpr_6_78:
	setx 0x3457159d2d0252c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902d5c  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0d5c, %pstate
	rd %pc, %r19
	add %r19, (ivw_6_79-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_79:
	.word 0x9192c00b  ! 168: WRPR_PIL_R	wrpr	%r11, %r11, %pil
	.word 0xa7812f17  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x0f17, %-
debug_6_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_6_81:
    set user_data_start, %o7
	.word 0x93902001  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5696db9  ! 172: SDIVX_I	sdivx	%r5, 0x0db9, %r18
	setx 0x6e46e4cce0b2e158, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902059  ! 174: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9683816  ! 175: SDIVX_I	sdivx	%r0, 0xfffff816, %r20
debug_6_85:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_6_86:
	tsubcctv %r2, 0x13d4, %r4
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d9038d3  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x18d3, %pstate
	.word 0x87802014  ! 181: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa1902005  ! 182: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_6_87:
	setx 0x241fc4a16f4e1519, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_6_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d944012  ! 185: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_6_89:
	.word 0x81982ecc  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
intveclr_6_90:
	setx 0x9db109f9aad1fe36, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_6_91-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_91:
	.word 0x91950010  ! 189: WRPR_PIL_R	wrpr	%r20, %r16, %pil
debug_6_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 191: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_6_93:
	setx 0xeeee86f9a00ddd45, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00164  ! 193: FABSq	dis not found

	.word 0xa78078d8  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x18d8, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_94:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 195: RDPC	rd	%pc, %r8
	.word 0x879020f0  ! 196: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
intveclr_6_95:
	setx 0xef70e7326791abb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_96:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_6_97:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_98-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_98:
	.word 0x91930002  ! 200: WRPR_PIL_R	wrpr	%r12, %r2, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_6_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 202: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
DS_6_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd8800c60  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
splash_tba_6_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_6_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d95000d  ! 206: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	setx 0xc83209de6d14c6d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_104:
	.word 0x8f902000  ! 208: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01969  ! 209: FqTOd	dis not found

splash_cmpr_6_106:
	setx 0x7ed1af5c78dfb993, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023df  ! 212: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0x99a409d1  ! 213: FDIVd	fdivd	%f16, %f48, %f12
mondo_6_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d90400a  ! 214: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_6_108:
	setx 0xcc3242907fec763b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_6_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_6_110-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_110:
	.word 0x91930003  ! 219: WRPR_PIL_R	wrpr	%r12, %r3, %pil
splash_cmpr_6_111:
	setx 0xd2144c4d3919e3da, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x95a0016d  ! 223: FABSq	dis not found

memptr_6_112:
	set 0x60540000, %r31
	.word 0x8580b61a  ! 224: WRCCR_I	wr	%r2, 0x161a, %ccr
splash_hpstate_6_113:
	.word 0x81982795  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
DS_6_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x994b9029	! Random illegal ?
	.word 0xd9150010  ! 1: LDQF_R	-	[%r20, %r16], %f12
	.word 0x99a4882c  ! 226: FADDs	fadds	%f18, %f12, %f12
splash_cmpr_6_115:
	setx 0x8a41a39e743ab1ee, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_116:
    set user_data_start, %o7
	.word 0x93902004  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_6_117:
	set user_data_start, %r31
	.word 0x8582bcf5  ! 230: WRCCR_I	wr	%r10, 0x1cf5, %ccr
	.word 0x91d02033  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200e  ! 232: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_6_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 233: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
change_to_randtl_6_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_119:
	.word 0x8f902003  ! 234: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16b7831  ! 236: SDIVX_I	sdivx	%r13, 0xfffff831, %r16
	.word 0x8d902abe  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0abe, %pstate
mondo_6_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d904014  ! 238: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xad813f9b  ! 239: WR_SOFTINT_REG_I	wr	%r4, 0x1f9b, %softint
	.word 0xa1902006  ! 240: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd2900e40  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x72, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_6_122:
	setx 0x57b69dea03767eb2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_123:
	taddcctv %r15, 0x1896, %r9
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_6_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x8d9038c1  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x18c1, %pstate
debug_6_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e010  ! 249: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
memptr_6_126:
	set user_data_start, %r31
	.word 0x858075c2  ! 250: WRCCR_I	wr	%r1, 0x15c2, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_6_127:
	.word 0x81982cc7  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
tagged_6_128:
	tsubcctv %r8, 0x1459, %r10
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 254: RDPC	rd	%pc, %r8
	.word 0x8780201c  ! 255: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_6_130:
	setx 0x44f5f184cb64942f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_6_131:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa780400d  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r13, %-
splash_htba_6_132:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_6_133:
	nop
	setx 0xfffffd37fffffde8, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b6bd8  ! 262: SDIVX_I	sdivx	%r13, 0x0bd8, %r10
	.word 0x879022af  ! 263: WRPR_TT_I	wrpr	%r0, 0x02af, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956b7033  ! 264: SDIVX_I	sdivx	%r13, 0xfffff033, %r10
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_6_137:
	setx 0x7d809c747654a4ea, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 268: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 269: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_6_138:
	setx 0xbc4b16c01d4fda4d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_139:
	.word 0x81982acf  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
	.word 0x879022e2  ! 272: WRPR_TT_I	wrpr	%r0, 0x02e2, %tt
splash_tba_6_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_141:
	setx 0x911239b336521945, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_142:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_6_143:
	setx 0xa4b24c32aaa8f4be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d804a0  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d902aff  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x0aff, %pstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 279: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_6_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d908009  ! 280: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
tagged_6_145:
	taddcctv %r25, 0x150d, %r21
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad817864  ! 282: WR_SOFTINT_REG_I	wr	%r5, 0x1864, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_146) + 56, 16, 16)) -> intp(4,0,29)
intvec_6_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_6_147:
	set user_data_start, %r31
	.word 0x8584bdf0  ! 284: WRCCR_I	wr	%r18, 0x1df0, %ccr
splash_cmpr_6_148:
	setx 0x9c302d0e57acb605, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa982c007  ! 286: WR_SET_SOFTINT_R	wr	%r11, %r7, %set_softint
	.word 0x9f8031c2  ! 287: SIR	sir	0x11c2
	.word 0x87902103  ! 288: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0x83d02032  ! 289: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_6_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902117  ! 291: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_150:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 292: RDPC	rd	%pc, %r8
debug_6_151:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_152-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_152:
	.word 0x9191c001  ! 294: WRPR_PIL_R	wrpr	%r7, %r1, %pil
	setx 0x633de0b7a45ab690, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_6_154:
	set 0x60140000, %r31
	.word 0x8581ae89  ! 296: WRCCR_I	wr	%r6, 0x0e89, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_6_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_156:
	setx 0x310e91d62422d351, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_cmpr_6_157:
	setx 0xb645919a731b55ab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_6_158-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_158:
	.word 0x9194c00d  ! 302: WRPR_PIL_R	wrpr	%r19, %r13, %pil
splash_hpstate_6_159:
	.word 0x8198220d  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020d, %hpstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d928004  ! 305: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
	.word 0xd48008a0  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_6_161:
	setx 0xaae746e08b01f0f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_6_162:
	setx 0x5a4d7fc9971c076e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_6_163:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_164:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 311: RDPC	rd	%pc, %r10
DS_6_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b48302  ! 312: ALIGNADDRESS	alignaddr	%r18, %r2, %r9
	.word 0xab8526ea  ! 313: WR_CLEAR_SOFTINT_I	wr	%r20, 0x06ea, %clear_softint
	.word 0xd8d004a0  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 315: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_6_167:
	setx 0x2ab901d6b8f8895f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_6_168:
	setx 0x8105f936bfe9adb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_169:
	setx 0xe743b9ce04022e3d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_170:
	setx 0x48933db859143535, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_171:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 322: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xd6d00e40  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
splash_tba_6_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
splash_decr_6_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7850004  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r4, %-
	.word 0xd6c7e010  ! 327: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad823fcd  ! 329: WR_SOFTINT_REG_I	wr	%r8, 0x1fcd, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 332: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968bebe  ! 333: SDIVX_I	sdivx	%r2, 0xfffffebe, %r12
	.word 0x99a44d29  ! 334: FsMULd	fsmuld	%f17, %f40, %f12
	.word 0x8d903a91  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x1a91, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_6_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba349c6  ! 1: FDIVd	fdivd	%f44, %f6, %f44
	.word 0x99a3082b  ! 337: FADDs	fadds	%f12, %f11, %f12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x95414000  ! 338: RDPC	rd	%pc, %r10
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_6_178:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_6_180:
	setx 0x284715ee8ce080fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_6_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_181-donret_6_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_6_183:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_6_184-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_184:
	.word 0x91934001  ! 348: WRPR_PIL_R	wrpr	%r13, %r1, %pil
debug_6_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_6_186:
	tsubcctv %r18, 0x1b60, %r5
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa190200c  ! 352: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_6_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa3a4c834  ! 353: FADDs	fadds	%f19, %f20, %f17
tagged_6_188:
	tsubcctv %r4, 0x155c, %r17
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 355: FqTOd	dis not found

debug_6_190:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93520000  ! 358: RDPR_PIL	rdpr	%pil, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_192:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 359: RDPC	rd	%pc, %r9
memptr_6_193:
	set 0x60740000, %r31
	.word 0x85822d9e  ! 360: WRCCR_I	wr	%r8, 0x0d9e, %ccr
mondo_6_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d908001  ! 361: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
pmu_6_195:
	nop
	setx 0xfffff3c7fffffac2, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_6_196:
	setx 0x547a2e349d9fbf20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
splash_decr_6_197:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa784c00b  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r11, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
debug_6_198:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 368: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
mondo_6_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940006  ! 369: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36b7df3  ! 371: SDIVX_I	sdivx	%r13, 0xfffffdf3, %r17
splash_tba_6_201:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_6_202:
	set 0x60340000, %r31
	.word 0x85822ccf  ! 374: WRCCR_I	wr	%r8, 0x0ccf, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_203:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 376: RDPC	rd	%pc, %r12
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_6_204:
	.word 0xa7a2c9c6  ! 1: FDIVd	fdivd	%f42, %f6, %f50
	allclean
	.word 0xa3b20314  ! 378: ALIGNADDRESS	alignaddr	%r8, %r20, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa368edb7  ! 379: SDIVX_I	sdivx	%r3, 0x0db7, %r17
	.word 0x9192b143  ! 380: WRPR_PIL_I	wrpr	%r10, 0x1143, %pil
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_6_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_206:
	.word 0x8f902001  ! 384: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_6_207-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_207:
	.word 0x91948013  ! 385: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0x91d02034  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_208:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 387: RDPC	rd	%pc, %r8
	.word 0x8d9027ad  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x07ad, %pstate
memptr_6_209:
	set 0x60540000, %r31
	.word 0x8584a2f4  ! 389: WRCCR_I	wr	%r18, 0x02f4, %ccr
memptr_6_210:
	set user_data_start, %r31
	.word 0x85806220  ! 390: WRCCR_I	wr	%r1, 0x0220, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa190200c  ! 392: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_6_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd334000d  ! 1: STQF_R	-	%f9, [%r13, %r16]
	normalw
	.word 0x97458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902684  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
change_to_randtl_6_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_213:
	.word 0x8f902001  ! 397: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa568800c  ! 398: SDIVX_R	sdivx	%r2, %r12, %r18
splash_lsu_6_214:
	setx 0x48c20608cf9b6065, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xa983000a  ! 1: WR_SET_SOFTINT_R	wr	%r12, %r10, %set_softint
	.word 0x9f803fce  ! 2: SIR	sir	0x1fce
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196d  ! 4: FqTOd	dis not found

splash_lsu_5_1:
	setx 0x7d286ea1a9b5a4ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_2:
	setx 0x8aa69766a51813d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c00c  ! 7: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x93454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x99a18dca  ! 9: FdMULq	fdmulq	
DS_5_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x98850000  ! 11: ADDcc_R	addcc 	%r20, %r0, %r12
cwp_5_5:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d903605  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1605, %pstate
	.word 0xe8dfe030  ! 15: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x879023a9  ! 16: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_5_6:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 18: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x97520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d902ee2  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0ee2, %pstate
intveclr_5_7:
	setx 0x8518087b37c60ea1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d920009  ! 22: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_5_9:
	set user_data_start, %r31
	.word 0x8584783f  ! 24: WRCCR_I	wr	%r17, 0x183f, %ccr
	.word 0x91d02035  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_5_10:
	tsubcctv %r25, 0x1016, %r9
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x879022a3  ! 27: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	.word 0x8d802000  ! 28: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68008a0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879023bc  ! 30: WRPR_TT_I	wrpr	%r0, 0x03bc, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_11:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 31: RDPC	rd	%pc, %r11
debug_5_12:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 32: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_5_13:
	.word 0x81982314  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0314, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x879020c7  ! 38: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0xf1423ace0e7bdfd3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_16:
	.word 0x8198230c  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030c, %hpstate
pmu_5_17:
	nop
	setx 0xfffff95bfffff121, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_5_18:
	setx 0x7275a86b2caa66a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800b40  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
DS_5_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_5_20:
	tsubcctv %r9, 0x11de, %r2
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa981c005  ! 47: WR_SET_SOFTINT_R	wr	%r7, %r5, %set_softint
cwp_5_21:
    set user_data_start, %o7
	.word 0x93902005  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_22) + 40, 16, 16)) -> intp(4,0,5)
intvec_5_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab830003  ! 50: WR_CLEAR_SOFTINT_R	wr	%r12, %r3, %clear_softint
	.word 0x91d020b5  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 52: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_5_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad84aaaf  ! 56: WR_SOFTINT_REG_I	wr	%r18, 0x0aaf, %softint
	setx 0x34c5cedd4e318f2d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 58: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa3500000  ! 60: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_5_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_5_27:
	set user_data_start, %r31
	.word 0x8581212f  ! 63: WRCCR_I	wr	%r4, 0x012f, %ccr
splash_tba_5_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_5_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x92d84007  ! 66: SMULcc_R	smulcc 	%r1, %r7, %r9
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
	.word 0x95414000  ! 67: RDPC	rd	%pc, %r10
	.word 0x8d9024bd  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x04bd, %pstate
	.word 0xa550c000  ! 69: RDPR_TT	rdpr	%tt, %r18
memptr_5_31:
	set 0x60740000, %r31
	.word 0x8582b5e5  ! 70: WRCCR_I	wr	%r10, 0x15e5, %ccr
mondo_5_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d92c004  ! 71: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800c80  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	.word 0x90f90013  ! 74: SDIVcc_R	sdivcc 	%r4, %r19, %r8
	.word 0xd4900e60  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x73, %r10
DS_5_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x91a109c6  ! 1: FDIVd	fdivd	%f4, %f6, %f8
	normalw
	.word 0x95458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r10
cwp_5_34:
    set user_data_start, %o7
	.word 0x93902000  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_35)+40, 16, 16)) -> intp(5,1,3)
xir_5_35:
	.word 0xa982324b  ! 78: WR_SET_SOFTINT_I	wr	%r8, 0x124b, %set_softint
memptr_5_36:
	set user_data_start, %r31
	.word 0x8582f6b1  ! 79: WRCCR_I	wr	%r11, 0x16b1, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_37:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 80: RDPC	rd	%pc, %r13
	.word 0xd6c804a0  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_38:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 82: RDPC	rd	%pc, %r13
debug_5_39:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 83: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
cwp_5_40:
    set user_data_start, %o7
	.word 0x93902003  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd6800ac0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
splash_cmpr_5_41:
	setx 0x31516e0f765a8905, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cb7ac  ! 87: SDIVX_I	sdivx	%r18, 0xfffff7ac, %r11
debug_5_43:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902668  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0668, %pstate
	.word 0x9f8020a7  ! 90: SIR	sir	0x00a7
	.word 0xa190200c  ! 91: WRPR_GL_I	wrpr	%r0, 0x000c, %-
mondo_5_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 92: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x83d02034  ! 93: Tcc_I	te	icc_or_xcc, %r0 + 52
mondo_5_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d924005  ! 94: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
	.word 0xa190200d  ! 95: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902304  ! 96: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_5_47:
	set 0x60540000, %r31
	.word 0x8584ea09  ! 100: WRCCR_I	wr	%r19, 0x0a09, %ccr
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_5_49:
	nop
	setx 0xfffff8a2fffff1a6, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_5_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f26, %f6
	.word 0x95b40313  ! 103: ALIGNADDRESS	alignaddr	%r16, %r19, %r10
	.word 0x879023ae  ! 104: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
splash_cmpr_5_51:
	setx 0x01fbe64d276f9e9e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 106: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe68008a0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_52) + 8, 16, 16)) -> intp(7,0,8)
intvec_5_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_5_53:
    set user_data_start, %o7
	.word 0x93902007  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_5_54:
	set user_data_start, %r31
	.word 0x8580b957  ! 111: WRCCR_I	wr	%r2, 0x1957, %ccr
intveclr_5_55:
	setx 0x3b1dcd801d86c9af, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xa9540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0xa5450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xa24d0009  ! 116: MULX_R	mulx 	%r20, %r9, %r17
	.word 0x9f8032c7  ! 117: SIR	sir	0x12c7
	.word 0xd497e020  ! 118: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_56) + 48, 16, 16)) -> intp(1,0,31)
intvec_5_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_57:
	setx 0xf57f01d14660647f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_5_58:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x83d02033  ! 127: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93a00163  ! 128: FABSq	dis not found

	.word 0x93500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x8790232b  ! 130: WRPR_TT_I	wrpr	%r0, 0x032b, %tt
splash_cmpr_5_60:
	setx 0x2fdc104d0c66f2ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_5_61:
    set user_data_start, %o7
	.word 0x93902003  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903372  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x1372, %pstate
	.word 0x87802020  ! 135: WRASI_I	wr	%r0, 0x0020, %asi
cwp_5_62:
    set user_data_start, %o7
	.word 0x93902002  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902003  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0xa882ac48  ! 139: ADDcc_I	addcc 	%r10, 0x0c48, %r20
debug_5_63:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 140: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xd4800b20  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_64:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_65:
	setx 0xa6a537ed2ec1a847, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_66:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_5_67:
	setx 0x0c8efbc548fd9bb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879020ec  ! 147: WRPR_TT_I	wrpr	%r0, 0x00ec, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_5_68:
	set 0x60740000, %r31
	.word 0x8584212a  ! 149: WRCCR_I	wr	%r16, 0x012a, %ccr
splash_lsu_5_69:
	setx 0x568768435aefead9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_70:
	setx 0x98aba60dd72505ec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_72) + 56, 16, 16)) -> intp(1,0,12)
intvec_5_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790222e  ! 154: WRPR_TT_I	wrpr	%r0, 0x022e, %tt
debug_5_73:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_5_74:
	setx 0xfe2d3251485c437e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 158: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e010  ! 159: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
DS_5_75:
	.word 0x99a0c9c6  ! 1: FDIVd	fdivd	%f34, %f6, %f12
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x93d02035  ! 162: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe28008a0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_5_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f16, %f16, %f16
	.word 0x99b24307  ! 164: ALIGNADDRESS	alignaddr	%r9, %r7, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_77:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 165: RDPC	rd	%pc, %r16
splash_cmpr_5_78:
	setx 0x6713692a042a0c58, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903983  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x1983, %pstate
	rd %pc, %r19
	add %r19, (ivw_5_79-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_79:
	.word 0x91914014  ! 168: WRPR_PIL_R	wrpr	%r5, %r20, %pil
	.word 0xa781af51  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x0f51, %-
debug_5_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_5_81:
    set user_data_start, %o7
	.word 0x93902004  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95696341  ! 172: SDIVX_I	sdivx	%r5, 0x0341, %r10
	setx 0x9267afde25b1d85d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902301  ! 174: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ce9e4  ! 175: SDIVX_I	sdivx	%r19, 0x09e4, %r11
debug_5_85:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_5_86:
	tsubcctv %r18, 0x1d65, %r17
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d902e88  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0e88, %pstate
	.word 0x87802088  ! 181: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902005  ! 182: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_5_87:
	setx 0xdac7b35527ac1e19, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_5_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d914013  ! 185: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_5_89:
	.word 0x8198201e  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
intveclr_5_90:
	setx 0xbf4ff08e93589e44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_5_91-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_91:
	.word 0x9194400c  ! 189: WRPR_PIL_R	wrpr	%r17, %r12, %pil
debug_5_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200e  ! 191: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_5_93:
	setx 0x5fb4603b1c0d0037, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00162  ! 193: FABSq	dis not found

	.word 0xa784372c  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x172c, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_94:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 195: RDPC	rd	%pc, %r12
	.word 0x87902031  ! 196: WRPR_TT_I	wrpr	%r0, 0x0031, %tt
intveclr_5_95:
	setx 0x8db7721d7c70ecf5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_96:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_5_97:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_98-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_98:
	.word 0x91950011  ! 200: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_5_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92800c  ! 202: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
DS_5_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_5_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_5_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 206: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	setx 0x48463574aa151510, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_104:
	.word 0x8f902002  ! 208: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 209: FqTOd	dis not found

splash_cmpr_5_106:
	setx 0xa8298c80d8e027c4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790212d  ! 212: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x91a189d0  ! 213: FDIVd	fdivd	%f6, %f16, %f8
mondo_5_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d920012  ! 214: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_5_108:
	setx 0x7625202c965e2a50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_5_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_5_110-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_110:
	.word 0x91948011  ! 219: WRPR_PIL_R	wrpr	%r18, %r17, %pil
splash_cmpr_5_111:
	setx 0x87225dbb6c99b720, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa9a00171  ! 223: FABSq	dis not found

memptr_5_112:
	set 0x60340000, %r31
	.word 0x858321e8  ! 224: WRCCR_I	wr	%r12, 0x01e8, %ccr
splash_hpstate_5_113:
	.word 0x819829d6  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
DS_5_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x896dce2b	! Random illegal ?
	.word 0xd5124006  ! 1: LDQF_R	-	[%r9, %r6], %f10
	.word 0x9ba2482a  ! 226: FADDs	fadds	%f9, %f10, %f13
splash_cmpr_5_115:
	setx 0x87ce2e0eeb18fb2b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_116:
    set user_data_start, %o7
	.word 0x93902003  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe4900e80  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
memptr_5_117:
	set user_data_start, %r31
	.word 0x8581b66d  ! 230: WRCCR_I	wr	%r6, 0x166d, %ccr
	.word 0x91d020b2  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa1902003  ! 232: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_5_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d940008  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
change_to_randtl_5_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_119:
	.word 0x8f902002  ! 234: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68b20c  ! 236: SDIVX_I	sdivx	%r2, 0xfffff20c, %r13
	.word 0x8d9033f6  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x13f6, %pstate
mondo_5_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d920014  ! 238: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0xad80e4ac  ! 239: WR_SOFTINT_REG_I	wr	%r3, 0x04ac, %softint
	.word 0xa1902002  ! 240: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd29004a0  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_5_122:
	setx 0xe08976ce7600e3cc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_123:
	taddcctv %r11, 0x187b, %r6
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_5_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x8d903256  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x1256, %pstate
debug_5_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e020  ! 249: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
memptr_5_126:
	set user_data_start, %r31
	.word 0x85802db9  ! 250: WRCCR_I	wr	%r0, 0x0db9, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_5_127:
	.word 0x81982787  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
tagged_5_128:
	tsubcctv %r7, 0x1743, %r7
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 254: RDPC	rd	%pc, %r13
	.word 0x87802010  ! 255: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_5_130:
	setx 0x88dc603c5557d973, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_5_131:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa782c007  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r7, %-
splash_htba_5_132:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_5_133:
	nop
	setx 0xfffffb01fffff386, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b3a7c  ! 262: SDIVX_I	sdivx	%r12, 0xfffffa7c, %r10
	.word 0x879021a3  ! 263: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56ab111  ! 264: SDIVX_I	sdivx	%r10, 0xfffff111, %r18
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_5_137:
	setx 0x10f3e46c887870ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 268: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_5_138:
	setx 0xe7aec5026e64dfaf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_139:
	.word 0x81982554  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0x879021bd  ! 272: WRPR_TT_I	wrpr	%r0, 0x01bd, %tt
splash_tba_5_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_141:
	setx 0xc55082d9e3dde850, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_5_143:
	setx 0xff7d698010a401d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d804a0  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d9028d4  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x08d4, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94800d  ! 280: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
tagged_5_145:
	taddcctv %r14, 0x1968, %r17
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad8425b9  ! 282: WR_SOFTINT_REG_I	wr	%r16, 0x05b9, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_146) + 0, 16, 16)) -> intp(5,0,24)
intvec_5_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_5_147:
	set user_data_start, %r31
	.word 0x85846475  ! 284: WRCCR_I	wr	%r17, 0x0475, %ccr
splash_cmpr_5_148:
	setx 0xebea2f00282fc8df, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9810008  ! 286: WR_SET_SOFTINT_R	wr	%r4, %r8, %set_softint
	.word 0x9f803c69  ! 287: SIR	sir	0x1c69
	.word 0x8790218b  ! 288: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
	.word 0x91d020b4  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_5_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879023e5  ! 291: WRPR_TT_I	wrpr	%r0, 0x03e5, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_150:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 292: RDPC	rd	%pc, %r12
debug_5_151:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_152-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_152:
	.word 0x9191c014  ! 294: WRPR_PIL_R	wrpr	%r7, %r20, %pil
	setx 0x1adb49b83a28f920, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_5_154:
	set 0x60140000, %r31
	.word 0x85847497  ! 296: WRCCR_I	wr	%r17, 0x1497, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_5_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_156:
	setx 0xb6ec004f9a87d867, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_5_157:
	setx 0xce7600f0993bdf5e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_5_158-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_158:
	.word 0x91930004  ! 302: WRPR_PIL_R	wrpr	%r12, %r4, %pil
splash_hpstate_5_159:
	.word 0x819824ce  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 305: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xd4800c00  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
splash_lsu_5_161:
	setx 0x669458149e90e59f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_5_162:
	setx 0xf8b92ff5e5328ed3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_5_163:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_164:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 311: RDPC	rd	%pc, %r17
DS_5_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x95b0c301  ! 312: ALIGNADDRESS	alignaddr	%r3, %r1, %r10
	.word 0xab8231ec  ! 313: WR_CLEAR_SOFTINT_I	wr	%r8, 0x11ec, %clear_softint
	.word 0xd8d004a0  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_5_167:
	setx 0x3876c105dc49e401, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
splash_cmpr_5_168:
	setx 0xc5b7cc990c1e5c77, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_169:
	setx 0x56d95f05cabe8b89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_170:
	setx 0x345861d2e24a3802, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_171:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 322: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd6d00e40  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
splash_tba_5_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
splash_decr_5_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa780c00b  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r11, %-
	.word 0xd6c7e000  ! 327: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad823814  ! 329: WR_SOFTINT_REG_I	wr	%r8, 0x1814, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802058  ! 332: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c2b87  ! 333: SDIVX_I	sdivx	%r16, 0x0b87, %r18
	.word 0x9ba4cd2a  ! 334: FsMULd	fsmuld	%f19, %f10, %f44
	.word 0x8d90303c  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x103c, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_5_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a409c1  ! 1: FDIVd	fdivd	%f16, %f32, %f8
	.word 0xa7a28820  ! 337: FADDs	fadds	%f10, %f0, %f19
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x93414000  ! 338: RDPC	rd	%pc, %r9
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_5_178:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_5_180:
	setx 0x3e4b8befb77a38f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_5_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_181-donret_5_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_5_183:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_5_184-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_184:
	.word 0x91924003  ! 348: WRPR_PIL_R	wrpr	%r9, %r3, %pil
debug_5_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_5_186:
	tsubcctv %r23, 0x1daa, %r11
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa1902002  ! 352: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_5_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a00550  ! 1: FSQRTd	fsqrt	
	.word 0x95a4c831  ! 353: FADDs	fadds	%f19, %f17, %f10
tagged_5_188:
	tsubcctv %r23, 0x125d, %r23
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196b  ! 355: FqTOd	dis not found

debug_5_190:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91520000  ! 358: RDPR_PIL	rdpr	%pil, %r8
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_192:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 359: RDPC	rd	%pc, %r13
memptr_5_193:
	set 0x60340000, %r31
	.word 0x8584ff34  ! 360: WRCCR_I	wr	%r19, 0x1f34, %ccr
mondo_5_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d93000b  ! 361: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
pmu_5_195:
	nop
	setx 0xfffff785fffff980, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_5_196:
	setx 0xe5cfbafdf5b9116e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
splash_decr_5_197:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7850010  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r16, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
debug_5_198:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 368: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
mondo_5_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 369: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa168a4ca  ! 371: SDIVX_I	sdivx	%r2, 0x04ca, %r16
splash_tba_5_201:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 373: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_5_202:
	set 0x60140000, %r31
	.word 0x8582657f  ! 374: WRCCR_I	wr	%r9, 0x057f, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_203:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 376: RDPC	rd	%pc, %r8
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_5_204:
	.word 0x91a409c3  ! 1: FDIVd	fdivd	%f16, %f34, %f8
	allclean
	.word 0xa7b28308  ! 378: ALIGNADDRESS	alignaddr	%r10, %r8, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96872aa  ! 379: SDIVX_I	sdivx	%r1, 0xfffff2aa, %r20
	.word 0x9194e4e5  ! 380: WRPR_PIL_I	wrpr	%r19, 0x04e5, %pil
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800c60  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
change_to_randtl_5_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_206:
	.word 0x8f902001  ! 384: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_5_207-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_207:
	.word 0x9190800d  ! 385: WRPR_PIL_R	wrpr	%r2, %r13, %pil
	.word 0x91d020b2  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_208:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 387: RDPC	rd	%pc, %r13
	.word 0x8d90396e  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x196e, %pstate
memptr_5_209:
	set 0x60740000, %r31
	.word 0x85816c6e  ! 389: WRCCR_I	wr	%r5, 0x0c6e, %ccr
memptr_5_210:
	set user_data_start, %r31
	.word 0x85842525  ! 390: WRCCR_I	wr	%r16, 0x0525, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902001  ! 392: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_5_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1348009  ! 1: STQF_R	-	%f8, [%r9, %r18]
	normalw
	.word 0xa5458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8d9036b9  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x16b9, %pstate
change_to_randtl_5_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_213:
	.word 0x8f902003  ! 397: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9b690013  ! 398: SDIVX_R	sdivx	%r4, %r19, %r13
splash_lsu_5_214:
	setx 0x33bc937a1750727b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xa9818000  ! 1: WR_SET_SOFTINT_R	wr	%r6, %r0, %set_softint
	.word 0x9f803197  ! 2: SIR	sir	0x1197
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 4: FqTOd	dis not found

splash_lsu_4_1:
	setx 0x874726f426fce105, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_2:
	setx 0x1d958d451a271b87, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d914006  ! 7: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xa3454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x99a10dd0  ! 9: FdMULq	fdmulq	
DS_4_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa080c00a  ! 11: ADDcc_R	addcc 	%r3, %r10, %r16
cwp_4_5:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d902fae  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0fae, %pstate
	.word 0xe8dfe000  ! 15: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0x879023f2  ! 16: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
wait_for_debug_4_6:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_6
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 18: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x9b520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d903136  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x1136, %pstate
intveclr_4_7:
	setx 0xfbcdb9e4c97b64f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d918002  ! 22: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_4_9:
	set user_data_start, %r31
	.word 0x85816cda  ! 24: WRCCR_I	wr	%r5, 0x0cda, %ccr
	.word 0x91d02032  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_4_10:
	tsubcctv %r1, 0x110c, %r17
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x879021af  ! 27: WRPR_TT_I	wrpr	%r0, 0x01af, %tt
	.word 0x8d802004  ! 28: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd6800ae0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
	.word 0x87902341  ! 30: WRPR_TT_I	wrpr	%r0, 0x0341, %tt
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_11:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 31: RDPC	rd	%pc, %r13
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
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 32: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_4_13:
	.word 0x819820de  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 36: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x8790214b  ! 38: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0x857dcaa91b5aff53, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_16:
	.word 0x8198269e  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069e, %hpstate
pmu_4_17:
	nop
	setx 0xfffffdbeffffffe6, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_18:
	setx 0xabe8c7a348858b31, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_4_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_4_20:
	tsubcctv %r9, 0x1b41, %r11
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9844004  ! 47: WR_SET_SOFTINT_R	wr	%r17, %r4, %set_softint
cwp_4_21:
    set user_data_start, %o7
	.word 0x93902001  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_22) + 40, 16, 16)) -> intp(0,0,31)
intvec_4_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab850006  ! 50: WR_CLEAR_SOFTINT_R	wr	%r20, %r6, %clear_softint
	.word 0x91d02033  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 52: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_4_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad8126e5  ! 56: WR_SOFTINT_REG_I	wr	%r4, 0x06e5, %softint
	setx 0x461477b5c738b3aa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 58: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa5500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_4_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_4_27:
	set user_data_start, %r31
	.word 0x858339a6  ! 63: WRCCR_I	wr	%r12, 0x19a6, %ccr
splash_tba_4_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa8dc4009  ! 66: SMULcc_R	smulcc 	%r17, %r9, %r20
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
	.word 0x91414000  ! 67: RDPC	rd	%pc, %r8
	.word 0x8d90366b  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x166b, %pstate
	.word 0x9350c000  ! 69: RDPR_TT	<illegal instruction>
memptr_4_31:
	set 0x60740000, %r31
	.word 0x85822c46  ! 70: WRCCR_I	wr	%r8, 0x0c46, %ccr
mondo_4_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 71: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x90fd0014  ! 74: SDIVcc_R	sdivcc 	%r20, %r20, %r8
	.word 0xd49004a0  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_4_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x95a089c4  ! 1: FDIVd	fdivd	%f2, %f4, %f10
	normalw
	.word 0xa5458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r18
cwp_4_34:
    set user_data_start, %o7
	.word 0x93902000  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_35)+0, 16, 16)) -> intp(4,1,3)
xir_4_35:
	.word 0xa984a24d  ! 78: WR_SET_SOFTINT_I	wr	%r18, 0x024d, %set_softint
memptr_4_36:
	set user_data_start, %r31
	.word 0x8584e850  ! 79: WRCCR_I	wr	%r19, 0x0850, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 80: RDPC	rd	%pc, %r16
	.word 0xd6c804a0  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 82: RDPC	rd	%pc, %r19
debug_4_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_39:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_39
    nop
debug_wait4_39:
    ld [%r23], %r2
    brnz %r2, debug_wait4_39
    nop
    ba,a debug_startwait4_39
continue_debug_4_39:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_39:
    cmp %r13, %r15
    bne,a wait_for_stat_4_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
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
	.word 0xe6f00492  ! 83: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
cwp_4_40:
    set user_data_start, %o7
	.word 0x93902006  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd6800b80  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
splash_cmpr_4_41:
	setx 0xdf285b6fd4e726b2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956d3bb8  ! 87: SDIVX_I	sdivx	%r20, 0xfffffbb8, %r10
debug_4_43:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902e9c  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0x9f80234e  ! 90: SIR	sir	0x034e
	.word 0xa1902007  ! 91: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_4_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 92: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x91d020b5  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_4_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 94: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xa1902003  ! 95: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902013  ! 96: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_47:
	set 0x60140000, %r31
	.word 0x8582eb25  ! 100: WRCCR_I	wr	%r11, 0x0b25, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_4_49:
	nop
	setx 0xfffff3fefffff2eb, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f24, %f6
	.word 0xa1b30314  ! 103: ALIGNADDRESS	alignaddr	%r12, %r20, %r16
	.word 0x879022f6  ! 104: WRPR_TT_I	wrpr	%r0, 0x02f6, %tt
splash_cmpr_4_51:
	setx 0x0f0d3c8f2726f8ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 106: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe6800b60  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_52) + 56, 16, 16)) -> intp(4,0,30)
intvec_4_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_53:
    set user_data_start, %o7
	.word 0x93902006  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_4_54:
	set user_data_start, %r31
	.word 0x85827e0c  ! 111: WRCCR_I	wr	%r9, 0x1e0c, %ccr
intveclr_4_55:
	setx 0xde5e87a768987e4d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x9b540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0xa5450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xa04c4008  ! 116: MULX_R	mulx 	%r17, %r8, %r16
	.word 0x9f8034ff  ! 117: SIR	sir	0x14ff
	.word 0xd497e030  ! 118: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_56) + 56, 16, 16)) -> intp(7,0,24)
intvec_4_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_57:
	setx 0x2a486151ac4a94ee, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_4_58:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d02033  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9ba0016b  ! 128: FABSq	dis not found

	.word 0x9b500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x87902191  ! 130: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
splash_cmpr_4_60:
	setx 0x58906b69934c594f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_4_61:
    set user_data_start, %o7
	.word 0x93902007  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9023b2  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x03b2, %pstate
	.word 0x87802020  ! 135: WRASI_I	wr	%r0, 0x0020, %asi
cwp_4_62:
    set user_data_start, %o7
	.word 0x93902000  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902002  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0x9484f80a  ! 139: ADDcc_I	addcc 	%r19, 0xfffff80a, %r10
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
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 140: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xd4800ba0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 142: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_4_64:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_65:
	setx 0x57d8cd242365fd9b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_66:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_4_67:
	setx 0x208a886a4ad6f2ab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021a0  ! 147: WRPR_TT_I	wrpr	%r0, 0x01a0, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_4_68:
	set 0x60140000, %r31
	.word 0x85802897  ! 149: WRCCR_I	wr	%r0, 0x0897, %ccr
splash_lsu_4_69:
	setx 0x7f397127c3f01f59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_70:
	setx 0x4a41e172ac8f5e01, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_72) + 48, 16, 16)) -> intp(3,0,21)
intvec_4_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023a2  ! 154: WRPR_TT_I	wrpr	%r0, 0x03a2, %tt
debug_4_73:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_4_74:
	setx 0xf260f1079108f60e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 158: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e020  ! 159: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
DS_4_75:
	.word 0x9ba409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f44
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x91d020b3  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe28008a0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_4_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f26, %f12
	.word 0x9bb4030a  ! 164: ALIGNADDRESS	alignaddr	%r16, %r10, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_77:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 165: RDPC	rd	%pc, %r11
splash_cmpr_4_78:
	setx 0x2f8ac97f6193470c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902740  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0740, %pstate
	rd %pc, %r19
	add %r19, (ivw_4_79-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_79:
	.word 0x9194c00a  ! 168: WRPR_PIL_R	wrpr	%r19, %r10, %pil
	.word 0xa782aace  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r10, 0x0ace, %-
debug_4_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_4_81:
    set user_data_start, %o7
	.word 0x93902000  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368eb36  ! 172: SDIVX_I	sdivx	%r3, 0x0b36, %r9
	setx 0xb39e6bf9d5c3af79, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902158  ! 174: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c7561  ! 175: SDIVX_I	sdivx	%r17, 0xfffff561, %r10
debug_4_85:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_4_86:
	tsubcctv %r10, 0x1fc3, %r3
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d902c8f  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x87802058  ! 181: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa190200a  ! 182: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_4_87:
	setx 0x43be793dfd9b607f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 184: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_4_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c009  ! 185: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_4_89:
	.word 0x81982b1d  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
intveclr_4_90:
	setx 0x13fc90af03e1609c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_91-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_91:
	.word 0x91904014  ! 189: WRPR_PIL_R	wrpr	%r1, %r20, %pil
debug_4_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 191: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_4_93:
	setx 0xc5f66a592f4f60dd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a00162  ! 193: FABSq	dis not found

	.word 0xa780f43b  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r3, 0x143b, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_94:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 195: RDPC	rd	%pc, %r18
	.word 0x879021bb  ! 196: WRPR_TT_I	wrpr	%r0, 0x01bb, %tt
intveclr_4_95:
	setx 0xef63dd3fda714966, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_96:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_4_97:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_98-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_98:
	.word 0x91904004  ! 200: WRPR_PIL_R	wrpr	%r1, %r4, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_4_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d920000  ! 202: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
DS_4_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_4_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d904009  ! 206: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	setx 0x5d0dd90faeec17d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_104:
	.word 0x8f902001  ! 208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 209: FqTOd	dis not found

splash_cmpr_4_106:
	setx 0x4d6a688f416e2fde, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 211: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021a2  ! 212: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
	.word 0x93a309cd  ! 213: FDIVd	fdivd	%f12, %f44, %f40
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90c003  ! 214: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_4_108:
	setx 0x47f7ad10268babc3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_4_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_4_110-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_110:
	.word 0x9191c013  ! 219: WRPR_PIL_R	wrpr	%r7, %r19, %pil
splash_cmpr_4_111:
	setx 0x9b2ca4c526c9a1c1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa7a00164  ! 223: FABSq	dis not found

memptr_4_112:
	set 0x60140000, %r31
	.word 0x8582297a  ! 224: WRCCR_I	wr	%r8, 0x097a, %ccr
splash_hpstate_4_113:
	.word 0x81982e85  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
DS_4_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x95594050	! Random illegal ?
	.word 0xd312c00c  ! 1: LDQF_R	-	[%r11, %r12], %f9
	.word 0xa1a44827  ! 226: FADDs	fadds	%f17, %f7, %f16
splash_cmpr_4_115:
	setx 0x09574506ba463662, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_116:
    set user_data_start, %o7
	.word 0x93902004  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_4_117:
	set user_data_start, %r31
	.word 0x8582ac79  ! 230: WRCCR_I	wr	%r10, 0x0c79, %ccr
	.word 0x91d02033  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200d  ! 232: WRPR_GL_I	wrpr	%r0, 0x000d, %-
mondo_4_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d92400b  ! 233: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
change_to_randtl_4_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_119:
	.word 0x8f902001  ! 234: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68ab99  ! 236: SDIVX_I	sdivx	%r2, 0x0b99, %r13
	.word 0x8d903536  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1536, %pstate
mondo_4_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d948010  ! 238: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xad813165  ! 239: WR_SOFTINT_REG_I	wr	%r4, 0x1165, %softint
	.word 0xa1902000  ! 240: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd29004a0  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd2800bc0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
splash_cmpr_4_122:
	setx 0x7d0e152e584f13aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_123:
	taddcctv %r21, 0x1dbf, %r24
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_4_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x8d9028e3  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x08e3, %pstate
debug_4_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e030  ! 249: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
memptr_4_126:
	set user_data_start, %r31
	.word 0x85833ba1  ! 250: WRCCR_I	wr	%r12, 0x1ba1, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_4_127:
	.word 0x81982757  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
tagged_4_128:
	tsubcctv %r2, 0x17c6, %r8
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa5414000  ! 254: RDPC	rd	%pc, %r18
	.word 0x8780204f  ! 255: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_4_130:
	setx 0x29d10d0dd750a685, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7844011  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r17, %-
splash_htba_4_132:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_4_133:
	nop
	setx 0xfffff6a6fffffffa, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ce631  ! 262: SDIVX_I	sdivx	%r19, 0x0631, %r20
	.word 0x8790222c  ! 263: WRPR_TT_I	wrpr	%r0, 0x022c, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c73be  ! 264: SDIVX_I	sdivx	%r17, 0xfffff3be, %r19
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_4_137:
	setx 0xda42be75c2480d3a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_4_138:
	setx 0x9a1f72964143c00e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_139:
	.word 0x81982f4f  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
	.word 0x8790227d  ! 272: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
splash_tba_4_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_141:
	setx 0x288c7c510df08c05, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_142:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_4_143:
	setx 0x3985ff22930f1727, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d804a0  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d903048  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x1048, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d930010  ! 280: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
tagged_4_145:
	taddcctv %r22, 0x18e1, %r3
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad84f43e  ! 282: WR_SOFTINT_REG_I	wr	%r19, 0x143e, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_146) + 32, 16, 16)) -> intp(7,0,19)
intvec_4_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_147:
	set user_data_start, %r31
	.word 0x8584a103  ! 284: WRCCR_I	wr	%r18, 0x0103, %ccr
splash_cmpr_4_148:
	setx 0x5030ea7b88af2516, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa980400b  ! 286: WR_SET_SOFTINT_R	wr	%r1, %r11, %set_softint
	.word 0x9f802bea  ! 287: SIR	sir	0x0bea
	.word 0x879020a3  ! 288: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	.word 0x91d020b4  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_4_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902369  ! 291: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_150:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 292: RDPC	rd	%pc, %r12
debug_4_151:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_152-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_152:
	.word 0x91900006  ! 294: WRPR_PIL_R	wrpr	%r0, %r6, %pil
	setx 0x864d8c9a0c5679ad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_154:
	set 0x60140000, %r31
	.word 0x858522c9  ! 296: WRCCR_I	wr	%r20, 0x02c9, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_4_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_156:
	setx 0xc2958c8ced42bbcf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b3  ! 300: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_cmpr_4_157:
	setx 0x9da9910d928716a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_4_158-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_158:
	.word 0x91934014  ! 302: WRPR_PIL_R	wrpr	%r13, %r20, %pil
splash_hpstate_4_159:
	.word 0x819820e6  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00e6, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d90c00d  ! 305: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0xd48008a0  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_4_161:
	setx 0xc3e73995028c6993, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_162:
	setx 0x3c0c957e369fb676, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_4_163:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_164:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 311: RDPC	rd	%pc, %r17
DS_4_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b14305  ! 312: ALIGNADDRESS	alignaddr	%r5, %r5, %r17
	.word 0xab803a1f  ! 313: WR_CLEAR_SOFTINT_I	wr	%r0, 0x1a1f, %clear_softint
	.word 0xd8d00e60  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r12
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_4_167:
	setx 0x5b3c4f359c5ab5e5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_4_168:
	setx 0xfa6b31c1a72b3cc6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_169:
	setx 0xa7b8b5a4086514bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_170:
	setx 0xbd8d6aff3b076cf6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_171:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_171:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_171
    nop
debug_wait4_171:
    ld [%r23], %r2
    brnz %r2, debug_wait4_171
    nop
    ba,a debug_startwait4_171
continue_debug_4_171:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_171:
    cmp %r13, %r15
    bne,a wait_for_stat_4_171
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_171:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_171
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 322: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xd6d004a0  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_tba_4_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa782c010  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r16, %-
	.word 0xd6c7e020  ! 327: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad84f581  ! 329: WR_SOFTINT_REG_I	wr	%r19, 0x1581, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 332: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c290c  ! 333: SDIVX_I	sdivx	%r16, 0x090c, %r16
	.word 0x93a00d28  ! 334: FsMULd	fsmuld	%f0, %f8, %f40
	.word 0x8d903bd4  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x1bd4, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_4_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x93a409c6  ! 1: FDIVd	fdivd	%f16, %f6, %f40
	.word 0xa9a4c821  ! 337: FADDs	fadds	%f19, %f1, %f20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x9b414000  ! 338: RDPC	rd	%pc, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_4_178:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_4_180:
	setx 0x2d5db31ec137eedf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_4_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_181-donret_4_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 344: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_4_183:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_4_184-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_184:
	.word 0x91930008  ! 348: WRPR_PIL_R	wrpr	%r12, %r8, %pil
debug_4_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_4_186:
	tsubcctv %r10, 0x18d1, %r8
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa190200b  ! 352: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_4_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a00541  ! 1: FSQRTd	fsqrt	
	.word 0x97a28820  ! 353: FADDs	fadds	%f10, %f0, %f11
tagged_4_188:
	tsubcctv %r13, 0x1f39, %r4
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 355: FqTOd	dis not found

debug_4_190:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95520000  ! 358: RDPR_PIL	rdpr	%pil, %r10
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_192:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 359: RDPC	rd	%pc, %r12
memptr_4_193:
	set 0x60740000, %r31
	.word 0x85826087  ! 360: WRCCR_I	wr	%r9, 0x0087, %ccr
mondo_4_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d944013  ! 361: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
pmu_4_195:
	nop
	setx 0xfffff548fffff94d, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_4_196:
	setx 0x678b6a8ea257ba33, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa784c003  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r3, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
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
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 368: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
mondo_4_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92000b  ! 369: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa168704a  ! 371: SDIVX_I	sdivx	%r1, 0xfffff04a, %r16
splash_tba_4_201:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_202:
	set 0x60140000, %r31
	.word 0x85843496  ! 374: WRCCR_I	wr	%r16, 0x1496, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 376: RDPC	rd	%pc, %r11
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_4_204:
	.word 0x97a509c2  ! 1: FDIVd	fdivd	%f20, %f2, %f42
	allclean
	.word 0x9bb30308  ! 378: ALIGNADDRESS	alignaddr	%r12, %r8, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3683cfe  ! 379: SDIVX_I	sdivx	%r0, 0xfffffcfe, %r17
	.word 0x91937191  ! 380: WRPR_PIL_I	wrpr	%r13, 0x1191, %pil
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 381: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800c80  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
change_to_randtl_4_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_206:
	.word 0x8f902001  ! 384: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_4_207-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_207:
	.word 0x91920008  ! 385: WRPR_PIL_R	wrpr	%r8, %r8, %pil
	.word 0x91d020b2  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_208:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 387: RDPC	rd	%pc, %r18
	.word 0x8d902aa2  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0aa2, %pstate
memptr_4_209:
	set 0x60340000, %r31
	.word 0x858424c9  ! 389: WRCCR_I	wr	%r16, 0x04c9, %ccr
memptr_4_210:
	set user_data_start, %r31
	.word 0x8581f3cc  ! 390: WRCCR_I	wr	%r7, 0x13cc, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902004  ! 392: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_4_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7350004  ! 1: STQF_R	-	%f19, [%r4, %r20]
	normalw
	.word 0xa5458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8d902993  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0993, %pstate
change_to_randtl_4_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_213:
	.word 0x8f902001  ! 397: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x97688011  ! 398: SDIVX_R	sdivx	%r2, %r17, %r11
splash_lsu_4_214:
	setx 0xe16ce8de7a70de09, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xa984c007  ! 1: WR_SET_SOFTINT_R	wr	%r19, %r7, %set_softint
	.word 0x9f8030b6  ! 2: SIR	sir	0x10b6
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01968  ! 4: FqTOd	dis not found

splash_lsu_3_1:
	setx 0x08f7a858b349741b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_2:
	setx 0xf82a856c8a578e61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 7: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xa3454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xa1a48dc7  ! 9: FdMULq	fdmulq	
DS_3_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x9684c002  ! 11: ADDcc_R	addcc 	%r19, %r2, %r11
cwp_3_5:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d902a1d  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0a1d, %pstate
	.word 0xe8dfe010  ! 15: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0x8790210c  ! 16: WRPR_TT_I	wrpr	%r0, 0x010c, %tt
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_3_6:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 18: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x91520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d902fed  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0fed, %pstate
intveclr_3_7:
	setx 0xc240c043de5a8646, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90800b  ! 22: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_3_9:
	set user_data_start, %r31
	.word 0x858160ac  ! 24: WRCCR_I	wr	%r5, 0x00ac, %ccr
	.word 0x91d02034  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_3_10:
	tsubcctv %r24, 0x15c9, %r10
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x87902040  ! 27: WRPR_TT_I	wrpr	%r0, 0x0040, %tt
	.word 0x8d802004  ! 28: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd6800aa0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
	.word 0x87902242  ! 30: WRPR_TT_I	wrpr	%r0, 0x0242, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_11:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 31: RDPC	rd	%pc, %r19
debug_3_12:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 32: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_3_13:
	.word 0x81982355  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 36: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x8790207e  ! 38: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0x1b41c4d6b66e39ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_16:
	.word 0x8198210c  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
pmu_3_17:
	nop
	setx 0xfffff607fffff098, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_3_18:
	setx 0x74f27bea0d5ca82d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800c60  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
DS_3_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_3_20:
	tsubcctv %r8, 0x1a68, %r19
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9818001  ! 47: WR_SET_SOFTINT_R	wr	%r6, %r1, %set_softint
cwp_3_21:
    set user_data_start, %o7
	.word 0x93902001  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_22) + 40, 16, 16)) -> intp(0,0,9)
intvec_3_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab824014  ! 50: WR_CLEAR_SOFTINT_R	wr	%r9, %r20, %clear_softint
	.word 0x83d02032  ! 51: Tcc_I	te	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_3_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad84fddc  ! 56: WR_SOFTINT_REG_I	wr	%r19, 0x1ddc, %softint
	setx 0x6c0cd7b413687be4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 58: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd8800b00  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r12
	.word 0x97500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_3_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_3_27:
	set user_data_start, %r31
	.word 0x85843434  ! 63: WRCCR_I	wr	%r16, 0x1434, %ccr
splash_tba_3_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_3_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x92dc000d  ! 66: SMULcc_R	smulcc 	%r16, %r13, %r9
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
	.word 0xa3414000  ! 67: RDPC	rd	%pc, %r17
	.word 0x8d90271d  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x071d, %pstate
	.word 0x9750c000  ! 69: RDPR_TT	<illegal instruction>
memptr_3_31:
	set 0x60540000, %r31
	.word 0x85827886  ! 70: WRCCR_I	wr	%r9, 0x1886, %ccr
mondo_3_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d948007  ! 71: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800be0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0x90f8c006  ! 74: SDIVcc_R	sdivcc 	%r3, %r6, %r8
	.word 0xd4900e40  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x72, %r10
DS_3_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a449d1  ! 1: FDIVd	fdivd	%f48, %f48, %f50
	normalw
	.word 0x93458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r9
cwp_3_34:
    set user_data_start, %o7
	.word 0x93902004  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_35)+56, 16, 16)) -> intp(3,1,3)
xir_3_35:
	.word 0xa982e07b  ! 78: WR_SET_SOFTINT_I	wr	%r11, 0x007b, %set_softint
memptr_3_36:
	set user_data_start, %r31
	.word 0x8584f4ac  ! 79: WRCCR_I	wr	%r19, 0x14ac, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_37:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 80: RDPC	rd	%pc, %r11
	.word 0xd6c80e60  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r11
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 82: RDPC	rd	%pc, %r20
debug_3_39:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 83: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
cwp_3_40:
    set user_data_start, %o7
	.word 0x93902004  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd68008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_3_41:
	setx 0x6e0861916dbf9c86, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16a280e  ! 87: SDIVX_I	sdivx	%r8, 0x080e, %r16
debug_3_43:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9024c7  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x9f80252c  ! 90: SIR	sir	0x052c
	.word 0xa1902005  ! 91: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_3_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d94000a  ! 92: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	.word 0x91d020b5  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_3_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d910014  ! 94: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0xa190200f  ! 95: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902023  ! 96: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_47:
	set 0x60340000, %r31
	.word 0x8582203f  ! 100: WRCCR_I	wr	%r8, 0x003f, %ccr
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_3_49:
	nop
	setx 0xfffff858fffffc05, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_3_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f4, %f14
	.word 0x91b34311  ! 103: ALIGNADDRESS	alignaddr	%r13, %r17, %r8
	.word 0x8790217c  ! 104: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
splash_cmpr_3_51:
	setx 0x14ea692c35937b99, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802055  ! 106: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe6800be0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_52) + 0, 16, 16)) -> intp(4,0,16)
intvec_3_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_3_53:
    set user_data_start, %o7
	.word 0x93902006  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_3_54:
	set user_data_start, %r31
	.word 0x8580e02f  ! 111: WRCCR_I	wr	%r3, 0x002f, %ccr
intveclr_3_55:
	setx 0x56e219d8f7e2c455, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x91540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0x93450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x944c4012  ! 116: MULX_R	mulx 	%r17, %r18, %r10
	.word 0x9f803e88  ! 117: SIR	sir	0x1e88
	.word 0xd497e000  ! 118: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_56) + 24, 16, 16)) -> intp(2,0,8)
intvec_3_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_57:
	setx 0xb8090ca0fe2a5aae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_3_58:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d02034  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa3a00165  ! 128: FABSq	dis not found

	.word 0x95500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x879022e3  ! 130: WRPR_TT_I	wrpr	%r0, 0x02e3, %tt
splash_cmpr_3_60:
	setx 0x416c881fdb3091ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_3_61:
    set user_data_start, %o7
	.word 0x93902000  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903ced  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x1ced, %pstate
	.word 0x87802055  ! 135: WRASI_I	wr	%r0, 0x0055, %asi
cwp_3_62:
    set user_data_start, %o7
	.word 0x93902007  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902004  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0x928069fe  ! 139: ADDcc_I	addcc 	%r1, 0x09fe, %r9
debug_3_63:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 140: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xd48008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_64:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_65:
	setx 0xb62753a0e31c117c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_66:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_3_67:
	setx 0x26343b39a261a72f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902090  ! 147: WRPR_TT_I	wrpr	%r0, 0x0090, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_3_68:
	set 0x60740000, %r31
	.word 0x858377be  ! 149: WRCCR_I	wr	%r13, 0x17be, %ccr
splash_lsu_3_69:
	setx 0x578f87235bef1f6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_70:
	setx 0x4d6c2ca21c078e9a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_72) + 0, 16, 16)) -> intp(5,0,19)
intvec_3_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790203a  ! 154: WRPR_TT_I	wrpr	%r0, 0x003a, %tt
debug_3_73:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_3_74:
	setx 0x39f95fbeb63c2688, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 158: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e030  ! 159: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
DS_3_75:
	.word 0xa9a189ca  ! 1: FDIVd	fdivd	%f6, %f10, %f20
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x93d020b5  ! 162: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xe28008a0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_3_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f20, %f28
	.word 0xa1b4c313  ! 164: ALIGNADDRESS	alignaddr	%r19, %r19, %r16
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_77:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 165: RDPC	rd	%pc, %r19
splash_cmpr_3_78:
	setx 0x6b675dab4ebee54e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9030fe  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x10fe, %pstate
	rd %pc, %r19
	add %r19, (ivw_3_79-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_79:
	.word 0x9192400a  ! 168: WRPR_PIL_R	wrpr	%r9, %r10, %pil
	.word 0xa782eacf  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0acf, %-
debug_3_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_3_81:
    set user_data_start, %o7
	.word 0x93902006  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99686a0a  ! 172: SDIVX_I	sdivx	%r1, 0x0a0a, %r12
	setx 0xfc865c08adec1e48, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022ba  ! 174: WRPR_TT_I	wrpr	%r0, 0x02ba, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569634a  ! 175: SDIVX_I	sdivx	%r5, 0x034a, %r10
debug_3_85:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_3_86:
	tsubcctv %r8, 0x1fc6, %r22
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d902a07  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0x87802020  ! 181: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa190200c  ! 182: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_3_87:
	setx 0x91371f7f0e4e855b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_3_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d934008  ! 185: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_3_89:
	.word 0x819823cd  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cd, %hpstate
intveclr_3_90:
	setx 0x53a6de6347d420d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_3_91-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_91:
	.word 0x91918008  ! 189: WRPR_PIL_R	wrpr	%r6, %r8, %pil
debug_3_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200c  ! 191: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_3_93:
	setx 0xcfd53067c5a0a0bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00160  ! 193: FABSq	dis not found

	.word 0xa781eb6d  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r7, 0x0b6d, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_94:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 195: RDPC	rd	%pc, %r11
	.word 0x8790215d  ! 196: WRPR_TT_I	wrpr	%r0, 0x015d, %tt
intveclr_3_95:
	setx 0x58e641e2652b97a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_96:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_3_97:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_98-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_98:
	.word 0x91928012  ! 200: WRPR_PIL_R	wrpr	%r10, %r18, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_3_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d944013  ! 202: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
DS_3_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd8800a80  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r12
splash_tba_3_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_3_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d92c00b  ! 206: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	setx 0x94df3497c1e96f29, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_104:
	.word 0x8f902001  ! 208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 209: FqTOd	dis not found

splash_cmpr_3_106:
	setx 0xab4574563709c84c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790237f  ! 212: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0x93a4c9cc  ! 213: FDIVd	fdivd	%f50, %f12, %f40
mondo_3_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94000d  ! 214: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_3_108:
	setx 0x5cbbdea709982357, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_3_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_3_110-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_110:
	.word 0x91908003  ! 219: WRPR_PIL_R	wrpr	%r2, %r3, %pil
splash_cmpr_3_111:
	setx 0x5730718c7c54cc89, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa3a00169  ! 223: FABSq	dis not found

memptr_3_112:
	set 0x60340000, %r31
	.word 0x85836cb7  ! 224: WRCCR_I	wr	%r13, 0x0cb7, %ccr
splash_hpstate_3_113:
	.word 0x81982e9f  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9f, %hpstate
DS_3_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd14057d0	! Random illegal ?
	.word 0xd9144013  ! 1: LDQF_R	-	[%r17, %r19], %f12
	.word 0x9ba1882c  ! 226: FADDs	fadds	%f6, %f12, %f13
splash_cmpr_3_115:
	setx 0x00f9922daf397d3f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_116:
    set user_data_start, %o7
	.word 0x93902004  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_3_117:
	set user_data_start, %r31
	.word 0x8580ab9f  ! 230: WRCCR_I	wr	%r2, 0x0b9f, %ccr
	.word 0x83d020b4  ! 231: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xa1902004  ! 232: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_3_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94000d  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
change_to_randtl_3_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_119:
	.word 0x8f902000  ! 234: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cbfe1  ! 236: SDIVX_I	sdivx	%r18, 0xffffffe1, %r12
	.word 0x8d90329a  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x129a, %pstate
mondo_3_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d930014  ! 238: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xad84b592  ! 239: WR_SOFTINT_REG_I	wr	%r18, 0x1592, %softint
	.word 0xa190200d  ! 240: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd2900e60  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x73, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_3_122:
	setx 0x4894fe2b05f00fac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_123:
	taddcctv %r9, 0x1af7, %r12
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_3_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x8d902ef3  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0ef3, %pstate
debug_3_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e010  ! 249: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
memptr_3_126:
	set user_data_start, %r31
	.word 0x8583274a  ! 250: WRCCR_I	wr	%r12, 0x074a, %ccr
	.word 0x8d802004  ! 251: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_3_127:
	.word 0x8198290f  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090f, %hpstate
tagged_3_128:
	tsubcctv %r15, 0x11e3, %r26
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 254: RDPC	rd	%pc, %r8
	.word 0x8780201c  ! 255: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_3_130:
	setx 0xe5fe48bbe6a7ee2f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7804010  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r16, %-
splash_htba_3_132:
	set 0x00390000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_3_133:
	nop
	setx 0xfffff7e5fffff495, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916abaea  ! 262: SDIVX_I	sdivx	%r10, 0xfffffaea, %r8
	.word 0x8790201e  ! 263: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769fc9f  ! 264: SDIVX_I	sdivx	%r7, 0xfffffc9f, %r19
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_3_137:
	setx 0x14b2e253edf0af53, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 269: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_3_138:
	setx 0xa1c1ae52b230856d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_139:
	.word 0x81982417  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0417, %hpstate
	.word 0x87902165  ! 272: WRPR_TT_I	wrpr	%r0, 0x0165, %tt
splash_tba_3_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_141:
	setx 0xe11fcdfb17d662b6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_3_143:
	setx 0x30350376b961957d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d804a0  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d9021c6  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x01c6, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d914013  ! 280: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
tagged_3_145:
	taddcctv %r1, 0x147a, %r5
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad8378f2  ! 282: WR_SOFTINT_REG_I	wr	%r13, 0x18f2, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_146) + 56, 16, 16)) -> intp(1,0,20)
intvec_3_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_3_147:
	set user_data_start, %r31
	.word 0x8580f8b1  ! 284: WRCCR_I	wr	%r3, 0x18b1, %ccr
splash_cmpr_3_148:
	setx 0xe1769b8bb69083b6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9808011  ! 286: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
	.word 0x9f802ba9  ! 287: SIR	sir	0x0ba9
	.word 0x879022a9  ! 288: WRPR_TT_I	wrpr	%r0, 0x02a9, %tt
	.word 0x91d020b3  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_3_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902165  ! 291: WRPR_TT_I	wrpr	%r0, 0x0165, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_150:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 292: RDPC	rd	%pc, %r11
debug_3_151:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_152:
	.word 0x91900008  ! 294: WRPR_PIL_R	wrpr	%r0, %r8, %pil
	setx 0xee524cdd0f004beb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_3_154:
	set 0x60740000, %r31
	.word 0x85842b87  ! 296: WRCCR_I	wr	%r16, 0x0b87, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_3_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_156:
	setx 0x98fd1f5ea346394e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_3_157:
	setx 0x61587b14ecbb2f31, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_3_158-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_158:
	.word 0x9191000c  ! 302: WRPR_PIL_R	wrpr	%r4, %r12, %pil
splash_hpstate_3_159:
	.word 0x81982137  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0137, %hpstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 305: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
	.word 0xd48008a0  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_3_161:
	setx 0x475db4289507be7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_3_162:
	setx 0x58fe7b517504f534, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_3_163:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_164:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 311: RDPC	rd	%pc, %r13
DS_3_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb2c303  ! 312: ALIGNADDRESS	alignaddr	%r11, %r3, %r13
	.word 0xab847849  ! 313: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1849, %clear_softint
	.word 0xd8d004a0  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_3_167:
	setx 0x5d03d4607581a6a9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
splash_cmpr_3_168:
	setx 0x27ac2e8554d2d240, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_169:
	setx 0x01ba39e6835e0117, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_170:
	setx 0xc4fecd6768da8382, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_171:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 322: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xd6d004a0  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_tba_3_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa784c006  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r6, %-
	.word 0xd6c7e030  ! 327: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad84b706  ! 329: WR_SOFTINT_REG_I	wr	%r18, 0x1706, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 331: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 332: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768f523  ! 333: SDIVX_I	sdivx	%r3, 0xfffff523, %r11
	.word 0x97a10d26  ! 334: FsMULd	fsmuld	%f4, %f6, %f42
	.word 0x8d902b21  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x0b21, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_3_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a209c8  ! 1: FDIVd	fdivd	%f8, %f8, %f12
	.word 0xa5a34826  ! 337: FADDs	fadds	%f13, %f6, %f18
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa1414000  ! 338: RDPC	rd	%pc, %r16
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_3_178:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_3_180:
	setx 0x64252c93329d6bd4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_3_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_181-donret_3_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_3_183:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_3_184-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_184:
	.word 0x9194000c  ! 348: WRPR_PIL_R	wrpr	%r16, %r12, %pil
debug_3_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_3_186:
	tsubcctv %r12, 0x1a9f, %r22
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa190200c  ! 352: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_3_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa3a14830  ! 353: FADDs	fadds	%f5, %f16, %f17
tagged_3_188:
	tsubcctv %r12, 0x1660, %r10
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01966  ! 355: FqTOd	dis not found

debug_3_190:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95520000  ! 358: RDPR_PIL	rdpr	%pil, %r10
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_192:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 359: RDPC	rd	%pc, %r11
memptr_3_193:
	set 0x60340000, %r31
	.word 0x85836450  ! 360: WRCCR_I	wr	%r13, 0x0450, %ccr
mondo_3_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d920008  ! 361: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
pmu_3_195:
	nop
	setx 0xfffff359fffff37d, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_3_196:
	setx 0x116fef55d31601ef, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa7844010  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r16, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
debug_3_198:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 368: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
mondo_3_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d944004  ! 369: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cbdf8  ! 371: SDIVX_I	sdivx	%r18, 0xfffffdf8, %r9
splash_tba_3_201:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_202:
	set 0x60740000, %r31
	.word 0x85846e0f  ! 374: WRCCR_I	wr	%r17, 0x0e0f, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_203:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 376: RDPC	rd	%pc, %r12
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_3_204:
	.word 0xa9a489c2  ! 1: FDIVd	fdivd	%f18, %f2, %f20
	allclean
	.word 0x93b34312  ! 378: ALIGNADDRESS	alignaddr	%r13, %r18, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a36d6  ! 379: SDIVX_I	sdivx	%r8, 0xfffff6d6, %r8
	.word 0x9191ad04  ! 380: WRPR_PIL_I	wrpr	%r6, 0x0d04, %pil
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_3_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_206:
	.word 0x8f902000  ! 384: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_3_207-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_207:
	.word 0x9192c009  ! 385: WRPR_PIL_R	wrpr	%r11, %r9, %pil
	.word 0x91d020b3  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_208:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 387: RDPC	rd	%pc, %r20
	.word 0x8d9027bd  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x07bd, %pstate
memptr_3_209:
	set 0x60140000, %r31
	.word 0x8581a7d9  ! 389: WRCCR_I	wr	%r6, 0x07d9, %ccr
memptr_3_210:
	set user_data_start, %r31
	.word 0x85817404  ! 390: WRCCR_I	wr	%r5, 0x1404, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa190200b  ! 392: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_3_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3318012  ! 1: STQF_R	-	%f9, [%r18, %r6]
	normalw
	.word 0x99458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d902be6  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0be6, %pstate
change_to_randtl_3_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_213:
	.word 0x8f902000  ! 397: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9b6c800a  ! 398: SDIVX_R	sdivx	%r18, %r10, %r13
splash_lsu_3_214:
	setx 0xc289165b08c5d4dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xa984c011  ! 1: WR_SET_SOFTINT_R	wr	%r19, %r17, %set_softint
	.word 0x9f80383a  ! 2: SIR	sir	0x183a
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01960  ! 4: FqTOd	dis not found

splash_lsu_2_1:
	setx 0x0a24ee237c5209bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_2:
	setx 0x3615d85083bb9171, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d914004  ! 7: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x95454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x91a20dc7  ! 9: FdMULq	fdmulq	
DS_2_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x98808000  ! 11: ADDcc_R	addcc 	%r2, %r0, %r12
cwp_2_5:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d902c31  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0c31, %pstate
	.word 0xe8dfe000  ! 15: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0x87902216  ! 16: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_2_6:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 18: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x9b520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d9036ff  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x16ff, %pstate
intveclr_2_7:
	setx 0x45354af0f952724f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 22: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_2_9:
	set user_data_start, %r31
	.word 0x858268ec  ! 24: WRCCR_I	wr	%r9, 0x08ec, %ccr
	.word 0x91d02035  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_2_10:
	tsubcctv %r16, 0x1684, %r6
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x879020a0  ! 27: WRPR_TT_I	wrpr	%r0, 0x00a0, %tt
	.word 0x8d802004  ! 28: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd68008a0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879020d9  ! 30: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_11:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 31: RDPC	rd	%pc, %r13
debug_2_12:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 32: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_2_13:
	.word 0x81982386  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0386, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 36: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x87902012  ! 38: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0x91121e599d5f0f82, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_16:
	.word 0x81982fdc  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
pmu_2_17:
	nop
	setx 0xfffffb61fffff452, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_18:
	setx 0xbe907d94650c129f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_2_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
tagged_2_20:
	tsubcctv %r14, 0x1531, %r13
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9824001  ! 47: WR_SET_SOFTINT_R	wr	%r9, %r1, %set_softint
cwp_2_21:
    set user_data_start, %o7
	.word 0x93902003  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_22) + 40, 16, 16)) -> intp(5,0,18)
intvec_2_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab820013  ! 50: WR_CLEAR_SOFTINT_R	wr	%r8, %r19, %clear_softint
	.word 0x91d020b4  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_2_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad81fb8a  ! 56: WR_SOFTINT_REG_I	wr	%r7, 0x1b8a, %softint
	setx 0x447f50bd23db0544, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 58: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x91500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_2_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_2_27:
	set user_data_start, %r31
	.word 0x85817c0e  ! 63: WRCCR_I	wr	%r5, 0x1c0e, %ccr
splash_tba_2_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x96da0013  ! 66: SMULcc_R	smulcc 	%r8, %r19, %r11
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
	.word 0xa7414000  ! 67: RDPC	rd	%pc, %r19
	.word 0x8d902f40  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0f40, %pstate
	.word 0xa150c000  ! 69: RDPR_TT	<illegal instruction>
memptr_2_31:
	set 0x60340000, %r31
	.word 0x8584a18f  ! 70: WRCCR_I	wr	%r18, 0x018f, %ccr
mondo_2_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d920006  ! 71: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800b60  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0xa8fa000d  ! 74: SDIVcc_R	sdivcc 	%r8, %r13, %r20
	.word 0xd49004a0  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_2_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a009c2  ! 1: FDIVd	fdivd	%f0, %f2, %f40
	normalw
	.word 0x97458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r11
cwp_2_34:
    set user_data_start, %o7
	.word 0x93902000  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_35)+8, 16, 16)) -> intp(2,1,3)
xir_2_35:
	.word 0xa984aab7  ! 78: WR_SET_SOFTINT_I	wr	%r18, 0x0ab7, %set_softint
memptr_2_36:
	set user_data_start, %r31
	.word 0x8580e9cd  ! 79: WRCCR_I	wr	%r3, 0x09cd, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_37:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 80: RDPC	rd	%pc, %r11
	.word 0xd6c80e40  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 82: RDPC	rd	%pc, %r19
debug_2_39:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 83: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
cwp_2_40:
    set user_data_start, %o7
	.word 0x93902001  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd68008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_2_41:
	setx 0x456e40179d6ef47b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916879fa  ! 87: SDIVX_I	sdivx	%r1, 0xfffff9fa, %r8
debug_2_43:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902bff  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0bff, %pstate
	.word 0x9f803a95  ! 90: SIR	sir	0x1a95
	.word 0xa1902004  ! 91: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_2_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d944006  ! 92: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x93d02034  ! 93: Tcc_I	tne	icc_or_xcc, %r0 + 52
mondo_2_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d90c006  ! 94: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
	.word 0xa190200f  ! 95: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902381  ! 96: WRPR_TT_I	wrpr	%r0, 0x0381, %tt
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 99: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_2_47:
	set 0x60140000, %r31
	.word 0x8582f66a  ! 100: WRCCR_I	wr	%r11, 0x166a, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_2_49:
	nop
	setx 0xfffffe18fffff5fc, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f6, %f14
	.word 0x9bb4c30d  ! 103: ALIGNADDRESS	alignaddr	%r19, %r13, %r13
	.word 0x879021fd  ! 104: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
splash_cmpr_2_51:
	setx 0x2d00b5c5f57e98d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 106: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6800b80  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_52) + 48, 16, 16)) -> intp(0,0,18)
intvec_2_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_53:
    set user_data_start, %o7
	.word 0x93902002  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_2_54:
	set user_data_start, %r31
	.word 0x8584e96b  ! 111: WRCCR_I	wr	%r19, 0x096b, %ccr
intveclr_2_55:
	setx 0xc555ce463fb5fb92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xa9540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0x91450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xa04a8013  ! 116: MULX_R	mulx 	%r10, %r19, %r16
	.word 0x9f8020e2  ! 117: SIR	sir	0x00e2
	.word 0xd497e020  ! 118: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_56) + 56, 16, 16)) -> intp(3,0,19)
intvec_2_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_57:
	setx 0xae6349bbf7db93b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_2_58:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d020b2  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93a00167  ! 128: FABSq	dis not found

	.word 0x9b500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x879020aa  ! 130: WRPR_TT_I	wrpr	%r0, 0x00aa, %tt
splash_cmpr_2_60:
	setx 0xc60fac64b165cd02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe8880e80  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
cwp_2_61:
    set user_data_start, %o7
	.word 0x93902004  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d90213a  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x013a, %pstate
	.word 0x87802004  ! 135: WRASI_I	wr	%r0, 0x0004, %asi
cwp_2_62:
    set user_data_start, %o7
	.word 0x93902003  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99902004  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0xa4852b51  ! 139: ADDcc_I	addcc 	%r20, 0x0b51, %r18
debug_2_63:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 140: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xd48008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_64:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_65:
	setx 0x48f90c8cb4242ee2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_66:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_2_67:
	setx 0x65cb0c640a808275, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902011  ! 147: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_2_68:
	set 0x60540000, %r31
	.word 0x858472c8  ! 149: WRCCR_I	wr	%r17, 0x12c8, %ccr
splash_lsu_2_69:
	setx 0xe93e710c6e5c64bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_70:
	setx 0xe1ace1e41daa1c94, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_72) + 0, 16, 16)) -> intp(1,0,3)
intvec_2_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790202b  ! 154: WRPR_TT_I	wrpr	%r0, 0x002b, %tt
debug_2_73:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_2_74:
	setx 0x61f08848bbd40339, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 158: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e000  ! 159: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
DS_2_75:
	.word 0x9ba289c8  ! 1: FDIVd	fdivd	%f10, %f8, %f44
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x91d02034  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe2800ac0  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
DS_2_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f4, %f14
	.word 0x91b40312  ! 164: ALIGNADDRESS	alignaddr	%r16, %r18, %r8
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_77:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 165: RDPC	rd	%pc, %r12
splash_cmpr_2_78:
	setx 0xaa7d5cdfc5220541, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903bae  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x1bae, %pstate
	rd %pc, %r19
	add %r19, (ivw_2_79-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_79:
	.word 0x91944004  ! 168: WRPR_PIL_R	wrpr	%r17, %r4, %pil
	.word 0xa7812baa  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x0baa, %-
debug_2_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_2_81:
    set user_data_start, %o7
	.word 0x93902001  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cbcae  ! 172: SDIVX_I	sdivx	%r18, 0xfffffcae, %r8
	setx 0xe86391f118a07c39, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790216b  ! 174: WRPR_TT_I	wrpr	%r0, 0x016b, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68bf03  ! 175: SDIVX_I	sdivx	%r2, 0xffffff03, %r13
debug_2_85:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_2_86:
	tsubcctv %r10, 0x1b7c, %r19
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d903f55  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x1f55, %pstate
	.word 0x87802058  ! 181: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa1902000  ! 182: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_2_87:
	setx 0x9fe796873ccca1db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_2_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d934004  ! 185: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_2_89:
	.word 0x81982f05  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f05, %hpstate
intveclr_2_90:
	setx 0xba5a020342198d4d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_91-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_91:
	.word 0x91928014  ! 189: WRPR_PIL_R	wrpr	%r10, %r20, %pil
debug_2_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200c  ! 191: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_2_93:
	setx 0x7342cdf1cf5bab95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00167  ! 193: FABSq	dis not found

	.word 0xa7847b13  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x1b13, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_94:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 195: RDPC	rd	%pc, %r9
	.word 0x87902210  ! 196: WRPR_TT_I	wrpr	%r0, 0x0210, %tt
intveclr_2_95:
	setx 0x6a1eb365ec1f4c0c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_96:
	.word 0x8f902001  ! 198: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_2_97:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_98-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_98:
	.word 0x91910002  ! 200: WRPR_PIL_R	wrpr	%r4, %r2, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_2_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d920001  ! 202: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
DS_2_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_2_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91400d  ! 206: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
	setx 0xbcee005438be6f3b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_104:
	.word 0x8f902000  ! 208: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01967  ! 209: FqTOd	dis not found

splash_cmpr_2_106:
	setx 0x937fc58d86f0f738, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021aa  ! 212: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
	.word 0x91a509d2  ! 213: FDIVd	fdivd	%f20, %f18, %f8
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90800b  ! 214: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_2_108:
	setx 0xfe29681579bbc2f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_2_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_2_110-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_110:
	.word 0x9194c004  ! 219: WRPR_PIL_R	wrpr	%r19, %r4, %pil
splash_cmpr_2_111:
	setx 0xb02039b858019f68, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa9a00163  ! 223: FABSq	dis not found

memptr_2_112:
	set 0x60140000, %r31
	.word 0x8580362f  ! 224: WRCCR_I	wr	%r0, 0x162f, %ccr
splash_hpstate_2_113:
	.word 0x81982e96  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
DS_2_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd144ae51	! Random illegal ?
	.word 0xd1140012  ! 1: LDQF_R	-	[%r16, %r18], %f8
	.word 0xa1a48826  ! 226: FADDs	fadds	%f18, %f6, %f16
splash_cmpr_2_115:
	setx 0xbee279fe4e6bc802, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_116:
    set user_data_start, %o7
	.word 0x93902007  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_2_117:
	set user_data_start, %r31
	.word 0x8580bbe9  ! 230: WRCCR_I	wr	%r2, 0x1be9, %ccr
	.word 0x93d020b2  ! 231: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xa1902005  ! 232: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_2_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91800b  ! 233: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
change_to_randtl_2_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_119:
	.word 0x8f902000  ! 234: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96b6a27  ! 236: SDIVX_I	sdivx	%r13, 0x0a27, %r20
	.word 0x8d902b26  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0b26, %pstate
mondo_2_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d940003  ! 238: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0xad852530  ! 239: WR_SOFTINT_REG_I	wr	%r20, 0x0530, %softint
	.word 0xa1902003  ! 240: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd2900e60  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x73, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_2_122:
	setx 0x680cbfd255c31c2a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_123:
	taddcctv %r19, 0x164e, %r13
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_2_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8d902ce8  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0ce8, %pstate
debug_2_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e030  ! 249: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
memptr_2_126:
	set user_data_start, %r31
	.word 0x8581e4c4  ! 250: WRCCR_I	wr	%r7, 0x04c4, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_2_127:
	.word 0x8198280f  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
tagged_2_128:
	tsubcctv %r10, 0x1e92, %r7
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0xa7414000  ! 254: RDPC	rd	%pc, %r19
	.word 0x8780204f  ! 255: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_2_130:
	setx 0x0a46fd1cdeb58930, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7828013  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r19, %-
splash_htba_2_132:
	set 0x003a0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_2_133:
	nop
	setx 0xfffffcd4fffffaec, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368a51c  ! 262: SDIVX_I	sdivx	%r2, 0x051c, %r9
	.word 0x879023e5  ! 263: WRPR_TT_I	wrpr	%r0, 0x03e5, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a6970  ! 264: SDIVX_I	sdivx	%r9, 0x0970, %r12
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_2_137:
	setx 0xb6a4712b473284b1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 268: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 269: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_2_138:
	setx 0x97e9caef64e2b246, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_139:
	.word 0x819820cf  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cf, %hpstate
	.word 0x8790222c  ! 272: WRPR_TT_I	wrpr	%r0, 0x022c, %tt
splash_tba_2_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_141:
	setx 0x60f5442a244b5d94, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_142:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_2_143:
	setx 0x27c7896b08180a76, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d80e80  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0x8d903a5d  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x1a5d, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d908005  ! 280: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
tagged_2_145:
	taddcctv %r21, 0x181c, %r18
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad8436cb  ! 282: WR_SOFTINT_REG_I	wr	%r16, 0x16cb, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_146) + 8, 16, 16)) -> intp(1,0,17)
intvec_2_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_147:
	set user_data_start, %r31
	.word 0x85842c69  ! 284: WRCCR_I	wr	%r16, 0x0c69, %ccr
splash_cmpr_2_148:
	setx 0x9c7c2a9f6812f7c9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9840013  ! 286: WR_SET_SOFTINT_R	wr	%r16, %r19, %set_softint
	.word 0x9f80339b  ! 287: SIR	sir	0x139b
	.word 0x87902301  ! 288: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
	.word 0x91d02034  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_2_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902301  ! 291: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_150:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 292: RDPC	rd	%pc, %r12
debug_2_151:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_152-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_152:
	.word 0x9192c008  ! 294: WRPR_PIL_R	wrpr	%r11, %r8, %pil
	setx 0xd49f282300cfdf13, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_154:
	set 0x60140000, %r31
	.word 0x8584a730  ! 296: WRCCR_I	wr	%r18, 0x0730, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_2_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_156:
	setx 0x175cfe36268d6632, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_2_157:
	setx 0x7a4b8c541d24b2f6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_2_158-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_158:
	.word 0x91918001  ! 302: WRPR_PIL_R	wrpr	%r6, %r1, %pil
splash_hpstate_2_159:
	.word 0x8198216e  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x016e, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 304: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_2_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d930011  ! 305: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xd48008a0  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_2_161:
	setx 0x90b87cb1ea731d67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_162:
	setx 0x7ce3cc1e5aa995f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_2_163:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_164:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 311: RDPC	rd	%pc, %r13
DS_2_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x95b1c30c  ! 312: ALIGNADDRESS	alignaddr	%r7, %r12, %r10
	.word 0xab83306c  ! 313: WR_CLEAR_SOFTINT_I	wr	%r12, 0x106c, %clear_softint
	.word 0xd8d00e40  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_2_167:
	setx 0xf7e823c7ed60ad6b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
splash_cmpr_2_168:
	setx 0x46621d7e6d35867b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_169:
	setx 0x4e3f1aeb295aec85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_170:
	setx 0x8004f5bb6355fd96, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_171:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 322: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xd6d004a0  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_tba_2_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa7824011  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r17, %-
	.word 0xd6c7e000  ! 327: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad85335f  ! 329: WR_SOFTINT_REG_I	wr	%r20, 0x135f, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 331: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 332: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76ab93b  ! 333: SDIVX_I	sdivx	%r10, 0xfffff93b, %r19
	.word 0x95a50d24  ! 334: FsMULd	fsmuld	%f20, %f4, %f10
	.word 0x8d90341c  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x141c, %pstate
	.word 0xd0900e40  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
DS_2_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f10
	.word 0x93a1882c  ! 337: FADDs	fadds	%f6, %f12, %f9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 338: RDPC	rd	%pc, %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_2_178:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_2_180:
	setx 0x17b978850b3203b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_2_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_181-donret_2_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_2_183:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_2_184-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_184:
	.word 0x91924008  ! 348: WRPR_PIL_R	wrpr	%r9, %r8, %pil
debug_2_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_2_186:
	tsubcctv %r21, 0x16c5, %r24
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa1902005  ! 352: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_2_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a00543  ! 1: FSQRTd	fsqrt	
	.word 0xa7a5082a  ! 353: FADDs	fadds	%f20, %f10, %f19
tagged_2_188:
	tsubcctv %r13, 0x11e3, %r24
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01974  ! 355: FqTOd	dis not found

debug_2_190:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1520000  ! 358: RDPR_PIL	rdpr	%pil, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_192:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 359: RDPC	rd	%pc, %r12
memptr_2_193:
	set 0x60540000, %r31
	.word 0x8581664c  ! 360: WRCCR_I	wr	%r5, 0x064c, %ccr
mondo_2_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d948007  ! 361: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
pmu_2_195:
	nop
	setx 0xfffff9eafffffab5, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_2_196:
	setx 0x840c54ea78ce4028, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa7820012  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r18, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
debug_2_198:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 368: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
mondo_2_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d94000d  ! 369: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b683f38  ! 371: SDIVX_I	sdivx	%r0, 0xffffff38, %r13
splash_tba_2_201:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_2_202:
	set 0x60140000, %r31
	.word 0x8580ee99  ! 374: WRCCR_I	wr	%r3, 0x0e99, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 376: RDPC	rd	%pc, %r13
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_2_204:
	.word 0xa3a309ca  ! 1: FDIVd	fdivd	%f12, %f10, %f48
	allclean
	.word 0xa5b4c306  ! 378: ALIGNADDRESS	alignaddr	%r19, %r6, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9683ab9  ! 379: SDIVX_I	sdivx	%r0, 0xfffffab9, %r20
	.word 0x9191f081  ! 380: WRPR_PIL_I	wrpr	%r7, 0x1081, %pil
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_2_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_206:
	.word 0x8f902000  ! 384: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	rd %pc, %r19
	add %r19, (ivw_2_207-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_207:
	.word 0x9192c00a  ! 385: WRPR_PIL_R	wrpr	%r11, %r10, %pil
	.word 0x91d020b4  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_208:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 387: RDPC	rd	%pc, %r10
	.word 0x8d9028c2  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x08c2, %pstate
memptr_2_209:
	set 0x60340000, %r31
	.word 0x8580f879  ! 389: WRCCR_I	wr	%r3, 0x1879, %ccr
memptr_2_210:
	set user_data_start, %r31
	.word 0x858261d5  ! 390: WRCCR_I	wr	%r9, 0x01d5, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa190200d  ! 392: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_2_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9340001  ! 1: STQF_R	-	%f20, [%r1, %r16]
	normalw
	.word 0x97458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902380  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0380, %pstate
change_to_randtl_2_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_213:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x996b400d  ! 398: SDIVX_R	sdivx	%r13, %r13, %r12
splash_lsu_2_214:
	setx 0xe5892dab07477c9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xa980000a  ! 1: WR_SET_SOFTINT_R	wr	%r0, %r10, %set_softint
	.word 0x9f803203  ! 2: SIR	sir	0x1203
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01974  ! 4: FqTOd	dis not found

splash_lsu_1_1:
	setx 0x65b5b0547ccf1be5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_2:
	setx 0x9ea3e47a3af54c4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d91c012  ! 7: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0xa7454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0xa5a0cdcc  ! 9: FdMULq	fdmulq	
DS_1_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa485000a  ! 11: ADDcc_R	addcc 	%r20, %r10, %r18
cwp_1_5:
    set user_data_start, %o7
	.word 0x93902007  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d90221e  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x021e, %pstate
	.word 0xe8dfe000  ! 15: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0x879022e2  ! 16: WRPR_TT_I	wrpr	%r0, 0x02e2, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_1_6:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 18: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x99520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d9025cd  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x05cd, %pstate
intveclr_1_7:
	setx 0x034deb816fa007fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d92c002  ! 22: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_1_9:
	set user_data_start, %r31
	.word 0x8582b42d  ! 24: WRCCR_I	wr	%r10, 0x142d, %ccr
	.word 0x91d02033  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_1_10:
	tsubcctv %r3, 0x1af8, %r13
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x8790233a  ! 27: WRPR_TT_I	wrpr	%r0, 0x033a, %tt
	.word 0x8d802000  ! 28: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68008a0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87902374  ! 30: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_11:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 31: RDPC	rd	%pc, %r13
debug_1_12:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 32: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_1_13:
	.word 0x819820dd  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x8790231d  ! 38: WRPR_TT_I	wrpr	%r0, 0x031d, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0x1b03a8f52f7bb3d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_16:
	.word 0x81982d16  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d16, %hpstate
pmu_1_17:
	nop
	setx 0xfffff706fffffa6b, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_18:
	setx 0xa60543cb17d17a39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_1_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
tagged_1_20:
	tsubcctv %r3, 0x167f, %r5
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9814014  ! 47: WR_SET_SOFTINT_R	wr	%r5, %r20, %set_softint
cwp_1_21:
    set user_data_start, %o7
	.word 0x93902005  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_22) + 24, 16, 16)) -> intp(2,0,28)
intvec_1_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab848006  ! 50: WR_CLEAR_SOFTINT_R	wr	%r18, %r6, %clear_softint
	.word 0x91d02033  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 52: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_1_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad846b4b  ! 56: WR_SOFTINT_REG_I	wr	%r17, 0x0b4b, %softint
	setx 0xbe66e9cfce9ee00f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 58: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x99500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_1_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_1_27:
	set user_data_start, %r31
	.word 0x8582b986  ! 63: WRCCR_I	wr	%r10, 0x1986, %ccr
splash_tba_1_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9adb0010  ! 66: SMULcc_R	smulcc 	%r12, %r16, %r13
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
	.word 0x91414000  ! 67: RDPC	rd	%pc, %r8
	.word 0x8d903912  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x1912, %pstate
	.word 0x9950c000  ! 69: RDPR_TT	<illegal instruction>
memptr_1_31:
	set 0x60740000, %r31
	.word 0x858524c4  ! 70: WRCCR_I	wr	%r20, 0x04c4, %ccr
mondo_1_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d900003  ! 71: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x92f88007  ! 74: SDIVcc_R	sdivcc 	%r2, %r7, %r9
	.word 0xd49004a0  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_1_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f50
	normalw
	.word 0xa5458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r18
cwp_1_34:
    set user_data_start, %o7
	.word 0x93902002  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_35)+24, 16, 16)) -> intp(1,1,3)
xir_1_35:
	.word 0xa9813c6d  ! 78: WR_SET_SOFTINT_I	wr	%r4, 0x1c6d, %set_softint
memptr_1_36:
	set user_data_start, %r31
	.word 0x8582eb6c  ! 79: WRCCR_I	wr	%r11, 0x0b6c, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_37:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 80: RDPC	rd	%pc, %r13
	.word 0xd6c80e80  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_38:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 82: RDPC	rd	%pc, %r10
debug_1_39:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 83: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
cwp_1_40:
    set user_data_start, %o7
	.word 0x93902006  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd68008a0  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_1_41:
	setx 0x26bf04a656b8a09b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ca349  ! 87: SDIVX_I	sdivx	%r18, 0x0349, %r12
debug_1_43:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902c52  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x9f80246b  ! 90: SIR	sir	0x046b
	.word 0xa190200e  ! 91: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_1_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d920004  ! 92: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
	.word 0x91d020b2  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_1_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 94: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	.word 0xa1902008  ! 95: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87902190  ! 96: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_47:
	set 0x60540000, %r31
	.word 0x8584a788  ! 100: WRCCR_I	wr	%r18, 0x0788, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_1_49:
	nop
	setx 0xfffffafbfffff0c7, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f20, %f14
	.word 0x91b04304  ! 103: ALIGNADDRESS	alignaddr	%r1, %r4, %r8
	.word 0x87902111  ! 104: WRPR_TT_I	wrpr	%r0, 0x0111, %tt
splash_cmpr_1_51:
	setx 0xeee577e3a46e595c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 106: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe68008a0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_52) + 56, 16, 16)) -> intp(0,0,28)
intvec_1_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_53:
    set user_data_start, %o7
	.word 0x93902006  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_1_54:
	set user_data_start, %r31
	.word 0x8582aeb2  ! 111: WRCCR_I	wr	%r10, 0x0eb2, %ccr
intveclr_1_55:
	setx 0x6cce222efdb43f3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x9b540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0x91450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x90490012  ! 116: MULX_R	mulx 	%r4, %r18, %r8
	.word 0x9f8032fd  ! 117: SIR	sir	0x12fd
	.word 0xd497e030  ! 118: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_56) + 56, 16, 16)) -> intp(4,0,27)
intvec_1_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_57:
	setx 0xf74cb32968e3265c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_1_58:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d02035  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91a0016d  ! 128: FABSq	dis not found

	.word 0x97500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x87902305  ! 130: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
splash_cmpr_1_60:
	setx 0x17a195631509777c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_1_61:
    set user_data_start, %o7
	.word 0x93902006  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902d85  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x0d85, %pstate
	.word 0x87802083  ! 135: WRASI_I	wr	%r0, 0x0083, %asi
cwp_1_62:
    set user_data_start, %o7
	.word 0x93902000  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902004  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0xa8843bf5  ! 139: ADDcc_I	addcc 	%r16, 0xfffffbf5, %r20
debug_1_63:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 140: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xd4800aa0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 142: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_1_64:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_65:
	setx 0xc3fa33cbfde8b458, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_66:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_1_67:
	setx 0x7c769299e04ebbb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022e8  ! 147: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_1_68:
	set 0x60340000, %r31
	.word 0x8582ab30  ! 149: WRCCR_I	wr	%r10, 0x0b30, %ccr
splash_lsu_1_69:
	setx 0xdb99ee90d52b7129, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_70:
	setx 0x35bd2eb7680225ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_72) + 32, 16, 16)) -> intp(2,0,5)
intvec_1_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023fa  ! 154: WRPR_TT_I	wrpr	%r0, 0x03fa, %tt
debug_1_73:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_1_74:
	setx 0x639eb4e840303640, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 158: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e020  ! 159: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
DS_1_75:
	.word 0xa5a249c6  ! 1: FDIVd	fdivd	%f40, %f6, %f18
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x91d02032  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe2800c00  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
DS_1_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f4, %f14
	.word 0x99b34301  ! 164: ALIGNADDRESS	alignaddr	%r13, %r1, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_77:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 165: RDPC	rd	%pc, %r13
splash_cmpr_1_78:
	setx 0xc1b5be758755d65b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902c8c  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0c8c, %pstate
	rd %pc, %r19
	add %r19, (ivw_1_79-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_79:
	.word 0x9194400c  ! 168: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0xa780a2d2  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r2, 0x02d2, %-
debug_1_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_1_81:
    set user_data_start, %o7
	.word 0x93902002  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b3d92  ! 172: SDIVX_I	sdivx	%r12, 0xfffffd92, %r9
	setx 0x41c0cfe5edaae8bf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790224e  ! 174: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368b551  ! 175: SDIVX_I	sdivx	%r2, 0xfffff551, %r9
debug_1_85:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe28008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_1_86:
	tsubcctv %r12, 0x128b, %r23
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d903a54  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x1a54, %pstate
	.word 0x87802058  ! 181: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa190200f  ! 182: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_1_87:
	setx 0x4c004186b3dfdabb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 184: Tcc_I	te	icc_or_xcc, %r0 + 180
mondo_1_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d910001  ! 185: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_1_89:
	.word 0x81982e9c  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
intveclr_1_90:
	setx 0x956778710ad74408, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_1_91-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_91:
	.word 0x91940010  ! 189: WRPR_PIL_R	wrpr	%r16, %r16, %pil
debug_1_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 191: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_1_93:
	setx 0xe377b420af009dcf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a0016d  ! 193: FABSq	dis not found

	.word 0xa782628d  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r9, 0x028d, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_94:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 195: RDPC	rd	%pc, %r12
	.word 0x879023ce  ! 196: WRPR_TT_I	wrpr	%r0, 0x03ce, %tt
intveclr_1_95:
	setx 0xbf208cd73287ab17, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_96:
	.word 0x8f902002  ! 198: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_1_97:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_98-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_98:
	.word 0x91914010  ! 200: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_1_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d930000  ! 202: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
DS_1_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd88008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_tba_1_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94800d  ! 206: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	setx 0x88bb96ca51ee3189, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_104:
	.word 0x8f902001  ! 208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01965  ! 209: FqTOd	dis not found

splash_cmpr_1_106:
	setx 0x3bb3b5d4838dd8b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021e4  ! 212: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
	.word 0xa9a449c1  ! 213: FDIVd	fdivd	%f48, %f32, %f20
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d950010  ! 214: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_1_108:
	setx 0x92781042ac61f939, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_1_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_1_110-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_110:
	.word 0x91944005  ! 219: WRPR_PIL_R	wrpr	%r17, %r5, %pil
splash_cmpr_1_111:
	setx 0x01956a34ccc25d4d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x93a0016a  ! 223: FABSq	dis not found

memptr_1_112:
	set 0x60740000, %r31
	.word 0x8581af07  ! 224: WRCCR_I	wr	%r6, 0x0f07, %ccr
splash_hpstate_1_113:
	.word 0x81982046  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
DS_1_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8372ed2f	! Random illegal ?
	.word 0xd3110012  ! 1: LDQF_R	-	[%r4, %r18], %f9
	.word 0x95a04834  ! 226: FADDs	fadds	%f1, %f20, %f10
splash_cmpr_1_115:
	setx 0x7efb47b684a04d18, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_116:
    set user_data_start, %o7
	.word 0x93902007  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_1_117:
	set user_data_start, %r31
	.word 0x8580787b  ! 230: WRCCR_I	wr	%r1, 0x187b, %ccr
	.word 0x93d020b3  ! 231: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xa1902007  ! 232: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_1_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d904005  ! 233: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
change_to_randtl_1_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_119:
	.word 0x8f902003  ! 234: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a3f4f  ! 236: SDIVX_I	sdivx	%r8, 0xffffff4f, %r9
	.word 0x8d902898  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
mondo_1_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 238: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xad80f1b4  ! 239: WR_SOFTINT_REG_I	wr	%r3, 0x11b4, %softint
	.word 0xa1902007  ! 240: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd29004a0  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_1_122:
	setx 0xeeecc24e42ffd66a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_123:
	taddcctv %r14, 0x1042, %r23
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_1_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0x8d902350  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0350, %pstate
debug_1_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e010  ! 249: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
memptr_1_126:
	set user_data_start, %r31
	.word 0x8584f1dc  ! 250: WRCCR_I	wr	%r19, 0x11dc, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_1_127:
	.word 0x81982546  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
tagged_1_128:
	tsubcctv %r6, 0x147d, %r1
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 254: RDPC	rd	%pc, %r8
	.word 0x8780208a  ! 255: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_1_130:
	setx 0xaf05a3426e5d2df3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa783400c  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r12, %-
splash_htba_1_132:
	set 0x003b0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_1_133:
	nop
	setx 0xfffff616fffff98d, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36ca16e  ! 262: SDIVX_I	sdivx	%r18, 0x016e, %r17
	.word 0x87902398  ! 263: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c22ff  ! 264: SDIVX_I	sdivx	%r16, 0x02ff, %r13
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_1_137:
	setx 0x6edd24b96a76457c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 269: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_1_138:
	setx 0x50cc4b37099737ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_139:
	.word 0x81982246  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0246, %hpstate
	.word 0x8790221e  ! 272: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
splash_tba_1_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_141:
	setx 0xf921d1b9fa246630, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_142:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_1_143:
	setx 0xdb801ce684384f30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d80e60  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x73, %r12
	.word 0x8d903246  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x1246, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d908005  ! 280: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
tagged_1_145:
	taddcctv %r22, 0x1afa, %r8
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad84b910  ! 282: WR_SOFTINT_REG_I	wr	%r18, 0x1910, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_146) + 16, 16, 16)) -> intp(6,0,4)
intvec_1_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_147:
	set user_data_start, %r31
	.word 0x858425be  ! 284: WRCCR_I	wr	%r16, 0x05be, %ccr
splash_cmpr_1_148:
	setx 0x565739b7c6943a01, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9810008  ! 286: WR_SET_SOFTINT_R	wr	%r4, %r8, %set_softint
	.word 0x9f80233a  ! 287: SIR	sir	0x033a
	.word 0x879023fc  ! 288: WRPR_TT_I	wrpr	%r0, 0x03fc, %tt
	.word 0x91d02035  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_1_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902049  ! 291: WRPR_TT_I	wrpr	%r0, 0x0049, %tt
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_150:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 292: RDPC	rd	%pc, %r10
debug_1_151:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_152-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_152:
	.word 0x9193400b  ! 294: WRPR_PIL_R	wrpr	%r13, %r11, %pil
	setx 0xe1f9974b543df71d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_154:
	set 0x60740000, %r31
	.word 0x8582be1f  ! 296: WRCCR_I	wr	%r10, 0x1e1f, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_1_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_156:
	setx 0x185060041084e68f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 300: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_cmpr_1_157:
	setx 0x252d445a2252ec1b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_1_158-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_158:
	.word 0x9192c007  ! 302: WRPR_PIL_R	wrpr	%r11, %r7, %pil
splash_hpstate_1_159:
	.word 0x8198280c  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080c, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d91800c  ! 305: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
	.word 0xd48008a0  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_1_161:
	setx 0x753515379fe52277, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_162:
	setx 0x08fa93a345aa5d8e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_1_163:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_164:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 311: RDPC	rd	%pc, %r9
DS_1_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b44301  ! 312: ALIGNADDRESS	alignaddr	%r17, %r1, %r8
	.word 0xab82bbc7  ! 313: WR_CLEAR_SOFTINT_I	wr	%r10, 0x1bc7, %clear_softint
	.word 0xd8d00e80  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_1_167:
	setx 0xbd7fe4d2a71b886b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_cmpr_1_168:
	setx 0xec41107162e56743, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_169:
	setx 0x58fdaeeb9ae63187, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_170:
	setx 0xcc38504e38cad51b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_171:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 322: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xd6d00e40  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
splash_tba_1_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa780800b  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r11, %-
	.word 0xd6c7e000  ! 327: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad842728  ! 329: WR_SOFTINT_REG_I	wr	%r16, 0x0728, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 331: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 332: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16ab4d8  ! 333: SDIVX_I	sdivx	%r10, 0xfffff4d8, %r16
	.word 0x93a2cd2a  ! 334: FsMULd	fsmuld	%f11, %f10, %f40
	.word 0x8d903c5f  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x1c5f, %pstate
	.word 0xd0900e60  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
DS_1_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x97a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f42
	.word 0xa1a4c831  ! 337: FADDs	fadds	%f19, %f17, %f16
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 338: RDPC	rd	%pc, %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_1_178:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_1_180:
	setx 0x2ca1a04e0c04533e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_1_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_181-donret_1_181-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_1_183:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	rd %pc, %r19
	add %r19, (ivw_1_184-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_184:
	.word 0x9190c012  ! 348: WRPR_PIL_R	wrpr	%r3, %r18, %pil
debug_1_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_1_186:
	tsubcctv %r9, 0x157b, %r23
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa1902001  ! 352: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_1_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a00541  ! 1: FSQRTd	fsqrt	
	.word 0x95a4c823  ! 353: FADDs	fadds	%f19, %f3, %f10
tagged_1_188:
	tsubcctv %r19, 0x17c2, %r19
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 355: FqTOd	dis not found

debug_1_190:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95520000  ! 358: RDPR_PIL	rdpr	%pil, %r10
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_192:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 359: RDPC	rd	%pc, %r8
memptr_1_193:
	set 0x60740000, %r31
	.word 0x8583741e  ! 360: WRCCR_I	wr	%r13, 0x141e, %ccr
mondo_1_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d914008  ! 361: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
pmu_1_195:
	nop
	setx 0xfffff736fffff57b, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_1_196:
	setx 0x96c0b8d526004a74, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa784800d  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r13, %-
	.word 0xe88804a0  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
debug_1_198:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 368: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
mondo_1_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 369: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b696ee6  ! 371: SDIVX_I	sdivx	%r5, 0x0ee6, %r13
splash_tba_1_201:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_202:
	set 0x60140000, %r31
	.word 0x85827bf9  ! 374: WRCCR_I	wr	%r9, 0x1bf9, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 376: RDPC	rd	%pc, %r10
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_1_204:
	.word 0xa7a049c4  ! 1: FDIVd	fdivd	%f32, %f4, %f50
	allclean
	.word 0x91b20301  ! 378: ALIGNADDRESS	alignaddr	%r8, %r1, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996ce51c  ! 379: SDIVX_I	sdivx	%r19, 0x051c, %r12
	.word 0x9192ea4c  ! 380: WRPR_PIL_I	wrpr	%r11, 0x0a4c, %pil
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_1_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_206:
	.word 0x8f902001  ! 384: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	rd %pc, %r19
	add %r19, (ivw_1_207-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_207:
	.word 0x91908010  ! 385: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0x83d02034  ! 386: Tcc_I	te	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_208:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 387: RDPC	rd	%pc, %r11
	.word 0x8d902f98  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0f98, %pstate
memptr_1_209:
	set 0x60140000, %r31
	.word 0x8584aa3a  ! 389: WRCCR_I	wr	%r18, 0x0a3a, %ccr
memptr_1_210:
	set user_data_start, %r31
	.word 0x8580fd07  ! 390: WRCCR_I	wr	%r3, 0x1d07, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa190200b  ! 392: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_1_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7344005  ! 1: STQF_R	-	%f11, [%r5, %r17]
	normalw
	.word 0x99458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d903720  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x1720, %pstate
change_to_randtl_1_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_213:
	.word 0x8f902003  ! 397: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9769c002  ! 398: SDIVX_R	sdivx	%r7, %r2, %r11
splash_lsu_1_214:
	setx 0x6b59e91ab26966ef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xa981c00a  ! 1: WR_SET_SOFTINT_R	wr	%r7, %r10, %set_softint
	.word 0x9f802e30  ! 2: SIR	sir	0x0e30
	.word 0xe937c000  ! 3: STQF_R	-	%f20, [%r0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 4: FqTOd	dis not found

splash_lsu_0_1:
	setx 0x8cc7300252b528a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_2:
	setx 0x5a410fdd16804ed3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d928012  ! 7: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0x95454000  ! 8: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x97a48dc2  ! 9: FdMULq	fdmulq	
DS_0_4:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa881c003  ! 11: ADDcc_R	addcc 	%r7, %r3, %r20
cwp_0_5:
    set user_data_start, %o7
	.word 0x93902007  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x2e800001  ! 13: BVS	bvs,a	<label_0x1>
	.word 0x8d9023f2  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x03f2, %pstate
	.word 0xe8dfe030  ! 15: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0x87902192  ! 16: WRPR_TT_I	wrpr	%r0, 0x0192, %tt
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
wait_for_debug_0_6:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_6
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 18: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x97520000  ! 19: RDPR_PIL	<illegal instruction>
	.word 0x8d90372f  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x172f, %pstate
intveclr_0_7:
	setx 0x41aeec06e3ed2e09, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 22: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
memptr_0_9:
	set user_data_start, %r31
	.word 0x85813b8d  ! 24: WRCCR_I	wr	%r4, 0x1b8d, %ccr
	.word 0x93d02033  ! 25: Tcc_I	tne	icc_or_xcc, %r0 + 51
tagged_0_10:
	tsubcctv %r19, 0x1fc5, %r25
	.word 0xd607fb8d  ! 26: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r11
	.word 0x879020c2  ! 27: WRPR_TT_I	wrpr	%r0, 0x00c2, %tt
	.word 0x8d802000  ! 28: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd68008a0  ! 29: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87902241  ! 30: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_11
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_11:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 31: RDPC	rd	%pc, %r12
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
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 32: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r12
splash_hpstate_0_13:
	.word 0x81982a86  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a86, %hpstate
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
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd877c000  ! 37: STX_R	stx	%r12, [%r31 + %r0]
	.word 0x879021ee  ! 38: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0x28700001  ! 39: BPLEU	<illegal instruction>
	setx 0x3c08065d81b15f54, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_15:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_16:
	.word 0x81982915  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
pmu_0_17:
	nop
	setx 0xfffff961fffff847, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_0_18:
	setx 0x0d3c8bfbe7a409ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_0_19:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
tagged_0_20:
	tsubcctv %r25, 0x177c, %r25
	.word 0xd807fb8d  ! 46: LDUW_I	lduw	[%r31 + 0xfffffb8d], %r12
	.word 0xa9804002  ! 47: WR_SET_SOFTINT_R	wr	%r1, %r2, %set_softint
cwp_0_21:
    set user_data_start, %o7
	.word 0x93902002  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_22) + 48, 16, 16)) -> intp(4,0,16)
intvec_0_22:
	.word 0x39400001  ! 49: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab820005  ! 50: WR_CLEAR_SOFTINT_R	wr	%r8, %r5, %clear_softint
	.word 0x83d02035  ! 51: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd837fb8d  ! 53: STH_I	sth	%r12, [%r31 + 0xfffffb8d]
debug_0_23:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 54: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_24
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_24:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e005  ! 55: CASA_R	casa	[%r31] %asi, %r5, %r12
	.word 0xad82f4aa  ! 56: WR_SOFTINT_REG_I	wr	%r11, 0x14aa, %softint
	setx 0x2b5a71de2ac1d46b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_25:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 58: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd88008a0  ! 59: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x95500000  ! 60: RDPR_TPC	<illegal instruction>
	.word 0x81510000  ! 61: RDPR_TICK	<illegal instruction>
splash_tba_0_26:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 62: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_0_27:
	set user_data_start, %r31
	.word 0x8582bcee  ! 63: WRCCR_I	wr	%r10, 0x1cee, %ccr
splash_tba_0_28:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 64: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_0_29:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 65: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9adb400a  ! 66: SMULcc_R	smulcc 	%r13, %r10, %r13
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
	.word 0xa1414000  ! 67: RDPC	rd	%pc, %r16
	.word 0x8d903eee  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x1eee, %pstate
	.word 0xa550c000  ! 69: RDPR_TT	<illegal instruction>
memptr_0_31:
	set 0x60140000, %r31
	.word 0x85817b9e  ! 70: WRCCR_I	wr	%r5, 0x1b9e, %ccr
mondo_0_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 71: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800c60  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
	.word 0x94fa000b  ! 74: SDIVcc_R	sdivcc 	%r8, %r11, %r10
	.word 0xd49004a0  ! 75: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_0_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a089c9  ! 1: FDIVd	fdivd	%f2, %f40, %f42
	normalw
	.word 0x99458000  ! 76: RD_SOFTINT_REG	rd	%softint, %r12
cwp_0_34:
    set user_data_start, %o7
	.word 0x93902000  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_35)+56, 16, 16)) -> intp(0,1,3)
xir_0_35:
	.word 0xa981ed6a  ! 78: WR_SET_SOFTINT_I	wr	%r7, 0x0d6a, %set_softint
memptr_0_36:
	set user_data_start, %r31
	.word 0x8581361d  ! 79: WRCCR_I	wr	%r4, 0x161d, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_37
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_37:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 80: RDPC	rd	%pc, %r11
	.word 0xd6c804a0  ! 81: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_38:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 82: RDPC	rd	%pc, %r11
debug_0_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_39:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_39
    nop
debug_wait0_39:
    ld [%r23], %r2
    brnz %r2, debug_wait0_39
    nop
    ba,a debug_startwait0_39
continue_debug_0_39:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_39:
    cmp %r13, %r15
    bne,a wait_for_stat_0_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_39:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_39
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 83: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
cwp_0_40:
    set user_data_start, %o7
	.word 0x93902003  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd6800b80  ! 85: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
splash_cmpr_0_41:
	setx 0x36bb14b7843b9976, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 86: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969f22a  ! 87: SDIVX_I	sdivx	%r7, 0xfffff22a, %r20
debug_0_43:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902550  ! 89: WRPR_PSTATE_I	wrpr	%r0, 0x0550, %pstate
	.word 0x9f803a92  ! 90: SIR	sir	0x1a92
	.word 0xa190200d  ! 91: WRPR_GL_I	wrpr	%r0, 0x000d, %-
mondo_0_44:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d918006  ! 92: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
	.word 0x91d02032  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94c013  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xa190200a  ! 95: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x879023dc  ! 96: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 97: CASA_R	casa	[%r31] %asi, %r19, %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 99: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_0_47:
	set 0x60340000, %r31
	.word 0x8581bfdc  ! 100: WRCCR_I	wr	%r6, 0x1fdc, %ccr
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 101: CASA_R	casa	[%r31] %asi, %r19, %r20
pmu_0_49:
	nop
	setx 0xfffff5f0fffff8a9, %g1, %g7
	.word 0xa3800007  ! 102: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_0_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f20, %f8
	.word 0xa7b00303  ! 103: ALIGNADDRESS	alignaddr	%r0, %r3, %r19
	.word 0x879020e5  ! 104: WRPR_TT_I	wrpr	%r0, 0x00e5, %tt
splash_cmpr_0_51:
	setx 0x11729404517a8d8a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 106: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe6800bc0  ! 107: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_52) + 8, 16, 16)) -> intp(6,0,21)
intvec_0_52:
	.word 0x39400001  ! 108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_0_53:
    set user_data_start, %o7
	.word 0x93902004  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe737c000  ! 110: STQF_R	-	%f19, [%r0, %r31]
memptr_0_54:
	set user_data_start, %r31
	.word 0x8584319e  ! 111: WRCCR_I	wr	%r16, 0x119e, %ccr
intveclr_0_55:
	setx 0xa2f816b5e18052ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9480000  ! 113: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa3540000  ! 114: RDPR_GL	<illegal instruction>
	.word 0x93450000  ! 115: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x9449c002  ! 116: MULX_R	mulx 	%r7, %r2, %r10
	.word 0x9f803b1f  ! 117: SIR	sir	0x1b1f
	.word 0xd497e030  ! 118: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 119: BA	ba,a	<label_0x1>
	.word 0xd447c000  ! 120: LDSW_R	ldsw	[%r31 + %r0], %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_56) + 48, 16, 16)) -> intp(6,0,14)
intvec_0_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_57:
	setx 0x835aeef03ac1b14a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 122: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
debug_0_58:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 124: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_59:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 125: CASA_R	casa	[%r31] %asi, %r2, %r10
	.word 0xd46ffb1f  ! 126: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb1f]
	.word 0x91d02033  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7a00171  ! 128: FABSq	dis not found

	.word 0xa9500000  ! 129: RDPR_TPC	<illegal instruction>
	.word 0x87902004  ! 130: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
splash_cmpr_0_60:
	setx 0x3f7f2c68595729f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 131: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe88804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
cwp_0_61:
    set user_data_start, %o7
	.word 0x93902004  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902305  ! 134: WRPR_PSTATE_I	wrpr	%r0, 0x0305, %pstate
	.word 0x87802088  ! 135: WRASI_I	wr	%r0, 0x0088, %asi
cwp_0_62:
    set user_data_start, %o7
	.word 0x93902002  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902004  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x32700001  ! 138: BPNE	<illegal instruction>
	.word 0x9484ac86  ! 139: ADDcc_I	addcc 	%r18, 0x0c86, %r10
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
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 140: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd48008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 142: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_64:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_65:
	setx 0xfd899e738df24388, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_66:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_0_67:
	setx 0x3748bfa23d2e2d7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 146: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790230f  ! 147: WRPR_TT_I	wrpr	%r0, 0x030f, %tt
	.word 0xd41fec86  ! 148: LDD_I	ldd	[%r31 + 0x0c86], %r10
memptr_0_68:
	set 0x60140000, %r31
	.word 0x8580ed5b  ! 149: WRCCR_I	wr	%r3, 0x0d5b, %ccr
splash_lsu_0_69:
	setx 0x924f0c3d9ba738eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_70:
	setx 0xd22117590eeedbb8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 151: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_71:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 152: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_72) + 32, 16, 16)) -> intp(1,0,20)
intvec_0_72:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023f2  ! 154: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
debug_0_73:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 155: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd527c000  ! 156: STF_R	st	%f10, [%r0, %r31]
intveclr_0_74:
	setx 0xb98852ff58030786, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 158: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d7e030  ! 159: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
DS_0_75:
	.word 0xa3a349d3  ! 1: FDIVd	fdivd	%f44, %f50, %f48
	.word 0xbfe7c000  ! 160: SAVE_R	save	%r31, %r0, %r31
	.word 0xe28804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x91d02033  ! 162: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe2800b00  ! 163: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
DS_0_76:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f20, %f4
	.word 0x99b4c309  ! 164: ALIGNADDRESS	alignaddr	%r19, %r9, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_77
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_77
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_77:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 165: RDPC	rd	%pc, %r12
splash_cmpr_0_78:
	setx 0xa81869f8cf4e0cd3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 166: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902d1c  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0d1c, %pstate
cmp_0_79:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_79:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_79
    nop
cmp_wait0_79:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_79
    nop
    ba,a cmp_startwait0_79
continue_cmp_0_79:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 20, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194400c  ! 168: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0xa7846d8d  ! 169: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0d8d, %-
debug_0_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cwp_0_81:
    set user_data_start, %o7
	.word 0x93902004  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5697673  ! 172: SDIVX_I	sdivx	%r5, 0xfffff673, %r18
	setx 0xc7979c97b7a09b0c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023de  ! 174: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36ca419  ! 175: SDIVX_I	sdivx	%r18, 0x0419, %r17
debug_0_85:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 176: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe2800c80  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
tagged_0_86:
	tsubcctv %r2, 0x10f6, %r6
	.word 0xe207e419  ! 178: LDUW_I	lduw	[%r31 + 0x0419], %r17
	.word 0x34700001  ! 179: BPG	<illegal instruction>
	.word 0x8d902eac  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0eac, %pstate
	.word 0x87802083  ! 181: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xa1902008  ! 182: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_0_87:
	setx 0x69c4fff210a3dc59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 183: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_0_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d910002  ! 185: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 186: LDX_R	ldx	[%r31 + %r0], %r17
splash_hpstate_0_89:
	.word 0x8198269f  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069f, %hpstate
intveclr_0_90:
	setx 0x8ecfc7c2eaea84ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_0_91:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_91:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_91
    nop
cmp_wait0_91:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_91
    nop
    ba,a cmp_startwait0_91
continue_cmp_0_91:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91918011  ! 189: WRPR_PIL_R	wrpr	%r6, %r17, %pil
debug_0_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 191: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_0_93:
	setx 0x198d577c7cccc7b6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a00174  ! 193: FABSq	dis not found

	.word 0xa7836179  ! 194: WR_GRAPHICS_STATUS_REG_I	wr	%r13, 0x0179, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_94
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_94
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_94:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 195: RDPC	rd	%pc, %r12
	.word 0x879021ed  ! 196: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
intveclr_0_95:
	setx 0x0ccec975b55459c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_96:
	.word 0x8f902000  ! 198: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_97:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_98:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_98:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_98
    nop
cmp_wait0_98:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_98
    nop
    ba,a cmp_startwait0_98
continue_cmp_0_98:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 50, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934008  ! 200: WRPR_PIL_R	wrpr	%r13, %r8, %pil
	.word 0xd93fc000  ! 201: STDF_R	std	%f12, [%r0, %r31]
mondo_0_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d950006  ! 202: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
DS_0_100:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 203: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd8800b20  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
splash_tba_0_101:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 205: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_0_102:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94000b  ! 206: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	setx 0x9caa434f10972c7f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_103:
	.word 0x39400001  ! 207: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_104:
	.word 0x8f902001  ! 208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 209: FqTOd	dis not found

splash_cmpr_0_106:
	setx 0xda6f01ad0213937c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902258  ! 212: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
	.word 0xa5a349cd  ! 213: FDIVd	fdivd	%f44, %f44, %f18
mondo_0_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92c00b  ! 214: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_0_108:
	setx 0xde2de8f61766cd07, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 216: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe40fc000  ! 217: LDUB_R	ldub	[%r31 + %r0], %r18
splash_tba_0_109:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 218: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    and %r14, 0xe6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190400c  ! 219: WRPR_PIL_R	wrpr	%r1, %r12, %pil
splash_cmpr_0_111:
	setx 0xbe5e800a2bd7eb27, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 220: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 221: BPGE	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x95a00173  ! 223: FABSq	dis not found

memptr_0_112:
	set 0x60540000, %r31
	.word 0x8584a98c  ! 224: WRCCR_I	wr	%r18, 0x098c, %ccr
splash_hpstate_0_113:
	.word 0x81982a94  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
DS_0_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xab5c1df0	! Random illegal ?
	.word 0xd9108011  ! 1: LDQF_R	-	[%r2, %r17], %f12
	.word 0xa5a00832  ! 226: FADDs	fadds	%f0, %f18, %f18
splash_cmpr_0_115:
	setx 0x257edd2b89bc593a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_116:
    set user_data_start, %o7
	.word 0x93902001  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe49004a0  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
memptr_0_117:
	set user_data_start, %r31
	.word 0x858027c8  ! 230: WRCCR_I	wr	%r0, 0x07c8, %ccr
	.word 0x91d02032  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 232: WRPR_GL_I	wrpr	%r0, 0x000f, %-
mondo_0_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d91c001  ! 233: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
change_to_randtl_0_119:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_119:
	.word 0x8f902001  ! 234: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe47fe7c8  ! 235: SWAP_I	swap	%r18, [%r31 + 0x07c8]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ab74f  ! 236: SDIVX_I	sdivx	%r10, 0xfffff74f, %r9
	.word 0x8d902b51  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0b51, %pstate
mondo_0_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 238: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0xad84b490  ! 239: WR_SOFTINT_REG_I	wr	%r18, 0x1490, %softint
	.word 0xa190200c  ! 240: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd2900e80  ! 241: LDUHA_R	lduha	[%r0, %r0] 0x74, %r9
	.word 0xd28008a0  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_0_122:
	setx 0x5f2cb0a7630780da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_123:
	taddcctv %r8, 0x1943, %r1
	.word 0xd207f490  ! 244: LDUW_I	lduw	[%r31 + 0xfffff490], %r9
splash_tba_0_124:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 245: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97464000  ! 246: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x8d902f66  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0f66, %pstate
debug_0_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 248: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd697e010  ! 249: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
memptr_0_126:
	set user_data_start, %r31
	.word 0x8581e036  ! 250: WRCCR_I	wr	%r7, 0x0036, %ccr
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_0_127:
	.word 0x81982ec6  ! 252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec6, %hpstate
tagged_0_128:
	tsubcctv %r10, 0x10c1, %r14
	.word 0xd607e036  ! 253: LDUW_I	lduw	[%r31 + 0x0036], %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x99414000  ! 254: RDPC	rd	%pc, %r12
	.word 0x87802089  ! 255: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd937c000  ! 256: STQF_R	-	%f12, [%r0, %r31]
splash_cmpr_0_130:
	setx 0xa8da017a520aa533, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 257: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_0_131:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7824014  ! 258: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r20, %-
splash_htba_0_132:
	set 0x00380000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 259: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd81fc000  ! 260: LDD_R	ldd	[%r31 + %r0], %r12
pmu_0_133:
	nop
	setx 0xfffff5e2fffffc92, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91687077  ! 262: SDIVX_I	sdivx	%r1, 0xfffff077, %r8
	.word 0x87902094  ! 263: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cfb74  ! 264: SDIVX_I	sdivx	%r19, 0xfffffb74, %r12
	.word 0xd81ffb74  ! 265: LDD_I	ldd	[%r31 + 0xfffffb74], %r12
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_136:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 266: CASA_R	casa	[%r31] %asi, %r20, %r12
splash_cmpr_0_137:
	setx 0x22ce888f813935ae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_0_138:
	setx 0x5918b5084ae305c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 270: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_139:
	.word 0x8198275c  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075c, %hpstate
	.word 0x879020c0  ! 272: WRPR_TT_I	wrpr	%r0, 0x00c0, %tt
splash_tba_0_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_141:
	setx 0xb39cc22d5628f0be, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 274: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_142:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 275: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_143:
	setx 0xeee39c23e30046ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 276: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8d804a0  ! 277: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x8d902ed9  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x0ed9, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_144:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c010  ! 280: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
tagged_0_145:
	taddcctv %r13, 0x1279, %r17
	.word 0xd807fb74  ! 281: LDUW_I	lduw	[%r31 + 0xfffffb74], %r12
	.word 0xad8230ef  ! 282: WR_SOFTINT_REG_I	wr	%r8, 0x10ef, %softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_146) + 56, 16, 16)) -> intp(1,0,6)
intvec_0_146:
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_0_147:
	set user_data_start, %r31
	.word 0x858463a2  ! 284: WRCCR_I	wr	%r17, 0x03a2, %ccr
splash_cmpr_0_148:
	setx 0x20171d8f374c7f02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa980c007  ! 286: WR_SET_SOFTINT_R	wr	%r3, %r7, %set_softint
	.word 0x9f8035d4  ! 287: SIR	sir	0x15d4
	.word 0x87902026  ! 288: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
	.word 0x91d02033  ! 289: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_0_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 290: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879022a2  ! 291: WRPR_TT_I	wrpr	%r0, 0x02a2, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_150
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_150:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 292: RDPC	rd	%pc, %r10
debug_0_151:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
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
    and %r14, 34, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194000c  ! 294: WRPR_PIL_R	wrpr	%r16, %r12, %pil
	setx 0x407af1a86020e4a3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_153:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_0_154:
	set 0x60140000, %r31
	.word 0x85853e7a  ! 296: WRCCR_I	wr	%r20, 0x1e7a, %ccr
	.word 0x22800001  ! 297: BE	be,a	<label_0x1>
debug_0_155:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_156:
	setx 0xe90aec45b5d9f2df, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 299: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_157:
	setx 0x39b6a8caee872aea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 301: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_0_158:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_158:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_158
    nop
cmp_wait0_158:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_158
    nop
    ba,a cmp_startwait0_158
continue_cmp_0_158:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfc, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c004  ! 302: WRPR_PIL_R	wrpr	%r7, %r4, %pil
splash_hpstate_0_159:
	.word 0x81982a6c  ! 303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a6c, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 304: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_0_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 305: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xd4800b80  ! 306: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
splash_lsu_0_161:
	setx 0x30c3afd28a165e71, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_162:
	setx 0x3a8d344156092e93, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 308: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 309: RD_STICK_REG	stbar
debug_0_163:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_164
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_164
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_164:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 311: RDPC	rd	%pc, %r18
DS_0_165:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b50306  ! 312: ALIGNADDRESS	alignaddr	%r20, %r6, %r12
	.word 0xab80eaab  ! 313: WR_CLEAR_SOFTINT_I	wr	%r3, 0x0aab, %clear_softint
	.word 0xd8d004a0  ! 314: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 315: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_166:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e006  ! 316: CASA_R	casa	[%r31] %asi, %r6, %r12
splash_cmpr_0_167:
	setx 0x93a39dbf65268da7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 317: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97454000  ! 318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
splash_cmpr_0_168:
	setx 0xbbb08b7cc22585b5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_169:
	setx 0x015dbababff5fbd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 320: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_170:
	setx 0xd3e850c1c7d6a6f3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_171:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_171:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_171
    nop
debug_wait0_171:
    ld [%r23], %r2
    brnz %r2, debug_wait0_171
    nop
    ba,a debug_startwait0_171
continue_debug_0_171:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_171:
    cmp %r13, %r15
    bne,a wait_for_stat_0_171
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_171:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_171
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 322: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xd6d00e40  ! 323: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
splash_tba_0_172:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 324: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r11
splash_decr_0_173:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa780c013  ! 326: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r19, %-
	.word 0xd6c7e030  ! 327: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd647c000  ! 328: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xad806345  ! 329: WR_SOFTINT_REG_I	wr	%r1, 0x0345, %softint
	.word 0x2e700001  ! 330: BPVS	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 332: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d3a37  ! 333: SDIVX_I	sdivx	%r20, 0xfffffa37, %r18
	.word 0x91a40d2d  ! 334: FsMULd	fsmuld	%f16, %f44, %f8
	.word 0x8d90258c  ! 335: WRPR_PSTATE_I	wrpr	%r0, 0x058c, %pstate
	.word 0xd09004a0  ! 336: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
DS_0_175:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f10
	.word 0xa9a40833  ! 337: FADDs	fadds	%f16, %f19, %f20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
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
	.word 0x91414000  ! 338: RDPC	rd	%pc, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_177:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 339: CASA_R	casa	[%r31] %asi, %r19, %r8
debug_0_178:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 340: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 341: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_180:
	setx 0x96ee7e19150c489e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 342: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_0_181:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_181-donret_0_181-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_181:
	.word 0xd0fffa37  ! 343: SWAPA_I	swapa	%r8, [%r31 + 0xfffffa37] %asi
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 345: LDX_R	ldx	[%r31 + %r0], %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_182:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 346: CASA_R	casa	[%r31] %asi, %r19, %r8
splash_tba_0_183:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cmp_0_184:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_184:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_184
    nop
cmp_wait0_184:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_184
    nop
    ba,a cmp_startwait0_184
continue_cmp_0_184:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 12, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190400b  ! 348: WRPR_PIL_R	wrpr	%r1, %r11, %pil
debug_0_185:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x22700001  ! 350: BPE	<illegal instruction>
tagged_0_186:
	tsubcctv %r22, 0x19dd, %r11
	.word 0xd007fa37  ! 351: LDUW_I	lduw	[%r31 + 0xfffffa37], %r8
	.word 0xa1902008  ! 352: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_0_187:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a00549  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c830  ! 353: FADDs	fadds	%f19, %f16, %f9
tagged_0_188:
	tsubcctv %r6, 0x1daa, %r21
	.word 0xd207fa37  ! 354: LDUW_I	lduw	[%r31 + 0xfffffa37], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01965  ! 355: FqTOd	dis not found

debug_0_190:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 357: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa5520000  ! 358: RDPR_PIL	rdpr	%pil, %r18
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_192:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 359: RDPC	rd	%pc, %r19
memptr_0_193:
	set 0x60740000, %r31
	.word 0x8580ec9d  ! 360: WRCCR_I	wr	%r3, 0x0c9d, %ccr
mondo_0_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c006  ! 361: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
pmu_0_195:
	nop
	setx 0xfffff7f1fffff976, %g1, %g7
	.word 0xa3800007  ! 362: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9540000  ! 363: RDPR_GL	<illegal instruction>
splash_cmpr_0_196:
	setx 0x63b31938743a26d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 364: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r20
splash_decr_0_197:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa781c010  ! 366: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r16, %-
	.word 0xe8880e80  ! 367: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
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
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 368: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
mondo_0_199:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d918001  ! 369: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	.word 0xe84fec9d  ! 370: LDSB_I	ldsb	[%r31 + 0x0c9d], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7683097  ! 371: SDIVX_I	sdivx	%r0, 0xfffff097, %r19
splash_tba_0_201:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 373: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_0_202:
	set 0x60340000, %r31
	.word 0x8582eb78  ! 374: WRCCR_I	wr	%r11, 0x0b78, %ccr
	.word 0x34700001  ! 375: BPG	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_203
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 376: RDPC	rd	%pc, %r20
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
DS_0_204:
	.word 0xa3a309c0  ! 1: FDIVd	fdivd	%f12, %f0, %f48
	allclean
	.word 0x9bb48303  ! 378: ALIGNADDRESS	alignaddr	%r18, %r3, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91683e6f  ! 379: SDIVX_I	sdivx	%r0, 0xfffffe6f, %r8
	.word 0x9192675a  ! 380: WRPR_PIL_I	wrpr	%r9, 0x075a, %pil
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 382: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd08008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
change_to_randtl_0_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_206:
	.word 0x8f902001  ! 384: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cmp_0_207:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_207:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_207
    nop
cmp_wait0_207:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_207
    nop
    ba,a cmp_startwait0_207
continue_cmp_0_207:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x96, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194800d  ! 385: WRPR_PIL_R	wrpr	%r18, %r13, %pil
	.word 0x91d02034  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_208
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_208
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_208:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 387: RDPC	rd	%pc, %r8
	.word 0x8d903187  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x1187, %pstate
memptr_0_209:
	set 0x60540000, %r31
	.word 0x8583688e  ! 389: WRCCR_I	wr	%r13, 0x088e, %ccr
memptr_0_210:
	set user_data_start, %r31
	.word 0x8584eba6  ! 390: WRCCR_I	wr	%r19, 0x0ba6, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 391: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902007  ! 392: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd1e7c02d  ! 393: CASA_I	casa	[%r31] 0x 1, %r13, %r8
splash_tba_0_211:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 394: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_212:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9348010  ! 1: STQF_R	-	%f12, [%r16, %r18]
	normalw
	.word 0x91458000  ! 395: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d903038  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x1038, %pstate
change_to_randtl_0_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_213:
	.word 0x8f902002  ! 397: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9368c007  ! 398: SDIVX_R	sdivx	%r3, %r7, %r9
splash_lsu_0_214:
	setx 0x46c09f3fa3117a4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd207c000  ! 400: LDUW_R	lduw	[%r31 + %r0], %r9
cmpenall_0_215:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_215:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_215
    nop
cmpenall_wait0_215:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_215
    nop
    ba,a cmpenall_startwait0_215
continue_cmpenall_0_215:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_215:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_215
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_215:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_215
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

	.xword	0x09408905a8eee139
	.xword	0x870519b4469b94ea
	.xword	0x7e7269dee0bd41a5
	.xword	0x4ee81d80847d0922
	.xword	0x5f54b0e97c023abd
	.xword	0x574d85cbd4ef0c65
	.xword	0x84f2a176e9336e62
	.xword	0xf50c844e7d4efed7
	.xword	0x031e369970bedced
	.xword	0xc97086ea719cd227
	.xword	0xbd75755427560337
	.xword	0x6aa930ae938b7f8b
	.xword	0x1cdab9517b1cd7f5
	.xword	0x111256163205804d
	.xword	0x447bfbb38f2d03b6
	.xword	0x93d394626434628e
	.xword	0x548fc708cae7b367
	.xword	0x5475a52c7567c567
	.xword	0x4dc528327b422dc6
	.xword	0xbac2b1c494734781
	.xword	0xdb0a9d071ffcff8a
	.xword	0xa6cd22e46836dc58
	.xword	0x0f90224c15daa465
	.xword	0x14096a35be9514cc
	.xword	0xfcaf986211b153d4
	.xword	0x6eb96cc6453e5817
	.xword	0x903d9a2aa739be76
	.xword	0x382752a8fcac3d2f
	.xword	0xe38cef1ba9040a08
	.xword	0x18079c166ff7edb7
	.xword	0xf9178d1f64c54586
	.xword	0x595d89aa6e77b9fa
	.xword	0x16ab5a4dfc4ca417
	.xword	0xc2112ff02a917ebb
	.xword	0x0cf415560054990d
	.xword	0x32ca4768fbbb5ace
	.xword	0x0ed42ce4d0fdaab0
	.xword	0x4ea3d689308aa9bb
	.xword	0x874c7718c75cdb15
	.xword	0x8f71f8cfa2390810
	.xword	0xb76f5cffafd75736
	.xword	0xb289b5179827c6d3
	.xword	0xe28374b1cedb5418
	.xword	0xe45f6656898eb425
	.xword	0xbe1a71d464bb2d79
	.xword	0xfcd86d58ceaf08f5
	.xword	0x9ed7aa3dc64a3f79
	.xword	0x9587dbf73f1bb898
	.xword	0x8e877027a96611fa
	.xword	0xde20de192ad68dfa
	.xword	0x4421d7661d467251
	.xword	0x5e05dc01df6be618
	.xword	0xb0b1ca26241c2216
	.xword	0xfbe22c63189708e3
	.xword	0x4ff3ab103a174ec3
	.xword	0x57293e184126c088
	.xword	0x92a08ffa779509af
	.xword	0x7a067d6859e831ab
	.xword	0x0acf18a0a265c466
	.xword	0xfd4c0c65b44b66ea
	.xword	0x5dc5449240e2abf2
	.xword	0x0a59ed602b247b38
	.xword	0x21101a98dd77987b
	.xword	0x718d4441aa5cb624
	.xword	0xd087b96444790b6c
	.xword	0x5c2fa54a67307d50
	.xword	0x46787b6174c16568
	.xword	0x28e330a026312ab7
	.xword	0x4b5aa559a4419a1b
	.xword	0xa3d2223648a91fab
	.xword	0xca5c26ed7c72a323
	.xword	0x719c8b2de8639754
	.xword	0x16f11fe9aa34f0cc
	.xword	0x6a979d29efbb3715
	.xword	0x856c4d95cb2a3274
	.xword	0x8a12302e2197d72e
	.xword	0xdf2bfa55c3812b1d
	.xword	0xe4da73cecc453c91
	.xword	0x0a62f77213d1d227
	.xword	0x71d543c217705298
	.xword	0xd3d9b4e3b8d26cf4
	.xword	0x2055d91ff12d9536
	.xword	0x344630d3abd48b4c
	.xword	0xafa5295c5040ba35
	.xword	0x403a0857c011fb36
	.xword	0xb7afb8dfa759f88a
	.xword	0xa648991affa5c405
	.xword	0xe162655df5fe0497
	.xword	0xeb1d9155299de73d
	.xword	0x703f55ce2a413fa6
	.xword	0xc74601ae59fb27b4
	.xword	0xa80c5dd5e9fe2108
	.xword	0x1ba1531198df74b6
	.xword	0x78f31409d6c55ffc
	.xword	0xe4c5ba47a841ca8b
	.xword	0x3f46a191a7c65142
	.xword	0xd62bbdeb1be17e49
	.xword	0xe18a89390c94fde8
	.xword	0xa249b31a35b7a40b
	.xword	0xfc856fe69830ed06
	.xword	0xbd3934681dfd6976
	.xword	0x8f261edb88905d5a
	.xword	0xfa8b50368cb3d39b
	.xword	0x1f04ba4522e4d1e7
	.xword	0x79293e69eef394f1
	.xword	0xa6d17386dc5d0a5e
	.xword	0x43ea031a8bfab292
	.xword	0x35396c9689f88d81
	.xword	0x3d27800e693b1cc1
	.xword	0x92fda1ee1aa3745d
	.xword	0x05eff17712cd948a
	.xword	0xca86b4c02bf94f70
	.xword	0x03503dcf55daeb6f
	.xword	0xb2952924d14c8275
	.xword	0xb1534129badbd1ba
	.xword	0xb93b03feb72e9e1d
	.xword	0xd0f7f350f6f7ae2a
	.xword	0xab71de9e38571bb1
	.xword	0x8abef58d866b83bf
	.xword	0xef65d36e444ca374
	.xword	0xdfb028e08ed3b990
	.xword	0x095d427dab2af44f
	.xword	0x439841522b3e02f4
	.xword	0x21c62fec601e843d
	.xword	0xd71f2d55742955d0
	.xword	0x1160806826b68867
	.xword	0xd24993b067915bed
	.xword	0x0ea0a689038e8b94
	.xword	0xed23d98cd57b24d2
	.xword	0x1de2e9db60ae6ca1
	.xword	0xb71660e06583ed9e
	.xword	0x32cd81f9648292d5
	.xword	0xae68fc80e8c0047a
	.xword	0x89ebd5c10620dee3
	.xword	0x86eb208e1e2b8aa4
	.xword	0x085e9d4e279a81a6
	.xword	0xfafc04e81d28a2f2
	.xword	0x0462308530a03a67
	.xword	0x8d5edbb04bd8c5bc
	.xword	0x9eeacdf5aca2f30b
	.xword	0xd04e8b0a8d32984d
	.xword	0xeb67e4d5a8ba37e6
	.xword	0x8d7a0b575f35c716
	.xword	0x17d63faa6b9e7161
	.xword	0xbe75175c31730273
	.xword	0xa00d4f64bfd87640
	.xword	0x25a62857369c12ed
	.xword	0x07d9631bdad2aaa4
	.xword	0x968e5d64e73fa460
	.xword	0x03a48999039b8ea9
	.xword	0x45301b6f9a098c93
	.xword	0xf90ba85a4b9c296d
	.xword	0x9c739a56d8af10d2
	.xword	0xc00a09f4634664f6
	.xword	0xacac9a5e98f1dc1c
	.xword	0xdbb9c2987666b841
	.xword	0x78368fd1f139a6c4
	.xword	0x342a304ac6ad5a85
	.xword	0xfb4da2d452272058
	.xword	0xbd7086a68eb69996
	.xword	0xd78bc127c6bdb096
	.xword	0x78f97e384adfd71f
	.xword	0x3423005441992057
	.xword	0x8d944b6d31b2326f
	.xword	0x3bd93c28cbfe47d2
	.xword	0xf4c4fd359f32b35c
	.xword	0xea6d94b134db2d06
	.xword	0x1d6e1331531adf37
	.xword	0x8a6130e2ebcb231f
	.xword	0xc071929abaaeb946
	.xword	0xba74c0b07361299f
	.xword	0xe2bc1cdcf51c8ccb
	.xword	0x866ff7cca595f5dd
	.xword	0xb9ee6f642807ec12
	.xword	0x9cf1ea4aaa43fd8a
	.xword	0x67cbe587bd0ded1c
	.xword	0x3459c3786b93ee5b
	.xword	0x4fe92e150b150ae0
	.xword	0xf8d0ac63d09a6cda
	.xword	0x83d9a12f62fae9c2
	.xword	0xc02ebc32ca3c18af
	.xword	0xb364d179d1acf891
	.xword	0xef29f601ea05a580
	.xword	0x120783bde13e9405
	.xword	0x8438bb60be05d32e
	.xword	0x6381ae0cd7c1884b
	.xword	0x73b9cf8da4f0e225
	.xword	0x8d3079b1e0c95f42
	.xword	0xef914521e0a2e39b
	.xword	0x2e9fcd83a8cc5531
	.xword	0x56ea118218e401ec
	.xword	0x5b859fa93d1ed0be
	.xword	0x38095f7f063f5364
	.xword	0x5b0493266a8b222b
	.xword	0x0b97e1e8a2a72e40
	.xword	0x47efcd2fc51b2db7
	.xword	0xb6fcc61d54b18fde
	.xword	0xf7b2b9acebec1ce1
	.xword	0xa6a60fd95c64dfb9
	.xword	0xef3b7e7a7e813a82
	.xword	0xbfa1e1771e5c4a93
	.xword	0x5d91ebfa1bd6031c
	.xword	0x31c29308c4c99eaa
	.xword	0x940e1dcedc67c6c2
	.xword	0xac64795bb8b96f3b
	.xword	0xe84a651f38093e9e
	.xword	0xdfc52cd51f8ea9c6
	.xword	0xb5decff550c74f5e
	.xword	0x4a8506629b62fd2b
	.xword	0xb73da137617c3774
	.xword	0x074c4e9fc3975983
	.xword	0x6ae403f98362d020
	.xword	0xd729588c85a69d03
	.xword	0x15b635abda69ad00
	.xword	0x91b620b26e450b97
	.xword	0x87ec400e44849ed3
	.xword	0xf801241ec5c9a078
	.xword	0xd7cab4ec514efcab
	.xword	0x00138ec1cdffdd05
	.xword	0xc7841bb8447d2c01
	.xword	0x017948e422f2e747
	.xword	0xd3c1df8addcf22d0
	.xword	0xc825f282c642a050
	.xword	0x868328156954e43d
	.xword	0x75458501b738bb26
	.xword	0xbd97f1cf0f40cefd
	.xword	0x61c94df5ea27e893
	.xword	0xac807e5794b774f0
	.xword	0x5bc76a4090c6c588
	.xword	0xa03fab674a3b0a7e
	.xword	0x77f22f582e69338f
	.xword	0x1ddc9d26da09877d
	.xword	0xb10954dc74256b2f
	.xword	0xec53a7285b8e8354
	.xword	0x7a2183c8672a3173
	.xword	0x3255f79b1e17dc98
	.xword	0x625ac41b15e05fdd
	.xword	0x48cd9a959bca102a
	.xword	0x0d2c5ad36a9e139d
	.xword	0x2768559a96e91044
	.xword	0xb23248d417ffc4f5
	.xword	0x7440f85dddfe1bde
	.xword	0x71cbae8be47c142c
	.xword	0x5bf2d99003fff637
	.xword	0x7815c06b4f90d093
	.xword	0x1df51b59511a6d1f
	.xword	0xb1e12c6521c176e5
	.xword	0xe55e7b3357856c4c
	.xword	0xce22b2b4c7f96d96
	.xword	0xbbb05b14b37d87cc
	.xword	0x3a59227b64d9d24e
	.xword	0x013dd97ece1ba44b
	.xword	0x21d41721f46adfb7
	.xword	0x0545e16d9ec943b9
	.xword	0x5a2211c7008f3e12
	.xword	0x1b31e7d70b5fedb0

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
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
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
	.xword	0xb80c7feb51769e4a
	.xword	0x1b851d426daf1864
	.xword	0x56598492d25a0f93
	.xword	0xbf505a93ccb0e293
	.xword	0x4b29bf52ae75d561
	.xword	0xfeddbdc59c3adddc
	.xword	0xb94b5c85fa10b9ef
	.xword	0xfcd4d2ca40ebbc7c
	.xword	0x9776142ff24cc486
	.xword	0x860d053e9a964966
	.xword	0x1a1ec61fa8193872
	.xword	0x7fc76fc84ce618d8
	.xword	0x22bb0ba6fd34b4c7
	.xword	0x43de9d1052a61a81
	.xword	0x06998c69618bce0c
	.xword	0xe5c1a84d6d36dd94
	.xword	0x511a77fb34664756
	.xword	0x5370fcf39229413a
	.xword	0x1a215a0588735863
	.xword	0xe9a069e44b959c1d
	.xword	0x3e358a0e49959514
	.xword	0x8c1b354dd49fb61a
	.xword	0xaf98384f1aea9d2d
	.xword	0x5b27eb307240992e
	.xword	0xfff65224c5533b95
	.xword	0x4644e04bca08d3f0
	.xword	0x67c7833aed01f654
	.xword	0x7ce378a5193d699e
	.xword	0xc88a2f50e05fe675
	.xword	0x886111a30297eba5
	.xword	0x2538f03cb99e1188
	.xword	0xd1e2f109a2e1c13b



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
	TTE_E	 = 0,
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
	.xword	0x1c7996ec074d7f73
	.xword	0x9949f8919a01b2ec
	.xword	0x85ac31b2437af8df
	.xword	0xe47a3786cfbf7dc4
	.xword	0x98c31a215dccdffe
	.xword	0xd01a6c052189cd00
	.xword	0xa37e8660daf5cc9c
	.xword	0x22e536f162541697
	.xword	0x00c9934d05a0f181
	.xword	0x43cf935de05b3159
	.xword	0xbbc3af6036c9a650
	.xword	0x0b3b248eff50f10b
	.xword	0x9f2f3e021dad1587
	.xword	0x35f34587c2d44849
	.xword	0x749732a848f691c1
	.xword	0xc0f57cd00b6b27b9
	.xword	0x45f0402d9db6f477
	.xword	0x68b74f1853b5bc41
	.xword	0xbd08d5446b336b8a
	.xword	0x0b206d9ad0bda291
	.xword	0x9f6bb2aeab1d6f2c
	.xword	0xaaa1701f722932f5
	.xword	0x5552813a8318c6e2
	.xword	0xf8f87fabaf3c132a
	.xword	0xcf5d58cdf9bf8db1
	.xword	0x31c6c52405c13fd4
	.xword	0xbe7d20a258bcfc26
	.xword	0xaef693d9530835be
	.xword	0x2411abb6af22a233
	.xword	0xc0c4b3a1c6ed22d2
	.xword	0x1584f8d62e3f1031
	.xword	0xdfe37961cf2a39cb



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
	.xword	0x2b0fcb953217c8ac
	.xword	0x169df822e9483c6a
	.xword	0xb50dd8eaf7ba42ad
	.xword	0x134d46280b542c1e
	.xword	0xbe71aae80690a8b6
	.xword	0x5226d5f21dcb34d7
	.xword	0x9573b5d4d1f85e0f
	.xword	0xda7015c4628de8bf
	.xword	0x877a1ec5d02c8bfc
	.xword	0xd90624ccd8386f35
	.xword	0xef77d3fc58646242
	.xword	0x01c21544f56cd4cd
	.xword	0xed01d04233ae3b3e
	.xword	0x2287e293178c034c
	.xword	0x2585118fd33cfe7e
	.xword	0x986d49052491c8b2
	.xword	0x7df1a8fe27f5ff3a
	.xword	0xf716c1b3b00a99e7
	.xword	0xc69b14a331706a40
	.xword	0xa57007c1c845c080
	.xword	0x146050de12d5d16c
	.xword	0x0a3b9565445edc8f
	.xword	0xb5d172bee7ef1d3f
	.xword	0x9934d97781367277
	.xword	0xaa178d3a8d090800
	.xword	0x2009a6fb68e6b6a8
	.xword	0x281651f42f9dad32
	.xword	0xee3f85ea1325a683
	.xword	0x43a7c463f54165d0
	.xword	0x661e224ec8d3a931
	.xword	0xaad117800f9ff95f
	.xword	0x2690284e786b8281



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	.xword	0x199472090d007095
	.xword	0x9334648cbb4d255c
	.xword	0x4254ea9ce3fcd424
	.xword	0x2e09e44e0c1c72e9
	.xword	0xadee382b3019c0dd
	.xword	0x5c53e7706b39c116
	.xword	0x87812d720af5a11f
	.xword	0x417783114455bdad
	.xword	0xfb3fb6b741298ca6
	.xword	0x094875b9d3ef77ed
	.xword	0xa8a471da251b906b
	.xword	0x4480401186e46cc7
	.xword	0x69d66e47775ffda6
	.xword	0xd6b81a469a5efcba
	.xword	0x260bd3ae64d9ca23
	.xword	0x6a9c1c83ec1833df
	.xword	0x34f683398583b1b9
	.xword	0xf2bced41630c9df3
	.xword	0xfe03672074d76c32
	.xword	0xe923896411cca621
	.xword	0x6dc268b1baf122d0
	.xword	0x49d302fbcdf9412b
	.xword	0x95878f6ab0dac0d1
	.xword	0x50dee125234376dd
	.xword	0x6f5844b53b4b8e55
	.xword	0x48144412bfa947c6
	.xword	0x95563127b27b044f
	.xword	0x9abc8165fca88ae3
	.xword	0x3cc12bca3e3aa1f6
	.xword	0xda33d87984228812
	.xword	0x9ccdda53b1addb02
	.xword	0x3a2bb810430f8b30



#if 0
#endif

