/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_39.s
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
# 258 "diag.j"
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
	mov 0xb2, %r14
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
	mov 0x30, %r14
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
	mov 0x32, %r14
	mov 0xb4, %r30
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
memptr_7_0:
	set user_data_start, %r31
	.word 0x8581f618  ! 1: WRCCR_I	wr	%r7, 0x1618, %ccr
splash_lsu_7_1:
	setx 0x01e3546b2114dc8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 3: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_7_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_7_3:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 7: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_7_4-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_4:
	.word 0x9191c014  ! 8: WRPR_PIL_R	wrpr	%r7, %r20, %pil
DS_7_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd911c00a  ! 1: LDQF_R	-	[%r7, %r10], %f12
	.word 0x95a00828  ! 9: FADDs	fadds	%f0, %f8, %f10
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x879021f9  ! 11: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
cwp_7_6:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_7_7:
	set 0x60140000, %r31
	.word 0x8584b197  ! 15: WRCCR_I	wr	%r18, 0x1197, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_8:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
splash_tba_7_9:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_7_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_7_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a0016c  ! 20: FABSq	dis not found

memptr_7_12:
	set user_data_start, %r31
	.word 0x8584afa4  ! 21: WRCCR_I	wr	%r18, 0x0fa4, %ccr
splash_cmpr_7_13:
	setx 0xf3871c64bff04a2e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_7_14:
    set user_data_start, %o7
	.word 0x93902004  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_7_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_7_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f2, %f24
	.word 0x95b14311  ! 25: ALIGNADDRESS	alignaddr	%r5, %r17, %r10
	.word 0xa190200f  ! 26: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_7_17:
	taddcctv %r25, 0x1939, %r1
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x97a0016c  ! 30: FABSq	dis not found

	.word 0x91a00174  ! 31: FABSq	dis not found

	.word 0xe6cfe030  ! 32: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93520000  ! 34: RDPR_PIL	rdpr	%pil, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01967  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_19)+16, 16, 16)) -> intp(7,1,3)
xir_7_19:
	.word 0xa980ee06  ! 36: WR_SET_SOFTINT_I	wr	%r3, 0x0e06, %set_softint
	.word 0xd0c00e40  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r8
	.word 0xa1902003  ! 38: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_20:
	setx 0x3bb7a20b6ee9935f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_21:
	.word 0xa1a309c0  ! 1: FDIVd	fdivd	%f12, %f0, %f16
	allclean
	.word 0x93b5030c  ! 41: ALIGNADDRESS	alignaddr	%r20, %r12, %r9
debug_7_22:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_7_24:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 45: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_lsu_7_25:
	setx 0xc0126de8f3310abd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba149cd  ! 47: FDIVd	fdivd	%f36, %f44, %f44
DS_7_26:
	.word 0xa1a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f16
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_7_27:
	nop
	setx 0xffffffedfffffdba, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 50: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_28) + 0, 16, 16)) -> intp(6,0,13)
intvec_7_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 52: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d90303e  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x103e, %pstate
tagged_7_29:
	taddcctv %r18, 0x1030, %r3
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_7_30:
	tsubcctv %r10, 0x1e81, %r20
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_31:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 59: RDPC	rd	%pc, %r9
mondo_7_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d90c001  ! 60: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	.word 0x879022f5  ! 61: WRPR_TT_I	wrpr	%r0, 0x02f5, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_7_33:
	set user_data_start, %r31
	.word 0x85843c14  ! 63: WRCCR_I	wr	%r16, 0x1c14, %ccr
cwp_7_34:
    set user_data_start, %o7
	.word 0x93902001  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa5a000d1  ! 66: FNEGd	fnegd	%f48, %f18
	.word 0xa190200f  ! 67: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a149d4  ! 71: FDIVd	fdivd	%f36, %f20, %f10
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_7_36:
	setx 0xff6fdf3a260e213d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x739a1723e599fc68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_39:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd08008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_7_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d908004  ! 79: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x9f80375e  ! 80: SIR	sir	0x175e
cwp_7_42:
    set user_data_start, %o7
	.word 0x93902007  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xab82800a  ! 82: WR_CLEAR_SOFTINT_R	wr	%r10, %r10, %clear_softint
splash_hpstate_7_43:
	.word 0x819822cc  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cc, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_7_45:
	setx 0x0e1936ab597d83a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_7_46:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xe137b3f4b540618f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_48:
	.word 0x81982c5f  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5f, %hpstate
	.word 0xad812469  ! 90: WR_SOFTINT_REG_I	wr	%r4, 0x0469, %softint
	.word 0x879022c1  ! 91: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_49:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 92: RDPC	rd	%pc, %r17
	.word 0xd2cfe000  ! 93: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d903c30  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x1c30, %pstate
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
	.word 0x93414000  ! 95: RDPC	rd	%pc, %r9
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01961  ! 97: FqTOd	dis not found

splash_cmpr_7_52:
	setx 0xa6832ccba6b269a9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_53:
	.word 0x81982cdc  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
tagged_7_54:
	tsubcctv %r10, 0x138e, %r4
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x5f8ea42f95e39f80, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944000  ! 103: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0x8d903367  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x1367, %pstate
	.word 0xd8cfe020  ! 105: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
splash_lsu_7_57:
	setx 0x44846e5b31a3d949, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x8780204f  ! 108: WRASI_I	wr	%r0, 0x004f, %asi
debug_7_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 110: RDPC	rd	%pc, %r16
tagged_7_61:
	taddcctv %r26, 0x1e95, %r8
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_7_62:
	setx 0xbf9f0d04af13efb9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_7_64:
	setx 0xc42e39365b854ad2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_65:
	.word 0x8f902001  ! 117: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
memptr_7_66:
	set user_data_start, %r31
	.word 0x85837f31  ! 118: WRCCR_I	wr	%r13, 0x1f31, %ccr
memptr_7_67:
	set 0x60540000, %r31
	.word 0x8582f143  ! 119: WRCCR_I	wr	%r11, 0x1143, %ccr
	.word 0xa1902004  ! 120: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_7_68:
	setx 0xae420ca8ac9cd4d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab808000  ! 122: WR_CLEAR_SOFTINT_R	wr	%r2, %r0, %clear_softint
	.word 0x906afba3  ! 123: UDIVX_I	udivx 	%r11, 0xfffffba3, %r8
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_7_69:
	setx 0x30e5837485144668, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_70) + 16, 16, 16)) -> intp(6,0,23)
intvec_7_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_71:
	setx 0xdba4b7b5d2dfc252, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 128: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879021c8  ! 129: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0xa5a249cc  ! 130: FDIVd	fdivd	%f40, %f12, %f18
	.word 0xa4d0306d  ! 131: UMULcc_I	umulcc 	%r0, 0xfffff06d, %r18
change_to_randtl_7_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_72:
	.word 0x8f902000  ! 132: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_7_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_73:
	.word 0x8f902003  ! 133: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0800a60  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r8
	.word 0xd0cfe010  ! 135: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
splash_hpstate_7_74:
	.word 0x81982d1d  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	.word 0x87902365  ! 137: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0x87802020  ! 138: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87902302  ! 139: WRPR_TT_I	wrpr	%r0, 0x0302, %tt
	.word 0xa1480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xd28008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_7_75:
	setx 0x6af8927df41669e0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_76:
	.word 0x81982d5c  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5c, %hpstate
	.word 0xa1902003  ! 144: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8780201c  ! 145: WRASI_I	wr	%r0, 0x001c, %asi
tagged_7_77:
	taddcctv %r1, 0x1686, %r25
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_7_78:
	setx 0xc88e067854891041, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_7_79:
	set 0x60740000, %r31
	.word 0x8582654a  ! 148: WRCCR_I	wr	%r9, 0x054a, %ccr
	.word 0xa190200c  ! 149: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd2800c20  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0xd28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_7_80:
	tsubcctv %r15, 0x19dc, %r8
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd28008a0  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_7_81:
    set user_data_start, %o7
	.word 0x93902003  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800a80  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_7_82-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_82:
	.word 0x9192c013  ! 160: WRPR_PIL_R	wrpr	%r11, %r19, %pil
cwp_7_83:
    set user_data_start, %o7
	.word 0x93902002  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_7_84:
	setx 0x3e4ff3118d62bad5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_85:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_86:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 164: RDPC	rd	%pc, %r8
	.word 0x8780208a  ! 165: WRASI_I	wr	%r0, 0x008a, %asi
tagged_7_87:
	taddcctv %r14, 0x18f4, %r18
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_7_88:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 168: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa3480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_7_90:
	setx 0x674aa0b757824bbc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01966  ! 174: FqTOd	dis not found

splash_cmpr_7_92:
	setx 0x0cc6b65615917139, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_7_93:
	setx 0x50007a0fa29ac352, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe030  ! 178: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
	rd %pc, %r19
	add %r19, (ivw_7_94-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_94:
	.word 0x91940007  ! 180: WRPR_PIL_R	wrpr	%r16, %r7, %pil
	.word 0x879023a8  ! 181: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
intveclr_7_95:
	setx 0x2bc08a4e6f7d509b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_7_96:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b4  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_97:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 185: RDPC	rd	%pc, %r11
splash_tba_7_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f802f8c  ! 187: SIR	sir	0x0f8c
memptr_7_99:
	set user_data_start, %r31
	.word 0x8580a1b4  ! 188: WRCCR_I	wr	%r2, 0x01b4, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x83d02034  ! 190: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_cmpr_7_100:
	setx 0xb542b5ab5aeba685, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe08008a0  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa190200b  ! 194: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe0cfe020  ! 195: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
memptr_7_101:
	set 0x60540000, %r31
	.word 0x8582ac92  ! 196: WRCCR_I	wr	%r10, 0x0c92, %ccr
	.word 0x9f8025cd  ! 197: SIR	sir	0x05cd
intveclr_7_102:
	setx 0xf7d97f8107197491, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ce98a  ! 199: SDIVX_I	sdivx	%r19, 0x098a, %r20
splash_lsu_7_104:
	setx 0x9974afde4c1e6fc9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 201: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_7_105:
	setx 0xb2553dc58e1285d3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_7_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb7500d18	! Random illegal ?
	.word 0xd714000d  ! 1: LDQF_R	-	[%r16, %r13], %f11
	.word 0x97a1c822  ! 204: FADDs	fadds	%f7, %f2, %f11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01971  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_7_108:
	.word 0x93a109c1  ! 1: FDIVd	fdivd	%f4, %f32, %f40
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_7_109:
	nop
	setx 0xfffff633fffff776, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b5  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x8d902c8e  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x0c8e, %pstate
	.word 0x83d02034  ! 211: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe8dfe020  ! 212: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xe8c00e60  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r20
DS_7_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f14, %f18
	.word 0xa3b50309  ! 214: ALIGNADDRESS	alignaddr	%r20, %r9, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_7_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b1430a  ! 216: ALIGNADDRESS	alignaddr	%r5, %r10, %r9
splash_hpstate_7_112:
	.word 0x81982546  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_7_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x87902191  ! 222: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
tagged_7_114:
	tsubcctv %r24, 0x1807, %r17
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x83d02035  ! 224: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d90301e  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x101e, %pstate
splash_lsu_7_115:
	setx 0xf754a48aa8e8844f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_116:
	setx 0x9902342476b7b051, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 228: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d02033  ! 229: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_7_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d91c00c  ! 230: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cf31a  ! 231: SDIVX_I	sdivx	%r19, 0xfffff31a, %r12
	.word 0xa3a00161  ! 232: FABSq	dis not found

memptr_7_119:
	set 0x60540000, %r31
	.word 0x8580e52f  ! 233: WRCCR_I	wr	%r3, 0x052f, %ccr
	.word 0xa190200a  ! 234: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568341f  ! 235: SDIVX_I	sdivx	%r0, 0xfffff41f, %r10
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 236: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e000  ! 238: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xa5520000  ! 239: RDPR_PIL	rdpr	%pil, %r18
	.word 0x8790220c  ! 240: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	.word 0xa26cc00d  ! 241: UDIVX_R	udivx 	%r19, %r13, %r17
debug_7_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_123:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_124:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 244: RDPC	rd	%pc, %r8
debug_7_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf4fa  ! 246: SDIVX_I	sdivx	%r19, 0xfffff4fa, %r11
mondo_7_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d914005  ! 247: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
change_to_randtl_7_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_128:
	.word 0x8f902001  ! 248: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_7_129:
	setx 0x3f51be74d55cb717, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_130) + 56, 16, 16)) -> intp(7,0,8)
intvec_7_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 253: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	rd %pc, %r19
	add %r19, (ivw_7_131-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_131:
	.word 0x91910010  ! 254: WRPR_PIL_R	wrpr	%r4, %r16, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d902f67  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0f67, %pstate
	.word 0x99902000  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e020  ! 259: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
tagged_7_132:
	tsubcctv %r20, 0x119f, %r21
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_7_133:
	.word 0x81982344  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0344, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab840009  ! 263: WR_CLEAR_SOFTINT_R	wr	%r16, %r9, %clear_softint
splash_lsu_7_134:
	setx 0x4a5f3011e8c2bec7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_135:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 265: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_cmpr_7_136:
	setx 0x4c65cd0dd1bad982, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 267: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_7_137:
	setx 0xf8e66698640fd72d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe020  ! 271: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x9f80200d  ! 272: SIR	sir	0x000d
	.word 0x93a00544  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_7_138-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_138:
	.word 0x91918012  ! 276: WRPR_PIL_R	wrpr	%r6, %r18, %pil
	.word 0x97a14dc2  ! 277: FdMULq	fdmulq	
debug_7_139:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x95a1c9cc  ! 280: FDIVd	fdivd	%f38, %f12, %f10
splash_tba_7_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902006  ! 282: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9f802714  ! 283: SIR	sir	0x0714
intveclr_7_141:
	setx 0xf8b230f6d46bb15c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c7e  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0c7e, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01961  ! 287: FqTOd	dis not found

	.word 0xd08008a0  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c7e000  ! 289: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	setx 0x52602b3672f5e777, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
debug_7_145:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_146) + 40, 16, 16)) -> intp(4,0,30)
intvec_7_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_147:
	.word 0x8f902000  ! 294: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_7_149:
	setx 0xd8b85d27ee70d988, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_150:
	setx 0x8d5aad4991c4e425, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_151:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x91a000d0  ! 302: FNEGd	fnegd	%f16, %f8
splash_tba_7_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_7_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d94800d  ! 304: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xe4c004a0  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d020b2  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xe4880e40  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
tagged_7_154:
	tsubcctv %r21, 0x1d53, %r7
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x9b500000  ! 310: RDPR_TPC	rdpr	%tpc, %r13
splash_lsu_7_155:
	setx 0xfc95938bdfff1669, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_156:
	set user_data_start, %r31
	.word 0x858429f2  ! 312: WRCCR_I	wr	%r16, 0x09f2, %ccr
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
	.word 0xa5414000  ! 313: RDPC	rd	%pc, %r18
debug_7_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_159:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 315: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
intveclr_7_160:
	setx 0x0e771d7fb4a66c14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_7_161:
	taddcctv %r24, 0x12bb, %r12
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_7_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_7_163:
	setx 0xbc507a9d7b55c71b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94c00b  ! 320: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0x99902002  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x97702332  ! 322: POPC_I	popc	0x0332, %r11
change_to_randtl_7_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_165:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_7_166:
	setx 0x8a12271f88fa2528, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00168  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x91d020b2  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d902d4a  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0d4a, %pstate
splash_cmpr_7_167:
	setx 0x9e55f00d5eaabd30, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_7_168:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_7_169:
	taddcctv %r21, 0x13fd, %r10
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e80  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x74, %r9
splash_cmpr_7_170:
	setx 0x4274c953f6ce9eca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0xa1500000  ! 338: RDPR_TPC	rdpr	%tpc, %r16
splash_tba_7_171:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_7_172:
	tsubcctv %r5, 0x1cea, %r13
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_7_173:
    set user_data_start, %o7
	.word 0x93902001  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8880e80  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
change_to_randtl_7_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_174:
	.word 0x8f902001  ! 344: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa190200f  ! 346: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_7_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xb1be41e75fe3366e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9145c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_178) + 40, 16, 16)) -> intp(1,0,12)
intvec_7_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00173  ! 351: FABSq	dis not found

splash_hpstate_7_179:
	.word 0x81982d17  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d17, %hpstate
tagged_7_180:
	tsubcctv %r25, 0x1f9b, %r7
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f8021ed  ! 354: SIR	sir	0x01ed
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_7_181:
	setx 0x5aa3bec23d7d8cb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_7_184:
	.word 0x97a349cc  ! 1: FDIVd	fdivd	%f44, %f12, %f42
	.word 0xe53036da  ! 1: STQF_I	-	%f18, [0x16da, %r0]
	normalw
	.word 0xa9458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x93464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_7_185:
	nop
	setx 0xfffff315fffff09d, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_7_186:
    set user_data_start, %o7
	.word 0x93902001  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_7_187:
	.word 0x81982c47  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
debug_7_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 369: FqTOd	dis not found

intveclr_7_190:
	setx 0xb34530672f98a2d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9818013  ! 371: WR_SET_SOFTINT_R	wr	%r6, %r19, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_7_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9a844004  ! 374: ADDcc_R	addcc 	%r17, %r4, %r13
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 375: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_192:
	tsubcctv %r22, 0x11f6, %r8
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e60  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x73, %r18
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
	.word 0xa7414000  ! 381: RDPC	rd	%pc, %r19
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_7_194:
	setx 0x498ce2fa0665d023, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802088  ! 385: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802010  ! 386: WRASI_I	wr	%r0, 0x0010, %asi
memptr_7_195:
	set user_data_start, %r31
	.word 0x8582b0ca  ! 387: WRCCR_I	wr	%r10, 0x10ca, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_7_196:
	setx 0x83355b592a12e21f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7352425  ! 1: STQF_I	-	%f19, [0x0425, %r20]
	normalw
	.word 0x97458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902004  ! 391: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9f80372f  ! 392: SIR	sir	0x172f
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_7_198:
	setx 0x0a7b012bf3716187, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_7_199:
	set 0x60340000, %r31
	.word 0x8581fceb  ! 396: WRCCR_I	wr	%r7, 0x1ceb, %ccr
tagged_7_200:
	tsubcctv %r2, 0x1f60, %r22
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_7_201:
	setx 0xd0244be6cec9a5d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a289d4  ! 399: FDIVd	fdivd	%f10, %f20, %f10
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 400: RDPC	rd	%pc, %r20
	setx 0x9c937ea2f8fb79ff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_7_204:
    set user_data_start, %o7
	.word 0x93902006  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd0d80e60  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x73, %r8
	.word 0xab804009  ! 404: WR_CLEAR_SOFTINT_R	wr	%r1, %r9, %clear_softint
DS_7_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd532400d  ! 1: STQF_R	-	%f10, [%r13, %r9]
	normalw
	.word 0x95458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r10
memptr_7_206:
	set 0x60540000, %r31
	.word 0x8581f963  ! 406: WRCCR_I	wr	%r7, 0x1963, %ccr
debug_7_207:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 407: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xa1902005  ! 408: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_7_208:
	.word 0x81982f17  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	rd %pc, %r19
	add %r19, (ivw_7_209-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_209:
	.word 0x91918013  ! 411: WRPR_PIL_R	wrpr	%r6, %r19, %pil
	.word 0xe08fe030  ! 412: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_210) + 56, 16, 16)) -> intp(6,0,22)
intvec_7_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902edd  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 415: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021c0  ! 416: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
memptr_7_211:
	set 0x60740000, %r31
	.word 0x85833e55  ! 417: WRCCR_I	wr	%r12, 0x1e55, %ccr
	.word 0x91d020b3  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_hpstate_7_212:
	.word 0x81982cce  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
donret_7_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_213-donret_7_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe0800b40  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
	.word 0xe0c7e000  ! 422: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
memptr_7_214:
	set 0x60140000, %r31
	.word 0x858124fd  ! 423: WRCCR_I	wr	%r4, 0x04fd, %ccr
intveclr_7_215:
	setx 0x4dd9095c734040f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa8f88005  ! 425: SDIVcc_R	sdivcc 	%r2, %r5, %r20
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_7_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_7_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d9039d4  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x19d4, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd0800bc0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_218) + 48, 16, 16)) -> intp(7,0,29)
intvec_7_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01961  ! 434: FqTOd	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe030  ! 436: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0xa150c000  ! 437: RDPR_TT	rdpr	%tt, %r16
DS_7_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_7_222:
    set user_data_start, %o7
	.word 0x93902002  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d02032  ! 440: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_7_223:
	setx 0x913328a7e1779b88, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902012  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_224:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 443: RDPC	rd	%pc, %r17
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_7_225:
	setx 0xc5fc49017f526807, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d93400b  ! 446: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
memptr_7_227:
	set 0x60140000, %r31
	.word 0x858535cc  ! 447: WRCCR_I	wr	%r20, 0x15cc, %ccr
	.word 0xa5a00171  ! 448: FABSq	dis not found

mondo_7_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90000b  ! 449: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
splash_cmpr_7_229:
	setx 0x235565f54fda2c3c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87802010  ! 453: WRASI_I	wr	%r0, 0x0010, %asi
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 454: RDPC	rd	%pc, %r10
	setx 0xfd8e13c47132b200, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_7_232:
	setx 0x3cda59afc6e1bc77, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab84400d  ! 457: WR_CLEAR_SOFTINT_R	wr	%r17, %r13, %clear_softint
	.word 0x8790215c  ! 458: WRPR_TT_I	wrpr	%r0, 0x015c, %tt
	.word 0xd6c804a0  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_cmpr_7_233:
	setx 0x7468bdf3fc22c200, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa745c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x87902344  ! 462: WRPR_TT_I	wrpr	%r0, 0x0344, %tt
	.word 0x83d020b5  ! 463: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x99902002  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_cmpr_7_234:
	setx 0xb9bbff40ed5a1bd7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f10, %f22
	.word 0x99b04313  ! 466: ALIGNADDRESS	alignaddr	%r1, %r19, %r12
	.word 0x8780204f  ! 467: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d02034  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_7_236:
	set 0x60540000, %r31
	.word 0x8580f89a  ! 469: WRCCR_I	wr	%r3, 0x189a, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_7_237:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 471: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
pmu_7_238:
	nop
	setx 0xfffff02ffffffd47, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_239:
	setx 0x93268ce1180ccb57, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 474: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_7_240:
	setx 0x519a3391cc69a28c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_7_241:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_7_243:
	setx 0xbc581b26422c56ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_244:
	.word 0x81982c0f  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0xe6d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_cmpr_7_245:
	setx 0x866707b7f062b807, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_246:
	tsubcctv %r15, 0x1991, %r26
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_7_247:
	setx 0xdd7c406d327fc8f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_248) + 48, 16, 16)) -> intp(0,0,4)
intvec_7_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a40d32  ! 489: FsMULd	fsmuld	%f16, %f18, %f48
splash_tba_7_249:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_7_250:
	setx 0x500e7d473ccfc27b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_7_251:
    set user_data_start, %o7
	.word 0x93902006  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790208e  ! 493: WRPR_TT_I	wrpr	%r0, 0x008e, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196a  ! 494: FqTOd	dis not found

splash_cmpr_7_253:
	setx 0xefff730f46ef9267, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_254) + 16, 16, 16)) -> intp(2,0,1)
intvec_7_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_7_255:
	.word 0x81982cf5  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cf5, %hpstate
DS_7_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
memptr_6_0:
	set user_data_start, %r31
	.word 0x85843416  ! 1: WRCCR_I	wr	%r16, 0x1416, %ccr
splash_lsu_6_1:
	setx 0x36c4cfa153dc2cf5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 3: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_6_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_6_3:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 6: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_6_4-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_4:
	.word 0x91914013  ! 8: WRPR_PIL_R	wrpr	%r5, %r19, %pil
DS_6_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd711c007  ! 1: LDQF_R	-	[%r7, %r7], %f11
	.word 0x91a0c830  ! 9: FADDs	fadds	%f3, %f16, %f8
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x8790230b  ! 11: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
cwp_6_6:
    set user_data_start, %o7
	.word 0x93902001  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_6_7:
	set 0x60340000, %r31
	.word 0x85813136  ! 15: WRCCR_I	wr	%r4, 0x1136, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_8:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 16: RDPC	rd	%pc, %r12
splash_tba_6_9:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_6_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_6_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba0016b  ! 20: FABSq	dis not found

memptr_6_12:
	set user_data_start, %r31
	.word 0x85846c64  ! 21: WRCCR_I	wr	%r17, 0x0c64, %ccr
splash_cmpr_6_13:
	setx 0x1e78c747a966facc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_6_14:
    set user_data_start, %o7
	.word 0x93902001  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_6_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_6_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f30, %f12
	.word 0x91b4830a  ! 25: ALIGNADDRESS	alignaddr	%r18, %r10, %r8
	.word 0xa1902002  ! 26: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_6_17:
	taddcctv %r13, 0x1471, %r13
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x95a00165  ! 30: FABSq	dis not found

	.word 0x9ba00169  ! 31: FABSq	dis not found

	.word 0xe6cfe030  ! 32: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa3520000  ! 34: RDPR_PIL	rdpr	%pil, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_19)+56, 16, 16)) -> intp(6,1,3)
xir_6_19:
	.word 0xa980210b  ! 36: WR_SET_SOFTINT_I	wr	%r0, 0x010b, %set_softint
	.word 0xd0c00e80  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r8
	.word 0xa1902008  ! 38: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_6_20:
	setx 0x9c5fd0c82db55d73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_21:
	.word 0xa1a009d0  ! 1: FDIVd	fdivd	%f0, %f16, %f16
	allclean
	.word 0x9bb10310  ! 41: ALIGNADDRESS	alignaddr	%r4, %r16, %r13
debug_6_22:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_6_24:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 45: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_lsu_6_25:
	setx 0x065513c441c75bfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a189c1  ! 47: FDIVd	fdivd	%f6, %f32, %f16
DS_6_26:
	.word 0x95a209cc  ! 1: FDIVd	fdivd	%f8, %f12, %f10
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_6_27:
	nop
	setx 0xffffffc3fffff011, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8780208b  ! 50: WRASI_I	wr	%r0, 0x008b, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_28) + 48, 16, 16)) -> intp(4,0,14)
intvec_6_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 52: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d902eeb  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0eeb, %pstate
tagged_6_29:
	taddcctv %r17, 0x175a, %r8
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_6_30:
	tsubcctv %r1, 0x1cae, %r18
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 59: RDPC	rd	%pc, %r17
mondo_6_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d90c008  ! 60: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x879022b5  ! 61: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_6_33:
	set user_data_start, %r31
	.word 0x858263d2  ! 63: WRCCR_I	wr	%r9, 0x03d2, %ccr
cwp_6_34:
    set user_data_start, %o7
	.word 0x93902005  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa5a000c9  ! 66: FNEGd	fnegd	%f40, %f18
	.word 0xa1902007  ! 67: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a349c2  ! 71: FDIVd	fdivd	%f44, %f2, %f42
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_6_36:
	setx 0xe19a6e5f962c4209, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xdddcc0f4ae5d6dab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_39:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd08008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_6_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908008  ! 79: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x9f802cd4  ! 80: SIR	sir	0x0cd4
cwp_6_42:
    set user_data_start, %o7
	.word 0x93902001  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab848005  ! 82: WR_CLEAR_SOFTINT_R	wr	%r18, %r5, %clear_softint
splash_hpstate_6_43:
	.word 0x819820dd  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_6_45:
	setx 0x35242ae14e08ffc9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 86: Tcc_I	te	icc_or_xcc, %r0 + 180
debug_6_46:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x2489d35d26b64c65, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_48:
	.word 0x81982654  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0xad816e08  ! 90: WR_SOFTINT_REG_I	wr	%r5, 0x0e08, %softint
	.word 0x8790235a  ! 91: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_49:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 92: RDPC	rd	%pc, %r12
	.word 0xd2cfe020  ! 93: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x8d9029c3  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x09c3, %pstate
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
	.word 0xa1414000  ! 95: RDPC	rd	%pc, %r16
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196a  ! 97: FqTOd	dis not found

splash_cmpr_6_52:
	setx 0x319b90b2366e44ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_53:
	.word 0x8198248e  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
tagged_6_54:
	tsubcctv %r14, 0x10e9, %r13
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x357c031a0397f47c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 103: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x8d903327  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x1327, %pstate
	.word 0xd8cfe000  ! 105: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
splash_lsu_6_57:
	setx 0x88904a9b8f1132ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x8780204f  ! 108: WRASI_I	wr	%r0, 0x004f, %asi
debug_6_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_60:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 110: RDPC	rd	%pc, %r12
tagged_6_61:
	taddcctv %r4, 0x15af, %r13
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_6_62:
	setx 0x4ccf5a6af500f86c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_6_64:
	setx 0x3df52f958425a030, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_65:
	.word 0x8f902003  ! 117: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
memptr_6_66:
	set user_data_start, %r31
	.word 0x85806dfb  ! 118: WRCCR_I	wr	%r1, 0x0dfb, %ccr
memptr_6_67:
	set 0x60540000, %r31
	.word 0x8584302c  ! 119: WRCCR_I	wr	%r16, 0x102c, %ccr
	.word 0xa1902000  ! 120: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_6_68:
	setx 0x3491f60076986d22, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab848006  ! 122: WR_CLEAR_SOFTINT_R	wr	%r18, %r6, %clear_softint
	.word 0xa06cf130  ! 123: UDIVX_I	udivx 	%r19, 0xfffff130, %r16
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_6_69:
	setx 0x9e71cb09f04c6192, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_70) + 0, 16, 16)) -> intp(7,0,15)
intvec_6_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_71:
	setx 0x64dac37b9351446f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902325  ! 129: WRPR_TT_I	wrpr	%r0, 0x0325, %tt
	.word 0xa9a509d4  ! 130: FDIVd	fdivd	%f20, %f20, %f20
	.word 0xa6d37083  ! 131: UMULcc_I	umulcc 	%r13, 0xfffff083, %r19
change_to_randtl_6_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_72:
	.word 0x8f902002  ! 132: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_6_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_73:
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd0800ac0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0xd0cfe020  ! 135: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
splash_hpstate_6_74:
	.word 0x81982b96  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
	.word 0x87902155  ! 137: WRPR_TT_I	wrpr	%r0, 0x0155, %tt
	.word 0x87802014  ! 138: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902245  ! 139: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x93480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xd28008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_6_75:
	setx 0x759a7c4f06abfd6f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_76:
	.word 0x81982e06  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0xa190200c  ! 144: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8780208b  ! 145: WRASI_I	wr	%r0, 0x008b, %asi
tagged_6_77:
	taddcctv %r15, 0x11aa, %r18
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_6_78:
	setx 0x063fe38ff14f581f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_6_79:
	set 0x60340000, %r31
	.word 0x8584aa0b  ! 148: WRCCR_I	wr	%r18, 0x0a0b, %ccr
	.word 0xa1902001  ! 149: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd28008a0  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2800ac0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
tagged_6_80:
	tsubcctv %r2, 0x1f93, %r14
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd28008a0  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_6_81:
    set user_data_start, %o7
	.word 0x93902007  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800b20  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r9
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 159: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_6_82-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_82:
	.word 0x91930002  ! 160: WRPR_PIL_R	wrpr	%r12, %r2, %pil
cwp_6_83:
    set user_data_start, %o7
	.word 0x93902002  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_6_84:
	setx 0xd79c57e36a35a288, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_85:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 164: RDPC	rd	%pc, %r17
	.word 0x8780201c  ! 165: WRASI_I	wr	%r0, 0x001c, %asi
tagged_6_87:
	taddcctv %r7, 0x1919, %r22
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_6_88:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200b  ! 168: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x97480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_6_90:
	setx 0xe4bb0422bf28bdd6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01961  ! 174: FqTOd	dis not found

splash_cmpr_6_92:
	setx 0x7ca9b6bc739cb2c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_6_93:
	setx 0x1b28530e5ef681a2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe020  ! 178: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x91d020b5  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 181
	rd %pc, %r19
	add %r19, (ivw_6_94-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_94:
	.word 0x91904001  ! 180: WRPR_PIL_R	wrpr	%r1, %r1, %pil
	.word 0x87902293  ! 181: WRPR_TT_I	wrpr	%r0, 0x0293, %tt
intveclr_6_95:
	setx 0xc3efc770dc61d8c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_6_96:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93d02033  ! 184: Tcc_I	tne	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_97:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 185: RDPC	rd	%pc, %r12
splash_tba_6_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f803962  ! 187: SIR	sir	0x1962
memptr_6_99:
	set user_data_start, %r31
	.word 0x85817831  ! 188: WRCCR_I	wr	%r5, 0x1831, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x91d02032  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_6_100:
	setx 0xdd961c02b89085af, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0800c80  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa190200d  ! 194: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe0cfe000  ! 195: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
memptr_6_101:
	set 0x60340000, %r31
	.word 0x8580e9b6  ! 196: WRCCR_I	wr	%r3, 0x09b6, %ccr
	.word 0x9f802a19  ! 197: SIR	sir	0x0a19
intveclr_6_102:
	setx 0xb561f40c1342e0b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cf066  ! 199: SDIVX_I	sdivx	%r19, 0xfffff066, %r13
splash_lsu_6_104:
	setx 0x788227f6ad7990e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 201: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_6_105:
	setx 0x6c7dcdcd5fed96fd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_6_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3582f95	! Random illegal ?
	.word 0xe3130005  ! 1: LDQF_R	-	[%r12, %r5], %f17
	.word 0xa3a04825  ! 204: FADDs	fadds	%f1, %f5, %f17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01970  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_6_108:
	.word 0xa3a109c9  ! 1: FDIVd	fdivd	%f4, %f40, %f48
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_6_109:
	nop
	setx 0xfffff810fffff201, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b5  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d90330a  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x130a, %pstate
	.word 0x93d02032  ! 211: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xe8dfe010  ! 212: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0xe8c004a0  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
DS_6_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f12, %f14
	.word 0x97b4430b  ! 214: ALIGNADDRESS	alignaddr	%r17, %r11, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_6_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb34307  ! 216: ALIGNADDRESS	alignaddr	%r13, %r7, %r13
splash_hpstate_6_112:
	.word 0x81982d95  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_6_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x87902008  ! 222: WRPR_TT_I	wrpr	%r0, 0x0008, %tt
tagged_6_114:
	tsubcctv %r12, 0x1992, %r25
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x91d02032  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902247  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x0247, %pstate
splash_lsu_6_115:
	setx 0x3c0c5baad54ab59d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_116:
	setx 0xe395dd28fbd5ff8a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802016  ! 228: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02034  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_6_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d900009  ! 230: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c331a  ! 231: SDIVX_I	sdivx	%r16, 0xfffff31a, %r9
	.word 0x97a00173  ! 232: FABSq	dis not found

memptr_6_119:
	set 0x60540000, %r31
	.word 0x85842a66  ! 233: WRCCR_I	wr	%r16, 0x0a66, %ccr
	.word 0xa190200d  ! 234: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa169fa89  ! 235: SDIVX_I	sdivx	%r7, 0xfffffa89, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_121:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 236: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e030  ! 238: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
	.word 0x97520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x879020b5  ! 240: WRPR_TT_I	wrpr	%r0, 0x00b5, %tt
	.word 0x9a690007  ! 241: UDIVX_R	udivx 	%r4, %r7, %r13
debug_6_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_123:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_124:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 244: RDPC	rd	%pc, %r17
debug_6_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b743f  ! 246: SDIVX_I	sdivx	%r13, 0xfffff43f, %r9
mondo_6_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94000a  ! 247: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
change_to_randtl_6_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_128:
	.word 0x8f902002  ! 248: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_6_129:
	setx 0xd309f61bfa691304, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_130) + 40, 16, 16)) -> intp(1,0,29)
intvec_6_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 253: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	rd %pc, %r19
	add %r19, (ivw_6_131-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_131:
	.word 0x91934006  ! 254: WRPR_PIL_R	wrpr	%r13, %r6, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d9024cc  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x04cc, %pstate
	.word 0x99902000  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e010  ! 259: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
tagged_6_132:
	tsubcctv %r1, 0x1911, %r19
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_6_133:
	.word 0x81982657  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0657, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 262: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xab804005  ! 263: WR_CLEAR_SOFTINT_R	wr	%r1, %r5, %clear_softint
splash_lsu_6_134:
	setx 0x980266ff177dd219, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_135:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 265: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_cmpr_6_136:
	setx 0x03a1cfa860bea658, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b5  ! 267: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_6_137:
	setx 0xd131d2496d962225, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe010  ! 271: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x9f802942  ! 272: SIR	sir	0x0942
	.word 0x95a00549  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_6_138-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_138:
	.word 0x91904010  ! 276: WRPR_PIL_R	wrpr	%r1, %r16, %pil
	.word 0x95a24dca  ! 277: FdMULq	fdmulq	
debug_6_139:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x9ba1c9d2  ! 280: FDIVd	fdivd	%f38, %f18, %f44
splash_tba_6_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902006  ! 282: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9f8020ae  ! 283: SIR	sir	0x00ae
intveclr_6_141:
	setx 0xa53f06f214e2fb2f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902837  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0837, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01972  ! 287: FqTOd	dis not found

	.word 0xd0800ac0  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0xd0c7e030  ! 289: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	setx 0xef14afdac2264af2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
debug_6_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_146) + 32, 16, 16)) -> intp(3,0,5)
intvec_6_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_147:
	.word 0x8f902003  ! 294: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_6_149:
	setx 0xd0d16402564718a9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_150:
	setx 0x9b5b80b0456ea359, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_151:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x95a000c7  ! 302: FNEGd	fnegd	%f38, %f10
splash_tba_6_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_6_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d924003  ! 304: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	.word 0xe4c004a0  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 306: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe4880e80  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
tagged_6_154:
	tsubcctv %r9, 0x115f, %r1
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x97500000  ! 310: RDPR_TPC	rdpr	%tpc, %r11
splash_lsu_6_155:
	setx 0xf93d425e74bb01bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_156:
	set user_data_start, %r31
	.word 0x8582a9d2  ! 312: WRCCR_I	wr	%r10, 0x09d2, %ccr
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
	.word 0x9b414000  ! 313: RDPC	rd	%pc, %r13
debug_6_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_159:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 315: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
intveclr_6_160:
	setx 0x99d1eace55cc3aaf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_6_161:
	taddcctv %r1, 0x16d7, %r12
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_6_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_6_163:
	setx 0xe11000d0302d93c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 320: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x99902002  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa970219d  ! 322: POPC_I	popc	0x019d, %r20
change_to_randtl_6_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_165:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_6_166:
	setx 0x38ab7ffc57c57503, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00164  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x91d02033  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9023df  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x03df, %pstate
splash_cmpr_6_167:
	setx 0x36defb1a5876ea62, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_6_168:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_6_169:
	taddcctv %r25, 0x16cb, %r23
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd29004a0  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
splash_cmpr_6_170:
	setx 0xbcf1cf284cbbafd4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x91500000  ! 338: RDPR_TPC	rdpr	%tpc, %r8
splash_tba_6_171:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_6_172:
	tsubcctv %r14, 0x199a, %r25
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_6_173:
    set user_data_start, %o7
	.word 0x93902003  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
change_to_randtl_6_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_174:
	.word 0x8f902000  ! 344: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902007  ! 346: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_6_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xe1e5b510ee854b2c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9345c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_178) + 0, 16, 16)) -> intp(7,0,13)
intvec_6_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a00172  ! 351: FABSq	dis not found

splash_hpstate_6_179:
	.word 0x81982bcc  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
tagged_6_180:
	tsubcctv %r17, 0x1b92, %r12
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f8030ad  ! 354: SIR	sir	0x10ad
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_6_181:
	setx 0xf5e35ae366c7fa7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_6_184:
	.word 0x99a489c3  ! 1: FDIVd	fdivd	%f18, %f34, %f12
	.word 0xe730f245  ! 1: STQF_I	-	%f19, [0x1245, %r3]
	normalw
	.word 0x9b458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x95464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_6_185:
	nop
	setx 0xfffff767fffff4c2, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_6_186:
    set user_data_start, %o7
	.word 0x93902001  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_6_187:
	.word 0x81982187  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
debug_6_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01971  ! 369: FqTOd	dis not found

intveclr_6_190:
	setx 0x904826f827290b59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9848010  ! 371: WR_SET_SOFTINT_R	wr	%r18, %r16, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_6_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9083000a  ! 374: ADDcc_R	addcc 	%r12, %r10, %r8
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 375: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_6_192:
	tsubcctv %r23, 0x1136, %r20
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d804a0  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
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
	.word 0x9b414000  ! 381: RDPC	rd	%pc, %r13
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_6_194:
	setx 0x2758138a2502f4dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802010  ! 385: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802058  ! 386: WRASI_I	wr	%r0, 0x0058, %asi
memptr_6_195:
	set user_data_start, %r31
	.word 0x8581a66e  ! 387: WRCCR_I	wr	%r6, 0x066e, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_6_196:
	setx 0xd123942b6ec43a37, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd73421f2  ! 1: STQF_I	-	%f11, [0x01f2, %r16]
	normalw
	.word 0x97458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902005  ! 391: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9f803507  ! 392: SIR	sir	0x1507
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_6_198:
	setx 0x9cb630fd83520872, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_6_199:
	set 0x60540000, %r31
	.word 0x85816888  ! 396: WRCCR_I	wr	%r5, 0x0888, %ccr
tagged_6_200:
	tsubcctv %r2, 0x1dc8, %r21
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_6_201:
	setx 0x1a1505283c173f25, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a509d1  ! 399: FDIVd	fdivd	%f20, %f48, %f12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 400: RDPC	rd	%pc, %r16
	setx 0x808742c6c77a26a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_6_204:
    set user_data_start, %o7
	.word 0x93902004  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd0d804a0  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xab800001  ! 404: WR_CLEAR_SOFTINT_R	wr	%r0, %r1, %clear_softint
DS_6_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7334008  ! 1: STQF_R	-	%f19, [%r8, %r13]
	normalw
	.word 0x91458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r8
memptr_6_206:
	set 0x60140000, %r31
	.word 0x8584ffa0  ! 406: WRCCR_I	wr	%r19, 0x1fa0, %ccr
debug_6_207:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 407: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
	.word 0xa1902005  ! 408: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_6_208:
	.word 0x8198294f  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	rd %pc, %r19
	add %r19, (ivw_6_209-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_209:
	.word 0x91948007  ! 411: WRPR_PIL_R	wrpr	%r18, %r7, %pil
	.word 0xe08fe030  ! 412: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_210) + 56, 16, 16)) -> intp(4,0,8)
intvec_6_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90230c  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x030c, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023cd  ! 416: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
memptr_6_211:
	set 0x60540000, %r31
	.word 0x8584200f  ! 417: WRCCR_I	wr	%r16, 0x000f, %ccr
	.word 0x91d02033  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_6_212:
	.word 0x81982844  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
donret_6_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_213-donret_6_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe08008a0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0c7e020  ! 422: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
memptr_6_214:
	set 0x60540000, %r31
	.word 0x8580f5ce  ! 423: WRCCR_I	wr	%r3, 0x15ce, %ccr
intveclr_6_215:
	setx 0xb6d0696f53a1bf49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x92fa0004  ! 425: SDIVcc_R	sdivcc 	%r8, %r4, %r9
	.word 0xd0d00e40  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
DS_6_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_6_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d90347c  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x147c, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd08008a0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_218) + 32, 16, 16)) -> intp(7,0,4)
intvec_6_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01969  ! 434: FqTOd	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe010  ! 436: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
	.word 0xa750c000  ! 437: RDPR_TT	rdpr	%tt, %r19
DS_6_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_6_222:
    set user_data_start, %o7
	.word 0x93902005  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d020b5  ! 440: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_6_223:
	setx 0x9f554cb098f68633, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90395f  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x195f, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_224:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 443: RDPC	rd	%pc, %r11
	.word 0x8d802004  ! 444: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_6_225:
	setx 0x986ce688496eda02, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 446: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
memptr_6_227:
	set 0x60540000, %r31
	.word 0x8581f097  ! 447: WRCCR_I	wr	%r7, 0x1097, %ccr
	.word 0x93a0016b  ! 448: FABSq	dis not found

mondo_6_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90000d  ! 449: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
splash_cmpr_6_229:
	setx 0x2b20eae854408e7c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87802004  ! 453: WRASI_I	wr	%r0, 0x0004, %asi
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_230:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 454: RDPC	rd	%pc, %r9
	setx 0x29c2977fcab136a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_6_232:
	setx 0x16c8c2f0af2cf6f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab80400a  ! 457: WR_CLEAR_SOFTINT_R	wr	%r1, %r10, %clear_softint
	.word 0x879022ae  ! 458: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
	.word 0xd6c80e40  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
splash_cmpr_6_233:
	setx 0xa35f56a6ca1b9fb3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9145c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x87902130  ! 462: WRPR_TT_I	wrpr	%r0, 0x0130, %tt
	.word 0x91d020b5  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x99902001  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_6_234:
	setx 0x0542503a3a99253c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f12, %f6
	.word 0x9bb4430c  ! 466: ALIGNADDRESS	alignaddr	%r17, %r12, %r13
	.word 0x87802004  ! 467: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d020b5  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 181
memptr_6_236:
	set 0x60540000, %r31
	.word 0x8584fec7  ! 469: WRCCR_I	wr	%r19, 0x1ec7, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_6_237:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 471: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
pmu_6_238:
	nop
	setx 0xfffff427fffff6db, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_239:
	setx 0xfb33d1a08c8aeda5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 474: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_240:
	setx 0x18c72a93501faf90, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_6_241:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_6_243:
	setx 0xc6192518551ab4bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_244:
	.word 0x81982847  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0847, %hpstate
	.word 0xe6d7e000  ! 483: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
splash_cmpr_6_245:
	setx 0x83910fc6f9ed493c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_246:
	tsubcctv %r8, 0x18b1, %r17
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_6_247:
	setx 0x1d28466df9bee954, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_248) + 0, 16, 16)) -> intp(0,0,16)
intvec_6_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a0cd26  ! 489: FsMULd	fsmuld	%f3, %f6, %f16
splash_tba_6_249:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_6_250:
	setx 0x8b362f507cab5077, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_6_251:
    set user_data_start, %o7
	.word 0x93902001  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902201  ! 493: WRPR_TT_I	wrpr	%r0, 0x0201, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 494: FqTOd	dis not found

splash_cmpr_6_253:
	setx 0x67f7b75eadf0dd87, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_254) + 0, 16, 16)) -> intp(4,0,6)
intvec_6_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_6_255:
	.word 0x81982e47  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
DS_6_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
memptr_5_0:
	set user_data_start, %r31
	.word 0x8582a879  ! 1: WRCCR_I	wr	%r10, 0x0879, %ccr
splash_lsu_5_1:
	setx 0x701230543a9c486b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 3: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_5_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_5_3:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_5_4-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_4:
	.word 0x91940005  ! 8: WRPR_PIL_R	wrpr	%r16, %r5, %pil
DS_5_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe514400d  ! 1: LDQF_R	-	[%r17, %r13], %f18
	.word 0x99a28830  ! 9: FADDs	fadds	%f10, %f16, %f12
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x87902218  ! 11: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
cwp_5_6:
    set user_data_start, %o7
	.word 0x93902007  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_5_7:
	set 0x60340000, %r31
	.word 0x8580f051  ! 15: WRCCR_I	wr	%r3, 0x1051, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_8:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 16: RDPC	rd	%pc, %r16
splash_tba_5_9:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_5_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_5_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3a00172  ! 20: FABSq	dis not found

memptr_5_12:
	set user_data_start, %r31
	.word 0x858471d3  ! 21: WRCCR_I	wr	%r17, 0x11d3, %ccr
splash_cmpr_5_13:
	setx 0xb915577846d527e3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_5_14:
    set user_data_start, %o7
	.word 0x93902000  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_5_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
DS_5_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f22, %f16
	.word 0x93b24302  ! 25: ALIGNADDRESS	alignaddr	%r9, %r2, %r9
	.word 0xa1902006  ! 26: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_5_17:
	taddcctv %r25, 0x10ff, %r26
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x95a0016a  ! 30: FABSq	dis not found

	.word 0x95a00163  ! 31: FABSq	dis not found

	.word 0xe6cfe010  ! 32: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01969  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_19)+24, 16, 16)) -> intp(5,1,3)
xir_5_19:
	.word 0xa98525a2  ! 36: WR_SET_SOFTINT_I	wr	%r20, 0x05a2, %set_softint
	.word 0xd0c004a0  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa190200f  ! 38: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_5_20:
	setx 0x93e0a89c2bfd80a9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_21:
	.word 0x97a2c9cb  ! 1: FDIVd	fdivd	%f42, %f42, %f42
	allclean
	.word 0x91b0830a  ! 41: ALIGNADDRESS	alignaddr	%r2, %r10, %r8
debug_5_22:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_5_24:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 45: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_lsu_5_25:
	setx 0x454dcac5d50faded, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a349d0  ! 47: FDIVd	fdivd	%f44, %f16, %f10
DS_5_26:
	.word 0x9ba4c9c6  ! 1: FDIVd	fdivd	%f50, %f6, %f44
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_5_27:
	nop
	setx 0xfffff9c1fffff66c, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802020  ! 50: WRASI_I	wr	%r0, 0x0020, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_28) + 48, 16, 16)) -> intp(4,0,30)
intvec_5_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 52: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d902baa  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0baa, %pstate
tagged_5_29:
	taddcctv %r22, 0x1dd8, %r24
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_5_30:
	tsubcctv %r25, 0x11de, %r20
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d020b2  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_31:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 59: RDPC	rd	%pc, %r12
mondo_5_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d908001  ! 60: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0x879022cf  ! 61: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_5_33:
	set user_data_start, %r31
	.word 0x8581e92b  ! 63: WRCCR_I	wr	%r7, 0x092b, %ccr
cwp_5_34:
    set user_data_start, %o7
	.word 0x93902007  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa3a000c0  ! 66: FNEGd	fnegd	%f0, %f48
	.word 0xa1902001  ! 67: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a509d2  ! 71: FDIVd	fdivd	%f20, %f18, %f10
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_5_36:
	setx 0xbd463fcfb88546e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x7ea9dc8ebf732312, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_39:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd0800bc0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_5_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d918012  ! 79: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0x9f803e6e  ! 80: SIR	sir	0x1e6e
cwp_5_42:
    set user_data_start, %o7
	.word 0x93902000  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xab81c003  ! 82: WR_CLEAR_SOFTINT_R	wr	%r7, %r3, %clear_softint
splash_hpstate_5_43:
	.word 0x81982d07  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_5_45:
	setx 0xf0f1c8f434319b1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_5_46:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x4f72ed9b0fbd1583, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_48:
	.word 0x81982305  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0305, %hpstate
	.word 0xad8263ea  ! 90: WR_SOFTINT_REG_I	wr	%r9, 0x03ea, %softint
	.word 0x87902013  ! 91: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_49:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 92: RDPC	rd	%pc, %r9
	.word 0xd2cfe020  ! 93: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x8d902b0e  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x0b0e, %pstate
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
	.word 0x99414000  ! 95: RDPC	rd	%pc, %r12
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01965  ! 97: FqTOd	dis not found

splash_cmpr_5_52:
	setx 0x722e13f34b6b8472, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_53:
	.word 0x8198244c  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044c, %hpstate
tagged_5_54:
	tsubcctv %r24, 0x1ca6, %r9
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 101: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x7f3e56d2a18c289b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d944006  ! 103: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x8d902ec9  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0xd8cfe010  ! 105: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
splash_lsu_5_57:
	setx 0x54a3480053717a17, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802080  ! 108: WRASI_I	wr	%r0, 0x0080, %asi
debug_5_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_60:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 110: RDPC	rd	%pc, %r10
tagged_5_61:
	taddcctv %r3, 0x167b, %r4
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_5_62:
	setx 0xf80758b00d3266d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01964  ! 114: FqTOd	dis not found

	.word 0xd4900e60  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x73, %r10
intveclr_5_64:
	setx 0x57fead77a9ea8f51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_65:
	.word 0x8f902002  ! 117: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_5_66:
	set user_data_start, %r31
	.word 0x85846330  ! 118: WRCCR_I	wr	%r17, 0x0330, %ccr
memptr_5_67:
	set 0x60540000, %r31
	.word 0x85843983  ! 119: WRCCR_I	wr	%r16, 0x1983, %ccr
	.word 0xa1902001  ! 120: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_5_68:
	setx 0x3895469b011e56e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab808000  ! 122: WR_CLEAR_SOFTINT_R	wr	%r2, %r0, %clear_softint
	.word 0x9269bfcc  ! 123: UDIVX_I	udivx 	%r6, 0xffffffcc, %r9
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_5_69:
	setx 0xb9a928986ddcce7b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_70) + 56, 16, 16)) -> intp(5,0,0)
intvec_5_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_71:
	setx 0xe02068a40748a1c2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x879023f2  ! 129: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0x99a409c1  ! 130: FDIVd	fdivd	%f16, %f32, %f12
	.word 0xa8d2f262  ! 131: UMULcc_I	umulcc 	%r11, 0xfffff262, %r20
change_to_randtl_5_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_72:
	.word 0x8f902001  ! 132: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_5_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_73:
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0cfe020  ! 135: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
splash_hpstate_5_74:
	.word 0x81982d05  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x8790204a  ! 137: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
	.word 0x87802055  ! 138: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8790214c  ! 139: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	.word 0x97480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd28008a0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_5_75:
	setx 0xa5bdee0d7d5180d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_76:
	.word 0x81982a15  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
	.word 0xa1902007  ! 144: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802088  ! 145: WRASI_I	wr	%r0, 0x0088, %asi
tagged_5_77:
	taddcctv %r15, 0x1eb7, %r25
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_5_78:
	setx 0xeb41ffc22de8ed3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_5_79:
	set 0x60340000, %r31
	.word 0x85847b32  ! 148: WRCCR_I	wr	%r17, 0x1b32, %ccr
	.word 0xa1902006  ! 149: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd2800c60  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	.word 0xd28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_5_80:
	tsubcctv %r16, 0x1cfb, %r10
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd2800c00  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_5_81:
    set user_data_start, %o7
	.word 0x93902001  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd28008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 159: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_5_82-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_82:
	.word 0x91904012  ! 160: WRPR_PIL_R	wrpr	%r1, %r18, %pil
cwp_5_83:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_5_84:
	setx 0x0f9233b209697980, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_85:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_86:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 164: RDPC	rd	%pc, %r12
	.word 0x87802004  ! 165: WRASI_I	wr	%r0, 0x0004, %asi
tagged_5_87:
	taddcctv %r9, 0x19e4, %r2
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_5_88:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902003  ! 168: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x95480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_5_90:
	setx 0x9b4acd985d16d851, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01964  ! 174: FqTOd	dis not found

splash_cmpr_5_92:
	setx 0x2e2694ef768fc20e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_5_93:
	setx 0x0c35c119825c8b4f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe010  ! 178: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x83d02032  ! 179: Tcc_I	te	icc_or_xcc, %r0 + 50
	rd %pc, %r19
	add %r19, (ivw_5_94-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_94:
	.word 0x9192c00d  ! 180: WRPR_PIL_R	wrpr	%r11, %r13, %pil
	.word 0x879022f2  ! 181: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
intveclr_5_95:
	setx 0xb7c8b7cdff09c381, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_5_96:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02032  ! 184: Tcc_I	te	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_97:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 185: RDPC	rd	%pc, %r12
splash_tba_5_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f8038eb  ! 187: SIR	sir	0x18eb
memptr_5_99:
	set user_data_start, %r31
	.word 0x858437cf  ! 188: WRCCR_I	wr	%r16, 0x17cf, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x91d020b5  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_5_100:
	setx 0x6e7602f97145b03e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe08008a0  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa1902000  ! 194: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe0cfe000  ! 195: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
memptr_5_101:
	set 0x60140000, %r31
	.word 0x8584eadf  ! 196: WRCCR_I	wr	%r19, 0x0adf, %ccr
	.word 0x9f80337d  ! 197: SIR	sir	0x137d
intveclr_5_102:
	setx 0x96774a54483151c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c75e7  ! 199: SDIVX_I	sdivx	%r17, 0xfffff5e7, %r11
splash_lsu_5_104:
	setx 0x73e313f0b2afc2c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 201: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_5_105:
	setx 0x2ae7f8b1c0416c91, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_5_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbb7e5693	! Random illegal ?
	.word 0xd314c006  ! 1: LDQF_R	-	[%r19, %r6], %f9
	.word 0xa5a2c830  ! 204: FADDs	fadds	%f11, %f16, %f18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01968  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_5_108:
	.word 0xa5a509d3  ! 1: FDIVd	fdivd	%f20, %f50, %f18
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_5_109:
	nop
	setx 0xfffff19efffff520, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02034  ! 209: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d9027c7  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x07c7, %pstate
	.word 0x93d020b5  ! 211: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xe8dfe020  ! 212: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xe8c00e40  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r20
DS_5_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f22, %f6
	.word 0x93b30311  ! 214: ALIGNADDRESS	alignaddr	%r12, %r17, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_5_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb14309  ! 216: ALIGNADDRESS	alignaddr	%r5, %r9, %r13
splash_hpstate_5_112:
	.word 0x819825d6  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d6, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_5_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x8790224a  ! 222: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
tagged_5_114:
	tsubcctv %r5, 0x185f, %r22
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x91d020b5  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d902eca  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x0eca, %pstate
splash_lsu_5_115:
	setx 0xd380cd90f6151c37, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_116:
	setx 0x6f1c8c1ef6a634b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 228: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x83d02032  ! 229: Tcc_I	te	icc_or_xcc, %r0 + 50
mondo_5_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 230: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c62ea  ! 231: SDIVX_I	sdivx	%r17, 0x02ea, %r20
	.word 0xa7a00166  ! 232: FABSq	dis not found

memptr_5_119:
	set 0x60540000, %r31
	.word 0x85846011  ! 233: WRCCR_I	wr	%r17, 0x0011, %ccr
	.word 0xa190200e  ! 234: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1687c0f  ! 235: SDIVX_I	sdivx	%r1, 0xfffffc0f, %r16
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 236: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e010  ! 238: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x99520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x879020d6  ! 240: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0x946cc00d  ! 241: UDIVX_R	udivx 	%r19, %r13, %r10
debug_5_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_123:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_124:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 244: RDPC	rd	%pc, %r8
debug_5_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976c738a  ! 246: SDIVX_I	sdivx	%r17, 0xfffff38a, %r11
mondo_5_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 247: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
change_to_randtl_5_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_128:
	.word 0x8f902002  ! 248: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 249: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_5_129:
	setx 0xae96b62b344731ee, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_130) + 8, 16, 16)) -> intp(2,0,26)
intvec_5_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 253: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	rd %pc, %r19
	add %r19, (ivw_5_131-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_131:
	.word 0x9194c010  ! 254: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d903c7c  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1c7c, %pstate
	.word 0x99902002  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e010  ! 259: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
tagged_5_132:
	tsubcctv %r22, 0x12e7, %r18
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_5_133:
	.word 0x81982906  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0906, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab850010  ! 263: WR_CLEAR_SOFTINT_R	wr	%r20, %r16, %clear_softint
splash_lsu_5_134:
	setx 0x6d917ec84b4f14fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_135:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 265: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_cmpr_5_136:
	setx 0x58466ea45729d027, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b2  ! 267: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_5_137:
	setx 0xd979743e04c13681, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe010  ! 271: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x9f802006  ! 272: SIR	sir	0x0006
	.word 0xa7a0054c  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_5_138-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_138:
	.word 0x9194800a  ! 276: WRPR_PIL_R	wrpr	%r18, %r10, %pil
	.word 0xa5a1cdc4  ! 277: FdMULq	fdmulq	
debug_5_139:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0xa7a249cc  ! 280: FDIVd	fdivd	%f40, %f12, %f50
splash_tba_5_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902003  ! 282: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802976  ! 283: SIR	sir	0x0976
intveclr_5_141:
	setx 0x3d597f8821a6d50c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026c2  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x06c2, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01972  ! 287: FqTOd	dis not found

	.word 0xd08008a0  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c7e030  ! 289: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	setx 0xebea02eec60f059d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
debug_5_145:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_146) + 32, 16, 16)) -> intp(7,0,1)
intvec_5_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_147:
	.word 0x8f902001  ! 294: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_5_149:
	setx 0x81a0de4c592d5ff7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_150:
	setx 0xf1d3687e6b87e163, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_151:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x95a000c0  ! 302: FNEGd	fnegd	%f0, %f10
splash_tba_5_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_5_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 304: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xe4c004a0  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe48804a0  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
tagged_5_154:
	tsubcctv %r14, 0x1ba1, %r20
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0xa9500000  ! 310: RDPR_TPC	rdpr	%tpc, %r20
splash_lsu_5_155:
	setx 0x077609997789fd2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_156:
	set user_data_start, %r31
	.word 0x8580e806  ! 312: WRCCR_I	wr	%r3, 0x0806, %ccr
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
	.word 0x99414000  ! 313: RDPC	rd	%pc, %r12
debug_5_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_159:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 315: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
intveclr_5_160:
	setx 0xfddd815180e6fb2f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_5_161:
	taddcctv %r5, 0x1cd7, %r22
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_5_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_5_163:
	setx 0x46eb8e9eb8051fd7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d908013  ! 320: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x99902000  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x91702c75  ! 322: POPC_I	popc	0x0c75, %r8
change_to_randtl_5_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_165:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_5_166:
	setx 0x8003da976925b391, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a00174  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x93d02032  ! 328: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d9022b7  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x02b7, %pstate
splash_cmpr_5_167:
	setx 0xfd327dd97660a5b2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_5_168:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_5_169:
	taddcctv %r24, 0x1ea3, %r3
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e60  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x73, %r9
splash_cmpr_5_170:
	setx 0x47b47f305459e50c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x97500000  ! 338: RDPR_TPC	rdpr	%tpc, %r11
splash_tba_5_171:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_5_172:
	tsubcctv %r8, 0x1b91, %r21
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_5_173:
    set user_data_start, %o7
	.word 0x93902007  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
change_to_randtl_5_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_174:
	.word 0x8f902000  ! 344: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902008  ! 346: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_tba_5_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x97a8a472a6468cfb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9945c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_178) + 56, 16, 16)) -> intp(1,0,13)
intvec_5_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00160  ! 351: FABSq	dis not found

splash_hpstate_5_179:
	.word 0x819828d4  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
tagged_5_180:
	tsubcctv %r20, 0x14eb, %r19
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f802d78  ! 354: SIR	sir	0x0d78
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_5_181:
	setx 0x9ffbbf50a7639305, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_5_184:
	.word 0xa1a189cb  ! 1: FDIVd	fdivd	%f6, %f42, %f16
	.word 0xd33069c2  ! 1: STQF_I	-	%f9, [0x09c2, %r1]
	normalw
	.word 0x95458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xa3464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0xd8900e40  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
pmu_5_185:
	nop
	setx 0xfffff2d5fffff211, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_5_186:
    set user_data_start, %o7
	.word 0x93902001  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_5_187:
	.word 0x81982e47  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
debug_5_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01968  ! 369: FqTOd	dis not found

intveclr_5_190:
	setx 0x46f88e3b8bcf2afc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9800010  ! 371: WR_SET_SOFTINT_R	wr	%r0, %r16, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_5_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x90808004  ! 374: ADDcc_R	addcc 	%r2, %r4, %r8
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 375: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_5_192:
	tsubcctv %r10, 0x1bc6, %r17
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d804a0  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
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
	.word 0x99414000  ! 381: RDPC	rd	%pc, %r12
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_5_194:
	setx 0x375b88f08e11ecfe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802089  ! 385: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8780208b  ! 386: WRASI_I	wr	%r0, 0x008b, %asi
memptr_5_195:
	set user_data_start, %r31
	.word 0x858330b9  ! 387: WRCCR_I	wr	%r12, 0x10b9, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_5_196:
	setx 0x77ba33af4249d697, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe1316af2  ! 1: STQF_I	-	%f16, [0x0af2, %r5]
	normalw
	.word 0xa9458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xa190200c  ! 391: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9f803a07  ! 392: SIR	sir	0x1a07
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_5_198:
	setx 0x5d8e8f004395b962, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 395: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_5_199:
	set 0x60340000, %r31
	.word 0x858331ae  ! 396: WRCCR_I	wr	%r12, 0x11ae, %ccr
tagged_5_200:
	tsubcctv %r5, 0x1088, %r22
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_5_201:
	setx 0x0686b9193380fbff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a489c7  ! 399: FDIVd	fdivd	%f18, %f38, %f8
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 400: RDPC	rd	%pc, %r19
	setx 0xcd910fdf9b23617f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_5_204:
    set user_data_start, %o7
	.word 0x93902002  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd0d804a0  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xab804008  ! 404: WR_CLEAR_SOFTINT_R	wr	%r1, %r8, %clear_softint
DS_5_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5344012  ! 1: STQF_R	-	%f10, [%r18, %r17]
	normalw
	.word 0xa3458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r17
memptr_5_206:
	set 0x60540000, %r31
	.word 0x85807df2  ! 406: WRCCR_I	wr	%r1, 0x1df2, %ccr
debug_5_207:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 407: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa1902004  ! 408: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_5_208:
	.word 0x8198291c  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091c, %hpstate
	rd %pc, %r19
	add %r19, (ivw_5_209-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_209:
	.word 0x9194000a  ! 411: WRPR_PIL_R	wrpr	%r16, %r10, %pil
	.word 0xe08fe000  ! 412: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_210) + 32, 16, 16)) -> intp(0,0,31)
intvec_5_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026ea  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x06ea, %pstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 415: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020e3  ! 416: WRPR_TT_I	wrpr	%r0, 0x00e3, %tt
memptr_5_211:
	set 0x60340000, %r31
	.word 0x8580ae56  ! 417: WRCCR_I	wr	%r2, 0x0e56, %ccr
	.word 0x83d020b3  ! 418: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_hpstate_5_212:
	.word 0x8198288f  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088f, %hpstate
donret_5_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_213-donret_5_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe08008a0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0c7e000  ! 422: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
memptr_5_214:
	set 0x60740000, %r31
	.word 0x8584be50  ! 423: WRCCR_I	wr	%r18, 0x1e50, %ccr
intveclr_5_215:
	setx 0x90bbaffdce0c49a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x96fb400d  ! 425: SDIVcc_R	sdivcc 	%r13, %r13, %r11
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_5_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_5_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d902263  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x0263, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd0800c60  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_218) + 56, 16, 16)) -> intp(5,0,23)
intvec_5_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196d  ! 434: FqTOd	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe020  ! 436: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0x9150c000  ! 437: RDPR_TT	<illegal instruction>
DS_5_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_5_222:
    set user_data_start, %o7
	.word 0x93902003  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d020b4  ! 440: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_cmpr_5_223:
	setx 0x80a78173e1c8797b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903297  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x1297, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_224:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 443: RDPC	rd	%pc, %r17
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_5_225:
	setx 0x7779b41612a23b46, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d944003  ! 446: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
memptr_5_227:
	set 0x60340000, %r31
	.word 0x8580378a  ! 447: WRCCR_I	wr	%r0, 0x178a, %ccr
	.word 0x93a00164  ! 448: FABSq	dis not found

mondo_5_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d944009  ! 449: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
splash_cmpr_5_229:
	setx 0xb891fec5fb080bdf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8780201c  ! 453: WRASI_I	wr	%r0, 0x001c, %asi
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_230:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 454: RDPC	rd	%pc, %r12
	setx 0x266980826eeb1e08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_5_232:
	setx 0xedf551fe477012f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab81000c  ! 457: WR_CLEAR_SOFTINT_R	wr	%r4, %r12, %clear_softint
	.word 0x87902342  ! 458: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
	.word 0xd6c804a0  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_cmpr_5_233:
	setx 0xd9016ab1cb2df694, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa945c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x87902248  ! 462: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
	.word 0x91d02035  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99902001  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_5_234:
	setx 0x641f834f7106a44a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f2, %f2
	.word 0x97b4430d  ! 466: ALIGNADDRESS	alignaddr	%r17, %r13, %r11
	.word 0x87802089  ! 467: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02034  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_5_236:
	set 0x60140000, %r31
	.word 0x85817fd9  ! 469: WRCCR_I	wr	%r5, 0x1fd9, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_5_237:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 471: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
pmu_5_238:
	nop
	setx 0xfffff400fffffd92, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_239:
	setx 0x2c502608f3153549, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_240:
	setx 0x60401da2ca4ee039, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_5_241:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_5_243:
	setx 0x3432ffab482c89e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_244:
	.word 0x81982144  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
	.word 0xe6d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_cmpr_5_245:
	setx 0x4d26c0508a4ff44d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_246:
	tsubcctv %r2, 0x155b, %r11
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c00e40  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r19
intveclr_5_247:
	setx 0x3d7c56cd2582f364, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_248) + 32, 16, 16)) -> intp(7,0,27)
intvec_5_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a24d24  ! 489: FsMULd	fsmuld	%f9, %f4, %f8
splash_tba_5_249:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_5_250:
	setx 0xd6a4548976bec711, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_5_251:
    set user_data_start, %o7
	.word 0x93902002  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902319  ! 493: WRPR_TT_I	wrpr	%r0, 0x0319, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196c  ! 494: FqTOd	dis not found

splash_cmpr_5_253:
	setx 0xb089bf91f87ebbb1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_254) + 56, 16, 16)) -> intp(0,0,13)
intvec_5_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_5_255:
	.word 0x81982487  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
DS_5_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
memptr_4_0:
	set user_data_start, %r31
	.word 0x85823bf6  ! 1: WRCCR_I	wr	%r8, 0x1bf6, %ccr
splash_lsu_4_1:
	setx 0x6b20350f2576e56d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 3: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
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
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_4_4-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_4:
	.word 0x91924009  ! 8: WRPR_PIL_R	wrpr	%r9, %r9, %pil
DS_4_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb100013  ! 1: LDQF_R	-	[%r0, %r19], %f13
	.word 0xa1a1c830  ! 9: FADDs	fadds	%f7, %f16, %f16
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x8790235f  ! 11: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
cwp_4_6:
    set user_data_start, %o7
	.word 0x93902006  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_4_7:
	set 0x60540000, %r31
	.word 0x8581faf5  ! 15: WRCCR_I	wr	%r7, 0x1af5, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_8:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
splash_tba_4_9:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_4_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_4_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba00173  ! 20: FABSq	dis not found

memptr_4_12:
	set user_data_start, %r31
	.word 0x8581f707  ! 21: WRCCR_I	wr	%r7, 0x1707, %ccr
splash_cmpr_4_13:
	setx 0x437bc11a10102060, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_4_14:
    set user_data_start, %o7
	.word 0x93902003  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_4_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_4_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f24, %f18
	.word 0x95b2c314  ! 25: ALIGNADDRESS	alignaddr	%r11, %r20, %r10
	.word 0xa1902007  ! 26: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_4_17:
	taddcctv %r10, 0x1ad5, %r14
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x99a00170  ! 30: FABSq	dis not found

	.word 0x93a00166  ! 31: FABSq	dis not found

	.word 0xe6cfe000  ! 32: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa1520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_19)+32, 16, 16)) -> intp(4,1,3)
xir_4_19:
	.word 0xa9847a18  ! 36: WR_SET_SOFTINT_I	wr	%r17, 0x1a18, %set_softint
	.word 0xd0c00e80  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r8
	.word 0xa1902000  ! 38: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_20:
	setx 0x043ec77d0c051fc6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_21:
	.word 0x99a189d1  ! 1: FDIVd	fdivd	%f6, %f48, %f12
	allclean
	.word 0xa7b1c30a  ! 41: ALIGNADDRESS	alignaddr	%r7, %r10, %r19
debug_4_22:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_4_24:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_24:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_24
    nop
debug_wait4_24:
    ld [%r23], %r2
    brnz %r2, debug_wait4_24
    nop
    ba,a debug_startwait4_24
continue_debug_4_24:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_24:
    cmp %r13, %r15
    bne,a wait_for_stat_4_24
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_24:
    cmp %r14, %r15
    bne,a wait_for_debug_4_24
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 45: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_lsu_4_25:
	setx 0xdd0630d9aeeb4ac9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a1c9c3  ! 47: FDIVd	fdivd	%f38, %f34, %f16
DS_4_26:
	.word 0x91a0c9d0  ! 1: FDIVd	fdivd	%f34, %f16, %f8
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_4_27:
	nop
	setx 0xfffff50bfffffacd, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802004  ! 50: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_28) + 24, 16, 16)) -> intp(0,0,22)
intvec_4_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe010  ! 52: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d9023fd  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x03fd, %pstate
tagged_4_29:
	taddcctv %r24, 0x1cd6, %r23
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02033  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_4_30:
	tsubcctv %r26, 0x13c5, %r26
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x83d02033  ! 58: Tcc_I	te	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_31:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 59: RDPC	rd	%pc, %r9
mondo_4_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d91400b  ! 60: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
	.word 0x87902206  ! 61: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_4_33:
	set user_data_start, %r31
	.word 0x858473af  ! 63: WRCCR_I	wr	%r17, 0x13af, %ccr
cwp_4_34:
    set user_data_start, %o7
	.word 0x93902003  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x95a000d3  ! 66: FNEGd	fnegd	%f50, %f10
	.word 0xa190200b  ! 67: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a189c7  ! 71: FDIVd	fdivd	%f6, %f38, %f42
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_4_36:
	setx 0xee7fb32d6015e57f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x44d0af57cae2e40e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_39:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd08008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_4_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 79: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	.word 0x9f802ce3  ! 80: SIR	sir	0x0ce3
cwp_4_42:
    set user_data_start, %o7
	.word 0x93902006  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xab840007  ! 82: WR_CLEAR_SOFTINT_R	wr	%r16, %r7, %clear_softint
splash_hpstate_4_43:
	.word 0x81982b9d  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_4_45:
	setx 0xa54b48810e0eb3a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_4_46:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0x5b2d32e8201e944c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_48:
	.word 0x81982f3c  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f3c, %hpstate
	.word 0xad843c59  ! 90: WR_SOFTINT_REG_I	wr	%r16, 0x1c59, %softint
	.word 0x879020d1  ! 91: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_49:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 92: RDPC	rd	%pc, %r12
	.word 0xd2cfe030  ! 93: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x8d9022fa  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x02fa, %pstate
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
	.word 0x99414000  ! 95: RDPC	rd	%pc, %r12
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01969  ! 97: FqTOd	dis not found

splash_cmpr_4_52:
	setx 0x1a68d28f63cf1755, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_53:
	.word 0x81982746  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
tagged_4_54:
	tsubcctv %r5, 0x12de, %r18
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 101: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0xf0880278b6b47189, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d940006  ! 103: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0x8d9023b5  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x03b5, %pstate
	.word 0xd8cfe020  ! 105: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
splash_lsu_4_57:
	setx 0xcf008c0bf89f2917, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x8780208b  ! 108: WRASI_I	wr	%r0, 0x008b, %asi
debug_4_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_60:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 110: RDPC	rd	%pc, %r10
tagged_4_61:
	taddcctv %r12, 0x119f, %r17
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_4_62:
	setx 0x7a8aa0d60f459b79, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196b  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_4_64:
	setx 0x13e7cc40e3fd14fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_65:
	.word 0x8f902003  ! 117: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
memptr_4_66:
	set user_data_start, %r31
	.word 0x8584a9a2  ! 118: WRCCR_I	wr	%r18, 0x09a2, %ccr
memptr_4_67:
	set 0x60140000, %r31
	.word 0x8583344a  ! 119: WRCCR_I	wr	%r12, 0x144a, %ccr
	.word 0xa1902006  ! 120: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_4_68:
	setx 0x4b4b21bcf379228e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab81c00b  ! 122: WR_CLEAR_SOFTINT_R	wr	%r7, %r11, %clear_softint
	.word 0x9a6cba20  ! 123: UDIVX_I	udivx 	%r18, 0xfffffa20, %r13
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_4_69:
	setx 0x337bc5696cac9fde, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_70) + 8, 16, 16)) -> intp(4,0,29)
intvec_4_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_71:
	setx 0x0518a687e8af0020, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x879020dd  ! 129: WRPR_TT_I	wrpr	%r0, 0x00dd, %tt
	.word 0x95a489d2  ! 130: FDIVd	fdivd	%f18, %f18, %f10
	.word 0x98d4e6d5  ! 131: UMULcc_I	umulcc 	%r19, 0x06d5, %r12
change_to_randtl_4_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_72:
	.word 0x8f902000  ! 132: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_4_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_73:
	.word 0x8f902003  ! 133: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0cfe000  ! 135: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
splash_hpstate_4_74:
	.word 0x81982786  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0786, %hpstate
	.word 0x8790218c  ! 137: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
	.word 0x87802020  ! 138: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879021f4  ! 139: WRPR_TT_I	wrpr	%r0, 0x01f4, %tt
	.word 0xa7480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xd2800ac0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
splash_cmpr_4_75:
	setx 0x3efc522267b328ef, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_76:
	.word 0x81982e4e  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4e, %hpstate
	.word 0xa190200a  ! 144: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8780201c  ! 145: WRASI_I	wr	%r0, 0x001c, %asi
tagged_4_77:
	taddcctv %r18, 0x1a23, %r22
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_4_78:
	setx 0x27be4755444a418b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_79:
	set 0x60340000, %r31
	.word 0x85847386  ! 148: WRCCR_I	wr	%r17, 0x1386, %ccr
	.word 0xa190200d  ! 149: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd28008a0  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_4_80:
	tsubcctv %r11, 0x10e5, %r16
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd28008a0  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_4_81:
    set user_data_start, %o7
	.word 0x93902003  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800ae0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_4_82-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_82:
	.word 0x91934010  ! 160: WRPR_PIL_R	wrpr	%r13, %r16, %pil
cwp_4_83:
    set user_data_start, %o7
	.word 0x93902000  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_4_84:
	setx 0x1fa53cf3cafca100, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_85:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_86:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 164: RDPC	rd	%pc, %r9
	.word 0x87802089  ! 165: WRASI_I	wr	%r0, 0x0089, %asi
tagged_4_87:
	taddcctv %r14, 0x1b78, %r22
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_4_88:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 168: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd4800a80  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0x99480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_4_90:
	setx 0x1724bc7cfe90de22, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 173: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 174: FqTOd	dis not found

splash_cmpr_4_92:
	setx 0xf3db500a9b33eff5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_4_93:
	setx 0xdd54c739da0111c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe010  ! 178: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x93d02033  ! 179: Tcc_I	tne	icc_or_xcc, %r0 + 51
	rd %pc, %r19
	add %r19, (ivw_4_94-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_94:
	.word 0x91900010  ! 180: WRPR_PIL_R	wrpr	%r0, %r16, %pil
	.word 0x879020b0  ! 181: WRPR_TT_I	wrpr	%r0, 0x00b0, %tt
intveclr_4_95:
	setx 0x4e82b78c34a60c28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_4_96:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_97:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 185: RDPC	rd	%pc, %r11
splash_tba_4_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f8034fb  ! 187: SIR	sir	0x14fb
memptr_4_99:
	set user_data_start, %r31
	.word 0x8584a385  ! 188: WRCCR_I	wr	%r18, 0x0385, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x91d02035  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_4_100:
	setx 0xa0e51f748e97a6fb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0800a60  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa1902000  ! 194: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe0cfe010  ! 195: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_4_101:
	set 0x60540000, %r31
	.word 0x8584341a  ! 196: WRCCR_I	wr	%r16, 0x141a, %ccr
	.word 0x9f80384b  ! 197: SIR	sir	0x184b
intveclr_4_102:
	setx 0xf168b1c150ec291f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c6a90  ! 199: SDIVX_I	sdivx	%r17, 0x0a90, %r12
splash_lsu_4_104:
	setx 0x72bbd500eef1d7ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 201: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_4_105:
	setx 0x3366d1201d5371ff, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_4_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf77221ad	! Random illegal ?
	.word 0xd712800c  ! 1: LDQF_R	-	[%r10, %r12], %f11
	.word 0x95a48821  ! 204: FADDs	fadds	%f18, %f1, %f10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_4_108:
	.word 0xa1a489c8  ! 1: FDIVd	fdivd	%f18, %f8, %f16
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_4_109:
	nop
	setx 0xfffff29cfffffd58, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d903002  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x1002, %pstate
	.word 0x93d020b3  ! 211: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xe8dfe020  ! 212: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xe8c004a0  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
DS_4_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f2, %f24
	.word 0x95b2c307  ! 214: ALIGNADDRESS	alignaddr	%r11, %r7, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_4_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b40311  ! 216: ALIGNADDRESS	alignaddr	%r16, %r17, %r8
splash_hpstate_4_112:
	.word 0x81982885  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_4_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x879023d5  ! 222: WRPR_TT_I	wrpr	%r0, 0x03d5, %tt
tagged_4_114:
	tsubcctv %r11, 0x11e7, %r3
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x91d02033  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90205f  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
splash_lsu_4_115:
	setx 0x31a246cb0a9c6721, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_116:
	setx 0x0770904aa3e6a581, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 228: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02032  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_4_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d90800d  ! 230: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d3a7e  ! 231: SDIVX_I	sdivx	%r20, 0xfffffa7e, %r18
	.word 0xa9a0016c  ! 232: FABSq	dis not found

memptr_4_119:
	set 0x60540000, %r31
	.word 0x8581eaae  ! 233: WRCCR_I	wr	%r7, 0x0aae, %ccr
	.word 0xa190200e  ! 234: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7692b36  ! 235: SDIVX_I	sdivx	%r4, 0x0b36, %r19
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 236: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e010  ! 238: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x9b520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x87902088  ! 240: WRPR_TT_I	wrpr	%r0, 0x0088, %tt
	.word 0xa66c8007  ! 241: UDIVX_R	udivx 	%r18, %r7, %r19
debug_4_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_123:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_124:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 244: RDPC	rd	%pc, %r8
debug_4_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369f59d  ! 246: SDIVX_I	sdivx	%r7, 0xfffff59d, %r9
mondo_4_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d930010  ! 247: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
change_to_randtl_4_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_128:
	.word 0x8f902002  ! 248: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 249: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_4_129:
	setx 0x62dedb89f1287526, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_130) + 32, 16, 16)) -> intp(4,0,27)
intvec_4_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 253: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	rd %pc, %r19
	add %r19, (ivw_4_131-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_131:
	.word 0x91924010  ! 254: WRPR_PIL_R	wrpr	%r9, %r16, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d903932  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1932, %pstate
	.word 0x99902004  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e010  ! 259: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
tagged_4_132:
	tsubcctv %r19, 0x173a, %r18
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_4_133:
	.word 0x81982c4c  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xab84c010  ! 263: WR_CLEAR_SOFTINT_R	wr	%r19, %r16, %clear_softint
splash_lsu_4_134:
	setx 0x7587375588a6752d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_135:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_135:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_135
    nop
debug_wait4_135:
    ld [%r23], %r2
    brnz %r2, debug_wait4_135
    nop
    ba,a debug_startwait4_135
continue_debug_4_135:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_135:
    cmp %r13, %r15
    bne,a wait_for_stat_4_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_135:
    cmp %r14, %r15
    bne,a wait_for_debug_4_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 265: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_4_136:
	setx 0x75734556aed79d84, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 267: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_4_137:
	setx 0x3900ced0712680ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe000  ! 271: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x9f8039d6  ! 272: SIR	sir	0x19d6
	.word 0xa9a00540  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_4_138-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_138:
	.word 0x91928012  ! 276: WRPR_PIL_R	wrpr	%r10, %r18, %pil
	.word 0x93a50dc2  ! 277: FdMULq	fdmulq	
debug_4_139:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x93a0c9c9  ! 280: FDIVd	fdivd	%f34, %f40, %f40
splash_tba_4_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902003  ! 282: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f80281d  ! 283: SIR	sir	0x081d
intveclr_4_141:
	setx 0x5b6fa3be71f32a49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902efb  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0efb, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01961  ! 287: FqTOd	dis not found

	.word 0xd0800ac0  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0xd0c7e010  ! 289: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	setx 0x8a9b16fbd30d8353, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
debug_4_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_146) + 0, 16, 16)) -> intp(5,0,2)
intvec_4_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_147:
	.word 0x8f902001  ! 294: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_4_149:
	setx 0xaee1925c1c569722, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_150:
	setx 0x88541fdba0e5352b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_151:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x93a000ca  ! 302: FNEGd	fnegd	%f10, %f40
splash_tba_4_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 304: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xe4c004a0  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe4880e40  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
tagged_4_154:
	tsubcctv %r12, 0x165d, %r21
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x9b500000  ! 310: RDPR_TPC	<illegal instruction>
splash_lsu_4_155:
	setx 0xd3bc831702aa1749, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_156:
	set user_data_start, %r31
	.word 0x85803e8b  ! 312: WRCCR_I	wr	%r0, 0x1e8b, %ccr
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
	.word 0x99414000  ! 313: RDPC	rd	%pc, %r12
debug_4_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_159:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_159:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_159
    nop
debug_wait4_159:
    ld [%r23], %r2
    brnz %r2, debug_wait4_159
    nop
    ba,a debug_startwait4_159
continue_debug_4_159:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_159:
    cmp %r13, %r15
    bne,a wait_for_stat_4_159
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_159:
    cmp %r14, %r15
    bne,a wait_for_debug_4_159
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 315: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
intveclr_4_160:
	setx 0x5d89c7c97997b6f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_4_161:
	taddcctv %r4, 0x1bd8, %r13
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_4_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_163:
	setx 0xdb3e02fd48acbfc3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d924007  ! 320: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	.word 0x99902005  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x97703414  ! 322: POPC_I	popc	0x1414, %r11
change_to_randtl_4_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_165:
	.word 0x8f902001  ! 323: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_4_166:
	setx 0x38554c5df9b7645a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00168  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x93d02032  ! 328: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d903fa1  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x1fa1, %pstate
splash_cmpr_4_167:
	setx 0x4cab6ffb9dda8e51, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_4_168:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_169:
	taddcctv %r16, 0x193a, %r17
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd29004a0  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
splash_cmpr_4_170:
	setx 0xcff273f1d0c68c4b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x97500000  ! 338: RDPR_TPC	rdpr	%tpc, %r11
splash_tba_4_171:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_172:
	tsubcctv %r14, 0x10b2, %r2
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_4_173:
    set user_data_start, %o7
	.word 0x93902002  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
change_to_randtl_4_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_174:
	.word 0x8f902000  ! 344: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902008  ! 346: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_tba_4_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xb9386f86912f328f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9745c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_178) + 16, 16, 16)) -> intp(7,0,2)
intvec_4_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00169  ! 351: FABSq	dis not found

splash_hpstate_4_179:
	.word 0x8198284e  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084e, %hpstate
tagged_4_180:
	tsubcctv %r22, 0x1a2a, %r25
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f8032e3  ! 354: SIR	sir	0x12e3
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_4_181:
	setx 0x3344be04b29c5a76, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_4_184:
	.word 0x91a349d4  ! 1: FDIVd	fdivd	%f44, %f20, %f8
	.word 0xe934fae7  ! 1: STQF_I	-	%f20, [0x1ae7, %r19]
	normalw
	.word 0xa1458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x91464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_4_185:
	nop
	setx 0xfffff58cfffff106, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_4_186:
    set user_data_start, %o7
	.word 0x93902005  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_4_187:
	.word 0x8198205e  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005e, %hpstate
debug_4_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 369: FqTOd	dis not found

intveclr_4_190:
	setx 0xf535b5fb9a6886df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9830006  ! 371: WR_SET_SOFTINT_R	wr	%r12, %r6, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_4_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa882800a  ! 374: ADDcc_R	addcc 	%r10, %r10, %r20
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_192:
	tsubcctv %r10, 0x1259, %r18
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e40  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x72, %r18
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
	.word 0x97414000  ! 381: RDPC	rd	%pc, %r11
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_4_194:
	setx 0xa645e713376bbaca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802089  ! 385: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 386: WRASI_I	wr	%r0, 0x0004, %asi
memptr_4_195:
	set user_data_start, %r31
	.word 0x8584f8b7  ! 387: WRCCR_I	wr	%r19, 0x18b7, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_4_196:
	setx 0x40c8c6ced40267df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5303310  ! 1: STQF_I	-	%f10, [0x1310, %r0]
	normalw
	.word 0xa9458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xa190200d  ! 391: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9f80373f  ! 392: SIR	sir	0x173f
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_4_198:
	setx 0x04d6a43747c89ea5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_199:
	set 0x60140000, %r31
	.word 0x8580fb42  ! 396: WRCCR_I	wr	%r3, 0x1b42, %ccr
tagged_4_200:
	tsubcctv %r25, 0x1c0e, %r4
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_4_201:
	setx 0xa35ec3b356c2d159, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba289c2  ! 399: FDIVd	fdivd	%f10, %f2, %f44
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 400: RDPC	rd	%pc, %r20
	setx 0x9918d11de1fc182f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_204:
    set user_data_start, %o7
	.word 0x93902003  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd0d804a0  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xab834011  ! 404: WR_CLEAR_SOFTINT_R	wr	%r13, %r17, %clear_softint
DS_4_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9334002  ! 1: STQF_R	-	%f20, [%r2, %r13]
	normalw
	.word 0xa5458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r18
memptr_4_206:
	set 0x60540000, %r31
	.word 0x8584fd65  ! 406: WRCCR_I	wr	%r19, 0x1d65, %ccr
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_207:
    cmp %r14, %r15
    bne,a wait_for_debug_4_207
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 407: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xa1902004  ! 408: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_4_208:
	.word 0x81982996  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0996, %hpstate
	rd %pc, %r19
	add %r19, (ivw_4_209-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_209:
	.word 0x91908013  ! 411: WRPR_PIL_R	wrpr	%r2, %r19, %pil
	.word 0xe08fe020  ! 412: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_210) + 32, 16, 16)) -> intp(1,0,8)
intvec_4_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902eb9  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x0eb9, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902234  ! 416: WRPR_TT_I	wrpr	%r0, 0x0234, %tt
memptr_4_211:
	set 0x60340000, %r31
	.word 0x8581f6b0  ! 417: WRCCR_I	wr	%r7, 0x16b0, %ccr
	.word 0x93d02032  ! 418: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_hpstate_4_212:
	.word 0x81982d16  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d16, %hpstate
donret_4_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_213-donret_4_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe0800b60  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r16
	.word 0xe0c7e030  ! 422: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
memptr_4_214:
	set 0x60340000, %r31
	.word 0x85843506  ! 423: WRCCR_I	wr	%r16, 0x1506, %ccr
intveclr_4_215:
	setx 0x51877633187acdba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa8f80012  ! 425: SDIVcc_R	sdivcc 	%r0, %r18, %r20
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_4_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_4_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d903449  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x1449, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd08008a0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_218) + 40, 16, 16)) -> intp(2,0,25)
intvec_4_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01962  ! 434: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe020  ! 436: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0xa950c000  ! 437: RDPR_TT	<illegal instruction>
DS_4_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_4_222:
    set user_data_start, %o7
	.word 0x93902004  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02034  ! 440: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_cmpr_4_223:
	setx 0x957511ac7ab1e706, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902f2a  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0f2a, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_224:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 443: RDPC	rd	%pc, %r9
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_4_225:
	setx 0xc76c569b194d1f97, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d940007  ! 446: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
memptr_4_227:
	set 0x60340000, %r31
	.word 0x85826ae0  ! 447: WRCCR_I	wr	%r9, 0x0ae0, %ccr
	.word 0x97a00170  ! 448: FABSq	dis not found

mondo_4_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d92c004  ! 449: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
splash_cmpr_4_229:
	setx 0xcaa214f70624c096, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87802016  ! 453: WRASI_I	wr	%r0, 0x0016, %asi
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_230:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 454: RDPC	rd	%pc, %r8
	setx 0x4739f83d772d9589, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_232:
	setx 0x9c67a8607870364f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab810002  ! 457: WR_CLEAR_SOFTINT_R	wr	%r4, %r2, %clear_softint
	.word 0x879022fa  ! 458: WRPR_TT_I	wrpr	%r0, 0x02fa, %tt
	.word 0xd6c804a0  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_cmpr_4_233:
	setx 0x5ac5c4e7ddd18df6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9145c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x87902301  ! 462: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
	.word 0x83d020b2  ! 463: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x99902002  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_cmpr_4_234:
	setx 0xede70febb01179b1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f28, %f22
	.word 0x95b3030d  ! 466: ALIGNADDRESS	alignaddr	%r12, %r13, %r10
	.word 0x87802010  ! 467: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93d02032  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 50
memptr_4_236:
	set 0x60140000, %r31
	.word 0x85822dc7  ! 469: WRCCR_I	wr	%r8, 0x0dc7, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_4_237:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_237:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_237
    nop
debug_wait4_237:
    ld [%r23], %r2
    brnz %r2, debug_wait4_237
    nop
    ba,a debug_startwait4_237
continue_debug_4_237:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_237:
    cmp %r13, %r15
    bne,a wait_for_stat_4_237
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_237:
    cmp %r14, %r15
    bne,a wait_for_debug_4_237
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 471: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
pmu_4_238:
	nop
	setx 0xfffff426fffff0a8, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_239:
	setx 0x2e58d7ef58f3399d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_240:
	setx 0xc1232b7eebce1dca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_4_241:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_4_243:
	setx 0x77297f45808ea057, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_244:
	.word 0x81982a1f  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	.word 0xe6d7e020  ! 483: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r19
splash_cmpr_4_245:
	setx 0x905696bfc21ff0b5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_246:
	tsubcctv %r26, 0x1f9e, %r6
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_4_247:
	setx 0x16d8b49b333b5853, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_248) + 0, 16, 16)) -> intp(7,0,12)
intvec_4_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a20d27  ! 489: FsMULd	fsmuld	%f8, %f38, %f50
splash_tba_4_249:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_250:
	setx 0xf4f31f7f7865cddb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_4_251:
    set user_data_start, %o7
	.word 0x93902004  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902259  ! 493: WRPR_TT_I	wrpr	%r0, 0x0259, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 494: FqTOd	dis not found

splash_cmpr_4_253:
	setx 0xc06b4a818508f324, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_254) + 56, 16, 16)) -> intp(1,0,30)
intvec_4_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 497: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_hpstate_4_255:
	.word 0x81982f54  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f54, %hpstate
DS_4_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
memptr_3_0:
	set user_data_start, %r31
	.word 0x8584bb8b  ! 1: WRCCR_I	wr	%r18, 0x1b8b, %ccr
splash_lsu_3_1:
	setx 0xad2839b44e4ce2c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 3: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_3_3:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 6: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_3_4-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_4:
	.word 0x9190c010  ! 8: WRPR_PIL_R	wrpr	%r3, %r16, %pil
DS_3_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3144014  ! 1: LDQF_R	-	[%r17, %r20], %f9
	.word 0x9ba48820  ! 9: FADDs	fadds	%f18, %f0, %f13
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x87902335  ! 11: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
cwp_3_6:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_3_7:
	set 0x60340000, %r31
	.word 0x8584f76c  ! 15: WRCCR_I	wr	%r19, 0x176c, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_8:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 16: RDPC	rd	%pc, %r17
splash_tba_3_9:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_3_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_3_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7a00167  ! 20: FABSq	dis not found

memptr_3_12:
	set user_data_start, %r31
	.word 0x85837fa1  ! 21: WRCCR_I	wr	%r13, 0x1fa1, %ccr
splash_cmpr_3_13:
	setx 0xd7c170f8a93b5173, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_3_14:
    set user_data_start, %o7
	.word 0x93902005  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_3_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_3_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f30, %f6
	.word 0x93b2c301  ! 25: ALIGNADDRESS	alignaddr	%r11, %r1, %r9
	.word 0xa190200d  ! 26: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_3_17:
	taddcctv %r1, 0x19bc, %r7
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x99a00171  ! 30: FABSq	dis not found

	.word 0xa3a00172  ! 31: FABSq	dis not found

	.word 0xe6cfe010  ! 32: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x97520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01960  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_19)+8, 16, 16)) -> intp(3,1,3)
xir_3_19:
	.word 0xa9802dba  ! 36: WR_SET_SOFTINT_I	wr	%r0, 0x0dba, %set_softint
	.word 0xd0c00e60  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0xa190200c  ! 38: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_20:
	setx 0x6346439b84456ec8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_21:
	.word 0x91a409ca  ! 1: FDIVd	fdivd	%f16, %f10, %f8
	allclean
	.word 0xa9b2c309  ! 41: ALIGNADDRESS	alignaddr	%r11, %r9, %r20
debug_3_22:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d020b4  ! 43: Tcc_I	te	icc_or_xcc, %r0 + 180
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_3_24:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 45: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
splash_lsu_3_25:
	setx 0xedfe777c36bc8a65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a209d4  ! 47: FDIVd	fdivd	%f8, %f20, %f40
DS_3_26:
	.word 0x9ba2c9c2  ! 1: FDIVd	fdivd	%f42, %f2, %f44
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_3_27:
	nop
	setx 0xfffff0abfffff792, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802058  ! 50: WRASI_I	wr	%r0, 0x0058, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_28) + 16, 16, 16)) -> intp(3,0,31)
intvec_3_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe000  ! 52: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d902508  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0508, %pstate
tagged_3_29:
	taddcctv %r5, 0x107e, %r15
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02035  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_3_30:
	tsubcctv %r26, 0x16eb, %r12
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02033  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 59: RDPC	rd	%pc, %r17
mondo_3_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d94c008  ! 60: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x879021c1  ! 61: WRPR_TT_I	wrpr	%r0, 0x01c1, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_3_33:
	set user_data_start, %r31
	.word 0x8582f687  ! 63: WRCCR_I	wr	%r11, 0x1687, %ccr
cwp_3_34:
    set user_data_start, %o7
	.word 0x93902006  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x93a000d2  ! 66: FNEGd	fnegd	%f18, %f40
	.word 0xa190200e  ! 67: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a049c5  ! 71: FDIVd	fdivd	%f32, %f36, %f48
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_3_36:
	setx 0xc71fbb34611c9be1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x5774550a2b7220ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_39:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd0800a80  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_3_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 79: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x9f802bb8  ! 80: SIR	sir	0x0bb8
cwp_3_42:
    set user_data_start, %o7
	.word 0x93902007  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xab80c00a  ! 82: WR_CLEAR_SOFTINT_R	wr	%r3, %r10, %clear_softint
splash_hpstate_3_43:
	.word 0x819825ce  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_3_45:
	setx 0x46a3dd3e0731afd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 86: Tcc_I	tne	icc_or_xcc, %r0 + 181
debug_3_46:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xc6c02831e971ebbb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_48:
	.word 0x81982767  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0767, %hpstate
	.word 0xad84a1ad  ! 90: WR_SOFTINT_REG_I	wr	%r18, 0x01ad, %softint
	.word 0x879020e9  ! 91: WRPR_TT_I	wrpr	%r0, 0x00e9, %tt
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_49:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 92: RDPC	rd	%pc, %r12
	.word 0xd2cfe000  ! 93: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d902220  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x0220, %pstate
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
	.word 0x97414000  ! 95: RDPC	rd	%pc, %r11
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01972  ! 97: FqTOd	dis not found

splash_cmpr_3_52:
	setx 0x86a838d01277d9ec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_53:
	.word 0x81982e0c  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
tagged_3_54:
	tsubcctv %r8, 0x14c6, %r17
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xad978078a20704b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d918012  ! 103: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0x8d903c14  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x1c14, %pstate
	.word 0xd8cfe000  ! 105: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
splash_lsu_3_57:
	setx 0xb31887f49e84d9a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802055  ! 108: WRASI_I	wr	%r0, 0x0055, %asi
debug_3_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_60:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 110: RDPC	rd	%pc, %r8
tagged_3_61:
	taddcctv %r18, 0x1b9a, %r16
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_3_62:
	setx 0x5b9b855d764c276c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_3_64:
	setx 0x8cd4f24405046f42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_65:
	.word 0x8f902003  ! 117: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
memptr_3_66:
	set user_data_start, %r31
	.word 0x8584f171  ! 118: WRCCR_I	wr	%r19, 0x1171, %ccr
memptr_3_67:
	set 0x60340000, %r31
	.word 0x85832ac0  ! 119: WRCCR_I	wr	%r12, 0x0ac0, %ccr
	.word 0xa1902000  ! 120: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_3_68:
	setx 0xa5b7be89ee54b89f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab800011  ! 122: WR_CLEAR_SOFTINT_R	wr	%r0, %r17, %clear_softint
	.word 0x9268ae86  ! 123: UDIVX_I	udivx 	%r2, 0x0e86, %r9
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_3_69:
	setx 0xc78168dc9584efc2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_70) + 0, 16, 16)) -> intp(6,0,13)
intvec_3_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_71:
	setx 0x45e16a863f8172a8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x879020a4  ! 129: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	.word 0xa9a4c9d1  ! 130: FDIVd	fdivd	%f50, %f48, %f20
	.word 0x98d0fdec  ! 131: UMULcc_I	umulcc 	%r3, 0xfffffdec, %r12
change_to_randtl_3_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_72:
	.word 0x8f902001  ! 132: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_3_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_73:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0800be0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r8
	.word 0xd0cfe000  ! 135: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
splash_hpstate_3_74:
	.word 0x81982c9f  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9f, %hpstate
	.word 0x87902168  ! 137: WRPR_TT_I	wrpr	%r0, 0x0168, %tt
	.word 0x87802020  ! 138: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879023e8  ! 139: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
	.word 0xa7480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xd2800a60  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
splash_cmpr_3_75:
	setx 0x0a8996a8db645ee0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_76:
	.word 0x81982bc7  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc7, %hpstate
	.word 0xa1902008  ! 144: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802055  ! 145: WRASI_I	wr	%r0, 0x0055, %asi
tagged_3_77:
	taddcctv %r8, 0x1317, %r4
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_3_78:
	setx 0x126d7207aa93213d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_3_79:
	set 0x60740000, %r31
	.word 0x85826a49  ! 148: WRCCR_I	wr	%r9, 0x0a49, %ccr
	.word 0xa1902006  ! 149: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd2800b80  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0xd2800b00  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
tagged_3_80:
	tsubcctv %r22, 0x17bf, %r3
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd2800b40  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_3_81:
    set user_data_start, %o7
	.word 0x93902004  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd28008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_3_82-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_82:
	.word 0x91900004  ! 160: WRPR_PIL_R	wrpr	%r0, %r4, %pil
cwp_3_83:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_3_84:
	setx 0xb14868788828bc63, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_85:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_86:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 164: RDPC	rd	%pc, %r9
	.word 0x87802089  ! 165: WRASI_I	wr	%r0, 0x0089, %asi
tagged_3_87:
	taddcctv %r20, 0x13ca, %r19
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_3_88:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200b  ! 168: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x97480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_3_90:
	setx 0x3f768c5f5585f49b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 173: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196d  ! 174: FqTOd	dis not found

splash_cmpr_3_92:
	setx 0xdf06df66bf873d78, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_3_93:
	setx 0xeb44f3b09fb9370d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe010  ! 178: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x91d020b2  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 178
	rd %pc, %r19
	add %r19, (ivw_3_94-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_94:
	.word 0x9192c000  ! 180: WRPR_PIL_R	wrpr	%r11, %r0, %pil
	.word 0x879021ff  ! 181: WRPR_TT_I	wrpr	%r0, 0x01ff, %tt
intveclr_3_95:
	setx 0xbbfdde7f687c6040, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_3_96:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b2  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 185: RDPC	rd	%pc, %r19
splash_tba_3_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f803e53  ! 187: SIR	sir	0x1e53
memptr_3_99:
	set user_data_start, %r31
	.word 0x8581ef05  ! 188: WRCCR_I	wr	%r7, 0x0f05, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x93d02032  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_3_100:
	setx 0x6d989679c8c81968, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0800b20  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa1902004  ! 194: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe0cfe030  ! 195: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
memptr_3_101:
	set 0x60740000, %r31
	.word 0x858334fe  ! 196: WRCCR_I	wr	%r12, 0x14fe, %ccr
	.word 0x9f802684  ! 197: SIR	sir	0x0684
intveclr_3_102:
	setx 0xd2b7e4c08d27150f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6c783f  ! 199: SDIVX_I	sdivx	%r17, 0xfffff83f, %r13
splash_lsu_3_104:
	setx 0xa71dc886b0f4a741, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 201: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_3_105:
	setx 0xe9e380ead522f6a7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_3_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbf64bb49	! Random illegal ?
	.word 0xdb100006  ! 1: LDQF_R	-	[%r0, %r6], %f13
	.word 0x97a04827  ! 204: FADDs	fadds	%f1, %f7, %f11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_3_108:
	.word 0x97a089c9  ! 1: FDIVd	fdivd	%f2, %f40, %f42
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_3_109:
	nop
	setx 0xfffffa09fffff429, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b3  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x8d9027f1  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x07f1, %pstate
	.word 0x91d02033  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8dfe020  ! 212: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0xe8c004a0  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
DS_3_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f26, %f16, %f14
	.word 0xa9b04311  ! 214: ALIGNADDRESS	alignaddr	%r1, %r17, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_3_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b40314  ! 216: ALIGNADDRESS	alignaddr	%r16, %r20, %r16
splash_hpstate_3_112:
	.word 0x81982e9f  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9f, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_3_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x8790236d  ! 222: WRPR_TT_I	wrpr	%r0, 0x036d, %tt
tagged_3_114:
	tsubcctv %r14, 0x15bf, %r25
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x91d02034  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d903abe  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x1abe, %pstate
splash_lsu_3_115:
	setx 0x1cb9fc9a366e7173, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_116:
	setx 0x9c764bbf483f8768, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 228: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d020b3  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_3_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d920010  ! 230: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368aae3  ! 231: SDIVX_I	sdivx	%r2, 0x0ae3, %r17
	.word 0x93a00160  ! 232: FABSq	dis not found

memptr_3_119:
	set 0x60140000, %r31
	.word 0x85832a90  ! 233: WRCCR_I	wr	%r12, 0x0a90, %ccr
	.word 0xa190200f  ! 234: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956863a3  ! 235: SDIVX_I	sdivx	%r1, 0x03a3, %r10
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_121:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 236: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e010  ! 238: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xa5520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x87902072  ! 240: WRPR_TT_I	wrpr	%r0, 0x0072, %tt
	.word 0xa868800a  ! 241: UDIVX_R	udivx 	%r2, %r10, %r20
debug_3_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_123:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_124:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 244: RDPC	rd	%pc, %r11
debug_3_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56a3204  ! 246: SDIVX_I	sdivx	%r8, 0xfffff204, %r18
mondo_3_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d908011  ! 247: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
change_to_randtl_3_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_128:
	.word 0x8f902000  ! 248: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_3_129:
	setx 0xd31099c1c090c442, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_130) + 56, 16, 16)) -> intp(7,0,6)
intvec_3_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 253: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	rd %pc, %r19
	add %r19, (ivw_3_131-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_131:
	.word 0x91920004  ! 254: WRPR_PIL_R	wrpr	%r8, %r4, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d902f90  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0f90, %pstate
	.word 0x99902000  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e030  ! 259: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
tagged_3_132:
	tsubcctv %r18, 0x141c, %r25
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_3_133:
	.word 0x81982ed6  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed6, %hpstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab824003  ! 263: WR_CLEAR_SOFTINT_R	wr	%r9, %r3, %clear_softint
splash_lsu_3_134:
	setx 0x9da8d05a8e2f4967, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_135:
	nop
	mov 8, %r18
	.word 0xd2f00492  ! 265: STXA_R	stxa	%r9, [%r0 + %r18] 0x24
splash_cmpr_3_136:
	setx 0x62cf1cfc6aafce6a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 267: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_3_137:
	setx 0x2dedc70a6f096389, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe000  ! 271: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x9f8031a9  ! 272: SIR	sir	0x11a9
	.word 0x99a00552  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_3_138-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_138:
	.word 0x9191c007  ! 276: WRPR_PIL_R	wrpr	%r7, %r7, %pil
	.word 0x99a44dc8  ! 277: FdMULq	fdmulq	
debug_3_139:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x97a509d3  ! 280: FDIVd	fdivd	%f20, %f50, %f42
splash_tba_3_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902001  ! 282: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9f802b25  ! 283: SIR	sir	0x0b25
intveclr_3_141:
	setx 0x706cb048bcef47e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90391e  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x191e, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01964  ! 287: FqTOd	dis not found

	.word 0xd0800b60  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0xd0c7e000  ! 289: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	setx 0xa0cecbf1567a47d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
debug_3_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_146) + 40, 16, 16)) -> intp(5,0,24)
intvec_3_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_147:
	.word 0x8f902002  ! 294: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_3_149:
	setx 0xeab1bbe6d52ba254, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_150:
	setx 0x2db7b5accf861763, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_151:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x91a000c2  ! 302: FNEGd	fnegd	%f2, %f8
splash_tba_3_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_3_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 304: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xe4c004a0  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 306: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe48804a0  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
tagged_3_154:
	tsubcctv %r8, 0x122f, %r25
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0xa1500000  ! 310: RDPR_TPC	<illegal instruction>
splash_lsu_3_155:
	setx 0xf0e86b212b5b199b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_156:
	set user_data_start, %r31
	.word 0x85847aaf  ! 312: WRCCR_I	wr	%r17, 0x1aaf, %ccr
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
	.word 0xa3414000  ! 313: RDPC	rd	%pc, %r17
debug_3_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_159:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 315: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
intveclr_3_160:
	setx 0x1ab15949015186d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_3_161:
	taddcctv %r9, 0x1c84, %r21
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_3_162:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_3_163:
	setx 0x59af8eb95a147227, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d918004  ! 320: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0x99902005  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa370284f  ! 322: POPC_I	popc	0x084f, %r17
change_to_randtl_3_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_165:
	.word 0x8f902003  ! 323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_3_166:
	setx 0xa3a1812e90a02611, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a0016c  ! 325: FABSq	dis not found

	.word 0xd2800a60  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x83d02033  ! 328: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d9027ce  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x07ce, %pstate
splash_cmpr_3_167:
	setx 0x8fc4b6b3c7a8097c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_3_168:
	set 0x003d0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_3_169:
	taddcctv %r21, 0x1904, %r22
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e60  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x73, %r9
splash_cmpr_3_170:
	setx 0x430befb719b07ae2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0xa7500000  ! 338: RDPR_TPC	rdpr	%tpc, %r19
splash_tba_3_171:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_3_172:
	tsubcctv %r13, 0x1097, %r21
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_3_173:
    set user_data_start, %o7
	.word 0x93902005  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
change_to_randtl_3_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_174:
	.word 0x8f902001  ! 344: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902005  ! 346: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_3_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x490380dee7a6a9bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_178) + 0, 16, 16)) -> intp(3,0,17)
intvec_3_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a0016a  ! 351: FABSq	dis not found

splash_hpstate_3_179:
	.word 0x8198208e  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008e, %hpstate
tagged_3_180:
	tsubcctv %r21, 0x1c6e, %r1
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f802298  ! 354: SIR	sir	0x0298
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_3_181:
	setx 0x87827879f2447fe1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_3_184:
	.word 0xa9a189c2  ! 1: FDIVd	fdivd	%f6, %f2, %f20
	.word 0xd130ebd0  ! 1: STQF_I	-	%f8, [0x0bd0, %r3]
	normalw
	.word 0x93458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x95464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_3_185:
	nop
	setx 0xfffff4c5fffff21f, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_3_186:
    set user_data_start, %o7
	.word 0x93902006  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_3_187:
	.word 0x8198221e  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021e, %hpstate
debug_3_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01962  ! 369: FqTOd	dis not found

intveclr_3_190:
	setx 0xdc53b4a169a53fed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9834005  ! 371: WR_SET_SOFTINT_R	wr	%r13, %r5, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_3_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa6848001  ! 374: ADDcc_R	addcc 	%r18, %r1, %r19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 375: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_192:
	tsubcctv %r7, 0x1839, %r16
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e60  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x73, %r18
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
	.word 0x9b414000  ! 381: RDPC	rd	%pc, %r13
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_3_194:
	setx 0x812b642a4eb686b2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802080  ! 385: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802055  ! 386: WRASI_I	wr	%r0, 0x0055, %asi
memptr_3_195:
	set user_data_start, %r31
	.word 0x8582229a  ! 387: WRCCR_I	wr	%r8, 0x029a, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_3_196:
	setx 0x3dae79ee3e2db04f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd93325f3  ! 1: STQF_I	-	%f12, [0x05f3, %r12]
	normalw
	.word 0x93458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xa1902001  ! 391: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9f8022af  ! 392: SIR	sir	0x02af
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_3_198:
	setx 0x88f555376a8e90da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_199:
	set 0x60340000, %r31
	.word 0x85843609  ! 396: WRCCR_I	wr	%r16, 0x1609, %ccr
tagged_3_200:
	tsubcctv %r19, 0x1b40, %r17
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_3_201:
	setx 0xad76a9b36c7a9fc7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9a209c8  ! 399: FDIVd	fdivd	%f8, %f8, %f20
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 400: RDPC	rd	%pc, %r20
	setx 0xced0773eca095442, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_3_204:
    set user_data_start, %o7
	.word 0x93902006  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd0d80e40  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x72, %r8
	.word 0xab814012  ! 404: WR_CLEAR_SOFTINT_R	wr	%r5, %r18, %clear_softint
DS_3_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe532c010  ! 1: STQF_R	-	%f18, [%r16, %r11]
	normalw
	.word 0xa7458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r19
memptr_3_206:
	set 0x60340000, %r31
	.word 0x85847259  ! 406: WRCCR_I	wr	%r17, 0x1259, %ccr
debug_3_207:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 407: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa190200c  ! 408: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_3_208:
	.word 0x819826d6  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d6, %hpstate
	rd %pc, %r19
	add %r19, (ivw_3_209-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_209:
	.word 0x91948004  ! 411: WRPR_PIL_R	wrpr	%r18, %r4, %pil
	.word 0xe08fe000  ! 412: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_210) + 48, 16, 16)) -> intp(0,0,28)
intvec_3_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903728  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x1728, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902032  ! 416: WRPR_TT_I	wrpr	%r0, 0x0032, %tt
memptr_3_211:
	set 0x60140000, %r31
	.word 0x858160e8  ! 417: WRCCR_I	wr	%r5, 0x00e8, %ccr
	.word 0x91d02035  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_3_212:
	.word 0x8198275d  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
donret_3_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_213-donret_3_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe08008a0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0c7e030  ! 422: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
memptr_3_214:
	set 0x60540000, %r31
	.word 0x8580ac04  ! 423: WRCCR_I	wr	%r2, 0x0c04, %ccr
intveclr_3_215:
	setx 0x73707d2783be9d7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa0f9c000  ! 425: SDIVcc_R	sdivcc 	%r7, %r0, %r16
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_3_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_3_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d90279a  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x079a, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd08008a0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_218) + 56, 16, 16)) -> intp(5,0,12)
intvec_3_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196b  ! 434: FqTOd	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe030  ! 436: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0xa550c000  ! 437: RDPR_TT	<illegal instruction>
DS_3_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_3_222:
    set user_data_start, %o7
	.word 0x93902001  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02035  ! 440: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_3_223:
	setx 0x0892b5654239a570, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9033c4  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x13c4, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_224:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 443: RDPC	rd	%pc, %r11
	.word 0x8d802004  ! 444: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_3_225:
	setx 0xc053023f5afa43bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d94c00d  ! 446: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
memptr_3_227:
	set 0x60340000, %r31
	.word 0x8581e07e  ! 447: WRCCR_I	wr	%r7, 0x007e, %ccr
	.word 0xa5a00171  ! 448: FABSq	dis not found

mondo_3_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944004  ! 449: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
splash_cmpr_3_229:
	setx 0x59ace5897a159124, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87802020  ! 453: WRASI_I	wr	%r0, 0x0020, %asi
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_230:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 454: RDPC	rd	%pc, %r16
	setx 0xd0dc9b43279062e3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_3_232:
	setx 0x8235732ccaf2cd0e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab844001  ! 457: WR_CLEAR_SOFTINT_R	wr	%r17, %r1, %clear_softint
	.word 0x879020b3  ! 458: WRPR_TT_I	wrpr	%r0, 0x00b3, %tt
	.word 0xd6c80e80  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r11
splash_cmpr_3_233:
	setx 0xcc5dbc9d8f064dd4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9145c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x87902229  ! 462: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
	.word 0x91d02032  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99902000  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_cmpr_3_234:
	setx 0x679c888a493d7595, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f30, %f24
	.word 0x9bb18311  ! 466: ALIGNADDRESS	alignaddr	%r6, %r17, %r13
	.word 0x87802020  ! 467: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d020b3  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 179
memptr_3_236:
	set 0x60140000, %r31
	.word 0x85816a30  ! 469: WRCCR_I	wr	%r5, 0x0a30, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_3_237:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 471: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
pmu_3_238:
	nop
	setx 0xfffff89afffff92b, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_239:
	setx 0xc4d660c7454d3cb7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 474: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_3_240:
	setx 0x60ccc268ba5278f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 476: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_3_241:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_3_243:
	setx 0x3e96871dcf5011d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_244:
	.word 0x8198240c  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040c, %hpstate
	.word 0xe6d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_cmpr_3_245:
	setx 0x4e0f07e1e26dcb44, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_246:
	tsubcctv %r4, 0x1b98, %r13
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_3_247:
	setx 0xee8bfe5be2cd7b59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_248) + 56, 16, 16)) -> intp(4,0,26)
intvec_3_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a08d32  ! 489: FsMULd	fsmuld	%f2, %f18, %f50
splash_tba_3_249:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_3_250:
	setx 0xf8bb1f877443f147, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_3_251:
    set user_data_start, %o7
	.word 0x93902007  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902124  ! 493: WRPR_TT_I	wrpr	%r0, 0x0124, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01961  ! 494: FqTOd	dis not found

splash_cmpr_3_253:
	setx 0xb89a4ac03fdb49c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_254) + 32, 16, 16)) -> intp(5,0,13)
intvec_3_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_3_255:
	.word 0x819826b4  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06b4, %hpstate
DS_3_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
memptr_2_0:
	set user_data_start, %r31
	.word 0x8581be88  ! 1: WRCCR_I	wr	%r6, 0x1e88, %ccr
splash_lsu_2_1:
	setx 0xfe00193e6aa753c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 3: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_2_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_2_3:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 6: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_2_4-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_4:
	.word 0x91948011  ! 8: WRPR_PIL_R	wrpr	%r18, %r17, %pil
DS_2_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3150014  ! 1: LDQF_R	-	[%r20, %r20], %f9
	.word 0xa3a48834  ! 9: FADDs	fadds	%f18, %f20, %f17
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x879021e9  ! 11: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
cwp_2_6:
    set user_data_start, %o7
	.word 0x93902000  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_2_7:
	set 0x60140000, %r31
	.word 0x8584f853  ! 15: WRCCR_I	wr	%r19, 0x1853, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_8:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 16: RDPC	rd	%pc, %r12
splash_tba_2_9:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_2_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_2_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a00174  ! 20: FABSq	dis not found

memptr_2_12:
	set user_data_start, %r31
	.word 0x85852c23  ! 21: WRCCR_I	wr	%r20, 0x0c23, %ccr
splash_cmpr_2_13:
	setx 0xd4c427c51617ecf3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_2_14:
    set user_data_start, %o7
	.word 0x93902002  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_2_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
DS_2_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f28, %f22
	.word 0x99b14303  ! 25: ALIGNADDRESS	alignaddr	%r5, %r3, %r12
	.word 0xa1902008  ! 26: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_2_17:
	taddcctv %r8, 0x1e52, %r7
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0x97a00160  ! 30: FABSq	dis not found

	.word 0x95a00163  ! 31: FABSq	dis not found

	.word 0xe6cfe010  ! 32: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa1520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01971  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_19)+48, 16, 16)) -> intp(2,1,3)
xir_2_19:
	.word 0xa984f7e5  ! 36: WR_SET_SOFTINT_I	wr	%r19, 0x17e5, %set_softint
	.word 0xd0c004a0  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa1902001  ! 38: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_20:
	setx 0x89a5a7e26347276e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_21:
	.word 0x95a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f10
	allclean
	.word 0x95b50301  ! 41: ALIGNADDRESS	alignaddr	%r20, %r1, %r10
debug_2_22:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 180
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_2_24:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 45: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
splash_lsu_2_25:
	setx 0x95fda68606ac907d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a509c3  ! 47: FDIVd	fdivd	%f20, %f34, %f8
DS_2_26:
	.word 0x91a2c9cb  ! 1: FDIVd	fdivd	%f42, %f42, %f8
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_2_27:
	nop
	setx 0xfffff581fffff4bc, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8780201c  ! 50: WRASI_I	wr	%r0, 0x001c, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_28) + 40, 16, 16)) -> intp(6,0,11)
intvec_2_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 52: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d9021ee  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x01ee, %pstate
tagged_2_29:
	taddcctv %r17, 0x1ed0, %r1
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02035  ! 56: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_2_30:
	tsubcctv %r1, 0x1df5, %r1
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02032  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_31:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 59: RDPC	rd	%pc, %r10
mondo_2_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91800d  ! 60: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	.word 0x8790214b  ! 61: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_2_33:
	set user_data_start, %r31
	.word 0x858126ff  ! 63: WRCCR_I	wr	%r4, 0x06ff, %ccr
cwp_2_34:
    set user_data_start, %o7
	.word 0x93902001  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa5a000c2  ! 66: FNEGd	fnegd	%f2, %f18
	.word 0xa1902005  ! 67: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a049cb  ! 71: FDIVd	fdivd	%f32, %f42, %f18
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_2_36:
	setx 0x4f256aa5bde6ff07, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x7794f71380198d45, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_39:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd08008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_2_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d92c014  ! 79: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0x9f803d17  ! 80: SIR	sir	0x1d17
cwp_2_42:
    set user_data_start, %o7
	.word 0x93902005  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xab820003  ! 82: WR_CLEAR_SOFTINT_R	wr	%r8, %r3, %clear_softint
splash_hpstate_2_43:
	.word 0x81982a44  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_2_45:
	setx 0xdf4353d855c5255f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_2_46:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xb462f4b54f29fc19, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_48:
	.word 0x819825ef  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ef, %hpstate
	.word 0xad8471e9  ! 90: WR_SOFTINT_REG_I	wr	%r17, 0x11e9, %softint
	.word 0x87902342  ! 91: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_49:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 92: RDPC	rd	%pc, %r16
	.word 0xd2cfe010  ! 93: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d9025dc  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x05dc, %pstate
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
	.word 0x95414000  ! 95: RDPC	rd	%pc, %r10
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 97: FqTOd	dis not found

splash_cmpr_2_52:
	setx 0xe25e260ee1ef95d9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_53:
	.word 0x819827df  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
tagged_2_54:
	tsubcctv %r21, 0x1412, %r14
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xb36eff86e4fff7e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d920004  ! 103: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
	.word 0x8d9029b9  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x09b9, %pstate
	.word 0xd8cfe000  ! 105: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
splash_lsu_2_57:
	setx 0x4427a72be5608aa5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802014  ! 108: WRASI_I	wr	%r0, 0x0014, %asi
debug_2_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 110: RDPC	rd	%pc, %r16
tagged_2_61:
	taddcctv %r7, 0x1bdc, %r25
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_2_62:
	setx 0xd104f300ff6040b5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01968  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_2_64:
	setx 0x7ae1f3a9c454626f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_65:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_2_66:
	set user_data_start, %r31
	.word 0x8582ed7c  ! 118: WRCCR_I	wr	%r11, 0x0d7c, %ccr
memptr_2_67:
	set 0x60740000, %r31
	.word 0x85843b64  ! 119: WRCCR_I	wr	%r16, 0x1b64, %ccr
	.word 0xa190200d  ! 120: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_2_68:
	setx 0xc7fac87c29785e76, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab820002  ! 122: WR_CLEAR_SOFTINT_R	wr	%r8, %r2, %clear_softint
	.word 0x986b2eac  ! 123: UDIVX_I	udivx 	%r12, 0x0eac, %r12
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_2_69:
	setx 0x329902d1b7347759, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_70) + 40, 16, 16)) -> intp(1,0,28)
intvec_2_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_71:
	setx 0x6f78dd47dcec9a45, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790228e  ! 129: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
	.word 0x97a209d2  ! 130: FDIVd	fdivd	%f8, %f18, %f42
	.word 0xa8d4a05b  ! 131: UMULcc_I	umulcc 	%r18, 0x005b, %r20
change_to_randtl_2_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_72:
	.word 0x8f902001  ! 132: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_2_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_73:
	.word 0x8f902003  ! 133: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0800a80  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
	.word 0xd0cfe020  ! 135: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
splash_hpstate_2_74:
	.word 0x819821cc  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cc, %hpstate
	.word 0x87902327  ! 137: WRPR_TT_I	wrpr	%r0, 0x0327, %tt
	.word 0x87802004  ! 138: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879022d1  ! 139: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	.word 0x97480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd2800ba0  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
splash_cmpr_2_75:
	setx 0x6136c47098bcf00e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_76:
	.word 0x819827dd  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
	.word 0xa1902002  ! 144: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802020  ! 145: WRASI_I	wr	%r0, 0x0020, %asi
tagged_2_77:
	taddcctv %r25, 0x1ded, %r11
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_2_78:
	setx 0xd3c24b4443d85e2b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_79:
	set 0x60540000, %r31
	.word 0x8582a371  ! 148: WRCCR_I	wr	%r10, 0x0371, %ccr
	.word 0xa190200d  ! 149: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd28008a0  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2800c80  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
tagged_2_80:
	tsubcctv %r23, 0x174c, %r5
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd28008a0  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_2_81:
    set user_data_start, %o7
	.word 0x93902005  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800b60  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_2_82-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_82:
	.word 0x9194c00c  ! 160: WRPR_PIL_R	wrpr	%r19, %r12, %pil
cwp_2_83:
    set user_data_start, %o7
	.word 0x93902000  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_2_84:
	setx 0xa550ef0978299796, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_85:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_86:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 164: RDPC	rd	%pc, %r9
	.word 0x87802016  ! 165: WRASI_I	wr	%r0, 0x0016, %asi
tagged_2_87:
	taddcctv %r20, 0x1246, %r8
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_2_88:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 168: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9b480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_2_90:
	setx 0xe25101f7a7b68241, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 174: FqTOd	dis not found

splash_cmpr_2_92:
	setx 0xccd1a21e9a21b062, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_2_93:
	setx 0xd081e7ce47f0751c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe030  ! 178: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d02035  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 53
	rd %pc, %r19
	add %r19, (ivw_2_94-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_94:
	.word 0x9194800a  ! 180: WRPR_PIL_R	wrpr	%r18, %r10, %pil
	.word 0x87902159  ! 181: WRPR_TT_I	wrpr	%r0, 0x0159, %tt
intveclr_2_95:
	setx 0x7b384fe3586ce951, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_2_96:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x83d02033  ! 184: Tcc_I	te	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 185: RDPC	rd	%pc, %r20
splash_tba_2_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f8023ba  ! 187: SIR	sir	0x03ba
memptr_2_99:
	set user_data_start, %r31
	.word 0x8584376c  ! 188: WRCCR_I	wr	%r16, 0x176c, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x93d020b2  ! 190: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_cmpr_2_100:
	setx 0x47ff1909717b8263, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe08008a0  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa190200b  ! 194: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe0cfe030  ! 195: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
memptr_2_101:
	set 0x60740000, %r31
	.word 0x8580b001  ! 196: WRCCR_I	wr	%r2, 0x1001, %ccr
	.word 0x9f802f81  ! 197: SIR	sir	0x0f81
intveclr_2_102:
	setx 0xca1168b40963a3da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16a3743  ! 199: SDIVX_I	sdivx	%r8, 0xfffff743, %r16
splash_lsu_2_104:
	setx 0x984e7c0e5dadcc37, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 201: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_2_105:
	setx 0x2fc9bb8d0b34a53c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_2_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb34a2c3d	! Random illegal ?
	.word 0xe910c00b  ! 1: LDQF_R	-	[%r3, %r11], %f20
	.word 0x91a24833  ! 204: FADDs	fadds	%f9, %f19, %f8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01970  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_2_108:
	.word 0x91a189cc  ! 1: FDIVd	fdivd	%f6, %f12, %f8
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_2_109:
	nop
	setx 0xfffff7b1fffff6b5, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d903fa6  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x1fa6, %pstate
	.word 0x91d02033  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8dfe030  ! 212: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0xe8c004a0  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
DS_2_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f16, %f0
	.word 0xa5b4030a  ! 214: ALIGNADDRESS	alignaddr	%r16, %r10, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_2_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b1c313  ! 216: ALIGNADDRESS	alignaddr	%r7, %r19, %r8
splash_hpstate_2_112:
	.word 0x81982a96  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a96, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_2_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x8790207a  ! 222: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
tagged_2_114:
	tsubcctv %r9, 0x19f5, %r21
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x91d02033  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902792  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x0792, %pstate
splash_lsu_2_115:
	setx 0x0fbd6c146eb8dd41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_116:
	setx 0xb2b23d32c21da144, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 228: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d02034  ! 229: Tcc_I	te	icc_or_xcc, %r0 + 52
mondo_2_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d91800b  ! 230: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cf998  ! 231: SDIVX_I	sdivx	%r19, 0xfffff998, %r10
	.word 0x9ba00172  ! 232: FABSq	dis not found

memptr_2_119:
	set 0x60140000, %r31
	.word 0x85807a00  ! 233: WRCCR_I	wr	%r1, 0x1a00, %ccr
	.word 0xa1902007  ! 234: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cb2d5  ! 235: SDIVX_I	sdivx	%r18, 0xfffff2d5, %r18
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_121:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 236: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e000  ! 238: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0x99520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x879022db  ! 240: WRPR_TT_I	wrpr	%r0, 0x02db, %tt
	.word 0x98698013  ! 241: UDIVX_R	udivx 	%r6, %r19, %r12
debug_2_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_123:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_124:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 244: RDPC	rd	%pc, %r13
debug_2_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97693f37  ! 246: SDIVX_I	sdivx	%r4, 0xffffff37, %r11
mondo_2_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d900013  ! 247: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
change_to_randtl_2_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_128:
	.word 0x8f902000  ! 248: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 249: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 250: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_2_129:
	setx 0xa5557af986291338, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_130) + 56, 16, 16)) -> intp(0,0,2)
intvec_2_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 253: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	rd %pc, %r19
	add %r19, (ivw_2_131-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_131:
	.word 0x91900010  ! 254: WRPR_PIL_R	wrpr	%r0, %r16, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d903ee0  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x1ee0, %pstate
	.word 0x99902003  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e010  ! 259: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
tagged_2_132:
	tsubcctv %r13, 0x180e, %r14
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_2_133:
	.word 0x81982216  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xab814010  ! 263: WR_CLEAR_SOFTINT_R	wr	%r5, %r16, %clear_softint
splash_lsu_2_134:
	setx 0x5bbe424551e14ea3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_135:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 265: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
splash_cmpr_2_136:
	setx 0x28d38443dc6533c3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 267: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_2_137:
	setx 0x60cb5deb9f3620cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe020  ! 271: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x9f803a3e  ! 272: SIR	sir	0x1a3e
	.word 0x95a00554  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd4800a60  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	rd %pc, %r19
	add %r19, (ivw_2_138-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_138:
	.word 0x9191000c  ! 276: WRPR_PIL_R	wrpr	%r4, %r12, %pil
	.word 0x95a00dc1  ! 277: FdMULq	fdmulq	
debug_2_139:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x95a409cc  ! 280: FDIVd	fdivd	%f16, %f12, %f10
splash_tba_2_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902007  ! 282: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9f8026d0  ! 283: SIR	sir	0x06d0
intveclr_2_141:
	setx 0x7a5686690d7628df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b41  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0b41, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01967  ! 287: FqTOd	dis not found

	.word 0xd08008a0  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c7e000  ! 289: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	setx 0x513dea2a2894d156, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
debug_2_145:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_146) + 56, 16, 16)) -> intp(2,0,13)
intvec_2_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_147:
	.word 0x8f902000  ! 294: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_2_149:
	setx 0x297317377e237352, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_150:
	setx 0x80875ee0b22ff2d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_151:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x97a000c0  ! 302: FNEGd	fnegd	%f0, %f42
splash_tba_2_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d908008  ! 304: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0xe4c00e40  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe48804a0  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
tagged_2_154:
	tsubcctv %r21, 0x10d5, %r7
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x91500000  ! 310: RDPR_TPC	<illegal instruction>
splash_lsu_2_155:
	setx 0x35fa0a6220c23345, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_156:
	set user_data_start, %r31
	.word 0x858526b0  ! 312: WRCCR_I	wr	%r20, 0x06b0, %ccr
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
	.word 0x91414000  ! 313: RDPC	rd	%pc, %r8
debug_2_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_159:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 315: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
intveclr_2_160:
	setx 0x8984c7e4675e0b32, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_2_161:
	taddcctv %r17, 0x19c3, %r9
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_2_162:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_163:
	setx 0xe55cb148fed10c43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d930007  ! 320: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0x99902002  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x95702944  ! 322: POPC_I	popc	0x0944, %r10
change_to_randtl_2_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_165:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_2_166:
	setx 0x799f322a77f077dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a00163  ! 325: FABSq	dis not found

	.word 0xd2800ac0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x91d02032  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902fc4  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0fc4, %pstate
splash_cmpr_2_167:
	setx 0x3b2d8e7c1cdc262d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_2_168:
	set 0x003e0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_169:
	taddcctv %r9, 0x1ee9, %r22
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e40  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x72, %r9
splash_cmpr_2_170:
	setx 0x0756d920a22d6962, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x9b500000  ! 338: RDPR_TPC	<illegal instruction>
splash_tba_2_171:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_172:
	tsubcctv %r15, 0x10d9, %r17
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_2_173:
    set user_data_start, %o7
	.word 0x93902003  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88804a0  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
change_to_randtl_2_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_174:
	.word 0x8f902002  ! 344: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902009  ! 346: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_tba_2_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x17069c6f8fa03ad9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9745c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_178) + 56, 16, 16)) -> intp(5,0,28)
intvec_2_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00173  ! 351: FABSq	dis not found

splash_hpstate_2_179:
	.word 0x81982544  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
tagged_2_180:
	tsubcctv %r26, 0x1a73, %r25
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f802b89  ! 354: SIR	sir	0x0b89
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_2_181:
	setx 0x66a0a069e53c0152, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_2_184:
	.word 0x9ba049ca  ! 1: FDIVd	fdivd	%f32, %f10, %f44
	.word 0xd733616e  ! 1: STQF_I	-	%f11, [0x016e, %r13]
	normalw
	.word 0x91458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_2_185:
	nop
	setx 0xfffff14bfffff7cb, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_2_186:
    set user_data_start, %o7
	.word 0x93902006  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_2_187:
	.word 0x81982e9f  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9f, %hpstate
debug_2_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 369: FqTOd	dis not found

intveclr_2_190:
	setx 0xc2cfbeb9dd701e39, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9824000  ! 371: WR_SET_SOFTINT_R	wr	%r9, %r0, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_2_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9a800000  ! 374: ADDcc_R	addcc 	%r0, %r0, %r13
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 375: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_192:
	tsubcctv %r12, 0x1b86, %r19
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e40  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x72, %r18
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
	.word 0xa3414000  ! 381: RDPC	rd	%pc, %r17
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_2_194:
	setx 0x0c5185a827ea5f25, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802016  ! 385: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802089  ! 386: WRASI_I	wr	%r0, 0x0089, %asi
memptr_2_195:
	set user_data_start, %r31
	.word 0x85837db5  ! 387: WRCCR_I	wr	%r13, 0x1db5, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_2_196:
	setx 0xc3bc1d4e840f1c0b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd13230eb  ! 1: STQF_I	-	%f8, [0x10eb, %r8]
	normalw
	.word 0xa5458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xa1902007  ! 391: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9f8034e1  ! 392: SIR	sir	0x14e1
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_2_198:
	setx 0x61be1d5314f3bd79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 395: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_2_199:
	set 0x60340000, %r31
	.word 0x85843216  ! 396: WRCCR_I	wr	%r16, 0x1216, %ccr
tagged_2_200:
	tsubcctv %r2, 0x16a0, %r3
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_2_201:
	setx 0x15cf055510a067dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a189c5  ! 399: FDIVd	fdivd	%f6, %f36, %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_202:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 400: RDPC	rd	%pc, %r18
	setx 0x4d2e9cc95439c2c2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_204:
    set user_data_start, %o7
	.word 0x93902006  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd0d80e80  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
	.word 0xab80400c  ! 404: WR_CLEAR_SOFTINT_R	wr	%r1, %r12, %clear_softint
DS_2_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb32c00b  ! 1: STQF_R	-	%f13, [%r11, %r11]
	normalw
	.word 0x95458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r10
memptr_2_206:
	set 0x60140000, %r31
	.word 0x85847a6f  ! 406: WRCCR_I	wr	%r17, 0x1a6f, %ccr
debug_2_207:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 407: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xa1902004  ! 408: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_2_208:
	.word 0x81982fd5  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
	rd %pc, %r19
	add %r19, (ivw_2_209-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_209:
	.word 0x9192c005  ! 411: WRPR_PIL_R	wrpr	%r11, %r5, %pil
	.word 0xe08fe000  ! 412: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_210) + 0, 16, 16)) -> intp(3,0,30)
intvec_2_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903720  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x1720, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 415: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902096  ! 416: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
memptr_2_211:
	set 0x60340000, %r31
	.word 0x85813f29  ! 417: WRCCR_I	wr	%r4, 0x1f29, %ccr
	.word 0x91d02034  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_hpstate_2_212:
	.word 0x8198260c  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060c, %hpstate
donret_2_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_213-donret_2_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe0800ba0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r16
	.word 0xe0c7e010  ! 422: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
memptr_2_214:
	set 0x60540000, %r31
	.word 0x85817f08  ! 423: WRCCR_I	wr	%r5, 0x1f08, %ccr
intveclr_2_215:
	setx 0xf00bccffbcaaf9e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa8f88014  ! 425: SDIVcc_R	sdivcc 	%r2, %r20, %r20
	.word 0xd0d00e60  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
DS_2_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_2_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d9033a3  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x13a3, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd0800bc0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_218) + 40, 16, 16)) -> intp(7,0,27)
intvec_2_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 434: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe010  ! 436: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
	.word 0x9350c000  ! 437: RDPR_TT	<illegal instruction>
DS_2_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_2_222:
    set user_data_start, %o7
	.word 0x93902000  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02035  ! 440: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_2_223:
	setx 0xd904a095f8534d4d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902b77  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0b77, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_224:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 443: RDPC	rd	%pc, %r10
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_2_225:
	setx 0xa9cba6983ab90548, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 446: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
memptr_2_227:
	set 0x60340000, %r31
	.word 0x858328ee  ! 447: WRCCR_I	wr	%r12, 0x08ee, %ccr
	.word 0x99a00171  ! 448: FABSq	dis not found

mondo_2_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 449: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
splash_cmpr_2_229:
	setx 0xec208cb94d80a8fe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8780204f  ! 453: WRASI_I	wr	%r0, 0x004f, %asi
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_230:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 454: RDPC	rd	%pc, %r8
	setx 0x1a2722e8f2670b40, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_232:
	setx 0x6d0c767fb938facd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab820006  ! 457: WR_CLEAR_SOFTINT_R	wr	%r8, %r6, %clear_softint
	.word 0x87902003  ! 458: WRPR_TT_I	wrpr	%r0, 0x0003, %tt
	.word 0xd6c804a0  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_cmpr_2_233:
	setx 0x8bb110023a789a15, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b45c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x87902178  ! 462: WRPR_TT_I	wrpr	%r0, 0x0178, %tt
	.word 0x91d02035  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99902004  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_2_234:
	setx 0x15698ed96440346b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f22, %f0
	.word 0x9bb2c313  ! 466: ALIGNADDRESS	alignaddr	%r11, %r19, %r13
	.word 0x87802014  ! 467: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d020b5  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 181
memptr_2_236:
	set 0x60740000, %r31
	.word 0x85843589  ! 469: WRCCR_I	wr	%r16, 0x1589, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_2_237:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 471: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
pmu_2_238:
	nop
	setx 0xfffff63bfffff9e9, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_239:
	setx 0x0258a9a672d878cb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 474: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_2_240:
	setx 0xc49bffa53d938e5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 476: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_2_241:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_2_243:
	setx 0xd10c1f20ca7341b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_244:
	.word 0x81982f0d  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
	.word 0xe6d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_cmpr_2_245:
	setx 0xf6e26387bfc5e373, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_246:
	tsubcctv %r21, 0x186a, %r15
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c00e80  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r19
intveclr_2_247:
	setx 0x1d6e06cc38c47c3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_248) + 48, 16, 16)) -> intp(3,0,7)
intvec_2_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a10d2a  ! 489: FsMULd	fsmuld	%f4, %f10, %f40
splash_tba_2_249:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_250:
	setx 0x6a9442979da9fe4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_2_251:
    set user_data_start, %o7
	.word 0x93902004  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879021b1  ! 493: WRPR_TT_I	wrpr	%r0, 0x01b1, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 494: FqTOd	dis not found

splash_cmpr_2_253:
	setx 0xf8a3af857c55c130, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_254) + 40, 16, 16)) -> intp(2,0,15)
intvec_2_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_2_255:
	.word 0x8198223d  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x023d, %hpstate
DS_2_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
memptr_1_0:
	set user_data_start, %r31
	.word 0x85802c3b  ! 1: WRCCR_I	wr	%r0, 0x0c3b, %ccr
splash_lsu_1_1:
	setx 0xd139c0ef71e31a6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 3: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
debug_1_3:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 6: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 7: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_1_4-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_4:
	.word 0x9192c008  ! 8: WRPR_PIL_R	wrpr	%r11, %r8, %pil
DS_1_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb114013  ! 1: LDQF_R	-	[%r5, %r19], %f13
	.word 0xa5a18828  ! 9: FADDs	fadds	%f6, %f8, %f18
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x879021f2  ! 11: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
cwp_1_6:
    set user_data_start, %o7
	.word 0x93902006  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_1_7:
	set 0x60140000, %r31
	.word 0x858120eb  ! 15: WRCCR_I	wr	%r4, 0x00eb, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_8:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
splash_tba_1_9:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_1_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_1_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a00173  ! 20: FABSq	dis not found

memptr_1_12:
	set user_data_start, %r31
	.word 0x8584a29d  ! 21: WRCCR_I	wr	%r18, 0x029d, %ccr
splash_cmpr_1_13:
	setx 0x5836e7b7b13bfc19, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_1_14:
    set user_data_start, %o7
	.word 0x93902002  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_1_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_1_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f24, %f6
	.word 0x95b4c314  ! 25: ALIGNADDRESS	alignaddr	%r19, %r20, %r10
	.word 0xa1902008  ! 26: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_1_17:
	taddcctv %r1, 0x174d, %r9
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0xa9a0016d  ! 30: FABSq	dis not found

	.word 0x93a00168  ! 31: FABSq	dis not found

	.word 0xe6cfe000  ! 32: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa5520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_19)+56, 16, 16)) -> intp(1,1,3)
xir_1_19:
	.word 0xa9822814  ! 36: WR_SET_SOFTINT_I	wr	%r8, 0x0814, %set_softint
	.word 0xd0c00e60  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0xa190200e  ! 38: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 39: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_1_20:
	setx 0x3f7ebf110e116af7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_21:
	.word 0x97a289c8  ! 1: FDIVd	fdivd	%f10, %f8, %f42
	allclean
	.word 0x9bb48313  ! 41: ALIGNADDRESS	alignaddr	%r18, %r19, %r13
debug_1_22:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_1_24:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 45: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
splash_lsu_1_25:
	setx 0xe1aecc5e6341d911, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a289d3  ! 47: FDIVd	fdivd	%f10, %f50, %f12
DS_1_26:
	.word 0xa3a089d1  ! 1: FDIVd	fdivd	%f2, %f48, %f48
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_1_27:
	nop
	setx 0xfffffeddfffffd77, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802083  ! 50: WRASI_I	wr	%r0, 0x0083, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_28) + 56, 16, 16)) -> intp(6,0,13)
intvec_1_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe020  ! 52: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d903c34  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x1c34, %pstate
tagged_1_29:
	taddcctv %r19, 0x1cbd, %r20
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x83d02035  ! 56: Tcc_I	te	icc_or_xcc, %r0 + 53
tagged_1_30:
	tsubcctv %r11, 0x1d42, %r20
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02035  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 59: RDPC	rd	%pc, %r17
mondo_1_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90800d  ! 60: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x87902350  ! 61: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_1_33:
	set user_data_start, %r31
	.word 0x8584362b  ! 63: WRCCR_I	wr	%r16, 0x162b, %ccr
cwp_1_34:
    set user_data_start, %o7
	.word 0x93902005  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x99a000c2  ! 66: FNEGd	fnegd	%f2, %f12
	.word 0xa190200a  ! 67: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 70: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99a4c9cd  ! 71: FDIVd	fdivd	%f50, %f44, %f12
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_1_36:
	setx 0x9d2100d327599518, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x7b6228ae0f3df9fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_39:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd08008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_1_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940004  ! 79: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x9f80384b  ! 80: SIR	sir	0x184b
cwp_1_42:
    set user_data_start, %o7
	.word 0x93902005  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xab834009  ! 82: WR_CLEAR_SOFTINT_R	wr	%r13, %r9, %clear_softint
splash_hpstate_1_43:
	.word 0x81982f87  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_1_45:
	setx 0x3cd66eeca8f0b5de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_1_46:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xcb4ee2bb8305cc42, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_48:
	.word 0x819824f5  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04f5, %hpstate
	.word 0xad82bec5  ! 90: WR_SOFTINT_REG_I	wr	%r10, 0x1ec5, %softint
	.word 0x879020d2  ! 91: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_49:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 92: RDPC	rd	%pc, %r8
	.word 0xd2cfe030  ! 93: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x8d90316e  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x116e, %pstate
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
	.word 0x95414000  ! 95: RDPC	rd	%pc, %r10
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01960  ! 97: FqTOd	dis not found

splash_cmpr_1_52:
	setx 0x9e9b6bdfbe8c923e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_53:
	.word 0x8198268e  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068e, %hpstate
tagged_1_54:
	tsubcctv %r9, 0x1b9e, %r21
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xaf629e38e6a207ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d93000b  ! 103: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0x8d903d21  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x1d21, %pstate
	.word 0xd8cfe000  ! 105: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
splash_lsu_1_57:
	setx 0x2df782d8f0259cef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x8780201c  ! 108: WRASI_I	wr	%r0, 0x001c, %asi
debug_1_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 110: RDPC	rd	%pc, %r19
tagged_1_61:
	taddcctv %r24, 0x1d38, %r19
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_1_62:
	setx 0x0684b37d4304d3c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01966  ! 114: FqTOd	dis not found

	.word 0xd49004a0  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
intveclr_1_64:
	setx 0x638593c7e06781f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_65:
	.word 0x8f902002  ! 117: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
memptr_1_66:
	set user_data_start, %r31
	.word 0x8584347e  ! 118: WRCCR_I	wr	%r16, 0x147e, %ccr
memptr_1_67:
	set 0x60140000, %r31
	.word 0x8580f569  ! 119: WRCCR_I	wr	%r3, 0x1569, %ccr
	.word 0xa190200d  ! 120: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_1_68:
	setx 0x0558b6d10d3cb44d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab810005  ! 122: WR_CLEAR_SOFTINT_R	wr	%r4, %r5, %clear_softint
	.word 0x96693481  ! 123: UDIVX_I	udivx 	%r4, 0xfffff481, %r11
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_1_69:
	setx 0x2040359f13e03eaa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_70) + 56, 16, 16)) -> intp(4,0,18)
intvec_1_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_71:
	setx 0x92ee6bd0f1e8e236, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 128: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87902039  ! 129: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
	.word 0x91a049cb  ! 130: FDIVd	fdivd	%f32, %f42, %f8
	.word 0xa0d1e5cb  ! 131: UMULcc_I	umulcc 	%r7, 0x05cb, %r16
change_to_randtl_1_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_72:
	.word 0x8f902002  ! 132: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_1_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_73:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0800c20  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	.word 0xd0cfe000  ! 135: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
splash_hpstate_1_74:
	.word 0x81982bc6  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc6, %hpstate
	.word 0x879021cd  ! 137: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0x87802058  ! 138: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902338  ! 139: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0x91480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd2800c80  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
splash_cmpr_1_75:
	setx 0x693ae8f1bfb36200, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_76:
	.word 0x81982307  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0xa190200f  ! 144: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802020  ! 145: WRASI_I	wr	%r0, 0x0020, %asi
tagged_1_77:
	taddcctv %r26, 0x13ff, %r23
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_1_78:
	setx 0x05536383813295f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_79:
	set 0x60340000, %r31
	.word 0x85853ba4  ! 148: WRCCR_I	wr	%r20, 0x1ba4, %ccr
	.word 0xa1902008  ! 149: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd28008a0  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_1_80:
	tsubcctv %r24, 0x1b57, %r16
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd2800b80  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_1_81:
    set user_data_start, %o7
	.word 0x93902001  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd28804a0  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800b60  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_1_82-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_82:
	.word 0x91924000  ! 160: WRPR_PIL_R	wrpr	%r9, %r0, %pil
cwp_1_83:
    set user_data_start, %o7
	.word 0x93902001  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_1_84:
	setx 0x709f1aa712246f27, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_85:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_86:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 164: RDPC	rd	%pc, %r9
	.word 0x8780208a  ! 165: WRASI_I	wr	%r0, 0x008a, %asi
tagged_1_87:
	taddcctv %r3, 0x18a7, %r16
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_1_88:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902009  ! 168: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd48008a0  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_1_90:
	setx 0x2614306d75d55b97, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 174: FqTOd	dis not found

splash_cmpr_1_92:
	setx 0x99d32ec9345aef02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_1_93:
	setx 0x9add122c390fa79b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe030  ! 178: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d020b4  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 180
	rd %pc, %r19
	add %r19, (ivw_1_94-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_94:
	.word 0x9191c009  ! 180: WRPR_PIL_R	wrpr	%r7, %r9, %pil
	.word 0x87902217  ! 181: WRPR_TT_I	wrpr	%r0, 0x0217, %tt
intveclr_1_95:
	setx 0x925a39c81ba24d80, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_1_96:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_97:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 185: RDPC	rd	%pc, %r12
splash_tba_1_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f8034c4  ! 187: SIR	sir	0x14c4
memptr_1_99:
	set user_data_start, %r31
	.word 0x85806231  ! 188: WRCCR_I	wr	%r1, 0x0231, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x91d02034  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_1_100:
	setx 0x053843aa56fa5e9f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe08008a0  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa1902009  ! 194: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe0cfe010  ! 195: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_1_101:
	set 0x60540000, %r31
	.word 0x85812d7f  ! 196: WRCCR_I	wr	%r4, 0x0d7f, %ccr
	.word 0x9f80372c  ! 197: SIR	sir	0x172c
intveclr_1_102:
	setx 0x6d5e5b5e07bfcacc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b6805  ! 199: SDIVX_I	sdivx	%r13, 0x0805, %r9
splash_lsu_1_104:
	setx 0x5df30cfe5db8a6af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 201: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_1_105:
	setx 0x3a08f3c3196e08aa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_1_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb96d5ad7	! Random illegal ?
	.word 0xd9134005  ! 1: LDQF_R	-	[%r13, %r5], %f12
	.word 0xa3a2c82c  ! 204: FADDs	fadds	%f11, %f12, %f17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01965  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_1_108:
	.word 0x97a509d3  ! 1: FDIVd	fdivd	%f20, %f50, %f42
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_1_109:
	nop
	setx 0xfffffe88ffffff51, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b4  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8d902b0b  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x0b0b, %pstate
	.word 0x91d020b2  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe8dfe010  ! 212: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0xe8c004a0  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
DS_1_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f28, %f26
	.word 0x95b18307  ! 214: ALIGNADDRESS	alignaddr	%r6, %r7, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_1_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb14304  ! 216: ALIGNADDRESS	alignaddr	%r5, %r4, %r13
splash_hpstate_1_112:
	.word 0x81982946  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0946, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_1_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x879021a1  ! 222: WRPR_TT_I	wrpr	%r0, 0x01a1, %tt
tagged_1_114:
	tsubcctv %r7, 0x1e76, %r12
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x93d02034  ! 224: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d90304d  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x104d, %pstate
splash_lsu_1_115:
	setx 0x2ba6ec8bafb8a863, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_116:
	setx 0xa1d3bfef7f10aefe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 228: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d02033  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_1_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d928006  ! 230: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ceba4  ! 231: SDIVX_I	sdivx	%r19, 0x0ba4, %r12
	.word 0xa3a00168  ! 232: FABSq	dis not found

memptr_1_119:
	set 0x60740000, %r31
	.word 0x8584a338  ! 233: WRCCR_I	wr	%r18, 0x0338, %ccr
	.word 0xa190200a  ! 234: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9969fc9d  ! 235: SDIVX_I	sdivx	%r7, 0xfffffc9d, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 236: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e030  ! 238: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
	.word 0x95520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x87902374  ! 240: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
	.word 0x92688006  ! 241: UDIVX_R	udivx 	%r2, %r6, %r9
debug_1_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_123:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_124:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 244: RDPC	rd	%pc, %r8
debug_1_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cec38  ! 246: SDIVX_I	sdivx	%r19, 0x0c38, %r10
mondo_1_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d900013  ! 247: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
change_to_randtl_1_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_128:
	.word 0x8f902002  ! 248: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 250: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_1_129:
	setx 0xbaaf68f93a73124f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_130) + 0, 16, 16)) -> intp(7,0,4)
intvec_1_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 253: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	rd %pc, %r19
	add %r19, (ivw_1_131-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_131:
	.word 0x91948003  ! 254: WRPR_PIL_R	wrpr	%r18, %r3, %pil
	.word 0xd4d80e40  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0x8d90303f  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x103f, %pstate
	.word 0x99902001  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e020  ! 259: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
tagged_1_132:
	tsubcctv %r9, 0x1f71, %r6
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_1_133:
	.word 0x81982054  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0054, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xab82000b  ! 263: WR_CLEAR_SOFTINT_R	wr	%r8, %r11, %clear_softint
splash_lsu_1_134:
	setx 0xc44dce436ee186bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_135:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 265: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
splash_cmpr_1_136:
	setx 0x909537992ab72e96, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 267: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_1_137:
	setx 0x4e1a6c749435b27f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe020  ! 271: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x9f802a09  ! 272: SIR	sir	0x0a09
	.word 0x95a00554  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd48008a0  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	rd %pc, %r19
	add %r19, (ivw_1_138-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_138:
	.word 0x91918007  ! 276: WRPR_PIL_R	wrpr	%r6, %r7, %pil
	.word 0x93a4cdcc  ! 277: FdMULq	fdmulq	
debug_1_139:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x91a189c4  ! 280: FDIVd	fdivd	%f6, %f4, %f8
splash_tba_1_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1902009  ! 282: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9f802204  ! 283: SIR	sir	0x0204
intveclr_1_141:
	setx 0x8521f33e41af45b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032c0  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x12c0, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01964  ! 287: FqTOd	dis not found

	.word 0xd0800b80  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	.word 0xd0c7e030  ! 289: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	setx 0x4046e32b611a8055, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
debug_1_145:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_146) + 48, 16, 16)) -> intp(3,0,17)
intvec_1_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_147:
	.word 0x8f902000  ! 294: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_1_149:
	setx 0x8e61f4ecafe0f408, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_150:
	setx 0xe9ba8a96c7c869df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_151:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0x99a000d4  ! 302: FNEGd	fnegd	%f20, %f12
splash_tba_1_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d910008  ! 304: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0xe4c00e80  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r18
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe48804a0  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
tagged_1_154:
	tsubcctv %r26, 0x1aec, %r17
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x97500000  ! 310: RDPR_TPC	<illegal instruction>
splash_lsu_1_155:
	setx 0x38f441cc5bc0c619, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_156:
	set user_data_start, %r31
	.word 0x858525a2  ! 312: WRCCR_I	wr	%r20, 0x05a2, %ccr
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
	.word 0x9b414000  ! 313: RDPC	rd	%pc, %r13
debug_1_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_159:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 315: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
intveclr_1_160:
	setx 0xa23ec0a615b5a956, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_1_161:
	taddcctv %r14, 0x1386, %r18
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_1_162:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_163:
	setx 0x4928b683a99b8f05, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d92c014  ! 320: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0x99902005  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x91702919  ! 322: POPC_I	popc	0x0919, %r8
change_to_randtl_1_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_165:
	.word 0x8f902001  ! 323: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_166:
	setx 0x0b74bca4d2683c85, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba0016d  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x91d020b5  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d90295a  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x095a, %pstate
splash_cmpr_1_167:
	setx 0x4cd92009bfeb26d7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_1_168:
	set 0x003f0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_169:
	taddcctv %r11, 0x14dd, %r6
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e60  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x73, %r9
splash_cmpr_1_170:
	setx 0x4e566871a333a673, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x95500000  ! 338: RDPR_TPC	<illegal instruction>
splash_tba_1_171:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_172:
	tsubcctv %r4, 0x11ee, %r25
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_1_173:
    set user_data_start, %o7
	.word 0x93902004  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8880e60  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x73, %r12
change_to_randtl_1_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_174:
	.word 0x8f902001  ! 344: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902007  ! 346: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_1_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x89fe95c5b3bd8953, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9545c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_178) + 0, 16, 16)) -> intp(5,0,13)
intvec_1_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a0016a  ! 351: FABSq	dis not found

splash_hpstate_1_179:
	.word 0x819821c4  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
tagged_1_180:
	tsubcctv %r19, 0x1697, %r6
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f802872  ! 354: SIR	sir	0x0872
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_1_181:
	setx 0x699a95103bad6a2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_1_184:
	.word 0x9ba349cb  ! 1: FDIVd	fdivd	%f44, %f42, %f44
	.word 0xd1352c29  ! 1: STQF_I	-	%f8, [0x0c29, %r20]
	normalw
	.word 0x9b458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9b464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_1_185:
	nop
	setx 0xfffff0fcfffff23c, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_1_186:
    set user_data_start, %o7
	.word 0x93902005  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_1_187:
	.word 0x81982a1c  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1c, %hpstate
debug_1_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 369: FqTOd	dis not found

intveclr_1_190:
	setx 0x32325b89c232a6ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9810010  ! 371: WR_SET_SOFTINT_R	wr	%r4, %r16, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_1_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa0848010  ! 374: ADDcc_R	addcc 	%r18, %r16, %r16
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 375: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_192:
	tsubcctv %r6, 0x13a0, %r4
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e60  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x73, %r18
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
	.word 0x93414000  ! 381: RDPC	rd	%pc, %r9
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_1_194:
	setx 0xebdea8a23ad03ca0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802004  ! 385: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 386: WRASI_I	wr	%r0, 0x0089, %asi
memptr_1_195:
	set user_data_start, %r31
	.word 0x85822f00  ! 387: WRCCR_I	wr	%r8, 0x0f00, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_1_196:
	setx 0x039db16b4d590943, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe732ea60  ! 1: STQF_I	-	%f19, [0x0a60, %r11]
	normalw
	.word 0x9b458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa190200d  ! 391: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9f803626  ! 392: SIR	sir	0x1626
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_1_198:
	setx 0xeef4eeac3f234c3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_199:
	set 0x60340000, %r31
	.word 0x8584e197  ! 396: WRCCR_I	wr	%r19, 0x0197, %ccr
tagged_1_200:
	tsubcctv %r10, 0x1382, %r11
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_1_201:
	setx 0x4c6ab5c0d3710121, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba349ca  ! 399: FDIVd	fdivd	%f44, %f10, %f44
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_202:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 400: RDPC	rd	%pc, %r9
	setx 0xe45302efdc94644e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_204:
    set user_data_start, %o7
	.word 0x93902007  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd0d80e80  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
	.word 0xab84c011  ! 404: WR_CLEAR_SOFTINT_R	wr	%r19, %r17, %clear_softint
DS_1_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7318003  ! 1: STQF_R	-	%f11, [%r3, %r6]
	normalw
	.word 0x97458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r11
memptr_1_206:
	set 0x60140000, %r31
	.word 0x8585307e  ! 406: WRCCR_I	wr	%r20, 0x107e, %ccr
debug_1_207:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 407: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xa190200d  ! 408: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_1_208:
	.word 0x819829d5  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d5, %hpstate
	rd %pc, %r19
	add %r19, (ivw_1_209-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_209:
	.word 0x91944011  ! 411: WRPR_PIL_R	wrpr	%r17, %r17, %pil
	.word 0xe08fe020  ! 412: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_210) + 32, 16, 16)) -> intp(6,0,14)
intvec_1_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035ea  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x15ea, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902369  ! 416: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
memptr_1_211:
	set 0x60140000, %r31
	.word 0x8584e6c4  ! 417: WRCCR_I	wr	%r19, 0x06c4, %ccr
	.word 0x91d020b5  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_hpstate_1_212:
	.word 0x819821d6  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
donret_1_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_213-donret_1_213), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe0800ac0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
	.word 0xe0c7e010  ! 422: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
memptr_1_214:
	set 0x60540000, %r31
	.word 0x8581668c  ! 423: WRCCR_I	wr	%r5, 0x068c, %ccr
intveclr_1_215:
	setx 0x254a2a49e66acaca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa8f8c005  ! 425: SDIVcc_R	sdivcc 	%r3, %r5, %r20
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_1_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_1_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d90288c  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd0800be0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_218) + 56, 16, 16)) -> intp(5,0,12)
intvec_1_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196d  ! 434: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe020  ! 436: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0xa950c000  ! 437: RDPR_TT	<illegal instruction>
DS_1_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_1_222:
    set user_data_start, %o7
	.word 0x93902004  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d020b2  ! 440: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_cmpr_1_223:
	setx 0xf198cd38589b3a1f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903831  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x1831, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_224:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 443: RDPC	rd	%pc, %r17
	.word 0x8d802000  ! 444: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_1_225:
	setx 0x0fc30161c62b2163, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d910013  ! 446: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
memptr_1_227:
	set 0x60340000, %r31
	.word 0x85807730  ! 447: WRCCR_I	wr	%r1, 0x1730, %ccr
	.word 0x93a00164  ! 448: FABSq	dis not found

mondo_1_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 449: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
splash_cmpr_1_229:
	setx 0x55efbf03ac549cf3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x87802058  ! 453: WRASI_I	wr	%r0, 0x0058, %asi
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_230:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 454: RDPC	rd	%pc, %r11
	setx 0x784e9dfb2f86b4f7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_232:
	setx 0xf6e0092ed273a23e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab850006  ! 457: WR_CLEAR_SOFTINT_R	wr	%r20, %r6, %clear_softint
	.word 0x8790211b  ! 458: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
	.word 0xd6c80e40  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
splash_cmpr_1_233:
	setx 0xd2a7bc05c78cfe8e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa545c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x879021ea  ! 462: WRPR_TT_I	wrpr	%r0, 0x01ea, %tt
	.word 0x91d02035  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99902002  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_cmpr_1_234:
	setx 0x0eb724d0681828dd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f12, %f22
	.word 0x99b20307  ! 466: ALIGNADDRESS	alignaddr	%r8, %r7, %r12
	.word 0x87802016  ! 467: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d020b3  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 179
memptr_1_236:
	set 0x60340000, %r31
	.word 0x85853287  ! 469: WRCCR_I	wr	%r20, 0x1287, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_1_237:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 471: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
pmu_1_238:
	nop
	setx 0xfffff837fffff43c, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_239:
	setx 0x26c0a132a0dd2f53, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_240:
	setx 0xe0dbf9ff6cdf1054, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 476: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_1_241:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_1_243:
	setx 0x42488ef72bdd6763, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_244:
	.word 0x81982b4c  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	.word 0xe6d7e010  ! 483: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_cmpr_1_245:
	setx 0x2ef59d14117d8cc1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_246:
	tsubcctv %r19, 0x17b8, %r11
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_1_247:
	setx 0x1bd706a868513660, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_248) + 40, 16, 16)) -> intp(5,0,23)
intvec_1_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a10d33  ! 489: FsMULd	fsmuld	%f4, %f50, %f40
splash_tba_1_249:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_250:
	setx 0x713375998c5ac417, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_1_251:
    set user_data_start, %o7
	.word 0x93902000  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879022d9  ! 493: WRPR_TT_I	wrpr	%r0, 0x02d9, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196b  ! 494: FqTOd	dis not found

splash_cmpr_1_253:
	setx 0x07743305b7600fb3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_254) + 40, 16, 16)) -> intp(1,0,5)
intvec_1_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_1_255:
	.word 0x81982134  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0134, %hpstate
DS_1_256:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
memptr_0_0:
	set user_data_start, %r31
	.word 0x85836d25  ! 1: WRCCR_I	wr	%r13, 0x0d25, %ccr
splash_lsu_0_1:
	setx 0xc327f1dcd44ee191, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 3: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_2:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 4: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6bfc020  ! 5: STDA_R	stda	%r19, [%r31 + %r0] 0x01
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
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 6: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 7: Tcc_R	tne	icc_or_xcc, %r0 + %r30
cmp_0_4:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_4:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_4
    nop
cmp_wait0_4:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_4
    nop
    ba,a cmp_startwait0_4
continue_cmp_0_4:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944008  ! 8: WRPR_PIL_R	wrpr	%r17, %r8, %pil
DS_0_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe1124001  ! 1: LDQF_R	-	[%r9, %r1], %f16
	.word 0xa5a34830  ! 9: FADDs	fadds	%f13, %f16, %f18
	.word 0xe44fc000  ! 10: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x87902041  ! 11: WRPR_TT_I	wrpr	%r0, 0x0041, %tt
cwp_0_6:
    set user_data_start, %o7
	.word 0x93902005  ! 12: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe46fed25  ! 13: LDSTUB_I	ldstub	%r18, [%r31 + 0x0d25]
	.word 0x3e800001  ! 14: BVC	bvc,a	<label_0x1>
memptr_0_7:
	set 0x60140000, %r31
	.word 0x85846fd1  ! 15: WRCCR_I	wr	%r17, 0x0fd1, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_8
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_8
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_8:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 16: RDPC	rd	%pc, %r9
splash_tba_0_9:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 17: WRPR_TBA_R	wrpr	%r0, %r12, %tba
DS_0_10:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 18: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_0_11:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 19: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a00161  ! 20: FABSq	dis not found

memptr_0_12:
	set user_data_start, %r31
	.word 0x8582eeed  ! 21: WRCCR_I	wr	%r11, 0x0eed, %ccr
splash_cmpr_0_13:
	setx 0xbbe70c9df3180e8b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 22: WR_STICK_REG_R	wr	%r0, %r1, %-
cwp_0_14:
    set user_data_start, %o7
	.word 0x93902003  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_0_15:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 24: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_0_16:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f24, %f26
	.word 0x93b30300  ! 25: ALIGNADDRESS	alignaddr	%r12, %r0, %r9
	.word 0xa1902008  ! 26: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd327c000  ! 27: STF_R	st	%f9, [%r0, %r31]
	.word 0xd26feeed  ! 28: LDSTUB_I	ldstub	%r9, [%r31 + 0x0eed]
tagged_0_17:
	taddcctv %r9, 0x14d6, %r17
	.word 0xd207eeed  ! 29: LDUW_I	lduw	[%r31 + 0x0eed], %r9
	.word 0xa5a00172  ! 30: FABSq	dis not found

	.word 0xa7a00168  ! 31: FABSq	dis not found

	.word 0xe6cfe010  ! 32: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 33: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x99520000  ! 34: RDPR_PIL	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196c  ! 35: FqTOd	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_19)+8, 16, 16)) -> intp(0,1,3)
xir_0_19:
	.word 0xa980699e  ! 36: WR_SET_SOFTINT_I	wr	%r1, 0x099e, %set_softint
	.word 0xd0c00e40  ! 37: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r8
	.word 0xa1902006  ! 38: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_20:
	setx 0x08de939d0cc66a6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_21:
	.word 0x93a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f40
	allclean
	.word 0x9bb30303  ! 41: ALIGNADDRESS	alignaddr	%r12, %r3, %r13
debug_0_22:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 42: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_23:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e003  ! 44: CASA_R	casa	[%r31] %asi, %r3, %r13
debug_0_24:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_24:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_24
    nop
debug_wait0_24:
    ld [%r23], %r2
    brnz %r2, debug_wait0_24
    nop
    ba,a debug_startwait0_24
continue_debug_0_24:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_24:
    cmp %r13, %r15
    bne,a wait_for_stat_0_24
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_24:
    cmp %r14, %r15
    bne,a wait_for_debug_0_24
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00492  ! 45: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
splash_lsu_0_25:
	setx 0x46cc720d9e17dfdd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 46: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a509cc  ! 47: FDIVd	fdivd	%f20, %f12, %f40
DS_0_26:
	.word 0x97a2c9d4  ! 1: FDIVd	fdivd	%f42, %f20, %f42
	.word 0xbfefc000  ! 48: RESTORE_R	restore	%r31, %r0, %r31
pmu_0_27:
	nop
	setx 0xfffff5c4fffffc66, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87802080  ! 50: WRASI_I	wr	%r0, 0x0080, %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_28) + 40, 16, 16)) -> intp(4,0,11)
intvec_0_28:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6cfe030  ! 52: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0xd67fe99e  ! 53: SWAP_I	swap	%r11, [%r31 + 0x099e]
	.word 0x8d902018  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
tagged_0_29:
	taddcctv %r16, 0x1fda, %r24
	.word 0xd607e99e  ! 55: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x83d020b2  ! 56: Tcc_I	te	icc_or_xcc, %r0 + 178
tagged_0_30:
	tsubcctv %r23, 0x1283, %r16
	.word 0xd607e99e  ! 57: LDUW_I	lduw	[%r31 + 0x099e], %r11
	.word 0x91d02034  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_31
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 59: RDPC	rd	%pc, %r19
mondo_0_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d944002  ! 60: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0x879022ca  ! 61: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
	.word 0xe647e99e  ! 62: LDSW_I	ldsw	[%r31 + 0x099e], %r19
memptr_0_33:
	set user_data_start, %r31
	.word 0x8581f9c7  ! 63: WRCCR_I	wr	%r7, 0x19c7, %ccr
cwp_0_34:
    set user_data_start, %o7
	.word 0x93902003  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe647c000  ! 65: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa1a000d4  ! 66: FNEGd	fnegd	%f20, %f16
	.word 0xa190200e  ! 67: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r16
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_35
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_35:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 69: CASA_R	casa	[%r31] %asi, %r20, %r16
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 70: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91a309cd  ! 71: FDIVd	fdivd	%f12, %f44, %f8
	.word 0x81b01021  ! 72: SIAM	siam	1
intveclr_0_36:
	setx 0x85262a94c7cd078d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x34088376ce8d9043, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_37:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_38:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 75: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_39:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 76: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd0800c80  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
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
	.word 0xd1e7e00d  ! 78: CASA_R	casa	[%r31] %asi, %r13, %r8
mondo_0_41:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d918004  ! 79: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0x9f8035d0  ! 80: SIR	sir	0x15d0
cwp_0_42:
    set user_data_start, %o7
	.word 0x93902001  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab818004  ! 82: WR_CLEAR_SOFTINT_R	wr	%r6, %r4, %clear_softint
splash_hpstate_0_43:
	.word 0x8198260f  ! 83: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_44:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 84: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_0_45:
	setx 0x84f70193dd433996, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 86: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_46:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 87: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	setx 0xbd0de0e1896a9ee1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_47:
	.word 0x39400001  ! 88: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_48:
	.word 0x81982245  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
	.word 0xad82291d  ! 90: WR_SOFTINT_REG_I	wr	%r8, 0x091d, %softint
	.word 0x8790224a  ! 91: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_49
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_49
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_49:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 92: RDPC	rd	%pc, %r9
	.word 0xd2cfe010  ! 93: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d902007  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
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
	.word 0x95414000  ! 95: RDPC	rd	%pc, %r10
	.word 0xd527e91d  ! 96: STF_I	st	%f10, [0x091d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01972  ! 97: FqTOd	dis not found

splash_cmpr_0_52:
	setx 0xcdf78391adec3a2b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 98: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_53:
	.word 0x8198274e  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074e, %hpstate
tagged_0_54:
	tsubcctv %r7, 0x1789, %r19
	.word 0xd807e91d  ! 100: LDUW_I	lduw	[%r31 + 0x091d], %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x4274ecfa51008063, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_56:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d90400d  ! 103: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0x8d902cf9  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x0cf9, %pstate
	.word 0xd8cfe020  ! 105: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
splash_lsu_0_57:
	setx 0xb32e9268a386d60f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802010  ! 108: WRASI_I	wr	%r0, 0x0010, %asi
debug_0_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_60
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_60:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 110: RDPC	rd	%pc, %r13
tagged_0_61:
	taddcctv %r21, 0x18ec, %r7
	.word 0xda07e91d  ! 111: LDUW_I	lduw	[%r31 + 0x091d], %r13
splash_cmpr_0_62:
	setx 0xadf174022c332cf9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 112: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda27e91d  ! 113: STW_I	stw	%r13, [%r31 + 0x091d]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01964  ! 114: FqTOd	dis not found

	.word 0xd4900e60  ! 115: LDUHA_R	lduha	[%r0, %r0] 0x73, %r10
intveclr_0_64:
	setx 0xc886558cc23be9cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_65:
	.word 0x8f902000  ! 117: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
memptr_0_66:
	set user_data_start, %r31
	.word 0x858237ea  ! 118: WRCCR_I	wr	%r8, 0x17ea, %ccr
memptr_0_67:
	set 0x60340000, %r31
	.word 0x8584203f  ! 119: WRCCR_I	wr	%r16, 0x003f, %ccr
	.word 0xa1902004  ! 120: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_0_68:
	setx 0x2f7f487ec943fe1d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 121: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab81c000  ! 122: WR_CLEAR_SOFTINT_R	wr	%r7, %r0, %clear_softint
	.word 0x926964a9  ! 123: UDIVX_I	udivx 	%r5, 0x04a9, %r9
	.word 0x38700001  ! 124: BPGU	<illegal instruction>
splash_cmpr_0_69:
	setx 0xa0a9c6be8d13e272, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 125: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_70) + 16, 16, 16)) -> intp(7,0,25)
intvec_0_70:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_71:
	setx 0x8684f2929239ffd2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902107  ! 129: WRPR_TT_I	wrpr	%r0, 0x0107, %tt
	.word 0x9ba089c7  ! 130: FDIVd	fdivd	%f2, %f38, %f44
	.word 0x90d22d92  ! 131: UMULcc_I	umulcc 	%r8, 0x0d92, %r8
change_to_randtl_0_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_72:
	.word 0x8f902002  ! 132: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
change_to_randtl_0_73:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_73:
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0cfe030  ! 135: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
splash_hpstate_0_74:
	.word 0x819822cf  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cf, %hpstate
	.word 0x8790212f  ! 137: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0x87802004  ! 138: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8790209b  ! 139: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	.word 0x93480000  ! 140: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xd2800a60  ! 141: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
splash_cmpr_0_75:
	setx 0xa793d5bef35dadd6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 142: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_76:
	.word 0x81982146  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
	.word 0xa1902003  ! 144: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802010  ! 145: WRASI_I	wr	%r0, 0x0010, %asi
tagged_0_77:
	taddcctv %r13, 0x120e, %r5
	.word 0xd207ed92  ! 146: LDUW_I	lduw	[%r31 + 0x0d92], %r9
splash_cmpr_0_78:
	setx 0x5c9a6e8105f0fd34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_0_79:
	set 0x60140000, %r31
	.word 0x8584314c  ! 148: WRCCR_I	wr	%r16, 0x114c, %ccr
	.word 0xa190200c  ! 149: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd2800a60  ! 150: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	.word 0xd28008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_0_80:
	tsubcctv %r18, 0x1872, %r4
	.word 0xd207f14c  ! 152: LDUW_I	lduw	[%r31 + 0xfffff14c], %r9
	.word 0xd28008a0  ! 153: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd24fc000  ! 154: LDSB_R	ldsb	[%r31 + %r0], %r9
cwp_0_81:
    set user_data_start, %o7
	.word 0x93902004  ! 155: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd2880e80  ! 156: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
	.word 0xd29fc020  ! 157: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2800b80  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cmp_0_82:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_82:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_82
    nop
cmp_wait0_82:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_82
    nop
    ba,a cmp_startwait0_82
continue_cmp_0_82:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x80, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c000  ! 160: WRPR_PIL_R	wrpr	%r11, %r0, %pil
cwp_0_83:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_0_84:
	setx 0xc4a5b98d4f9563d1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 162: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_85:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_86
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_86:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 164: RDPC	rd	%pc, %r10
	.word 0x87802004  ! 165: WRASI_I	wr	%r0, 0x0004, %asi
tagged_0_87:
	taddcctv %r12, 0x1c57, %r4
	.word 0xd407f14c  ! 166: LDUW_I	lduw	[%r31 + 0xfffff14c], %r10
debug_0_88:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902000  ! 168: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd4800c60  ! 169: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0xa9480000  ! 170: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
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
	.word 0xe9e7e000  ! 171: CASA_R	casa	[%r31] %asi, %r0, %r20
intveclr_0_90:
	setx 0xeaf6b77db1be2d9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 173: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01972  ! 174: FqTOd	dis not found

splash_cmpr_0_92:
	setx 0xa45f8183233a7eb3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99540000  ! 176: RDPR_GL	<illegal instruction>
splash_cmpr_0_93:
	setx 0xaed516e7f77b9422, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8dfe000  ! 178: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x93d020b2  ! 179: Tcc_I	tne	icc_or_xcc, %r0 + 178
cmp_0_94:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_94:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_94
    nop
cmp_wait0_94:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_94
    nop
    ba,a cmp_startwait0_94
continue_cmp_0_94:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 42, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194000d  ! 180: WRPR_PIL_R	wrpr	%r16, %r13, %pil
	.word 0x87902035  ! 181: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
intveclr_0_95:
	setx 0x693106f7ec601e36, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 182: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_96:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 183: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91d02034  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 185: RDPC	rd	%pc, %r16
splash_tba_0_98:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 186: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9f803079  ! 187: SIR	sir	0x1079
memptr_0_99:
	set user_data_start, %r31
	.word 0x85843719  ! 188: WRCCR_I	wr	%r16, 0x1719, %ccr
	.word 0x28800001  ! 189: BLEU	bleu,a	<label_0x1>
	.word 0x91d02034  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_100:
	setx 0x7158403b52d836b1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 191: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0800b20  ! 192: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r16
	.word 0xe007c000  ! 193: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xa190200a  ! 194: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe0cfe010  ! 195: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_0_101:
	set 0x60140000, %r31
	.word 0x8581f5ff  ! 196: WRCCR_I	wr	%r7, 0x15ff, %ccr
	.word 0x9f8024da  ! 197: SIR	sir	0x04da
intveclr_0_102:
	setx 0x164efac9a0239a53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cf271  ! 199: SDIVX_I	sdivx	%r19, 0xfffff271, %r8
splash_lsu_0_104:
	setx 0xca61eec5638b5727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 201: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_105:
	setx 0xe9d8a2e94da5d59f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x34700001  ! 203: BPG	<illegal instruction>
DS_0_106:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd176f21e	! Random illegal ?
	.word 0xe1114001  ! 1: LDQF_R	-	[%r5, %r1], %f16
	.word 0xa1a5082d  ! 204: FADDs	fadds	%f20, %f13, %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01970  ! 205: FqTOd	dis not found

	.word 0xd61fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r11
DS_0_108:
	.word 0xa9a349c7  ! 1: FDIVd	fdivd	%f44, %f38, %f20
	.word 0xbfe7c000  ! 207: SAVE_R	save	%r31, %r0, %r31
pmu_0_109:
	nop
	setx 0xfffffe04ffffffaa, %g1, %g7
	.word 0xa3800007  ! 208: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d903875  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x1875, %pstate
	.word 0x83d02035  ! 211: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe8dfe000  ! 212: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	.word 0xe8c00e40  ! 213: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r20
DS_0_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f12, %f8
	.word 0x93b04311  ! 214: ALIGNADDRESS	alignaddr	%r1, %r17, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 215: LDX_R	ldx	[%r31 + %r0], %r9
DS_0_111:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b4c30d  ! 216: ALIGNADDRESS	alignaddr	%r19, %r13, %r17
splash_hpstate_0_112:
	.word 0x81982d94  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d94, %hpstate
	.word 0xe26ff271  ! 218: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
splash_tba_0_113:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 219: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x2e700001  ! 220: BPVS	<illegal instruction>
	.word 0xe26ff271  ! 221: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff271]
	.word 0x8790209b  ! 222: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
tagged_0_114:
	tsubcctv %r17, 0x10fa, %r20
	.word 0xe207f271  ! 223: LDUW_I	lduw	[%r31 + 0xfffff271], %r17
	.word 0x83d02032  ! 224: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d9036e3  ! 225: WRPR_PSTATE_I	wrpr	%r0, 0x16e3, %pstate
splash_lsu_0_115:
	setx 0x2345db96fbf7298b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_116:
	setx 0xc3d1a7274c9fbf77, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 228: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x83d02033  ! 229: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_0_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 230: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568a7df  ! 231: SDIVX_I	sdivx	%r2, 0x07df, %r10
	.word 0xa5a0016d  ! 232: FABSq	dis not found

memptr_0_119:
	set 0x60140000, %r31
	.word 0x8584f0b1  ! 233: WRCCR_I	wr	%r19, 0x10b1, %ccr
	.word 0xa190200f  ! 234: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c340e  ! 235: SDIVX_I	sdivx	%r16, 0xfffff40e, %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_121
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 236: RDPC	rd	%pc, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4c7e000  ! 238: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0x95520000  ! 239: RDPR_PIL	<illegal instruction>
	.word 0x8790222b  ! 240: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0xa46d000d  ! 241: UDIVX_R	udivx 	%r20, %r13, %r18
debug_0_122:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_123:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 243: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_124
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_124
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_124:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 244: RDPC	rd	%pc, %r10
debug_0_125:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 245: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c3c77  ! 246: SDIVX_I	sdivx	%r16, 0xfffffc77, %r10
mondo_0_127:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90000b  ! 247: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
change_to_randtl_0_128:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_128:
	.word 0x8f902002  ! 248: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d020b4  ! 250: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_cmpr_0_129:
	setx 0x5e93d6fbe67d365e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_130) + 8, 16, 16)) -> intp(7,0,26)
intvec_0_130:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 253: WRPR_GL_I	wrpr	%r0, 0x0007, %-
cmp_0_131:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_131:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_131
    nop
cmp_wait0_131:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_131
    nop
    ba,a cmp_startwait0_131
continue_cmp_0_131:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x50, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190c011  ! 254: WRPR_PIL_R	wrpr	%r3, %r17, %pil
	.word 0xd4d804a0  ! 255: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x8d90242d  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x042d, %pstate
	.word 0x99902004  ! 257: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x81460000  ! 258: RD_STICK_REG	stbar
	.word 0xd4c7e030  ! 259: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
tagged_0_132:
	tsubcctv %r17, 0x1556, %r23
	.word 0xd407fc77  ! 260: LDUW_I	lduw	[%r31 + 0xfffffc77], %r10
splash_hpstate_0_133:
	.word 0x81982c8f  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xab820013  ! 263: WR_CLEAR_SOFTINT_R	wr	%r8, %r19, %clear_softint
splash_lsu_0_134:
	setx 0xb13a1551fe978975, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_135:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_135:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_135
    nop
debug_wait0_135:
    ld [%r23], %r2
    brnz %r2, debug_wait0_135
    nop
    ba,a debug_startwait0_135
continue_debug_0_135:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_135:
    cmp %r13, %r15
    bne,a wait_for_stat_0_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_135:
    cmp %r14, %r15
    bne,a wait_for_debug_0_135
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 265: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
splash_cmpr_0_136:
	setx 0xe0749e23475776ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 267: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_0_137:
	setx 0x7950e06f30537d3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4dfe000  ! 271: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x9f802aa9  ! 272: SIR	sir	0x0aa9
	.word 0x95a00550  ! 273: FSQRTd	fsqrt	
	.word 0xd527eaa9  ! 274: STF_I	st	%f10, [0x0aa9, %r31]
	.word 0xd4800b80  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
cmp_0_138:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_138:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_138
    nop
cmp_wait0_138:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_138
    nop
    ba,a cmp_startwait0_138
continue_cmp_0_138:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa4, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934014  ! 276: WRPR_PIL_R	wrpr	%r13, %r20, %pil
	.word 0x91a0cdc7  ! 277: FdMULq	fdmulq	
debug_0_139:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 278: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x3e800001  ! 279: BVC	bvc,a	<label_0x1>
	.word 0x91a4c9c1  ! 280: FDIVd	fdivd	%f50, %f32, %f8
splash_tba_0_140:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 281: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa190200c  ! 282: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9f803dd3  ! 283: SIR	sir	0x1dd3
intveclr_0_141:
	setx 0xe730ed42e6d03742, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903166  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x1166, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 286: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 287: FqTOd	dis not found

	.word 0xd0800b80  ! 288: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	.word 0xd0c7e020  ! 289: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	setx 0x88af28035fe26f98, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_143:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_144:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 291: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
debug_0_145:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 292: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_146) + 40, 16, 16)) -> intp(5,0,30)
intvec_0_146:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_147:
	.word 0x8f902001  ! 294: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_148
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_148:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 296: CASA_R	casa	[%r31] %asi, %r17, %r8
splash_cmpr_0_149:
	setx 0x6cf5964462f52792, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_150:
	setx 0x55cf13390df55411, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_151:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd197fdd3  ! 300: LDQFA_I	-	[%r31, 0x1dd3], %f8
	.word 0xd05ffdd3  ! 301: LDX_I	ldx	[%r31 + 0xfffffdd3], %r8
	.word 0xa5a000d4  ! 302: FNEGd	fnegd	%f20, %f18
splash_tba_0_152:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 303: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_0_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d948006  ! 304: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xe4c00e60  ! 305: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r18
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 306: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe48804a0  ! 308: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
tagged_0_154:
	tsubcctv %r26, 0x1cf4, %r14
	.word 0xe407fdd3  ! 309: LDUW_I	lduw	[%r31 + 0xfffffdd3], %r18
	.word 0x97500000  ! 310: RDPR_TPC	<illegal instruction>
splash_lsu_0_155:
	setx 0x29872016b723be7b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_156:
	set user_data_start, %r31
	.word 0x8581a955  ! 312: WRCCR_I	wr	%r6, 0x0955, %ccr
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
	.word 0xa1414000  ! 313: RDPC	rd	%pc, %r16
debug_0_158:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_159:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_159:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_159
    nop
debug_wait0_159:
    ld [%r23], %r2
    brnz %r2, debug_wait0_159
    nop
    ba,a debug_startwait0_159
continue_debug_0_159:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_159:
    cmp %r13, %r15
    bne,a wait_for_stat_0_159
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_159:
    cmp %r14, %r15
    bne,a wait_for_debug_0_159
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 315: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
intveclr_0_160:
	setx 0x91e156f066594eec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 316: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_161:
	taddcctv %r4, 0x1a96, %r2
	.word 0xe007e955  ! 317: LDUW_I	lduw	[%r31 + 0x0955], %r16
splash_tba_0_162:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 318: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_0_163:
	setx 0xdafb9ac44f60343d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d920012  ! 320: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0x99902001  ! 321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93703a3e  ! 322: POPC_I	popc	0x1a3e, %r9
change_to_randtl_0_165:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_165:
	.word 0x8f902003  ! 323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_0_166:
	setx 0xc77079b8035dda7f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 324: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00174  ! 325: FABSq	dis not found

	.word 0xd28008a0  ! 326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd26ffa3e  ! 327: LDSTUB_I	ldstub	%r9, [%r31 + 0xfffffa3e]
	.word 0x91d020b5  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d90305f  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x105f, %pstate
splash_cmpr_0_167:
	setx 0x12ab3fbe1b1d42d4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r9
splash_tba_0_168:
	set 0x003c0000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 332: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_0_169:
	taddcctv %r18, 0x13e0, %r2
	.word 0xd207fa3e  ! 333: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0xd2900e40  ! 334: LDUHA_R	lduha	[%r0, %r0] 0x72, %r9
splash_cmpr_0_170:
	setx 0xd009e6c99af56844, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 335: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x38700001  ! 336: BPGU	<illegal instruction>
	.word 0xd277fa3e  ! 337: STX_I	stx	%r9, [%r31 + 0xfffffa3e]
	.word 0x99500000  ! 338: RDPR_TPC	<illegal instruction>
splash_tba_0_171:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 339: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_0_172:
	tsubcctv %r11, 0x15ec, %r21
	.word 0xd807fa3e  ! 340: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r12
cwp_0_173:
    set user_data_start, %o7
	.word 0x93902005  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8880e40  ! 343: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
change_to_randtl_0_174:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_174:
	.word 0x8f902002  ! 344: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 345: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xa1902000  ! 346: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_0_176:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x01dac55e61f6e2f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_177:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9145c000  ! 349: RD_TICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_178) + 32, 16, 16)) -> intp(5,0,23)
intvec_0_178:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00174  ! 351: FABSq	dis not found

splash_hpstate_0_179:
	.word 0x81982c1c  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1c, %hpstate
tagged_0_180:
	tsubcctv %r19, 0x151f, %r25
	.word 0xd207fa3e  ! 353: LDUW_I	lduw	[%r31 + 0xfffffa3e], %r9
	.word 0x9f8021dc  ! 354: SIR	sir	0x01dc
	.word 0xd397e1dc  ! 355: LDQFA_I	-	[%r31, 0x01dc], %f9
	.word 0xd23fc000  ! 356: STD_R	std	%r9, [%r31 + %r0]
intveclr_0_181:
	setx 0xfbfcb606b2f67f0a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_183:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 359: CASA_R	casa	[%r31] %asi, %r20, %r9
	.word 0xd257c000  ! 360: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_0_184:
	.word 0x9ba0c9c4  ! 1: FDIVd	fdivd	%f34, %f4, %f44
	.word 0xe930aedd  ! 1: STQF_I	-	%f20, [0x0edd, %r2]
	normalw
	.word 0xa1458000  ! 361: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x99464000  ! 362: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0xd89004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
pmu_0_185:
	nop
	setx 0xfffff645fffff603, %g1, %g7
	.word 0xa3800007  ! 364: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cwp_0_186:
    set user_data_start, %o7
	.word 0x93902000  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd93feedd  ! 366: STDF_I	std	%f12, [0x0edd, %r31]
splash_hpstate_0_187:
	.word 0x81982807  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
debug_0_188:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 368: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 369: FqTOd	dis not found

intveclr_0_190:
	setx 0xce00b154f7dac38f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa980c006  ! 371: WR_SET_SOFTINT_R	wr	%r3, %r6, %set_softint
	.word 0xd717c000  ! 372: LDQF_R	-	[%r31, %r0], %f11
splash_tba_0_191:
	set 0x120000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa482400a  ! 374: ADDcc_R	addcc 	%r9, %r10, %r18
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 375: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe46feedd  ! 376: LDSTUB_I	ldstub	%r18, [%r31 + 0x0edd]
	.word 0xe537c000  ! 377: STQF_R	-	%f18, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 378: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_192:
	tsubcctv %r16, 0x1831, %r2
	.word 0xe407eedd  ! 379: LDUW_I	lduw	[%r31 + 0x0edd], %r18
	.word 0xe4d80e80  ! 380: LDXA_R	ldxa	[%r0, %r0] 0x74, %r18
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
	.word 0xa7414000  ! 381: RDPC	rd	%pc, %r19
	.word 0x22800001  ! 382: BE	be,a	<label_0x1>
splash_cmpr_0_194:
	setx 0x8f0c783a5a695a22, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2c800001  ! 384: BNEG	bneg,a	<label_0x1>
	.word 0x87802055  ! 385: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802055  ! 386: WRASI_I	wr	%r0, 0x0055, %asi
memptr_0_195:
	set user_data_start, %r31
	.word 0x85852f7a  ! 387: WRCCR_I	wr	%r20, 0x0f7a, %ccr
	.word 0xe66fef7a  ! 388: LDSTUB_I	ldstub	%r19, [%r31 + 0x0f7a]
splash_lsu_0_196:
	setx 0x3312e91f911e59c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_197:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb34ee43  ! 1: STQF_I	-	%f13, [0x0e43, %r19]
	normalw
	.word 0x91458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xa1902003  ! 391: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f80395a  ! 392: SIR	sir	0x195a
	.word 0xd117c000  ! 393: LDQF_R	-	[%r31, %r0], %f8
intveclr_0_198:
	setx 0xd05dbd3e5dd3e0e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_0_199:
	set 0x60340000, %r31
	.word 0x8581274c  ! 396: WRCCR_I	wr	%r4, 0x074c, %ccr
tagged_0_200:
	tsubcctv %r7, 0x1479, %r2
	.word 0xd007e74c  ! 397: LDUW_I	lduw	[%r31 + 0x074c], %r8
splash_lsu_0_201:
	setx 0xb11a278015cdf693, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93a289cb  ! 399: FDIVd	fdivd	%f10, %f42, %f40
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_202
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_202
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_202:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 400: RDPC	rd	%pc, %r8
	setx 0x036b484890cfcc2c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_203:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_0_204:
    set user_data_start, %o7
	.word 0x93902001  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd0d804a0  ! 403: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xab82800a  ! 404: WR_CLEAR_SOFTINT_R	wr	%r10, %r10, %clear_softint
DS_0_205:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3318000  ! 1: STQF_R	-	%f17, [%r0, %r6]
	normalw
	.word 0xa1458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r16
memptr_0_206:
	set 0x60140000, %r31
	.word 0x858525b7  ! 406: WRCCR_I	wr	%r20, 0x05b7, %ccr
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_207:
    cmp %r14, %r15
    bne,a wait_for_debug_0_207
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdaf00492  ! 407: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
	.word 0xa1902003  ! 408: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x81510000  ! 409: RDPR_TICK	rdpr	%tick, %r0
splash_hpstate_0_208:
	.word 0x81982d0d  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
cmp_0_209:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_209:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_209
    nop
cmp_wait0_209:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_209
    nop
    ba,a cmp_startwait0_209
continue_cmp_0_209:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbc, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c006  ! 411: WRPR_PIL_R	wrpr	%r19, %r6, %pil
	.word 0xe08fe000  ! 412: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_210) + 16, 16, 16)) -> intp(2,0,19)
intvec_0_210:
	.word 0x39400001  ! 413: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90298d  ! 414: WRPR_PSTATE_I	wrpr	%r0, 0x098d, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021b6  ! 416: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
memptr_0_211:
	set 0x60740000, %r31
	.word 0x8582a5bf  ! 417: WRCCR_I	wr	%r10, 0x05bf, %ccr
	.word 0x93d02032  ! 418: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_hpstate_0_212:
	.word 0x8198228c  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
donret_0_213:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_213-donret_0_213), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_213:
	.word 0xe0ffe5bf  ! 420: SWAPA_I	swapa	%r16, [%r31 + 0x05bf] %asi
	.word 0xe0800bc0  ! 421: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r16
	.word 0xe0c7e020  ! 422: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
memptr_0_214:
	set 0x60740000, %r31
	.word 0x858126c6  ! 423: WRCCR_I	wr	%r4, 0x06c6, %ccr
intveclr_0_215:
	setx 0x3cff65661ce8295c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 424: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x90fc0000  ! 425: SDIVcc_R	sdivcc 	%r16, %r0, %r8
	.word 0xd0d004a0  ! 426: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_0_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 427: SAVE_R	save	%r31, %r0, %r31
DS_0_217:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 428: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d90364b  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x164b, %pstate
	.word 0xd00fe6c6  ! 430: LDUB_I	ldub	[%r31 + 0x06c6], %r8
	.word 0xd08008a0  ! 431: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_218) + 48, 16, 16)) -> intp(0,0,2)
intvec_0_218:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e6c6  ! 433: STF_I	st	%f8, [0x06c6, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01970  ! 434: FqTOd	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_220:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 435: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0xe2cfe020  ! 436: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0x9350c000  ! 437: RDPR_TT	<illegal instruction>
DS_0_221:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 438: RESTORE_R	restore	%r31, %r0, %r31
cwp_0_222:
    set user_data_start, %o7
	.word 0x93902004  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d020b2  ! 440: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_cmpr_0_223:
	setx 0x3adef0ccb35820e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902494  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_224
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_224
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_224:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 443: RDPC	rd	%pc, %r9
	.word 0x8d802004  ! 444: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_0_225:
	setx 0xa467c5a06938ab05, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_226:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d924014  ! 446: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
memptr_0_227:
	set 0x60140000, %r31
	.word 0x8582e804  ! 447: WRCCR_I	wr	%r11, 0x0804, %ccr
	.word 0x97a0016a  ! 448: FABSq	dis not found

mondo_0_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d904004  ! 449: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
splash_cmpr_0_229:
	setx 0xbd86e753a5998537, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 450: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97450000  ! 451: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd717c000  ! 452: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8780208b  ! 453: WRASI_I	wr	%r0, 0x008b, %asi
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_230:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 454: RDPC	rd	%pc, %r11
	setx 0xea6302034409acee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_231:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_232:
	setx 0x14ac5efb60e3566d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 456: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab80c004  ! 457: WR_CLEAR_SOFTINT_R	wr	%r3, %r4, %clear_softint
	.word 0x87902009  ! 458: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	.word 0xd6c804a0  ! 459: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_cmpr_0_233:
	setx 0xf1bb501cf0d24236, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 460: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9545c000  ! 461: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x879021d0  ! 462: WRPR_TT_I	wrpr	%r0, 0x01d0, %tt
	.word 0x91d020b2  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x99902005  ! 464: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_cmpr_0_234:
	setx 0xe5e3d138cb4b8c85, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 465: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_235:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f8, %f2
	.word 0xa7b30306  ! 466: ALIGNADDRESS	alignaddr	%r12, %r6, %r19
	.word 0x8780208a  ! 467: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x93d02033  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 51
memptr_0_236:
	set 0x60540000, %r31
	.word 0x85816ff7  ! 469: WRCCR_I	wr	%r5, 0x0ff7, %ccr
	.word 0xe657eff7  ! 470: LDSH_I	ldsh	[%r31 + 0x0ff7], %r19
debug_0_237:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_237:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_237
    nop
debug_wait0_237:
    ld [%r23], %r2
    brnz %r2, debug_wait0_237
    nop
    ba,a debug_startwait0_237
continue_debug_0_237:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_237:
    cmp %r13, %r15
    bne,a wait_for_stat_0_237
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_237:
    cmp %r14, %r15
    bne,a wait_for_debug_0_237
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 471: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
pmu_0_238:
	nop
	setx 0xfffff65efffffbe7, %g1, %g7
	.word 0xa3800007  ! 472: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_239:
	setx 0x28082adf5502618b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_240:
	setx 0x18ca9c1d91ec63d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 476: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
debug_0_241:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 478: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_242:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 479: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_0_243:
	setx 0xe3cb5e852c7ef5f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 481: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_244:
	.word 0x819822d5  ! 482: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
	.word 0xe6d7e030  ! 483: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
splash_cmpr_0_245:
	setx 0x51a45775b177f773, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 484: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_246:
	tsubcctv %r1, 0x14ac, %r7
	.word 0xe607eff7  ! 485: LDUW_I	lduw	[%r31 + 0x0ff7], %r19
	.word 0xe6c004a0  ! 486: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
intveclr_0_247:
	setx 0x02e0d17b8a312d75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_248) + 24, 16, 16)) -> intp(2,0,0)
intvec_0_248:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00d34  ! 489: FsMULd	fsmuld	%f0, %f20, %f40
splash_tba_0_249:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 490: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_0_250:
	setx 0xca3fb36a2388becd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
cwp_0_251:
    set user_data_start, %o7
	.word 0x93902007  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902044  ! 493: WRPR_TT_I	wrpr	%r0, 0x0044, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 494: FqTOd	dis not found

splash_cmpr_0_253:
	setx 0xcb727268778cbffb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_254) + 0, 16, 16)) -> intp(7,0,7)
intvec_0_254:
	.word 0x39400001  ! 496: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 497: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_hpstate_0_255:
	.word 0x819822c4  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
DS_0_256:
cmpenall_0_257:
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

	.xword	0x3f44b80f84eb932c
	.xword	0xcb19f41e68dfd8ac
	.xword	0xc68adbfc7ffb874a
	.xword	0x90d6a28268fcc88b
	.xword	0x4752c656746ab007
	.xword	0x1a6adba52ccea43c
	.xword	0xa27c228d7f1563b0
	.xword	0x621d389891d39aff
	.xword	0xd859a4ff1a728de5
	.xword	0xbc9c4a21f654dae2
	.xword	0xea9f432f83e0b4dc
	.xword	0xff376a00d405ac19
	.xword	0xef6ce87a46960e94
	.xword	0x9e24d50a37512dca
	.xword	0x836c94923ece04e6
	.xword	0xcfa791d63a0f17d9
	.xword	0xf3c4de45d7c53ba1
	.xword	0x37dfeab0fab05481
	.xword	0xb1e49b4af89eb650
	.xword	0x6d3e08a9bd270254
	.xword	0x1d94aed4ed2bb048
	.xword	0x1b394e043c7639c4
	.xword	0x67ed778af685eeda
	.xword	0x0a85793de8dac258
	.xword	0xdabede26945b5d91
	.xword	0x53ffe6116192da9b
	.xword	0x0ac0138020729684
	.xword	0x038cbab7e7946b81
	.xword	0x42e324adbdcb95f2
	.xword	0x39d813298df1ce7f
	.xword	0xebe1df2deb16874a
	.xword	0x87c3439ddfb86999
	.xword	0x0c6cf1d429608e33
	.xword	0x0ca63aba9cb3733c
	.xword	0x065da68079b136e2
	.xword	0x07c120fa1dc078e5
	.xword	0x1b60345c111f40cc
	.xword	0x07f12d9607d6b7c3
	.xword	0x9aeb162a0999d102
	.xword	0x61a62feaa0caabc2
	.xword	0xdfe2cbc8a350db7c
	.xword	0xb867c9374759acd0
	.xword	0x51b3c9a8edc9aec8
	.xword	0x4b8b7f6f6313a8fc
	.xword	0xfe4b660774d035e3
	.xword	0xed89c7b1c4887dd6
	.xword	0x74254ad560175f08
	.xword	0x9dfe618f7bb24937
	.xword	0xb91798f48eb6c36b
	.xword	0x2e934ed81a1a75c0
	.xword	0xbe95359b621032a3
	.xword	0x41515fe215467021
	.xword	0xc413accef471f4b5
	.xword	0x461340aaabb58267
	.xword	0xa2a0c0ed28f8ac63
	.xword	0x998e0b734871c79a
	.xword	0x14c32ed596944c42
	.xword	0x8f5c709d96e80e08
	.xword	0xf44e02b0d5233590
	.xword	0x530a445a9b13d646
	.xword	0xfe5c6d5b83c14f56
	.xword	0x0b5819a9140c2405
	.xword	0x29d4db407ecb8e29
	.xword	0x18ffb24a466b8e01
	.xword	0x980172ea8b0409ca
	.xword	0xf2427c2afcc882c1
	.xword	0x9e4d6935eac59e4d
	.xword	0x5119a61b5baffe17
	.xword	0x209c161c56c5e352
	.xword	0xd58f09acfac87a18
	.xword	0x09de425a8a031b6f
	.xword	0xd342ac306b19c0a5
	.xword	0x522967985275254a
	.xword	0x47809894ed67770c
	.xword	0x6cdf666f001ff4d8
	.xword	0x1082c48d237d9f8b
	.xword	0x5aad918abd34d26f
	.xword	0x53b55036c58c8679
	.xword	0x41b1b5d734f588e2
	.xword	0xc419b9003ac86d5d
	.xword	0x459f9a6d4604626b
	.xword	0xa2aff97b8c06b88b
	.xword	0xac4ac6b1708c960e
	.xword	0x27e67bc9e69cd3bc
	.xword	0x42b4c55de191d83a
	.xword	0xa9f2b5991145f8d3
	.xword	0x20da7e78dfcde43d
	.xword	0x261b31f4cb307426
	.xword	0x04d9a61d5b58979e
	.xword	0xfe095e9cfb49d2b3
	.xword	0xaf82081ea1992756
	.xword	0x30a44b1d79567055
	.xword	0x5cfc12e97679a4c5
	.xword	0x9901fb4eea897213
	.xword	0xcca6898c608117af
	.xword	0x3206ae0d62f399d5
	.xword	0x2c7f699c3b75e365
	.xword	0x4568605ddd76ea18
	.xword	0x69c84d3ab6556440
	.xword	0x90b96fc8d2030f14
	.xword	0x6d499a663e0b6a6f
	.xword	0xd2d3fddde571c27b
	.xword	0xf24ed78fbaa44903
	.xword	0xe214c7cecb5bdfe2
	.xword	0xb79b923258995ee4
	.xword	0x4acfb9b19807e1ee
	.xword	0xa046bd47b79f311a
	.xword	0x58fecc8c9f820f02
	.xword	0x431138ec3855e1d6
	.xword	0xe0a05c531c7cebb7
	.xword	0xa95a7aba3b362207
	.xword	0xf19f55b7f1354a81
	.xword	0xd8b5c6893912a16d
	.xword	0x624c5ada92c41576
	.xword	0x73693c8aaf39bfac
	.xword	0xdeeaa08e97475253
	.xword	0x071da5a4c9d7d983
	.xword	0x18e2182d558097fb
	.xword	0x044ccc240ac4895b
	.xword	0x0e04dc8a495c0167
	.xword	0xff7c6a26fff47ea0
	.xword	0xaaa774122701459b
	.xword	0x553402d681aeb659
	.xword	0x1f2f8bc651559290
	.xword	0x975d96512b52507c
	.xword	0x57b92f5f2646df24
	.xword	0xd575ff42bca2589b
	.xword	0x177cada4c313effe
	.xword	0x438116c5217dad47
	.xword	0x47480dcf1c9ddb73
	.xword	0xb739eb7cc9a733ff
	.xword	0xb57b4bde590dc1f7
	.xword	0x691793986c3c7d52
	.xword	0xda100bcfcfc9cbbe
	.xword	0x704c08064c83fb94
	.xword	0x98d1a8e8211e6e2b
	.xword	0x930ca7218f13b7b5
	.xword	0x3d66c0d1403b7e91
	.xword	0x04581901145560e1
	.xword	0xcc2de47f8794ee52
	.xword	0x300a3b937e36a854
	.xword	0xe7d4622653aad8f2
	.xword	0x93a7b42c69c3df7a
	.xword	0xc8b7d92bba4858d9
	.xword	0xa639d6e7ea9a708a
	.xword	0x3f9dae6f9d380afe
	.xword	0x0c723ab85fdcf359
	.xword	0x8271d7d4bf49c7b7
	.xword	0xd845af905e94f62f
	.xword	0x24b0965094ba2955
	.xword	0x6cee4883b0560446
	.xword	0x7e23738d6018ec8e
	.xword	0x086f4c863e1ca79e
	.xword	0x949f3eafe02451ef
	.xword	0x4f5e2309955473be
	.xword	0x880ed202927ac547
	.xword	0x66121ecfca032cb0
	.xword	0x8a43b02d28e0fba9
	.xword	0xc6b5979416618ea4
	.xword	0x04c38dc78738d492
	.xword	0x630c260848cba5a8
	.xword	0x7f32439f007150f1
	.xword	0x513a2c7b80a01c3a
	.xword	0xc39d455ba2302c92
	.xword	0xaa7521fae50e7d30
	.xword	0x8810878fe714a917
	.xword	0xdda0076587718ed0
	.xword	0xb263cef170ac0b32
	.xword	0xcfe19b41adb2194c
	.xword	0xd26d8251c2851bca
	.xword	0x1bf3be647d921ee1
	.xword	0x67b14fcf13f95b0f
	.xword	0xb7cf49cabffcf3a7
	.xword	0x89459151e8fbfc3e
	.xword	0xcb88f3e56f9984e8
	.xword	0x1f9fc58253ceddd3
	.xword	0x126c8cc41e5f3d83
	.xword	0x3209e3603b6d5486
	.xword	0x9780bf8c7a749fe1
	.xword	0xd2e26ea0efbbe2a7
	.xword	0x36de9e2e3d913ed5
	.xword	0x1f5c1f8a14a6570c
	.xword	0xcb554e5184e7cf1b
	.xword	0xea7c0c7a60ac13ed
	.xword	0xe9150570bd0322b1
	.xword	0xe9e60f14d377ac9c
	.xword	0x0a0d4a839491e634
	.xword	0xa6e2d7eefd42ad76
	.xword	0x66a3b95e0e17d515
	.xword	0x5bbe7fb063a7a605
	.xword	0x10c32f0e896bb8e6
	.xword	0x6a017f98eafd3733
	.xword	0xcc45b8797ab40208
	.xword	0x69e44577c0221d07
	.xword	0xaa3ec559687a2899
	.xword	0x898830b596aaf73e
	.xword	0x56ec68d3613e58cd
	.xword	0x3a182d135cadc3ed
	.xword	0x9bb51066f82cad3d
	.xword	0x8506bd0e34e29fc2
	.xword	0x9b1b5711d40e7387
	.xword	0x59f0854c2463ccc9
	.xword	0x572852a82a6509b5
	.xword	0x2b65368be0cb78c3
	.xword	0xc1d9ba07ba509dca
	.xword	0x26f63fdf8a8607df
	.xword	0x39398d3a2e49f013
	.xword	0xd3659dcef28da98a
	.xword	0xd1754654a1474a32
	.xword	0x6ab14e49e4242b69
	.xword	0x0b4d61758cca802f
	.xword	0x8fbd128caa27cc02
	.xword	0xcd7dece4ffb356fe
	.xword	0xaf7975fa26a0e767
	.xword	0x4d70c29312709f53
	.xword	0x2d50000008825428
	.xword	0x57b0208affa9b703
	.xword	0xb3090b11adfabd1e
	.xword	0x45b6503dc617e662
	.xword	0x6e2c0a5e2af07a81
	.xword	0x2432e637054d0196
	.xword	0x6ff25caf417cb1b5
	.xword	0xedd098cd08fbea12
	.xword	0x21bb75823c9ffd9a
	.xword	0x657c349ab321e598
	.xword	0x4fd8c43c3cb7bb95
	.xword	0x5f500ca2ecdffa2b
	.xword	0xef1a37c00964b825
	.xword	0x27ab18fbcbf5f4fc
	.xword	0x09ff757d4617efa7
	.xword	0x62128d5c08fe7459
	.xword	0x99fe0ee439d8aa0f
	.xword	0x1074b0aed287d448
	.xword	0x46cfea9d5c6ff987
	.xword	0x4805b0cc7897f48b
	.xword	0xf5cbefef73b45d4d
	.xword	0x8082c11d117d73b2
	.xword	0x66d959ea3c970327
	.xword	0x7da3b3715637328e
	.xword	0x6604d32d6f481448
	.xword	0x3102fff7aa214da6
	.xword	0xb6b6bd9222b2eca6
	.xword	0x5cc10df1f0007946
	.xword	0xb78f96cdbfcf265a
	.xword	0x51d17b585adae58a
	.xword	0xea25eca97d8f598b
	.xword	0x70e34663528d87aa
	.xword	0xed87e180124885a9
	.xword	0x3782f3101e169bd9
	.xword	0xde7f41ee195f33b9
	.xword	0x4b868aab0fa71f00
	.xword	0x44ded4c36bd20219
	.xword	0x21cdad52cdd0669e
	.xword	0xed4b604cb015e412
	.xword	0xeb05abe006089f83
	.xword	0x6dcf6abb983aec95

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
# 458 "diag.j"
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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x6aedf45f737b6c01
	.xword	0xcc7a688b1f0a8842
	.xword	0x88a29f0a501d8480
	.xword	0x5c62634ca09b9750
	.xword	0x561a13e7bad658b9
	.xword	0xaaf3e78f66f94d8d
	.xword	0x88ef132ac413f342
	.xword	0x0d2ed79e8196967d
	.xword	0x6211bb182438d660
	.xword	0x12f11ae85695bf61
	.xword	0x9ba72edc3e24f6a3
	.xword	0xa4fe0f081849976f
	.xword	0x21ecb08bd199e2f3
	.xword	0x6487fbf856ce1b37
	.xword	0xf5f216e458df395d
	.xword	0xdc9afe38cf0b3db4
	.xword	0xb76be438d7142686
	.xword	0x88fa93a316bff61a
	.xword	0x0da21f5dab6cecc4
	.xword	0x92cf6cbb81890ae0
	.xword	0xee83500a7a563ff5
	.xword	0x26b90da682ab69f1
	.xword	0xb4195bed1fc3e1e5
	.xword	0xb488fc5b3cb2adee
	.xword	0x5c281e6ddca9c164
	.xword	0x911f1372d257ae31
	.xword	0x2558ed17008fd157
	.xword	0x4f3ff47674b3e128
	.xword	0xb8942c41a6d58dd6
	.xword	0x4d8eb47e6fd2a0e6
	.xword	0xbbb08740cc55529c
	.xword	0xd979be4221903510



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
	.xword	0x145ec200d20f0440
	.xword	0xb83ce8e83f5b3969
	.xword	0x521a9dc0774710c8
	.xword	0xade4f13ba26fa7b2
	.xword	0x59a4236a1406ba25
	.xword	0x19bcbbf46b93fe59
	.xword	0x8ff6fc14f3ef15eb
	.xword	0x5ad9253036c4e28a
	.xword	0x077a5d64c6c35abb
	.xword	0xc78fdb062dacd4f4
	.xword	0xeafcfd50ecf0f4f3
	.xword	0x77977c92637c84fa
	.xword	0x19455e09ed976478
	.xword	0xb0154ccd036afc0e
	.xword	0xe20fc2976a54d6f9
	.xword	0xb166253fac9bf727
	.xword	0x780eef9cdd217f46
	.xword	0x5e42d2c07e443764
	.xword	0x84aa89773a5ee207
	.xword	0xab1baadc541bc0d3
	.xword	0xaf0325fb5102f00d
	.xword	0x0e5510be06e058bb
	.xword	0x9012e2510a6341b0
	.xword	0x0bce6d9914348022
	.xword	0xdce43a8285fa96aa
	.xword	0xcd0b8de5e7e064c0
	.xword	0xf276b4d5a2861e56
	.xword	0x5f772db26bfc6d86
	.xword	0x94977b5552516350
	.xword	0xcee535b2f7b53708
	.xword	0x2ed0cc1222e537a1
	.xword	0xcf27aa10bf0a0578



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	.xword	0x4d05181cb6ed67d7
	.xword	0xe94efcb2e5fa6e3c
	.xword	0xdcb873a94621929e
	.xword	0x0917d83198247272
	.xword	0x118ea3f81d0090b7
	.xword	0x8b42064f6cf9f1a5
	.xword	0xfafe8acc1fd1d572
	.xword	0x6e82a78dc6244855
	.xword	0x24e04e78a4df85e5
	.xword	0x0bdf22658feb000e
	.xword	0x03b2c52138809e4f
	.xword	0xe97aec0fdd84cd14
	.xword	0xfdee91140419dafa
	.xword	0x64ccaa6d62f43270
	.xword	0x2be2602c9823b305
	.xword	0xaca92164ae08a5c4
	.xword	0xc7f937dcd857e5bc
	.xword	0x4fcde31220dc4820
	.xword	0x61a4cff17bfa1e90
	.xword	0x934e568070da51a3
	.xword	0xa188af02d89e09a4
	.xword	0x2bccb898adbeddc2
	.xword	0x134d5bc56f64df67
	.xword	0xcb689ad1497c002f
	.xword	0x4032fd4078947216
	.xword	0x533227a62ea46be3
	.xword	0xe2a93e666cafa577
	.xword	0xd0fbc1b38bc2c4c9
	.xword	0x9fecf228c95e58ca
	.xword	0x57832a8cb5074cff
	.xword	0xb24cac94b5788741
	.xword	0x62bedc1eb860381c



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
	.xword	0xb9da522ca17dc90e
	.xword	0xf32f686f741dd451
	.xword	0x06e3d5f5bdda661a
	.xword	0x0a70325bb57f42d0
	.xword	0xb442fadfd57d6568
	.xword	0x10f724d6d40cf84b
	.xword	0x48ef8bdb47b6c3cf
	.xword	0xa642bc1af998e7d6
	.xword	0x6b6f9edea8553051
	.xword	0x6e74fc901aea9e4f
	.xword	0x247b43306e748f42
	.xword	0x8cfb35747b0eb90d
	.xword	0x7d59c88068dbc26f
	.xword	0x06aa4ab75bffd88a
	.xword	0x880884d24d19356b
	.xword	0x1e92c05be1e9d7b8
	.xword	0xb21221fef1e1cd1e
	.xword	0x2f212b8f7b76d4e2
	.xword	0x7511292d7ff92d86
	.xword	0xe899a61b825c4155
	.xword	0x4116f1f4038f2ba5
	.xword	0x7edcecb2546af8c2
	.xword	0x445bcf53d05e982a
	.xword	0x70815b4a2159e7d5
	.xword	0xc4b5c735a8ad1d4c
	.xword	0xf065ddc774491433
	.xword	0x064562665d3cc7cf
	.xword	0xaa2793f63fe83dd2
	.xword	0x7723ef0cd8cfd20e
	.xword	0x4e083e6a87a88d63
	.xword	0xa6ff01283c35e664
	.xword	0x7ac3965ddf60f144



#if 0
#endif

