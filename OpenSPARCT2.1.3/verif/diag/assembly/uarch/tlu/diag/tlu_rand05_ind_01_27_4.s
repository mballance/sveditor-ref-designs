/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_27_4.s
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
    ldxa    [%g0] ASI_LSU_CTL_REG, %g5; \
    set cregs_lsu_ctl_reg_r64, %g5; \
    stxa    %g5, [%g0] ASI_LSU_CTL_REG; \
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
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g5, %g3 ;\
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
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
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
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
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
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
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
	mov 0x33, %r14
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
	mov 0xb2, %r14
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
	mov 0x30, %r14
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
	mov 0x35, %r14
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
	mov 0x30, %r14
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
	.word 0xa5b40ff4  ! 1: FONES	e	%f18
splash_lsu_7_0:
	setx 0xc00deaf062438e8f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
debug_7_1:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_7_3:
	taddcctv %r5, 0x17e5, %r2
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_7_4:
	setx 0x8a4596fc22a7c516, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 9: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_7_5:
	.word 0x97a349d2  ! 1: FDIVd	fdivd	%f44, %f18, %f42
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802004  ! 14: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d020b3  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa1a00174  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_7_6:
	.word 0x81982875  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0875, %hpstate
	.word 0xd4c80e80  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01962  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e010  ! 22: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
change_to_randtl_7_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_8:
	.word 0x8f902002  ! 23: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_7_9:
	set user_data_start, %r31
	.word 0x858237db  ! 24: WRCCR_I	wr	%r8, 0x17db, %ccr
mondo_7_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d91800a  ! 25: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
	.word 0x87902371  ! 26: WRPR_TT_I	wrpr	%r0, 0x0371, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x91a01a69  ! 28: FqTOi	fqtoi	
change_to_randtl_7_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_11:
	.word 0x8f902002  ! 29: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf70e  ! 30: SDIVX_I	sdivx	%r19, 0xfffff70e, %r11
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802083  ! 36: WRASI_I	wr	%r0, 0x0083, %asi
tagged_7_14:
	tsubcctv %r20, 0x15a1, %r7
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_7_15:
	set user_data_start, %r31
	.word 0x85822515  ! 38: WRCCR_I	wr	%r8, 0x0515, %ccr
tagged_7_16:
	tsubcctv %r14, 0x1523, %r26
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x8790212f  ! 40: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
mondo_7_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c012  ! 41: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
donret_7_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_18-donret_7_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe020  ! 43: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
tagged_7_19:
	taddcctv %r2, 0x1d5e, %r13
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0xa3414000  ! 45: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_21)+48, 16, 16)) -> intp(7,1,3)
xir_7_21:
	.word 0xa98537a3  ! 46: WR_SET_SOFTINT_I	wr	%r20, 0x17a3, %set_softint
mondo_7_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c004  ! 47: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
donret_7_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_23-donret_7_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x91480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_25:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 52: RDPC	rd	%pc, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_26) + 56, 16, 16)) -> intp(0,0,24)
intvec_7_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_7_27:
	setx 0xfff62baf8f37dcd9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_7_28:
	nop
	setx 0xfffffd19fffff68d, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe6880e60  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x73, %r19
intveclr_7_29:
	setx 0xb8f312bc5bde7e6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_7_30:
	set user_data_start, %r31
	.word 0x858462fe  ! 61: WRCCR_I	wr	%r17, 0x02fe, %ccr
debug_7_31:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780204f  ! 63: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe6900e60  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x73, %r19
	.word 0x91d02034  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 69: FqTOd	dis not found

	.word 0xd28008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_7_33:
	setx 0x73c93b4c12718848, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_34:
	setx 0xbe0985ff22f0a947, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_35:
	setx 0xd2dcda37fe4ded73, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_36:
	setx 0x9cb05adf4a934de6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa980800c  ! 76: WR_SET_SOFTINT_R	wr	%r2, %r12, %set_softint
intveclr_7_37:
	setx 0x3bfb9788dc80804e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_7_38:
	setx 0xb67e31143e24481f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_7_39:
	.word 0x95a4c9c9  ! 1: FDIVd	fdivd	%f50, %f40, %f10
	.word 0x97a149c5  ! 1: FDIVd	fdivd	%f36, %f36, %f42
	.word 0x91a00542  ! 1: FSQRTd	fsqrt	
	.word 0xa5a48831  ! 80: FADDs	fadds	%f18, %f17, %f18
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802016  ! 82: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_40) + 48, 16, 16)) -> intp(2,0,15)
intvec_7_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x879023b0  ! 85: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
	setx 0x3e4586648c5d06cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00166  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_7_42-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_42:
	.word 0x9194c002  ! 88: WRPR_PIL_R	wrpr	%r19, %r2, %pil
	.word 0x8780204f  ! 89: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa1902002  ! 90: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_7_43:
	setx 0x84adbec1a41a2bc0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936828f0  ! 93: SDIVX_I	sdivx	%r0, 0x08f0, %r9
debug_7_45:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 94: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x8d902813  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x9950c000  ! 96: RDPR_TT	rdpr	%tt, %r12
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0xa5450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_7_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_7_48:
	set user_data_start, %r31
	.word 0x858360f7  ! 103: WRCCR_I	wr	%r13, 0x00f7, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_7_50:
	setx 0x3c8150c7cb84275a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790235c  ! 107: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
	.word 0x97a4cdc8  ! 108: FdMULq	fdmulq	
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 109: FqTOd	dis not found

cwp_7_52:
    set user_data_start, %o7
	.word 0x93902000  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_53:
	setx 0x8cf3d9269cfd8263, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad80e60  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x73, %r13
splash_hpstate_7_54:
	.word 0x81982c0e  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0e, %hpstate
	.word 0xa968c010  ! 116: SDIVX_R	sdivx	%r3, %r16, %r20
splash_htba_7_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c004a0  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_htba_7_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_7_57:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 120: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x91d02034  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_7_58:
	.word 0xa9a1c9c3  ! 1: FDIVd	fdivd	%f38, %f34, %f20
	.word 0xd17c49bd	! Random illegal ?
	.word 0x91a00546  ! 1: FSQRTd	fsqrt	
	.word 0x93a2c82d  ! 122: FADDs	fadds	%f11, %f13, %f9
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x93d020b2  ! 124: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_7_59:
	setx 0x94544d4d852dbdd5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97697b5f  ! 127: SDIVX_I	sdivx	%r5, 0xfffffb5f, %r11
tagged_7_61:
	taddcctv %r11, 0x18ca, %r17
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_62) + 24, 16, 16)) -> intp(5,0,27)
intvec_7_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 130: FqTOd	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xa1a00170  ! 132: FABSq	dis not found

intveclr_7_65:
	setx 0x0008650ad3d4ec9d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93520000  ! 134: RDPR_PIL	rdpr	%pil, %r9
	.word 0x99a449d1  ! 135: FDIVd	fdivd	%f48, %f48, %f12
cwp_7_66:
    set user_data_start, %o7
	.word 0x93902001  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa9828012  ! 137: WR_SET_SOFTINT_R	wr	%r10, %r18, %set_softint
	.word 0xe0c00e60  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
splash_hpstate_7_67:
	.word 0x81982cc7  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01963  ! 140: FqTOd	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0xa1414000  ! 142: RDPC	rd	%pc, %r16
	.word 0xe29004a0  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 144: RDPC	rd	%pc, %r18
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_72) + 0, 16, 16)) -> intp(4,0,13)
intvec_7_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790229f  ! 147: WRPR_TT_I	wrpr	%r0, 0x029f, %tt
	.word 0x9ba2c9cb  ! 148: FDIVd	fdivd	%f42, %f42, %f44
	.word 0xd6c7e010  ! 149: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
change_to_randtl_7_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_73:
	.word 0x8f902003  ! 150: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d9036f5  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x16f5, %pstate
memptr_7_74:
	set 0x60540000, %r31
	.word 0x8582260d  ! 152: WRCCR_I	wr	%r8, 0x060d, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_7_76:
	setx 0x87fdbdf81723a54b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9350c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_7_77-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_77:
	.word 0x91940014  ! 159: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	.word 0x8d902a3b  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x0a3b, %pstate
	.word 0xd8880e80  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
	.word 0xab84e620  ! 162: WR_CLEAR_SOFTINT_I	wr	%r19, 0x0620, %clear_softint
splash_lsu_7_78:
	setx 0x3c535cf204c2dd61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_7_79:
	setx 0x36e10da788365369, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_7_81:
	.word 0x8198249c  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049c, %hpstate
splash_htba_7_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_7_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a0c9d2  ! 170: FDIVd	fdivd	%f34, %f18, %f10
splash_lsu_7_84:
	setx 0x637148b543569b63, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 172: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8780208b  ! 173: WRASI_I	wr	%r0, 0x008b, %asi
DS_7_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 175: FqTOd	dis not found

DS_7_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x97b48307  ! 176: ALIGNADDRESS	alignaddr	%r18, %r7, %r11
splash_hpstate_7_88:
	.word 0x8198211e  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
	.word 0xa6dcc003  ! 178: SMULcc_R	smulcc 	%r19, %r3, %r19
	.word 0x8780204f  ! 179: WRASI_I	wr	%r0, 0x004f, %asi
splash_hpstate_7_89:
	.word 0x81982957  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0957, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_7_90:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 182: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd4cfe030  ! 183: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
splash_hpstate_7_91:
	.word 0x81982104  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0104, %hpstate
debug_7_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_7_93:
	setx 0x51743d697cc8d99d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9f452e19	! Random illegal ?
	.word 0x93a249c6  ! 1: FDIVd	fdivd	%f40, %f6, %f40
	.word 0x91a44833  ! 187: FADDs	fadds	%f17, %f19, %f8
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
	.word 0x99414000  ! 188: RDPC	rd	%pc, %r12
	.word 0xe88fe000  ! 189: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
splash_lsu_7_96:
	setx 0xe875df3fb9b882dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a109e9  ! 191: FDIVq	dis not found

cwp_7_97:
    set user_data_start, %o7
	.word 0x93902001  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_decr_7_98:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7804006  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r6, %-
	.word 0x879023ff  ! 194: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_100) + 40, 16, 16)) -> intp(2,0,13)
intvec_7_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01970  ! 197: FqTOd	dis not found

intveclr_7_102:
	setx 0x0f5faff5762fc8e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d918011  ! 199: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
memptr_7_104:
	set 0x60540000, %r31
	.word 0x8581ad20  ! 200: WRCCR_I	wr	%r6, 0x0d20, %ccr
	.word 0x8780208a  ! 201: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xa9810005  ! 202: WR_SET_SOFTINT_R	wr	%r4, %r5, %set_softint
	.word 0x8780208b  ! 203: WRASI_I	wr	%r0, 0x008b, %asi
DS_7_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e80  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r16
debug_7_106:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903678  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x1678, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902004  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_7_109:
    set user_data_start, %o7
	.word 0x93902004  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
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
	.word 0x93414000  ! 214: RDPC	rd	%pc, %r9
debug_7_111:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 215: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96978e8  ! 216: SDIVX_I	sdivx	%r5, 0xfffff8e8, %r20
	.word 0xa1902004  ! 217: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_7_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 219: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_7_114:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_7_115:
	.word 0x819826ce  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_116) + 8, 16, 16)) -> intp(3,0,2)
intvec_7_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x93414000  ! 225: RDPC	rd	%pc, %r9
	.word 0xa153c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_7_118:
	set 0x60740000, %r31
	.word 0x8580720d  ! 227: WRCCR_I	wr	%r1, 0x120d, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01960  ! 228: FqTOd	dis not found

	.word 0x97a209cb  ! 229: FDIVd	fdivd	%f8, %f42, %f42
	.word 0x87802010  ! 230: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_7_120:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_7_121:
	setx 0x44c706122c4954a2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_7_123:
	.word 0x81982a26  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a26, %hpstate
	.word 0x9193778b  ! 236: WRPR_PIL_I	wrpr	%r13, 0x178b, %pil
change_to_randtl_7_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_124:
	.word 0x8f902002  ! 237: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_7_125:
	setx 0xc5681c97d66bcf2a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 240: RDPC	rd	%pc, %r18
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_7_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_127:
	.word 0x8f902002  ! 242: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9ba449d0  ! 243: FDIVd	fdivd	%f48, %f16, %f44
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69a2f8  ! 244: SDIVX_I	sdivx	%r6, 0x02f8, %r13
	.word 0xe2800be0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r17
cwp_7_129:
    set user_data_start, %o7
	.word 0x93902006  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02034  ! 247: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x8780208b  ! 249: WRASI_I	wr	%r0, 0x008b, %asi
splash_cmpr_7_130:
	setx 0x3c29f275295171d9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_131:
	.word 0x8f902001  ! 251: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_132)+24, 16, 16)) -> intp(7,1,3)
xir_7_132:
	.word 0xa98466d5  ! 253: WR_SET_SOFTINT_I	wr	%r17, 0x06d5, %set_softint
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_133:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 254: RDPC	rd	%pc, %r13
DS_7_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f30, %f22
	.word 0xa5b14314  ! 255: ALIGNADDRESS	alignaddr	%r5, %r20, %r18
	setx 0x4c367f32a0434c87, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022ce  ! 257: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
splash_tba_7_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9550c000  ! 259: RDPR_TT	rdpr	%tt, %r10
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d90290f  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x090f, %pstate
DS_7_138:
	.word 0x9ba309cb  ! 1: FDIVd	fdivd	%f12, %f42, %f44
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_7_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_7_141:
	taddcctv %r4, 0x181b, %r3
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0xa7a00161  ! 267: FABSq	dis not found

	.word 0x87902316  ! 268: WRPR_TT_I	wrpr	%r0, 0x0316, %tt
change_to_randtl_7_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93a309d2  ! 270: FDIVd	fdivd	%f12, %f18, %f40
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x95450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r10
splash_tba_7_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790237b  ! 274: WRPR_TT_I	wrpr	%r0, 0x037b, %tt
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
	.word 0x97414000  ! 275: RDPC	rd	%pc, %r11
splash_decr_7_145:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7820011  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_7_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_147:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 280: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_tba_7_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790214b  ! 282: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
splash_tba_7_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_7_150:
	setx 0x73bdac4f7962a5e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_7_151:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4800c60  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
	rd %pc, %r19
	add %r19, (ivw_7_152-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_152:
	.word 0x91910008  ! 288: WRPR_PIL_R	wrpr	%r4, %r8, %pil
splash_cmpr_7_153:
	setx 0x123a578900ab6270, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_154:
	setx 0x0a8fb6b51dcd1444, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_7_155:
	set 0x60140000, %r31
	.word 0x85843adc  ! 292: WRCCR_I	wr	%r16, 0x1adc, %ccr
mondo_7_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d91400c  ! 293: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_157:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 294: RDPC	rd	%pc, %r10
DS_7_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_159:
	setx 0xd23d8241738d6fb5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 299: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_htba_7_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_7_161:
	.word 0x8198225d  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
	.word 0x8d903da4  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x1da4, %pstate
splash_tba_7_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x107f6b920127dec9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_7_164:
    set user_data_start, %o7
	.word 0x93902000  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_7_165:
	setx 0xb7ca20804b5a9ac2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_7_167:
	.word 0x81982404  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0404, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 311: FqTOd	dis not found

mondo_7_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 312: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
splash_cmpr_7_170:
	setx 0x68fa7f565041f899, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_171:
	.word 0x8f902002  ! 314: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_7_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 316: RDPC	rd	%pc, %r17
splash_hpstate_7_174:
	.word 0x8198242d  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x042d, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x49c3a673420f0aea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_7_176:
    set user_data_start, %o7
	.word 0x93902002  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_7_177:
	.word 0x819820bf  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00bf, %hpstate
mondo_7_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d94c013  ! 322: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x91a009d0  ! 324: FDIVd	fdivd	%f0, %f16, %f8
	.word 0x879022ed  ! 325: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
debug_7_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99a0056a  ! 327: FSQRTq	fsqrt	
intveclr_7_180:
	setx 0xb578fd60232cb180, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d920005  ! 329: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	.word 0xd2c804a0  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
cwp_7_182:
    set user_data_start, %o7
	.word 0x93902003  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_7_183:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 332: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_7_184:
    set user_data_start, %o7
	.word 0x93902004  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790213c  ! 335: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
splash_cmpr_7_185:
	setx 0x5a292111461125bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 337: WRASI_I	wr	%r0, 0x0020, %asi
tagged_7_186:
	tsubcctv %r19, 0x18a4, %r14
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_7_187:
    set user_data_start, %o7
	.word 0x93902005  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_7_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_188:
	.word 0x8f902001  ! 342: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd297e000  ! 343: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
intveclr_7_189:
	setx 0x1ae7f1002c59edde, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_7_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_7_192:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 347: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_7_193:
	taddcctv %r3, 0x1b9e, %r8
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_7_194:
	tsubcctv %r20, 0x18f0, %r16
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_7_195:
	taddcctv %r3, 0x1d76, %r18
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x97a00167  ! 352: FABSq	dis not found

	.word 0x919027dc  ! 353: WRPR_PIL_I	wrpr	%r0, 0x07dc, %pil
	.word 0x9f802a8a  ! 354: SIR	sir	0x0a8a
intveclr_7_196:
	setx 0x0eab14a0e777c5e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00572  ! 356: FSQRTq	fsqrt	
	.word 0xe0800b00  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x87902372  ! 360: WRPR_TT_I	wrpr	%r0, 0x0372, %tt
	.word 0x879021f7  ! 361: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
debug_7_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91933acf  ! 364: WRPR_PIL_I	wrpr	%r12, 0x1acf, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_198) + 16, 16, 16)) -> intp(0,0,1)
intvec_7_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_7_200-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_200:
	.word 0x91910007  ! 367: WRPR_PIL_R	wrpr	%r4, %r7, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 368: FqTOd	dis not found

splash_cmpr_7_202:
	setx 0xaa0838288089d403, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_7_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_204-donret_7_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d903e2b  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x1e2b, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568ab9e  ! 373: SDIVX_I	sdivx	%r2, 0x0b9e, %r10
	.word 0xd6d7e030  ! 374: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x879022a6  ! 375: WRPR_TT_I	wrpr	%r0, 0x02a6, %tt
	.word 0xd6900e40  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0xd6800c40  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
memptr_7_206:
	set 0x60140000, %r31
	.word 0x8584a990  ! 378: WRCCR_I	wr	%r18, 0x0990, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_7_207:
	.word 0x91a4c9c6  ! 1: FDIVd	fdivd	%f50, %f6, %f8
	allclean
	.word 0xa7b40302  ! 380: ALIGNADDRESS	alignaddr	%r16, %r2, %r19
splash_hpstate_7_208:
	.word 0x81982e54  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
intveclr_7_209:
	setx 0x39a337264654b5f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_7_210:
	set user_data_start, %r31
	.word 0x8582b6e4  ! 383: WRCCR_I	wr	%r10, 0x16e4, %ccr
	.word 0xab820013  ! 384: WR_CLEAR_SOFTINT_R	wr	%r8, %r19, %clear_softint
splash_cmpr_7_211:
	setx 0x8f86d551b2f57e54, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c80e60  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r16
	.word 0xa1a409c6  ! 387: FDIVd	fdivd	%f16, %f6, %f16
	.word 0x91d02033  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_7_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_7_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_213:
	.word 0x8f902002  ! 390: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02035  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_7_214:
	setx 0x990abf9c397de9ef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x37003d0a2c3c6891, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_216:
	setx 0x8e4d499e66c4e69a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 395: FqTOd	dis not found

	.word 0xd097e010  ! 396: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_7_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_7_219:
	.word 0x819821cf  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
DS_7_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f16, %f12
	.word 0x99b04303  ! 400: ALIGNADDRESS	alignaddr	%r1, %r3, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0x95b00fe0  ! 1: FONES	e	%f10
splash_lsu_6_0:
	setx 0xca35f9bcab9df5e7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 3: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8780204f  ! 4: WRASI_I	wr	%r0, 0x004f, %asi
debug_6_1:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_6_3:
	taddcctv %r6, 0x1a40, %r10
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_6_4:
	setx 0x5a3ca50fb7a31f76, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02032  ! 9: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_6_5:
	.word 0x93a089d1  ! 1: FDIVd	fdivd	%f2, %f48, %f40
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02032  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa3a00174  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_6_6:
	.word 0x8198220e  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020e, %hpstate
	.word 0xd4c804a0  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01968  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e020  ! 22: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
change_to_randtl_6_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_8:
	.word 0x8f902002  ! 23: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_6_9:
	set user_data_start, %r31
	.word 0x8584f359  ! 24: WRCCR_I	wr	%r19, 0x1359, %ccr
mondo_6_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c012  ! 25: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x87902245  ! 26: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x97a01a71  ! 28: FqTOi	fqtoi	
change_to_randtl_6_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_11:
	.word 0x8f902000  ! 29: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916d3d0b  ! 30: SDIVX_I	sdivx	%r20, 0xfffffd0b, %r8
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x8780201c  ! 36: WRASI_I	wr	%r0, 0x001c, %asi
tagged_6_14:
	tsubcctv %r14, 0x1694, %r7
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_6_15:
	set user_data_start, %r31
	.word 0x85846d0e  ! 38: WRCCR_I	wr	%r17, 0x0d0e, %ccr
tagged_6_16:
	tsubcctv %r14, 0x1ee1, %r3
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x879020c6  ! 40: WRPR_TT_I	wrpr	%r0, 0x00c6, %tt
mondo_6_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 41: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
donret_6_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_18-donret_6_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe000  ! 43: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
tagged_6_19:
	taddcctv %r18, 0x1fc2, %r14
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x93414000  ! 45: RDPC	rd	%pc, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_21)+48, 16, 16)) -> intp(6,1,3)
xir_6_21:
	.word 0xa98164bb  ! 46: WR_SET_SOFTINT_I	wr	%r5, 0x04bb, %set_softint
mondo_6_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d91c011  ! 47: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
donret_6_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_23-donret_6_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x95480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_25:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 52: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_26) + 0, 16, 16)) -> intp(7,0,14)
intvec_6_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_6_27:
	setx 0xdb8349aeeb126dc4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_6_28:
	nop
	setx 0xfffff076fffff2f7, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_6_29:
	setx 0x273424ed3c6a567c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_6_30:
	set user_data_start, %r31
	.word 0x8582b63f  ! 61: WRCCR_I	wr	%r10, 0x163f, %ccr
debug_6_31:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780208a  ! 63: WRASI_I	wr	%r0, 0x008a, %asi
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x91d02033  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01974  ! 69: FqTOd	dis not found

	.word 0xd28008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_6_33:
	setx 0x9d32c2dc8786c0a1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_34:
	setx 0xe7a99bf9cda37cb7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_35:
	setx 0x0a4d2301a7c3fcad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_36:
	setx 0x229e1585dffeda6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 75: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9808011  ! 76: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
intveclr_6_37:
	setx 0x35966a817dd0e524, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_6_38:
	setx 0x67539762af04af98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_6_39:
	.word 0x93a349d4  ! 1: FDIVd	fdivd	%f44, %f20, %f40
	.word 0x97a449c9  ! 1: FDIVd	fdivd	%f48, %f40, %f42
	.word 0x97a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa3a2882d  ! 80: FADDs	fadds	%f10, %f13, %f17
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802088  ! 82: WRASI_I	wr	%r0, 0x0088, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_40) + 0, 16, 16)) -> intp(2,0,1)
intvec_6_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8790214c  ! 85: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	setx 0x3f09542102b6cf94, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00168  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_6_42-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_42:
	.word 0x9194800b  ! 88: WRPR_PIL_R	wrpr	%r18, %r11, %pil
	.word 0x87802055  ! 89: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa190200f  ! 90: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_6_43:
	setx 0xaa978d1c8a0482b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6af326  ! 93: SDIVX_I	sdivx	%r11, 0xfffff326, %r13
debug_6_45:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 94: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x8d9030db  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x10db, %pstate
	.word 0xa950c000  ! 96: RDPR_TT	rdpr	%tt, %r20
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0x99450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0x8d802000  ! 99: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_6_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_6_48:
	set user_data_start, %r31
	.word 0x85816e36  ! 103: WRCCR_I	wr	%r5, 0x0e36, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_6_50:
	setx 0x7f29bdf5b2b23842, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022ce  ! 107: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
	.word 0x93a1cdcb  ! 108: FdMULq	fdmulq	
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196b  ! 109: FqTOd	dis not found

cwp_6_52:
    set user_data_start, %o7
	.word 0x93902000  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_6_53:
	setx 0x35221a7b966de8f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad80e80  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
splash_hpstate_6_54:
	.word 0x81982c85  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c85, %hpstate
	.word 0x95698014  ! 116: SDIVX_R	sdivx	%r6, %r20, %r10
splash_htba_6_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c00e80  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
splash_htba_6_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_6_57:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 120: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x93d020b3  ! 121: Tcc_I	tne	icc_or_xcc, %r0 + 179
DS_6_58:
	.word 0x9ba4c9c3  ! 1: FDIVd	fdivd	%f50, %f34, %f44
	.word 0x9343f672	! Random illegal ?
	.word 0x91a00542  ! 1: FSQRTd	fsqrt	
	.word 0xa7a1c827  ! 122: FADDs	fadds	%f7, %f7, %f19
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x93d02032  ! 124: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_6_59:
	setx 0x822ce831c09490c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969a363  ! 127: SDIVX_I	sdivx	%r6, 0x0363, %r20
tagged_6_61:
	taddcctv %r4, 0x1e06, %r14
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_62) + 0, 16, 16)) -> intp(6,0,13)
intvec_6_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196c  ! 130: FqTOd	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x91a00169  ! 132: FABSq	dis not found

intveclr_6_65:
	setx 0x011552b7b6bfa965, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9520000  ! 134: RDPR_PIL	rdpr	%pil, %r20
	.word 0xa9a109ca  ! 135: FDIVd	fdivd	%f4, %f10, %f20
cwp_6_66:
    set user_data_start, %o7
	.word 0x93902000  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa9824007  ! 137: WR_SET_SOFTINT_R	wr	%r9, %r7, %set_softint
	.word 0xe0c00e80  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r16
splash_hpstate_6_67:
	.word 0x81982ec4  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec4, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01971  ! 140: FqTOd	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x95414000  ! 142: RDPC	rd	%pc, %r10
	.word 0xe2900e40  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_71:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 144: RDPC	rd	%pc, %r10
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_72) + 0, 16, 16)) -> intp(0,0,8)
intvec_6_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022ac  ! 147: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	.word 0xa7a149c2  ! 148: FDIVd	fdivd	%f36, %f2, %f50
	.word 0xd6c7e020  ! 149: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
change_to_randtl_6_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_73:
	.word 0x8f902003  ! 150: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d9034f9  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x14f9, %pstate
memptr_6_74:
	set 0x60140000, %r31
	.word 0x858122e8  ! 152: WRCCR_I	wr	%r4, 0x02e8, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_6_76:
	setx 0x2b99fd3e3c7bd938, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9750c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_6_77-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_77:
	.word 0x9194c013  ! 159: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0x8d903e42  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x1e42, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab843fb1  ! 162: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1fb1, %clear_softint
splash_lsu_6_78:
	setx 0x195a0c0037544805, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_6_79:
	setx 0x384d7a2cdbbc53e6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_6_81:
	.word 0x8198283c  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x083c, %hpstate
splash_htba_6_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_6_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a309cd  ! 170: FDIVd	fdivd	%f12, %f44, %f40
splash_lsu_6_84:
	setx 0xe605a3d0d45c3b69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 172: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8780201c  ! 173: WRASI_I	wr	%r0, 0x001c, %asi
DS_6_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196c  ! 175: FqTOd	dis not found

DS_6_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b18311  ! 176: ALIGNADDRESS	alignaddr	%r6, %r17, %r12
splash_hpstate_6_88:
	.word 0x8198274c  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074c, %hpstate
	.word 0xa6db400b  ! 178: SMULcc_R	smulcc 	%r13, %r11, %r19
	.word 0x87802020  ! 179: WRASI_I	wr	%r0, 0x0020, %asi
splash_hpstate_6_89:
	.word 0x819826de  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_6_90:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 182: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0xd4cfe030  ! 183: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
splash_hpstate_6_91:
	.word 0x81982c1e  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
debug_6_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_6_93:
	setx 0xbe3b0f74f1bccb70, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xaf4963c7	! Random illegal ?
	.word 0xa9a189c5  ! 1: FDIVd	fdivd	%f6, %f36, %f20
	.word 0x9ba24824  ! 187: FADDs	fadds	%f9, %f4, %f13
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
	.word 0x91414000  ! 188: RDPC	rd	%pc, %r8
	.word 0xe88fe030  ! 189: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
splash_lsu_6_96:
	setx 0xb5df7f6024c99675, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a089e6  ! 191: FDIVq	dis not found

cwp_6_97:
    set user_data_start, %o7
	.word 0x93902000  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa7830004  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r4, %-
	.word 0x87902316  ! 194: WRPR_TT_I	wrpr	%r0, 0x0316, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_100) + 48, 16, 16)) -> intp(4,0,6)
intvec_6_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196c  ! 197: FqTOd	dis not found

intveclr_6_102:
	setx 0xc5aebe2a9a12a956, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d91c006  ! 199: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
memptr_6_104:
	set 0x60340000, %r31
	.word 0x8581b066  ! 200: WRCCR_I	wr	%r6, 0x1066, %ccr
	.word 0x87802089  ! 201: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa9840014  ! 202: WR_SET_SOFTINT_R	wr	%r16, %r20, %set_softint
	.word 0x8780204f  ! 203: WRASI_I	wr	%r0, 0x004f, %asi
DS_6_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d004a0  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
debug_6_106:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903a6f  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x1a6f, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902004  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_6_109:
    set user_data_start, %o7
	.word 0x93902003  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
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
	.word 0x95414000  ! 214: RDPC	rd	%pc, %r10
debug_6_111:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 215: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b2afd  ! 216: SDIVX_I	sdivx	%r12, 0x0afd, %r12
	.word 0xa190200c  ! 217: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_6_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_114:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xd0800b80  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
splash_hpstate_6_115:
	.word 0x81982786  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0786, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_116) + 8, 16, 16)) -> intp(2,0,30)
intvec_6_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xa1414000  ! 225: RDPC	rd	%pc, %r16
	.word 0x9753c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_6_118:
	set 0x60140000, %r31
	.word 0x8582e11e  ! 227: WRCCR_I	wr	%r11, 0x011e, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196c  ! 228: FqTOd	dis not found

	.word 0xa9a0c9d3  ! 229: FDIVd	fdivd	%f34, %f50, %f20
	.word 0x87802080  ! 230: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_6_120:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_6_121:
	setx 0x9afc92518e9708af, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_6_123:
	.word 0x81982d6c  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d6c, %hpstate
	.word 0x91906931  ! 236: WRPR_PIL_I	wrpr	%r1, 0x0931, %pil
change_to_randtl_6_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_124:
	.word 0x8f902002  ! 237: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_6_125:
	setx 0xf729f6d8b09a41e0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_126:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 240: RDPC	rd	%pc, %r12
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_6_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_127:
	.word 0x8f902002  ! 242: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99a409cb  ! 243: FDIVd	fdivd	%f16, %f42, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769fffe  ! 244: SDIVX_I	sdivx	%r7, 0xfffffffe, %r11
	.word 0xe2800b60  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r17
cwp_6_129:
    set user_data_start, %o7
	.word 0x93902002  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d020b2  ! 247: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x8780208b  ! 249: WRASI_I	wr	%r0, 0x008b, %asi
splash_cmpr_6_130:
	setx 0xa60d35c038794bdb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_131:
	.word 0x8f902000  ! 251: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_132)+0, 16, 16)) -> intp(6,1,3)
xir_6_132:
	.word 0xa984fbdd  ! 253: WR_SET_SOFTINT_I	wr	%r19, 0x1bdd, %set_softint
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_133:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 254: RDPC	rd	%pc, %r10
DS_6_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f30, %f30
	.word 0xa5b04311  ! 255: ALIGNADDRESS	alignaddr	%r1, %r17, %r18
	setx 0xdda39428095ea911, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022b2  ! 257: WRPR_TT_I	wrpr	%r0, 0x02b2, %tt
splash_tba_6_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9350c000  ! 259: RDPR_TT	rdpr	%tt, %r9
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d9039c0  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x19c0, %pstate
DS_6_138:
	.word 0x93a4c9d2  ! 1: FDIVd	fdivd	%f50, %f18, %f40
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_6_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
tagged_6_141:
	taddcctv %r11, 0x1e5f, %r3
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0x99a0016a  ! 267: FABSq	dis not found

	.word 0x8790205f  ! 268: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
change_to_randtl_6_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x97a189c5  ! 270: FDIVd	fdivd	%f6, %f36, %f42
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x9b450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r13
splash_tba_6_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902238  ! 274: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
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
	.word 0xa3414000  ! 275: RDPC	rd	%pc, %r17
	.word 0xa7840009  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r9, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_6_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_147:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 280: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
splash_tba_6_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790203c  ! 282: WRPR_TT_I	wrpr	%r0, 0x003c, %tt
splash_tba_6_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_6_150:
	setx 0xc3357d5dde825b14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_6_151:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4800b00  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	rd %pc, %r19
	add %r19, (ivw_6_152-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_152:
	.word 0x91918003  ! 288: WRPR_PIL_R	wrpr	%r6, %r3, %pil
splash_cmpr_6_153:
	setx 0x61b2b414acba4b50, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_154:
	setx 0x34a30c15a0fc3721, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_6_155:
	set 0x60340000, %r31
	.word 0x8580b6a3  ! 292: WRCCR_I	wr	%r2, 0x16a3, %ccr
mondo_6_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 293: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_157:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 294: RDPC	rd	%pc, %r19
DS_6_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_6_159:
	setx 0xf754d0104b4d18d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 299: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_htba_6_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_6_161:
	.word 0x81982305  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0305, %hpstate
	.word 0x8d902482  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0482, %pstate
splash_tba_6_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x5bc8720ae77b0e85, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_6_164:
    set user_data_start, %o7
	.word 0x93902001  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_6_165:
	setx 0x911deb72c1234f8b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_6_167:
	.word 0x819823d5  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 311: FqTOd	dis not found

mondo_6_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 312: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
splash_cmpr_6_170:
	setx 0xdbb0f9ea651966ce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_171:
	.word 0x8f902002  ! 314: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_6_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_173:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 316: RDPC	rd	%pc, %r9
splash_hpstate_6_174:
	.word 0x81982aee  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aee, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0xfa879f12c2f3ffcc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_6_176:
    set user_data_start, %o7
	.word 0x93902001  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_hpstate_6_177:
	.word 0x819823ee  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ee, %hpstate
mondo_6_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94800b  ! 322: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x93a209c4  ! 324: FDIVd	fdivd	%f8, %f4, %f40
	.word 0x879021c0  ! 325: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
debug_6_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91a0056d  ! 327: FSQRTq	fsqrt	
intveclr_6_180:
	setx 0x32b4b3c6c7396bc3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d940001  ! 329: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0xd2c80e40  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
cwp_6_182:
    set user_data_start, %o7
	.word 0x93902006  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_6_183:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 332: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_6_184:
    set user_data_start, %o7
	.word 0x93902002  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879023f3  ! 335: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
splash_cmpr_6_185:
	setx 0xa063f43fd3f456ac, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 337: WRASI_I	wr	%r0, 0x0088, %asi
tagged_6_186:
	tsubcctv %r8, 0x18a2, %r19
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_6_187:
    set user_data_start, %o7
	.word 0x93902001  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_6_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_188:
	.word 0x8f902001  ! 342: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd297e020  ! 343: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
intveclr_6_189:
	setx 0x8525b6f573b4f49f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_6_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_6_192:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 347: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_6_193:
	taddcctv %r24, 0x1793, %r1
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_6_194:
	tsubcctv %r5, 0x13b3, %r8
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_6_195:
	taddcctv %r25, 0x16f0, %r25
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0xa5a00165  ! 352: FABSq	dis not found

	.word 0x919479b3  ! 353: WRPR_PIL_I	wrpr	%r17, 0x19b3, %pil
	.word 0x9f80204d  ! 354: SIR	sir	0x004d
intveclr_6_196:
	setx 0x3cbaf7363b2e2442, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00567  ! 356: FSQRTq	fsqrt	
	.word 0xe08008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x8790220f  ! 360: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
	.word 0x87902320  ! 361: WRPR_TT_I	wrpr	%r0, 0x0320, %tt
debug_6_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9192ad3d  ! 364: WRPR_PIL_I	wrpr	%r10, 0x0d3d, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_198) + 40, 16, 16)) -> intp(0,0,29)
intvec_6_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_6_200-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_200:
	.word 0x91944008  ! 367: WRPR_PIL_R	wrpr	%r17, %r8, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01970  ! 368: FqTOd	dis not found

splash_cmpr_6_202:
	setx 0xa8a0083a9d04e07e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_6_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_204-donret_6_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d9023aa  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x03aa, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569be0e  ! 373: SDIVX_I	sdivx	%r6, 0xfffffe0e, %r10
	.word 0xd6d7e030  ! 374: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x879023fd  ! 375: WRPR_TT_I	wrpr	%r0, 0x03fd, %tt
	.word 0xd6900e40  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0xd68008a0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_6_206:
	set 0x60140000, %r31
	.word 0x8584a5dd  ! 378: WRCCR_I	wr	%r18, 0x05dd, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_6_207:
	.word 0x93a489c5  ! 1: FDIVd	fdivd	%f18, %f36, %f40
	allclean
	.word 0x93b24310  ! 380: ALIGNADDRESS	alignaddr	%r9, %r16, %r9
splash_hpstate_6_208:
	.word 0x81982c47  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
intveclr_6_209:
	setx 0x84bbeb4541fddf4b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_6_210:
	set user_data_start, %r31
	.word 0x8584fe8e  ! 383: WRCCR_I	wr	%r19, 0x1e8e, %ccr
	.word 0xab80000a  ! 384: WR_CLEAR_SOFTINT_R	wr	%r0, %r10, %clear_softint
splash_cmpr_6_211:
	setx 0x5a1fcbdfa3c06bbf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c80e80  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r16
	.word 0x9ba009ca  ! 387: FDIVd	fdivd	%f0, %f10, %f44
	.word 0x91d020b3  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_htba_6_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_6_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_213:
	.word 0x8f902001  ! 390: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02034  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_6_214:
	setx 0xcc5f39532e7f5865, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x15fa4cc2ca398563, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_216:
	setx 0x71a867b20867b200, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 395: FqTOd	dis not found

	.word 0xd097e010  ! 396: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_6_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_6_219:
	.word 0x81982b9d  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
DS_6_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f4, %f14
	.word 0x95b10300  ! 400: ALIGNADDRESS	alignaddr	%r4, %r0, %r10
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0x91b34ff2  ! 1: FONES	e	%f8
splash_lsu_5_0:
	setx 0xa52671aa486d4fa5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802020  ! 4: WRASI_I	wr	%r0, 0x0020, %asi
debug_5_1:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_5_3:
	taddcctv %r17, 0x1f6c, %r18
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_5_4:
	setx 0x5414b9791b46c141, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 9: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_5_5:
	.word 0x91a289c7  ! 1: FDIVd	fdivd	%f10, %f38, %f8
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d020b2  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x93a0016d  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_5_6:
	.word 0x81982c3e  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c3e, %hpstate
	.word 0xd4c80e60  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e020  ! 22: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
change_to_randtl_5_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_8:
	.word 0x8f902001  ! 23: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_5_9:
	set user_data_start, %r31
	.word 0x85803d6e  ! 24: WRCCR_I	wr	%r0, 0x1d6e, %ccr
mondo_5_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d934004  ! 25: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	.word 0x87902110  ! 26: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x97a01a68  ! 28: FqTOi	fqtoi	
change_to_randtl_5_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_11:
	.word 0x8f902003  ! 29: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ca86d  ! 30: SDIVX_I	sdivx	%r18, 0x086d, %r9
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802055  ! 36: WRASI_I	wr	%r0, 0x0055, %asi
tagged_5_14:
	tsubcctv %r9, 0x11fb, %r6
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_5_15:
	set user_data_start, %r31
	.word 0x8585373a  ! 38: WRCCR_I	wr	%r20, 0x173a, %ccr
tagged_5_16:
	tsubcctv %r24, 0x1299, %r7
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x879021e4  ! 40: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
mondo_5_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d930014  ! 41: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
donret_5_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_18-donret_5_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe020  ! 43: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
tagged_5_19:
	taddcctv %r23, 0x1a2d, %r11
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0xa5414000  ! 45: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_21)+32, 16, 16)) -> intp(5,1,3)
xir_5_21:
	.word 0xa984e080  ! 46: WR_SET_SOFTINT_I	wr	%r19, 0x0080, %set_softint
mondo_5_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d948009  ! 47: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
donret_5_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_23-donret_5_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0xa5480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_25:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 52: RDPC	rd	%pc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_26) + 56, 16, 16)) -> intp(2,0,17)
intvec_5_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_5_27:
	setx 0x99d40fb25c6e2ec1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_5_28:
	nop
	setx 0xfffffcb6fffffdd1, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_5_29:
	setx 0xaad0acc0e21edcf4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_5_30:
	set user_data_start, %r31
	.word 0x8584aae1  ! 61: WRCCR_I	wr	%r18, 0x0ae1, %ccr
debug_5_31:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780201c  ! 63: WRASI_I	wr	%r0, 0x001c, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x91d02033  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01965  ! 69: FqTOd	dis not found

	.word 0xd2800b00  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_cmpr_5_33:
	setx 0x4d1c49b78f251f29, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_34:
	setx 0xf6e74975bb5e100d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_35:
	setx 0xd1af6922c8b212d8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_36:
	setx 0xcf0f4255fec7687f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 75: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9834007  ! 76: WR_SET_SOFTINT_R	wr	%r13, %r7, %set_softint
intveclr_5_37:
	setx 0x3d833d3bd3e40225, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_5_38:
	setx 0x3325102c7d9b03e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_5_39:
	.word 0x93a089c2  ! 1: FDIVd	fdivd	%f2, %f2, %f40
	.word 0x97a409cc  ! 1: FDIVd	fdivd	%f16, %f12, %f42
	.word 0xa1a00548  ! 1: FSQRTd	fsqrt	
	.word 0x95a2882b  ! 80: FADDs	fadds	%f10, %f11, %f10
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x8780208a  ! 82: WRASI_I	wr	%r0, 0x008a, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_40) + 48, 16, 16)) -> intp(7,0,7)
intvec_5_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x87902275  ! 85: WRPR_TT_I	wrpr	%r0, 0x0275, %tt
	setx 0xcfe9263ddecffd47, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a0016d  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_5_42-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_42:
	.word 0x9192400d  ! 88: WRPR_PIL_R	wrpr	%r9, %r13, %pil
	.word 0x87802083  ! 89: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0xa1902006  ! 90: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_5_43:
	setx 0x8c3e47dfd60c9c47, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769a93e  ! 93: SDIVX_I	sdivx	%r6, 0x093e, %r19
debug_5_45:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 94: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x8d902135  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0135, %pstate
	.word 0x9950c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0xa1450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x8d802000  ! 99: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_5_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_5_48:
	set user_data_start, %r31
	.word 0x85852865  ! 103: WRCCR_I	wr	%r20, 0x0865, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_5_50:
	setx 0x9676d86586f26524, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902317  ! 107: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x93a40dd1  ! 108: FdMULq	fdmulq	
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01964  ! 109: FqTOd	dis not found

cwp_5_52:
    set user_data_start, %o7
	.word 0x93902000  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_53:
	setx 0xdb72b58443e56411, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_5_54:
	.word 0x81982684  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0684, %hpstate
	.word 0x9569c013  ! 116: SDIVX_R	sdivx	%r7, %r19, %r10
splash_htba_5_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c00e40  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
splash_htba_5_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_5_57:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 120: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x93d02034  ! 121: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_5_58:
	.word 0xa3a349c6  ! 1: FDIVd	fdivd	%f44, %f6, %f48
	.word 0xff67e851	! Random illegal ?
	.word 0xa1a00548  ! 1: FSQRTd	fsqrt	
	.word 0x99a44832  ! 122: FADDs	fadds	%f17, %f18, %f12
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x83d02034  ! 124: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_5_59:
	setx 0xa002de8c614abd3d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c7b33  ! 127: SDIVX_I	sdivx	%r17, 0xfffffb33, %r12
tagged_5_61:
	taddcctv %r26, 0x11e8, %r15
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_62) + 24, 16, 16)) -> intp(7,0,18)
intvec_5_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01964  ! 130: FqTOd	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xa1a0016a  ! 132: FABSq	dis not found

intveclr_5_65:
	setx 0xae5864a961c93c18, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0x9ba409c8  ! 135: FDIVd	fdivd	%f16, %f8, %f44
cwp_5_66:
    set user_data_start, %o7
	.word 0x93902007  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa9850013  ! 137: WR_SET_SOFTINT_R	wr	%r20, %r19, %set_softint
	.word 0xe0c00e60  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
splash_hpstate_5_67:
	.word 0x81982f44  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 140: FqTOd	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x93414000  ! 142: RDPC	rd	%pc, %r9
	.word 0xe2900e40  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_71:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 144: RDPC	rd	%pc, %r11
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_72) + 56, 16, 16)) -> intp(5,0,6)
intvec_5_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021f4  ! 147: WRPR_TT_I	wrpr	%r0, 0x01f4, %tt
	.word 0x91a409c7  ! 148: FDIVd	fdivd	%f16, %f38, %f8
	.word 0xd6c7e020  ! 149: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
change_to_randtl_5_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_73:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9036e4  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x16e4, %pstate
memptr_5_74:
	set 0x60540000, %r31
	.word 0x85816aa4  ! 152: WRCCR_I	wr	%r5, 0x0aa4, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_5_76:
	setx 0x9fd48b2cd2f483ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa350c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_5_77-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_77:
	.word 0x91910010  ! 159: WRPR_PIL_R	wrpr	%r4, %r16, %pil
	.word 0x8d90271c  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x071c, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab846072  ! 162: WR_CLEAR_SOFTINT_I	wr	%r17, 0x0072, %clear_softint
splash_lsu_5_78:
	setx 0x9c3cc1131606307d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_5_79:
	setx 0x90091f4b242cf3a0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_5_81:
	.word 0x81982bae  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bae, %hpstate
splash_htba_5_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_5_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a149cb  ! 170: FDIVd	fdivd	%f36, %f42, %f40
splash_lsu_5_84:
	setx 0xe1fc302d204bd7f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 172: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87802016  ! 173: WRASI_I	wr	%r0, 0x0016, %asi
DS_5_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196b  ! 175: FqTOd	dis not found

DS_5_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x97b2830b  ! 176: ALIGNADDRESS	alignaddr	%r10, %r11, %r11
splash_hpstate_5_88:
	.word 0x81982d07  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
	.word 0x90d94005  ! 178: SMULcc_R	smulcc 	%r5, %r5, %r8
	.word 0x87802080  ! 179: WRASI_I	wr	%r0, 0x0080, %asi
splash_hpstate_5_89:
	.word 0x819820d7  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d7, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_5_90:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 182: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd4cfe020  ! 183: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
splash_hpstate_5_91:
	.word 0x81982607  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
debug_5_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_5_93:
	setx 0xcfe661e211884ee5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa778a7fe	! Random illegal ?
	.word 0x93a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f40
	.word 0x93a48826  ! 187: FADDs	fadds	%f18, %f6, %f9
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
	.word 0xa9414000  ! 188: RDPC	rd	%pc, %r20
	.word 0xe88fe020  ! 189: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
splash_lsu_5_96:
	setx 0x754a1b7b3f18811f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a109f1  ! 191: FDIVq	dis not found

cwp_5_97:
    set user_data_start, %o7
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_decr_5_98:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa784c00a  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r10, %-
	.word 0x8790230b  ! 194: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01963  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_100) + 0, 16, 16)) -> intp(5,0,10)
intvec_5_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01970  ! 197: FqTOd	dis not found

intveclr_5_102:
	setx 0x1f36561bc50ae5a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90000b  ! 199: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
memptr_5_104:
	set 0x60140000, %r31
	.word 0x8584222e  ! 200: WRCCR_I	wr	%r16, 0x022e, %ccr
	.word 0x87802004  ! 201: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa984c00b  ! 202: WR_SET_SOFTINT_R	wr	%r19, %r11, %set_softint
	.word 0x87802020  ! 203: WRASI_I	wr	%r0, 0x0020, %asi
DS_5_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d004a0  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
debug_5_106:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903fa5  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x1fa5, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902000  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_5_109:
    set user_data_start, %o7
	.word 0x93902005  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
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
	.word 0x97414000  ! 214: RDPC	rd	%pc, %r11
debug_5_111:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 215: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c334c  ! 216: SDIVX_I	sdivx	%r16, 0xfffff34c, %r13
	.word 0xa190200b  ! 217: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_5_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 219: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_5_114:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_5_115:
	.word 0x81982f54  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f54, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_116) + 8, 16, 16)) -> intp(6,0,2)
intvec_5_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x97414000  ! 225: RDPC	rd	%pc, %r11
	.word 0xa353c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_5_118:
	set 0x60740000, %r31
	.word 0x8580b9e7  ! 227: WRCCR_I	wr	%r2, 0x19e7, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01966  ! 228: FqTOd	dis not found

	.word 0xa3a1c9c9  ! 229: FDIVd	fdivd	%f38, %f40, %f48
	.word 0x87802083  ! 230: WRASI_I	wr	%r0, 0x0083, %asi
splash_tba_5_120:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_5_121:
	setx 0x30e29820f3893f64, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_5_123:
	.word 0x819825b5  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05b5, %hpstate
	.word 0x9190b980  ! 236: WRPR_PIL_I	wrpr	%r2, 0x1980, %pil
change_to_randtl_5_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_124:
	.word 0x8f902002  ! 237: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_5_125:
	setx 0x06214c777448d997, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_126:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 240: RDPC	rd	%pc, %r8
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_5_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_127:
	.word 0x8f902001  ! 242: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa5a409c3  ! 243: FDIVd	fdivd	%f16, %f34, %f18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956ce9f7  ! 244: SDIVX_I	sdivx	%r19, 0x09f7, %r10
	.word 0xe28008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
cwp_5_129:
    set user_data_start, %o7
	.word 0x93902001  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02034  ! 247: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x87802020  ! 249: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_5_130:
	setx 0xc1dc4f360d3a6a18, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_131:
	.word 0x8f902000  ! 251: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_132)+32, 16, 16)) -> intp(5,1,3)
xir_5_132:
	.word 0xa9843599  ! 253: WR_SET_SOFTINT_I	wr	%r16, 0x1599, %set_softint
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_133:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 254: RDPC	rd	%pc, %r8
DS_5_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f28, %f6
	.word 0x91b14311  ! 255: ALIGNADDRESS	alignaddr	%r5, %r17, %r8
	setx 0xebc1d43c2ce46de2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902132  ! 257: WRPR_TT_I	wrpr	%r0, 0x0132, %tt
splash_tba_5_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b50c000  ! 259: RDPR_TT	rdpr	%tt, %r13
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d9029bd  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x09bd, %pstate
DS_5_138:
	.word 0xa9a189ca  ! 1: FDIVd	fdivd	%f6, %f10, %f20
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_5_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
tagged_5_141:
	taddcctv %r6, 0x1076, %r7
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0x91a00173  ! 267: FABSq	dis not found

	.word 0x8790230e  ! 268: WRPR_TT_I	wrpr	%r0, 0x030e, %tt
change_to_randtl_5_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa3a509c3  ! 270: FDIVd	fdivd	%f20, %f34, %f48
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0xa5450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r18
splash_tba_5_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879020c4  ! 274: WRPR_TT_I	wrpr	%r0, 0x00c4, %tt
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
	.word 0xa9414000  ! 275: RDPC	rd	%pc, %r20
splash_decr_5_145:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7824008  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r8, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_5_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_147:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 280: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_tba_5_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902024  ! 282: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
splash_tba_5_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_5_150:
	setx 0xb45d00b2bd3e14f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_5_151:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_5_152-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_152:
	.word 0x91940013  ! 288: WRPR_PIL_R	wrpr	%r16, %r19, %pil
splash_cmpr_5_153:
	setx 0x23a4b847fd062381, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_154:
	setx 0x1fc17962ca533b5d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 291: WRFPRS_I	wr	%r0, 0x0004, %fprs
memptr_5_155:
	set 0x60540000, %r31
	.word 0x85842f21  ! 292: WRCCR_I	wr	%r16, 0x0f21, %ccr
mondo_5_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d940011  ! 293: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_157:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 294: RDPC	rd	%pc, %r8
DS_5_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_5_159:
	setx 0x87d3449fb75235bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 299: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_5_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_5_161:
	.word 0x8198269f  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069f, %hpstate
	.word 0x8d902cc6  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0cc6, %pstate
splash_tba_5_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x8688dbdff5f00768, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_5_164:
    set user_data_start, %o7
	.word 0x93902004  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_5_165:
	setx 0x43e87e765d38eb76, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_5_167:
	.word 0x8198278d  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01966  ! 311: FqTOd	dis not found

mondo_5_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d91c001  ! 312: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
splash_cmpr_5_170:
	setx 0x8440905f9d1102c7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_171:
	.word 0x8f902001  ! 314: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_5_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_173:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 316: RDPC	rd	%pc, %r11
splash_hpstate_5_174:
	.word 0x8198203f  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x003f, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x5dfe7519114d74aa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_5_176:
    set user_data_start, %o7
	.word 0x93902001  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_hpstate_5_177:
	.word 0x81982536  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0536, %hpstate
mondo_5_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90c008  ! 322: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x91a449c4  ! 324: FDIVd	fdivd	%f48, %f4, %f8
	.word 0x8790218c  ! 325: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
debug_5_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93a00572  ! 327: FSQRTq	fsqrt	
intveclr_5_180:
	setx 0xca708ee76580ddf5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950003  ! 329: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xd2c80e60  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r9
cwp_5_182:
    set user_data_start, %o7
	.word 0x93902003  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_5_183:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 332: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_5_184:
    set user_data_start, %o7
	.word 0x93902003  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8790239f  ! 335: WRPR_TT_I	wrpr	%r0, 0x039f, %tt
splash_cmpr_5_185:
	setx 0x9617907374b146eb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 337: WRASI_I	wr	%r0, 0x004f, %asi
tagged_5_186:
	tsubcctv %r24, 0x1a05, %r18
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_5_187:
    set user_data_start, %o7
	.word 0x93902007  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_5_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_188:
	.word 0x8f902000  ! 342: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd297e020  ! 343: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
intveclr_5_189:
	setx 0xc16559576f8d5a6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_5_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_5_192:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 347: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_5_193:
	taddcctv %r19, 0x12a4, %r15
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_5_194:
	tsubcctv %r16, 0x1bd7, %r25
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_5_195:
	taddcctv %r12, 0x1c04, %r9
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x91a00166  ! 352: FABSq	dis not found

	.word 0x919274be  ! 353: WRPR_PIL_I	wrpr	%r9, 0x14be, %pil
	.word 0x9f802290  ! 354: SIR	sir	0x0290
intveclr_5_196:
	setx 0x5d24b900a4937001, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a00567  ! 356: FSQRTq	fsqrt	
	.word 0xe0800bc0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r16
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 358: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x879020b8  ! 360: WRPR_TT_I	wrpr	%r0, 0x00b8, %tt
	.word 0x879021b8  ! 361: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
debug_5_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x91902752  ! 364: WRPR_PIL_I	wrpr	%r0, 0x0752, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_198) + 56, 16, 16)) -> intp(0,0,9)
intvec_5_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_5_200-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_200:
	.word 0x9192c003  ! 367: WRPR_PIL_R	wrpr	%r11, %r3, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 368: FqTOd	dis not found

splash_cmpr_5_202:
	setx 0xd3a0a4c8a0137ce9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_5_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_204-donret_5_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d9028c0  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c282c  ! 373: SDIVX_I	sdivx	%r16, 0x082c, %r13
	.word 0xd6d7e030  ! 374: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x879023f5  ! 375: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0xd6900e60  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0xd68008a0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_5_206:
	set 0x60140000, %r31
	.word 0x8580e1e9  ! 378: WRCCR_I	wr	%r3, 0x01e9, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_5_207:
	.word 0xa7a009d3  ! 1: FDIVd	fdivd	%f0, %f50, %f50
	allclean
	.word 0x9bb50311  ! 380: ALIGNADDRESS	alignaddr	%r20, %r17, %r13
splash_hpstate_5_208:
	.word 0x81982055  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0055, %hpstate
intveclr_5_209:
	setx 0x5158e5aeb30e60cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_5_210:
	set user_data_start, %r31
	.word 0x85832ea5  ! 383: WRCCR_I	wr	%r12, 0x0ea5, %ccr
	.word 0xab848012  ! 384: WR_CLEAR_SOFTINT_R	wr	%r18, %r18, %clear_softint
splash_cmpr_5_211:
	setx 0x88d5a29214add204, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c804a0  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0xa1a509d2  ! 387: FDIVd	fdivd	%f20, %f18, %f16
	.word 0x91d02035  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_htba_5_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_5_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_213:
	.word 0x8f902003  ! 390: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93d02033  ! 391: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_lsu_5_214:
	setx 0xeaa3dd8d360c3695, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xd1350dbf53a09b12, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_216:
	setx 0xb103014dfb26af31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 395: FqTOd	dis not found

	.word 0xd097e020  ! 396: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xd0900e40  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
debug_5_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_5_219:
	.word 0x819823fe  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03fe, %hpstate
DS_5_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f16, %f24
	.word 0x9bb10309  ! 400: ALIGNADDRESS	alignaddr	%r4, %r9, %r13
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xa9b10ff3  ! 1: FONES	e	%f20
splash_lsu_4_0:
	setx 0x4f2c65725eecd6eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 3: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8780208b  ! 4: WRASI_I	wr	%r0, 0x008b, %asi
debug_4_1:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_4_3:
	taddcctv %r11, 0x16ff, %r1
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_4_4:
	setx 0xa1842c5021dc3a8b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 9: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8800c60  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_4_5:
	.word 0x95a449cc  ! 1: FDIVd	fdivd	%f48, %f12, %f10
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d020b2  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa5a0016c  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_4_6:
	.word 0x8198287d  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x087d, %hpstate
	.word 0xd4c80e60  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01969  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e030  ! 22: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
change_to_randtl_4_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_8:
	.word 0x8f902000  ! 23: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_4_9:
	set user_data_start, %r31
	.word 0x85823a9e  ! 24: WRCCR_I	wr	%r8, 0x1a9e, %ccr
mondo_4_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d910004  ! 25: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0x879020a7  ! 26: WRPR_TT_I	wrpr	%r0, 0x00a7, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0xa7a01a63  ! 28: FqTOi	fqtoi	
change_to_randtl_4_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_11:
	.word 0x8f902001  ! 29: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa968b819  ! 30: SDIVX_I	sdivx	%r2, 0xfffff819, %r20
	.word 0xd6880e60  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x73, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x8780204f  ! 36: WRASI_I	wr	%r0, 0x004f, %asi
tagged_4_14:
	tsubcctv %r13, 0x1602, %r26
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_4_15:
	set user_data_start, %r31
	.word 0x8580b0d6  ! 38: WRCCR_I	wr	%r2, 0x10d6, %ccr
tagged_4_16:
	tsubcctv %r6, 0x1de5, %r13
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x87902095  ! 40: WRPR_TT_I	wrpr	%r0, 0x0095, %tt
mondo_4_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d90400b  ! 41: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
donret_4_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_18-donret_4_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe010  ! 43: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
tagged_4_19:
	taddcctv %r4, 0x1e90, %r25
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x99414000  ! 45: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_21)+32, 16, 16)) -> intp(4,1,3)
xir_4_21:
	.word 0xa980b890  ! 46: WR_SET_SOFTINT_I	wr	%r2, 0x1890, %set_softint
mondo_4_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 47: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
donret_4_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_23-donret_4_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x93480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_25:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 52: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_26) + 32, 16, 16)) -> intp(4,0,14)
intvec_4_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_4_27:
	setx 0xd9a6f183db455f64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_4_28:
	nop
	setx 0xfffff3f9fffffe3c, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_4_29:
	setx 0x59eea3518ea06859, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_30:
	set user_data_start, %r31
	.word 0x8580f607  ! 61: WRCCR_I	wr	%r3, 0x1607, %ccr
debug_4_31:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802055  ! 63: WRASI_I	wr	%r0, 0x0055, %asi
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x91d02032  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 69: FqTOd	dis not found

	.word 0xd2800b00  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
splash_cmpr_4_33:
	setx 0x7515ccd97ab33327, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_34:
	setx 0xa9940f05a0989b3f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_35:
	setx 0xf828a672c01881f2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_36:
	setx 0xb8e79b3ffcef9664, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9850008  ! 76: WR_SET_SOFTINT_R	wr	%r20, %r8, %set_softint
intveclr_4_37:
	setx 0x25a9ffc6385d4852, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_38:
	setx 0xc7ef19b591ef212a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_4_39:
	.word 0xa3a049c8  ! 1: FDIVd	fdivd	%f32, %f8, %f48
	.word 0x93a489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f40
	.word 0x91a00540  ! 1: FSQRTd	fsqrt	
	.word 0x91a24830  ! 80: FADDs	fadds	%f9, %f16, %f8
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802004  ! 82: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_40) + 56, 16, 16)) -> intp(5,0,22)
intvec_4_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x879023ca  ! 85: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
	setx 0x9a5afe913cda1a15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a0016c  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_4_42-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_42:
	.word 0x9191c010  ! 88: WRPR_PIL_R	wrpr	%r7, %r16, %pil
	.word 0x87802088  ! 89: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa190200d  ! 90: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_4_43:
	setx 0x6ee5be9a8a0426f1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76d267b  ! 93: SDIVX_I	sdivx	%r20, 0x067b, %r19
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
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 94: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x8d903f52  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x1f52, %pstate
	.word 0x9350c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0xa7450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_4_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_4_48:
	set user_data_start, %r31
	.word 0x8584a51b  ! 103: WRCCR_I	wr	%r18, 0x051b, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_4_50:
	setx 0xec75ecf24121215d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022bd  ! 107: WRPR_TT_I	wrpr	%r0, 0x02bd, %tt
	.word 0x93a20dc0  ! 108: FdMULq	fdmulq	
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 109: FqTOd	dis not found

cwp_4_52:
    set user_data_start, %o7
	.word 0x93902003  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_53:
	setx 0x4cf89ec9eaa0a794, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_4_54:
	.word 0x81982826  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0826, %hpstate
	.word 0x9b6d0008  ! 116: SDIVX_R	sdivx	%r20, %r8, %r13
splash_htba_4_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c004a0  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_htba_4_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_4_57:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_57:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_57
    nop
debug_wait4_57:
    ld [%r23], %r16
    brnz %r16, debug_wait4_57
    nop
    ba,a debug_startwait4_57
continue_debug_4_57:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_57:
    cmp %r13, %r15
    bne,a wait_for_stat_4_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_57:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_57
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 120: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x83d02032  ! 121: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_4_58:
	.word 0x99a149ca  ! 1: FDIVd	fdivd	%f36, %f10, %f12
	.word 0xa549ba90	! Random illegal ?
	.word 0xa7a00542  ! 1: FSQRTd	fsqrt	
	.word 0xa7a48824  ! 122: FADDs	fadds	%f18, %f4, %f19
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x91d02033  ! 124: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_4_59:
	setx 0x660fa2bd4ab80907, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a23f6  ! 127: SDIVX_I	sdivx	%r8, 0x03f6, %r11
tagged_4_61:
	taddcctv %r8, 0x1607, %r20
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_62) + 0, 16, 16)) -> intp(7,0,11)
intvec_4_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01967  ! 130: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x9ba00169  ! 132: FABSq	dis not found

intveclr_4_65:
	setx 0x5b8333a310ddeefc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0xa9a449c2  ! 135: FDIVd	fdivd	%f48, %f2, %f20
cwp_4_66:
    set user_data_start, %o7
	.word 0x93902007  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa981000d  ! 137: WR_SET_SOFTINT_R	wr	%r4, %r13, %set_softint
	.word 0xe0c004a0  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
splash_hpstate_4_67:
	.word 0x819828c7  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c7, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01961  ! 140: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x9b414000  ! 142: RDPC	rd	%pc, %r13
	.word 0xe29004a0  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_71:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 144: RDPC	rd	%pc, %r13
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 145: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_72) + 16, 16, 16)) -> intp(1,0,18)
intvec_4_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790222a  ! 147: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
	.word 0x9ba049d2  ! 148: FDIVd	fdivd	%f32, %f18, %f44
	.word 0xd6c7e000  ! 149: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
change_to_randtl_4_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_73:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9025a0  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x05a0, %pstate
memptr_4_74:
	set 0x60540000, %r31
	.word 0x8584fd62  ! 152: WRCCR_I	wr	%r19, 0x1d62, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_4_76:
	setx 0x83a2b362e048e140, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9350c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_4_77-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_77:
	.word 0x9190400d  ! 159: WRPR_PIL_R	wrpr	%r1, %r13, %pil
	.word 0x8d903a69  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x1a69, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab84331a  ! 162: WR_CLEAR_SOFTINT_I	wr	%r16, 0x131a, %clear_softint
splash_lsu_4_78:
	setx 0x8635cd4ac4022f51, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_4_79:
	setx 0x76900a76ddbe75a5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_4_81:
	.word 0x8198254d  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
splash_htba_4_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_4_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99a309cb  ! 170: FDIVd	fdivd	%f12, %f42, %f12
splash_lsu_4_84:
	setx 0xabec60067d2e9a27, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 172: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802010  ! 173: WRASI_I	wr	%r0, 0x0010, %asi
DS_4_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 175: FqTOd	dis not found

DS_4_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b04301  ! 176: ALIGNADDRESS	alignaddr	%r1, %r1, %r12
splash_hpstate_4_88:
	.word 0x81982f94  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f94, %hpstate
	.word 0xa2dc0004  ! 178: SMULcc_R	smulcc 	%r16, %r4, %r17
	.word 0x87802010  ! 179: WRASI_I	wr	%r0, 0x0010, %asi
splash_hpstate_4_89:
	.word 0x8198245f  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
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
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 182: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xd4cfe020  ! 183: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
splash_hpstate_4_91:
	.word 0x8198234f  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034f, %hpstate
debug_4_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_4_93:
	setx 0x1ccdfc700073250e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbb74ce64	! Random illegal ?
	.word 0x97a009ca  ! 1: FDIVd	fdivd	%f0, %f10, %f42
	.word 0x97a1c834  ! 187: FADDs	fadds	%f7, %f20, %f11
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
	.word 0x97414000  ! 188: RDPC	rd	%pc, %r11
	.word 0xe88fe020  ! 189: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
splash_lsu_4_96:
	setx 0xb61523dde274a59f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a409f3  ! 191: FDIVq	dis not found

cwp_4_97:
    set user_data_start, %o7
	.word 0x93902000  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa781000c  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r12, %-
	.word 0x8790212a  ! 194: WRPR_TT_I	wrpr	%r0, 0x012a, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01971  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_100) + 48, 16, 16)) -> intp(7,0,7)
intvec_4_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 197: FqTOd	dis not found

intveclr_4_102:
	setx 0x3e74ea552bb021c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d91c010  ! 199: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
memptr_4_104:
	set 0x60340000, %r31
	.word 0x85823307  ! 200: WRCCR_I	wr	%r8, 0x1307, %ccr
	.word 0x87802014  ! 201: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa9840008  ! 202: WR_SET_SOFTINT_R	wr	%r16, %r8, %set_softint
	.word 0x8780208a  ! 203: WRASI_I	wr	%r0, 0x008a, %asi
DS_4_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e80  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r16
debug_4_106:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902506  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x0506, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902002  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_4_109:
    set user_data_start, %o7
	.word 0x93902000  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
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
	.word 0xa3414000  ! 214: RDPC	rd	%pc, %r17
debug_4_111:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_111:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_111
    nop
debug_wait4_111:
    ld [%r23], %r16
    brnz %r16, debug_wait4_111
    nop
    ba,a debug_startwait4_111
continue_debug_4_111:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_111:
    cmp %r13, %r15
    bne,a wait_for_stat_4_111
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_111:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_111
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 215: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16a213d  ! 216: SDIVX_I	sdivx	%r8, 0x013d, %r16
	.word 0xa1902000  ! 217: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_4_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_4_114:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_4_115:
	.word 0x81982dd6  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd6, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_116) + 56, 16, 16)) -> intp(0,0,22)
intvec_4_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xa7414000  ! 225: RDPC	rd	%pc, %r19
	.word 0x9153c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_4_118:
	set 0x60540000, %r31
	.word 0x85813495  ! 227: WRCCR_I	wr	%r4, 0x1495, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 228: FqTOd	dis not found

	.word 0x95a089cc  ! 229: FDIVd	fdivd	%f2, %f12, %f10
	.word 0x8780201c  ! 230: WRASI_I	wr	%r0, 0x001c, %asi
splash_tba_4_120:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_121:
	setx 0x87a3f626cb7a20dc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_4_123:
	.word 0x81982e3c  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e3c, %hpstate
	.word 0x919177ad  ! 236: WRPR_PIL_I	wrpr	%r5, 0x17ad, %pil
change_to_randtl_4_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_124:
	.word 0x8f902001  ! 237: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_4_125:
	setx 0x3c19b8d46e28613b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_126:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 240: RDPC	rd	%pc, %r11
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_4_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_127:
	.word 0x8f902003  ! 242: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9ba349c2  ! 243: FDIVd	fdivd	%f44, %f2, %f44
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9697d74  ! 244: SDIVX_I	sdivx	%r5, 0xfffffd74, %r20
	.word 0xe28008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
cwp_4_129:
    set user_data_start, %o7
	.word 0x93902004  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d020b4  ! 247: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x87802089  ! 249: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_4_130:
	setx 0x2e2a8140f69fa92f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_131:
	.word 0x8f902001  ! 251: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_132)+0, 16, 16)) -> intp(4,1,3)
xir_4_132:
	.word 0xa9847c59  ! 253: WR_SET_SOFTINT_I	wr	%r17, 0x1c59, %set_softint
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 254: RDPC	rd	%pc, %r20
DS_4_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f14, %f30
	.word 0xa5b40313  ! 255: ALIGNADDRESS	alignaddr	%r16, %r19, %r18
	setx 0x899286004bb0a53e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902312  ! 257: WRPR_TT_I	wrpr	%r0, 0x0312, %tt
splash_tba_4_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b50c000  ! 259: RDPR_TT	rdpr	%tt, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d90340b  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x140b, %pstate
DS_4_138:
	.word 0xa1a1c9cd  ! 1: FDIVd	fdivd	%f38, %f44, %f16
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_4_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_4_141:
	taddcctv %r24, 0x104e, %r11
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0xa9a00163  ! 267: FABSq	dis not found

	.word 0x8790219d  ! 268: WRPR_TT_I	wrpr	%r0, 0x019d, %tt
change_to_randtl_4_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_142:
	.word 0x8f902002  ! 269: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa3a4c9c3  ! 270: FDIVd	fdivd	%f50, %f34, %f48
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0xa5450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r18
splash_tba_4_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902297  ! 274: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
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
	.word 0x95414000  ! 275: RDPC	rd	%pc, %r10
	.word 0xa7848003  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r3, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_4_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_147:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_147:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_147
    nop
debug_wait4_147:
    ld [%r23], %r16
    brnz %r16, debug_wait4_147
    nop
    ba,a debug_startwait4_147
continue_debug_4_147:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_147:
    cmp %r13, %r15
    bne,a wait_for_stat_4_147
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_147:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_147
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 280: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_tba_4_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879021f9  ! 282: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
splash_tba_4_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_150:
	setx 0xba26c6b39c215012, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_4_151:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_4_152-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_152:
	.word 0x91920010  ! 288: WRPR_PIL_R	wrpr	%r8, %r16, %pil
splash_cmpr_4_153:
	setx 0xe9f6e42b1567a1b2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_154:
	setx 0xafd121120de74c09, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_4_155:
	set 0x60740000, %r31
	.word 0x8584b98f  ! 292: WRCCR_I	wr	%r18, 0x198f, %ccr
mondo_4_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 293: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_157:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 294: RDPC	rd	%pc, %r12
DS_4_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4_159:
	setx 0x03e329bd92dcc333, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 299: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_htba_4_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_4_161:
	.word 0x8198250f  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0x8d902afa  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0afa, %pstate
splash_tba_4_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xc4588566942cb9c2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_164:
    set user_data_start, %o7
	.word 0x93902005  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_4_165:
	setx 0x8fc3efe7a70334b6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_4_167:
	.word 0x81982705  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01963  ! 311: FqTOd	dis not found

mondo_4_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 312: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
splash_cmpr_4_170:
	setx 0x5a202a84bedce733, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_171:
	.word 0x8f902002  ! 314: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_4_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 316: RDPC	rd	%pc, %r19
splash_hpstate_4_174:
	.word 0x81982136  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0136, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x243c965cc3c4fb8d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_176:
    set user_data_start, %o7
	.word 0x93902004  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_hpstate_4_177:
	.word 0x81982c75  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c75, %hpstate
mondo_4_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 322: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x95a049d4  ! 324: FDIVd	fdivd	%f32, %f20, %f10
	.word 0x8790219d  ! 325: WRPR_TT_I	wrpr	%r0, 0x019d, %tt
debug_4_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1a0056a  ! 327: FSQRTq	fsqrt	
intveclr_4_180:
	setx 0xde41cbb22776a63a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d93000a  ! 329: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0xd2c80e80  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
cwp_4_182:
    set user_data_start, %o7
	.word 0x93902003  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_4_183:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_183:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_183
    nop
debug_wait4_183:
    ld [%r23], %r16
    brnz %r16, debug_wait4_183
    nop
    ba,a debug_startwait4_183
continue_debug_4_183:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_183:
    cmp %r13, %r15
    bne,a wait_for_stat_4_183
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_183:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_183
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 332: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
cwp_4_184:
    set user_data_start, %o7
	.word 0x93902001  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879023eb  ! 335: WRPR_TT_I	wrpr	%r0, 0x03eb, %tt
splash_cmpr_4_185:
	setx 0x6320aa9474f73462, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780208b  ! 337: WRASI_I	wr	%r0, 0x008b, %asi
tagged_4_186:
	tsubcctv %r1, 0x1828, %r23
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_4_187:
    set user_data_start, %o7
	.word 0x93902000  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_4_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_188:
	.word 0x8f902001  ! 342: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd297e010  ! 343: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
intveclr_4_189:
	setx 0x429b3ce0ff5db43e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_4_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_4_192:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_192:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_192
    nop
debug_wait4_192:
    ld [%r23], %r16
    brnz %r16, debug_wait4_192
    nop
    ba,a debug_startwait4_192
continue_debug_4_192:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_192:
    cmp %r13, %r15
    bne,a wait_for_stat_4_192
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_192:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_192
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 347: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_4_193:
	taddcctv %r26, 0x1029, %r1
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_4_194:
	tsubcctv %r19, 0x1661, %r16
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_4_195:
	taddcctv %r20, 0x1b01, %r11
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x93a00171  ! 352: FABSq	dis not found

	.word 0x91946068  ! 353: WRPR_PIL_I	wrpr	%r17, 0x0068, %pil
	.word 0x9f8030b8  ! 354: SIR	sir	0x10b8
intveclr_4_196:
	setx 0x77c47508a940381b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00570  ! 356: FSQRTq	fsqrt	
	.word 0xe08008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x879021e4  ! 360: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
	.word 0x87902108  ! 361: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
debug_4_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0800ac0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
	.word 0x919226ae  ! 364: WRPR_PIL_I	wrpr	%r8, 0x06ae, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_198) + 48, 16, 16)) -> intp(2,0,25)
intvec_4_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_4_200-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_200:
	.word 0x91950007  ! 367: WRPR_PIL_R	wrpr	%r20, %r7, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01965  ! 368: FqTOd	dis not found

splash_cmpr_4_202:
	setx 0xf667909fce804f20, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_4_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_204-donret_4_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d902fcf  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0fcf, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cb985  ! 373: SDIVX_I	sdivx	%r18, 0xfffff985, %r12
	.word 0xd6d7e010  ! 374: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x8790223e  ! 375: WRPR_TT_I	wrpr	%r0, 0x023e, %tt
	.word 0xd6900e40  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x72, %r11
	.word 0xd6800ac0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
memptr_4_206:
	set 0x60540000, %r31
	.word 0x858174dd  ! 378: WRCCR_I	wr	%r5, 0x14dd, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_4_207:
	.word 0x99a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f12
	allclean
	.word 0x97b4030c  ! 380: ALIGNADDRESS	alignaddr	%r16, %r12, %r11
splash_hpstate_4_208:
	.word 0x81982254  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0254, %hpstate
intveclr_4_209:
	setx 0xcaf63a8e4bb7e82a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_210:
	set user_data_start, %r31
	.word 0x8580b881  ! 383: WRCCR_I	wr	%r2, 0x1881, %ccr
	.word 0xab84c010  ! 384: WR_CLEAR_SOFTINT_R	wr	%r19, %r16, %clear_softint
splash_cmpr_4_211:
	setx 0x1ad0428a58c238de, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c80e60  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r16
	.word 0x91a189d4  ! 387: FDIVd	fdivd	%f6, %f20, %f8
	.word 0x83d02033  ! 388: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_htba_4_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_4_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_213:
	.word 0x8f902002  ! 390: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d020b5  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_4_214:
	setx 0x6a1efd6289beef99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xd78edb86f3987f17, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_216:
	setx 0xec7a9fcabc2b4685, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01961  ! 395: FqTOd	dis not found

	.word 0xd097e030  ! 396: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_4_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_4_219:
	.word 0x819824a6  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04a6, %hpstate
DS_4_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f18, %f2
	.word 0xa1b0c304  ! 400: ALIGNADDRESS	alignaddr	%r3, %r4, %r16
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xa3b44fea  ! 1: FONES	e	%f17
splash_lsu_3_0:
	setx 0x11319da2938daef9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 3: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8780201c  ! 4: WRASI_I	wr	%r0, 0x001c, %asi
debug_3_1:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_3_3:
	taddcctv %r26, 0x11bd, %r19
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_3_4:
	setx 0x31e470b0bd6db917, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 9: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_3_5:
	.word 0x93a1c9d4  ! 1: FDIVd	fdivd	%f38, %f20, %f40
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d020b2  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x93a00162  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_3_6:
	.word 0x81982574  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0574, %hpstate
	.word 0xd4c804a0  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e000  ! 22: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
change_to_randtl_3_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_8:
	.word 0x8f902001  ! 23: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_3_9:
	set user_data_start, %r31
	.word 0x85822e2d  ! 24: WRCCR_I	wr	%r8, 0x0e2d, %ccr
mondo_3_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 25: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x87902311  ! 26: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x91a01a66  ! 28: FqTOi	fqtoi	
change_to_randtl_3_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_11:
	.word 0x8f902001  ! 29: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36965f4  ! 30: SDIVX_I	sdivx	%r5, 0x05f4, %r17
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802010  ! 36: WRASI_I	wr	%r0, 0x0010, %asi
tagged_3_14:
	tsubcctv %r8, 0x1a66, %r10
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_3_15:
	set user_data_start, %r31
	.word 0x85843a56  ! 38: WRCCR_I	wr	%r16, 0x1a56, %ccr
tagged_3_16:
	tsubcctv %r12, 0x19f0, %r17
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x879022b8  ! 40: WRPR_TT_I	wrpr	%r0, 0x02b8, %tt
mondo_3_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 41: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
donret_3_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_18-donret_3_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe030  ! 43: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
tagged_3_19:
	taddcctv %r22, 0x1ac3, %r10
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x9b414000  ! 45: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_21)+0, 16, 16)) -> intp(3,1,3)
xir_3_21:
	.word 0xa982f081  ! 46: WR_SET_SOFTINT_I	wr	%r11, 0x1081, %set_softint
mondo_3_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 47: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
donret_3_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_23-donret_3_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x91480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_25:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 52: RDPC	rd	%pc, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_26) + 8, 16, 16)) -> intp(6,0,4)
intvec_3_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_3_27:
	setx 0xee0e0dab6f88491f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800ac0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_3_28:
	nop
	setx 0xfffff2effffff45e, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_3_29:
	setx 0xca3bbc4accf0a3f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_3_30:
	set user_data_start, %r31
	.word 0x85843699  ! 61: WRCCR_I	wr	%r16, 0x1699, %ccr
debug_3_31:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780201c  ! 63: WRASI_I	wr	%r0, 0x001c, %asi
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x93d02034  ! 67: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 69: FqTOd	dis not found

	.word 0xd28008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_3_33:
	setx 0xe9a863e7876055be, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_34:
	setx 0x73ee41bda883e5ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_35:
	setx 0xe8fc1da50fe6784f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_36:
	setx 0x3213ec478bc3512a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9840012  ! 76: WR_SET_SOFTINT_R	wr	%r16, %r18, %set_softint
intveclr_3_37:
	setx 0xde3c788c768cde73, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_3_38:
	setx 0xce6e587dd4972d51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_3_39:
	.word 0x9ba289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f44
	.word 0x91a289c6  ! 1: FDIVd	fdivd	%f10, %f6, %f8
	.word 0xa9a00550  ! 1: FSQRTd	fsqrt	
	.word 0x95a24825  ! 80: FADDs	fadds	%f9, %f5, %f10
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802016  ! 82: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_40) + 32, 16, 16)) -> intp(0,0,4)
intvec_3_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8790208e  ! 85: WRPR_TT_I	wrpr	%r0, 0x008e, %tt
	setx 0x79d452fa4b82de4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00163  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_3_42-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_42:
	.word 0x9190c00c  ! 88: WRPR_PIL_R	wrpr	%r3, %r12, %pil
	.word 0x87802010  ! 89: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1902004  ! 90: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_3_43:
	setx 0xaade3c52c956c8f1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c3670  ! 93: SDIVX_I	sdivx	%r16, 0xfffff670, %r12
debug_3_45:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 94: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0x8d902c07  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0c07, %pstate
	.word 0x9350c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0x97450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_3_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_3_48:
	set user_data_start, %r31
	.word 0x85843478  ! 103: WRCCR_I	wr	%r16, 0x1478, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_3_50:
	setx 0x0455e05570efa61e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902335  ! 107: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	.word 0x93a48dc1  ! 108: FdMULq	fdmulq	
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196b  ! 109: FqTOd	dis not found

cwp_3_52:
    set user_data_start, %o7
	.word 0x93902001  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 112: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_3_53:
	setx 0xaf77a9c116300072, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_3_54:
	.word 0x81982f7f  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f7f, %hpstate
	.word 0xa168c014  ! 116: SDIVX_R	sdivx	%r3, %r20, %r16
splash_htba_3_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c004a0  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_htba_3_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_3_57:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 120: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x91d02034  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_3_58:
	.word 0x99a109cd  ! 1: FDIVd	fdivd	%f4, %f44, %f12
	.word 0x917b2552	! Random illegal ?
	.word 0x93a00548  ! 1: FSQRTd	fsqrt	
	.word 0x93a2082d  ! 122: FADDs	fadds	%f8, %f13, %f9
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x93d02032  ! 124: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_3_59:
	setx 0x9d521580abcfaaad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996af0ab  ! 127: SDIVX_I	sdivx	%r11, 0xfffff0ab, %r12
tagged_3_61:
	taddcctv %r17, 0x1bc0, %r25
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_62) + 32, 16, 16)) -> intp(5,0,11)
intvec_3_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 130: FqTOd	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x9ba00164  ! 132: FABSq	dis not found

intveclr_3_65:
	setx 0xb94f34ff334c3d04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0x97a509c4  ! 135: FDIVd	fdivd	%f20, %f4, %f42
cwp_3_66:
    set user_data_start, %o7
	.word 0x93902004  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa981c012  ! 137: WR_SET_SOFTINT_R	wr	%r7, %r18, %set_softint
	.word 0xe0c00e60  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
splash_hpstate_3_67:
	.word 0x81982fdd  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdd, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01964  ! 140: FqTOd	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x99414000  ! 142: RDPC	rd	%pc, %r12
	.word 0xe2900e60  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x73, %r17
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_71:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 144: RDPC	rd	%pc, %r11
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 145: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_72) + 40, 16, 16)) -> intp(6,0,0)
intvec_3_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790228f  ! 147: WRPR_TT_I	wrpr	%r0, 0x028f, %tt
	.word 0x99a209d1  ! 148: FDIVd	fdivd	%f8, %f48, %f12
	.word 0xd6c7e030  ! 149: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
change_to_randtl_3_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_73:
	.word 0x8f902003  ! 150: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d9020da  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
memptr_3_74:
	set 0x60540000, %r31
	.word 0x85803b26  ! 152: WRCCR_I	wr	%r0, 0x1b26, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_3_76:
	setx 0x61b8a10adb9846a8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9350c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d80e80  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	rd %pc, %r19
	add %r19, (ivw_3_77-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_77:
	.word 0x9194c009  ! 159: WRPR_PIL_R	wrpr	%r19, %r9, %pil
	.word 0x8d9032c1  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x12c1, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab82e805  ! 162: WR_CLEAR_SOFTINT_I	wr	%r11, 0x0805, %clear_softint
splash_lsu_3_78:
	setx 0x5fe103d3a7da3c83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_3_79:
	setx 0x525e7b014d0e447e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_3_81:
	.word 0x819827df  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
splash_htba_3_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_3_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a009d0  ! 170: FDIVd	fdivd	%f0, %f16, %f10
splash_lsu_3_84:
	setx 0x55b7e74b112a3547, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 172: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x87802014  ! 173: WRASI_I	wr	%r0, 0x0014, %asi
DS_3_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01971  ! 175: FqTOd	dis not found

DS_3_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b44307  ! 176: ALIGNADDRESS	alignaddr	%r17, %r7, %r8
splash_hpstate_3_88:
	.word 0x81982185  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	.word 0x94d94010  ! 178: SMULcc_R	smulcc 	%r5, %r16, %r10
	.word 0x87802020  ! 179: WRASI_I	wr	%r0, 0x0020, %asi
splash_hpstate_3_89:
	.word 0x81982215  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0215, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_3_90:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 182: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xd4cfe030  ! 183: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
splash_hpstate_3_91:
	.word 0x81982d0e  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0e, %hpstate
debug_3_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_3_93:
	setx 0xa326cebd52a93be0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xf76b3eaa	! Random illegal ?
	.word 0xa7a289d0  ! 1: FDIVd	fdivd	%f10, %f16, %f50
	.word 0xa9a50831  ! 187: FADDs	fadds	%f20, %f17, %f20
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
	.word 0x95414000  ! 188: RDPC	rd	%pc, %r10
	.word 0xe88fe010  ! 189: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
splash_lsu_3_96:
	setx 0x74ddb0afcc31ee53, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97a149f0  ! 191: FDIVq	dis not found

cwp_3_97:
    set user_data_start, %o7
	.word 0x93902005  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa783000c  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r12, %-
	.word 0x879020ac  ! 194: WRPR_TT_I	wrpr	%r0, 0x00ac, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01965  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_100) + 24, 16, 16)) -> intp(3,0,11)
intvec_3_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01968  ! 197: FqTOd	dis not found

intveclr_3_102:
	setx 0x1710749120f28a2f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950014  ! 199: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
memptr_3_104:
	set 0x60540000, %r31
	.word 0x8581ef51  ! 200: WRCCR_I	wr	%r7, 0x0f51, %ccr
	.word 0x87802080  ! 201: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa984c002  ! 202: WR_SET_SOFTINT_R	wr	%r19, %r2, %set_softint
	.word 0x87802020  ! 203: WRASI_I	wr	%r0, 0x0020, %asi
DS_3_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e80  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r16
debug_3_106:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902505  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x0505, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902000  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_3_109:
    set user_data_start, %o7
	.word 0x93902001  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
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
	.word 0xa7414000  ! 214: RDPC	rd	%pc, %r19
debug_3_111:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 215: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68ffeb  ! 216: SDIVX_I	sdivx	%r3, 0xffffffeb, %r13
	.word 0xa1902006  ! 217: WRPR_GL_I	wrpr	%r0, 0x0006, %-
debug_3_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_114:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_3_115:
	.word 0x81982a9e  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_116) + 32, 16, 16)) -> intp(2,0,17)
intvec_3_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x97414000  ! 225: RDPC	rd	%pc, %r11
	.word 0xa753c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_3_118:
	set 0x60340000, %r31
	.word 0x85826aee  ! 227: WRCCR_I	wr	%r9, 0x0aee, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196c  ! 228: FqTOd	dis not found

	.word 0xa7a449c1  ! 229: FDIVd	fdivd	%f48, %f32, %f50
	.word 0x8780208b  ! 230: WRASI_I	wr	%r0, 0x008b, %asi
splash_tba_3_120:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_3_121:
	setx 0x3c8880b76ea86054, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_3_123:
	.word 0x81982635  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0635, %hpstate
	.word 0x919465ac  ! 236: WRPR_PIL_I	wrpr	%r17, 0x05ac, %pil
change_to_randtl_3_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_124:
	.word 0x8f902001  ! 237: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_3_125:
	setx 0xb3bbb53eb35a5bbd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 240: RDPC	rd	%pc, %r20
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_3_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_127:
	.word 0x8f902000  ! 242: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x95a2c9d2  ! 243: FDIVd	fdivd	%f42, %f18, %f10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369f3c7  ! 244: SDIVX_I	sdivx	%r7, 0xfffff3c7, %r9
	.word 0xe28008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
cwp_3_129:
    set user_data_start, %o7
	.word 0x93902002  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d02035  ! 247: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x8780201c  ! 249: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_3_130:
	setx 0x2c95010933859493, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_131:
	.word 0x8f902002  ! 251: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_132)+16, 16, 16)) -> intp(3,1,3)
xir_3_132:
	.word 0xa982eb4e  ! 253: WR_SET_SOFTINT_I	wr	%r11, 0x0b4e, %set_softint
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 254: RDPC	rd	%pc, %r17
DS_3_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f12, %f4
	.word 0x91b14300  ! 255: ALIGNADDRESS	alignaddr	%r5, %r0, %r8
	setx 0x2fd7718b89c38db9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790206a  ! 257: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
splash_tba_3_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa150c000  ! 259: RDPR_TT	rdpr	%tt, %r16
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d903606  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x1606, %pstate
DS_3_138:
	.word 0x99a409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f12
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_3_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
tagged_3_141:
	taddcctv %r21, 0x12ff, %r17
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0x91a00167  ! 267: FABSq	dis not found

	.word 0x87902274  ! 268: WRPR_TT_I	wrpr	%r0, 0x0274, %tt
change_to_randtl_3_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x95a309c7  ! 270: FDIVd	fdivd	%f12, %f38, %f10
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x93450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r9
splash_tba_3_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902257  ! 274: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
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
	.word 0x99414000  ! 275: RDPC	rd	%pc, %r12
	.word 0xa7828005  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r5, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_3_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_147:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 280: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_tba_3_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902018  ! 282: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
splash_tba_3_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_3_150:
	setx 0x75884914d6b0b637, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_3_151:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4800b80  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r18
	rd %pc, %r19
	add %r19, (ivw_3_152-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_152:
	.word 0x9191c006  ! 288: WRPR_PIL_R	wrpr	%r7, %r6, %pil
splash_cmpr_3_153:
	setx 0x71328b819cb80382, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_154:
	setx 0x59e8bb9aba5e0b77, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_3_155:
	set 0x60140000, %r31
	.word 0x8580ad06  ! 292: WRCCR_I	wr	%r2, 0x0d06, %ccr
mondo_3_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d91c004  ! 293: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_157:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 294: RDPC	rd	%pc, %r10
DS_3_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_3_159:
	setx 0x04c57e88ca0d4947, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 299: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_htba_3_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_3_161:
	.word 0x81982a14  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a14, %hpstate
	.word 0x8d903417  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x1417, %pstate
splash_tba_3_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xe5a5423eb70361b6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_3_164:
    set user_data_start, %o7
	.word 0x93902003  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_3_165:
	setx 0x5b7f4110b37e0fde, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_3_167:
	.word 0x81982d4c  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4c, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01973  ! 311: FqTOd	dis not found

mondo_3_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d920001  ! 312: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
splash_cmpr_3_170:
	setx 0x82b27f31bae592f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_171:
	.word 0x8f902001  ! 314: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_3_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_173:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 316: RDPC	rd	%pc, %r13
splash_hpstate_3_174:
	.word 0x819829c4  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c4, %hpstate
	.word 0xdad00e80  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
	setx 0x546c84db090c3f4c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_3_176:
    set user_data_start, %o7
	.word 0x93902006  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_hpstate_3_177:
	.word 0x81982dcc  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcc, %hpstate
mondo_3_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90000c  ! 322: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x95a049d4  ! 324: FDIVd	fdivd	%f32, %f20, %f10
	.word 0x87902379  ! 325: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
debug_3_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99a0056c  ! 327: FSQRTq	fsqrt	
intveclr_3_180:
	setx 0x9cb74eb56cd71fd3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d928010  ! 329: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0xd2c804a0  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
cwp_3_182:
    set user_data_start, %o7
	.word 0x93902006  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_3_183:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 332: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cwp_3_184:
    set user_data_start, %o7
	.word 0x93902005  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879023a2  ! 335: WRPR_TT_I	wrpr	%r0, 0x03a2, %tt
splash_cmpr_3_185:
	setx 0xb44fbc491138753a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802083  ! 337: WRASI_I	wr	%r0, 0x0083, %asi
tagged_3_186:
	tsubcctv %r16, 0x195b, %r11
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_3_187:
    set user_data_start, %o7
	.word 0x93902006  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_3_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_188:
	.word 0x8f902002  ! 342: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd297e020  ! 343: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
intveclr_3_189:
	setx 0x241430f8545788c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_3_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_3_192:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 347: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_3_193:
	taddcctv %r15, 0x1196, %r7
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_3_194:
	tsubcctv %r3, 0x1efd, %r13
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_3_195:
	taddcctv %r25, 0x13c0, %r26
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x91a00168  ! 352: FABSq	dis not found

	.word 0x9192ecb3  ! 353: WRPR_PIL_I	wrpr	%r11, 0x0cb3, %pil
	.word 0x9f80357f  ! 354: SIR	sir	0x157f
intveclr_3_196:
	setx 0xf737220a9927b510, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00569  ! 356: FSQRTq	fsqrt	
	.word 0xe0800b00  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x87902393  ! 360: WRPR_TT_I	wrpr	%r0, 0x0393, %tt
	.word 0x87902010  ! 361: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
debug_3_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9190acfc  ! 364: WRPR_PIL_I	wrpr	%r2, 0x0cfc, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_198) + 56, 16, 16)) -> intp(0,0,17)
intvec_3_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_3_200-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_200:
	.word 0x91940000  ! 367: WRPR_PIL_R	wrpr	%r16, %r0, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01966  ! 368: FqTOd	dis not found

splash_cmpr_3_202:
	setx 0x2af4d536393a964e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_3_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_204-donret_3_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d903cbe  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x1cbe, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968a344  ! 373: SDIVX_I	sdivx	%r2, 0x0344, %r12
	.word 0xd6d7e030  ! 374: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x87902331  ! 375: WRPR_TT_I	wrpr	%r0, 0x0331, %tt
	.word 0xd69004a0  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_3_206:
	set 0x60740000, %r31
	.word 0x858170c0  ! 378: WRCCR_I	wr	%r5, 0x10c0, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_3_207:
	.word 0xa1a209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f16
	allclean
	.word 0x97b4430d  ! 380: ALIGNADDRESS	alignaddr	%r17, %r13, %r11
splash_hpstate_3_208:
	.word 0x81982acd  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
intveclr_3_209:
	setx 0x1908ae2a4a920ffa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_3_210:
	set user_data_start, %r31
	.word 0x8581e898  ! 383: WRCCR_I	wr	%r7, 0x0898, %ccr
	.word 0xab814006  ! 384: WR_CLEAR_SOFTINT_R	wr	%r5, %r6, %clear_softint
splash_cmpr_3_211:
	setx 0xc82f03e1e6a6cfd6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c804a0  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x97a289c9  ! 387: FDIVd	fdivd	%f10, %f40, %f42
	.word 0x91d02033  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_3_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_3_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_213:
	.word 0x8f902001  ! 390: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02032  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_3_214:
	setx 0xcc702e25322d8c57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x5cc3dae3e467e041, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_216:
	setx 0x5cfec46a29608f84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 395: FqTOd	dis not found

	.word 0xd097e010  ! 396: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_3_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_3_219:
	.word 0x819829df  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
DS_3_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f20, %f16
	.word 0xa3b44312  ! 400: ALIGNADDRESS	alignaddr	%r17, %r18, %r17
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xa5b2cfe7  ! 1: FONES	e	%f18
splash_lsu_2_0:
	setx 0x81905cb4b7a266c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802083  ! 4: WRASI_I	wr	%r0, 0x0083, %asi
debug_2_1:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_2_3:
	taddcctv %r16, 0x1c54, %r17
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_2_4:
	setx 0x287c69c3aa85dda2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 9: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_2_5:
	.word 0x91a109cb  ! 1: FDIVd	fdivd	%f4, %f42, %f8
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802004  ! 14: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02034  ! 15: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9ba00165  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_2_6:
	.word 0x81982a1e  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1e, %hpstate
	.word 0xd4c804a0  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01973  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e010  ! 22: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
change_to_randtl_2_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_8:
	.word 0x8f902001  ! 23: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_2_9:
	set user_data_start, %r31
	.word 0x85803f30  ! 24: WRCCR_I	wr	%r0, 0x1f30, %ccr
mondo_2_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 25: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0x87902198  ! 26: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0xa1a01a6d  ! 28: FqTOi	fqtoi	
change_to_randtl_2_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_11:
	.word 0x8f902003  ! 29: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a393b  ! 30: SDIVX_I	sdivx	%r8, 0xfffff93b, %r20
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802004  ! 36: WRASI_I	wr	%r0, 0x0004, %asi
tagged_2_14:
	tsubcctv %r16, 0x1e10, %r26
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_2_15:
	set user_data_start, %r31
	.word 0x85836d6e  ! 38: WRCCR_I	wr	%r13, 0x0d6e, %ccr
tagged_2_16:
	tsubcctv %r20, 0x1ae2, %r12
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x87902321  ! 40: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
mondo_2_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c004  ! 41: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
donret_2_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_18-donret_2_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe000  ! 43: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
tagged_2_19:
	taddcctv %r6, 0x1e26, %r14
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x93414000  ! 45: RDPC	rd	%pc, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_21)+24, 16, 16)) -> intp(2,1,3)
xir_2_21:
	.word 0xa981ac3a  ! 46: WR_SET_SOFTINT_I	wr	%r6, 0x0c3a, %set_softint
mondo_2_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d950000  ! 47: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
donret_2_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_23-donret_2_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0xa1480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_25:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 52: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_26) + 0, 16, 16)) -> intp(3,0,28)
intvec_2_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_2_27:
	setx 0x3647ffaa7754611b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800c40  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_2_28:
	nop
	setx 0xfffffbc7fffff170, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_2_29:
	setx 0xc3aa0eb46603850c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_30:
	set user_data_start, %r31
	.word 0x85843e19  ! 61: WRCCR_I	wr	%r16, 0x1e19, %ccr
debug_2_31:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802010  ! 63: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x91d020b4  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01963  ! 69: FqTOd	dis not found

	.word 0xd2800b80  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
splash_cmpr_2_33:
	setx 0x1dc7986d2aa217be, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_34:
	setx 0x30328a8bf5452886, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_35:
	setx 0x876305f3f26cbaa8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_36:
	setx 0x934dfa4a6629e24e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9850001  ! 76: WR_SET_SOFTINT_R	wr	%r20, %r1, %set_softint
intveclr_2_37:
	setx 0x0634fb89df3e2301, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_38:
	setx 0x6ef9e4bf790dca00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b2  ! 79: Tcc_I	te	icc_or_xcc, %r0 + 178
DS_2_39:
	.word 0x91a209cb  ! 1: FDIVd	fdivd	%f8, %f42, %f8
	.word 0xa9a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f20
	.word 0x95a00553  ! 1: FSQRTd	fsqrt	
	.word 0x95a10833  ! 80: FADDs	fadds	%f4, %f19, %f10
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x8780201c  ! 82: WRASI_I	wr	%r0, 0x001c, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_40) + 40, 16, 16)) -> intp(6,0,8)
intvec_2_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x879020f2  ! 85: WRPR_TT_I	wrpr	%r0, 0x00f2, %tt
	setx 0x786d96a08f458267, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a0016a  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_2_42-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_42:
	.word 0x91934011  ! 88: WRPR_PIL_R	wrpr	%r13, %r17, %pil
	.word 0x87802088  ! 89: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902008  ! 90: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_2_43:
	setx 0x9de69f6e316c4e7f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969a1d2  ! 93: SDIVX_I	sdivx	%r6, 0x01d2, %r12
debug_2_45:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 94: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8d9029e5  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x09e5, %pstate
	.word 0x9550c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0x97450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_2_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_2_48:
	set user_data_start, %r31
	.word 0x8582a5e3  ! 103: WRCCR_I	wr	%r10, 0x05e3, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_2_50:
	setx 0xda15bdd766e97951, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902096  ! 107: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
	.word 0x99a48dc5  ! 108: FdMULq	fdmulq	
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 109: FqTOd	dis not found

cwp_2_52:
    set user_data_start, %o7
	.word 0x93902006  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_53:
	setx 0xc3b6b0b0673cc822, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_2_54:
	.word 0x819820c4  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c4, %hpstate
	.word 0xa5684005  ! 116: SDIVX_R	sdivx	%r1, %r5, %r18
splash_htba_2_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c004a0  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_htba_2_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_2_57:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 120: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0x91d02035  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_2_58:
	.word 0x93a449d2  ! 1: FDIVd	fdivd	%f48, %f18, %f40
	.word 0x97537ccb	! Random illegal ?
	.word 0xa1a00540  ! 1: FSQRTd	fsqrt	
	.word 0x93a34821  ! 122: FADDs	fadds	%f13, %f1, %f9
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x93d02034  ! 124: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_2_59:
	setx 0x03471e3e920a0691, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cb3f9  ! 127: SDIVX_I	sdivx	%r18, 0xfffff3f9, %r12
tagged_2_61:
	taddcctv %r3, 0x126c, %r9
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_62) + 40, 16, 16)) -> intp(7,0,24)
intvec_2_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 130: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x9ba0016c  ! 132: FABSq	dis not found

intveclr_2_65:
	setx 0x5fb4f50d089cecc7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0xa9a009d1  ! 135: FDIVd	fdivd	%f0, %f48, %f20
cwp_2_66:
    set user_data_start, %o7
	.word 0x93902000  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa984c00c  ! 137: WR_SET_SOFTINT_R	wr	%r19, %r12, %set_softint
	.word 0xe0c004a0  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
splash_hpstate_2_67:
	.word 0x819822d5  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01964  ! 140: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x97414000  ! 142: RDPC	rd	%pc, %r11
	.word 0xe2900e80  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 144: RDPC	rd	%pc, %r16
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 145: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_72) + 40, 16, 16)) -> intp(7,0,30)
intvec_2_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021bc  ! 147: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	.word 0x93a009d4  ! 148: FDIVd	fdivd	%f0, %f20, %f40
	.word 0xd6c7e010  ! 149: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
change_to_randtl_2_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_73:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d903de2  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x1de2, %pstate
memptr_2_74:
	set 0x60540000, %r31
	.word 0x85806eff  ! 152: WRCCR_I	wr	%r1, 0x0eff, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_2_76:
	setx 0x7436ac86636cf11d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9950c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_2_77-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_77:
	.word 0x91914001  ! 159: WRPR_PIL_R	wrpr	%r5, %r1, %pil
	.word 0x8d9023d2  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x03d2, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab80ba0e  ! 162: WR_CLEAR_SOFTINT_I	wr	%r2, 0x1a0e, %clear_softint
splash_lsu_2_78:
	setx 0x611f3e82a9d78c99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_2_79:
	setx 0x7e9914f650374b3d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_2_81:
	.word 0x81982615  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
splash_htba_2_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_2_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a189c3  ! 170: FDIVd	fdivd	%f6, %f34, %f10
splash_lsu_2_84:
	setx 0xd91f0fde6225cfb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802083  ! 172: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x87802055  ! 173: WRASI_I	wr	%r0, 0x0055, %asi
DS_2_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01961  ! 175: FqTOd	dis not found

DS_2_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b4030c  ! 176: ALIGNADDRESS	alignaddr	%r16, %r12, %r18
splash_hpstate_2_88:
	.word 0x81982385  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0385, %hpstate
	.word 0x94da0012  ! 178: SMULcc_R	smulcc 	%r8, %r18, %r10
	.word 0x87802004  ! 179: WRASI_I	wr	%r0, 0x0004, %asi
splash_hpstate_2_89:
	.word 0x81982105  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0105, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_2_90:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 182: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd4cfe020  ! 183: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
splash_hpstate_2_91:
	.word 0x8198231c  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031c, %hpstate
debug_2_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_2_93:
	setx 0x58cc82a4e7fbf53e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xb342aaa4	! Random illegal ?
	.word 0x93a449c9  ! 1: FDIVd	fdivd	%f48, %f40, %f40
	.word 0x9ba1c832  ! 187: FADDs	fadds	%f7, %f18, %f13
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
	.word 0x99414000  ! 188: RDPC	rd	%pc, %r12
	.word 0xe88fe000  ! 189: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
splash_lsu_2_96:
	setx 0xf4038589e202cd13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a249e4  ! 191: FDIVq	dis not found

cwp_2_97:
    set user_data_start, %o7
	.word 0x93902003  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_decr_2_98:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa781c013  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r19, %-
	.word 0x8790231e  ! 194: WRPR_TT_I	wrpr	%r0, 0x031e, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01974  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_100) + 0, 16, 16)) -> intp(5,0,18)
intvec_2_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01963  ! 197: FqTOd	dis not found

intveclr_2_102:
	setx 0x388d828b820763a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d90c001  ! 199: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
memptr_2_104:
	set 0x60140000, %r31
	.word 0x85803b67  ! 200: WRCCR_I	wr	%r0, 0x1b67, %ccr
	.word 0x87802004  ! 201: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa9814010  ! 202: WR_SET_SOFTINT_R	wr	%r5, %r16, %set_softint
	.word 0x87802088  ! 203: WRASI_I	wr	%r0, 0x0088, %asi
DS_2_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e60  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r16
debug_2_106:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90313e  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x113e, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902002  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_2_109:
    set user_data_start, %o7
	.word 0x93902001  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
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
	.word 0xa1414000  ! 214: RDPC	rd	%pc, %r16
debug_2_111:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 215: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d3953  ! 216: SDIVX_I	sdivx	%r20, 0xfffff953, %r12
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_2_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 219: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_2_114:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_2_115:
	.word 0x819825dd  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dd, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_116) + 0, 16, 16)) -> intp(7,0,4)
intvec_2_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x93414000  ! 225: RDPC	rd	%pc, %r9
	.word 0x9953c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_2_118:
	set 0x60140000, %r31
	.word 0x85823025  ! 227: WRCCR_I	wr	%r8, 0x1025, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01974  ! 228: FqTOd	dis not found

	.word 0x99a2c9c8  ! 229: FDIVd	fdivd	%f42, %f8, %f12
	.word 0x87802004  ! 230: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_2_120:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_121:
	setx 0x6d10b78dfb73e13c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_2_123:
	.word 0x81982bcd  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcd, %hpstate
	.word 0x9193265b  ! 236: WRPR_PIL_I	wrpr	%r12, 0x065b, %pil
change_to_randtl_2_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_124:
	.word 0x8f902000  ! 237: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_125:
	setx 0x8ed2ebc42486c88a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 239: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 240: RDPC	rd	%pc, %r19
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_2_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_127:
	.word 0x8f902001  ! 242: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99a349d3  ! 243: FDIVd	fdivd	%f44, %f50, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cfc54  ! 244: SDIVX_I	sdivx	%r19, 0xfffffc54, %r8
	.word 0xe28008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
cwp_2_129:
    set user_data_start, %o7
	.word 0x93902001  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d020b2  ! 247: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x87802004  ! 249: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_2_130:
	setx 0x94d1201966943f15, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_131:
	.word 0x8f902001  ! 251: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_132)+32, 16, 16)) -> intp(2,1,3)
xir_2_132:
	.word 0xa9846687  ! 253: WR_SET_SOFTINT_I	wr	%r17, 0x0687, %set_softint
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_133:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 254: RDPC	rd	%pc, %r13
DS_2_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f10, %f6
	.word 0xa1b44301  ! 255: ALIGNADDRESS	alignaddr	%r17, %r1, %r16
	setx 0xfa8fd71dd55e982b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902118  ! 257: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
splash_tba_2_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b50c000  ! 259: RDPR_TT	rdpr	%tt, %r13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d902ab4  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x0ab4, %pstate
DS_2_138:
	.word 0x93a489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f40
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_2_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
tagged_2_141:
	taddcctv %r23, 0x1494, %r15
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0xa9a00172  ! 267: FABSq	dis not found

	.word 0x879022ec  ! 268: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
change_to_randtl_2_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_142:
	.word 0x8f902001  ! 269: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x95a149c7  ! 270: FDIVd	fdivd	%f36, %f38, %f10
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x91450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_tba_2_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879020a9  ! 274: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
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
	.word 0x91414000  ! 275: RDPC	rd	%pc, %r8
splash_decr_2_145:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7818009  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r9, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_2_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_147:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 280: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_tba_2_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8790200c  ! 282: WRPR_TT_I	wrpr	%r0, 0x000c, %tt
splash_tba_2_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_150:
	setx 0xc2f9aae2bec8ff6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_2_151:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4800c80  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	rd %pc, %r19
	add %r19, (ivw_2_152-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_152:
	.word 0x91910012  ! 288: WRPR_PIL_R	wrpr	%r4, %r18, %pil
splash_cmpr_2_153:
	setx 0xca24f8faf65d2ff9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_154:
	setx 0xfe31cce42d4fa359, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_2_155:
	set 0x60540000, %r31
	.word 0x858460ac  ! 292: WRCCR_I	wr	%r17, 0x00ac, %ccr
mondo_2_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 293: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_157:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 294: RDPC	rd	%pc, %r18
DS_2_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_2_159:
	setx 0x3a311186e5159a79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b2  ! 299: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_htba_2_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_2_161:
	.word 0x8198249e  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049e, %hpstate
	.word 0x8d9023e5  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x03e5, %pstate
splash_tba_2_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x9956f5015d61f5f7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_164:
    set user_data_start, %o7
	.word 0x93902004  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_2_165:
	setx 0x5b33c0b1a15b1f26, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_2_167:
	.word 0x81982cd7  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 311: FqTOd	dis not found

mondo_2_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_cmpr_2_170:
	setx 0x31b1634b427de419, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_171:
	.word 0x8f902000  ! 314: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_2_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 316: RDPC	rd	%pc, %r19
splash_hpstate_2_174:
	.word 0x819820be  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00be, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x82e62d2f50c4b8c1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_176:
    set user_data_start, %o7
	.word 0x93902003  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_hpstate_2_177:
	.word 0x8198291d  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091d, %hpstate
mondo_2_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d924007  ! 322: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x91a509cb  ! 324: FDIVd	fdivd	%f20, %f42, %f8
	.word 0x8790230e  ! 325: WRPR_TT_I	wrpr	%r0, 0x030e, %tt
debug_2_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95a0056b  ! 327: FSQRTq	fsqrt	
intveclr_2_180:
	setx 0x810c245334b6b882, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 329: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xd2c804a0  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
cwp_2_182:
    set user_data_start, %o7
	.word 0x93902007  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_2_183:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 332: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
cwp_2_184:
    set user_data_start, %o7
	.word 0x93902001  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902113  ! 335: WRPR_TT_I	wrpr	%r0, 0x0113, %tt
splash_cmpr_2_185:
	setx 0xff28f18bddc0b9bc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 337: WRASI_I	wr	%r0, 0x0004, %asi
tagged_2_186:
	tsubcctv %r25, 0x1ad7, %r5
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_2_187:
    set user_data_start, %o7
	.word 0x93902007  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_2_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_188:
	.word 0x8f902002  ! 342: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd297e000  ! 343: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
intveclr_2_189:
	setx 0xc8fcc01816328e6e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_2_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_2_192:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 347: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_2_193:
	taddcctv %r22, 0x1c8c, %r2
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_2_194:
	tsubcctv %r23, 0x1a39, %r24
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_2_195:
	taddcctv %r2, 0x18b6, %r20
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x97a00170  ! 352: FABSq	dis not found

	.word 0x919268dc  ! 353: WRPR_PIL_I	wrpr	%r9, 0x08dc, %pil
	.word 0x9f802ee6  ! 354: SIR	sir	0x0ee6
intveclr_2_196:
	setx 0x879b58cf783425d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a0056b  ! 356: FSQRTq	fsqrt	
	.word 0xe0800b80  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r16
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x87902309  ! 360: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
	.word 0x8790234a  ! 361: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
debug_2_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x919475b9  ! 364: WRPR_PIL_I	wrpr	%r17, 0x15b9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_198) + 0, 16, 16)) -> intp(1,0,29)
intvec_2_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_2_200-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_200:
	.word 0x9190c000  ! 367: WRPR_PIL_R	wrpr	%r3, %r0, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01966  ! 368: FqTOd	dis not found

splash_cmpr_2_202:
	setx 0xd7fb06944585d47c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_2_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_204-donret_2_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d902e10  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ca03c  ! 373: SDIVX_I	sdivx	%r18, 0x003c, %r9
	.word 0xd6d7e010  ! 374: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x87902239  ! 375: WRPR_TT_I	wrpr	%r0, 0x0239, %tt
	.word 0xd69004a0  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_2_206:
	set 0x60740000, %r31
	.word 0x85836d1b  ! 378: WRCCR_I	wr	%r13, 0x0d1b, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_2_207:
	.word 0x95a289d4  ! 1: FDIVd	fdivd	%f10, %f20, %f10
	allclean
	.word 0x9bb4430b  ! 380: ALIGNADDRESS	alignaddr	%r17, %r11, %r13
splash_hpstate_2_208:
	.word 0x81982357  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
intveclr_2_209:
	setx 0x291c2a8afe0fd49b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_210:
	set user_data_start, %r31
	.word 0x8584fa8b  ! 383: WRCCR_I	wr	%r19, 0x1a8b, %ccr
	.word 0xab820005  ! 384: WR_CLEAR_SOFTINT_R	wr	%r8, %r5, %clear_softint
splash_cmpr_2_211:
	setx 0xe7a2bed0de61696e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c804a0  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0xa5a449c3  ! 387: FDIVd	fdivd	%f48, %f34, %f18
	.word 0x91d02034  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_htba_2_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_2_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_213:
	.word 0x8f902003  ! 390: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d020b2  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_2_214:
	setx 0x8d58c717bf5b80f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x623fa28171705816, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_216:
	setx 0x06d138d249a9ebce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 395: FqTOd	dis not found

	.word 0xd097e010  ! 396: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0xd0900e80  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x74, %r8
debug_2_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_2_219:
	.word 0x81982154  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0154, %hpstate
DS_2_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f26, %f0
	.word 0x9bb18305  ! 400: ALIGNADDRESS	alignaddr	%r6, %r5, %r13
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x9bb20fe6  ! 1: FONES	e	%f13
splash_lsu_1_0:
	setx 0x24780d43f0c0e6dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802010  ! 4: WRASI_I	wr	%r0, 0x0010, %asi
debug_1_1:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_1_3:
	taddcctv %r14, 0x1127, %r12
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_1_4:
	setx 0xbea8b2362157f844, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 9: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe8800b40  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r20
	.word 0xe8800ae0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
DS_1_5:
	.word 0xa9a489c0  ! 1: FDIVd	fdivd	%f18, %f0, %f20
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 15: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9ba00171  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_1_6:
	.word 0x8198260d  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
	.word 0xd4c804a0  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01972  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e030  ! 22: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
change_to_randtl_1_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_8:
	.word 0x8f902002  ! 23: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_1_9:
	set user_data_start, %r31
	.word 0x8584eed4  ! 24: WRCCR_I	wr	%r19, 0x0ed4, %ccr
mondo_1_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c010  ! 25: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	.word 0x879020f0  ! 26: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x91a01a68  ! 28: FqTOi	fqtoi	
change_to_randtl_1_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_11:
	.word 0x8f902002  ! 29: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c208f  ! 30: SDIVX_I	sdivx	%r16, 0x008f, %r12
	.word 0xd6880e80  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802089  ! 36: WRASI_I	wr	%r0, 0x0089, %asi
tagged_1_14:
	tsubcctv %r5, 0x10a5, %r13
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_1_15:
	set user_data_start, %r31
	.word 0x85802fd3  ! 38: WRCCR_I	wr	%r0, 0x0fd3, %ccr
tagged_1_16:
	tsubcctv %r8, 0x17f4, %r8
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x87902303  ! 40: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
mondo_1_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d928009  ! 41: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
donret_1_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_18-donret_1_18), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe020  ! 43: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
tagged_1_19:
	taddcctv %r16, 0x179d, %r26
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x95414000  ! 45: RDPC	rd	%pc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_21)+8, 16, 16)) -> intp(1,1,3)
xir_1_21:
	.word 0xa98160bb  ! 46: WR_SET_SOFTINT_I	wr	%r5, 0x00bb, %set_softint
mondo_1_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d92c001  ! 47: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
donret_1_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_23-donret_1_23-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x93480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_25:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 52: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_26) + 56, 16, 16)) -> intp(5,0,29)
intvec_1_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_1_27:
	setx 0xc7414b88e2e9349a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_1_28:
	nop
	setx 0xfffff6d4fffffd99, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_1_29:
	setx 0xf5564f90b85427c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_30:
	set user_data_start, %r31
	.word 0x8580763a  ! 61: WRCCR_I	wr	%r1, 0x163a, %ccr
debug_1_31:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 63: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x93d02032  ! 67: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 69: FqTOd	dis not found

	.word 0xd2800b60  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
splash_cmpr_1_33:
	setx 0x51ea18f62105629b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_34:
	setx 0x39744c396690b0f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_35:
	setx 0xbb23fd6106c0fbd3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_36:
	setx 0x46314770e2926147, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa982c006  ! 76: WR_SET_SOFTINT_R	wr	%r11, %r6, %set_softint
intveclr_1_37:
	setx 0xfc735a43d5fe2d1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_38:
	setx 0x5e8a62a55124472d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_1_39:
	.word 0x95a0c9d2  ! 1: FDIVd	fdivd	%f34, %f18, %f10
	.word 0x99a4c9c2  ! 1: FDIVd	fdivd	%f50, %f2, %f12
	.word 0xa9a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa1a4c824  ! 80: FADDs	fadds	%f19, %f4, %f16
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802004  ! 82: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_40) + 24, 16, 16)) -> intp(4,0,9)
intvec_1_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8790235c  ! 85: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
	setx 0x3346ae6ecffe1d3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00174  ! 87: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_1_42-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_42:
	.word 0x91934011  ! 88: WRPR_PIL_R	wrpr	%r13, %r17, %pil
	.word 0x87802020  ! 89: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa190200e  ! 90: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_cmpr_1_43:
	setx 0xfa9fc33de738f752, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969ec7c  ! 93: SDIVX_I	sdivx	%r7, 0x0c7c, %r20
debug_1_45:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 94: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x8d902762  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0762, %pstate
	.word 0x9350c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0x95450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0x8d802000  ! 99: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_1_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_1_48:
	set user_data_start, %r31
	.word 0x8582fa2a  ! 103: WRCCR_I	wr	%r11, 0x1a2a, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_1_50:
	setx 0x1235e6bdcf8623c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902175  ! 107: WRPR_TT_I	wrpr	%r0, 0x0175, %tt
	.word 0xa1a24dc3  ! 108: FdMULq	fdmulq	
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196c  ! 109: FqTOd	dis not found

cwp_1_52:
    set user_data_start, %o7
	.word 0x93902004  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 112: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_53:
	setx 0x4b99aaf20340c787, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_1_54:
	.word 0x8198286c  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x086c, %hpstate
	.word 0xa16d000b  ! 116: SDIVX_R	sdivx	%r20, %r11, %r16
splash_htba_1_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c00e60  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
splash_htba_1_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_1_57:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 120: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0x91d02034  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_1_58:
	.word 0x97a309c5  ! 1: FDIVd	fdivd	%f12, %f36, %f42
	.word 0xeb799d44	! Random illegal ?
	.word 0xa5a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa9a1c820  ! 122: FADDs	fadds	%f7, %f0, %f20
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x83d020b4  ! 124: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_1_59:
	setx 0x83ba2b7626be98b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16877da  ! 127: SDIVX_I	sdivx	%r1, 0xfffff7da, %r16
tagged_1_61:
	taddcctv %r10, 0x1d1b, %r24
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_62) + 56, 16, 16)) -> intp(4,0,4)
intvec_1_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01963  ! 130: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x97a00163  ! 132: FABSq	dis not found

intveclr_1_65:
	setx 0x299402b8c9ff2467, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0x9ba409cd  ! 135: FDIVd	fdivd	%f16, %f44, %f44
cwp_1_66:
    set user_data_start, %o7
	.word 0x93902000  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa9818013  ! 137: WR_SET_SOFTINT_R	wr	%r6, %r19, %set_softint
	.word 0xe0c00e60  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
splash_hpstate_1_67:
	.word 0x81982b54  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b54, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01960  ! 140: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0x91414000  ! 142: RDPC	rd	%pc, %r8
	.word 0xe29004a0  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_71:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 144: RDPC	rd	%pc, %r8
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_72) + 40, 16, 16)) -> intp(4,0,15)
intvec_1_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021c0  ! 147: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
	.word 0x95a289d3  ! 148: FDIVd	fdivd	%f10, %f50, %f10
	.word 0xd6c7e000  ! 149: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
change_to_randtl_1_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_73:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d902e0f  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
memptr_1_74:
	set 0x60740000, %r31
	.word 0x8581b8e6  ! 152: WRCCR_I	wr	%r6, 0x18e6, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_1_76:
	setx 0xa30f15801bbd1394, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9150c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d804a0  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	rd %pc, %r19
	add %r19, (ivw_1_77-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_77:
	.word 0x91904013  ! 159: WRPR_PIL_R	wrpr	%r1, %r19, %pil
	.word 0x8d9028eb  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x08eb, %pstate
	.word 0xd88804a0  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xab8175b7  ! 162: WR_CLEAR_SOFTINT_I	wr	%r5, 0x15b7, %clear_softint
splash_lsu_1_78:
	setx 0x86b11bbbcfb878a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_1_79:
	setx 0xb138462c71c9a4fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_1_81:
	.word 0x819827a7  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07a7, %hpstate
splash_htba_1_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_1_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7a449c9  ! 170: FDIVd	fdivd	%f48, %f40, %f50
splash_lsu_1_84:
	setx 0xfdfb96e829bd6ecb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 172: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8780201c  ! 173: WRASI_I	wr	%r0, 0x001c, %asi
DS_1_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 175: FqTOd	dis not found

DS_1_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa7b2430d  ! 176: ALIGNADDRESS	alignaddr	%r9, %r13, %r19
splash_hpstate_1_88:
	.word 0x81982bdf  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
	.word 0x92dc0010  ! 178: SMULcc_R	smulcc 	%r16, %r16, %r9
	.word 0x87802016  ! 179: WRASI_I	wr	%r0, 0x0016, %asi
splash_hpstate_1_89:
	.word 0x81982d97  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
debug_1_90:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 182: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0xd4cfe020  ! 183: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
splash_hpstate_1_91:
	.word 0x81982ecd  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
debug_1_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_1_93:
	setx 0xa75d51ee14755e53, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xef5450a6	! Random illegal ?
	.word 0x9ba149c6  ! 1: FDIVd	fdivd	%f36, %f6, %f44
	.word 0x99a14827  ! 187: FADDs	fadds	%f5, %f7, %f12
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
	.word 0x9b414000  ! 188: RDPC	rd	%pc, %r13
	.word 0xe88fe010  ! 189: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
splash_lsu_1_96:
	setx 0x036eb0287e85dc7f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a489f1  ! 191: FDIVq	dis not found

cwp_1_97:
    set user_data_start, %o7
	.word 0x93902004  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa784c014  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
	.word 0x879023a1  ! 194: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_100) + 8, 16, 16)) -> intp(5,0,9)
intvec_1_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 197: FqTOd	dis not found

intveclr_1_102:
	setx 0x7657d4120f8df50e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d904009  ! 199: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
memptr_1_104:
	set 0x60340000, %r31
	.word 0x85807c85  ! 200: WRCCR_I	wr	%r1, 0x1c85, %ccr
	.word 0x8780208a  ! 201: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xa9804012  ! 202: WR_SET_SOFTINT_R	wr	%r1, %r18, %set_softint
	.word 0x8780208b  ! 203: WRASI_I	wr	%r0, 0x008b, %asi
DS_1_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e80  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r16
debug_1_106:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903e4d  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x1e4d, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902001  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_1_109:
    set user_data_start, %o7
	.word 0x93902004  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
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
	.word 0xa9414000  ! 214: RDPC	rd	%pc, %r20
debug_1_111:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 215: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769e67d  ! 216: SDIVX_I	sdivx	%r7, 0x067d, %r11
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_1_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 219: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_1_114:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd08008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_hpstate_1_115:
	.word 0x8198229d  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_116) + 24, 16, 16)) -> intp(4,0,16)
intvec_1_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xa7414000  ! 225: RDPC	rd	%pc, %r19
	.word 0xa553c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_1_118:
	set 0x60540000, %r31
	.word 0x8582bac1  ! 227: WRCCR_I	wr	%r10, 0x1ac1, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01960  ! 228: FqTOd	dis not found

	.word 0xa3a049d0  ! 229: FDIVd	fdivd	%f32, %f16, %f48
	.word 0x8780208a  ! 230: WRASI_I	wr	%r0, 0x008a, %asi
splash_tba_1_120:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_121:
	setx 0x53ea29719b71d9df, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_1_123:
	.word 0x81982395  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0395, %hpstate
	.word 0x9194242e  ! 236: WRPR_PIL_I	wrpr	%r16, 0x042e, %pil
change_to_randtl_1_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_124:
	.word 0x8f902001  ! 237: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_125:
	setx 0xd6b3947699a29909, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 239: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 240: RDPC	rd	%pc, %r19
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_1_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_127:
	.word 0x8f902001  ! 242: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x99a509d2  ! 243: FDIVd	fdivd	%f20, %f18, %f12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996d2ac8  ! 244: SDIVX_I	sdivx	%r20, 0x0ac8, %r12
	.word 0xe2800a60  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
cwp_1_129:
    set user_data_start, %o7
	.word 0x93902000  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d020b4  ! 247: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x87802089  ! 249: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_1_130:
	setx 0x88db057c280c9eab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_131:
	.word 0x8f902002  ! 251: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_132)+48, 16, 16)) -> intp(1,1,3)
xir_1_132:
	.word 0xa980a0d8  ! 253: WR_SET_SOFTINT_I	wr	%r2, 0x00d8, %set_softint
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_133:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 254: RDPC	rd	%pc, %r10
DS_1_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f26, %f12
	.word 0x99b18312  ! 255: ALIGNADDRESS	alignaddr	%r6, %r18, %r12
	setx 0x60e1eb55e139eb28, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790211a  ! 257: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
splash_tba_1_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b50c000  ! 259: RDPR_TT	rdpr	%tt, %r13
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d9029cb  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x09cb, %pstate
DS_1_138:
	.word 0xa1a409c8  ! 1: FDIVd	fdivd	%f16, %f8, %f16
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_1_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_1_141:
	taddcctv %r2, 0x1d80, %r8
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0xa7a00170  ! 267: FABSq	dis not found

	.word 0x87902229  ! 268: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
change_to_randtl_1_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_142:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x99a2c9c4  ! 270: FDIVd	fdivd	%f42, %f4, %f12
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x99450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r12
splash_tba_1_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879023e6  ! 274: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
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
	.word 0xa3414000  ! 275: RDPC	rd	%pc, %r17
	.word 0xa7848000  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r0, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_1_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_147:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 280: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_tba_1_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x879020a3  ! 282: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
splash_tba_1_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_150:
	setx 0xce59b104e707dd65, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_1_151:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_1_152-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_152:
	.word 0x91924011  ! 288: WRPR_PIL_R	wrpr	%r9, %r17, %pil
splash_cmpr_1_153:
	setx 0x9b5634f5f9b749a2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_154:
	setx 0x27b148038c446456, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 291: WRFPRS_I	wr	%r0, 0x0004, %fprs
memptr_1_155:
	set 0x60340000, %r31
	.word 0x8581b56e  ! 292: WRCCR_I	wr	%r6, 0x156e, %ccr
mondo_1_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 293: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_157:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 294: RDPC	rd	%pc, %r8
DS_1_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_1_159:
	setx 0x2f2fd39afe6829e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 299: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_htba_1_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_1_161:
	.word 0x81982356  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
	.word 0x8d902de0  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0de0, %pstate
splash_tba_1_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xe35f8c5bfd62d19c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_164:
    set user_data_start, %o7
	.word 0x93902006  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_1_165:
	setx 0x41a4f7aa75dbcfbe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_1_167:
	.word 0x81982b47  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b47, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196a  ! 311: FqTOd	dis not found

mondo_1_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d95000d  ! 312: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
splash_cmpr_1_170:
	setx 0x54a489167bcc3fa2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_171:
	.word 0x8f902003  ! 314: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_1_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 316: RDPC	rd	%pc, %r16
splash_hpstate_1_174:
	.word 0x81982d9d  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x8e8c3fee38733ae8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_176:
    set user_data_start, %o7
	.word 0x93902002  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_1_177:
	.word 0x819824fe  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04fe, %hpstate
mondo_1_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948008  ! 322: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1a489c2  ! 324: FDIVd	fdivd	%f18, %f2, %f16
	.word 0x879021b8  ! 325: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
debug_1_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97a0056b  ! 327: FSQRTq	fsqrt	
intveclr_1_180:
	setx 0xd279af1378eac827, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 329: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0xd2c804a0  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
cwp_1_182:
    set user_data_start, %o7
	.word 0x93902004  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_1_183:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 332: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
cwp_1_184:
    set user_data_start, %o7
	.word 0x93902001  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879021dd  ! 335: WRPR_TT_I	wrpr	%r0, 0x01dd, %tt
splash_cmpr_1_185:
	setx 0x56c8534c2fc0b2ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802055  ! 337: WRASI_I	wr	%r0, 0x0055, %asi
tagged_1_186:
	tsubcctv %r12, 0x120b, %r18
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_1_187:
    set user_data_start, %o7
	.word 0x93902007  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_1_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_188:
	.word 0x8f902002  ! 342: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd297e020  ! 343: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
intveclr_1_189:
	setx 0x3d40f57e03de9c83, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_1_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_1_192:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 347: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_1_193:
	taddcctv %r3, 0x170f, %r20
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_1_194:
	tsubcctv %r3, 0x1544, %r3
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_1_195:
	taddcctv %r21, 0x19a7, %r26
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x97a00166  ! 352: FABSq	dis not found

	.word 0x9191afa2  ! 353: WRPR_PIL_I	wrpr	%r6, 0x0fa2, %pil
	.word 0x9f802930  ! 354: SIR	sir	0x0930
intveclr_1_196:
	setx 0x5cd3657168bb9e38, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a00563  ! 356: FSQRTq	fsqrt	
	.word 0xe0800ac0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x87902096  ! 360: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
	.word 0x8790228e  ! 361: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
debug_1_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x919537d1  ! 364: WRPR_PIL_I	wrpr	%r20, 0x17d1, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_198) + 8, 16, 16)) -> intp(3,0,11)
intvec_1_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_1_200-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_200:
	.word 0x91904013  ! 367: WRPR_PIL_R	wrpr	%r1, %r19, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01963  ! 368: FqTOd	dis not found

splash_cmpr_1_202:
	setx 0x61fce47eebe78149, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_1_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_204-donret_1_204), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d902658  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0658, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769a867  ! 373: SDIVX_I	sdivx	%r6, 0x0867, %r19
	.word 0xd6d7e010  ! 374: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x8790225f  ! 375: WRPR_TT_I	wrpr	%r0, 0x025f, %tt
	.word 0xd6900e80  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0xd68008a0  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
memptr_1_206:
	set 0x60140000, %r31
	.word 0x85852755  ! 378: WRCCR_I	wr	%r20, 0x0755, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_1_207:
	.word 0x99a509c0  ! 1: FDIVd	fdivd	%f20, %f0, %f12
	allclean
	.word 0x91b04308  ! 380: ALIGNADDRESS	alignaddr	%r1, %r8, %r8
splash_hpstate_1_208:
	.word 0x81982547  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0547, %hpstate
intveclr_1_209:
	setx 0x43fcd5cec890d66e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_210:
	set user_data_start, %r31
	.word 0x8581ec5b  ! 383: WRCCR_I	wr	%r7, 0x0c5b, %ccr
	.word 0xab850004  ! 384: WR_CLEAR_SOFTINT_R	wr	%r20, %r4, %clear_softint
splash_cmpr_1_211:
	setx 0xbcf6cfbc6e8cef6e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c80e80  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r16
	.word 0xa5a089cc  ! 387: FDIVd	fdivd	%f2, %f12, %f18
	.word 0x91d02033  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_1_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_1_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_213:
	.word 0x8f902003  ! 390: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02034  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_1_214:
	setx 0xdfd320d0e62e9f61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x153ff87c123ddfe0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_216:
	setx 0x931ca4679142cd47, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196c  ! 395: FqTOd	dis not found

	.word 0xd097e020  ! 396: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_1_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_1_219:
	.word 0x819826e4  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06e4, %hpstate
DS_1_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f20, %f6
	.word 0x93b40313  ! 400: ALIGNADDRESS	alignaddr	%r16, %r19, %r9
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xa9b1cff1  ! 1: FONES	e	%f20
splash_lsu_0_0:
	setx 0x39533b7bf0cd7d17, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802016  ! 4: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_1:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 5: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_3:
	taddcctv %r10, 0x1eb2, %r2
	.word 0xe807f373  ! 7: LDUW_I	lduw	[%r31 + 0xfffff373], %r20
splash_cmpr_0_4:
	setx 0x253d91c752a44932, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 8: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b2  ! 9: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xe88008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_0_5:
	.word 0x99a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f12
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85ff373  ! 13: LDX_I	ldx	[%r31 + 0xfffff373], %r12
	.word 0x8d802004  ! 14: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02032  ! 15: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x95a00174  ! 16: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 17: LDX_R	ldx	[%r31 + %r0], %r10
splash_hpstate_0_6:
	.word 0x81982a27  ! 18: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a27, %hpstate
	.word 0xd4c804a0  ! 19: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01974  ! 20: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 21: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e030  ! 22: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
change_to_randtl_0_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_8:
	.word 0x8f902001  ! 23: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_0_9:
	set user_data_start, %r31
	.word 0x85803185  ! 24: WRCCR_I	wr	%r0, 0x1185, %ccr
mondo_0_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d920001  ! 25: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
	.word 0x87902285  ! 26: WRPR_TT_I	wrpr	%r0, 0x0285, %tt
	.word 0xd21ff185  ! 27: LDD_I	ldd	[%r31 + 0xfffff185], %r9
	.word 0x95a01a73  ! 28: FqTOi	fqtoi	
change_to_randtl_0_11:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_11:
	.word 0x8f902003  ! 29: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97692760  ! 30: SDIVX_I	sdivx	%r4, 0x0760, %r11
	.word 0xd68804a0  ! 31: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
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
	.word 0xd7e7e013  ! 32: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xd66fe760  ! 33: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0xd63fe760  ! 34: STD_I	std	%r11, [%r31 + 0x0760]
	.word 0xd66fe760  ! 35: LDSTUB_I	ldstub	%r11, [%r31 + 0x0760]
	.word 0x87802010  ! 36: WRASI_I	wr	%r0, 0x0010, %asi
tagged_0_14:
	tsubcctv %r24, 0x1b99, %r11
	.word 0xd607e760  ! 37: LDUW_I	lduw	[%r31 + 0x0760], %r11
memptr_0_15:
	set user_data_start, %r31
	.word 0x85842356  ! 38: WRCCR_I	wr	%r16, 0x0356, %ccr
tagged_0_16:
	tsubcctv %r7, 0x1c33, %r11
	.word 0xd607e356  ! 39: LDUW_I	lduw	[%r31 + 0x0356], %r11
	.word 0x87902179  ! 40: WRPR_TT_I	wrpr	%r0, 0x0179, %tt
mondo_0_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 41: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
donret_0_18:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_18-donret_0_18), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_18:
	.word 0xd6ffe356  ! 42: SWAPA_I	swapa	%r11, [%r31 + 0x0356] %asi
	.word 0xd6cfe000  ! 43: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
tagged_0_19:
	taddcctv %r20, 0x1199, %r9
	.word 0xd607e356  ! 44: LDUW_I	lduw	[%r31 + 0x0356], %r11
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
	.word 0x97414000  ! 45: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_21)+56, 16, 16)) -> intp(0,1,3)
xir_0_21:
	.word 0xa9826271  ! 46: WR_SET_SOFTINT_I	wr	%r9, 0x0271, %set_softint
mondo_0_22:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 47: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
donret_0_23:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_23-donret_0_23-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_23:
	.word 0xd6ffe271  ! 48: SWAPA_I	swapa	%r11, [%r31 + 0x0271] %asi
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
	.word 0xd7e7e006  ! 49: CASA_R	casa	[%r31] %asi, %r6, %r11
	.word 0xd647e271  ! 50: LDSW_I	ldsw	[%r31 + 0x0271], %r11
	.word 0x99480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_25:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 52: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_26) + 16, 16, 16)) -> intp(3,0,13)
intvec_0_26:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe657e271  ! 54: LDSH_I	ldsh	[%r31 + 0x0271], %r19
intveclr_0_27:
	setx 0xbb1a0011a168b700, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 55: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe737c000  ! 57: STQF_R	-	%f19, [%r0, %r31]
pmu_0_28:
	nop
	setx 0xfffffe0cfffff9e4, %g1, %g7
	.word 0xa3800007  ! 58: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68804a0  ! 59: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
intveclr_0_29:
	setx 0x01341f84420c76ca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 60: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_0_30:
	set user_data_start, %r31
	.word 0x8581f3b4  ! 61: WRCCR_I	wr	%r7, 0x13b4, %ccr
debug_0_31:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 62: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780208b  ! 63: WRASI_I	wr	%r0, 0x008b, %asi
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe69ff3b4  ! 65: LDDA_I	ldda	[%r31, + 0xfffff3b4] %asi, %r19
	.word 0xe69004a0  ! 66: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x91d020b3  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe68008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01974  ! 69: FqTOd	dis not found

	.word 0xd28008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_0_33:
	setx 0x141d8f0f3dbf1a03, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 71: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_34:
	setx 0x82db1a67793ef2a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 72: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_35:
	setx 0xae7821f7932dca0e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_36:
	setx 0xe074615cf0dddb08, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 74: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9828011  ! 76: WR_SET_SOFTINT_R	wr	%r10, %r17, %set_softint
intveclr_0_37:
	setx 0xc1b04ecb3c6fdf79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 77: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_38:
	setx 0x40e2533a8539d22f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 79: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_0_39:
	.word 0x99a489c9  ! 1: FDIVd	fdivd	%f18, %f40, %f12
	.word 0xa5a509c5  ! 1: FDIVd	fdivd	%f20, %f36, %f18
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0x95a08820  ! 80: FADDs	fadds	%f2, %f0, %f10
	.word 0xd41fc000  ! 81: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x87802004  ! 82: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_40) + 56, 16, 16)) -> intp(2,0,19)
intvec_0_40:
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 84: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x879020d1  ! 85: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	setx 0x60182e7c6764c887, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_41:
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00167  ! 87: FABSq	dis not found

cmp_0_42:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_42:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_42
    nop
cmp_wait0_42:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_42
    nop
    ba,a cmp_startwait0_42
continue_cmp_0_42:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 32, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91918008  ! 88: WRPR_PIL_R	wrpr	%r6, %r8, %pil
	.word 0x87802088  ! 89: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa190200c  ! 90: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_0_43:
	setx 0xd3919681c4714499, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 91: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e7c028  ! 92: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b2fd2  ! 93: SDIVX_I	sdivx	%r12, 0x0fd2, %r12
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
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 94: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x8d902228  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0228, %pstate
	.word 0x9350c000  ! 96: RDPR_TT	<illegal instruction>
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
	.word 0xd3e7e008  ! 97: CASA_R	casa	[%r31] %asi, %r8, %r9
	.word 0xa5450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0x8d802000  ! 99: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe48008a0  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x32800001  ! 101: BNE	bne,a	<label_0x1>
debug_0_47:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 102: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_0_48:
	set user_data_start, %r31
	.word 0x85836e19  ! 103: WRCCR_I	wr	%r13, 0x0e19, %ccr
	.word 0xe537c000  ! 104: STQF_R	-	%f18, [%r0, %r31]
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
	.word 0xe5e7e008  ! 105: CASA_R	casa	[%r31] %asi, %r8, %r18
intveclr_0_50:
	setx 0x9bc6083a3b037904, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021d5  ! 107: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0xa5a08dc7  ! 108: FdMULq	fdmulq	
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 109: FqTOd	dis not found

cwp_0_52:
    set user_data_start, %o7
	.word 0x93902003  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 111: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 112: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_53:
	setx 0x65e273d4fe93f289, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 113: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdad804a0  ! 114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_hpstate_0_54:
	.word 0x81982f55  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0x956a0001  ! 116: SDIVX_R	sdivx	%r8, %r1, %r10
splash_htba_0_55:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 117: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd4c004a0  ! 118: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_htba_0_56:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 119: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_0_57:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_57:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_57
    nop
debug_wait0_57:
    ld [%r23], %r16
    brnz %r16, debug_wait0_57
    nop
    ba,a debug_startwait0_57
continue_debug_0_57:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_57:
    cmp %r13, %r15
    bne,a wait_for_stat_0_57
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_57:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_57
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 120: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x91d02034  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_0_58:
	.word 0x9ba209c6  ! 1: FDIVd	fdivd	%f8, %f6, %f44
	.word 0xbd6d4238	! Random illegal ?
	.word 0x95a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x9ba18830  ! 122: FADDs	fadds	%f6, %f16, %f13
	.word 0x24800001  ! 123: BLE	ble,a	<label_0x1>
	.word 0x91d020b3  ! 124: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xda0fee19  ! 125: LDUB_I	ldub	[%r31 + 0x0e19], %r13
splash_lsu_0_59:
	setx 0xbc978913c9c99e1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976d2c1e  ! 127: SDIVX_I	sdivx	%r20, 0x0c1e, %r11
tagged_0_61:
	taddcctv %r12, 0x18ea, %r9
	.word 0xd607ec1e  ! 128: LDUW_I	lduw	[%r31 + 0x0c1e], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_62) + 16, 16, 16)) -> intp(5,0,17)
intvec_0_62:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01972  ! 130: FqTOd	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_64:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 131: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xa5a00162  ! 132: FABSq	dis not found

intveclr_0_65:
	setx 0xd18758f87f3ad42c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3520000  ! 134: RDPR_PIL	<illegal instruction>
	.word 0xa1a149d0  ! 135: FDIVd	fdivd	%f36, %f16, %f16
cwp_0_66:
    set user_data_start, %o7
	.word 0x93902001  ! 136: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa9848014  ! 137: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
	.word 0xe0c00e40  ! 138: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r16
splash_hpstate_0_67:
	.word 0x81982ad7  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad7, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01963  ! 140: FqTOd	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_69
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_69:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 141: CASA_R	casa	[%r31] %asi, %r3, %r19
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
	.word 0xa3414000  ! 142: RDPC	rd	%pc, %r17
	.word 0xe29004a0  ! 143: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 144: RDPC	rd	%pc, %r20
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 145: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_72) + 24, 16, 16)) -> intp(1,0,17)
intvec_0_72:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021f1  ! 147: WRPR_TT_I	wrpr	%r0, 0x01f1, %tt
	.word 0x97a109d3  ! 148: FDIVd	fdivd	%f4, %f50, %f42
	.word 0xd6c7e020  ! 149: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
change_to_randtl_0_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_73:
	.word 0x8f902003  ! 150: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d902321  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x0321, %pstate
memptr_0_74:
	set 0x60540000, %r31
	.word 0x858326f2  ! 152: WRCCR_I	wr	%r12, 0x06f2, %ccr
	.word 0xd727e6f2  ! 153: STF_I	st	%f11, [0x06f2, %r31]
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 154: CASA_R	casa	[%r31] %asi, %r19, %r11
splash_cmpr_0_76:
	setx 0x44be9fba0f7280cd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9950c000  ! 156: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 157: BPVC	<illegal instruction>
	.word 0xd8d80e80  ! 158: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
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
    and %r14, 0xe6, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91920009  ! 159: WRPR_PIL_R	wrpr	%r8, %r9, %pil
	.word 0x8d903319  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x1319, %pstate
	.word 0xd8880e60  ! 161: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
	.word 0xab832cf5  ! 162: WR_CLEAR_SOFTINT_I	wr	%r12, 0x0cf5, %clear_softint
splash_lsu_0_78:
	setx 0x8913d3a5825d7ff1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 163: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd80fecf5  ! 164: LDUB_I	ldub	[%r31 + 0x0cf5], %r12
splash_cmpr_0_79:
	setx 0xc36862756f68acb4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 165: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_80:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_0_81:
	.word 0x81982636  ! 167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0636, %hpstate
splash_htba_0_82:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 168: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_tba_0_83:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 169: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba4c9cb  ! 170: FDIVd	fdivd	%f50, %f42, %f44
splash_lsu_0_84:
	setx 0x375ba5b9b1cde003, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 172: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802004  ! 173: WRASI_I	wr	%r0, 0x0004, %asi
DS_0_85:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01967  ! 175: FqTOd	dis not found

DS_0_87:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb04314  ! 176: ALIGNADDRESS	alignaddr	%r1, %r20, %r13
splash_hpstate_0_88:
	.word 0x819821c5  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
	.word 0x94dc8011  ! 178: SMULcc_R	smulcc 	%r18, %r17, %r10
	.word 0x87802010  ! 179: WRASI_I	wr	%r0, 0x0010, %asi
splash_hpstate_0_89:
	.word 0x8198271c  ! 180: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0xd44fecf5  ! 181: LDSB_I	ldsb	[%r31 + 0x0cf5], %r10
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
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 182: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xd4cfe020  ! 183: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
splash_hpstate_0_91:
	.word 0x81982806  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0806, %hpstate
debug_0_92:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 185: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_93:
	setx 0x1c079e3c27eb837f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 186: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xf7633ea2	! Random illegal ?
	.word 0x99a489c9  ! 1: FDIVd	fdivd	%f18, %f40, %f12
	.word 0x91a48827  ! 187: FADDs	fadds	%f18, %f7, %f8
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
	.word 0xa9414000  ! 188: RDPC	rd	%pc, %r20
	.word 0xe88fe000  ! 189: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
splash_lsu_0_96:
	setx 0x1be320529e1c7ff9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97a189e4  ! 191: FDIVq	dis not found

cwp_0_97:
    set user_data_start, %o7
	.word 0x93902007  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7834010  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r16, %-
	.word 0x87902174  ! 194: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01970  ! 195: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_100) + 32, 16, 16)) -> intp(4,0,11)
intvec_0_100:
	.word 0x39400001  ! 196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01961  ! 197: FqTOd	dis not found

intveclr_0_102:
	setx 0x8ba225b15d4edf75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d930006  ! 199: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
memptr_0_104:
	set 0x60740000, %r31
	.word 0x85826617  ! 200: WRCCR_I	wr	%r9, 0x0617, %ccr
	.word 0x87802080  ! 201: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa9850006  ! 202: WR_SET_SOFTINT_R	wr	%r20, %r6, %set_softint
	.word 0x87802014  ! 203: WRASI_I	wr	%r0, 0x0014, %asi
DS_0_105:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 204: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 205: BL	bl,a	<label_0x1>
	.word 0xe0d00e60  ! 206: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r16
debug_0_106:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 207: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_107:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90328e  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x128e, %pstate
	.word 0x2c700001  ! 210: BPNEG	<illegal instruction>
	.word 0x99902000  ! 211: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
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
	.word 0xe1e7e006  ! 212: CASA_R	casa	[%r31] %asi, %r6, %r16
cwp_0_109:
    set user_data_start, %o7
	.word 0x93902001  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
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
	.word 0x93414000  ! 214: RDPC	rd	%pc, %r9
debug_0_111:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_111:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_111
    nop
debug_wait0_111:
    ld [%r23], %r16
    brnz %r16, debug_wait0_111
    nop
    ba,a debug_startwait0_111
continue_debug_0_111:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_111:
    cmp %r13, %r15
    bne,a wait_for_stat_0_111
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_111:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_111
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 215: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956864ca  ! 216: SDIVX_I	sdivx	%r1, 0x04ca, %r10
	.word 0xa1902001  ! 217: WRPR_GL_I	wrpr	%r0, 0x0001, %-
debug_0_113:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 218: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_114:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 220: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91450000  ! 221: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd0800b20  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r8
splash_hpstate_0_115:
	.word 0x81982d8f  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8f, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_116) + 40, 16, 16)) -> intp(5,0,2)
intvec_0_116:
	.word 0x39400001  ! 224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x91414000  ! 225: RDPC	rd	%pc, %r8
	.word 0xa553c000  ! 226: RDPR_FQ	<illegal instruction>
memptr_0_118:
	set 0x60540000, %r31
	.word 0x8583219a  ! 227: WRCCR_I	wr	%r12, 0x019a, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01974  ! 228: FqTOd	dis not found

	.word 0x97a109d4  ! 229: FDIVd	fdivd	%f4, %f20, %f42
	.word 0x87802016  ! 230: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_0_120:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 231: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_0_121:
	setx 0xe1c43b6f7d5a2a88, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 232: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xd7e7e014  ! 233: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xd737e19a  ! 234: STQF_I	-	%f11, [0x019a, %r31]
splash_hpstate_0_123:
	.word 0x819825c5  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c5, %hpstate
	.word 0x9190b699  ! 236: WRPR_PIL_I	wrpr	%r2, 0x1699, %pil
change_to_randtl_0_124:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_124:
	.word 0x8f902002  ! 237: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_0_125:
	setx 0x958ec1a4db960d7d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 238: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 239: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_126
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_126:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 240: RDPC	rd	%pc, %r20
	.word 0xe91fc000  ! 241: LDDF_R	ldd	[%r31, %r0], %f20
change_to_randtl_0_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_127:
	.word 0x8f902003  ! 242: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa9a109c8  ! 243: FDIVd	fdivd	%f4, %f8, %f20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36a3911  ! 244: SDIVX_I	sdivx	%r8, 0xfffff911, %r17
	.word 0xe28008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
cwp_0_129:
    set user_data_start, %o7
	.word 0x93902000  ! 246: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02032  ! 247: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x30700001  ! 248: BPA	<illegal instruction>
	.word 0x87802055  ! 249: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_130:
	setx 0x09a55182aa0f3081, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 250: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_131:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_131:
	.word 0x8f902002  ! 251: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe31fc000  ! 252: LDDF_R	ldd	[%r31, %r0], %f17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_132)+56, 16, 16)) -> intp(0,1,3)
xir_0_132:
	.word 0xa983218a  ! 253: WR_SET_SOFTINT_I	wr	%r12, 0x018a, %set_softint
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 254: RDPC	rd	%pc, %r20
DS_0_134:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f28, %f18
	.word 0x99b04301  ! 255: ALIGNADDRESS	alignaddr	%r1, %r1, %r12
	setx 0x2e1d6df321f13aa0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_135:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020e3  ! 257: WRPR_TT_I	wrpr	%r0, 0x00e3, %tt
splash_tba_0_136:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 258: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9550c000  ! 259: RDPR_TT	rdpr	%tt, %r10
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e001  ! 260: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0x8d903386  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x1386, %pstate
DS_0_138:
	.word 0x95a149c6  ! 1: FDIVd	fdivd	%f36, %f6, %f10
	.word 0xbfefc000  ! 262: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_0_139:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 263: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_140:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 264: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
tagged_0_141:
	taddcctv %r22, 0x13ad, %r9
	.word 0xd407e18a  ! 265: LDUW_I	lduw	[%r31 + 0x018a], %r10
	.word 0xd46fe18a  ! 266: LDSTUB_I	ldstub	%r10, [%r31 + 0x018a]
	.word 0x95a00174  ! 267: FABSq	dis not found

	.word 0x8790212e  ! 268: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
change_to_randtl_0_142:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_142:
	.word 0x8f902002  ! 269: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91a4c9c7  ! 270: FDIVd	fdivd	%f50, %f38, %f8
	.word 0xd02fe18a  ! 271: STB_I	stb	%r8, [%r31 + 0x018a]
	.word 0x91450000  ! 272: RD_SET_SOFTINT	rd	%set_softint, %r8
splash_tba_0_143:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 273: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902025  ! 274: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
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
	.word 0xa5414000  ! 275: RDPC	rd	%pc, %r18
	.word 0xa7808013  ! 276: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r19, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
debug_0_146:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_147:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_147:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_147
    nop
debug_wait0_147:
    ld [%r23], %r16
    brnz %r16, debug_wait0_147
    nop
    ba,a debug_startwait0_147
continue_debug_0_147:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_147:
    cmp %r13, %r15
    bne,a wait_for_stat_0_147
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_147:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_147
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00492  ! 280: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_tba_0_148:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87902103  ! 282: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
splash_tba_0_149:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 283: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_0_150:
	setx 0xfdb83c7dc60d4795, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 285: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_151:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe48008a0  ! 287: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    and %r14, 0xa6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950013  ! 288: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_cmpr_0_153:
	setx 0xb0bfa49c64af9b70, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 289: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_154:
	setx 0x36cc39e44173d673, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
memptr_0_155:
	set 0x60740000, %r31
	.word 0x85832551  ! 292: WRCCR_I	wr	%r12, 0x0551, %ccr
mondo_0_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 293: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_157
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_157
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_157:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 294: RDPC	rd	%pc, %r16
DS_0_158:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 295: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x81510000  ! 296: RDPR_TICK	rdpr	%tick, %r0
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_159:
	setx 0x0e86b458b617c933, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 299: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_0_160:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_0_161:
	.word 0x819829d6  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
	.word 0x8d902406  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
splash_tba_0_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x1ab5143fcf9283ad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_163:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_0_164:
    set user_data_start, %o7
	.word 0x93902005  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_0_165:
	setx 0xbc38e626b8e078f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 307: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_166:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_0_167:
	.word 0x819821df  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0xe03fc000  ! 310: STD_R	std	%r16, [%r31 + %r0]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 311: FqTOd	dis not found

mondo_0_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d924010  ! 312: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
splash_cmpr_0_170:
	setx 0x6387994646ad7e4e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 313: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_171:
	.word 0x8f902002  ! 314: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_0_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 315: RESTORE_R	restore	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_173
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_173:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 316: RDPC	rd	%pc, %r13
splash_hpstate_0_174:
	.word 0x819826ad  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ad, %hpstate
	.word 0xdad004a0  ! 318: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	setx 0x41f01e459c2b9ac8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_0_176:
    set user_data_start, %o7
	.word 0x93902000  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_hpstate_0_177:
	.word 0x819827c6  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c6, %hpstate
mondo_0_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d900001  ! 322: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 323: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x99a509d4  ! 324: FDIVd	fdivd	%f20, %f20, %f12
	.word 0x87902112  ! 325: WRPR_TT_I	wrpr	%r0, 0x0112, %tt
debug_0_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 326: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93a00561  ! 327: FSQRTq	fsqrt	
intveclr_0_180:
	setx 0x7c2cf5d3ac8f6645, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_181:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 329: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0xd2c80e80  ! 330: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
cwp_0_182:
    set user_data_start, %o7
	.word 0x93902007  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_183:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_183:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_183
    nop
debug_wait0_183:
    ld [%r23], %r16
    brnz %r16, debug_wait0_183
    nop
    ba,a debug_startwait0_183
continue_debug_0_183:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_183:
    cmp %r13, %r15
    bne,a wait_for_stat_0_183
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
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
	.word 0xd2f00492  ! 332: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 333: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cwp_0_184:
    set user_data_start, %o7
	.word 0x93902006  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790201e  ! 335: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
splash_cmpr_0_185:
	setx 0x3a84b2163d3bcf25, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 336: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 337: WRASI_I	wr	%r0, 0x0004, %asi
tagged_0_186:
	tsubcctv %r26, 0x17e3, %r21
	.word 0xd207e551  ! 338: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x34700001  ! 339: BPG	<illegal instruction>
cwp_0_187:
    set user_data_start, %o7
	.word 0x93902000  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd277e551  ! 341: STX_I	stx	%r9, [%r31 + 0x0551]
change_to_randtl_0_188:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_188:
	.word 0x8f902002  ! 342: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd297e030  ! 343: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
intveclr_0_189:
	setx 0x9ec2a053847c8d2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 345: SAVE_R	save	%r31, %r0, %r31
splash_htba_0_191:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 346: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
debug_0_192:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_192:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_192
    nop
debug_wait0_192:
    ld [%r23], %r16
    brnz %r16, debug_wait0_192
    nop
    ba,a debug_startwait0_192
continue_debug_0_192:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_192:
    cmp %r13, %r15
    bne,a wait_for_stat_0_192
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_192:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_192
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 347: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 348: LDX_R	ldx	[%r31 + %r0], %r9
tagged_0_193:
	taddcctv %r5, 0x17f1, %r10
	.word 0xd207e551  ! 349: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_0_194:
	tsubcctv %r6, 0x1923, %r3
	.word 0xd207e551  ! 350: LDUW_I	lduw	[%r31 + 0x0551], %r9
tagged_0_195:
	taddcctv %r15, 0x1ee5, %r14
	.word 0xd207e551  ! 351: LDUW_I	lduw	[%r31 + 0x0551], %r9
	.word 0x93a00170  ! 352: FABSq	dis not found

	.word 0x919162b7  ! 353: WRPR_PIL_I	wrpr	%r5, 0x02b7, %pil
	.word 0x9f803503  ! 354: SIR	sir	0x1503
intveclr_0_196:
	setx 0xa3e5f95a4d15210d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00569  ! 356: FSQRTq	fsqrt	
	.word 0xe08008a0  ! 357: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe027f503  ! 359: STW_I	stw	%r16, [%r31 + 0xfffff503]
	.word 0x87902277  ! 360: WRPR_TT_I	wrpr	%r0, 0x0277, %tt
	.word 0x87902118  ! 361: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
debug_0_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x9190b5d1  ! 364: WRPR_PIL_I	wrpr	%r2, 0x15d1, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_198) + 16, 16, 16)) -> intp(3,0,5)
intvec_0_198:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
cmp_0_200:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_200:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_200
    nop
cmp_wait0_200:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_200
    nop
    ba,a cmp_startwait0_200
continue_cmp_0_200:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xec, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192800d  ! 367: WRPR_PIL_R	wrpr	%r10, %r13, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 368: FqTOd	dis not found

splash_cmpr_0_202:
	setx 0xf9031d9ffa521278, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 369: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_203:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r8
donret_0_204:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_204-donret_0_204), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_204:
	.word 0xd0fff5d1  ! 371: SWAPA_I	swapa	%r8, [%r31 + 0xfffff5d1] %asi
	.word 0x8d902af3  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0af3, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c3425  ! 373: SDIVX_I	sdivx	%r16, 0xfffff425, %r11
	.word 0xd6d7e030  ! 374: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x879022bb  ! 375: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0xd69004a0  ! 376: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd6800c60  ! 377: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
memptr_0_206:
	set 0x60340000, %r31
	.word 0x8580b832  ! 378: WRCCR_I	wr	%r2, 0x1832, %ccr
	.word 0xd727c000  ! 379: STF_R	st	%f11, [%r0, %r31]
DS_0_207:
	.word 0xa3a289d3  ! 1: FDIVd	fdivd	%f10, %f50, %f48
	allclean
	.word 0xa1b40303  ! 380: ALIGNADDRESS	alignaddr	%r16, %r3, %r16
splash_hpstate_0_208:
	.word 0x81982214  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
intveclr_0_209:
	setx 0x59451f91b5d0696c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 382: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_0_210:
	set user_data_start, %r31
	.word 0x8581a370  ! 383: WRCCR_I	wr	%r6, 0x0370, %ccr
	.word 0xab850001  ! 384: WR_CLEAR_SOFTINT_R	wr	%r20, %r1, %clear_softint
splash_cmpr_0_211:
	setx 0xc85e2856a77f482f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0c804a0  ! 386: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x91a449d2  ! 387: FDIVd	fdivd	%f48, %f18, %f8
	.word 0x91d020b4  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_htba_0_212:
	set 0x80000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 389: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_0_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_213:
	.word 0x8f902002  ! 390: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02032  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_0_214:
	setx 0x7cd0034221b1eaa9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xbb1d648cdf39cd95, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_215:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_216:
	setx 0xc60ae20ee8a8b90c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 395: FqTOd	dis not found

	.word 0xd097e020  ! 396: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xd09004a0  ! 397: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
debug_0_218:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 398: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_0_219:
	.word 0x819823bf  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03bf, %hpstate
DS_0_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f2, %f2
	.word 0xa7b1430a  ! 400: ALIGNADDRESS	alignaddr	%r5, %r10, %r19
cmpenall_0_221:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_221:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_221
    nop
cmpenall_wait0_221:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_221
    nop
    ba,a cmpenall_startwait0_221
continue_cmpenall_0_221:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_221:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_221
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_221:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_221
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

	.xword	0xc9ef95d3df46ed38
	.xword	0xc64862a5a42df329
	.xword	0x9a71a99b6a2bf2e7
	.xword	0xb87948eebdbf20c8
	.xword	0xff31c21402cec362
	.xword	0x189a14d84e63d7b0
	.xword	0x2fdc21193ea70655
	.xword	0x0d787df87d841822
	.xword	0x7d4074a89a83386b
	.xword	0x00812233511a0985
	.xword	0x61042c2898493acd
	.xword	0xe20d23df730c288d
	.xword	0xb67a9f356c53ceab
	.xword	0x496eec7553825caa
	.xword	0xa8804bc6adb3fefd
	.xword	0x30a539a42f7120a9
	.xword	0xf0a44005bf3e3dcf
	.xword	0x4c1c5f59e672aa3b
	.xword	0xfefbaf9f63093e96
	.xword	0x442de074dc670e6f
	.xword	0xf4abf689d2d1b43e
	.xword	0x97bd6b32f601ce75
	.xword	0x3392b2d31e460e79
	.xword	0xbb3bf7328d7c7815
	.xword	0xeba81f625a00ba3c
	.xword	0xdd6b98cc384cee93
	.xword	0xb6f389b4cbf45ff8
	.xword	0x53b5c5ce168636b0
	.xword	0x995d699bf2eb9df9
	.xword	0x7687c2d6657b19f9
	.xword	0x2feb654f49641e29
	.xword	0xa06d9afe38a09ad9
	.xword	0x58273fcf1a8773b3
	.xword	0x58fedcaccfa9516f
	.xword	0x57869104de336691
	.xword	0x28ebd6a20762cf07
	.xword	0x450e6a1bea161fe2
	.xword	0xb4648959497f89b3
	.xword	0x226e214d04d1e5cc
	.xword	0x2c04adb37e8f3c37
	.xword	0x565dd7a269b6c45b
	.xword	0x929bfa548e870c34
	.xword	0xf623ac9a849961b8
	.xword	0x0bd157c8a7159a06
	.xword	0x447be482110a4971
	.xword	0x56c4666b1c6140ed
	.xword	0xe5c55c4f473145fc
	.xword	0xca40e6993d4f0d08
	.xword	0x7524edaa19197485
	.xword	0x806df36ae781316a
	.xword	0xcf08c451f421dace
	.xword	0x44953a6d6275e20b
	.xword	0x8109dde722062d03
	.xword	0xe2df614026810e8a
	.xword	0x498d1b9c2295b2e4
	.xword	0xbec872d9f164b31e
	.xword	0xb3b812da3091707f
	.xword	0x03d861bfc096324e
	.xword	0x6c3ed3ddf2e8b9f5
	.xword	0x496a7c1613884f82
	.xword	0xf7dbfa4d6f47cf63
	.xword	0x2dba68da454020cf
	.xword	0x90cf754b540eaa03
	.xword	0xe33a05d6e74dceed
	.xword	0xb394a93ad6d75e6e
	.xword	0x305ad16e9dd182f2
	.xword	0x1b1f3b64366cd7c8
	.xword	0x6be5aec99713c401
	.xword	0xa897042d8846869b
	.xword	0xd086b9bb080a6919
	.xword	0xef20122d36e3b16f
	.xword	0xe4cbd3d750f1ff93
	.xword	0xeb4b5e7c45b50101
	.xword	0x1fc00804f4c07554
	.xword	0xdc9e6fd7b8f1bbef
	.xword	0xcfafb6e620f5cfcc
	.xword	0x001a7a490a8ed25e
	.xword	0x7cb27919a917b044
	.xword	0x9e7ea47ac81892bc
	.xword	0x0f3b9e23fa733fc2
	.xword	0xea51e009065cc773
	.xword	0x94d99ba866a0dc96
	.xword	0x28eb9ec3dc29b02a
	.xword	0x92f0d781d7f8e278
	.xword	0xb537b416073729a3
	.xword	0x0bc0d07ce60afbed
	.xword	0x458e15701abf3a53
	.xword	0xb22908d0600f9d55
	.xword	0x28cd54e10e748190
	.xword	0x853d40244d3044c6
	.xword	0x343b66944b93aa5e
	.xword	0x1d9dcb853a632bb4
	.xword	0x0d92875769070322
	.xword	0xda45c4736fb67003
	.xword	0x9296d36dcaee5ce5
	.xword	0x96c506a872580b6c
	.xword	0x30f868a4f1bce29e
	.xword	0xa644d2690554a99f
	.xword	0x3133368573e6cfc6
	.xword	0x5b50a5416f76ff67
	.xword	0xb56c5151a6f2740e
	.xword	0x242d46fa428299d1
	.xword	0xf3d39defec4298b1
	.xword	0xbf896990209bab15
	.xword	0xd59142ecf2ffefe0
	.xword	0x4bdeeb74b4272296
	.xword	0x95efba4011371817
	.xword	0xa3ba996f1dc90616
	.xword	0xb3061822bd51063a
	.xword	0x04a010630f035027
	.xword	0x1f4b833aafd6bde4
	.xword	0x3a2bd76d93ff9239
	.xword	0x0c2c8e8f13b43cf9
	.xword	0xb23b0052e8b391d7
	.xword	0xf0b700ad6a38d4af
	.xword	0x36ccb3c997bc0ece
	.xword	0x550c26ffd4aa7c79
	.xword	0x4f376e1116771ce7
	.xword	0xa0f49f33b1eab098
	.xword	0xa805dd77510d842c
	.xword	0xe4e6310a61900643
	.xword	0x7196efb434b00413
	.xword	0xf7bc65b6c7d792e9
	.xword	0x543e9c2437cbc49a
	.xword	0x55aa9beefc9d0de5
	.xword	0xa1b6fd45c8d9b72e
	.xword	0x979d42e5ba9b71ca
	.xword	0x58fb4217dcf7e967
	.xword	0x343709680d3bbe3e
	.xword	0x5c263c7ce03ee143
	.xword	0x4d4f272796ad58c5
	.xword	0xacc845bb98713379
	.xword	0x2faf9e5de33811d2
	.xword	0x4fbb502555e70960
	.xword	0xacc0565882414e2b
	.xword	0x753d5d322e9c1bef
	.xword	0xcafc4f053697283f
	.xword	0xef288430cdf036ed
	.xword	0xd09863817c57f0fb
	.xword	0x7f29ced191d26393
	.xword	0x84b8c65fcbfe9a34
	.xword	0x4d40532258cb7013
	.xword	0x0fe5bd85c4487795
	.xword	0x39daf30a9a43b974
	.xword	0xe997d68636edebc7
	.xword	0xc576988254389b3d
	.xword	0xe084bb9cdab7573a
	.xword	0x1d317d94f42054e8
	.xword	0xa20487f4f48fa6de
	.xword	0xc1d7d809f858594a
	.xword	0xfed6da6a403ca9af
	.xword	0xeedd4ba0fee1ca71
	.xword	0x04787e53cea6234f
	.xword	0xccb026f66035f692
	.xword	0x28cc09d707b33b90
	.xword	0x1a79bdde5a25dfab
	.xword	0x0ccd919ca0f7e570
	.xword	0x8fe2c8e43e3d1304
	.xword	0x9c28ccdfa0fc3a14
	.xword	0x940b6bef51a768b1
	.xword	0xa07ce27ca6620114
	.xword	0x613d21b8466367af
	.xword	0xd60f4328000dd741
	.xword	0x447a3afe82528793
	.xword	0x04211a208e45109b
	.xword	0x6f9975c876c949ab
	.xword	0x4edd47d6fca5f9a2
	.xword	0x6b0e2f85995bab25
	.xword	0x7c6135564d6e6492
	.xword	0x98ba5f75980f982f
	.xword	0x5fd1c65c8e0adb26
	.xword	0xe143c5e0c0180c12
	.xword	0x7a4655ebbde60720
	.xword	0x98903a64e7b0d01d
	.xword	0x1f7919b7663c7c0f
	.xword	0xe7d906536b7d798d
	.xword	0xb718318258a63d72
	.xword	0xe62da7798b93955f
	.xword	0xaa857c31782c7bf4
	.xword	0x7eac2d24893deda7
	.xword	0x35a1d17dbe63d1ab
	.xword	0xebc140c7584ce74a
	.xword	0x07a7f9b892d84fe9
	.xword	0x052c28cedac853d8
	.xword	0xde35a01e7c0b6c31
	.xword	0x19f5962932a58141
	.xword	0x53db8c503bf29b89
	.xword	0x9dd0766626d76625
	.xword	0x93803426ae192ddf
	.xword	0x43bec98fed15c84c
	.xword	0x4c4b883809f76ff1
	.xword	0x481320bde2a11170
	.xword	0x3cb4afb8a0a60791
	.xword	0x0de432f039b0ddb8
	.xword	0xac1a0b0be50dcd81
	.xword	0x73754497a121317f
	.xword	0x7f1943f61839a310
	.xword	0xa78ab0834a9ec81c
	.xword	0x68b1e0d2b6530ae4
	.xword	0xbbdf7b30bd46d44f
	.xword	0x545678b55dad52d2
	.xword	0xc5170e8343719e1c
	.xword	0x1aa99d7ef5fbf4b7
	.xword	0xf83596888f56c987
	.xword	0x5a760a57efe5cb11
	.xword	0xa9c7d12a5239399b
	.xword	0x59c24f5596873e63
	.xword	0x548ee9c6a9150732
	.xword	0xd2424145fb707c50
	.xword	0x2bd03e04b532e826
	.xword	0xa2ef28a889b23b94
	.xword	0x00459f40f6fd51c3
	.xword	0x7cdae885bada6f1a
	.xword	0xb2f9ed0fbf80b5df
	.xword	0x836bc3730937bc5d
	.xword	0x5e71ab64a9dfc818
	.xword	0x52412feb6f20572c
	.xword	0xcb2ea7a533d3fa6e
	.xword	0x72cd94684e1e39f7
	.xword	0xb7323f8a0483c1d4
	.xword	0x503c42e4dc8aaf69
	.xword	0x3327e5cd87d561de
	.xword	0xb56ef5c365311c91
	.xword	0x92f6b16116ba6136
	.xword	0xae897a156c0cd31c
	.xword	0x14b109ac08a6cfad
	.xword	0x9fe2cba8b82ae53f
	.xword	0x36816f54ef598cad
	.xword	0x651f2b02be19cf8a
	.xword	0xe7583cd965c4e038
	.xword	0x95ae80480411fd02
	.xword	0x4bdfdc150f620238
	.xword	0xc033ab60d455cbc2
	.xword	0xaf0fc4fdfd23c403
	.xword	0xfaf411632cfa78cd
	.xword	0xc40d0296b80f744b
	.xword	0x86d0782f701771e8
	.xword	0x719a1a3bfa27d2af
	.xword	0xb6b2950ffef648ea
	.xword	0x411760e1fa1f78c2
	.xword	0xd5d5c8b53379dd26
	.xword	0x5aa51f8634ab4be1
	.xword	0xd18e241fbcb3d3bb
	.xword	0xa839b4f2482a246d
	.xword	0x37f7cc168bc6475d
	.xword	0x57ea6e383fc416ac
	.xword	0x64dd71ff38f8bfe2
	.xword	0x82a76fb71418e752
	.xword	0x87832f60a11d2d79
	.xword	0x089d431222762116
	.xword	0x49cfe481ea58cab6
	.xword	0x3a2d9f6d286fb6f2
	.xword	0x64dacebceb79b00f
	.xword	0x93fc08040341d42d
	.xword	0xf365e1fccd9c24fc
	.xword	0x45cec8ce459b1359

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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x7b6dd4d592dfe4b9
	.xword	0x0abd43582dc9cbd0
	.xword	0xc24a98d4c7cd6573
	.xword	0x0d4656ab9b023105
	.xword	0xbfd12d7d4027590a
	.xword	0x0b9ecde01d5418a9
	.xword	0x0b505522f0c06311
	.xword	0xc5e179eba3d7ede7
	.xword	0x189b1e1ae1d1bc28
	.xword	0xd5f3b37ffbdb2599
	.xword	0xfc33b97c764211b5
	.xword	0xd738ae95df6837ac
	.xword	0x8dbc83e8108ed41f
	.xword	0x8d3af1b9e671f544
	.xword	0x6d7e61fb5cb4904f
	.xword	0x5f453752466748c5
	.xword	0x979f64ecdf4783bf
	.xword	0x80791fd499c246cb
	.xword	0xe8182f779a0c21ca
	.xword	0xed3e59760219d8f3
	.xword	0x087b8de00d475d59
	.xword	0x5d1c7ebf92e705cb
	.xword	0x5e2042f6388713b8
	.xword	0xb1427edf91ca9795
	.xword	0x9ae4b891b34bf2c9
	.xword	0xeab61e4d13ece4d5
	.xword	0x79da41065a659eff
	.xword	0x5788105f5c70660b
	.xword	0x31c174e917fd2f8b
	.xword	0x29af1d1871f04fbf
	.xword	0x9079178047f447e7
	.xword	0xb2031b191c1b549a



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
	.xword	0xa9edb6eb5e4c19c2
	.xword	0x03b0431e389c1f42
	.xword	0x3fe59633a20fe665
	.xword	0x195a7a9e67cd7ebf
	.xword	0x118ce0ce372eb069
	.xword	0xcac6946396dc8c5e
	.xword	0x1cc95140e0507a3a
	.xword	0xfef8c615cdf74c25
	.xword	0x26025375815a1cdb
	.xword	0x0aa39f0d264b98f6
	.xword	0x1dc2db23b11ea276
	.xword	0x1db3eec85ae2549f
	.xword	0xecff7e7fa9383b6c
	.xword	0x6de42745b0ca3131
	.xword	0xb88a860cb337f55c
	.xword	0xa67bcd3b50804bfa
	.xword	0x3a91ff7dfa651b36
	.xword	0x9f11e03895b2c7bb
	.xword	0x947b7e74dde8136e
	.xword	0xbc08989eb3d5406e
	.xword	0x233aac44f003e4fc
	.xword	0x96ad054e5572ad67
	.xword	0x4045dc12388bd470
	.xword	0x10b2057f444af956
	.xword	0x382889cd3aeeab9f
	.xword	0x8d446c6ee6c54c54
	.xword	0x0afaf1e0982e87c4
	.xword	0xd3b17da4ae33a361
	.xword	0x2755898d0b10fb73
	.xword	0x692f8108fe550134
	.xword	0xb8e67e63c3e7d72c
	.xword	0xeaa8a385615fa0d2



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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
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
	.xword	0x14492fdff411a170
	.xword	0x6920f6f01b092189
	.xword	0x23723f917481e899
	.xword	0x72a92e4c1e9bc86b
	.xword	0x8dcec63958365450
	.xword	0x7090de94e880baa8
	.xword	0xb76cf9fa7ca8dcea
	.xword	0x728bd0ee373e897b
	.xword	0xa4a58bbb5ba86ea6
	.xword	0x5e3a5db3dea44839
	.xword	0x5a2ffead63ad14f3
	.xword	0x47792bc0dd4c806d
	.xword	0x7886bd290f1413d1
	.xword	0xc9966b43ddb416ad
	.xword	0xf759aebf95eef3af
	.xword	0x7fb5375f7f2952f5
	.xword	0xfa2f5f4269f7d392
	.xword	0xcb8d0d7efe50374f
	.xword	0xec0462490ce3de05
	.xword	0xac4a6b114634df65
	.xword	0x8c959df1b0dc213e
	.xword	0xd9eacaa59c69774f
	.xword	0x73004301a330b9ae
	.xword	0x8478c60db189cf31
	.xword	0xb7cbe66596015569
	.xword	0xf754ad462de9e650
	.xword	0xee4d5dbace7355ec
	.xword	0xff42577bd22c3197
	.xword	0xda94b2972e94568b
	.xword	0xa1d7e586bc300867
	.xword	0xfa2d382c046f5d26
	.xword	0x07b07741e7e1dad8



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
	TTE_IE	 = 0,
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
	.xword	0x667e19ef1b4fd202
	.xword	0x8204b9f390fee4db
	.xword	0xd5e462df5ffcf24a
	.xword	0x31beea34a0b39e4b
	.xword	0x45ca9fde1238cfb5
	.xword	0x2ce8da8be9e86857
	.xword	0xc7a2d06d24cf60b0
	.xword	0xba1cd030c42a8b37
	.xword	0x876bbf9338714b4e
	.xword	0xd873a7a1c0f2ee6a
	.xword	0x03a71487cfaebb60
	.xword	0xde641a56eb3b3a28
	.xword	0xc78d5f47831ba53f
	.xword	0x750bdd7aa37937e5
	.xword	0xffd1e9c43ec00461
	.xword	0xa72dbe13106309f6
	.xword	0xf448e666b9a14e7e
	.xword	0xce15cfea72e96e06
	.xword	0xdd10b2411469b0e7
	.xword	0xe2523312436f2e59
	.xword	0x97bcf2a2df416741
	.xword	0xdac72b43249b9514
	.xword	0x06025f7ce6934bf1
	.xword	0x1ce7abaf017454ab
	.xword	0xce2eafd524466eb5
	.xword	0xf8dea149df363563
	.xword	0x8d97c1924baf75d2
	.xword	0xc5db0a2d5a563670
	.xword	0x4e673bf7dc6bd7ac
	.xword	0x72d472697f5bf13a
	.xword	0x04df07011faef234
	.xword	0x4266277b85ff3e33



#if 0
#endif

