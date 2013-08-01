/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_38.s
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
    setx External_Reset_Handler, %g6, %g7; \
    jmp %g7; \
    nop 

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
    	mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40; retry

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d \
    	mov 0x80,%g1; stxa %g0,[%g1]0x40; retry
# 32 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 46 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 146 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 149 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 194 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 197 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 687 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
	mov 0xb4, %r14
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
	mov 0x31, %r14
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
	mov 0xb1, %r14
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
	mov 0x33, %r14
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
	mov 0x34, %r14
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
	.word 0xa190200d  ! 1: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902000  ! 2: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_7_0:
	setx 0x6af640596f48f3b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_1:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 5: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9745c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_7_2:
	tsubcctv %r8, 0x160f, %r26
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_7_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d920005  ! 9: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
change_to_randtl_7_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_4:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 11: RDPC	rd	%pc, %r18
splash_lsu_7_6:
	setx 0x043b8c87b2f42303, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_7_7:
	set 0x60140000, %r31
	.word 0x85842a7e  ! 14: WRCCR_I	wr	%r16, 0x0a7e, %ccr
	.word 0x99902003  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_8) + 56, 16, 16)) -> intp(2,0,31)
intvec_7_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_7_9:
	taddcctv %r19, 0x1963, %r6
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_7_10:
	setx 0x26f386e0697d62c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_7_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a189c9  ! 1: FDIVd	fdivd	%f6, %f40, %f40
	.word 0xe7128014  ! 1: LDQF_R	-	[%r10, %r20], %f19
	.word 0x97a0c830  ! 21: FADDs	fadds	%f3, %f16, %f11
DS_7_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_7_13:
	.word 0x81982544  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01962  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9194fc6b  ! 26: WRPR_PIL_I	wrpr	%r19, 0x1c6b, %pil
splash_cmpr_7_15:
	setx 0x95b1ed26eb542a6f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020be  ! 28: WRPR_TT_I	wrpr	%r0, 0x00be, %tt
tagged_7_16:
	tsubcctv %r24, 0x17c0, %r13
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_7_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_18:
	setx 0xa0792991d710cbf5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 32: Tcc_I	tne	icc_or_xcc, %r0 + 181
debug_7_19:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802080  ! 34: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0x99414000  ! 36: RDPC	rd	%pc, %r12
mondo_7_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 37: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
tagged_7_22:
	tsubcctv %r17, 0x12e2, %r24
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0x9ba249cd  ! 39: FDIVd	fdivd	%f40, %f44, %f44
DS_7_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7110014  ! 1: LDQF_R	-	[%r4, %r20], %f11
	.word 0x9ba20829  ! 40: FADDs	fadds	%f8, %f9, %f13
splash_tba_7_24:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_7_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d903cb9  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x1cb9, %pstate
	.word 0x87902026  ! 45: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802088  ! 47: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99902005  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_7_27:
	nop
	setx 0xfffff71bfffff6c8, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_7_28:
	set 0x60740000, %r31
	.word 0x8582bfbf  ! 50: WRCCR_I	wr	%r10, 0x1fbf, %ccr
change_to_randtl_7_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_29:
	.word 0x8f902002  ! 51: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab84c008  ! 52: WR_CLEAR_SOFTINT_R	wr	%r19, %r8, %clear_softint
debug_7_30:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 53: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802004  ! 55: WRASI_I	wr	%r0, 0x0004, %asi
mondo_7_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 56: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
debug_7_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_33:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_34:
	setx 0xe7f83f8520050691, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944009  ! 60: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d00e60  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
mondo_7_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d94c009  ! 63: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
splash_tba_7_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_39:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 65: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe297e010  ! 66: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
splash_hpstate_7_40:
	.word 0x81982894  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x984a4013  ! 69: MULX_R	mulx 	%r9, %r19, %r12
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x87902390  ! 71: WRPR_TT_I	wrpr	%r0, 0x0390, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902004  ! 73: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_7_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_42:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 77: RDPC	rd	%pc, %r16
	.word 0xd68fe030  ! 78: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f8025c1  ! 79: SIR	sir	0x05c1
	.word 0x8d9023c1  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x03c1, %pstate
DS_7_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_7_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_44-donret_7_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902005  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd6cfe010  ! 84: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xa1902008  ! 85: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	rd %pc, %r19
	add %r19, (ivw_7_45-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_45:
	.word 0x9194c010  ! 86: WRPR_PIL_R	wrpr	%r19, %r16, %pil
DS_7_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a2c9c1  ! 1: FDIVd	fdivd	%f42, %f32, %f48
	normalw
	.word 0xa9458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r20
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 88: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_7_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 90: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_7_48:
	set user_data_start, %r31
	.word 0x85812362  ! 91: WRCCR_I	wr	%r4, 0x0362, %ccr
	.word 0x9ba01a62  ! 92: FqTOi	fqtoi	
	.word 0x9ba28d25  ! 93: FsMULd	fsmuld	%f10, %f36, %f44
	rd %pc, %r19
	add %r19, (ivw_7_49-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_49:
	.word 0x9190c000  ! 94: WRPR_PIL_R	wrpr	%r3, %r0, %pil
splash_cmpr_7_50:
	setx 0x1e419653e9ab0219, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_51:
	taddcctv %r9, 0x178d, %r10
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_7_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902108  ! 98: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
DS_7_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f4, %f24
	.word 0x9bb1c312  ! 99: ALIGNADDRESS	alignaddr	%r7, %r18, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_54) + 8, 16, 16)) -> intp(1,0,29)
intvec_7_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xb3c29fc717e40ddf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0xa9454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe0880e80  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x74, %r16
splash_tba_7_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f803ee8  ! 109: SIR	sir	0x1ee8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569fa7c  ! 110: SDIVX_I	sdivx	%r7, 0xfffffa7c, %r18
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_7_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0xa150c000  ! 114: RDPR_TT	rdpr	%tt, %r16
debug_7_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_60) + 24, 16, 16)) -> intp(4,0,2)
intvec_7_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x94c47ac3  ! 118: ADDCcc_I	addccc 	%r17, 0xfffffac3, %r10
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x93a00166  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902002  ! 122: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa0810013  ! 123: ADDcc_R	addcc 	%r4, %r19, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 124: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168662c  ! 125: SDIVX_I	sdivx	%r1, 0x062c, %r8
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0x97500000  ! 127: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xa3450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xa1902009  ! 129: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_randtl_7_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_63:
	.word 0x8f902001  ! 130: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_64) + 40, 16, 16)) -> intp(0,0,18)
intvec_7_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_65:
	setx 0x166b711644786726, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x879020cb  ! 135: WRPR_TT_I	wrpr	%r0, 0x00cb, %tt
	setx 0x361919709694b7a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_7_68:
	setx 0x8197b3deabef0e61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_69:
	setx 0x7f715cf81002d14b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_70:
	setx 0x75b6b28404ffb273, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x879022ac  ! 142: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 143: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_7_72:
	setx 0xeccf1a4943b6f3a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_7_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1a049cb  ! 1: FDIVd	fdivd	%f32, %f42, %f16
	.word 0xa3a00544  ! 1: FSQRTd	fsqrt	
	.word 0x99a1882a  ! 149: FADDs	fadds	%f6, %f10, %f12
	.word 0x87802020  ! 150: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_7_74:
	tsubcctv %r11, 0x1e85, %r6
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d020b3  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_7_75:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe030  ! 157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
splash_tba_7_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_7_78:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_79:
	setx 0x41c7b237b4633d99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 161: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe8800bc0  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r20
	rd %pc, %r19
	add %r19, (ivw_7_80-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_80:
	.word 0x91918004  ! 163: WRPR_PIL_R	wrpr	%r6, %r4, %pil
memptr_7_81:
	set user_data_start, %r31
	.word 0x8581f843  ! 164: WRCCR_I	wr	%r7, 0x1843, %ccr
DS_7_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe8d7e000  ! 166: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d902b79  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x0b79, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902000  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x9f23cea0d27202be, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b16  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0b16, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_7_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_84:
	.word 0x8f902001  ! 175: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01969  ! 176: FqTOd	dis not found

	.word 0xa3464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d020b4  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 180
intveclr_7_86:
	setx 0x2a9847f8a3b917ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_87:
	setx 0x1773fd7ff224cd2f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_88:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_7_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_7_91:
	nop
	setx 0xfffffba7fffff370, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d80e80  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x74, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_7_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 190: RDPC	rd	%pc, %r20
memptr_7_94:
	set 0x60740000, %r31
	.word 0x85812d7c  ! 191: WRCCR_I	wr	%r4, 0x0d7c, %ccr
	.word 0x879021c9  ! 192: WRPR_TT_I	wrpr	%r0, 0x01c9, %tt
splash_lsu_7_95:
	setx 0xe1b0911720df0a53, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_7_96:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_7_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_7_98:
	tsubcctv %r9, 0x10f6, %r5
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_99:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 198: RDPC	rd	%pc, %r8
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_7_100:
	setx 0xd9485418f04d3f8e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d004a0  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_cmpr_7_101:
	setx 0x16dabf76ad93b572, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_7_102:
	setx 0xfaf2023d2d96f9cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d948007  ! 205: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d02035  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_7_105:
	setx 0x9b9380c506d5fb6b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_7_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d93000c  ! 209: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
mondo_7_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92800b  ! 210: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
	.word 0x93902002  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_7_108:
	.word 0x81982fde  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fde, %hpstate
debug_7_109:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd334e098  ! 1: STQF_I	-	%f9, [0x0098, %r19]
	normalw
	.word 0x9b458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_7_112-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_112:
	.word 0x91914011  ! 218: WRPR_PIL_R	wrpr	%r5, %r17, %pil
	.word 0xd0800c00  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
	.word 0x99b14ff2  ! 220: FONES	e	%f12
DS_7_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_7_114:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa1902001  ! 224: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa1902004  ! 225: WRPR_GL_I	wrpr	%r0, 0x0004, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_7_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
mondo_7_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d90400a  ! 228: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0xa1902005  ! 229: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9b520000  ! 230: RDPR_PIL	rdpr	%pil, %r13
debug_7_118:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d02035  ! 232: Tcc_I	tne	icc_or_xcc, %r0 + 53
mondo_7_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d944009  ! 233: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
intveclr_7_120:
	setx 0xf749628df5a7c566, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a793c  ! 236: SDIVX_I	sdivx	%r9, 0xfffff93c, %r9
	.word 0x93b1cfe7  ! 237: FONES	e	%f9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ab69f  ! 238: SDIVX_I	sdivx	%r10, 0xfffff69f, %r20
intveclr_7_123:
	setx 0x381b893d8a9dbb44, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_7_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d02032  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_7_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d90c013  ! 242: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0x91540000  ! 243: RDPR_GL	rdpr	%-, %r8
splash_lsu_7_126:
	setx 0xa55b7403748e609f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_127:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_7_128:
	setx 0x6faef4fa0b66293d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802058  ! 248: WRASI_I	wr	%r0, 0x0058, %asi
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9b540000  ! 250: RDPR_GL	rdpr	%-, %r13
	.word 0xd8800c00  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
splash_cmpr_7_130:
	setx 0x68a0c66046cdc442, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_131:
	setx 0x741d5165c63301e6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_132:
	setx 0xad83762df75c8483, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	setx 0x362cab4c75d6d74f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 257: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd88fe030  ! 258: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01968  ! 259: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c2108  ! 260: SDIVX_I	sdivx	%r16, 0x0108, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_136:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91a0016c  ! 263: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cf679  ! 264: SDIVX_I	sdivx	%r19, 0xfffff679, %r13
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_7_138:
	nop
	setx 0xfffff71efffff2a8, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_7_139:
	taddcctv %r18, 0x1028, %r2
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_7_140:
	tsubcctv %r10, 0x1037, %r6
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_7_141:
	taddcctv %r21, 0x1a6b, %r7
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_7_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x95a00164  ! 271: FABSq	dis not found

mondo_7_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d940011  ! 272: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xda900e60  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x73, %r13
debug_7_144:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 274: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
intveclr_7_145:
	setx 0x0a140bbfd1cd73b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda800b40  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
splash_cmpr_7_146:
	setx 0xe4e03cb889a4f261, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_7_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_147:
	.word 0x8f902000  ! 278: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_148:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_7_149:
	.word 0x8198289d  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	.word 0xda880e60  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
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
	.word 0x97414000  ! 282: RDPC	rd	%pc, %r11
	.word 0x93902001  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x99902001  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
debug_7_151:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_7_152:
	tsubcctv %r19, 0x18ca, %r19
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c80e60  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_7_153:
	taddcctv %r19, 0x118e, %r25
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f8032d7  ! 291: SIR	sir	0x12d7
	.word 0xa3464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956caa7a  ! 293: SDIVX_I	sdivx	%r18, 0x0a7a, %r10
donret_7_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_155-donret_7_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_7_156:
	setx 0x3729c06cad658d8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_7_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_157:
	.word 0x8f902000  ! 298: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902005  ! 299: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_7_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d928014  ! 300: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa1902002  ! 302: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_7_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_159:
	.word 0x8f902000  ! 305: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd0dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0x91d020b5  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56aa8c2  ! 308: SDIVX_I	sdivx	%r10, 0x08c2, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01965  ! 309: FqTOd	dis not found

	.word 0x87902278  ! 310: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
mondo_7_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d92800b  ! 311: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
tagged_7_163:
	taddcctv %r25, 0x1cc9, %r15
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902007  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_164) + 48, 16, 16)) -> intp(1,0,28)
intvec_7_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_165:
	setx 0xce2a2ac5833c6d42, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d020b4  ! 317: Tcc_I	tne	icc_or_xcc, %r0 + 180
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_166)+0, 16, 16)) -> intp(7,1,3)
xir_7_166:
	.word 0xa982b756  ! 318: WR_SET_SOFTINT_I	wr	%r10, 0x1756, %set_softint
	setx 0x2bf97667d30bf517, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_168:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_7_169:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_7_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_7_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_171:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_7_172:
	.word 0x819823c5  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c5, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x879023fa  ! 326: WRPR_TT_I	wrpr	%r0, 0x03fa, %tt
	.word 0xa1902003  ! 327: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_7_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d908009  ! 329: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0x8780204f  ! 330: WRASI_I	wr	%r0, 0x004f, %asi
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
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_7_175:
	set 0x60540000, %r31
	.word 0x85836c68  ! 332: WRCCR_I	wr	%r13, 0x0c68, %ccr
mondo_7_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 333: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x93902000  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_7_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9308002  ! 1: STQF_R	-	%f20, [%r2, %r2]
	normalw
	.word 0xa3458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r17
intveclr_7_178:
	setx 0xca96870616286562, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 338: FqTOd	dis not found

	.word 0x98c0b610  ! 339: ADDCcc_I	addccc 	%r2, 0xfffff610, %r12
	rd %pc, %r19
	add %r19, (ivw_7_180-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_180:
	.word 0x9193000c  ! 340: WRPR_PIL_R	wrpr	%r12, %r12, %pil
splash_cmpr_7_181:
	setx 0x99ba69ac4b33a0a0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f24, %f0
	.word 0x99b00309  ! 342: ALIGNADDRESS	alignaddr	%r0, %r9, %r12
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_7_184:
	tsubcctv %r2, 0x13f0, %r1
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_185:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 345: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_186)+8, 16, 16)) -> intp(7,1,3)
xir_7_186:
	.word 0xa9846780  ! 346: WR_SET_SOFTINT_I	wr	%r17, 0x0780, %set_softint
memptr_7_187:
	set 0x60540000, %r31
	.word 0x8584a11a  ! 347: WRCCR_I	wr	%r18, 0x011a, %ccr
	.word 0x879021f7  ! 348: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
mondo_7_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d92000a  ! 349: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0xa1902002  ! 350: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802055  ! 351: WRASI_I	wr	%r0, 0x0055, %asi
mondo_7_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d94c011  ! 352: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x91933208  ! 354: WRPR_PIL_I	wrpr	%r12, 0x1208, %pil
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
	.word 0x95414000  ! 355: RDPC	rd	%pc, %r10
memptr_7_192:
	set user_data_start, %r31
	.word 0x8582a342  ! 356: WRCCR_I	wr	%r10, 0x0342, %ccr
	setx 0xfe1d9c03701b3f77, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902074  ! 358: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
splash_tba_7_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 360: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 361: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_7_195:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 362: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_196) + 24, 16, 16)) -> intp(5,0,20)
intvec_7_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 364: WRASI_I	wr	%r0, 0x0020, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902683  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x0683, %pstate
	.word 0x9350c000  ! 367: RDPR_TT	rdpr	%tt, %r9
splash_cmpr_7_197:
	setx 0x7173907e3c19e625, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_7_198:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_199:
	setx 0xc8e012c5fe23f7c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 371: Tcc_I	te	icc_or_xcc, %r0 + 51
change_to_randtl_7_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_200:
	.word 0x8f902001  ! 372: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_7_201:
	setx 0x0940212b96516865, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_7_202:
	set 0x60140000, %r31
	.word 0x85832bd5  ! 374: WRCCR_I	wr	%r12, 0x0bd5, %ccr
mondo_7_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d928001  ! 375: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	.word 0xd8c7e010  ! 376: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x91d02034  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99694002  ! 378: SDIVX_R	sdivx	%r5, %r2, %r12
splash_tba_7_204:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f26, %f26, %f24
	.word 0xa9b18303  ! 380: ALIGNADDRESS	alignaddr	%r6, %r3, %r20
	.word 0x87902246  ! 381: WRPR_TT_I	wrpr	%r0, 0x0246, %tt
splash_cmpr_7_206:
	setx 0xbe5f8e6e2f7c6507, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_7_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d91400c  ! 384: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0x93a0016a  ! 385: FABSq	dis not found

intveclr_7_208:
	setx 0xfc6b8e657b4cdfda, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91000a  ! 387: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	.word 0xa982c013  ! 388: WR_SET_SOFTINT_R	wr	%r11, %r19, %set_softint
	.word 0x99a0c9ca  ! 389: FDIVd	fdivd	%f34, %f10, %f12
	.word 0x9f8026df  ! 390: SIR	sir	0x06df
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_7_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_210:
	.word 0x8f902001  ! 392: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_7_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f2, %f4
	.word 0xa3b48311  ! 393: ALIGNADDRESS	alignaddr	%r18, %r17, %r17
splash_cmpr_7_212:
	setx 0x6307798de5ab3ec9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_213:
	.word 0x81982577  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0577, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_7_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d94c002  ! 397: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_7_215:
	setx 0x46432710542a45b0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba0016b  ! 400: FABSq	dis not found

splash_hpstate_7_216:
	.word 0x819828a5  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08a5, %hpstate
	.word 0x97480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_217:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 403: RDPC	rd	%pc, %r17
	.word 0x91d02034  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_7_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924005  ! 405: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
mondo_7_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d90000b  ! 406: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
	.word 0x93902002  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
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
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802016  ! 409: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9f802180  ! 410: SIR	sir	0x0180
	.word 0x9970261d  ! 411: POPC_I	popc	0x061d, %r12
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_7_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d91c006  ! 413: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
	.word 0x91d02033  ! 414: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d903be9  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x1be9, %pstate
mondo_7_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 417: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xa190200b  ! 418: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x91414000  ! 420: RDPC	rd	%pc, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_7_225:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 422: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01967  ! 423: FqTOd	dis not found

	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 424: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_7_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01972  ! 427: FqTOd	dis not found

mondo_7_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91800b  ! 428: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0xa3a2cd2b  ! 430: FsMULd	fsmuld	%f11, %f42, %f48
debug_7_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe010  ! 432: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 433: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01974  ! 434: FqTOd	dis not found

mondo_7_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940001  ! 435: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_233)+32, 16, 16)) -> intp(7,1,3)
xir_7_233:
	.word 0xa9822f78  ! 436: WR_SET_SOFTINT_I	wr	%r8, 0x0f78, %set_softint
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 438: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0x99902004  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x9248c011  ! 440: MULX_R	mulx 	%r3, %r17, %r9
tagged_7_235:
	taddcctv %r25, 0x185f, %r17
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab828014  ! 442: WR_CLEAR_SOFTINT_R	wr	%r10, %r20, %clear_softint
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_7_238:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_7_239:
	setx 0x3b9474ce2aa4cecc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 448: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_7_240:
	setx 0x4e0e979baa5e4fc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a00170  ! 450: FABSq	dis not found

	.word 0x9b480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
splash_cmpr_7_241:
	setx 0x16398ed6bf5afeef, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_7_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 454: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95686141  ! 455: SDIVX_I	sdivx	%r1, 0x0141, %r10
splash_hpstate_7_244:
	.word 0x8198291d  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091d, %hpstate
debug_7_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_246:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 458: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
splash_lsu_7_247:
	setx 0x4ebfaa51b8c0372b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd0800c20  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	.word 0x8d902dba  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x0dba, %pstate
tagged_7_248:
	tsubcctv %r26, 0x1e03, %r9
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d903e77  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x1e77, %pstate
tagged_7_249:
	taddcctv %r19, 0x183b, %r15
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x879020b3  ! 465: WRPR_TT_I	wrpr	%r0, 0x00b3, %tt
splash_hpstate_7_250:
	.word 0x81982514  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0xa4fd0002  ! 467: SDIVcc_R	sdivcc 	%r20, %r2, %r18
	.word 0x91d020b5  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x879022b9  ! 469: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	setx 0xde78cbbd464417a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035f4  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x15f4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_7_252:
	.word 0x819829fd  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09fd, %hpstate
DS_7_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_7_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x87902353  ! 478: WRPR_TT_I	wrpr	%r0, 0x0353, %tt
mondo_7_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d920003  ! 479: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0x8d9020bb  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x00bb, %pstate
	.word 0x8d9023aa  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x03aa, %pstate
intveclr_7_257:
	setx 0xe71a420609a0a9ca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ccc  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
debug_7_258:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 484: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xa9a109d4  ! 485: FDIVd	fdivd	%f4, %f20, %f20
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_7_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe08008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x99902002  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8790211b  ! 491: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
donret_7_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_260-donret_7_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_7_261:
	setx 0xc315b526929b60cf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_262) + 0, 16, 16)) -> intp(6,0,13)
intvec_7_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 495: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_7_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_264) + 56, 16, 16)) -> intp(0,0,9)
intvec_7_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xa1902002  ! 1: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa190200e  ! 2: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_6_0:
	setx 0x8806a7da701ab0e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_1:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 5: RDPC	rd	%pc, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9b45c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r13
tagged_6_2:
	tsubcctv %r22, 0x106a, %r21
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_6_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d91c014  ! 9: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
change_to_randtl_6_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_4:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_5:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 11: RDPC	rd	%pc, %r10
splash_lsu_6_6:
	setx 0x6f4cbccd68e29459, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_6_7:
	set 0x60140000, %r31
	.word 0x8581e094  ! 14: WRCCR_I	wr	%r7, 0x0094, %ccr
	.word 0x99902000  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_8) + 0, 16, 16)) -> intp(5,0,9)
intvec_6_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_6_9:
	taddcctv %r11, 0x15d1, %r7
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_6_10:
	setx 0x868a02b2ee538773, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_6_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a249d3  ! 1: FDIVd	fdivd	%f40, %f50, %f42
	.word 0xd5144010  ! 1: LDQF_R	-	[%r17, %r16], %f10
	.word 0xa3a0c830  ! 21: FADDs	fadds	%f3, %f16, %f17
DS_6_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_6_13:
	.word 0x81982f17  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196d  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91902e63  ! 26: WRPR_PIL_I	wrpr	%r0, 0x0e63, %pil
splash_cmpr_6_15:
	setx 0xd9806f046c28f2ae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020e6  ! 28: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
tagged_6_16:
	tsubcctv %r11, 0x15c5, %r2
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_6_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_18:
	setx 0xe832bbe7302cefcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 32: Tcc_I	te	icc_or_xcc, %r0 + 51
debug_6_19:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 34: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0x91414000  ! 36: RDPC	rd	%pc, %r8
mondo_6_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 37: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
tagged_6_22:
	tsubcctv %r4, 0x1064, %r22
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0x9ba349c3  ! 39: FDIVd	fdivd	%f44, %f34, %f44
DS_6_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe510c00d  ! 1: LDQF_R	-	[%r3, %r13], %f18
	.word 0xa1a1c822  ! 40: FADDs	fadds	%f7, %f2, %f16
splash_tba_6_24:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
DS_6_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d90379d  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x179d, %pstate
	.word 0x879022bb  ! 45: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802088  ! 47: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99902005  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
pmu_6_27:
	nop
	setx 0xffffffe5fffffd5b, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_6_28:
	set 0x60740000, %r31
	.word 0x858170dc  ! 50: WRCCR_I	wr	%r5, 0x10dc, %ccr
change_to_randtl_6_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_29:
	.word 0x8f902000  ! 51: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab81c004  ! 52: WR_CLEAR_SOFTINT_R	wr	%r7, %r4, %clear_softint
debug_6_30:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 53: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802080  ! 55: WRASI_I	wr	%r0, 0x0080, %asi
mondo_6_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d944007  ! 56: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
debug_6_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_33:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_34:
	setx 0x1e977676fcd0d425, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d94c00c  ! 60: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
mondo_6_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91000c  ! 63: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
splash_tba_6_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_39:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 65: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe297e020  ! 66: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
splash_hpstate_6_40:
	.word 0x81982a87  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0xa24c0005  ! 69: MULX_R	mulx 	%r16, %r5, %r17
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x87902395  ! 71: WRPR_TT_I	wrpr	%r0, 0x0395, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902005  ! 73: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_6_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_42:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 77: RDPC	rd	%pc, %r13
	.word 0xd68fe030  ! 78: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f80340f  ! 79: SIR	sir	0x140f
	.word 0x8d902ccc  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
DS_6_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_6_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_44-donret_6_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902000  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd6cfe020  ! 84: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xa1902003  ! 85: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	rd %pc, %r19
	add %r19, (ivw_6_45-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_45:
	.word 0x9192c014  ! 86: WRPR_PIL_R	wrpr	%r11, %r20, %pil
DS_6_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a489c4  ! 1: FDIVd	fdivd	%f18, %f4, %f50
	normalw
	.word 0x91458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r8
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_6_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902009  ! 90: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_6_48:
	set user_data_start, %r31
	.word 0x8584bc62  ! 91: WRCCR_I	wr	%r18, 0x1c62, %ccr
	.word 0xa7a01a72  ! 92: FqTOi	fqtoi	
	.word 0x95a40d22  ! 93: FsMULd	fsmuld	%f16, %f2, %f10
	rd %pc, %r19
	add %r19, (ivw_6_49-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_49:
	.word 0x91948014  ! 94: WRPR_PIL_R	wrpr	%r18, %r20, %pil
splash_cmpr_6_50:
	setx 0x14268c65ebfc25aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_51:
	taddcctv %r24, 0x135a, %r19
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_6_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902133  ! 98: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
DS_6_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f8, %f4
	.word 0xa9b28313  ! 99: ALIGNADDRESS	alignaddr	%r10, %r19, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_54) + 24, 16, 16)) -> intp(6,0,3)
intvec_6_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xf178537c07ef99cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0x99454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xe08804a0  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_tba_6_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f8028ae  ! 109: SIR	sir	0x08ae
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768fa10  ! 110: SDIVX_I	sdivx	%r3, 0xfffffa10, %r19
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_6_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0xa150c000  ! 114: RDPR_TT	rdpr	%tt, %r16
debug_6_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_60) + 32, 16, 16)) -> intp(0,0,28)
intvec_6_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x94c0747a  ! 118: ADDCcc_I	addccc 	%r1, 0xfffff47a, %r10
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x99a00174  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200e  ! 122: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9080c012  ! 123: ADDcc_R	addcc 	%r3, %r18, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01964  ! 124: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa169b137  ! 125: SDIVX_I	sdivx	%r6, 0xfffff137, %r16
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0x9b500000  ! 127: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xa7450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xa1902007  ! 129: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_6_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_63:
	.word 0x8f902000  ! 130: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_64) + 24, 16, 16)) -> intp(0,0,18)
intvec_6_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_65:
	setx 0xa430efdda4cc765b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x87902363  ! 135: WRPR_TT_I	wrpr	%r0, 0x0363, %tt
	setx 0x3c07d6f34642350b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_6_68:
	setx 0x668821fbc8405265, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_69:
	setx 0x848b99fe147b9598, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_70:
	setx 0x0ee4789fdfa5da87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x8790218b  ! 142: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 143: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_6_72:
	setx 0x623f34d92605a69d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_6_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a489c7  ! 1: FDIVd	fdivd	%f18, %f38, %f42
	.word 0xa5a00544  ! 1: FSQRTd	fsqrt	
	.word 0x91a2082c  ! 149: FADDs	fadds	%f8, %f12, %f8
	.word 0x8780204f  ! 150: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_6_74:
	tsubcctv %r1, 0x144e, %r19
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x93d020b2  ! 153: Tcc_I	tne	icc_or_xcc, %r0 + 178
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_6_75:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe030  ! 157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
splash_tba_6_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_6_78:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_79:
	setx 0xc66b4cfdcd4778e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 161: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe8800b80  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r20
	rd %pc, %r19
	add %r19, (ivw_6_80-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_80:
	.word 0x9191c012  ! 163: WRPR_PIL_R	wrpr	%r7, %r18, %pil
memptr_6_81:
	set user_data_start, %r31
	.word 0x858039e5  ! 164: WRCCR_I	wr	%r0, 0x19e5, %ccr
DS_6_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe8d7e010  ! 166: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d90271c  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x071c, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x7e8ca3204cedc62f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d58  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1d58, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_6_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_84:
	.word 0x8f902002  ! 175: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 176: FqTOd	dis not found

	.word 0x91464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_6_86:
	setx 0x04f6ab60bb58f07f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_87:
	setx 0xe0ffab0f814a864b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_88:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_6_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_6_91:
	nop
	setx 0xfffff35ffffff248, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d80e60  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_6_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_93:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 190: RDPC	rd	%pc, %r9
memptr_6_94:
	set 0x60740000, %r31
	.word 0x8581a117  ! 191: WRCCR_I	wr	%r6, 0x0117, %ccr
	.word 0x8790206a  ! 192: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
splash_lsu_6_95:
	setx 0x83e63848487fec67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_6_96:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_6_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_6_98:
	tsubcctv %r14, 0x1654, %r26
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_99:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 198: RDPC	rd	%pc, %r10
	.word 0xd2800ac0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
splash_cmpr_6_100:
	setx 0x3fd5e9c7a6398531, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d004a0  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_cmpr_6_101:
	setx 0x8919e8d365426860, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_6_102:
	setx 0x8d587cb22e3f706f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d928011  ! 205: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x83d020b4  ! 207: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_lsu_6_105:
	setx 0xc44c96917d9915fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_6_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d910007  ! 209: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
mondo_6_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 210: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x93902001  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_6_108:
	.word 0x81982864  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0864, %hpstate
debug_6_109:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd734f2a9  ! 1: STQF_I	-	%f11, [0x12a9, %r19]
	normalw
	.word 0x91458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_6_112-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_112:
	.word 0x91904014  ! 218: WRPR_PIL_R	wrpr	%r1, %r20, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa9b48fed  ! 220: FONES	e	%f20
DS_6_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_6_114:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa1902000  ! 224: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902003  ! 225: WRPR_GL_I	wrpr	%r0, 0x0003, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_6_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_6_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d918013  ! 228: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xa1902000  ! 229: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa7520000  ! 230: RDPR_PIL	rdpr	%pil, %r19
debug_6_118:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d020b3  ! 232: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_6_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d944005  ! 233: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
intveclr_6_120:
	setx 0x4532cbd1e640ca50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b2e33  ! 236: SDIVX_I	sdivx	%r12, 0x0e33, %r13
	.word 0x95b20ff0  ! 237: FONES	e	%f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56b628c  ! 238: SDIVX_I	sdivx	%r13, 0x028c, %r18
intveclr_6_123:
	setx 0xf50b259809bbc563, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_6_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x83d02035  ! 241: Tcc_I	te	icc_or_xcc, %r0 + 53
mondo_6_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d904014  ! 242: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xa7540000  ! 243: RDPR_GL	rdpr	%-, %r19
splash_lsu_6_126:
	setx 0xac3e020b38d7b721, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_127:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_6_128:
	setx 0x6741a99368736e2d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802063  ! 248: WRASI_I	wr	%r0, 0x0063, %asi
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x95540000  ! 250: RDPR_GL	rdpr	%-, %r10
	.word 0xd88008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_6_130:
	setx 0x2ebb194174f3efb6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_131:
	setx 0x31db915a9ad9666d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_132:
	setx 0xefe2faacd6ae24d5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	setx 0x2fdcc943dbbbca0a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 257: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd88fe000  ! 258: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 259: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a314b  ! 260: SDIVX_I	sdivx	%r8, 0xfffff14b, %r17
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_136:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a0016c  ! 263: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96a6e2e  ! 264: SDIVX_I	sdivx	%r9, 0x0e2e, %r20
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_6_138:
	nop
	setx 0xfffff809fffff765, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_6_139:
	taddcctv %r6, 0x1909, %r4
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_6_140:
	tsubcctv %r11, 0x1a9b, %r8
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_6_141:
	taddcctv %r24, 0x1682, %r7
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_6_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa5a00172  ! 271: FABSq	dis not found

mondo_6_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d944010  ! 272: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xda900e80  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x74, %r13
debug_6_144:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 274: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
intveclr_6_145:
	setx 0x8671c2e46fd09cfa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_6_146:
	setx 0x57ee9cfb6c522906, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_6_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_147:
	.word 0x8f902002  ! 278: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_6_148:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_6_149:
	.word 0x8198298c  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0xda8804a0  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
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
	.word 0x99414000  ! 282: RDPC	rd	%pc, %r12
	.word 0x93902007  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x95454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0x99902003  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_6_151:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_6_152:
	tsubcctv %r24, 0x1d41, %r8
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c804a0  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_6_153:
	taddcctv %r18, 0x19bc, %r18
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f802a18  ! 291: SIR	sir	0x0a18
	.word 0x9b464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa968f845  ! 293: SDIVX_I	sdivx	%r3, 0xfffff845, %r20
donret_6_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_155-donret_6_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_6_156:
	setx 0x855efabdf223aa29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_6_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_157:
	.word 0x8f902000  ! 298: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902006  ! 299: WRPR_GL_I	wrpr	%r0, 0x0006, %-
mondo_6_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944010  ! 300: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa190200b  ! 302: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_6_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_159:
	.word 0x8f902001  ! 305: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0dfe020  ! 306: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x83d020b4  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa568659a  ! 308: SDIVX_I	sdivx	%r1, 0x059a, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01965  ! 309: FqTOd	dis not found

	.word 0x87902040  ! 310: WRPR_TT_I	wrpr	%r0, 0x0040, %tt
mondo_6_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d92c012  ! 311: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
tagged_6_163:
	taddcctv %r5, 0x1761, %r11
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902006  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_164) + 0, 16, 16)) -> intp(0,0,2)
intvec_6_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_165:
	setx 0xb8e18505c6e4f843, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d020b2  ! 317: Tcc_I	te	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_166)+24, 16, 16)) -> intp(6,1,3)
xir_6_166:
	.word 0xa9802b8f  ! 318: WR_SET_SOFTINT_I	wr	%r0, 0x0b8f, %set_softint
	setx 0xb59e106ef0540488, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_168:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_6_169:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_6_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_6_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_171:
	.word 0x8f902000  ! 323: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_6_172:
	.word 0x8198259d  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059d, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x8790233f  ! 326: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0xa190200b  ! 327: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_6_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c006  ! 329: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x87802088  ! 330: WRASI_I	wr	%r0, 0x0088, %asi
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
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_6_175:
	set 0x60540000, %r31
	.word 0x85843566  ! 332: WRCCR_I	wr	%r16, 0x1566, %ccr
mondo_6_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d950014  ! 333: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x93902002  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_6_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3348001  ! 1: STQF_R	-	%f9, [%r1, %r18]
	normalw
	.word 0xa9458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r20
intveclr_6_178:
	setx 0x625e1117ab7cd941, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 338: FqTOd	dis not found

	.word 0xa0c0ae89  ! 339: ADDCcc_I	addccc 	%r2, 0x0e89, %r16
	rd %pc, %r19
	add %r19, (ivw_6_180-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_180:
	.word 0x9190400a  ! 340: WRPR_PIL_R	wrpr	%r1, %r10, %pil
splash_cmpr_6_181:
	setx 0x8bf99611e3b84bfe, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f16, %f0
	.word 0xa7b2830a  ! 342: ALIGNADDRESS	alignaddr	%r10, %r10, %r19
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_6_184:
	tsubcctv %r4, 0x1f7b, %r6
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 345: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_186)+24, 16, 16)) -> intp(6,1,3)
xir_6_186:
	.word 0xa982e767  ! 346: WR_SET_SOFTINT_I	wr	%r11, 0x0767, %set_softint
memptr_6_187:
	set 0x60140000, %r31
	.word 0x8584ff5b  ! 347: WRCCR_I	wr	%r19, 0x1f5b, %ccr
	.word 0x879023b1  ! 348: WRPR_TT_I	wrpr	%r0, 0x03b1, %tt
mondo_6_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940007  ! 349: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0xa1902003  ! 350: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802010  ! 351: WRASI_I	wr	%r0, 0x0010, %asi
mondo_6_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c003  ! 352: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x9193217b  ! 354: WRPR_PIL_I	wrpr	%r12, 0x017b, %pil
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
	.word 0x91414000  ! 355: RDPC	rd	%pc, %r8
memptr_6_192:
	set user_data_start, %r31
	.word 0x8584ac03  ! 356: WRCCR_I	wr	%r18, 0x0c03, %ccr
	setx 0x8d833551ba3b540a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902058  ! 358: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
splash_tba_6_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 361: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_6_195:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 362: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_196) + 48, 16, 16)) -> intp(5,0,22)
intvec_6_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 364: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 365: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902bc5  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x0bc5, %pstate
	.word 0x9550c000  ! 367: RDPR_TT	rdpr	%tt, %r10
splash_cmpr_6_197:
	setx 0x4d8f08e1f24da9b9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_6_198:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_199:
	setx 0x00a53c9a04878343, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_6_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_200:
	.word 0x8f902001  ! 372: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_6_201:
	setx 0xb1f17697e71c813f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_6_202:
	set 0x60740000, %r31
	.word 0x8581a11e  ! 374: WRCCR_I	wr	%r6, 0x011e, %ccr
mondo_6_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94c009  ! 375: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xd8c7e030  ! 376: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d02033  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x936d0011  ! 378: SDIVX_R	sdivx	%r20, %r17, %r9
splash_tba_6_204:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f24, %f10
	.word 0x97b14312  ! 380: ALIGNADDRESS	alignaddr	%r5, %r18, %r11
	.word 0x8790223b  ! 381: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
splash_cmpr_6_206:
	setx 0xa8f0725f414a3577, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_6_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d914010  ! 384: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x91a00168  ! 385: FABSq	dis not found

intveclr_6_208:
	setx 0x6330a64b098b7da0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d900010  ! 387: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	.word 0xa982c007  ! 388: WR_SET_SOFTINT_R	wr	%r11, %r7, %set_softint
	.word 0xa5a509cc  ! 389: FDIVd	fdivd	%f20, %f12, %f18
	.word 0x9f803e26  ! 390: SIR	sir	0x1e26
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_6_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_210:
	.word 0x8f902001  ! 392: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_6_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f8, %f0
	.word 0x9bb1030c  ! 393: ALIGNADDRESS	alignaddr	%r4, %r12, %r13
splash_cmpr_6_212:
	setx 0x52a0ed149e317f87, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_213:
	.word 0x819828ac  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ac, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_6_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d95000c  ! 397: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 398: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_6_215:
	setx 0x2e3fc1dcaa8161c0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a0016d  ! 400: FABSq	dis not found

splash_hpstate_6_216:
	.word 0x81982974  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0974, %hpstate
	.word 0x93480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_217:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 403: RDPC	rd	%pc, %r10
	.word 0x91d020b5  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_6_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d918005  ! 405: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
mondo_6_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d908007  ! 406: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0x93902000  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
donret_6_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_220-donret_6_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_220:
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802014  ! 409: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9f80377b  ! 410: SIR	sir	0x177b
	.word 0xa97035bd  ! 411: POPC_I	popc	0x15bd, %r20
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_6_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d90c004  ! 413: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
	.word 0x91d02035  ! 414: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d902fea  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0fea, %pstate
mondo_6_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d950001  ! 417: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0xa190200f  ! 418: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x97414000  ! 420: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_6_225:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 422: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01963  ! 423: FqTOd	dis not found

	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_6_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01969  ! 427: FqTOd	dis not found

mondo_6_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d934000  ! 428: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0xa5a10d23  ! 430: FsMULd	fsmuld	%f4, %f34, %f18
debug_6_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe020  ! 432: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01973  ! 434: FqTOd	dis not found

mondo_6_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c008  ! 435: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_233)+48, 16, 16)) -> intp(6,1,3)
xir_6_233:
	.word 0xa984fa1a  ! 436: WR_SET_SOFTINT_I	wr	%r19, 0x1a1a, %set_softint
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_6_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d908002  ! 438: WRPR_WSTATE_R	wrpr	%r2, %r2, %wstate
	.word 0x99902000  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa44d0006  ! 440: MULX_R	mulx 	%r20, %r6, %r18
tagged_6_235:
	taddcctv %r22, 0x14d8, %r12
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab840005  ! 442: WR_CLEAR_SOFTINT_R	wr	%r16, %r5, %clear_softint
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_6_238:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_6_239:
	setx 0x3dbfb584f118a022, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_6_240:
	setx 0xe9cd0f0319c68437, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00170  ! 450: FABSq	dis not found

	.word 0x9b480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
splash_cmpr_6_241:
	setx 0x767ee02f6c5e6b0d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_6_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d908010  ! 454: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b703a  ! 455: SDIVX_I	sdivx	%r13, 0xfffff03a, %r12
splash_hpstate_6_244:
	.word 0x8198229f  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
debug_6_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_246:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 458: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_lsu_6_247:
	setx 0xd89ad3cb723f5b6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d902b91  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x0b91, %pstate
tagged_6_248:
	tsubcctv %r15, 0x18bb, %r2
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d903507  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x1507, %pstate
tagged_6_249:
	taddcctv %r26, 0x196d, %r25
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8790218e  ! 465: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
splash_hpstate_6_250:
	.word 0x819829c5  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c5, %hpstate
	.word 0x96fa4012  ! 467: SDIVcc_R	sdivcc 	%r9, %r18, %r11
	.word 0x93d020b5  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x879020bf  ! 469: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
	setx 0x91fddb529fb869f3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903892  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x1892, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_6_252:
	.word 0x819820e6  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00e6, %hpstate
DS_6_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_6_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x87902042  ! 478: WRPR_TT_I	wrpr	%r0, 0x0042, %tt
mondo_6_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 479: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0x8d902c21  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x0c21, %pstate
	.word 0x8d90399f  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x199f, %pstate
intveclr_6_257:
	setx 0xd06ed1c3928c8da5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027e6  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x07e6, %pstate
debug_6_258:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 484: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x99a489c1  ! 485: FDIVd	fdivd	%f18, %f32, %f12
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_6_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0800b00  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
	.word 0x99902000  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x879020f6  ! 491: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
donret_6_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_260-donret_6_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_6_261:
	setx 0x79f5aa5b87b75436, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_262) + 56, 16, 16)) -> intp(6,0,19)
intvec_6_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 495: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_6_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_264) + 56, 16, 16)) -> intp(6,0,1)
intvec_6_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xa1902003  ! 1: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902009  ! 2: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_5_0:
	setx 0x97cbc0463a91b3f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_1:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 5: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9745c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_5_2:
	tsubcctv %r6, 0x15e4, %r22
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_5_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d900006  ! 9: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
change_to_randtl_5_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_4:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_5:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 11: RDPC	rd	%pc, %r11
splash_lsu_5_6:
	setx 0x46d867e53d191695, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_5_7:
	set 0x60340000, %r31
	.word 0x8584381b  ! 14: WRCCR_I	wr	%r16, 0x181b, %ccr
	.word 0x99902000  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_8) + 56, 16, 16)) -> intp(0,0,17)
intvec_5_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_5_9:
	taddcctv %r6, 0x187b, %r15
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_5_10:
	setx 0x45f0a59ae1bf4f15, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_5_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f12
	.word 0xd9120006  ! 1: LDQF_R	-	[%r8, %r6], %f12
	.word 0x97a50832  ! 21: FADDs	fadds	%f20, %f18, %f11
DS_5_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_5_13:
	.word 0x8198294c  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196c  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91946026  ! 26: WRPR_PIL_I	wrpr	%r17, 0x0026, %pil
splash_cmpr_5_15:
	setx 0xcbdd183ad8d42e51, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790214a  ! 28: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
tagged_5_16:
	tsubcctv %r6, 0x177f, %r2
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_5_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_18:
	setx 0x9bcbed8ca62a6d0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_5_19:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 34: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0x91414000  ! 36: RDPC	rd	%pc, %r8
mondo_5_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d900003  ! 37: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
tagged_5_22:
	tsubcctv %r24, 0x15c8, %r17
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0xa9a449d3  ! 39: FDIVd	fdivd	%f48, %f50, %f20
DS_5_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb110014  ! 1: LDQF_R	-	[%r4, %r20], %f13
	.word 0x99a4482d  ! 40: FADDs	fadds	%f17, %f13, %f12
splash_tba_5_24:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_5_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d9032ab  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x12ab, %pstate
	.word 0x879023d9  ! 45: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802080  ! 47: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x99902001  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
pmu_5_27:
	nop
	setx 0xfffff7e7fffff306, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_5_28:
	set 0x60140000, %r31
	.word 0x85817553  ! 50: WRCCR_I	wr	%r5, 0x1553, %ccr
change_to_randtl_5_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_29:
	.word 0x8f902002  ! 51: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab84400b  ! 52: WR_CLEAR_SOFTINT_R	wr	%r17, %r11, %clear_softint
debug_5_30:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 53: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802014  ! 55: WRASI_I	wr	%r0, 0x0014, %asi
mondo_5_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 56: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
debug_5_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_33:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_34:
	setx 0xe19805b4fe844a0b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d908003  ! 60: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
mondo_5_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 63: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
splash_tba_5_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_39:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 65: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe297e020  ! 66: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
splash_hpstate_5_40:
	.word 0x8198294e  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x9449c000  ! 69: MULX_R	mulx 	%r7, %r0, %r10
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x87902355  ! 71: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902003  ! 73: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd8c80e80  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_5_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_42:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 77: RDPC	rd	%pc, %r18
	.word 0xd68fe030  ! 78: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x9f8033e7  ! 79: SIR	sir	0x13e7
	.word 0x8d902314  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x0314, %pstate
DS_5_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_5_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_44-donret_5_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902004  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd6cfe030  ! 84: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0xa1902003  ! 85: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	rd %pc, %r19
	add %r19, (ivw_5_45-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_45:
	.word 0x9192400a  ! 86: WRPR_PIL_R	wrpr	%r9, %r10, %pil
DS_5_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9ba109cb  ! 1: FDIVd	fdivd	%f4, %f42, %f44
	normalw
	.word 0x99458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r12
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 90: WRPR_GL_I	wrpr	%r0, 0x000e, %-
memptr_5_48:
	set user_data_start, %r31
	.word 0x8581a65b  ! 91: WRCCR_I	wr	%r6, 0x065b, %ccr
	.word 0x99a01a66  ! 92: FqTOi	fqtoi	
	.word 0x9ba40d27  ! 93: FsMULd	fsmuld	%f16, %f38, %f44
	rd %pc, %r19
	add %r19, (ivw_5_49-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_49:
	.word 0x9191c002  ! 94: WRPR_PIL_R	wrpr	%r7, %r2, %pil
splash_cmpr_5_50:
	setx 0x13674d2cb65dd124, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_51:
	taddcctv %r11, 0x15eb, %r8
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_5_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902058  ! 98: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
DS_5_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f0, %f20
	.word 0x9bb3030d  ! 99: ALIGNADDRESS	alignaddr	%r12, %r13, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_54) + 0, 16, 16)) -> intp(1,0,22)
intvec_5_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x2584f9ba47ee7a0f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0xa1454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe0880e40  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x72, %r16
splash_tba_5_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f80366f  ! 109: SIR	sir	0x166f
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ca977  ! 110: SDIVX_I	sdivx	%r18, 0x0977, %r10
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_5_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9950c000  ! 114: RDPR_TT	rdpr	%tt, %r12
debug_5_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_60) + 0, 16, 16)) -> intp(1,0,21)
intvec_5_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa8c12509  ! 118: ADDCcc_I	addccc 	%r4, 0x0509, %r20
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0xa9a0016d  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200b  ! 122: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x98824011  ! 123: ADDcc_R	addcc 	%r9, %r17, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 124: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cbe5a  ! 125: SDIVX_I	sdivx	%r18, 0xfffffe5a, %r11
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0x93500000  ! 127: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x9b450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xa1902006  ! 129: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_5_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_63:
	.word 0x8f902002  ! 130: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_64) + 56, 16, 16)) -> intp(1,0,21)
intvec_5_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_65:
	setx 0x26d98393c9e2de0e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x87902241  ! 135: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	setx 0xcd1e4b0b64a5a87c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_5_68:
	setx 0xf65a00f4ccf65fad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_69:
	setx 0x07e9a4632bed9ae0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_70:
	setx 0x4752bf35e8c4c969, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x87902233  ! 142: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 143: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_5_72:
	setx 0x8941c6f72a0d659d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_5_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba309d3  ! 1: FDIVd	fdivd	%f12, %f50, %f44
	.word 0x95a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa7a34830  ! 149: FADDs	fadds	%f13, %f16, %f19
	.word 0x87802063  ! 150: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_5_74:
	tsubcctv %r4, 0x1301, %r11
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d02034  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_5_75:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe010  ! 157: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
splash_tba_5_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_5_78:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_79:
	setx 0xfa1f4fb2893f9abb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 161: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe88008a0  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	rd %pc, %r19
	add %r19, (ivw_5_80-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_80:
	.word 0x9192000d  ! 163: WRPR_PIL_R	wrpr	%r8, %r13, %pil
memptr_5_81:
	set user_data_start, %r31
	.word 0x85853f43  ! 164: WRCCR_I	wr	%r20, 0x1f43, %ccr
DS_5_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe8d7e020  ! 166: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d90279a  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x079a, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902000  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0xf842100213a3f31c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a39  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1a39, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_5_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_84:
	.word 0x8f902000  ! 175: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01973  ! 176: FqTOd	dis not found

	.word 0x9b464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_5_86:
	setx 0x7e6af21526669df9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_87:
	setx 0x76d89474c6d3d411, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_88:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_5_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_5_91:
	nop
	setx 0xfffff1ecfffffed9, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d804a0  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_5_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 190: RDPC	rd	%pc, %r20
memptr_5_94:
	set 0x60540000, %r31
	.word 0x8580b970  ! 191: WRCCR_I	wr	%r2, 0x1970, %ccr
	.word 0x879021d3  ! 192: WRPR_TT_I	wrpr	%r0, 0x01d3, %tt
splash_lsu_5_95:
	setx 0x039fdcf88db6a847, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_5_96:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_5_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_5_98:
	tsubcctv %r9, 0x1554, %r21
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_99:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 198: RDPC	rd	%pc, %r17
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_5_100:
	setx 0xe8553eebfe83678c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d00e60  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
splash_cmpr_5_101:
	setx 0x11ad6a6d7ded68f9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_5_102:
	setx 0x53e85bf3e8f28b65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d910013  ! 205: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d020b4  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_5_105:
	setx 0x219f581283a980af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_5_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d90000c  ! 209: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
mondo_5_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 210: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0x93902004  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_5_108:
	.word 0x819825c4  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c4, %hpstate
debug_5_109:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3322a45  ! 1: STQF_I	-	%f9, [0x0a45, %r8]
	normalw
	.word 0x9b458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r13
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_5_112-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_112:
	.word 0x9190000a  ! 218: WRPR_PIL_R	wrpr	%r0, %r10, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa3b44fe6  ! 220: FONES	e	%f17
DS_5_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_5_114:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa1902007  ! 224: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902006  ! 225: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_5_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_5_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 228: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0xa1902005  ! 229: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91520000  ! 230: RDPR_PIL	<illegal instruction>
debug_5_118:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 232: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_5_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
intveclr_5_120:
	setx 0x1455a4fad39a5098, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b7529  ! 236: SDIVX_I	sdivx	%r13, 0xfffff529, %r9
	.word 0x95b2cfe7  ! 237: FONES	e	%f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36b6fe9  ! 238: SDIVX_I	sdivx	%r13, 0x0fe9, %r17
intveclr_5_123:
	setx 0x5912ae96a10f5f39, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_5_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91d020b4  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_5_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d908001  ! 242: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0x9b540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_5_126:
	setx 0xbd38d5f8d75ae947, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_127:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_5_128:
	setx 0x8b22723d5604f7a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802055  ! 248: WRASI_I	wr	%r0, 0x0055, %asi
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x95540000  ! 250: RDPR_GL	rdpr	%-, %r10
	.word 0xd88008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_5_130:
	setx 0xcff18533839f12de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_131:
	setx 0xdcff6de4bb45eba3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_132:
	setx 0x5175502eca90aa7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	setx 0x1a15dba8c0dcbe74, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 257: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd88fe000  ! 258: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01974  ! 259: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d33a1  ! 260: SDIVX_I	sdivx	%r20, 0xfffff3a1, %r10
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 261: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_5_136:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9ba00164  ! 263: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16b38fb  ! 264: SDIVX_I	sdivx	%r12, 0xfffff8fb, %r16
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_5_138:
	nop
	setx 0xfffffa1ffffffeb8, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_5_139:
	taddcctv %r5, 0x1fc5, %r7
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_5_140:
	tsubcctv %r3, 0x1870, %r23
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_5_141:
	taddcctv %r5, 0x1f79, %r9
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_5_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x99a00161  ! 271: FABSq	dis not found

mondo_5_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d904001  ! 272: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_5_144:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 274: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
intveclr_5_145:
	setx 0x9721d17005f258a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_5_146:
	setx 0x5f3998248db5fbab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_5_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_147:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_5_148:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_5_149:
	.word 0x8198231c  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031c, %hpstate
	.word 0xda8804a0  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
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
	.word 0xa3414000  ! 282: RDPC	rd	%pc, %r17
	.word 0x93902001  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0x99902002  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
debug_5_151:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_5_152:
	tsubcctv %r18, 0x100f, %r14
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c80e40  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r8
	.word 0x8d802004  ! 289: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_5_153:
	taddcctv %r16, 0x1d0c, %r26
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f8035c0  ! 291: SIR	sir	0x15c0
	.word 0xa9464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68e616  ! 293: SDIVX_I	sdivx	%r3, 0x0616, %r13
donret_5_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_155-donret_5_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_5_156:
	setx 0x275433e8de628743, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 51
change_to_randtl_5_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_157:
	.word 0x8f902003  ! 298: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902002  ! 299: WRPR_GL_I	wrpr	%r0, 0x0002, %-
mondo_5_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d918002  ! 300: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
	.word 0xd0c00e80  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r8
	.word 0xa1902005  ! 302: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_5_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_159:
	.word 0x8f902003  ! 305: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0dfe030  ! 306: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x91d02033  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c7664  ! 308: SDIVX_I	sdivx	%r17, 0xfffff664, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01970  ! 309: FqTOd	dis not found

	.word 0x879021bd  ! 310: WRPR_TT_I	wrpr	%r0, 0x01bd, %tt
mondo_5_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94400a  ! 311: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
tagged_5_163:
	taddcctv %r13, 0x12c2, %r20
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902005  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_164) + 8, 16, 16)) -> intp(2,0,3)
intvec_5_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_165:
	setx 0xca8a0f0623986632, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 317: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_166)+16, 16, 16)) -> intp(5,1,3)
xir_5_166:
	.word 0xa984fa5c  ! 318: WR_SET_SOFTINT_I	wr	%r19, 0x1a5c, %set_softint
	setx 0x116c6971a2945478, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_168:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_5_169:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_5_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_5_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_171:
	.word 0x8f902003  ! 323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_hpstate_5_172:
	.word 0x81982d5f  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5f, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x8790238f  ! 326: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	.word 0xa190200f  ! 327: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_5_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d908013  ! 329: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x8780201c  ! 330: WRASI_I	wr	%r0, 0x001c, %asi
donret_5_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_174-donret_5_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_174:
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_5_175:
	set 0x60740000, %r31
	.word 0x8581a9f3  ! 332: WRCCR_I	wr	%r6, 0x09f3, %ccr
mondo_5_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 333: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0x93902005  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_5_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3300009  ! 1: STQF_R	-	%f9, [%r9, %r0]
	normalw
	.word 0x91458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r8
intveclr_5_178:
	setx 0x3fffe8b70ef10a23, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 338: FqTOd	dis not found

	.word 0xa0c46602  ! 339: ADDCcc_I	addccc 	%r17, 0x0602, %r16
	rd %pc, %r19
	add %r19, (ivw_5_180-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_180:
	.word 0x9194c011  ! 340: WRPR_PIL_R	wrpr	%r19, %r17, %pil
splash_cmpr_5_181:
	setx 0xc9c871549199492f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f14, %f30
	.word 0xa7b18302  ! 342: ALIGNADDRESS	alignaddr	%r6, %r2, %r19
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_5_184:
	tsubcctv %r2, 0x1041, %r1
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_185:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 345: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_186)+56, 16, 16)) -> intp(5,1,3)
xir_5_186:
	.word 0xa9802784  ! 346: WR_SET_SOFTINT_I	wr	%r0, 0x0784, %set_softint
memptr_5_187:
	set 0x60540000, %r31
	.word 0x85833070  ! 347: WRCCR_I	wr	%r12, 0x1070, %ccr
	.word 0x87902333  ! 348: WRPR_TT_I	wrpr	%r0, 0x0333, %tt
mondo_5_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d904003  ! 349: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
	.word 0xa1902005  ! 350: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802055  ! 351: WRASI_I	wr	%r0, 0x0055, %asi
mondo_5_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d910005  ! 352: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x9194e2c8  ! 354: WRPR_PIL_I	wrpr	%r19, 0x02c8, %pil
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
	.word 0x93414000  ! 355: RDPC	rd	%pc, %r9
memptr_5_192:
	set user_data_start, %r31
	.word 0x8582e051  ! 356: WRCCR_I	wr	%r11, 0x0051, %ccr
	setx 0x075b9b9f986ce360, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902321  ! 358: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
splash_tba_5_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 360: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 361: WRPR_GL_I	wrpr	%r0, 0x000a, %-
debug_5_195:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 362: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_196) + 40, 16, 16)) -> intp(4,0,30)
intvec_5_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 364: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903ffe  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x1ffe, %pstate
	.word 0x9150c000  ! 367: RDPR_TT	rdpr	%tt, %r8
splash_cmpr_5_197:
	setx 0x4cc85cc1683883b0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_5_198:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_199:
	setx 0x5f016279ced86b47, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b3  ! 371: Tcc_I	te	icc_or_xcc, %r0 + 179
change_to_randtl_5_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_200:
	.word 0x8f902001  ! 372: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_5_201:
	setx 0xc81e928577c4f886, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_5_202:
	set 0x60340000, %r31
	.word 0x858439de  ! 374: WRCCR_I	wr	%r16, 0x19de, %ccr
mondo_5_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d924002  ! 375: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	.word 0xd8c7e020  ! 376: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0x91d02035  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x95690013  ! 378: SDIVX_R	sdivx	%r4, %r19, %r10
splash_tba_5_204:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f2, %f30
	.word 0xa7b1c30d  ! 380: ALIGNADDRESS	alignaddr	%r7, %r13, %r19
	.word 0x87902196  ! 381: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
splash_cmpr_5_206:
	setx 0xcb4cb6838c2f0dff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_5_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d910014  ! 384: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0xa5a00174  ! 385: FABSq	dis not found

intveclr_5_208:
	setx 0x451ad59a4513f465, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d900010  ! 387: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	.word 0xa980c009  ! 388: WR_SET_SOFTINT_R	wr	%r3, %r9, %set_softint
	.word 0xa5a0c9d4  ! 389: FDIVd	fdivd	%f34, %f20, %f18
	.word 0x9f803fb8  ! 390: SIR	sir	0x1fb8
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_5_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_210:
	.word 0x8f902002  ! 392: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_5_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f14, %f0
	.word 0xa7b40314  ! 393: ALIGNADDRESS	alignaddr	%r16, %r20, %r19
splash_cmpr_5_212:
	setx 0x2feaa798c81fcae5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_213:
	.word 0x8198202e  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x002e, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_5_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92c010  ! 397: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 398: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_5_215:
	setx 0xfca75dfd8d735cc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00161  ! 400: FABSq	dis not found

splash_hpstate_5_216:
	.word 0x81982b0c  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0c, %hpstate
	.word 0x91480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_217:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 403: RDPC	rd	%pc, %r12
	.word 0x91d020b3  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 179
mondo_5_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 405: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
mondo_5_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d90c00d  ! 406: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0x93902007  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
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
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802055  ! 409: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f8025ba  ! 410: SIR	sir	0x05ba
	.word 0x95702424  ! 411: POPC_I	popc	0x0424, %r10
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_5_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 413: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x93d02033  ! 414: Tcc_I	tne	icc_or_xcc, %r0 + 51
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d90374f  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x174f, %pstate
mondo_5_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d940004  ! 417: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0xa1902002  ! 418: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x9b414000  ! 420: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_5_225:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 422: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01964  ! 423: FqTOd	dis not found

	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_5_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01963  ! 427: FqTOd	dis not found

mondo_5_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 428: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0x95a48d31  ! 430: FsMULd	fsmuld	%f18, %f48, %f10
debug_5_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe010  ! 432: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01965  ! 434: FqTOd	dis not found

mondo_5_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940003  ! 435: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_233)+8, 16, 16)) -> intp(5,1,3)
xir_5_233:
	.word 0xa9843c75  ! 436: WR_SET_SOFTINT_I	wr	%r16, 0x1c75, %set_softint
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_5_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d944006  ! 438: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x99902004  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa44b000a  ! 440: MULX_R	mulx 	%r12, %r10, %r18
tagged_5_235:
	taddcctv %r17, 0x120a, %r2
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab814010  ! 442: WR_CLEAR_SOFTINT_R	wr	%r5, %r16, %clear_softint
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_5_238:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_5_239:
	setx 0x004f67f1026f1129, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 448: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_5_240:
	setx 0x3d7f4332a235fd47, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a00171  ! 450: FABSq	dis not found

	.word 0x97480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
splash_cmpr_5_241:
	setx 0xc4a226b09d4b054f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_5_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d900009  ! 454: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36cea42  ! 455: SDIVX_I	sdivx	%r19, 0x0a42, %r17
splash_hpstate_5_244:
	.word 0x819821d4  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d4, %hpstate
debug_5_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_246:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 458: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_5_247:
	setx 0x6a1b940c4114e59b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d903afb  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x1afb, %pstate
tagged_5_248:
	tsubcctv %r20, 0x1e23, %r25
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d9027a4  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x07a4, %pstate
tagged_5_249:
	taddcctv %r2, 0x1d23, %r18
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x879022b4  ! 465: WRPR_TT_I	wrpr	%r0, 0x02b4, %tt
splash_hpstate_5_250:
	.word 0x81982585  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
	.word 0x96fc0006  ! 467: SDIVcc_R	sdivcc 	%r16, %r6, %r11
	.word 0x91d02032  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902013  ! 469: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
	setx 0x1186ac65129813b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a55  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x0a55, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_5_252:
	.word 0x81982e1c  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
DS_5_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_5_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x87902165  ! 478: WRPR_TT_I	wrpr	%r0, 0x0165, %tt
mondo_5_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d908009  ! 479: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0x8d90315e  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x115e, %pstate
	.word 0x8d902805  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
intveclr_5_257:
	setx 0xf8bf7cc3a04c734e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903942  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x1942, %pstate
debug_5_258:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 484: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xa5a109c8  ! 485: FDIVd	fdivd	%f4, %f8, %f18
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_5_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe08008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x99902003  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8790225d  ! 491: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
donret_5_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_260-donret_5_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_5_261:
	setx 0x3f92c70be870fab5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_262) + 16, 16, 16)) -> intp(3,0,19)
intvec_5_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 495: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_5_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0800a80  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_264) + 8, 16, 16)) -> intp(4,0,14)
intvec_5_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0xa1902000  ! 1: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902004  ! 2: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_4_0:
	setx 0x8698ec6da703fc91, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_1:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 5: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9745c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_4_2:
	tsubcctv %r10, 0x1738, %r5
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_4_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 9: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
change_to_randtl_4_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_4:
	.word 0x8f902000  ! 10: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_5:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 11: RDPC	rd	%pc, %r12
splash_lsu_4_6:
	setx 0x7e49f8f1085e396d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_4_7:
	set 0x60540000, %r31
	.word 0x85842841  ! 14: WRCCR_I	wr	%r16, 0x0841, %ccr
	.word 0x99902005  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_8) + 8, 16, 16)) -> intp(5,0,28)
intvec_4_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_4_9:
	taddcctv %r1, 0x125e, %r21
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_4_10:
	setx 0x35da24750e3f7aa5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_4_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba249c0  ! 1: FDIVd	fdivd	%f40, %f0, %f44
	.word 0xe910c010  ! 1: LDQF_R	-	[%r3, %r16], %f20
	.word 0x99a0c821  ! 21: FADDs	fadds	%f3, %f1, %f12
DS_4_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_4_13:
	.word 0x8198251d  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051d, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196a  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91902aec  ! 26: WRPR_PIL_I	wrpr	%r0, 0x0aec, %pil
splash_cmpr_4_15:
	setx 0x3d3d620fc12d6f36, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879023d0  ! 28: WRPR_TT_I	wrpr	%r0, 0x03d0, %tt
tagged_4_16:
	tsubcctv %r26, 0x1aca, %r5
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_4_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_18:
	setx 0x1fa8b13f41220dbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_4_19:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802016  ! 34: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0xa5414000  ! 36: RDPC	rd	%pc, %r18
mondo_4_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c001  ! 37: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
tagged_4_22:
	tsubcctv %r3, 0x1ebc, %r16
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0xa1a449c4  ! 39: FDIVd	fdivd	%f48, %f4, %f16
DS_4_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3104008  ! 1: LDQF_R	-	[%r1, %r8], %f9
	.word 0xa7a0c827  ! 40: FADDs	fadds	%f3, %f7, %f19
splash_tba_4_24:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_4_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d903452  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x1452, %pstate
	.word 0x87902047  ! 45: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802058  ! 47: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x99902003  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_4_27:
	nop
	setx 0xfffff5e8fffffe12, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_4_28:
	set 0x60740000, %r31
	.word 0x85842b45  ! 50: WRCCR_I	wr	%r16, 0x0b45, %ccr
change_to_randtl_4_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_29:
	.word 0x8f902002  ! 51: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab824002  ! 52: WR_CLEAR_SOFTINT_R	wr	%r9, %r2, %clear_softint
debug_4_30:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_30:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_30
    nop
debug_wait4_30:
    ld [%r23], %r2
    brnz %r2, debug_wait4_30
    nop
    ba,a debug_startwait4_30
continue_debug_4_30:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_30:
    cmp %r13, %r15
    bne,a wait_for_stat_4_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_30:
    cmp %r14, %r15
    bne,a wait_for_debug_4_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 53: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x8780204f  ! 55: WRASI_I	wr	%r0, 0x004f, %asi
mondo_4_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d930006  ! 56: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
debug_4_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_33:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_34:
	setx 0x216c5f3dfe5608a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92c000  ! 60: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
mondo_4_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 63: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
splash_tba_4_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_39:
    cmp %r14, %r15
    bne,a wait_for_debug_4_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %10, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 65: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xe297e020  ! 66: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
splash_hpstate_4_40:
	.word 0x81982dd4  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd4, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x904d0010  ! 69: MULX_R	mulx 	%r20, %r16, %r8
	.word 0xd8d00e80  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
	.word 0x87902203  ! 71: WRPR_TT_I	wrpr	%r0, 0x0203, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200a  ! 73: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_4_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_42:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 77: RDPC	rd	%pc, %r18
	.word 0xd68fe010  ! 78: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x9f803157  ! 79: SIR	sir	0x1157
	.word 0x8d903c18  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x1c18, %pstate
DS_4_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_4_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_44-donret_4_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902004  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd6cfe020  ! 84: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xa1902001  ! 85: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	rd %pc, %r19
	add %r19, (ivw_4_45-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_45:
	.word 0x9191c007  ! 86: WRPR_PIL_R	wrpr	%r7, %r7, %pil
DS_4_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a489ca  ! 1: FDIVd	fdivd	%f18, %f10, %f40
	normalw
	.word 0x93458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r9
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 88: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_4_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 90: WRPR_GL_I	wrpr	%r0, 0x000d, %-
memptr_4_48:
	set user_data_start, %r31
	.word 0x8584796b  ! 91: WRCCR_I	wr	%r17, 0x196b, %ccr
	.word 0xa3a01a73  ! 92: FqTOi	fqtoi	
	.word 0x93a44d2c  ! 93: FsMULd	fsmuld	%f17, %f12, %f40
	rd %pc, %r19
	add %r19, (ivw_4_49-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_49:
	.word 0x91934011  ! 94: WRPR_PIL_R	wrpr	%r13, %r17, %pil
splash_cmpr_4_50:
	setx 0x75b0ad7cd50bca75, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_51:
	taddcctv %r7, 0x12d9, %r5
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_4_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902101  ! 98: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
DS_4_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f24, %f2
	.word 0x91b4c302  ! 99: ALIGNADDRESS	alignaddr	%r19, %r2, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_54) + 48, 16, 16)) -> intp(6,0,29)
intvec_4_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xeb4a4becac45314e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d80e60  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x73, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0x95454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0xe0880e80  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x74, %r16
splash_tba_4_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802610  ! 109: SIR	sir	0x0610
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99683d8b  ! 110: SDIVX_I	sdivx	%r0, 0xfffffd8b, %r12
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_4_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9350c000  ! 114: RDPR_TT	rdpr	%tt, %r9
debug_4_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_60) + 48, 16, 16)) -> intp(2,0,9)
intvec_4_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6c1e7e3  ! 118: ADDCcc_I	addccc 	%r7, 0x07e3, %r19
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x95a00173  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902005  ! 122: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9a82800c  ! 123: ADDcc_R	addcc 	%r10, %r12, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01969  ! 124: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa569e3b6  ! 125: SDIVX_I	sdivx	%r7, 0x03b6, %r18
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0x99500000  ! 127: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xa5450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xa1902006  ! 129: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_4_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_63:
	.word 0x8f902002  ! 130: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_64) + 32, 16, 16)) -> intp(1,0,9)
intvec_4_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_65:
	setx 0x47b40ec4838ac1d5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x879021ed  ! 135: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
	setx 0x124c3f29b7268e95, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_4_68:
	setx 0xdcb32de8889ab2f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_69:
	setx 0x95d91ab471bdeefb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_70:
	setx 0x94e4388d15f666a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x8790235e  ! 142: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 143: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xdad00e60  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r13
splash_lsu_4_72:
	setx 0xc281e411b70e2265, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_4_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a149c4  ! 1: FDIVd	fdivd	%f36, %f4, %f42
	.word 0x9ba00545  ! 1: FSQRTd	fsqrt	
	.word 0xa5a14824  ! 149: FADDs	fadds	%f5, %f4, %f18
	.word 0x87802080  ! 150: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_4_74:
	tsubcctv %r3, 0x1225, %r23
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d02035  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_4_75:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe020  ! 157: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
splash_tba_4_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_4_78:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_79:
	setx 0x4ed575d7cd9c2e3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 161: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe88008a0  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	rd %pc, %r19
	add %r19, (ivw_4_80-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_80:
	.word 0x91924004  ! 163: WRPR_PIL_R	wrpr	%r9, %r4, %pil
memptr_4_81:
	set user_data_start, %r31
	.word 0x858323cc  ! 164: WRCCR_I	wr	%r12, 0x03cc, %ccr
DS_4_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe8d7e030  ! 166: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d903bde  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x1bde, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x2857e9c34bceaf6c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037a1  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x17a1, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_4_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_84:
	.word 0x8f902001  ! 175: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01971  ! 176: FqTOd	dis not found

	.word 0x99464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02032  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_4_86:
	setx 0xf40898e2d4d2f47d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_87:
	setx 0xee708c0caca3278a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_88:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_4_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_4_91:
	nop
	setx 0xfffff338fffff967, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d804a0  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_4_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 190: RDPC	rd	%pc, %r19
memptr_4_94:
	set 0x60140000, %r31
	.word 0x8584e1cc  ! 191: WRCCR_I	wr	%r19, 0x01cc, %ccr
	.word 0x879023ce  ! 192: WRPR_TT_I	wrpr	%r0, 0x03ce, %tt
splash_lsu_4_95:
	setx 0x15f162f0eb104af3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_4_96:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_4_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_4_98:
	tsubcctv %r7, 0x13f8, %r7
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_99:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 198: RDPC	rd	%pc, %r10
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_4_100:
	setx 0x6480b7256254757a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d004a0  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_cmpr_4_101:
	setx 0x04565ad7c0f97798, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_4_102:
	setx 0x20e23c6cf624b829, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d930010  ! 205: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d02033  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_4_105:
	setx 0xca578e1ccdd69117, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d910013  ! 209: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d91c00c  ! 210: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x93902001  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_4_108:
	.word 0x81982a6c  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a6c, %hpstate
debug_4_109:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1332af3  ! 1: STQF_I	-	%f8, [0x0af3, %r12]
	normalw
	.word 0xa7458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_4_112-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_112:
	.word 0x91914010  ! 218: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x9bb44fe8  ! 220: FONES	e	%f13
DS_4_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_4_114:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa190200c  ! 224: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200d  ! 225: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_4_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
mondo_4_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d940011  ! 228: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xa1902001  ! 229: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93520000  ! 230: RDPR_PIL	<illegal instruction>
debug_4_118:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 232: Tcc_I	te	icc_or_xcc, %r0 + 52
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d904000  ! 233: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
intveclr_4_120:
	setx 0x83f06068ff621e7a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b349d  ! 236: SDIVX_I	sdivx	%r12, 0xfffff49d, %r20
	.word 0x9bb1cff4  ! 237: FONES	e	%f13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16ab19c  ! 238: SDIVX_I	sdivx	%r10, 0xfffff19c, %r16
intveclr_4_123:
	setx 0x5bd1237697b8f965, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x93d02035  ! 241: Tcc_I	tne	icc_or_xcc, %r0 + 53
mondo_4_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940000  ! 242: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	.word 0x97540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_4_126:
	setx 0x3654a2edbd90a5a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_127:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_4_128:
	setx 0xdeee1a355c3bc1f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802010  ! 248: WRASI_I	wr	%r0, 0x0010, %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9b540000  ! 250: RDPR_GL	rdpr	%-, %r13
	.word 0xd88008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_4_130:
	setx 0x49898a81f9b27b85, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_131:
	setx 0xc9885e44c067366b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_132:
	setx 0x5553165bb9be6daf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	setx 0x5f8bc31f611975a6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 257: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd88fe030  ! 258: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01968  ! 259: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a7079  ! 260: SDIVX_I	sdivx	%r9, 0xfffff079, %r10
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_136:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a00173  ! 263: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9369be3a  ! 264: SDIVX_I	sdivx	%r6, 0xfffffe3a, %r9
	.word 0xd8c80e40  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
pmu_4_138:
	nop
	setx 0xfffff06efffffc10, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_139:
	taddcctv %r24, 0x1958, %r10
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_4_140:
	tsubcctv %r19, 0x12b7, %r15
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_4_141:
	taddcctv %r13, 0x10af, %r8
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_4_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa5a00170  ! 271: FABSq	dis not found

mondo_4_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d930012  ! 272: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_4_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_144:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_144
    nop
debug_wait4_144:
    ld [%r23], %r2
    brnz %r2, debug_wait4_144
    nop
    ba,a debug_startwait4_144
continue_debug_4_144:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_144:
    cmp %r13, %r15
    bne,a wait_for_stat_4_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_144:
    cmp %r14, %r15
    bne,a wait_for_debug_4_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 274: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
intveclr_4_145:
	setx 0xd938e2cc3fe450e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_4_146:
	setx 0x9325a7d240a8e709, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_4_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_147:
	.word 0x8f902003  ! 278: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_4_148:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_4_149:
	.word 0x8198268f  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068f, %hpstate
	.word 0xda880e80  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
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
	.word 0x97414000  ! 282: RDPC	rd	%pc, %r11
	.word 0x93902007  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x99902000  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
debug_4_151:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_4_152:
	tsubcctv %r3, 0x1512, %r11
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c804a0  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_4_153:
	taddcctv %r16, 0x1004, %r3
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f803467  ! 291: SIR	sir	0x1467
	.word 0xa9464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a3038  ! 293: SDIVX_I	sdivx	%r8, 0xfffff038, %r12
donret_4_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_155-donret_4_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_4_156:
	setx 0x5949f49f2c420e61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_4_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_157:
	.word 0x8f902000  ! 298: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa190200a  ! 299: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_4_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 300: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa1902004  ! 302: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_4_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_159:
	.word 0x8f902000  ! 305: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd0dfe020  ! 306: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0x91d02034  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a2151  ! 308: SDIVX_I	sdivx	%r8, 0x0151, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 309: FqTOd	dis not found

	.word 0x87902160  ! 310: WRPR_TT_I	wrpr	%r0, 0x0160, %tt
mondo_4_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d948001  ! 311: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
tagged_4_163:
	taddcctv %r17, 0x11cb, %r19
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902003  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_164) + 24, 16, 16)) -> intp(0,0,12)
intvec_4_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_165:
	setx 0xc17d7f3d37472113, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02035  ! 317: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_166)+0, 16, 16)) -> intp(4,1,3)
xir_4_166:
	.word 0xa981fa72  ! 318: WR_SET_SOFTINT_I	wr	%r7, 0x1a72, %set_softint
	setx 0xb7ee5f1af2029b20, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_168:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_4_169:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_4_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_4_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_171:
	.word 0x8f902003  ! 323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_hpstate_4_172:
	.word 0x81982f96  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f96, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x8790214c  ! 326: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	.word 0xa1902004  ! 327: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_4_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 329: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0x87802058  ! 330: WRASI_I	wr	%r0, 0x0058, %asi
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
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_4_175:
	set 0x60540000, %r31
	.word 0x8582e056  ! 332: WRCCR_I	wr	%r11, 0x0056, %ccr
mondo_4_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d90800d  ! 333: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x93902005  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_4_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5314002  ! 1: STQF_R	-	%f18, [%r2, %r5]
	normalw
	.word 0xa7458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r19
intveclr_4_178:
	setx 0x70a06196f8eec1d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 338: FqTOd	dis not found

	.word 0x92c365a1  ! 339: ADDCcc_I	addccc 	%r13, 0x05a1, %r9
	rd %pc, %r19
	add %r19, (ivw_4_180-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_180:
	.word 0x9192c014  ! 340: WRPR_PIL_R	wrpr	%r11, %r20, %pil
splash_cmpr_4_181:
	setx 0x856000b036baf25c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f14, %f2, %f6
	.word 0x95b48305  ! 342: ALIGNADDRESS	alignaddr	%r18, %r5, %r10
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_4_184:
	tsubcctv %r17, 0x192f, %r11
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 345: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_186)+48, 16, 16)) -> intp(4,1,3)
xir_4_186:
	.word 0xa98027ad  ! 346: WR_SET_SOFTINT_I	wr	%r0, 0x07ad, %set_softint
memptr_4_187:
	set 0x60740000, %r31
	.word 0x858526f0  ! 347: WRCCR_I	wr	%r20, 0x06f0, %ccr
	.word 0x8790206b  ! 348: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
mondo_4_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 349: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xa1902006  ! 350: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802058  ! 351: WRASI_I	wr	%r0, 0x0058, %asi
mondo_4_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d92c009  ! 352: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x91943a2c  ! 354: WRPR_PIL_I	wrpr	%r16, 0x1a2c, %pil
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
	.word 0x99414000  ! 355: RDPC	rd	%pc, %r12
memptr_4_192:
	set user_data_start, %r31
	.word 0x8584aa06  ! 356: WRCCR_I	wr	%r18, 0x0a06, %ccr
	setx 0x4008aa567e63e969, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790232d  ! 358: WRPR_TT_I	wrpr	%r0, 0x032d, %tt
splash_tba_4_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 360: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 361: WRPR_GL_I	wrpr	%r0, 0x0005, %-
debug_4_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_195:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_195
    nop
debug_wait4_195:
    ld [%r23], %r2
    brnz %r2, debug_wait4_195
    nop
    ba,a debug_startwait4_195
continue_debug_4_195:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_195:
    cmp %r13, %r15
    bne,a wait_for_stat_4_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_195:
    cmp %r14, %r15
    bne,a wait_for_debug_4_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 362: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_196) + 56, 16, 16)) -> intp(3,0,6)
intvec_4_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 364: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 365: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903af3  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x1af3, %pstate
	.word 0xa550c000  ! 367: RDPR_TT	rdpr	%tt, %r18
splash_cmpr_4_197:
	setx 0x1c8900bb75593f68, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_4_198:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_199:
	setx 0x6ed831a316fde471, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_4_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_200:
	.word 0x8f902002  ! 372: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_4_201:
	setx 0xd4c638652830b358, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_202:
	set 0x60740000, %r31
	.word 0x8584eb43  ! 374: WRCCR_I	wr	%r19, 0x0b43, %ccr
mondo_4_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d918009  ! 375: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0xd8c7e000  ! 376: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0x91d020b3  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9b6a8004  ! 378: SDIVX_R	sdivx	%r10, %r4, %r13
splash_tba_4_204:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f28, %f0
	.word 0xa7b40302  ! 380: ALIGNADDRESS	alignaddr	%r16, %r2, %r19
	.word 0x879023e6  ! 381: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
splash_cmpr_4_206:
	setx 0xb0b5a5396ada4bc1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_4_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d94c00a  ! 384: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xa7a00167  ! 385: FABSq	dis not found

intveclr_4_208:
	setx 0x3670b9b947656196, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 387: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xa9828014  ! 388: WR_SET_SOFTINT_R	wr	%r10, %r20, %set_softint
	.word 0xa3a489cd  ! 389: FDIVd	fdivd	%f18, %f44, %f48
	.word 0x9f802da8  ! 390: SIR	sir	0x0da8
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_4_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_210:
	.word 0x8f902000  ! 392: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_4_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f22, %f10
	.word 0x99b4030d  ! 393: ALIGNADDRESS	alignaddr	%r16, %r13, %r12
splash_cmpr_4_212:
	setx 0x0dc334fee611d111, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_213:
	.word 0x81982a95  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_4_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 397: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 398: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_4_215:
	setx 0x815df33271d27f97, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00174  ! 400: FABSq	dis not found

splash_hpstate_4_216:
	.word 0x819820fe  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00fe, %hpstate
	.word 0xa5480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_217:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 403: RDPC	rd	%pc, %r16
	.word 0x91d02033  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_4_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948002  ! 405: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
mondo_4_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d91c00b  ! 406: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
	.word 0x93902007  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
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
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802004  ! 409: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f80319d  ! 410: SIR	sir	0x119d
	.word 0x95702d12  ! 411: POPC_I	popc	0x0d12, %r10
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_4_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d924013  ! 413: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x91d02033  ! 414: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d903473  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x1473, %pstate
mondo_4_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d920012  ! 417: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xa190200d  ! 418: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x93414000  ! 420: RDPC	rd	%pc, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_4_225:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_225:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_225
    nop
debug_wait4_225:
    ld [%r23], %r2
    brnz %r2, debug_wait4_225
    nop
    ba,a debug_startwait4_225
continue_debug_4_225:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_225:
    cmp %r13, %r15
    bne,a wait_for_stat_4_225
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_225:
    cmp %r14, %r15
    bne,a wait_for_debug_4_225
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 422: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196a  ! 423: FqTOd	dis not found

	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_4_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01962  ! 427: FqTOd	dis not found

mondo_4_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91400b  ! 428: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0xa7a10d31  ! 430: FsMULd	fsmuld	%f4, %f48, %f50
debug_4_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe030  ! 432: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 433: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01964  ! 434: FqTOd	dis not found

mondo_4_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d910001  ! 435: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_233)+8, 16, 16)) -> intp(4,1,3)
xir_4_233:
	.word 0xa9853734  ! 436: WR_SET_SOFTINT_I	wr	%r20, 0x1734, %set_softint
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 437: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_4_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d900003  ! 438: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
	.word 0x99902001  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x9a4d0006  ! 440: MULX_R	mulx 	%r20, %r6, %r13
tagged_4_235:
	taddcctv %r9, 0x1df8, %r12
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab84000b  ! 442: WR_CLEAR_SOFTINT_R	wr	%r16, %r11, %clear_softint
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_4_238:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_4_239:
	setx 0xc86714d874b43986, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_240:
	setx 0xf2186c8f845c8ba1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00170  ! 450: FABSq	dis not found

	.word 0x91480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_cmpr_4_241:
	setx 0xc6cf902b43470e27, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902007  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_4_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 454: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d255b  ! 455: SDIVX_I	sdivx	%r20, 0x055b, %r13
splash_hpstate_4_244:
	.word 0x81982896  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
debug_4_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 458: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_4_247:
	setx 0x62b3fcefeffa2c7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d903e9a  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x1e9a, %pstate
tagged_4_248:
	tsubcctv %r16, 0x1dfc, %r14
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d903848  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x1848, %pstate
tagged_4_249:
	taddcctv %r26, 0x1bc6, %r24
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x879021a3  ! 465: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
splash_hpstate_4_250:
	.word 0x819822ce  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0xa2f88012  ! 467: SDIVcc_R	sdivcc 	%r2, %r18, %r17
	.word 0x93d020b2  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x879020bb  ! 469: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	setx 0x7e2f9b094f6a3f3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9025fa  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x05fa, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_4_252:
	.word 0x8198255c  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
DS_4_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_4_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x879020d3  ! 478: WRPR_TT_I	wrpr	%r0, 0x00d3, %tt
mondo_4_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d910008  ! 479: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0x8d902705  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x0705, %pstate
	.word 0x8d9023bb  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x03bb, %pstate
intveclr_4_257:
	setx 0x4c5e7d60c3903955, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90206d  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x006d, %pstate
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
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 484: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x9ba409c1  ! 485: FDIVd	fdivd	%f16, %f32, %f44
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_4_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0800ba0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r16
	.word 0x99902002  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87902361  ! 491: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
donret_4_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_260-donret_4_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_4_261:
	setx 0x307c8acfe91797c2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_262) + 48, 16, 16)) -> intp(7,0,31)
intvec_4_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 495: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_4_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0800aa0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_264) + 8, 16, 16)) -> intp(4,0,27)
intvec_4_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xa1902003  ! 1: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200e  ! 2: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_3_0:
	setx 0x4f9eda28c020bf6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_1:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 5: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9745c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_3_2:
	tsubcctv %r6, 0x1897, %r11
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_3_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d93400d  ! 9: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
change_to_randtl_3_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_4:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 11: RDPC	rd	%pc, %r19
splash_lsu_3_6:
	setx 0xfa75ba1549647531, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_3_7:
	set 0x60540000, %r31
	.word 0x85827144  ! 14: WRCCR_I	wr	%r9, 0x1144, %ccr
	.word 0x99902005  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_8) + 16, 16, 16)) -> intp(0,0,15)
intvec_3_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_3_9:
	taddcctv %r25, 0x15ad, %r13
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_3_10:
	setx 0x04f44c5c1700fd69, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_3_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a449c0  ! 1: FDIVd	fdivd	%f48, %f0, %f42
	.word 0xe3108009  ! 1: LDQF_R	-	[%r2, %r9], %f17
	.word 0x9ba00831  ! 21: FADDs	fadds	%f0, %f17, %f13
DS_3_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_3_13:
	.word 0x81982345  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0345, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91953d37  ! 26: WRPR_PIL_I	wrpr	%r20, 0x1d37, %pil
splash_cmpr_3_15:
	setx 0x08767664421a5f25, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879020fb  ! 28: WRPR_TT_I	wrpr	%r0, 0x00fb, %tt
tagged_3_16:
	tsubcctv %r10, 0x183c, %r17
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_3_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_18:
	setx 0x1d51dc4f33a15b97, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_3_19:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802088  ! 34: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0xa5414000  ! 36: RDPC	rd	%pc, %r18
mondo_3_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d918004  ! 37: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
tagged_3_22:
	tsubcctv %r4, 0x177c, %r8
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0x9ba049cc  ! 39: FDIVd	fdivd	%f32, %f12, %f44
DS_3_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5120011  ! 1: LDQF_R	-	[%r8, %r17], %f10
	.word 0x99a0482b  ! 40: FADDs	fadds	%f1, %f11, %f12
splash_tba_3_24:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_3_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d9037bc  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x17bc, %pstate
	.word 0x87902113  ! 45: WRPR_TT_I	wrpr	%r0, 0x0113, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802088  ! 47: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99902004  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
pmu_3_27:
	nop
	setx 0xfffff52ffffffc86, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_3_28:
	set 0x60540000, %r31
	.word 0x8584e8e9  ! 50: WRCCR_I	wr	%r19, 0x08e9, %ccr
change_to_randtl_3_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_29:
	.word 0x8f902000  ! 51: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab84c004  ! 52: WR_CLEAR_SOFTINT_R	wr	%r19, %r4, %clear_softint
debug_3_30:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 53: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802016  ! 55: WRASI_I	wr	%r0, 0x0016, %asi
mondo_3_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d918014  ! 56: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
debug_3_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_33:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_34:
	setx 0x55a784bddf835edd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94c005  ! 60: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d00e80  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r17
mondo_3_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90c013  ! 63: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_tba_3_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_39:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 65: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe297e030  ! 66: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
splash_hpstate_3_40:
	.word 0x8198224d  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024d, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x904cc00c  ! 69: MULX_R	mulx 	%r19, %r12, %r8
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x87902226  ! 71: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902007  ! 73: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_3_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_42:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 77: RDPC	rd	%pc, %r11
	.word 0xd68fe020  ! 78: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r11
	.word 0x9f802f57  ! 79: SIR	sir	0x0f57
	.word 0x8d9038ec  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x18ec, %pstate
DS_3_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_3_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_44-donret_3_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902002  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd6cfe000  ! 84: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0xa1902004  ! 85: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	rd %pc, %r19
	add %r19, (ivw_3_45-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_45:
	.word 0x91914006  ! 86: WRPR_PIL_R	wrpr	%r5, %r6, %pil
DS_3_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a489c9  ! 1: FDIVd	fdivd	%f18, %f40, %f48
	normalw
	.word 0xa7458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r19
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_3_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 90: WRPR_GL_I	wrpr	%r0, 0x0008, %-
memptr_3_48:
	set user_data_start, %r31
	.word 0x8584391c  ! 91: WRCCR_I	wr	%r16, 0x191c, %ccr
	.word 0x91a01a67  ! 92: FqTOi	fqtoi	
	.word 0xa7a04d20  ! 93: FsMULd	fsmuld	%f1, %f0, %f50
	rd %pc, %r19
	add %r19, (ivw_3_49-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_49:
	.word 0x91940004  ! 94: WRPR_PIL_R	wrpr	%r16, %r4, %pil
splash_cmpr_3_50:
	setx 0x2eb96a713cf9ac03, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_51:
	taddcctv %r1, 0x1b5d, %r17
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_3_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879020fd  ! 98: WRPR_TT_I	wrpr	%r0, 0x00fd, %tt
DS_3_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f24, %f20, %f24
	.word 0xa5b4c30d  ! 99: ALIGNADDRESS	alignaddr	%r19, %r13, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_54) + 40, 16, 16)) -> intp(4,0,23)
intvec_3_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xa1498bacc2ef66cd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0xa1454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe08804a0  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_tba_3_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f8025e4  ! 109: SIR	sir	0x05e4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c69ed  ! 110: SDIVX_I	sdivx	%r17, 0x09ed, %r10
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_3_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9150c000  ! 114: RDPR_TT	rdpr	%tt, %r8
debug_3_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_60) + 16, 16, 16)) -> intp(0,0,9)
intvec_3_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa4c27aa8  ! 118: ADDCcc_I	addccc 	%r9, 0xfffffaa8, %r18
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0xa5a00165  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902000  ! 122: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa0840005  ! 123: ADDcc_R	addcc 	%r16, %r5, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 124: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b2731  ! 125: SDIVX_I	sdivx	%r12, 0x0731, %r10
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0xa3500000  ! 127: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x91450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xa1902009  ! 129: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_randtl_3_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_63:
	.word 0x8f902003  ! 130: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_64) + 40, 16, 16)) -> intp(5,0,30)
intvec_3_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_65:
	setx 0x9fafb4b44dd51130, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x87902191  ! 135: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	setx 0xef1c38934048c215, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_3_68:
	setx 0x989ced4ff75e85f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_69:
	setx 0x22701b6d56f9a21e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_70:
	setx 0x83f1f3d3a4e78731, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x87902041  ! 142: WRPR_TT_I	wrpr	%r0, 0x0041, %tt
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 143: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_3_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_3_72:
	setx 0xb46f88333f2b2f27, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_3_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a409cc  ! 1: FDIVd	fdivd	%f16, %f12, %f20
	.word 0xa5a00546  ! 1: FSQRTd	fsqrt	
	.word 0x99a30832  ! 149: FADDs	fadds	%f12, %f18, %f12
	.word 0x87802080  ! 150: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_3_74:
	tsubcctv %r9, 0x1cc4, %r16
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d02032  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_3_75:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe030  ! 157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
splash_tba_3_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_3_78:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_79:
	setx 0x27f6204ed42eed01, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 161: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe8800c00  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
	rd %pc, %r19
	add %r19, (ivw_3_80-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_80:
	.word 0x91944012  ! 163: WRPR_PIL_R	wrpr	%r17, %r18, %pil
memptr_3_81:
	set user_data_start, %r31
	.word 0x85843dc7  ! 164: WRCCR_I	wr	%r16, 0x1dc7, %ccr
DS_3_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe8d7e020  ! 166: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d902403  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902002  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x6127d07023fff429, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902525  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0525, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_3_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_84:
	.word 0x8f902002  ! 175: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01970  ! 176: FqTOd	dis not found

	.word 0x9b464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_3_86:
	setx 0xb5fc11950d37bdcc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_87:
	setx 0x4cac8d4caf364dcf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_88:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_3_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_3_91:
	nop
	setx 0xfffff493fffff339, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d804a0  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_3_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 190: RDPC	rd	%pc, %r17
memptr_3_94:
	set 0x60540000, %r31
	.word 0x85807e19  ! 191: WRCCR_I	wr	%r1, 0x1e19, %ccr
	.word 0x879023d6  ! 192: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
splash_lsu_3_95:
	setx 0x107b9d35cd4cb2d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_3_96:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_3_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_3_98:
	tsubcctv %r11, 0x1061, %r20
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_99:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 198: RDPC	rd	%pc, %r11
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_3_100:
	setx 0xca120739478d60f4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d004a0  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_cmpr_3_101:
	setx 0xe9dd127f8e93cd5e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_3_102:
	setx 0xe96969ccbb9d5e43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d90c00a  ! 205: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d02033  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_3_105:
	setx 0x4e83db5bbe240af7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_3_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d914005  ! 209: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
mondo_3_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d944008  ! 210: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0x93902007  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_3_108:
	.word 0x81982a45  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
debug_3_109:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3313174  ! 1: STQF_I	-	%f9, [0x1174, %r4]
	normalw
	.word 0x97458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r11
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_3_112-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_112:
	.word 0x91940007  ! 218: WRPR_PIL_R	wrpr	%r16, %r7, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95b00fe1  ! 220: FONES	e	%f10
DS_3_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_3_114:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad00e60  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r13
	.word 0xa1902004  ! 224: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902007  ! 225: WRPR_GL_I	wrpr	%r0, 0x0007, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_3_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
mondo_3_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d908008  ! 228: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0xa190200e  ! 229: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa9520000  ! 230: RDPR_PIL	<illegal instruction>
debug_3_118:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 232: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_3_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92000c  ! 233: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
intveclr_3_120:
	setx 0x40193719badb5f5c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c40  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6ca580  ! 236: SDIVX_I	sdivx	%r18, 0x0580, %r13
	.word 0x93b28fe2  ! 237: FONES	e	%f9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c7e6a  ! 238: SDIVX_I	sdivx	%r17, 0xfffffe6a, %r16
intveclr_3_123:
	setx 0x46348569defe7e58, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_3_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93d020b5  ! 241: Tcc_I	tne	icc_or_xcc, %r0 + 181
mondo_3_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d914014  ! 242: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0x93540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_3_126:
	setx 0xd108d164950d9321, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_127:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_3_128:
	setx 0x1a05316a119a6bd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802089  ! 248: WRASI_I	wr	%r0, 0x0089, %asi
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x97540000  ! 250: RDPR_GL	rdpr	%-, %r11
	.word 0xd8800c40  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
splash_cmpr_3_130:
	setx 0x7564bc1ba8b2c579, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_131:
	setx 0x1c8160f9552ff375, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_132:
	setx 0xde20c2b518f93f13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	setx 0x5817c1b0341895fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 257: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd88fe010  ! 258: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01969  ! 259: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c30c0  ! 260: SDIVX_I	sdivx	%r16, 0xfffff0c0, %r9
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_136:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a00167  ! 263: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91687e8b  ! 264: SDIVX_I	sdivx	%r1, 0xfffffe8b, %r8
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_3_138:
	nop
	setx 0xffffff66fffffbe5, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_3_139:
	taddcctv %r20, 0x1460, %r18
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_3_140:
	tsubcctv %r2, 0x1132, %r15
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_3_141:
	taddcctv %r21, 0x1c1b, %r11
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_3_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x93a00166  ! 271: FABSq	dis not found

mondo_3_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 272: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_3_144:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 274: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
intveclr_3_145:
	setx 0xaecab5627cae9631, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_3_146:
	setx 0xd952e7db5286070f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_3_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_147:
	.word 0x8f902003  ! 278: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_3_148:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_3_149:
	.word 0x8198200d  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0xda8804a0  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
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
	.word 0xa5414000  ! 282: RDPC	rd	%pc, %r18
	.word 0x93902003  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x99902003  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_3_151:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_3_152:
	tsubcctv %r3, 0x15a9, %r5
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c804a0  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_3_153:
	taddcctv %r24, 0x1966, %r11
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f803822  ! 291: SIR	sir	0x1822
	.word 0x9b464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9369f936  ! 293: SDIVX_I	sdivx	%r7, 0xfffff936, %r9
donret_3_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_155-donret_3_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_3_156:
	setx 0x1bf9823d9299f757, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02034  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_randtl_3_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_157:
	.word 0x8f902002  ! 298: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902001  ! 299: WRPR_GL_I	wrpr	%r0, 0x0001, %-
mondo_3_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 300: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa1902006  ! 302: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_3_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_159:
	.word 0x8f902001  ! 305: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd0dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0x91d020b4  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c6030  ! 308: SDIVX_I	sdivx	%r17, 0x0030, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196a  ! 309: FqTOd	dis not found

	.word 0x87902238  ! 310: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
mondo_3_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 311: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
tagged_3_163:
	taddcctv %r11, 0x1207, %r10
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902005  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_164) + 48, 16, 16)) -> intp(6,0,15)
intvec_3_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_165:
	setx 0x69e740186ed23cee, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 317: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_166)+16, 16, 16)) -> intp(3,1,3)
xir_3_166:
	.word 0xa98525c2  ! 318: WR_SET_SOFTINT_I	wr	%r20, 0x05c2, %set_softint
	setx 0x1e3e9f9e43d5a8ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_168:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_3_169:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_3_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_3_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_171:
	.word 0x8f902002  ! 323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_hpstate_3_172:
	.word 0x8198280f  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x87902069  ! 326: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
	.word 0xa190200f  ! 327: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_3_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 329: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0x87802058  ! 330: WRASI_I	wr	%r0, 0x0058, %asi
donret_3_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_174-donret_3_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_174:
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_3_175:
	set 0x60140000, %r31
	.word 0x8582f738  ! 332: WRCCR_I	wr	%r11, 0x1738, %ccr
mondo_3_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d91000b  ! 333: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x93902006  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_3_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd731c010  ! 1: STQF_R	-	%f11, [%r16, %r7]
	normalw
	.word 0x99458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r12
intveclr_3_178:
	setx 0xf8003259ceae40c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b2  ! 337: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01968  ! 338: FqTOd	dis not found

	.word 0x96c4fb4b  ! 339: ADDCcc_I	addccc 	%r19, 0xfffffb4b, %r11
	rd %pc, %r19
	add %r19, (ivw_3_180-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_180:
	.word 0x91910012  ! 340: WRPR_PIL_R	wrpr	%r4, %r18, %pil
splash_cmpr_3_181:
	setx 0xd4f80fe73568ce7c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f24, %f22
	.word 0x97b2c309  ! 342: ALIGNADDRESS	alignaddr	%r11, %r9, %r11
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_3_184:
	tsubcctv %r8, 0x12fa, %r2
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 345: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_186)+40, 16, 16)) -> intp(3,1,3)
xir_3_186:
	.word 0xa980ed81  ! 346: WR_SET_SOFTINT_I	wr	%r3, 0x0d81, %set_softint
memptr_3_187:
	set 0x60740000, %r31
	.word 0x8584a012  ! 347: WRCCR_I	wr	%r18, 0x0012, %ccr
	.word 0x879020c0  ! 348: WRPR_TT_I	wrpr	%r0, 0x00c0, %tt
mondo_3_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94000d  ! 349: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0xa190200c  ! 350: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802089  ! 351: WRASI_I	wr	%r0, 0x0089, %asi
mondo_3_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 352: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x91932399  ! 354: WRPR_PIL_I	wrpr	%r12, 0x0399, %pil
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
	.word 0xa1414000  ! 355: RDPC	rd	%pc, %r16
memptr_3_192:
	set user_data_start, %r31
	.word 0x85843c48  ! 356: WRCCR_I	wr	%r16, 0x1c48, %ccr
	setx 0x2e0b31d9450ce1c8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902363  ! 358: WRPR_TT_I	wrpr	%r0, 0x0363, %tt
splash_tba_3_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 361: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_3_195:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 362: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_196) + 48, 16, 16)) -> intp(1,0,9)
intvec_3_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 364: WRASI_I	wr	%r0, 0x0080, %asi
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90328a  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x128a, %pstate
	.word 0xa150c000  ! 367: RDPR_TT	<illegal instruction>
splash_cmpr_3_197:
	setx 0x8ed442eb0bac5d22, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_3_198:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_199:
	setx 0x5cb952cb35fc7763, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_3_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_200:
	.word 0x8f902002  ! 372: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_3_201:
	setx 0x615d6a879c6d0bc3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_3_202:
	set 0x60140000, %r31
	.word 0x8584bdd0  ! 374: WRCCR_I	wr	%r18, 0x1dd0, %ccr
mondo_3_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d91c006  ! 375: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
	.word 0xd8c7e030  ! 376: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x83d02034  ! 377: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x976c4005  ! 378: SDIVX_R	sdivx	%r17, %r5, %r11
splash_tba_3_204:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f18, %f8
	.word 0xa3b28311  ! 380: ALIGNADDRESS	alignaddr	%r10, %r17, %r17
	.word 0x8790215d  ! 381: WRPR_TT_I	wrpr	%r0, 0x015d, %tt
splash_cmpr_3_206:
	setx 0x82a49ee6e0d3a79e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_3_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 384: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xa7a0016d  ! 385: FABSq	dis not found

intveclr_3_208:
	setx 0x609965889de8a7e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d914011  ! 387: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0xa982c00c  ! 388: WR_SET_SOFTINT_R	wr	%r11, %r12, %set_softint
	.word 0x97a009c1  ! 389: FDIVd	fdivd	%f0, %f32, %f42
	.word 0x9f802c5d  ! 390: SIR	sir	0x0c5d
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_3_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_210:
	.word 0x8f902002  ! 392: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_3_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f4, %f16
	.word 0x97b48313  ! 393: ALIGNADDRESS	alignaddr	%r18, %r19, %r11
splash_cmpr_3_212:
	setx 0x6dec4ecd6c91e450, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_213:
	.word 0x81982ffc  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ffc, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_3_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d930004  ! 397: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_3_215:
	setx 0x64d73a7155b875c5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a0016a  ! 400: FABSq	dis not found

splash_hpstate_3_216:
	.word 0x81982135  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0135, %hpstate
	.word 0x9b480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_217:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 403: RDPC	rd	%pc, %r10
	.word 0x91d02035  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_3_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 405: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
mondo_3_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d90000a  ! 406: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0x93902001  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
donret_3_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_220-donret_3_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_220:
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802080  ! 409: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f803dc0  ! 410: SIR	sir	0x1dc0
	.word 0x997033d1  ! 411: POPC_I	popc	0x13d1, %r12
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_3_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d91000c  ! 413: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	.word 0x83d020b4  ! 414: Tcc_I	te	icc_or_xcc, %r0 + 180
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d90351f  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x151f, %pstate
mondo_3_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948002  ! 417: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xa190200f  ! 418: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x9b414000  ! 420: RDPC	rd	%pc, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_3_225:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 422: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01960  ! 423: FqTOd	dis not found

	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 424: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_3_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01967  ! 427: FqTOd	dis not found

mondo_3_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d924010  ! 428: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0xa3a50d21  ! 430: FsMULd	fsmuld	%f20, %f32, %f48
debug_3_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe000  ! 432: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01971  ! 434: FqTOd	dis not found

mondo_3_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d910001  ! 435: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_233)+32, 16, 16)) -> intp(3,1,3)
xir_3_233:
	.word 0xa984231f  ! 436: WR_SET_SOFTINT_I	wr	%r16, 0x031f, %set_softint
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 437: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_3_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940000  ! 438: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	.word 0x99902000  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x964c8006  ! 440: MULX_R	mulx 	%r18, %r6, %r11
tagged_3_235:
	taddcctv %r21, 0x1a78, %r11
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab84400d  ! 442: WR_CLEAR_SOFTINT_R	wr	%r17, %r13, %clear_softint
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_3_238:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa3500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_3_239:
	setx 0x167ae3c127dca1de, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_240:
	setx 0x3bc60fb03b270366, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00168  ! 450: FABSq	dis not found

	.word 0x91480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
splash_cmpr_3_241:
	setx 0xf846f20f6a86fd7e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_3_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d918009  ! 454: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a717e  ! 455: SDIVX_I	sdivx	%r9, 0xfffff17e, %r10
splash_hpstate_3_244:
	.word 0x8198299e  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
debug_3_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_246:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 458: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_3_247:
	setx 0x4348c0de23c3580d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d903f3e  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x1f3e, %pstate
tagged_3_248:
	tsubcctv %r25, 0x137e, %r16
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d9033d9  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x13d9, %pstate
tagged_3_249:
	taddcctv %r3, 0x1de1, %r22
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x87902257  ! 465: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
splash_hpstate_3_250:
	.word 0x81982317  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
	.word 0x90f88000  ! 467: SDIVcc_R	sdivcc 	%r2, %r0, %r8
	.word 0x83d020b2  ! 468: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x879022b9  ! 469: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	setx 0xcf81e815983d0e45, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903172  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x1172, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_3_252:
	.word 0x81982aed  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aed, %hpstate
DS_3_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_3_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x87902029  ! 478: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
mondo_3_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 479: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0x8d902353  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x0353, %pstate
	.word 0x8d902f86  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0f86, %pstate
intveclr_3_257:
	setx 0xc80b9b4afab0cade, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903bf5  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x1bf5, %pstate
debug_3_258:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 484: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x91a089c0  ! 485: FDIVd	fdivd	%f2, %f0, %f8
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_3_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe08008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x99902003  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x879022a4  ! 491: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
donret_3_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_260-donret_3_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_3_261:
	setx 0x4d536c1b0dc7fba9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_262) + 8, 16, 16)) -> intp(5,0,0)
intvec_3_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 495: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_3_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0800b80  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_264) + 0, 16, 16)) -> intp(5,0,0)
intvec_3_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xa190200d  ! 1: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902009  ! 2: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_2_0:
	setx 0x0314f992035e3553, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_1:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 5: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9145c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r8
tagged_2_2:
	tsubcctv %r14, 0x106b, %r11
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_2_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944013  ! 9: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
change_to_randtl_2_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_4:
	.word 0x8f902002  ! 10: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_5:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 11: RDPC	rd	%pc, %r12
splash_lsu_2_6:
	setx 0x8e8861dc5b2288e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_2_7:
	set 0x60740000, %r31
	.word 0x858236e4  ! 14: WRCCR_I	wr	%r8, 0x16e4, %ccr
	.word 0x99902005  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_8) + 32, 16, 16)) -> intp(5,0,5)
intvec_2_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 17: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_2_9:
	taddcctv %r13, 0x171a, %r1
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_2_10:
	setx 0x961df7d894b5d015, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_2_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba289d1  ! 1: FDIVd	fdivd	%f10, %f48, %f44
	.word 0xd7134001  ! 1: LDQF_R	-	[%r13, %r1], %f11
	.word 0x99a28825  ! 21: FADDs	fadds	%f10, %f5, %f12
DS_2_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_2_13:
	.word 0x81982a84  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01963  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91947a4a  ! 26: WRPR_PIL_I	wrpr	%r17, 0x1a4a, %pil
splash_cmpr_2_15:
	setx 0xbc006ade4184f822, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021e0  ! 28: WRPR_TT_I	wrpr	%r0, 0x01e0, %tt
tagged_2_16:
	tsubcctv %r13, 0x154c, %r20
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_2_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_18:
	setx 0xa9ed414eb5a4081d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_2_19:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802016  ! 34: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0xa1414000  ! 36: RDPC	rd	%pc, %r16
mondo_2_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d934013  ! 37: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
tagged_2_22:
	tsubcctv %r22, 0x135d, %r14
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0xa5a409c0  ! 39: FDIVd	fdivd	%f16, %f0, %f18
DS_2_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7100002  ! 1: LDQF_R	-	[%r0, %r2], %f19
	.word 0x95a20832  ! 40: FADDs	fadds	%f8, %f18, %f10
splash_tba_2_24:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_2_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d902c5b  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x0c5b, %pstate
	.word 0x879021bb  ! 45: WRPR_TT_I	wrpr	%r0, 0x01bb, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802055  ! 47: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x99902003  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
pmu_2_27:
	nop
	setx 0xfffff4ecfffff63f, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_2_28:
	set 0x60140000, %r31
	.word 0x85847c02  ! 50: WRCCR_I	wr	%r17, 0x1c02, %ccr
change_to_randtl_2_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_29:
	.word 0x8f902002  ! 51: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xab80c003  ! 52: WR_CLEAR_SOFTINT_R	wr	%r3, %r3, %clear_softint
debug_2_30:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 53: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802016  ! 55: WRASI_I	wr	%r0, 0x0016, %asi
mondo_2_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d908001  ! 56: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
debug_2_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_33:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_34:
	setx 0xe2550bbd8e860b73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d900005  ! 60: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
mondo_2_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d910002  ! 63: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
splash_tba_2_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_39:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 65: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe297e010  ! 66: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
splash_hpstate_2_40:
	.word 0x819821cf  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0xa6494000  ! 69: MULX_R	mulx 	%r5, %r0, %r19
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x8790235b  ! 71: WRPR_TT_I	wrpr	%r0, 0x035b, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902007  ! 73: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_2_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_42:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 77: RDPC	rd	%pc, %r10
	.word 0xd68fe020  ! 78: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r11
	.word 0x9f803764  ! 79: SIR	sir	0x1764
	.word 0x8d903eb3  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x1eb3, %pstate
DS_2_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_2_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_44-donret_2_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902001  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd6cfe010  ! 84: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xa1902003  ! 85: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	rd %pc, %r19
	add %r19, (ivw_2_45-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_45:
	.word 0x91928003  ! 86: WRPR_PIL_R	wrpr	%r10, %r3, %pil
DS_2_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f42
	normalw
	.word 0x95458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r10
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902006  ! 90: WRPR_GL_I	wrpr	%r0, 0x0006, %-
memptr_2_48:
	set user_data_start, %r31
	.word 0x85802b5f  ! 91: WRCCR_I	wr	%r0, 0x0b5f, %ccr
	.word 0x95a01a74  ! 92: FqTOi	fqtoi	
	.word 0xa9a40d2a  ! 93: FsMULd	fsmuld	%f16, %f10, %f20
	rd %pc, %r19
	add %r19, (ivw_2_49-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_49:
	.word 0x91900012  ! 94: WRPR_PIL_R	wrpr	%r0, %r18, %pil
splash_cmpr_2_50:
	setx 0x78b36be0c989eb3b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_51:
	taddcctv %r4, 0x1fd3, %r17
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_2_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790229a  ! 98: WRPR_TT_I	wrpr	%r0, 0x029a, %tt
DS_2_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f20, %f6
	.word 0xa9b4c302  ! 99: ALIGNADDRESS	alignaddr	%r19, %r2, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_54) + 16, 16, 16)) -> intp(0,0,20)
intvec_2_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xc36dd260b6967abc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0xa3454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xe08804a0  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_tba_2_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f8035af  ! 109: SIR	sir	0x15af
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b77d1  ! 110: SDIVX_I	sdivx	%r13, 0xfffff7d1, %r8
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_2_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9350c000  ! 114: RDPR_TT	rdpr	%tt, %r9
debug_2_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_60) + 56, 16, 16)) -> intp(3,0,3)
intvec_2_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x94c063db  ! 118: ADDCcc_I	addccc 	%r1, 0x03db, %r10
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x97a00161  ! 120: FABSq	dis not found

	.word 0xd4800c20  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r10
	.word 0xa1902007  ! 122: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9481c001  ! 123: ADDcc_R	addcc 	%r7, %r1, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a0196b  ! 124: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996ae9e3  ! 125: SDIVX_I	sdivx	%r11, 0x09e3, %r12
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0xa5500000  ! 127: RDPR_TPC	<illegal instruction>
	.word 0x91450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xa190200e  ! 129: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_2_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_63:
	.word 0x8f902000  ! 130: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_64) + 56, 16, 16)) -> intp(0,0,0)
intvec_2_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_65:
	setx 0x16c6a08fe610c7ee, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x879020ae  ! 135: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	setx 0x485b71abb03b4e23, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_2_68:
	setx 0xdd8672bfb76da9f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_69:
	setx 0xbde2305c06791701, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_70:
	setx 0x5d7f997ddcdb1772, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x87902335  ! 142: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 143: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_2_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_2_72:
	setx 0x33746fdd65429279, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_2_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba009c0  ! 1: FDIVd	fdivd	%f0, %f0, %f44
	.word 0xa1a00544  ! 1: FSQRTd	fsqrt	
	.word 0x93a0c82b  ! 149: FADDs	fadds	%f3, %f11, %f9
	.word 0x87802010  ! 150: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_2_74:
	tsubcctv %r11, 0x19b6, %r3
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x83d020b3  ! 153: Tcc_I	te	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_2_75:
	set 0x003e0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe000  ! 157: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
splash_tba_2_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_2_78:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_79:
	setx 0x300777a50509ece5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 161: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe8800a80  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r20
	rd %pc, %r19
	add %r19, (ivw_2_80-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_80:
	.word 0x91908008  ! 163: WRPR_PIL_R	wrpr	%r2, %r8, %pil
memptr_2_81:
	set user_data_start, %r31
	.word 0x8581f65d  ! 164: WRCCR_I	wr	%r7, 0x165d, %ccr
DS_2_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe8d7e020  ! 166: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d903f2e  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x1f2e, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902007  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x691c506beb14bd78, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903fef  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1fef, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_2_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_84:
	.word 0x8f902000  ! 175: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 176: FqTOd	dis not found

	.word 0x97464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x83d020b2  ! 179: Tcc_I	te	icc_or_xcc, %r0 + 178
intveclr_2_86:
	setx 0x825e697f9a71ae2a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_87:
	setx 0x300a213f7ab7a7fa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_88:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_2_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_2_91:
	nop
	setx 0xfffff07dfffff123, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d804a0  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_2_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 190: RDPC	rd	%pc, %r20
memptr_2_94:
	set 0x60140000, %r31
	.word 0x85823be3  ! 191: WRCCR_I	wr	%r8, 0x1be3, %ccr
	.word 0x879020b2  ! 192: WRPR_TT_I	wrpr	%r0, 0x00b2, %tt
splash_lsu_2_95:
	setx 0x89717cdb28629953, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_2_96:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_2_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_2_98:
	tsubcctv %r8, 0x103a, %r8
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_99:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 198: RDPC	rd	%pc, %r12
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_2_100:
	setx 0xa8146ff9487ee4ff, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d004a0  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
splash_cmpr_2_101:
	setx 0x6a82fa49bb560a59, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_2_102:
	setx 0xde89902de664adef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d908002  ! 205: WRPR_WSTATE_R	wrpr	%r2, %r2, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d020b5  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_2_105:
	setx 0xed0d20db2c31a933, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d90c006  ! 209: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d930010  ! 210: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0x93902006  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_2_108:
	.word 0x81982936  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0936, %hpstate
debug_2_109:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe132b07c  ! 1: STQF_I	-	%f16, [0x107c, %r10]
	normalw
	.word 0xa7458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_2_112-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_112:
	.word 0x9191c005  ! 218: WRPR_PIL_R	wrpr	%r7, %r5, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa9b0cff2  ! 220: FONES	e	%f20
DS_2_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_2_114:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa190200f  ! 224: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902006  ! 225: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_2_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
mondo_2_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d914014  ! 228: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xa190200b  ! 229: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa3520000  ! 230: RDPR_PIL	<illegal instruction>
debug_2_118:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 232: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 233: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
intveclr_2_120:
	setx 0x287d656e1f9a1243, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916b341f  ! 236: SDIVX_I	sdivx	%r12, 0xfffff41f, %r8
	.word 0x9bb2cfe6  ! 237: FONES	e	%f13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76cb96c  ! 238: SDIVX_I	sdivx	%r18, 0xfffff96c, %r19
intveclr_2_123:
	setx 0xeafc604ef2125dc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91d02035  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_2_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d918014  ! 242: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x97540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_2_126:
	setx 0x3f70134db7b12273, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_127:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_2_128:
	setx 0xa21f4919ef1527c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802014  ! 248: WRASI_I	wr	%r0, 0x0014, %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9b540000  ! 250: RDPR_GL	rdpr	%-, %r13
	.word 0xd88008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_2_130:
	setx 0x283ae790c0078c75, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_131:
	setx 0x8f9f1f4a6f7fa684, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_132:
	setx 0xb1b5799071dd4c0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0x12eadeb43e24f4a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 257: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd88fe000  ! 258: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 259: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa569ed7a  ! 260: SDIVX_I	sdivx	%r7, 0x0d7a, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_136:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a00174  ! 263: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95693007  ! 264: SDIVX_I	sdivx	%r4, 0xfffff007, %r10
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_2_138:
	nop
	setx 0xfffff756fffffe70, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_139:
	taddcctv %r21, 0x1a62, %r26
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_2_140:
	tsubcctv %r23, 0x12c9, %r11
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_2_141:
	taddcctv %r21, 0x1618, %r19
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_2_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91a00162  ! 271: FABSq	dis not found

mondo_2_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d93000c  ! 272: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_2_144:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 274: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
intveclr_2_145:
	setx 0x5e7305e79b146be2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_2_146:
	setx 0xb1d6b8aa004c6612, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_2_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_147:
	.word 0x8f902002  ! 278: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_2_148:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_2_149:
	.word 0x81982155  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0155, %hpstate
	.word 0xda880e60  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
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
	.word 0x99414000  ! 282: RDPC	rd	%pc, %r12
	.word 0x93902005  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x99902002  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
debug_2_151:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_2_152:
	tsubcctv %r23, 0x14eb, %r20
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c80e60  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_2_153:
	taddcctv %r14, 0x1af2, %r22
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f8026ba  ! 291: SIR	sir	0x06ba
	.word 0x99464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c30e3  ! 293: SDIVX_I	sdivx	%r16, 0xfffff0e3, %r10
donret_2_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_155-donret_2_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_2_156:
	setx 0xdf8ad46d8cd33ed9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 179
change_to_randtl_2_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_157:
	.word 0x8f902000  ! 298: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902005  ! 299: WRPR_GL_I	wrpr	%r0, 0x0005, %-
mondo_2_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d92c013  ! 300: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa190200b  ! 302: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_2_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_159:
	.word 0x8f902003  ! 305: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0x91d02032  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569a4d6  ! 308: SDIVX_I	sdivx	%r6, 0x04d6, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 309: FqTOd	dis not found

	.word 0x8790233e  ! 310: WRPR_TT_I	wrpr	%r0, 0x033e, %tt
mondo_2_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 311: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
tagged_2_163:
	taddcctv %r9, 0x1449, %r19
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902002  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_164) + 48, 16, 16)) -> intp(4,0,22)
intvec_2_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_165:
	setx 0x44758410bdbc3adb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d020b3  ! 317: Tcc_I	tne	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_166)+8, 16, 16)) -> intp(2,1,3)
xir_2_166:
	.word 0xa98273f9  ! 318: WR_SET_SOFTINT_I	wr	%r9, 0x13f9, %set_softint
	setx 0xecaa028d2f4270dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_168:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_2_169:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_2_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_2_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_171:
	.word 0x8f902001  ! 323: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_2_172:
	.word 0x8198201e  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x879022e2  ! 326: WRPR_TT_I	wrpr	%r0, 0x02e2, %tt
	.word 0xa1902002  ! 327: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_2_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d920000  ! 329: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0x87802089  ! 330: WRASI_I	wr	%r0, 0x0089, %asi
donret_2_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_174-donret_2_174), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_174:
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_2_175:
	set 0x60540000, %r31
	.word 0x8581b38d  ! 332: WRCCR_I	wr	%r6, 0x138d, %ccr
mondo_2_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d928009  ! 333: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
	.word 0x93902003  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_2_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1350009  ! 1: STQF_R	-	%f8, [%r9, %r20]
	normalw
	.word 0xa5458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r18
intveclr_2_178:
	setx 0xf843bb4e53046283, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01973  ! 338: FqTOd	dis not found

	.word 0xa8c4f603  ! 339: ADDCcc_I	addccc 	%r19, 0xfffff603, %r20
	rd %pc, %r19
	add %r19, (ivw_2_180-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_180:
	.word 0x91900004  ! 340: WRPR_PIL_R	wrpr	%r0, %r4, %pil
splash_cmpr_2_181:
	setx 0x1ae666983a0b50e4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f18, %f10
	.word 0xa7b08302  ! 342: ALIGNADDRESS	alignaddr	%r2, %r2, %r19
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_2_184:
	tsubcctv %r20, 0x1429, %r19
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_185:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 345: RDPC	rd	%pc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_186)+48, 16, 16)) -> intp(2,1,3)
xir_2_186:
	.word 0xa9843ab2  ! 346: WR_SET_SOFTINT_I	wr	%r16, 0x1ab2, %set_softint
memptr_2_187:
	set 0x60340000, %r31
	.word 0x8581eb39  ! 347: WRCCR_I	wr	%r7, 0x0b39, %ccr
	.word 0x879022c7  ! 348: WRPR_TT_I	wrpr	%r0, 0x02c7, %tt
mondo_2_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d944002  ! 349: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xa190200c  ! 350: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802004  ! 351: WRASI_I	wr	%r0, 0x0004, %asi
mondo_2_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944008  ! 352: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x91927baa  ! 354: WRPR_PIL_I	wrpr	%r9, 0x1baa, %pil
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
	.word 0x99414000  ! 355: RDPC	rd	%pc, %r12
memptr_2_192:
	set user_data_start, %r31
	.word 0x85802d15  ! 356: WRCCR_I	wr	%r0, 0x0d15, %ccr
	setx 0x9b5b6b39fd326407, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902155  ! 358: WRPR_TT_I	wrpr	%r0, 0x0155, %tt
splash_tba_2_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 361: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_2_195:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 362: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_196) + 24, 16, 16)) -> intp(6,0,23)
intvec_2_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 364: WRASI_I	wr	%r0, 0x0020, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903d0a  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x1d0a, %pstate
	.word 0x9550c000  ! 367: RDPR_TT	<illegal instruction>
splash_cmpr_2_197:
	setx 0x6b0163bf9369f59c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_2_198:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_199:
	setx 0x69fcaa6eb6235ecd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_2_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_200:
	.word 0x8f902002  ! 372: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_2_201:
	setx 0x4fa04a4195dfd269, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_202:
	set 0x60740000, %r31
	.word 0x8582ea00  ! 374: WRCCR_I	wr	%r11, 0x0a00, %ccr
mondo_2_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d92c005  ! 375: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
	.word 0xd8c7e010  ! 376: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x91d020b4  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x996c4013  ! 378: SDIVX_R	sdivx	%r17, %r19, %r12
splash_tba_2_204:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f6, %f12
	.word 0x97b3430a  ! 380: ALIGNADDRESS	alignaddr	%r13, %r10, %r11
	.word 0x87902349  ! 381: WRPR_TT_I	wrpr	%r0, 0x0349, %tt
splash_cmpr_2_206:
	setx 0x6925518f810ee85f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_2_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940002  ! 384: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0x99a0016a  ! 385: FABSq	dis not found

intveclr_2_208:
	setx 0x510008e9eaf3f90a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900006  ! 387: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
	.word 0xa9824010  ! 388: WR_SET_SOFTINT_R	wr	%r9, %r16, %set_softint
	.word 0x97a1c9c2  ! 389: FDIVd	fdivd	%f38, %f2, %f42
	.word 0x9f803505  ! 390: SIR	sir	0x1505
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_2_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_210:
	.word 0x8f902000  ! 392: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_2_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f12, %f22
	.word 0x91b14312  ! 393: ALIGNADDRESS	alignaddr	%r5, %r18, %r8
splash_cmpr_2_212:
	setx 0x141d9189ecf675e3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_213:
	.word 0x8198243e  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x043e, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_2_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c011  ! 397: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_215:
	setx 0xd0af010403d0bc4d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a00164  ! 400: FABSq	dis not found

splash_hpstate_2_216:
	.word 0x819826b7  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06b7, %hpstate
	.word 0xa3480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_217:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 403: RDPC	rd	%pc, %r12
	.word 0x91d02033  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_2_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d900011  ! 405: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
mondo_2_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d908013  ! 406: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0x93902001  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
donret_2_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_220-donret_2_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_220:
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802055  ! 409: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f8030d3  ! 410: SIR	sir	0x10d3
	.word 0x95702c57  ! 411: POPC_I	popc	0x0c57, %r10
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_2_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d944001  ! 413: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x93d02034  ! 414: Tcc_I	tne	icc_or_xcc, %r0 + 52
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d902075  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0075, %pstate
mondo_2_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c003  ! 417: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	.word 0xa190200b  ! 418: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0xa3414000  ! 420: RDPC	rd	%pc, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_2_225:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 422: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196d  ! 423: FqTOd	dis not found

	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_2_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01960  ! 427: FqTOd	dis not found

mondo_2_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d928005  ! 428: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0x9ba18d2b  ! 430: FsMULd	fsmuld	%f6, %f42, %f44
debug_2_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe030  ! 432: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01971  ! 434: FqTOd	dis not found

mondo_2_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 435: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_233)+8, 16, 16)) -> intp(2,1,3)
xir_2_233:
	.word 0xa9807067  ! 436: WR_SET_SOFTINT_I	wr	%r1, 0x1067, %set_softint
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 437: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_2_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d900013  ! 438: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0x99902003  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x984cc010  ! 440: MULX_R	mulx 	%r19, %r16, %r12
tagged_2_235:
	taddcctv %r16, 0x1539, %r9
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab850002  ! 442: WR_CLEAR_SOFTINT_R	wr	%r20, %r2, %clear_softint
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_2_238:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa7500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_2_239:
	setx 0xad2a6a78b05fc358, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 448: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_2_240:
	setx 0x3774975a418f30a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00162  ! 450: FABSq	dis not found

	.word 0x93480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_2_241:
	setx 0x0de063a85c4d2fd9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_2_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 454: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b6789  ! 455: SDIVX_I	sdivx	%r13, 0x0789, %r13
splash_hpstate_2_244:
	.word 0x81982b87  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b87, %hpstate
debug_2_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_246:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 458: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
splash_lsu_2_247:
	setx 0xf7bf9dcd32cb1953, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd0800c80  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0x8d903f8b  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x1f8b, %pstate
tagged_2_248:
	tsubcctv %r19, 0x1d6e, %r19
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d9028a5  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x08a5, %pstate
tagged_2_249:
	taddcctv %r25, 0x1421, %r5
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x879022ed  ! 465: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
splash_hpstate_2_250:
	.word 0x81982255  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0255, %hpstate
	.word 0x9afc8003  ! 467: SDIVcc_R	sdivcc 	%r18, %r3, %r13
	.word 0x91d02034  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879022d4  ! 469: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	setx 0x18a86266f36276f2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90274e  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x074e, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_2_252:
	.word 0x819824fe  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04fe, %hpstate
DS_2_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_2_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x87902108  ! 478: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
mondo_2_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d910006  ! 479: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
	.word 0x8d902d67  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x0d67, %pstate
	.word 0x8d90245a  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
intveclr_2_257:
	setx 0x8bb2c89ffaba5c23, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902728  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0728, %pstate
debug_2_258:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 484: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93a109cc  ! 485: FDIVd	fdivd	%f4, %f12, %f40
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_2_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe08008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x99902003  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87902315  ! 491: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
donret_2_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_260-donret_2_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_2_261:
	setx 0x7205a4c7beb0cc6e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_262) + 8, 16, 16)) -> intp(5,0,0)
intvec_2_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 495: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_2_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_264) + 40, 16, 16)) -> intp(4,0,15)
intvec_2_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xa1902008  ! 1: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902007  ! 2: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_lsu_1_0:
	setx 0xc71f477ed9f7cca7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_1:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 5: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa145c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r16
tagged_1_2:
	tsubcctv %r25, 0x1c08, %r9
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_1_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d944002  ! 9: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
change_to_randtl_1_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_4:
	.word 0x8f902000  ! 10: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 11: RDPC	rd	%pc, %r20
splash_lsu_1_6:
	setx 0x34f1e0d925f2aeb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_1_7:
	set 0x60540000, %r31
	.word 0x8581a16f  ! 14: WRCCR_I	wr	%r6, 0x016f, %ccr
	.word 0x99902000  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_8) + 0, 16, 16)) -> intp(6,0,6)
intvec_1_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_1_9:
	taddcctv %r13, 0x1592, %r14
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_1_10:
	setx 0x80b4e01371353839, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_1_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a0c9c2  ! 1: FDIVd	fdivd	%f34, %f2, %f18
	.word 0xd1100007  ! 1: LDQF_R	-	[%r0, %r7], %f8
	.word 0x99a14828  ! 21: FADDs	fadds	%f5, %f8, %f12
DS_1_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_1_13:
	.word 0x81982e8f  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01968  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9190367c  ! 26: WRPR_PIL_I	wrpr	%r0, 0x167c, %pil
splash_cmpr_1_15:
	setx 0x2b7599f71b5b313f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790206c  ! 28: WRPR_TT_I	wrpr	%r0, 0x006c, %tt
tagged_1_16:
	tsubcctv %r11, 0x1015, %r21
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_1_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_18:
	setx 0x14b201b3c25cb8eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_1_19:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802088  ! 34: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0x99414000  ! 36: RDPC	rd	%pc, %r12
mondo_1_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94800a  ! 37: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
tagged_1_22:
	tsubcctv %r24, 0x1887, %r16
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0x95a349cc  ! 39: FDIVd	fdivd	%f44, %f12, %f10
DS_1_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5140002  ! 1: LDQF_R	-	[%r16, %r2], %f10
	.word 0x9ba2c82a  ! 40: FADDs	fadds	%f11, %f10, %f13
splash_tba_1_24:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_1_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d9022c3  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
	.word 0x879023d9  ! 45: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8780204f  ! 47: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x99902000  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
pmu_1_27:
	nop
	setx 0xfffff548fffffbf3, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_1_28:
	set 0x60340000, %r31
	.word 0x85847984  ! 50: WRCCR_I	wr	%r17, 0x1984, %ccr
change_to_randtl_1_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_29:
	.word 0x8f902001  ! 51: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab848010  ! 52: WR_CLEAR_SOFTINT_R	wr	%r18, %r16, %clear_softint
debug_1_30:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 53: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802014  ! 55: WRASI_I	wr	%r0, 0x0014, %asi
mondo_1_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d934000  ! 56: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
debug_1_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_33:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_34:
	setx 0xb4ed79ddb4a17a73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d91c002  ! 60: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d00e60  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
mondo_1_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90c011  ! 63: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
splash_tba_1_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_39:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 65: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xe297e010  ! 66: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
splash_hpstate_1_40:
	.word 0x81982605  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x9249000a  ! 69: MULX_R	mulx 	%r4, %r10, %r9
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x879023e7  ! 71: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902002  ! 73: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_1_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_42:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 77: RDPC	rd	%pc, %r9
	.word 0xd68fe010  ! 78: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x9f803adf  ! 79: SIR	sir	0x1adf
	.word 0x8d903c68  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x1c68, %pstate
DS_1_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_1_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_44-donret_1_44), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902001  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd6cfe010  ! 84: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0xa1902000  ! 85: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	rd %pc, %r19
	add %r19, (ivw_1_45-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_45:
	.word 0x9194c009  ! 86: WRPR_PIL_R	wrpr	%r19, %r9, %pil
DS_1_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa1a049c6  ! 1: FDIVd	fdivd	%f32, %f6, %f16
	normalw
	.word 0x97458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r11
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 88: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_1_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 90: WRPR_GL_I	wrpr	%r0, 0x000c, %-
memptr_1_48:
	set user_data_start, %r31
	.word 0x8584ac1d  ! 91: WRCCR_I	wr	%r18, 0x0c1d, %ccr
	.word 0xa3a01a6a  ! 92: FqTOi	fqtoi	
	.word 0x95a50d31  ! 93: FsMULd	fsmuld	%f20, %f48, %f10
	rd %pc, %r19
	add %r19, (ivw_1_49-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_49:
	.word 0x91944002  ! 94: WRPR_PIL_R	wrpr	%r17, %r2, %pil
splash_cmpr_1_50:
	setx 0xd82c0e9e84df5d7a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_51:
	taddcctv %r25, 0x18f4, %r1
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_1_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023af  ! 98: WRPR_TT_I	wrpr	%r0, 0x03af, %tt
DS_1_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f10, %f0
	.word 0xa7b0c30d  ! 99: ALIGNADDRESS	alignaddr	%r3, %r13, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_54) + 56, 16, 16)) -> intp(5,0,30)
intvec_1_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xf566b8761d37afa8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0x9b454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xe08804a0  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_tba_1_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f80209c  ! 109: SIR	sir	0x009c
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769f17d  ! 110: SDIVX_I	sdivx	%r7, 0xfffff17d, %r19
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_1_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe88804a0  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9550c000  ! 114: RDPR_TT	rdpr	%tt, %r10
debug_1_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_60) + 40, 16, 16)) -> intp(5,0,0)
intvec_1_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x90c0f8f2  ! 118: ADDCcc_I	addccc 	%r3, 0xfffff8f2, %r8
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x9ba00171  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200f  ! 122: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x94810009  ! 123: ADDcc_R	addcc 	%r4, %r9, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196a  ! 124: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b7355  ! 125: SDIVX_I	sdivx	%r13, 0xfffff355, %r9
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0x99500000  ! 127: RDPR_TPC	<illegal instruction>
	.word 0xa9450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xa1902002  ! 129: WRPR_GL_I	wrpr	%r0, 0x0002, %-
change_to_randtl_1_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_63:
	.word 0x8f902003  ! 130: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_64) + 0, 16, 16)) -> intp(5,0,18)
intvec_1_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_65:
	setx 0x50656be2fe26fc8f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x87902367  ! 135: WRPR_TT_I	wrpr	%r0, 0x0367, %tt
	setx 0x363c4ffb607a73fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_1_68:
	setx 0xf29447ed09159277, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_69:
	setx 0x1dc47143a12e1ff5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_70:
	setx 0x94d6920ec0ad28f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x879023a2  ! 142: WRPR_TT_I	wrpr	%r0, 0x03a2, %tt
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 143: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_1_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xdad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_lsu_1_72:
	setx 0x061373daf0ddc0b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_1_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a209d0  ! 1: FDIVd	fdivd	%f8, %f16, %f48
	.word 0x91a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa3a08829  ! 149: FADDs	fadds	%f2, %f9, %f17
	.word 0x87802016  ! 150: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_1_74:
	tsubcctv %r11, 0x1952, %r20
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d02033  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_1_75:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe000  ! 157: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
splash_tba_1_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_1_78:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_79:
	setx 0xc9fdef0112eff037, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 161: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe88008a0  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	rd %pc, %r19
	add %r19, (ivw_1_80-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_80:
	.word 0x91930003  ! 163: WRPR_PIL_R	wrpr	%r12, %r3, %pil
memptr_1_81:
	set user_data_start, %r31
	.word 0x85832b67  ! 164: WRCCR_I	wr	%r12, 0x0b67, %ccr
DS_1_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe8d7e020  ! 166: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d90265d  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902004  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0x271e6c1dfddbea0d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a15  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1a15, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_1_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_84:
	.word 0x8f902000  ! 175: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01965  ! 176: FqTOd	dis not found

	.word 0xa5464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d02033  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_1_86:
	setx 0x3261a537a3401887, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_87:
	setx 0xd2666fb0f3fcd08b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_88:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_1_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_1_91:
	nop
	setx 0xfffff2d0fffffc0f, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d80e40  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0xd49004a0  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_tba_1_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_93:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 190: RDPC	rd	%pc, %r17
memptr_1_94:
	set 0x60140000, %r31
	.word 0x858467e4  ! 191: WRCCR_I	wr	%r17, 0x07e4, %ccr
	.word 0x8790229a  ! 192: WRPR_TT_I	wrpr	%r0, 0x029a, %tt
splash_lsu_1_95:
	setx 0x611d78be0d7fdda3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_1_96:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_1_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_1_98:
	tsubcctv %r3, 0x15cb, %r15
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_99:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 198: RDPC	rd	%pc, %r16
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_1_100:
	setx 0x33461214887a8e82, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d00e80  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
splash_cmpr_1_101:
	setx 0x138b1817398f8576, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_1_102:
	setx 0xfa3ad3ea700910f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 205: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x83d020b5  ! 207: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_lsu_1_105:
	setx 0xb9d22603138ff7a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d94c001  ! 209: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d934007  ! 210: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
	.word 0x93902005  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_1_108:
	.word 0x81982115  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0115, %hpstate
debug_1_109:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe131f64c  ! 1: STQF_I	-	%f16, [0x164c, %r7]
	normalw
	.word 0xa9458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
	rd %pc, %r19
	add %r19, (ivw_1_112-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_112:
	.word 0x91914010  ! 218: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa5b44ff4  ! 220: FONES	e	%f18
DS_1_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_1_114:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa1902000  ! 224: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902006  ! 225: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_1_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
mondo_1_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d920003  ! 228: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0xa190200d  ! 229: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x95520000  ! 230: RDPR_PIL	<illegal instruction>
debug_1_118:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d020b4  ! 232: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d940014  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
intveclr_1_120:
	setx 0x46dee70f1ca569c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956cadd5  ! 236: SDIVX_I	sdivx	%r18, 0x0dd5, %r10
	.word 0x93b44fec  ! 237: FONES	e	%f9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768edcf  ! 238: SDIVX_I	sdivx	%r3, 0x0dcf, %r11
intveclr_1_123:
	setx 0xd88e188eb9fbb044, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93d020b4  ! 241: Tcc_I	tne	icc_or_xcc, %r0 + 180
mondo_1_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d940009  ! 242: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0x91540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_1_126:
	setx 0x6a8ed435d0127e19, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_127:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_1_128:
	setx 0x470cb723e0c70ecf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802010  ! 248: WRASI_I	wr	%r0, 0x0010, %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x99540000  ! 250: RDPR_GL	rdpr	%-, %r12
	.word 0xd88008a0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_1_130:
	setx 0xd3528e0a773a65bc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_131:
	setx 0xa48e8ae7be4ef98f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_132:
	setx 0x70b7540ca486010d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	setx 0x9cff696e51693e1e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 257: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd88fe020  ! 258: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01961  ! 259: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36935e0  ! 260: SDIVX_I	sdivx	%r4, 0xfffff5e0, %r17
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_136:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a00173  ! 263: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568218e  ! 264: SDIVX_I	sdivx	%r0, 0x018e, %r10
	.word 0xd8c80e40  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
pmu_1_138:
	nop
	setx 0xffffff6cfffff68e, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_139:
	taddcctv %r17, 0x1bd7, %r22
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_1_140:
	tsubcctv %r16, 0x13a9, %r11
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_1_141:
	taddcctv %r6, 0x1e68, %r7
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_1_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa3a0016b  ! 271: FABSq	dis not found

mondo_1_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d908012  ! 272: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_1_144:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 274: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
intveclr_1_145:
	setx 0x657b0bed9713360b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda800bc0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
splash_cmpr_1_146:
	setx 0x52dd4511657ad926, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_1_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_147:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_1_148:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_1_149:
	.word 0x81982c4d  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
	.word 0xda880e80  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
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
	.word 0x95414000  ! 282: RDPC	rd	%pc, %r10
	.word 0x93902002  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x97454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x99902000  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
debug_1_151:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_1_152:
	tsubcctv %r6, 0x147b, %r8
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c80e80  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_1_153:
	taddcctv %r21, 0x17b9, %r11
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f803579  ! 291: SIR	sir	0x1579
	.word 0x93464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76caada  ! 293: SDIVX_I	sdivx	%r18, 0x0ada, %r19
donret_1_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_155-donret_1_155), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_1_156:
	setx 0x61311637b4956b81, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_randtl_1_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_157:
	.word 0x8f902001  ! 298: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902000  ! 299: WRPR_GL_I	wrpr	%r0, 0x0000, %-
mondo_1_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90000b  ! 300: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
	.word 0xd0c00e60  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0xa1902002  ! 302: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_1_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_159:
	.word 0x8f902002  ! 305: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd0dfe010  ! 306: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0x83d02035  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7686328  ! 308: SDIVX_I	sdivx	%r1, 0x0328, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01966  ! 309: FqTOd	dis not found

	.word 0x879020cc  ! 310: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
mondo_1_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d904001  ! 311: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
tagged_1_163:
	taddcctv %r15, 0x11ee, %r3
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902006  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_164) + 56, 16, 16)) -> intp(4,0,28)
intvec_1_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_165:
	setx 0xb2bcfc5706c0385b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d020b5  ! 317: Tcc_I	te	icc_or_xcc, %r0 + 181
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_166)+48, 16, 16)) -> intp(1,1,3)
xir_1_166:
	.word 0xa9852d9e  ! 318: WR_SET_SOFTINT_I	wr	%r20, 0x0d9e, %set_softint
	setx 0x7030166f4f6b234f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_168:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_1_169:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_1_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_1_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_171:
	.word 0x8f902003  ! 323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_hpstate_1_172:
	.word 0x819827c6  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c6, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x879022fe  ! 326: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0xa1902005  ! 327: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_1_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d940009  ! 329: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0x87802020  ! 330: WRASI_I	wr	%r0, 0x0020, %asi
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
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_1_175:
	set 0x60140000, %r31
	.word 0x85817dd6  ! 332: WRCCR_I	wr	%r5, 0x1dd6, %ccr
mondo_1_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d918004  ! 333: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0x93902004  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_1_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3314007  ! 1: STQF_R	-	%f17, [%r7, %r5]
	normalw
	.word 0x99458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r12
intveclr_1_178:
	setx 0x87327682a8932052, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196a  ! 338: FqTOd	dis not found

	.word 0xa2c4e0ed  ! 339: ADDCcc_I	addccc 	%r19, 0x00ed, %r17
	rd %pc, %r19
	add %r19, (ivw_1_180-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_180:
	.word 0x9194c012  ! 340: WRPR_PIL_R	wrpr	%r19, %r18, %pil
splash_cmpr_1_181:
	setx 0x19159fe0df89497e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f28, %f18
	.word 0x95b08309  ! 342: ALIGNADDRESS	alignaddr	%r2, %r9, %r10
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_1_184:
	tsubcctv %r21, 0x1191, %r4
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_185:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 345: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_186)+40, 16, 16)) -> intp(1,1,3)
xir_1_186:
	.word 0xa984b5f8  ! 346: WR_SET_SOFTINT_I	wr	%r18, 0x15f8, %set_softint
memptr_1_187:
	set 0x60540000, %r31
	.word 0x8584ffb8  ! 347: WRCCR_I	wr	%r19, 0x1fb8, %ccr
	.word 0x87902244  ! 348: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
mondo_1_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d918007  ! 349: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	.word 0xa1902006  ! 350: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802088  ! 351: WRASI_I	wr	%r0, 0x0088, %asi
mondo_1_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c00d  ! 352: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x919225a2  ! 354: WRPR_PIL_I	wrpr	%r8, 0x05a2, %pil
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
	.word 0x97414000  ! 355: RDPC	rd	%pc, %r11
memptr_1_192:
	set user_data_start, %r31
	.word 0x85846326  ! 356: WRCCR_I	wr	%r17, 0x0326, %ccr
	setx 0x5ae1c3441f709a2d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022f4  ! 358: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
splash_tba_1_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 361: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_1_195:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 362: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_196) + 0, 16, 16)) -> intp(2,0,17)
intvec_1_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 364: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903eb4  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x1eb4, %pstate
	.word 0xa350c000  ! 367: RDPR_TT	<illegal instruction>
splash_cmpr_1_197:
	setx 0x8d71f72bf446206e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_1_198:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_199:
	setx 0x9fa8e71a44c2bde7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_1_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_200:
	.word 0x8f902001  ! 372: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_1_201:
	setx 0x13641358efb3a281, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_202:
	set 0x60140000, %r31
	.word 0x858174b6  ! 374: WRCCR_I	wr	%r5, 0x14b6, %ccr
mondo_1_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d90c006  ! 375: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
	.word 0xd8c7e030  ! 376: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d020b3  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x976b0005  ! 378: SDIVX_R	sdivx	%r12, %r5, %r11
splash_tba_1_204:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f24, %f14
	.word 0x9bb28306  ! 380: ALIGNADDRESS	alignaddr	%r10, %r6, %r13
	.word 0x8790230f  ! 381: WRPR_TT_I	wrpr	%r0, 0x030f, %tt
splash_cmpr_1_206:
	setx 0x840c587397bfca44, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_1_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d948007  ! 384: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0xa5a00174  ! 385: FABSq	dis not found

intveclr_1_208:
	setx 0x84a6fa6013d55094, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 387: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xa982c010  ! 388: WR_SET_SOFTINT_R	wr	%r11, %r16, %set_softint
	.word 0xa9a0c9c4  ! 389: FDIVd	fdivd	%f34, %f4, %f20
	.word 0x9f80295f  ! 390: SIR	sir	0x095f
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_1_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_210:
	.word 0x8f902000  ! 392: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_1_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f10, %f4
	.word 0xa5b2c300  ! 393: ALIGNADDRESS	alignaddr	%r11, %r0, %r18
splash_cmpr_1_212:
	setx 0x0fb3d09909aba5cc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_213:
	.word 0x81982eb5  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eb5, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_1_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d94000c  ! 397: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_215:
	setx 0x81fff55bcabfa6ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a00172  ! 400: FABSq	dis not found

splash_hpstate_1_216:
	.word 0x81982065  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0065, %hpstate
	.word 0x9b480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_217:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 403: RDPC	rd	%pc, %r12
	.word 0x91d02034  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_1_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d90c014  ! 405: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
mondo_1_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950007  ! 406: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x93902003  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
donret_1_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_220-donret_1_220), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_220:
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x87802004  ! 409: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f80247a  ! 410: SIR	sir	0x047a
	.word 0xa17035e5  ! 411: POPC_I	popc	0x15e5, %r16
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_1_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 413: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x91d020b4  ! 414: Tcc_I	ta	icc_or_xcc, %r0 + 180
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d902c1a  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0c1a, %pstate
mondo_1_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914002  ! 417: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	.word 0xa1902002  ! 418: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0xa7414000  ! 420: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_1_225:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 422: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01964  ! 423: FqTOd	dis not found

	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_1_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196b  ! 427: FqTOd	dis not found

mondo_1_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d950009  ! 428: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0x93a50d27  ! 430: FsMULd	fsmuld	%f20, %f38, %f40
debug_1_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe010  ! 432: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196b  ! 434: FqTOd	dis not found

mondo_1_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d90800b  ! 435: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_233)+24, 16, 16)) -> intp(1,1,3)
xir_1_233:
	.word 0xa984b431  ! 436: WR_SET_SOFTINT_I	wr	%r18, 0x1431, %set_softint
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_1_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 438: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0x99902004  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x944c0012  ! 440: MULX_R	mulx 	%r16, %r18, %r10
tagged_1_235:
	taddcctv %r22, 0x104a, %r22
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab804006  ! 442: WR_CLEAR_SOFTINT_R	wr	%r1, %r6, %clear_softint
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_1_238:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_1_239:
	setx 0xbf411f96fe613ce1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 448: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_1_240:
	setx 0xdfd91bb2f28980dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00161  ! 450: FABSq	dis not found

	.word 0x93480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_1_241:
	setx 0xca7db9c7ab7b4176, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902002  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_1_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94000c  ! 454: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a2ce8  ! 455: SDIVX_I	sdivx	%r8, 0x0ce8, %r9
splash_hpstate_1_244:
	.word 0x8198200f  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
debug_1_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_246:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 458: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_lsu_1_247:
	setx 0xc50437b7213cbba7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d902393  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x0393, %pstate
tagged_1_248:
	tsubcctv %r4, 0x15b5, %r12
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d90235f  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x035f, %pstate
tagged_1_249:
	taddcctv %r20, 0x1e39, %r11
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8790224a  ! 465: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
splash_hpstate_1_250:
	.word 0x8198264d  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064d, %hpstate
	.word 0xa2f84009  ! 467: SDIVcc_R	sdivcc 	%r1, %r9, %r17
	.word 0x93d020b4  ! 468: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x879022c4  ! 469: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
	setx 0x1156cbf7afc46593, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902845  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x0845, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_1_252:
	.word 0x81982116  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0116, %hpstate
DS_1_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_1_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x8790234a  ! 478: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
mondo_1_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d92400a  ! 479: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x8d903b65  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x1b65, %pstate
	.word 0x8d903f16  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x1f16, %pstate
intveclr_1_257:
	setx 0xf3106cd9e188b815, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026a3  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x06a3, %pstate
debug_1_258:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 484: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x93a1c9c9  ! 485: FDIVd	fdivd	%f38, %f40, %f40
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_1_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0800aa0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
	.word 0x99902004  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x879021da  ! 491: WRPR_TT_I	wrpr	%r0, 0x01da, %tt
donret_1_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_260-donret_1_260), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_1_261:
	setx 0x25d66c559ad8427f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_262) + 48, 16, 16)) -> intp(0,0,15)
intvec_1_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 495: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_1_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_264) + 0, 16, 16)) -> intp(1,0,26)
intvec_1_264:
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xa190200d  ! 1: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902006  ! 2: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_0_0:
	setx 0x5bd2639860f98207, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 4: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_1
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_1
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_1:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 5: RDPC	rd	%pc, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 6: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9745c000  ! 7: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_0_2:
	tsubcctv %r23, 0x1196, %r4
	.word 0xd607eae3  ! 8: LDUW_I	lduw	[%r31 + 0x0ae3], %r11
mondo_0_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d94000b  ! 9: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
change_to_randtl_0_4:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_4:
	.word 0x8f902001  ! 10: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_5:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 11: RDPC	rd	%pc, %r9
splash_lsu_0_6:
	setx 0xa119859cd1659b57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e700001  ! 13: BPVS	<illegal instruction>
memptr_0_7:
	set 0x60540000, %r31
	.word 0x85817007  ! 14: WRCCR_I	wr	%r5, 0x1007, %ccr
	.word 0x99902003  ! 15: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_8) + 48, 16, 16)) -> intp(4,0,1)
intvec_0_8:
	.word 0x39400001  ! 16: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 17: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_0_9:
	taddcctv %r13, 0x1d99, %r14
	.word 0xd207f007  ! 18: LDUW_I	lduw	[%r31 + 0xfffff007], %r9
splash_lsu_0_10:
	setx 0x9d83925528bf0537, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd277f007  ! 20: STX_I	stx	%r9, [%r31 + 0xfffff007]
DS_0_11:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a249c5  ! 1: FDIVd	fdivd	%f40, %f36, %f8
	.word 0xd7110004  ! 1: LDQF_R	-	[%r4, %r4], %f11
	.word 0xa9a40823  ! 21: FADDs	fadds	%f16, %f3, %f20
DS_0_12:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 22: SAVE_R	save	%r31, %r0, %r31
splash_hpstate_0_13:
	.word 0x81982adf  ! 23: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196b  ! 24: FqTOd	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9190b314  ! 26: WRPR_PIL_I	wrpr	%r2, 0x1314, %pil
splash_cmpr_0_15:
	setx 0xe87fd5909972277d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902159  ! 28: WRPR_TT_I	wrpr	%r0, 0x0159, %tt
tagged_0_16:
	tsubcctv %r4, 0x1116, %r21
	.word 0xe607f314  ! 29: LDUW_I	lduw	[%r31 + 0xfffff314], %r19
splash_tba_0_17:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 30: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_18:
	setx 0x76ac65ed54a17a5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 32: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_19:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 33: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802014  ! 34: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x20800001  ! 35: BN	bn,a	<label_0x1>
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
	.word 0xa1414000  ! 36: RDPC	rd	%pc, %r16
mondo_0_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d95000b  ! 37: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
tagged_0_22:
	tsubcctv %r16, 0x103d, %r19
	.word 0xe007f314  ! 38: LDUW_I	lduw	[%r31 + 0xfffff314], %r16
	.word 0x91a4c9d4  ! 39: FDIVd	fdivd	%f50, %f20, %f8
DS_0_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1148012  ! 1: LDQF_R	-	[%r18, %r18], %f8
	.word 0xa3a04832  ! 40: FADDs	fadds	%f1, %f18, %f17
splash_tba_0_24:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 41: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_25:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 42: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_0_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 43: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d903e7d  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x1e7d, %pstate
	.word 0x879023e1  ! 45: WRPR_TT_I	wrpr	%r0, 0x03e1, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 46: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8780201c  ! 47: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x99902000  ! 48: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
pmu_0_27:
	nop
	setx 0xfffff5fcfffffb6c, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_0_28:
	set 0x60340000, %r31
	.word 0x85826731  ! 50: WRCCR_I	wr	%r9, 0x0731, %ccr
change_to_randtl_0_29:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_29:
	.word 0x8f902000  ! 51: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab82c001  ! 52: WR_CLEAR_SOFTINT_R	wr	%r11, %r1, %clear_softint
debug_0_30:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_30:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_30
    nop
debug_wait0_30:
    ld [%r23], %r2
    brnz %r2, debug_wait0_30
    nop
    ba,a debug_startwait0_30
continue_debug_0_30:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_30:
    cmp %r13, %r15
    bne,a wait_for_stat_0_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_30:
    cmp %r14, %r15
    bne,a wait_for_debug_0_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 53: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xe20fe731  ! 54: LDUB_I	ldub	[%r31 + 0x0731], %r17
	.word 0x87802063  ! 55: WRASI_I	wr	%r0, 0x0063, %asi
mondo_0_31:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 56: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
debug_0_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 57: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_33:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_34:
	setx 0xef1be970610b5e6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920014  ! 60: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_36:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 61: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0xe2d004a0  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
mondo_0_37:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d91c00b  ! 63: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
splash_tba_0_38:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
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
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_39:
    cmp %r14, %r15
    bne,a wait_for_debug_0_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 65: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xe297e030  ! 66: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
splash_hpstate_0_40:
	.word 0x8198241e  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041e, %hpstate
	.word 0xe31fe731  ! 68: LDDF_I	ldd	[%r31, 0x0731], %f17
	.word 0x984a400c  ! 69: MULX_R	mulx 	%r9, %r12, %r12
	.word 0xd8d004a0  ! 70: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x8790201a  ! 71: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 72: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902007  ! 73: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd8c804a0  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd937c000  ! 75: STQF_R	-	%f12, [%r0, %r31]
debug_0_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_42:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 77: RDPC	rd	%pc, %r11
	.word 0xd68fe000  ! 78: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x9f8029ad  ! 79: SIR	sir	0x09ad
	.word 0x8d9020e6  ! 80: WRPR_PSTATE_I	wrpr	%r0, 0x00e6, %pstate
DS_0_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 81: RESTORE_R	restore	%r31, %r0, %r31
donret_0_44:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_44-donret_0_44), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_44:
	.word 0xd6ffe9ad  ! 82: SWAPA_I	swapa	%r11, [%r31 + 0x09ad] %asi
	.word 0x93902005  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd6cfe020  ! 84: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xa1902007  ! 85: WRPR_GL_I	wrpr	%r0, 0x0007, %-
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
    and %r14, 0xb6, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91910012  ! 86: WRPR_PIL_R	wrpr	%r4, %r18, %pil
DS_0_46:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a049d0  ! 1: FDIVd	fdivd	%f32, %f16, %f42
	normalw
	.word 0xa7458000  ! 87: RD_SOFTINT_REG	rd	%softint, %r19
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 88: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_47:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 89: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902000  ! 90: WRPR_GL_I	wrpr	%r0, 0x0000, %-
memptr_0_48:
	set user_data_start, %r31
	.word 0x85847901  ! 91: WRCCR_I	wr	%r17, 0x1901, %ccr
	.word 0x93a01a6c  ! 92: FqTOi	fqtoi	
	.word 0x99a4cd22  ! 93: FsMULd	fsmuld	%f19, %f2, %f12
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
    and %r14, 0xd4, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194000b  ! 94: WRPR_PIL_R	wrpr	%r16, %r11, %pil
splash_cmpr_0_50:
	setx 0x6933a4e9e547fd29, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_51:
	taddcctv %r2, 0x13ea, %r24
	.word 0xd807f901  ! 96: LDUW_I	lduw	[%r31 + 0xfffff901], %r12
splash_tba_0_52:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902082  ! 98: WRPR_TT_I	wrpr	%r0, 0x0082, %tt
DS_0_53:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f2, %f24
	.word 0xa5b00312  ! 99: ALIGNADDRESS	alignaddr	%r0, %r18, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_54) + 48, 16, 16)) -> intp(6,0,29)
intvec_0_54:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x52b10bdfe8296d75, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4d804a0  ! 102: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe477c000  ! 103: STX_R	stx	%r18, [%r31 + %r0]
	.word 0xe527f901  ! 104: STF_I	st	%f18, [0x1901, %r31]
	.word 0xa1454000  ! 105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe08804a0  ! 106: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_tba_0_56:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f8024c8  ! 109: SIR	sir	0x04c8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968fe0b  ! 110: SDIVX_I	sdivx	%r3, 0xfffffe0b, %r20
	.word 0x32700001  ! 111: BPNE	<illegal instruction>
splash_tba_0_58:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8880e80  ! 113: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
	.word 0x9b50c000  ! 114: RDPR_TT	rdpr	%tt, %r13
debug_0_59:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb97fe0b  ! 116: LDQFA_I	-	[%r31, 0x1e0b], %f13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_60) + 0, 16, 16)) -> intp(5,0,10)
intvec_0_60:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0c4e9c8  ! 118: ADDCcc_I	addccc 	%r19, 0x09c8, %r16
	.word 0x81b01021  ! 119: SIAM	siam	1
	.word 0x95a00173  ! 120: FABSq	dis not found

	.word 0xd48008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200c  ! 122: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa0828001  ! 123: ADDcc_R	addcc 	%r10, %r1, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 124: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6afd55  ! 125: SDIVX_I	sdivx	%r11, 0xfffffd55, %r13
	.word 0x30700001  ! 126: BPA	<illegal instruction>
	.word 0xa5500000  ! 127: RDPR_TPC	<illegal instruction>
	.word 0xa3450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xa190200f  ! 129: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_0_63:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_63:
	.word 0x8f902000  ! 130: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_64) + 8, 16, 16)) -> intp(7,0,27)
intvec_0_64:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_65:
	setx 0x2ae19b638f3e917e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
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
	.word 0xe3e7e002  ! 133: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0x81460000  ! 134: RD_STICK_REG	stbar
	.word 0x87902191  ! 135: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	setx 0x5c47aff4fd7f531b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_67:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe327c000  ! 137: STF_R	st	%f17, [%r0, %r31]
splash_lsu_0_68:
	setx 0x5843808dc104aefb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_69:
	setx 0xc4ced01bd36554bd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 139: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_70:
	setx 0xd6686035660a0d3d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe337c000  ! 141: STQF_R	-	%f17, [%r0, %r31]
	.word 0x879020f3  ! 142: WRPR_TT_I	wrpr	%r0, 0x00f3, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 143: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_71:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b464000  ! 145: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xdad00e80  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
splash_lsu_0_72:
	setx 0x647acd6c70cde341, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 148: BGE	bge,a	<label_0x1>
DS_0_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa9a009d0  ! 1: FDIVd	fdivd	%f0, %f16, %f20
	.word 0xa1a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa9a2c82a  ! 149: FADDs	fadds	%f11, %f10, %f20
	.word 0x87802004  ! 150: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe847c000  ! 151: LDSW_R	ldsw	[%r31 + %r0], %r20
tagged_0_74:
	tsubcctv %r13, 0x1830, %r2
	.word 0xe807fd55  ! 152: LDUW_I	lduw	[%r31 + 0xfffffd55], %r20
	.word 0x91d02035  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 154: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_0_75:
	set 0x003c0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 156: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8cfe000  ! 157: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
splash_tba_0_77:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 158: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_0_78:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_79:
	setx 0xfa4c0a63593e9931, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 161: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe8800c60  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r20
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
    and %r14, 0x72, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950000  ! 163: WRPR_PIL_R	wrpr	%r20, %r0, %pil
memptr_0_81:
	set user_data_start, %r31
	.word 0x85816e70  ! 164: WRCCR_I	wr	%r5, 0x0e70, %ccr
DS_0_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe8d7e020  ! 166: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	.word 0xe877ee70  ! 167: STX_I	stx	%r20, [%r31 + 0x0e70]
	.word 0x8d903639  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x1639, %pstate
	.word 0xe89fc020  ! 169: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902004  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 171: LDX_R	ldx	[%r31 + %r0], %r20
	setx 0xa1ed5a0f088baa1b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a73  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1a73, %pstate
	.word 0xe837ee70  ! 174: STH_I	sth	%r20, [%r31 + 0x0e70]
change_to_randtl_0_84:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_84:
	.word 0x8f902002  ! 175: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01962  ! 176: FqTOd	dis not found

	.word 0x95464000  ! 177: RD_STICK_CMPR_REG	rd	%-, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x91d020b2  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_0_86:
	setx 0x592a10d8e2921d3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_87:
	setx 0x033e7d8d28df1e57, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 181: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_88:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 183: LDQF_R	-	[%r31, %r0], %f10
debug_0_89:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_90
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_90:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e002  ! 185: CASA_R	casa	[%r31] %asi, %r2, %r10
pmu_0_91:
	nop
	setx 0xfffff8acfffff482, %g1, %g7
	.word 0xa3800007  ! 186: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd4d804a0  ! 187: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd4900e60  ! 188: LDUHA_R	lduha	[%r0, %r0] 0x73, %r10
splash_tba_0_92:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_93
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_93
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_93:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 190: RDPC	rd	%pc, %r12
memptr_0_94:
	set 0x60140000, %r31
	.word 0x85836d76  ! 191: WRCCR_I	wr	%r13, 0x0d76, %ccr
	.word 0x87902319  ! 192: WRPR_TT_I	wrpr	%r0, 0x0319, %tt
splash_lsu_0_95:
	setx 0x5907d75a40b4e87f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 193: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 194: BGU	bgu,a	<label_0x1>
splash_tba_0_96:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_0_97:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_0_98:
	tsubcctv %r6, 0x12df, %r10
	.word 0xd807ed76  ! 197: LDUW_I	lduw	[%r31 + 0x0d76], %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_99
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_99
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_99:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 198: RDPC	rd	%pc, %r9
	.word 0xd28008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_0_100:
	setx 0x1155ab50264c1dce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 200: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2d00e60  ! 201: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
splash_cmpr_0_101:
	setx 0x3d767488a393c526, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 202: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902007  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_0_102:
	setx 0x4fde6407e62b469f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d92c010  ! 205: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_104:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 206: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0x91d020b2  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_0_105:
	setx 0xecc33c1e270f6b6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_106:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d928011  ! 209: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
mondo_0_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d934005  ! 210: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
	.word 0x93902007  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x22700001  ! 212: BPE	<illegal instruction>
	.word 0xd26fed76  ! 213: LDSTUB_I	ldstub	%r9, [%r31 + 0x0d76]
splash_hpstate_0_108:
	.word 0x8198238d  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
debug_0_109:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 215: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd334e4bb  ! 1: STQF_I	-	%f9, [0x04bb, %r19]
	normalw
	.word 0x91458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_111
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_111:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 217: CASA_R	casa	[%r31] %asi, %r5, %r8
cmp_0_112:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_112:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_112
    nop
cmp_wait0_112:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_112
    nop
    ba,a cmp_startwait0_112
continue_cmp_0_112:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x80, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91900005  ! 218: WRPR_PIL_R	wrpr	%r0, %r5, %pil
	.word 0xd08008a0  ! 219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x9bb14ff4  ! 220: FONES	e	%f13
DS_0_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
splash_tba_0_114:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad004a0  ! 223: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xa1902006  ! 224: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902003  ! 225: WRPR_GL_I	wrpr	%r0, 0x0003, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_115
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_115:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 226: CASA_R	casa	[%r31] %asi, %r20, %r13
DS_0_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 227: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
mondo_0_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d950006  ! 228: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0xa1902004  ! 229: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x95520000  ! 230: RDPR_PIL	<illegal instruction>
debug_0_118:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 231: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 232: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_0_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d91c014  ! 233: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
intveclr_0_120:
	setx 0x9fc772eebddd3065, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b3712  ! 236: SDIVX_I	sdivx	%r12, 0xfffff712, %r17
	.word 0x95b40fe7  ! 237: FONES	e	%f10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c2f75  ! 238: SDIVX_I	sdivx	%r16, 0x0f75, %r18
intveclr_0_123:
	setx 0xab3560fa262a8132, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 240: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91d02032  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 242: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0x91540000  ! 243: RDPR_GL	<illegal instruction>
splash_lsu_0_126:
	setx 0x9b28a4c949822611, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_127:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 245: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_128:
	setx 0x67b175afaa65dc4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 246: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87802080  ! 248: WRASI_I	wr	%r0, 0x0080, %asi
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_129
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_129:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x99540000  ! 250: RDPR_GL	rdpr	%-, %r12
	.word 0xd8800ae0  ! 251: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r12
splash_cmpr_0_130:
	setx 0xa51ea3e63fa99d63, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 252: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_131:
	setx 0x1ebebc27820f216a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 253: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_132:
	setx 0x7b5ae35884499fcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0xa55a6b1376851aa1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_133:
	.word 0x39400001  ! 256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 257: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd88fe030  ! 258: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01972  ! 259: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa168b5cf  ! 260: SDIVX_I	sdivx	%r2, 0xfffff5cf, %r16
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_136:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 262: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97a00165  ! 263: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996a2a1e  ! 264: SDIVX_I	sdivx	%r8, 0x0a1e, %r12
	.word 0xd8c804a0  ! 265: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
pmu_0_138:
	nop
	setx 0xfffff2cdfffff412, %g1, %g7
	.word 0xa3800007  ! 266: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_0_139:
	taddcctv %r8, 0x11c0, %r5
	.word 0xd807ea1e  ! 267: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_0_140:
	tsubcctv %r14, 0x165a, %r1
	.word 0xd807ea1e  ! 268: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
tagged_0_141:
	taddcctv %r11, 0x1625, %r26
	.word 0xd807ea1e  ! 269: LDUW_I	lduw	[%r31 + 0x0a1e], %r12
DS_0_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 270: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x9ba00169  ! 271: FABSq	dis not found

mondo_0_143:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910007  ! 272: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
	.word 0xda9004a0  ! 273: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
debug_0_144:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_144:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_144
    nop
debug_wait0_144:
    ld [%r23], %r2
    brnz %r2, debug_wait0_144
    nop
    ba,a debug_startwait0_144
continue_debug_0_144:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_144:
    cmp %r13, %r15
    bne,a wait_for_stat_0_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_144:
    cmp %r14, %r15
    bne,a wait_for_debug_0_144
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 274: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
intveclr_0_145:
	setx 0xfad4df019d812cbb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_0_146:
	setx 0xc4771e76083493b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 277: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_147:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_147:
	.word 0x8f902003  ! 278: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_148:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 279: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_hpstate_0_149:
	.word 0x8198299f  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099f, %hpstate
	.word 0xda880e80  ! 281: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
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
	.word 0x9b414000  ! 282: RDPC	rd	%pc, %r13
	.word 0x93902002  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91454000  ! 284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0x99902004  ! 285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_0_151:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 286: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_152:
	tsubcctv %r23, 0x1eb7, %r6
	.word 0xd007ea1e  ! 287: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0xd0c804a0  ! 288: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8d802000  ! 289: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_153:
	taddcctv %r14, 0x1fc4, %r25
	.word 0xd007ea1e  ! 290: LDUW_I	lduw	[%r31 + 0x0a1e], %r8
	.word 0x9f80250b  ! 291: SIR	sir	0x050b
	.word 0x91464000  ! 292: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91697466  ! 293: SDIVX_I	sdivx	%r5, 0xfffff466, %r8
donret_0_155:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_155-donret_0_155), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_155:
	.word 0xd0fff466  ! 294: SWAPA_I	swapa	%r8, [%r31 + 0xfffff466] %asi
	.word 0xd11ff466  ! 295: LDDF_I	ldd	[%r31, 0x1466], %f8
splash_lsu_0_156:
	setx 0xab1aea5d4d87379d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 178
change_to_randtl_0_157:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_157:
	.word 0x8f902002  ! 298: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902000  ! 299: WRPR_GL_I	wrpr	%r0, 0x0000, %-
mondo_0_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 300: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xd0c004a0  ! 301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xa1902000  ! 302: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd06ff466  ! 303: LDSTUB_I	ldstub	%r8, [%r31 + 0xfffff466]
	.word 0xd127c000  ! 304: STF_R	st	%f8, [%r0, %r31]
change_to_randtl_0_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_159:
	.word 0x8f902003  ! 305: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd0dfe030  ! 306: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x83d02032  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ceb3e  ! 308: SDIVX_I	sdivx	%r19, 0x0b3e, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01974  ! 309: FqTOd	dis not found

	.word 0x879023f1  ! 310: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
mondo_0_162:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d914007  ! 311: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
tagged_0_163:
	taddcctv %r8, 0x1dda, %r26
	.word 0xd407eb3e  ! 312: LDUW_I	lduw	[%r31 + 0x0b3e], %r10
	.word 0x93902007  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_164) + 0, 16, 16)) -> intp(2,0,9)
intvec_0_164:
	.word 0x39400001  ! 314: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_165:
	setx 0xbd358e3dc705a5d5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02032  ! 317: Tcc_I	ta	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_166)+8, 16, 16)) -> intp(0,1,3)
xir_0_166:
	.word 0xa984f6c5  ! 318: WR_SET_SOFTINT_I	wr	%r19, 0x16c5, %set_softint
	setx 0xbe6d5f7421f221b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_167:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_168:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_169:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_170:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_0_171:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_171:
	.word 0x8f902000  ! 323: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_0_172:
	.word 0x81982054  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0054, %hpstate
	.word 0x36700001  ! 325: BPGE	<illegal instruction>
	.word 0x879022f1  ! 326: WRPR_TT_I	wrpr	%r0, 0x02f1, %tt
	.word 0xa1902000  ! 327: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd46ff6c5  ! 328: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff6c5]
mondo_0_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 329: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0x87802089  ! 330: WRASI_I	wr	%r0, 0x0089, %asi
donret_0_174:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_174-donret_0_174), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_174:
	.word 0xd4fff6c5  ! 331: SWAPA_I	swapa	%r10, [%r31 + 0xfffff6c5] %asi
memptr_0_175:
	set 0x60340000, %r31
	.word 0x8584eb3f  ! 332: WRCCR_I	wr	%r19, 0x0b3f, %ccr
mondo_0_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 333: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x93902000  ! 334: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_0_177:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd534c011  ! 1: STQF_R	-	%f10, [%r17, %r19]
	normalw
	.word 0xa1458000  ! 335: RD_SOFTINT_REG	rd	%softint, %r16
intveclr_0_178:
	setx 0xd3f603884cbe961d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 337: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 338: FqTOd	dis not found

	.word 0x94c0f8a6  ! 339: ADDCcc_I	addccc 	%r3, 0xfffff8a6, %r10
cmp_0_180:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_180:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_180
    nop
cmp_wait0_180:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_180
    nop
    ba,a cmp_startwait0_180
continue_cmp_0_180:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190c013  ! 340: WRPR_PIL_R	wrpr	%r3, %r19, %pil
splash_cmpr_0_181:
	setx 0x05551e9113534658, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 341: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f12, %f0
	.word 0xa9b30312  ! 342: ALIGNADDRESS	alignaddr	%r12, %r18, %r20
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
	.word 0xe9e7e012  ! 343: CASA_R	casa	[%r31] %asi, %r18, %r20
tagged_0_184:
	tsubcctv %r17, 0x1c9b, %r9
	.word 0xe807f8a6  ! 344: LDUW_I	lduw	[%r31 + 0xfffff8a6], %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_185
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 345: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_186)+56, 16, 16)) -> intp(0,1,3)
xir_0_186:
	.word 0xa9823023  ! 346: WR_SET_SOFTINT_I	wr	%r8, 0x1023, %set_softint
memptr_0_187:
	set 0x60540000, %r31
	.word 0x8582ab21  ! 347: WRCCR_I	wr	%r10, 0x0b21, %ccr
	.word 0x87902301  ! 348: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
mondo_0_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d900006  ! 349: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
	.word 0xa190200b  ! 350: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802080  ! 351: WRASI_I	wr	%r0, 0x0080, %asi
mondo_0_189:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d93000a  ! 352: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_190
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_190:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 353: CASA_R	casa	[%r31] %asi, %r10, %r19
	.word 0x9191368e  ! 354: WRPR_PIL_I	wrpr	%r4, 0x168e, %pil
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
	.word 0x9b414000  ! 355: RDPC	rd	%pc, %r13
memptr_0_192:
	set user_data_start, %r31
	.word 0x8581fb63  ! 356: WRCCR_I	wr	%r7, 0x1b63, %ccr
	setx 0x669902b3e0436ebd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_193:
	.word 0x39400001  ! 357: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902369  ! 358: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
splash_tba_0_194:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 361: WRPR_GL_I	wrpr	%r0, 0x0001, %-
debug_0_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_195:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_195
    nop
debug_wait0_195:
    ld [%r23], %r2
    brnz %r2, debug_wait0_195
    nop
    ba,a debug_startwait0_195
continue_debug_0_195:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_195:
    cmp %r13, %r15
    bne,a wait_for_stat_0_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_195:
    cmp %r14, %r15
    bne,a wait_for_debug_0_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00852  ! 362: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_196) + 32, 16, 16)) -> intp(1,0,5)
intvec_0_196:
	.word 0x39400001  ! 363: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 364: WRASI_I	wr	%r0, 0x004f, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903d9a  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x1d9a, %pstate
	.word 0x9950c000  ! 367: RDPR_TT	<illegal instruction>
splash_cmpr_0_197:
	setx 0x92d779bbbfe31185, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_198:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 369: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_199:
	setx 0x2c8880e0bcede9d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 371: Tcc_I	te	icc_or_xcc, %r0 + 180
change_to_randtl_0_200:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_200:
	.word 0x8f902002  ! 372: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_0_201:
	setx 0x3093c9ee31704770, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_0_202:
	set 0x60540000, %r31
	.word 0x8581ec00  ! 374: WRCCR_I	wr	%r7, 0x0c00, %ccr
mondo_0_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 375: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xd8c7e030  ! 376: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d020b4  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1680011  ! 378: SDIVX_R	sdivx	%r0, %r17, %r16
splash_tba_0_204:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_205:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f2, %f6
	.word 0xa1b08305  ! 380: ALIGNADDRESS	alignaddr	%r2, %r5, %r16
	.word 0x879023de  ! 381: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
splash_cmpr_0_206:
	setx 0xe2fb9b6c71741546, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe137c000  ! 383: STQF_R	-	%f16, [%r0, %r31]
mondo_0_207:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 384: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0xa9a0016c  ! 385: FABSq	dis not found

intveclr_0_208:
	setx 0x204328374557944b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_209:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 387: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0xa981400b  ! 388: WR_SET_SOFTINT_R	wr	%r5, %r11, %set_softint
	.word 0x93a109d3  ! 389: FDIVd	fdivd	%f4, %f50, %f40
	.word 0x9f80306f  ! 390: SIR	sir	0x106f
	.word 0xd237f06f  ! 391: STH_I	sth	%r9, [%r31 + 0xfffff06f]
change_to_randtl_0_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_210:
	.word 0x8f902000  ! 392: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_0_211:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f6, %f4
	.word 0x97b00314  ! 393: ALIGNADDRESS	alignaddr	%r0, %r20, %r11
splash_cmpr_0_212:
	setx 0x9bd02038b63d70ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 394: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_213:
	.word 0x81982fcf  ! 395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0xd66ff06f  ! 396: LDSTUB_I	ldstub	%r11, [%r31 + 0xfffff06f]
mondo_0_214:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d918011  ! 397: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_215:
	setx 0x42011dee9c6a480e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00174  ! 400: FABSq	dis not found

splash_hpstate_0_216:
	.word 0x81982475  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0475, %hpstate
	.word 0x93480000  ! 402: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_217
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_217:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 403: RDPC	rd	%pc, %r10
	.word 0x83d02032  ! 404: Tcc_I	te	icc_or_xcc, %r0 + 50
mondo_0_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 405: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
mondo_0_219:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d910012  ! 406: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0x93902006  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_0_220:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_220-donret_0_220), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_220:
	.word 0xd4fff06f  ! 408: SWAPA_I	swapa	%r10, [%r31 + 0xfffff06f] %asi
	.word 0x8780204f  ! 409: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f802f78  ! 410: SIR	sir	0x0f78
	.word 0x97703b76  ! 411: POPC_I	popc	0x1b76, %r11
	.word 0xd71ffb76  ! 412: LDDF_I	ldd	[%r31, 0x1b76], %f11
mondo_0_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d944005  ! 413: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x91d02034  ! 414: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_222
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_222:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e005  ! 415: CASA_R	casa	[%r31] %asi, %r5, %r11
	.word 0x8d902724  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0724, %pstate
mondo_0_223:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 417: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xa1902004  ! 418: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 419: LDX_R	ldx	[%r31 + %r0], %r11
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
	.word 0x97414000  ! 420: RDPC	rd	%pc, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 421: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_225:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_225:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_225
    nop
debug_wait0_225:
    ld [%r23], %r2
    brnz %r2, debug_wait0_225
    nop
    ba,a debug_startwait0_225
continue_debug_0_225:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_225:
    cmp %r13, %r15
    bne,a wait_for_stat_0_225
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_225:
    cmp %r14, %r15
    bne,a wait_for_debug_0_225
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 422: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 423: FqTOd	dis not found

	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 424: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 425: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_227:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 426: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01964  ! 427: FqTOd	dis not found

mondo_0_229:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d90c001  ! 428: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	.word 0xe33fc000  ! 429: STDF_R	std	%f17, [%r0, %r31]
	.word 0xa7a14d31  ! 430: FsMULd	fsmuld	%f5, %f48, %f50
debug_0_230:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6dfe030  ! 432: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01963  ! 434: FqTOd	dis not found

mondo_0_232:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91c014  ! 435: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_233)+32, 16, 16)) -> intp(0,1,3)
xir_0_233:
	.word 0xa98122a1  ! 436: WR_SET_SOFTINT_I	wr	%r4, 0x02a1, %set_softint
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d908004  ! 438: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x99902004  ! 439: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x904d0014  ! 440: MULX_R	mulx 	%r20, %r20, %r8
tagged_0_235:
	taddcctv %r4, 0x1edc, %r3
	.word 0xd007e2a1  ! 441: LDUW_I	lduw	[%r31 + 0x02a1], %r8
	.word 0xab82400a  ! 442: WR_CLEAR_SOFTINT_R	wr	%r9, %r10, %clear_softint
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_236:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 443: CASA_R	casa	[%r31] %asi, %r10, %r8
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 444: CASA_R	casa	[%r31] %asi, %r10, %r8
debug_0_238:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 445: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa7500000  ! 446: RDPR_TPC	<illegal instruction>
splash_cmpr_0_239:
	setx 0xf74dad1f9bfe0a77, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 447: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_240:
	setx 0xef95af36619f525a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00166  ! 450: FABSq	dis not found

	.word 0x93480000  ! 451: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_cmpr_0_241:
	setx 0x2c33578a6f147573, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 452: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902007  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_0_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950013  ! 454: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ce7e9  ! 455: SDIVX_I	sdivx	%r19, 0x07e9, %r8
splash_hpstate_0_244:
	.word 0x81982546  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
debug_0_245:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 457: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
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
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 458: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_lsu_0_247:
	setx 0x1d692c59af74d20d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 459: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x8d902ca9  ! 461: WRPR_PSTATE_I	wrpr	%r0, 0x0ca9, %pstate
tagged_0_248:
	tsubcctv %r10, 0x14e1, %r21
	.word 0xd007e7e9  ! 462: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x8d903ee8  ! 463: WRPR_PSTATE_I	wrpr	%r0, 0x1ee8, %pstate
tagged_0_249:
	taddcctv %r24, 0x10b8, %r14
	.word 0xd007e7e9  ! 464: LDUW_I	lduw	[%r31 + 0x07e9], %r8
	.word 0x87902229  ! 465: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
splash_hpstate_0_250:
	.word 0x8198279c  ! 466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079c, %hpstate
	.word 0x9afc8012  ! 467: SDIVcc_R	sdivcc 	%r18, %r18, %r13
	.word 0x91d02032  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902353  ! 469: WRPR_TT_I	wrpr	%r0, 0x0353, %tt
	setx 0x702d8d09316b025a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_251:
	.word 0x39400001  ! 470: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902053  ! 471: WRPR_PSTATE_I	wrpr	%r0, 0x0053, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 472: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda6fe7e9  ! 473: LDSTUB_I	ldstub	%r13, [%r31 + 0x07e9]
splash_hpstate_0_252:
	.word 0x8198215e  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
DS_0_253:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 475: SAVE_R	save	%r31, %r0, %r31
debug_0_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 476: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_255
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_255:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x879021db  ! 478: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
mondo_0_256:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 479: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x8d903123  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x1123, %pstate
	.word 0x8d902ad6  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0ad6, %pstate
intveclr_0_257:
	setx 0x7eff4af2562649ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 482: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e93  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x1e93, %pstate
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
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 484: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xa1a189d4  ! 485: FDIVd	fdivd	%f6, %f20, %f16
	.word 0xe08008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe037e7e9  ! 487: STH_I	sth	%r16, [%r31 + 0x07e9]
splash_tba_0_259:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe08008a0  ! 489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x99902003  ! 490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87902146  ! 491: WRPR_TT_I	wrpr	%r0, 0x0146, %tt
donret_0_260:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_260-donret_0_260), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_260:
	.word 0xe0ffe7e9  ! 492: SWAPA_I	swapa	%r16, [%r31 + 0x07e9] %asi
splash_cmpr_0_261:
	setx 0x646fbe6c11f4d3c1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_262) + 56, 16, 16)) -> intp(6,0,6)
intvec_0_262:
	.word 0x39400001  ! 494: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 495: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe01fe7e9  ! 496: LDD_I	ldd	[%r31 + 0x07e9], %r16
debug_0_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_264) + 56, 16, 16)) -> intp(5,0,8)
intvec_0_264:
cmpenall_0_265:
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

	.xword	0x59f76a7e5fa7d1fb
	.xword	0x1e1c5429a94a4194
	.xword	0xd99c6becc199c64c
	.xword	0xeee4b9225d0492e2
	.xword	0x1c0bbf868f6ced67
	.xword	0xa1b31f9e9287c9c8
	.xword	0x2b3d1b8e6c5ab867
	.xword	0xc0519967ea71a32a
	.xword	0x55a875df6fa6a266
	.xword	0xc320d23db976c677
	.xword	0xe4302b64715c7fa7
	.xword	0x7d47ba2c7d5ad027
	.xword	0x3eef76ce7180c219
	.xword	0x5cb4553952c713fa
	.xword	0xfa5ebd82cb9167aa
	.xword	0x357472897b9f6f54
	.xword	0x7dba906345528fac
	.xword	0x82e3978c4a7d39de
	.xword	0xd593844ec9d0102d
	.xword	0xeb07cc07c97ec15a
	.xword	0x25c9009990cc5b81
	.xword	0x8f0a058f13f628c2
	.xword	0xd4a989f52e608b75
	.xword	0x995c407a38024f12
	.xword	0x9688bf7db135be48
	.xword	0xff5f834c707abc5d
	.xword	0x8a291019aa98ac10
	.xword	0xf278d8c75ea2d989
	.xword	0x39ee2214738732e7
	.xword	0x393d0ed36225eb5a
	.xword	0x830a83fa0d7af06f
	.xword	0x959820a40761f867
	.xword	0xfbebd3734b6afbda
	.xword	0xa4ad2ba5a7bc4376
	.xword	0x47fcdb099fabff89
	.xword	0x2ef028ebfc7f5636
	.xword	0x6b5bcb5d94549183
	.xword	0xed61541af3bd06c7
	.xword	0xfbca22482b10b460
	.xword	0x63a9a9aff54d3fb0
	.xword	0x0b5f74d248c134a5
	.xword	0x6460cce96f779266
	.xword	0x7e57fa3e20208a77
	.xword	0xed74b67f160c3688
	.xword	0x88ce94ce46acb09f
	.xword	0x67c29c0b38063e20
	.xword	0x1e6ee6e4705513bd
	.xword	0x051711b7cdbb246c
	.xword	0xa092924b2baae707
	.xword	0x971ced52a73cb1c5
	.xword	0xd01a0ce3e2e88035
	.xword	0x4859a23ba4a1ab54
	.xword	0x5c065ad06fb67784
	.xword	0xae5c17313bc0bc3d
	.xword	0x858537dfd4d07b22
	.xword	0x896e3c70c5cf733d
	.xword	0x1a8d37fd6fb036e8
	.xword	0x250cb42e1001cd82
	.xword	0xd724cc04149ce37a
	.xword	0x8ab39d2be84c3135
	.xword	0xd7092ea70752a867
	.xword	0xf7d44815b601d46d
	.xword	0xda803a36521d8d0f
	.xword	0xa71944b1cd64701a
	.xword	0x92a94ff974376507
	.xword	0x60e7b5abef95465b
	.xword	0xa28349d69d9742d8
	.xword	0x147a2c911160a543
	.xword	0x873650ecaeb59d08
	.xword	0x1489d4281a1c8de0
	.xword	0xef4f98d107fa85e5
	.xword	0x4014e868f3481ab0
	.xword	0x324a3fd678be00d1
	.xword	0x79d1aa8d7de0366a
	.xword	0x509b3694a0df2ac3
	.xword	0xa63d9823db98f06e
	.xword	0x5cfd0519218af71f
	.xword	0xa45021c76cefecce
	.xword	0x89b04cf57fb17f0d
	.xword	0x7e651121f7a3716e
	.xword	0x5a1d8f885c4e2c6a
	.xword	0xb0771222618985c9
	.xword	0xc1baf8b73a6691d6
	.xword	0xd75b9d1d7d638b9c
	.xword	0x1c1263431fd4deee
	.xword	0x2be5f485b15c58af
	.xword	0x34aabc1d69125eed
	.xword	0xb283046afeaa3cde
	.xword	0x9dd31f630aebd50b
	.xword	0x8284f28a131ec76c
	.xword	0x2e6ff4fd77e75aaf
	.xword	0xae11b32e71530f89
	.xword	0xa740453d84a5705e
	.xword	0xceb1724d10417122
	.xword	0x1849a89bcd6ed61a
	.xword	0x0ba2eaf04fedbe40
	.xword	0x2c193efae7e24567
	.xword	0xf290711b9b3746b1
	.xword	0x7b3b51e3fbb7a20c
	.xword	0x1aa68e19975f85f3
	.xword	0xbe4443a689202624
	.xword	0x8067aa0343f9d899
	.xword	0x7dd12fc14c5ebaef
	.xword	0x82cefa801ab76005
	.xword	0xc51c3eb6588170f3
	.xword	0x8d76d5ff51d4f9ea
	.xword	0x4c945042a0abb87c
	.xword	0x36cea9c9deb6246a
	.xword	0x26c62f4328e20d3a
	.xword	0x74a729efa03f2fc1
	.xword	0x453c91f81736fd9f
	.xword	0xdf611021f58abd35
	.xword	0xc37ab2ba8cdec1c4
	.xword	0xc750be86c791169b
	.xword	0x4b006439bc2684c1
	.xword	0x98f5c227f18b8fd0
	.xword	0x5192cc3fef35de06
	.xword	0x422f0590049659af
	.xword	0x6d4ea545c021e845
	.xword	0x151987831f8f024e
	.xword	0x16b95ced032f60e2
	.xword	0x110ee1779517cca6
	.xword	0xe3d3d80c82d3aa50
	.xword	0x1ce25814fa7ae474
	.xword	0x56d941330870b5e8
	.xword	0xd4b44c055d4f9853
	.xword	0x66e5f09cc8fa0292
	.xword	0xa99c82188101a86b
	.xword	0xe6cec0d7b7a10c53
	.xword	0x16277075860d1534
	.xword	0xcc4a7b1fc85852d0
	.xword	0x8291caddc2893bdb
	.xword	0x3448016ea3827137
	.xword	0x1c1d5bb6adf04acb
	.xword	0x21601973a3ba862b
	.xword	0x974d8c0bf9163e76
	.xword	0xa4004ea59771b973
	.xword	0x20a6c8cbf725677a
	.xword	0x1be85be1eeb275a1
	.xword	0x7673781ef91c59ec
	.xword	0x2ba0da7f32e695f7
	.xword	0xd8e45d753673cff3
	.xword	0xc22e4073381604ec
	.xword	0x5179828fb4d05adc
	.xword	0xc969a79d1c968967
	.xword	0xc783f9f364ea261f
	.xword	0xebb73e011788846d
	.xword	0xcaa39b45dd37f9dc
	.xword	0xea21ef12a1284ace
	.xword	0x344cacee4ddfb279
	.xword	0x42b09acaebb95886
	.xword	0x9d5467bdc0292cb3
	.xword	0xf7b83c71e283d769
	.xword	0x9bfede82e23030bb
	.xword	0x5d5d01f4dedf86ba
	.xword	0x23b435d64ecbaf5c
	.xword	0x9d83fad687c76048
	.xword	0x967c141da40f7903
	.xword	0x35f8d501a34a57a7
	.xword	0x4656a568ebb09aa7
	.xword	0xf53a5c53c2770cba
	.xword	0x42a67d52f0ac3d27
	.xword	0x01e3051e620fe056
	.xword	0x11ebbfb69ffce293
	.xword	0x1531c206114984c6
	.xword	0xbce921f91ee99580
	.xword	0x7431d445506c68fe
	.xword	0x399ad672bd4b7302
	.xword	0xdfa2e5cb20eff361
	.xword	0xe5bfabb1ae8994d1
	.xword	0x665691a0076ca1f0
	.xword	0xfb2c3cb54664ee65
	.xword	0x157f0d25de08127f
	.xword	0x3ce6789093096700
	.xword	0xe8c78886e376f498
	.xword	0x374cc076117227da
	.xword	0x8ab33b881b8b4a50
	.xword	0x1fd47ad1aa9374c5
	.xword	0xcab3a2ce989910e8
	.xword	0x9ff2b2a022ef7b64
	.xword	0xcd65366504f363c0
	.xword	0x4085182bb996c022
	.xword	0x486db8bd92e98c15
	.xword	0x6df21274dbaabc0b
	.xword	0xe1d948d950953579
	.xword	0x9eeb775fc80491e1
	.xword	0xa9987c3e0cd01ac4
	.xword	0x33fb1d593d1e0f4e
	.xword	0x69512b8620202049
	.xword	0x17cc6c509fd9dacf
	.xword	0x65dd80839a667e5b
	.xword	0xdeacf7b20fc4e468
	.xword	0x48c1958f61a701b5
	.xword	0xb4b540c2c59b7739
	.xword	0x5c031d8774d59982
	.xword	0xe5d135b0b6b519c0
	.xword	0x9b1f07c87b552b9a
	.xword	0x761485e140a22d3b
	.xword	0xe91dde53714eacb7
	.xword	0xbd3c993d5d30f8db
	.xword	0x85a33751b706dab4
	.xword	0x74e52a3f575038da
	.xword	0x1ff6529f53d1e951
	.xword	0x0e32fc68146d83f4
	.xword	0x88e929701e717176
	.xword	0x66b08ab9df888b1b
	.xword	0x66347f3b932025b2
	.xword	0xf98fa193d6ff8e14
	.xword	0x1680ba06d80acd56
	.xword	0x5c29e04bc85073e0
	.xword	0x9057ec62060cd937
	.xword	0x1a881280557395c0
	.xword	0xfd8e9184207f3369
	.xword	0xa21615e4f848c58d
	.xword	0xa98fd0064765a967
	.xword	0xc19186591279fd00
	.xword	0xe8437c7c09e5ae97
	.xword	0x8c2a53a9b85d29c7
	.xword	0x948091b1068c543a
	.xword	0xa60d15286f445ad3
	.xword	0xf105c00e75e8f6ec
	.xword	0x1e6ccadc6800a262
	.xword	0xb98f4a897ff12b80
	.xword	0x2a4f0aee84703358
	.xword	0x759fa0ea993bb70f
	.xword	0xe9aecbd3a6b6b832
	.xword	0xebc3fafe4d384a6d
	.xword	0xd9c724176479cc76
	.xword	0x31b4c63a255a6a50
	.xword	0x11d8c8fb813026b0
	.xword	0xa973f42654e4e507
	.xword	0x7a6be712c6ed1895
	.xword	0x1b88b8fcfc71a950
	.xword	0x9950e9a591c16344
	.xword	0xef19b0311899ca72
	.xword	0x8c365e16c0d05667
	.xword	0xa3eac9e593d3b4ce
	.xword	0x37f7f5712e0e72eb
	.xword	0x38d41acdb214a35b
	.xword	0x7f196987aeb5e116
	.xword	0x0390e7e471b571a9
	.xword	0x3c00e46fd627b466
	.xword	0xf0bcf196655e2522
	.xword	0xf6172527668c6b85
	.xword	0xbbd5c9e59794c0eb
	.xword	0x1f3b9950b8866f1c
	.xword	0x43dda010ae82f3c5
	.xword	0xa0322d3c5f8f247a
	.xword	0x7775e0af7e128b42
	.xword	0x31b9c944755aa060
	.xword	0x718636b80631ba8b
	.xword	0x49979fc2555cc560
	.xword	0xef7b31eedf713aa4
	.xword	0x1c45b66913bf49a9
	.xword	0x63ac8561752fc7ef
	.xword	0x1d5b5f66fc086ee4

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
	TTE_NFO	 = 0,
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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x17e4f1c06b56d6fc
	.xword	0xcc680f00ab11d62d
	.xword	0x74139ecf30686f98
	.xword	0x15fdd0525c6613d0
	.xword	0x07afa70393964db4
	.xword	0x3492b63763b89aac
	.xword	0x4274cdf14bb56db3
	.xword	0x3594b05ac1689d54
	.xword	0xd9c785eca644c657
	.xword	0xd54e8503fc692415
	.xword	0x6aa1ed4e7c3da69c
	.xword	0xd0b145a34ef24104
	.xword	0x33262d4e8c627304
	.xword	0x8de692dfdf469817
	.xword	0xdb92b209b8c12162
	.xword	0x61547a57326ff445
	.xword	0x5c2e7033573793b7
	.xword	0x31f585e3d8a5f522
	.xword	0xee98e4bd1287fea7
	.xword	0x53f30540c39a1294
	.xword	0xc0c53333fe352701
	.xword	0x5fe697e64bb190a5
	.xword	0x216a14bc2e2d8957
	.xword	0x42dafe8591718fcc
	.xword	0xe992b2703e8dbfa6
	.xword	0x718e2cffde9421ee
	.xword	0xab070c3327005456
	.xword	0x4e47ff48d1a3f5a3
	.xword	0xd2b1853109a5c820
	.xword	0x89a9873a4c2fec93
	.xword	0xcf7de22f995b1d0e
	.xword	0xa6213f0fab6f4ae3



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
	.xword	0xb494b7d8bbd5e9e4
	.xword	0x9158ae36c44f8a24
	.xword	0x78a1aae0c6a34221
	.xword	0xb54de092ba7ace26
	.xword	0xdad16fe5988e6fcf
	.xword	0x237b7306015e45b4
	.xword	0xd08b31d46ecba771
	.xword	0x1357336487e89b95
	.xword	0xe717b171abdfc374
	.xword	0xe84ff448b051cc5d
	.xword	0x3c9efbddc637ddf8
	.xword	0x80f38093157970fa
	.xword	0x4b623e43cb47a50f
	.xword	0xd9d5cb65a5ec972c
	.xword	0x99b4227236c8d380
	.xword	0x0f03c8d6faee4101
	.xword	0x230c0df4d6b50272
	.xword	0x8cdb7f73f5fdae3d
	.xword	0xbb11043e22bb0148
	.xword	0xd720b5e62c09ae1d
	.xword	0x2111cfb4fcb522f6
	.xword	0xfa60b6f583a320f1
	.xword	0x455330457bbb41cb
	.xword	0xe7a585e45a608f3e
	.xword	0x56a1f1b304b151dd
	.xword	0x84e23edbd5dc9783
	.xword	0xe15cf0d34aa2f9b0
	.xword	0xa6b7146813f18c42
	.xword	0xfd83098d417504fa
	.xword	0xf66c5ed861c82c0b
	.xword	0xf956acf2ace501c3
	.xword	0xf99f793d7640f252



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
	.xword	0x4db00c25451976ea
	.xword	0xcec846f7980257df
	.xword	0x9c7f2dd09b4200a4
	.xword	0x51c591d8ce2fcb77
	.xword	0x93e9de1cc34d52ba
	.xword	0xf5ca1e1911bbeca0
	.xword	0x9db64d4eeebd20d4
	.xword	0x36ebd00de9da4ff5
	.xword	0x9ac9f9c94112714d
	.xword	0x1baf7167a10f29ef
	.xword	0xd600c992299ffc0e
	.xword	0x333e1a26b901299a
	.xword	0x6d5d01faa7ad7530
	.xword	0xcfacf0801adaa6a5
	.xword	0x9b6cbd2c7d9d69a7
	.xword	0x5e6eff87c026fbbb
	.xword	0x627d311f49ede90d
	.xword	0xd853d3b67734a074
	.xword	0xb2490ec503235643
	.xword	0xd4afc393ed862e22
	.xword	0x94a9a0cf50b0cd0c
	.xword	0xefa971ef6e04ee83
	.xword	0x0588441e0f94d01e
	.xword	0x7b7eef791f755764
	.xword	0xf88c9bfb7503dc61
	.xword	0xd8862cf30f346878
	.xword	0x5cb91a836afb50e2
	.xword	0x76b46b222a4500d5
	.xword	0x97103c328b3095f0
	.xword	0xe86af6eb971652d8
	.xword	0xcadcce75bac72c57
	.xword	0xaeb306cb650e9c68



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
	TTE_CV	 = 1,
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
	.xword	0x2ac21eceb7fcda7e
	.xword	0x5551199308ea251f
	.xword	0x435783fe93f50a5c
	.xword	0xca74a04610c1a861
	.xword	0x5b270ba59296788a
	.xword	0x024527110dee99f6
	.xword	0x0c4ed8e99203e7c7
	.xword	0x4f7bcf08bbb4b9f2
	.xword	0x707d9269e1124075
	.xword	0x2d66de560179ef14
	.xword	0xecd0f82053069028
	.xword	0x909f3b64d5ad3e26
	.xword	0x935013833da4c1fc
	.xword	0x14b46d2f0e837702
	.xword	0x93d7dde47604b6ad
	.xword	0x44d3a2cf3281ec18
	.xword	0xd96c01f5b875339b
	.xword	0xbe07964d30d9d79f
	.xword	0x2f907a45f2ba2e8c
	.xword	0x1a40292c542e360c
	.xword	0x3f6c863b29d935e3
	.xword	0xd55527109e25354b
	.xword	0xcd5aa99c8b6b8794
	.xword	0xfdd0589c9ef35d3b
	.xword	0x715cb90953b358c0
	.xword	0x997effec5ad29da8
	.xword	0x11248bf42f8dd123
	.xword	0xd9501e8ee7a36456
	.xword	0x0b63c532cc267a2d
	.xword	0xa9e0d039581cf4e3
	.xword	0xdc487987f4e4ff92
	.xword	0x4ed579abbc4914c2



#if 0
#endif

