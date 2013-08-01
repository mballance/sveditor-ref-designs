/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_08.s
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
#define DMMU_SKIP_IF_NO_TTE
#define IMMU_SKIP_IF_NO_TTE

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
# 24 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 53 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 162 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    inc %l6;\
    save %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    restore %i7, %g0, %i7 ;\
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
    restore %i7, %g0, %i7;\
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
    stw %l5, [%i7];\
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7;\
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    xor %i0, %l1, %l1;\
    and %l1, 0xf, %l1; \
    ba hh11_1; \
    not %g0, %l2; \
    hh11_2: done; \
    hh11_1: xor %l1, %l2, %l2; \
    ba hh11_2; \
    jmp %l2;

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
    ba h11_1; \
    not %g0, %l2; \
    h11_2: done; \
    h11_1: xor %l1, %l2, %l2; \
    ba h11_2; \
    jmp %l2;

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
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
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

#define H_HT0_Instruction_VA_Watchpoint_0x75
#define SUN_H_HT0_Instruction_VA_Watchpoint_0x75 \
    done;nop

#define H_HT0_Instruction_Breakpoint_0x76
#define SUN_H_HT0_Instruction_Breakpoint_0x76 \
    done;nop
# 685 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g1, %g2; \
    jmp %g2; \
    nop 

!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g1, %g3 ;\
    te %xcc, T_BAD_TRAP ;\
    nop; \
    retry;

!!!!! Queue interrupt handler
# 36 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 136 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 139 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 184 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 187 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
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
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
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
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
       retry; 

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 218 "diag.j"
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
	mov 0xb5, %r14
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

intveclr_0_0:
	set 0xce63e39c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x924d000a  ! 2: MULX_R	mulx 	%r20, %r10, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r9
debug_0_1:
	setx debug_0_1 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 4: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd20fc000  ! 5: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0xd397e001  ! 6: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0x34800001  ! 7: BG	bg,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_2)) -> intp(0,0,16)
intvec_0_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_3:
	setx 0x6c5e2e8d17a63f3c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 9: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd20fe001  ! 10: LDUB_I	ldub	[%r31 + 0x0001], %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_4)) -> intp(0,0,7)
intvec_0_4:
	.word 0x39400001  ! 11: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd317c000  ! 12: LDQF_R	-	[%r31, %r0], %f9
	.word 0xa04a400b  ! 13: MULX_R	mulx 	%r9, %r11, %r16
	.word 0xe0880e60  ! 14: LDUBA_R	lduba	[%r0, %r0] 0x73, %r16
	.word 0x81982cd7  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
splash_cmpr_0_5:
	setx 0xd19bafb96b53f900, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903d49  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x1d49, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_6)) -> intp(0,0,21)
intvec_0_6:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 19: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9b450000  ! 20: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xda4fe001  ! 21: LDSB_I	ldsb	[%r31 + 0x0001], %r13
splash_lsu_0_7:
	setx 0xe35d2bda48636841, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda9004a0  ! 23: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
splash_cmpr_0_8:
	setx 0xec87fb57580ee445, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_9)) -> intp(0,1,3)
xir_0_9:
	.word 0xa9826001  ! 25: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
DS_0_10:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xe7473515	! Random illegal ?
	.word 0xd9110007  ! 1: LDQF_R	-	[%r4, %r7], %f12
	.word 0x81a50832  ! 26: FADDs	fadds	%f20, %f18, %f0
	set 0x9669bf3e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_11:
	.word 0x39400001  ! 27: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99464000  ! 28: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0xd81fc000  ! 29: LDD_R	ldd	[%r31 + %r0], %r12
debug_0_12:
	mov 8, %r18
	.word 0xe8f00852  ! 30: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
intveclr_0_13:
	set 0x4b405c97, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 31: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8ffc032  ! 32: SWAPA_R	swapa	%r12, [%r31 + %r18] 0x01
	.word 0x8790232e  ! 33: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
	.word 0xd8bfc032  ! 34: STDA_R	stda	%r12, [%r31 + %r18] 0x01
	.word 0xd8d004a0  ! 35: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_14)) -> intp(0,0,4)
intvec_0_14:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xb837f1c8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_15:
	.word 0x39400001  ! 37: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 38: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_16:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d908012  ! 39: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0x91d020b4  ! 40: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 41: Tcc_R	te	icc_or_xcc, %r0 + %r30
	set 0xfcd2c280, %r28
	stxa %r28, [%g0] 0x73
intvec_0_17:
	.word 0x39400001  ! 42: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_18:
	mov 8, %r18
	.word 0xd6f00852  ! 43: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 44: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 45: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x91d020b4  ! 46: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_19:
	setx debug_0_19 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 47: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab844003  ! 48: WR_CLEAR_SOFTINT_R	wr	%r17, %r3, %clear_softint
	.word 0x93d02032  ! 49: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d90249c  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_20)) -> intp(0,1,3)
xir_0_20:
	.word 0xa982e001  ! 51: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0xd8c7e010  ! 52: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd9e7c023  ! 53: CASA_I	casa	[%r31] 0x 1, %r3, %r12
	.word 0xd847e001  ! 54: LDSW_I	ldsw	[%r31 + 0x0001], %r12
debug_0_21:
	mov 8, %r18
	.word 0xe0f00852  ! 55: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x8b50c000  ! 56: RDPR_TT	<illegal instruction>
debug_0_22:
	setx debug_0_22 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 57: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xcac7e020  ! 58: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r5
	.word 0xca47c000  ! 59: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0xca4fe001  ! 60: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0xca8804a0  ! 61: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	set 0x5a4766f1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_23:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5454000  ! 63: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x93902002  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 65: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa1a2c9d0  ! 66: FDIVd	fdivd	%f42, %f16, %f16
DS_0_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 67: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x816ca001  ! 68: SDIVX_I	sdivx	%r18, 0x0001, %r0
	.word 0x8d90206b  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x006b, %pstate
	.word 0x93902003  ! 70: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 71: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0800ae0  ! 72: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_26)) -> intp(0,0,16)
intvec_0_26:
	.word 0x39400001  ! 73: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_27:
	setx 0xc9071a2305058fff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 74: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_28:
	tsubcctv %r12, 0x1c01, %r4
	.word 0xc007e001  ! 75: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x34800001  ! 76: BG	bg,a	<label_0x1>
debug_0_29:
	mov 0x38, %r18
	.word 0xfef00b12  ! 77: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_30)) -> intp(0,1,3)
xir_0_30:
	.word 0xa982a001  ! 78: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
DS_0_31:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f4, %f6
	.word 0x99b44306  ! 79: ALIGNADDRESS	alignaddr	%r17, %r6, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_32)) -> intp(0,0,30)
intvec_0_32:
	.word 0x39400001  ! 80: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_33:
	mov 8, %r18
	.word 0xe8f00852  ! 81: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
mondo_0_34:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d92000c  ! 82: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
	.word 0x93902006  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_0_35:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_35:
	.word 0x8f902003  ! 84: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_0_36:
	setx 0x290f3d5f8da16221, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 85: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd927e001  ! 86: STF_I	st	%f12, [0x0001, %r31]
	.word 0xd837c00c  ! 87: STH_R	sth	%r12, [%r31 + %r12]
	.word 0xa9818005  ! 88: WR_SET_SOFTINT_R	wr	%r6, %r5, %set_softint
	.word 0xd89004a0  ! 89: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 90: FqTOd	dis not found

	.word 0x93902004  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 92: LDX_R	ldx	[%r31 + %r0], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_38)) -> intp(0,0,11)
intvec_0_38:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6d7e010  ! 94: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x87902223  ! 95: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
	.word 0x2c800001  ! 96: BNEG	bneg,a	<label_0x1>
	.word 0xd647e001  ! 97: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x89450000  ! 98: RD_SET_SOFTINT	rd	%set_softint, %r4
	set 0xae852e90, %r28
	stxa %r28, [%g0] 0x73
intvec_0_39:
	.word 0x39400001  ! 99: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc8dfe010  ! 100: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_40)) -> intp(0,0,27)
intvec_0_40:
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198208f  ! 102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008f, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8cfe000  ! 105: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	.word 0x93902002  ! 106: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc877c005  ! 107: STX_R	stx	%r4, [%r31 + %r5]
debug_0_41:
	mov 0x38, %r18
	.word 0xfef00b12  ! 108: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_42:
	tsubcctv %r10, 0x1e9c, %r22
	.word 0xc807e001  ! 109: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x8780204f  ! 110: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x81982b5d  ! 111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
	.word 0x9f802001  ! 112: SIR	sir	0x0001
splash_lsu_0_43:
	setx 0xe236d7f67b882ee3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 114: WRASI_I	wr	%r0, 0x001c, %asi
debug_0_44:
	mov 0x38, %r18
	.word 0xfef00b12  ! 115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc8800c80  ! 116: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r4
	.word 0x8790201f  ! 117: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	set 0x7ed920c7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_45:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab81c006  ! 119: WR_CLEAR_SOFTINT_R	wr	%r7, %r6, %clear_softint
debug_0_46:
	setx debug_0_46 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 120: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99454000  ! 121: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xa1902009  ! 122: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd937e001  ! 123: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x93902005  ! 124: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8afc8007  ! 125: SDIVcc_R	sdivcc 	%r18, %r7, %r5
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16aa001  ! 126: SDIVX_I	sdivx	%r10, 0x0001, %r16
	.word 0xe047c000  ! 127: LDSW_R	ldsw	[%r31 + %r0], %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_48)) -> intp(0,0,22)
intvec_0_48:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 129: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d450000  ! 130: RD_SET_SOFTINT	rd	%set_softint, %r6
	.word 0x87802004  ! 131: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_49:
	setx 0x9c0ac238883b1c95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 132: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 133: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 134: BPL	<illegal instruction>
debug_0_50:
	mov 0x38, %r18
	.word 0xfef00b12  ! 135: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0xe67282a9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_51:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_52:
	setx debug_0_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 137: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	set 0x588cac22, %r28
	stxa %r28, [%g0] 0x73
intvec_0_53:
	.word 0x39400001  ! 138: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(0,0,24)
intvec_0_54:
	.word 0x39400001  ! 139: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_55:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe9300011  ! 1: STQF_R	-	%f20, [%r17, %r0]
	normalw
	.word 0xa7458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r19
splash_lsu_0_56:
	setx 0xc4dca801e66ffdd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_57:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c001  ! 142: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
	.word 0xe69fc020  ! 143: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
tagged_0_58:
	tsubcctv %r23, 0x14f4, %r9
	.word 0xe607e001  ! 144: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe6cfe010  ! 145: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	.word 0x8790222b  ! 146: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
DS_0_59:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc1336001  ! 1: STQF_I	-	%f0, [0x0001, %r13]
	normalw
	.word 0x8f458000  ! 147: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce8fe000  ! 148: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r7
	.word 0x87902126  ! 149: WRPR_TT_I	wrpr	%r0, 0x0126, %tt
	.word 0xce900e40  ! 150: LDUHA_R	lduha	[%r0, %r0] 0x72, %r7
debug_0_60:
	mov 8, %r18
	.word 0xd4f00852  ! 151: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x2c800001  ! 152: BNEG	bneg,a	<label_0x1>
	.word 0xce9fe001  ! 153: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x879020dd  ! 154: WRPR_TT_I	wrpr	%r0, 0x00dd, %tt
DS_0_61:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 155: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8780201c  ! 156: WRASI_I	wr	%r0, 0x001c, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_62)) -> intp(0,1,3)
xir_0_62:
	.word 0xa9846001  ! 157: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	set 0x91eae5ff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_63:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_64:
	setx debug_0_64 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 159: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_65:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd32a001  ! 1: STQF_I	-	%f6, [0x0001, %r10]
	normalw
	.word 0x8d458000  ! 160: RD_SOFTINT_REG	rd	%softint, %r6
intveclr_0_66:
	set 0x7eb00a47, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 161: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xccdfe020  ! 162: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0xccc004a0  ! 163: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xa7816001  ! 164: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x0001, %-
	set 0x91b07142, %r28
	stxa %r28, [%g0] 0x73
intvec_0_67:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_68:
	setx 0x39e7dd271ca60a6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 166: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_69:
	setx 0x527b2f74dc019231, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcd27e001  ! 168: STF_I	st	%f6, [0x0001, %r31]
intveclr_0_70:
	set 0x18960d1f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 169: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcc1fc000  ! 170: LDD_R	ldd	[%r31 + %r0], %r6
splash_cmpr_0_71:
	setx 0xf00123a6cda61076, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 171: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81460000  ! 172: RD_STICK_REG	stbar
	.word 0x99902004  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_72)) -> intp(0,0,12)
intvec_0_72:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 175: LDX_R	ldx	[%r31 + %r0], %r6
tagged_0_73:
	taddcctv %r3, 0x17c4, %r16
	.word 0xcc07e001  ! 176: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x30800001  ! 177: BA	ba,a	<label_0x1>
	.word 0x8b500000  ! 178: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x93902004  ! 179: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x20800001  ! 180: BN	bn,a	<label_0x1>
	.word 0x30700001  ! 181: BPA	<illegal instruction>
mondo_0_74:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d920009  ! 182: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b6001  ! 183: SDIVX_I	sdivx	%r13, 0x0001, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 184: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8d903fc8  ! 185: WRPR_PSTATE_I	wrpr	%r0, 0x1fc8, %pstate
splash_tba_0_76:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 186: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x36800001  ! 187: BGE	bge,a	<label_0x1>
	.word 0xa1902001  ! 188: WRPR_GL_I	wrpr	%r0, 0x0001, %-
tagged_0_77:
	taddcctv %r10, 0x166c, %r6
	.word 0xd607e001  ! 189: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd61fe001  ! 190: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x8d903779  ! 191: WRPR_PSTATE_I	wrpr	%r0, 0x1779, %pstate
	.word 0xd6bfc029  ! 192: STDA_R	stda	%r11, [%r31 + %r9] 0x01
	.word 0xd69fe001  ! 193: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 195: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_78:
	mov 8, %r18
	.word 0xd0f00852  ! 196: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xd6dfe000  ! 197: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
intveclr_0_79:
	set 0xa4d49918, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_80:
	setx 0xdc97e9e0dac3284d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 199: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 201: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902003  ! 202: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_0_81:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 203: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 204: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_0_82:
	setx 0xd1c72b2678bc1e65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 205: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0x60b8f5b8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_84:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 207: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902ead  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x0ead, %pstate
	.word 0x3c800001  ! 209: BPOS	bpos,a	<label_0x1>
intveclr_0_85:
	set 0xc2ab4750, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 210: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_86:
	tsubcctv %r17, 0x1ce7, %r3
	.word 0xd607e001  ! 211: LDUW_I	lduw	[%r31 + 0x0001], %r11
splash_cmpr_0_87:
	setx 0x6d1ac6be5ddcfa3b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 212: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_88)) -> intp(0,0,10)
intvec_0_88:
	.word 0x39400001  ! 213: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01964  ! 214: FqTOd	dis not found

	.word 0xa1902004  ! 215: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93d02032  ! 216: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87802089  ! 217: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_0_90:
	setx 0x932e9eb681b7fb1c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 218: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x33d70991, %r28
	stxa %r28, [%g0] 0x73
intvec_0_91:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 220: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_92:
	mov 0x38, %r18
	.word 0xfef00b12  ! 221: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903256  ! 222: WRPR_PSTATE_I	wrpr	%r0, 0x1256, %pstate
mondo_0_93:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d928012  ! 223: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
splash_lsu_0_94:
	setx 0x2b635c62baa28d6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 224: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 225: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa1902002  ! 226: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe48008a0  ! 227: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93d02035  ! 228: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_0_95:
	setx 0xd51f7adfa0bc47dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 229: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 230: LDX_R	ldx	[%r31 + %r0], %r18
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 231: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982d8e  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
DS_0_96:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xff761c1c	! Random illegal ?
	.word 0xe1148003  ! 1: LDQF_R	-	[%r18, %r3], %f16
	.word 0x85a2082d  ! 233: FADDs	fadds	%f8, %f13, %f2
	.word 0xc4c7e020  ! 234: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
splash_cmpr_0_97:
	setx 0xa7a88c0072acdbcf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc53fe001  ! 237: STDF_I	std	%f2, [0x0001, %r31]
	.word 0x91d020b3  ! 238: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_lsu_0_98:
	setx 0xb75deb6470287aad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 239: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc47fe001  ! 240: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x8a824006  ! 241: ADDcc_R	addcc 	%r9, %r6, %r5
	.word 0x91d02032  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xca1fe001  ! 243: LDD_I	ldd	[%r31 + 0x0001], %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_99)) -> intp(0,1,3)
xir_0_99:
	.word 0xa982e001  ! 244: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 245: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a409a3  ! 246: FDIVs	fdivs	%f16, %f3, %f18
	.word 0xe43fc003  ! 247: STD_R	std	%r18, [%r31 + %r3]
splash_cmpr_0_100:
	setx 0x4f2419c19a694d36, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe4d00e80  ! 249: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
	.word 0xe49004a0  ! 250: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0xe42fc003  ! 251: STB_R	stb	%r18, [%r31 + %r3]
	.word 0x87902097  ! 252: WRPR_TT_I	wrpr	%r0, 0x0097, %tt
	.word 0xe527e001  ! 253: STF_I	st	%f18, [0x0001, %r31]
	.word 0x87802055  ! 254: WRASI_I	wr	%r0, 0x0055, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 255: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_101:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d92c004  ! 256: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0xe49fc020  ! 257: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
splash_htba_0_102:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 258: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_103)) -> intp(0,1,3)
xir_0_103:
	.word 0xa9826001  ! 259: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
debug_0_104:
	mov 0x38, %r18
	.word 0xfef00b12  ! 260: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_105:
	mov 8, %r18
	.word 0xe8f00852  ! 262: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xe477c004  ! 263: STX_R	stx	%r18, [%r31 + %r4]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_106)) -> intp(0,1,3)
xir_0_106:
	.word 0xa9822001  ! 264: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0x87902215  ! 265: WRPR_TT_I	wrpr	%r0, 0x0215, %tt
	.word 0x8d90367b  ! 266: WRPR_PSTATE_I	wrpr	%r0, 0x167b, %pstate
	set 0xe283d334, %r28
	stxa %r28, [%g0] 0x73
intvec_0_107:
	.word 0x39400001  ! 267: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_108)) -> intp(0,0,7)
intvec_0_108:
	.word 0x39400001  ! 268: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe45fe001  ! 269: LDX_I	ldx	[%r31 + 0x0001], %r18
DS_0_109:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd110c003  ! 1: LDQF_R	-	[%r3, %r3], %f8
	.word 0x99a14824  ! 270: FADDs	fadds	%f5, %f4, %f12
splash_htba_0_110:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 271: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_111:
	setx 0xebdb0be84db29b29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 272: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_112:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xe16ae49f	! Random illegal ?
	.word 0x8da00540  ! 1: FSQRTd	fsqrt	
	.word 0xa3a50830  ! 273: FADDs	fadds	%f20, %f16, %f17
	.word 0xe28804a0  ! 274: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	set 0xe9d080df, %r28
	stxa %r28, [%g0] 0x73
intvec_0_113:
	.word 0x39400001  ! 275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2cfe020  ! 276: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0x26800001  ! 277: BL	bl,a	<label_0x1>
	.word 0x2e800001  ! 278: BVS	bvs,a	<label_0x1>
	.word 0xe21fe001  ! 279: LDD_I	ldd	[%r31 + 0x0001], %r17
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_114:
	setx 0x6bbb1253a36f2f2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_115:
	setx 0xe1ad50c4bba07f21, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 283: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe397e001  ! 284: LDQFA_I	-	[%r31, 0x0001], %f17
	.word 0xe23fe001  ! 285: STD_I	std	%r17, [%r31 + 0x0001]
debug_0_116:
	mov 0x38, %r18
	.word 0xfef00b12  ! 286: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_117:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d90800a  ! 287: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
	.word 0xe31fc000  ! 288: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0x8b540000  ! 289: RDPR_GL	rdpr	%-, %r5
intveclr_0_118:
	set 0x5412476a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_0_119:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 292: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0xca1fe001  ! 293: LDD_I	ldd	[%r31 + 0x0001], %r5
debug_0_120:
	mov 8, %r18
	.word 0xe8f00852  ! 294: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xca0fc000  ! 295: LDUB_R	ldub	[%r31 + %r0], %r5
tagged_0_121:
	taddcctv %r8, 0x1ea8, %r24
	.word 0xca07e001  ! 296: LDUW_I	lduw	[%r31 + 0x0001], %r5
splash_htba_0_122:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 297: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9036c7  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x16c7, %pstate
	.word 0x93902002  ! 299: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	set 0x9fe03efb, %r28
	stxa %r28, [%g0] 0x73
intvec_0_123:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_124:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f18, %f30
	.word 0x95b2c306  ! 301: ALIGNADDRESS	alignaddr	%r11, %r6, %r10
	.word 0x87802004  ! 302: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_125:
	setx 0x6f25c196c3ae6f80, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4900e40  ! 304: LDUHA_R	lduha	[%r0, %r0] 0x72, %r10
change_to_randtl_0_126:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_126:
	.word 0x8f902000  ! 305: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd537c006  ! 306: STQF_R	-	%f10, [%r6, %r31]
	.word 0xa1902009  ! 307: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa984c011  ! 308: WR_SET_SOFTINT_R	wr	%r19, %r17, %set_softint
intveclr_0_127:
	set 0x71915c6f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 310: BPGE	<illegal instruction>
intveclr_0_128:
	set 0x6b0a4496, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 312: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x93902002  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 314: LDX_R	ldx	[%r31 + %r0], %r10
splash_cmpr_0_130:
	setx 0x1952bb93b1b5f3d8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 315: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902005  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd4c804a0  ! 317: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91926001  ! 318: WRPR_PIL_I	wrpr	%r9, 0x0001, %pil
	.word 0x2e800001  ! 319: BVS	bvs,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 320: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f18, %f26
	.word 0xa5b50312  ! 321: ALIGNADDRESS	alignaddr	%r20, %r18, %r18
	.word 0x89520000  ! 322: RDPR_PIL	rdpr	%pil, %r4
	.word 0xc857e001  ! 323: LDSH_I	ldsh	[%r31 + 0x0001], %r4
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_132)) -> intp(0,0,13)
intvec_0_132:
	.word 0x39400001  ! 324: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 325: LDX_R	ldx	[%r31 + %r0], %r4
	set 0x9cf6573c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_133:
	.word 0x39400001  ! 326: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc88fe010  ! 327: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r4
	.word 0xc88008a0  ! 328: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_134)) -> intp(0,1,3)
xir_0_134:
	.word 0xa9806001  ! 329: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	set 0x7993df55, %r28
	stxa %r28, [%g0] 0x73
intvec_0_135:
	.word 0x39400001  ! 330: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 331: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_0_136:
	setx 0x5f28a43d21e157e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 332: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_137:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d914012  ! 333: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_138)) -> intp(0,1,3)
xir_0_138:
	.word 0xa9852001  ! 334: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
DS_0_139:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 336: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_140)) -> intp(0,0,0)
intvec_0_140:
	.word 0x39400001  ! 337: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc857c000  ! 338: LDSH_R	ldsh	[%r31 + %r0], %r4
debug_0_141:
	mov 8, %r18
	.word 0xe4f00852  ! 339: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xc8d004a0  ! 340: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x2c700001  ! 341: BPNEG	<illegal instruction>
	.word 0x91d02035  ! 342: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_142:
	setx debug_0_142 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 343: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_143:
	set 0xa48fd9fa, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_144:
	set 0x83ed6efb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 345: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_145:
	setx 0xfad8fa2de377b22b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 346: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91912001  ! 347: WRPR_PIL_I	wrpr	%r4, 0x0001, %pil
	.word 0x8790208c  ! 348: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
tagged_0_146:
	tsubcctv %r20, 0x19bd, %r6
	.word 0xc807e001  ! 349: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc84fc000  ! 350: LDSB_R	ldsb	[%r31 + %r0], %r4
	.word 0x87802004  ! 351: WRASI_I	wr	%r0, 0x0004, %asi
	set 0x80d83a94, %r28
	stxa %r28, [%g0] 0x73
intvec_0_147:
	.word 0x39400001  ! 352: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_148:
	setx 0x4267bccd58b34747, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 353: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_149:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 354: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87902352  ! 355: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0xc89fc020  ! 356: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x91d020b3  ! 357: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91902001  ! 358: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
	.word 0x87802014  ! 359: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x85450000  ! 360: RD_SET_SOFTINT	rd	%set_softint, %r2
	.word 0xa190200e  ! 361: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902101  ! 363: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
	.word 0x93902000  ! 364: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 365: LDX_R	ldx	[%r31 + %r0], %r2
splash_cmpr_0_150:
	setx 0x23ebda58b4854b99, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc4c004a0  ! 367: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
splash_lsu_0_151:
	setx 0xf3910776aa8806a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 368: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_152:
	mov 0x38, %r18
	.word 0xfef00b12  ! 369: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 370: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_153:
	mov 8, %r18
	.word 0xdef00852  ! 371: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8d903ac1  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x1ac1, %pstate
intveclr_0_154:
	set 0xd6d16d6e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_155:
	mov 0x38, %r18
	.word 0xfef00b12  ! 374: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc4d80e80  ! 375: LDXA_R	ldxa	[%r0, %r0] 0x74, %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_156)) -> intp(0,0,19)
intvec_0_156:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_157:
	taddcctv %r24, 0x18bb, %r25
	.word 0xc407e001  ! 377: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x32700001  ! 378: BPNE	<illegal instruction>
intveclr_0_158:
	set 0x4f6646d8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2a800001  ! 380: BCS	bcs,a	<label_0x1>
DS_0_159:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5318003  ! 1: STQF_R	-	%f18, [%r3, %r6]
	normalw
	.word 0x85458000  ! 381: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8790235e  ! 382: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
	.word 0x2e800001  ! 383: BVS	bvs,a	<label_0x1>
mondo_0_160:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948006  ! 384: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0xc4d804a0  ! 385: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xc51fc000  ! 386: LDDF_R	ldd	[%r31, %r0], %f2
	.word 0x81460000  ! 387: RD_STICK_REG	stbar
	.word 0x87902094  ! 388: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
	.word 0x87802089  ! 389: WRASI_I	wr	%r0, 0x0089, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 390: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa984c007  ! 391: WR_SET_SOFTINT_R	wr	%r19, %r7, %set_softint
splash_cmpr_0_161:
	setx 0x8f88bb57957d4cf5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 393: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902210  ! 394: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 395: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_162:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_163:
	setx 0xb55d31617b150f0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 397: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc43fc007  ! 398: STD_R	std	%r2, [%r31 + %r7]
DS_0_164:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xd948eb24	! Random illegal ?
	.word 0x8fa00550  ! 1: FSQRTd	fsqrt	
	.word 0x9ba28822  ! 399: FADDs	fadds	%f10, %f2, %f13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802063  ! 401: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x99902004  ! 402: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xda8008a0  ! 403: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 404: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37c002  ! 405: STQF_R	-	%f13, [%r2, %r31]
	.word 0xdb1fe001  ! 406: LDDF_I	ldd	[%r31, 0x0001], %f13
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_165)) -> intp(0,1,3)
xir_0_165:
	.word 0xa9836001  ! 407: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x87802020  ! 408: WRASI_I	wr	%r0, 0x0020, %asi
intveclr_0_166:
	set 0xae299799, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 409: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_167:
	setx 0xfa1925da6a19ec16, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 410: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda8fe010  ! 411: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0x93902001  ! 412: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902488  ! 413: WRPR_PSTATE_I	wrpr	%r0, 0x0488, %pstate
	.word 0x81460000  ! 414: RD_STICK_REG	stbar
	.word 0xda9fc020  ! 415: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xdad7e030  ! 416: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x879023a7  ! 417: WRPR_TT_I	wrpr	%r0, 0x03a7, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 418: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x30800001  ! 419: BA	ba,a	<label_0x1>
	.word 0x91d02033  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 421: SIR	sir	0x0001
	.word 0xda8008a0  ! 422: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_168)) -> intp(0,0,16)
intvec_0_168:
	.word 0x39400001  ! 423: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda97e000  ! 424: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0xda47e001  ! 425: LDSW_I	ldsw	[%r31 + 0x0001], %r13
debug_0_169:
	setx debug_0_169 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 426: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8b520000  ! 427: RDPR_PIL	rdpr	%pil, %r5
	.word 0xcb17c000  ! 428: LDQF_R	-	[%r31, %r0], %f5
tagged_0_170:
	tsubcctv %r18, 0x17c1, %r3
	.word 0xca07e001  ! 429: LDUW_I	lduw	[%r31 + 0x0001], %r5
intveclr_0_171:
	set 0x91a16260, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 430: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_172:
	tsubcctv %r14, 0x1098, %r10
	.word 0xca07e001  ! 431: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xa190200e  ! 432: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81510000  ! 433: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_0_173:
	setx 0x5d43c7c30f80871b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 434: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_174:
	tsubcctv %r10, 0x1795, %r5
	.word 0xca07e001  ! 435: LDUW_I	lduw	[%r31 + 0x0001], %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 436: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x8d9026e3  ! 437: WRPR_PSTATE_I	wrpr	%r0, 0x06e3, %pstate
mondo_0_175:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d94c012  ! 438: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
DS_0_176:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xc3650e7f	! Random illegal ?
	.word 0xc7148003  ! 1: LDQF_R	-	[%r18, %r3], %f3
	.word 0x87a40834  ! 439: FADDs	fadds	%f16, %f20, %f3
DS_0_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 440: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9f802001  ! 441: SIR	sir	0x0001
DS_0_178:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 442: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_cmpr_0_179:
	setx 0xf3671bf21023a8bf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 443: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_180:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d934006  ! 444: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0xc68008a0  ! 445: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_cmpr_0_181:
	setx 0x027406da6be23ff6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 446: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc657c000  ! 447: LDSH_R	ldsh	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_182)) -> intp(0,0,0)
intvec_0_182:
	.word 0x39400001  ! 448: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_183:
	mov 8, %r18
	.word 0xdef00852  ! 449: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_0_184:
	setx debug_0_184 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 450: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_185:
	mov 0x38, %r18
	.word 0xfef00b12  ! 451: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903468  ! 452: WRPR_PSTATE_I	wrpr	%r0, 0x1468, %pstate
	.word 0x93902001  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9020ff  ! 454: WRPR_PSTATE_I	wrpr	%r0, 0x00ff, %pstate
	.word 0xc71fc000  ! 455: LDDF_R	ldd	[%r31, %r0], %f3
debug_0_186:
	mov 8, %r18
	.word 0xd2f00852  ! 456: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
intveclr_0_187:
	set 0xf3c1329, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 457: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 458: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d9024c6  ! 459: WRPR_PSTATE_I	wrpr	%r0, 0x04c6, %pstate
debug_0_188:
	mov 0x38, %r18
	.word 0xfef00b12  ! 460: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790233f  ! 461: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0xc737c006  ! 462: STQF_R	-	%f3, [%r6, %r31]
DS_0_189:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x87b08313  ! 463: ALIGNADDRESS	alignaddr	%r2, %r19, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_190)) -> intp(0,1,3)
xir_0_190:
	.word 0xa9846001  ! 464: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xc71fe001  ! 465: LDDF_I	ldd	[%r31, 0x0001], %f3
	.word 0xc6d00e80  ! 466: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	.word 0xc69fe001  ! 467: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x8b450000  ! 468: RD_SET_SOFTINT	rd	%set_softint, %r5
	.word 0xa190200f  ! 469: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_0_191:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f16, %f26
	.word 0xa5b00314  ! 470: ALIGNADDRESS	alignaddr	%r0, %r20, %r18
	ta	T_CHANGE_PRIV	! macro
splash_lsu_0_192:
	setx 0x94d72e609cff81bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 472: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_193:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94c008  ! 473: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x93d020b3  ! 474: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x81510000  ! 475: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe597e001  ! 476: LDQFA_I	-	[%r31, 0x0001], %f18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_194)) -> intp(0,0,9)
intvec_0_194:
	.word 0x39400001  ! 477: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_195:
	mov 8, %r18
	.word 0xdcf00852  ! 478: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_0_196:
	setx debug_0_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 479: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 480: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x81982086  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0xe40fe001  ! 482: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0x93902000  ! 483: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe41fc000  ! 484: LDD_R	ldd	[%r31 + %r0], %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x81460000  ! 486: RD_STICK_REG	stbar
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 487: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x91d02033  ! 488: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8e816001  ! 489: ADDcc_I	addcc 	%r5, 0x0001, %r7
	.word 0x8d90300c  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x100c, %pstate
	.word 0x91d02034  ! 491: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xce8008a0  ! 492: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802080  ! 493: WRASI_I	wr	%r0, 0x0080, %asi
splash_lsu_0_197:
	setx 0x752482f3af333f29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_198:
	mov 8, %r18
	.word 0xe4f00852  ! 495: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xa1902004  ! 496: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xce800ae0  ! 497: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
debug_0_199:
	setx debug_0_199 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 498: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_200)) -> intp(0,1,3)
xir_0_200:
	.word 0xa982e001  ! 499: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x879022f9  ! 500: WRPR_TT_I	wrpr	%r0, 0x02f9, %tt
mondo_0_201:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94000c  ! 501: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0x91d02033  ! 502: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 503: WRPR_GL_I	wrpr	%r0, 0x0005, %-
debug_0_202:
	setx debug_0_202 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 504: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xce97e030  ! 505: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0xced00e40  ! 506: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r7
	.word 0xce47e001  ! 507: LDSW_I	ldsw	[%r31 + 0x0001], %r7
debug_0_203:
	mov 0x38, %r18
	.word 0xfef00b12  ! 508: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_204:
	setx 0xda2231b82843db32, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 509: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa480a001  ! 510: ADDcc_I	addcc 	%r2, 0x0001, %r18
	.word 0x93902007  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_0_205:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 512: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_0_206:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_206:
	.word 0x8f902001  ! 513: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe49fc020  ! 514: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
debug_0_207:
	mov 8, %r18
	.word 0xd6f00852  ! 515: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_cmpr_0_208:
	setx 0x0b7d0fbf23e59c08, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 516: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790227d  ! 517: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 518: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9035c0  ! 519: WRPR_PSTATE_I	wrpr	%r0, 0x15c0, %pstate
tagged_0_209:
	taddcctv %r13, 0x1f05, %r17
	.word 0xe407e001  ! 520: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879023a4  ! 521: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0xa1902001  ! 522: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe47fe001  ! 523: SWAP_I	swap	%r18, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_210)) -> intp(0,0,3)
intvec_0_210:
	.word 0x39400001  ! 524: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_211:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 525: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
debug_0_212:
	mov 0x38, %r18
	.word 0xfef00b12  ! 526: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_213:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 527: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_214)) -> intp(0,0,30)
intvec_0_214:
	.word 0x39400001  ! 528: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_215:
	setx 0x28ea609106e342ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 529: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe41fe001  ! 530: LDD_I	ldd	[%r31 + 0x0001], %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_216)) -> intp(0,1,3)
xir_0_216:
	.word 0xa9802001  ! 531: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
debug_0_217:
	setx debug_0_217 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 532: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 533: WRASI_I	wr	%r0, 0x0089, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_218)) -> intp(0,0,19)
intvec_0_218:
	.word 0x39400001  ! 534: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 535: BPGE	<illegal instruction>
splash_lsu_0_219:
	setx 0x2765e6d9e79dfd8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 536: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_220:
	setx debug_0_220 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 537: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780201c  ! 538: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x91d02035  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe597e001  ! 540: LDQFA_I	-	[%r31, 0x0001], %f18
	.word 0x87802080  ! 541: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_221:
	mov 0x38, %r18
	.word 0xfef00b12  ! 542: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 543: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_222)) -> intp(0,0,9)
intvec_0_222:
	.word 0x39400001  ! 544: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_223:
	setx debug_0_223 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 545: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 546: SAVE_R	save	%r31, %r0, %r31
	.word 0x81a149c6  ! 547: FDIVd	fdivd	%f36, %f6, %f0
	.word 0xc0c804a0  ! 548: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xc11fe001  ! 549: LDDF_I	ldd	[%r31, 0x0001], %f0
	.word 0x8d802000  ! 550: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89480000  ! 551: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 552: LDX_R	ldx	[%r31 + %r0], %r4
debug_0_225:
	mov 8, %r18
	.word 0xd0f00852  ! 553: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xc8800a60  ! 554: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r4
	.word 0x8d802000  ! 555: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90263c  ! 556: WRPR_PSTATE_I	wrpr	%r0, 0x063c, %pstate
	.word 0x87802089  ! 557: WRASI_I	wr	%r0, 0x0089, %asi
intveclr_0_226:
	set 0x390e7a8d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 558: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 559: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc81fc000  ! 560: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc8c80e40  ! 561: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
debug_0_227:
	mov 0x38, %r18
	.word 0xfef00b12  ! 562: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc8c7e000  ! 563: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0x83d020b2  ! 564: Tcc_I	te	icc_or_xcc, %r0 + 178
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 565: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0_228:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb14309  ! 566: ALIGNADDRESS	alignaddr	%r5, %r9, %r7
splash_cmpr_0_229:
	setx 0x33e9ae88e33aa6ce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 567: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce9004a0  ! 568: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xa1902007  ! 569: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_0_230:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 570: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 571: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_231)) -> intp(0,1,3)
xir_0_231:
	.word 0xa9806001  ! 572: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0xce8fe030  ! 573: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r7
	.word 0xce8008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x3a700001  ! 575: BPCC	<illegal instruction>
	.word 0xce8008a0  ! 576: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa168800a  ! 577: SDIVX_R	sdivx	%r2, %r10, %r16
	.word 0x8d9037a5  ! 578: WRPR_PSTATE_I	wrpr	%r0, 0x17a5, %pstate
splash_lsu_0_232:
	setx 0xaf7a729570ccf185, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 579: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 580: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_233)) -> intp(0,1,3)
xir_0_233:
	.word 0xa9832001  ! 581: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xe0d7e000  ! 582: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
tagged_0_234:
	tsubcctv %r26, 0x1566, %r14
	.word 0xe007e001  ! 583: LDUW_I	lduw	[%r31 + 0x0001], %r16
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 584: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0_235:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 585: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_236)) -> intp(0,0,1)
intvec_0_236:
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_237:
	setx 0xec5c6da6e6e30a0d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 587: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe047c000  ! 588: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0xa1902007  ! 589: WRPR_GL_I	wrpr	%r0, 0x0007, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_238)) -> intp(0,1,3)
xir_0_238:
	.word 0xa982e001  ! 590: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	set 0x85c2a208, %r28
	stxa %r28, [%g0] 0x73
intvec_0_239:
	.word 0x39400001  ! 591: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902890  ! 592: WRPR_PSTATE_I	wrpr	%r0, 0x0890, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_240)) -> intp(0,1,3)
xir_0_240:
	.word 0xa9832001  ! 593: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xa9450000  ! 594: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xa9520000  ! 595: RDPR_PIL	<illegal instruction>
	set 0x763e9600, %r28
	stxa %r28, [%g0] 0x73
intvec_0_241:
	.word 0x39400001  ! 596: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe020  ! 597: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
	.word 0xa1902008  ! 598: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe917c000  ! 599: LDQF_R	-	[%r31, %r0], %f20
	.word 0x93902001  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe997e001  ! 601: LDQFA_I	-	[%r31, 0x0001], %f20
	.word 0x8d903655  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x1655, %pstate
splash_htba_0_242:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 603: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	set 0xe82a36a3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_243:
	.word 0x39400001  ! 604: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_244:
	setx debug_0_244 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 605: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9b454000  ! 606: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
debug_0_245:
	mov 0x38, %r18
	.word 0xfef00b12  ! 607: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_246:
	setx 0xaabddac63dfe6996, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 608: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda9004a0  ! 609: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x879022a4  ! 610: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
	.word 0x87802058  ! 611: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x81460000  ! 612: RD_STICK_REG	stbar
	.word 0x8d90205d  ! 613: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16d2001  ! 614: SDIVX_I	sdivx	%r20, 0x0001, %r16
intveclr_0_248:
	set 0x96790c4d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 615: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 616: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_249:
	mov 8, %r18
	.word 0xd4f00852  ! 617: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
change_to_randtl_0_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_250:
	.word 0x8f902001  ! 618: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe0c804a0  ! 619: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
splash_lsu_0_251:
	setx 0xdca49a160203f103, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 620: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_252:
	set 0xcaf81d96, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 621: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_253:
	set 0x51494ca, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 622: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_254:
	mov 0x38, %r18
	.word 0xfef00b12  ! 623: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0c00e60  ! 624: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r16
splash_cmpr_0_255:
	setx 0x14bdb30ced21ae34, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 625: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe117c000  ! 626: LDQF_R	-	[%r31, %r0], %f16
debug_0_256:
	setx debug_0_256 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 627: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d020b5  ! 628: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x8d9031ec  ! 629: WRPR_PSTATE_I	wrpr	%r0, 0x11ec, %pstate
	.word 0x81480000  ! 630: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
tagged_0_257:
	taddcctv %r17, 0x14fe, %r1
	.word 0xc007e001  ! 631: LDUW_I	lduw	[%r31 + 0x0001], %r0
splash_lsu_0_258:
	setx 0x7f9ea1e172527905, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 632: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc0cfe000  ! 633: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
splash_cmpr_0_259:
	setx 0x31a50635ab08c86c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 634: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 635: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc08008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x20800001  ! 637: BN	bn,a	<label_0x1>
	.word 0xa1902000  ! 638: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc0c804a0  ! 639: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_260)) -> intp(0,0,20)
intvec_0_260:
	.word 0x39400001  ! 640: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_261:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d914002  ! 641: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	.word 0xc08008a0  ! 642: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x3e800001  ! 643: BVC	bvc,a	<label_0x1>
	.word 0x93902005  ! 644: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_262:
	setx debug_0_262 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 645: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc08008a0  ! 646: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902007  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902000  ! 648: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_0_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9114008  ! 1: LDQF_R	-	[%r5, %r8], %f12
	.word 0x83a50821  ! 649: FADDs	fadds	%f20, %f1, %f1
splash_lsu_0_264:
	setx 0x28bce0da4c0377b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 650: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_265:
	setx 0xa0c619e757f4c9ce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 651: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_266:
	setx 0x62ee6caccbe2988f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 652: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 653: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc29fe001  ! 654: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
intveclr_0_267:
	set 0x4e148e84, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 655: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
splash_lsu_0_268:
	setx 0x1d6801b9c67b24f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 657: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 658: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_269:
	mov 0x38, %r18
	.word 0xfef00b12  ! 659: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc2800a60  ! 660: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
	.word 0x8afcc002  ! 661: SDIVcc_R	sdivcc 	%r19, %r2, %r5
debug_0_270:
	mov 8, %r18
	.word 0xd2f00852  ! 662: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_271)) -> intp(0,1,3)
xir_0_271:
	.word 0xa9852001  ! 663: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_272)) -> intp(0,0,20)
intvec_0_272:
	.word 0x39400001  ! 664: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_273:
	set 0xb0308b41, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 665: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982307  ! 666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcb3fc002  ! 668: STDF_R	std	%f5, [%r2, %r31]
intveclr_0_274:
	set 0x8dae0a06, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 669: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_275:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 670: RESTORE_R	restore	%r31, %r0, %r31
debug_0_276:
	mov 8, %r18
	.word 0xe8f00852  ! 671: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xcac7e030  ! 672: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
intveclr_0_277:
	set 0x384590ea, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 673: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_278:
	setx 0xb1f648d5be5c10d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 674: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_279:
	set 0x30a78feb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_280)) -> intp(0,0,26)
intvec_0_280:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903cd3  ! 677: WRPR_PSTATE_I	wrpr	%r0, 0x1cd3, %pstate
	.word 0xca900e40  ! 678: LDUHA_R	lduha	[%r0, %r0] 0x72, %r5
	set 0x74ca4144, %r28
	stxa %r28, [%g0] 0x73
intvec_0_281:
	.word 0x39400001  ! 679: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 680: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xca8fe030  ! 681: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	.word 0x22700001  ! 682: BPE	<illegal instruction>
	.word 0xcb97e001  ! 683: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0x83454000  ! 684: RD_CLEAR_SOFTINT	rd	%clear_softint, %r1
debug_0_282:
	mov 8, %r18
	.word 0xdef00852  ! 685: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_0_283:
	setx debug_0_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 686: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_284:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xed743759	! Random illegal ?
	.word 0xe314c010  ! 1: LDQF_R	-	[%r19, %r16], %f17
	.word 0xa5a14833  ! 687: FADDs	fadds	%f5, %f19, %f18
	set 0xe379084b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_285:
	.word 0x39400001  ! 688: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89480000  ! 689: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
splash_lsu_0_286:
	setx 0x38b117cac5724c83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 690: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902009  ! 692: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_0_287:
	mov 0x38, %r18
	.word 0xfef00b12  ! 693: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_288:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_288:
	.word 0x8f902000  ! 694: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_289:
	setx debug_0_289 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 695: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc997e001  ! 696: LDQFA_I	-	[%r31, 0x0001], %f4
DS_0_290:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 697: SAVE_R	save	%r31, %r0, %r31
	.word 0xc937c013  ! 698: STQF_R	-	%f4, [%r19, %r31]
	.word 0xc81fe001  ! 699: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0xa1a409c1  ! 700: FDIVd	fdivd	%f16, %f32, %f16
	.word 0x8745c000  ! 701: RD_TICK_CMPR_REG	rd	%-, %r3
	set 0x39e43c4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_291:
	.word 0x39400001  ! 702: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xa981c013  ! 704: WR_SET_SOFTINT_R	wr	%r7, %r19, %set_softint
change_to_randtl_0_292:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_292:
	.word 0x8f902001  ! 705: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_0_293:
	taddcctv %r22, 0x1b8e, %r11
	.word 0xc607e001  ! 706: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xa1902003  ! 707: WRPR_GL_I	wrpr	%r0, 0x0003, %-
intveclr_0_294:
	set 0xc27150fb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 708: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 709: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa782a001  ! 710: WR_GRAPHICS_STATUS_REG_I	wr	%r10, 0x0001, %-
splash_lsu_0_295:
	setx 0x5b5603bb134b9dcf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 711: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 712: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93500000  ! 713: RDPR_TPC	rdpr	%tpc, %r9
	.word 0xd2cfe030  ! 714: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
mondo_0_296:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 715: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x87802080  ! 716: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902917  ! 717: WRPR_PSTATE_I	wrpr	%r0, 0x0917, %pstate
	.word 0x93902000  ! 718: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_0_297:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 719: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_298:
	setx 0x224754eb53b8fa3d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 720: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_299)) -> intp(0,1,3)
xir_0_299:
	.word 0xa9802001  ! 721: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x8f464000  ! 722: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0x99902003  ! 723: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xce4fe001  ! 724: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0xcecfe020  ! 725: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r7
	.word 0xce4fc000  ! 726: LDSB_R	ldsb	[%r31 + %r0], %r7
DS_0_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 727: RESTORE_R	restore	%r31, %r0, %r31
intveclr_0_301:
	set 0x7282e397, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 728: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_302:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_302:
	.word 0x8f902001  ! 729: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_0_303:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x87b40305  ! 730: ALIGNADDRESS	alignaddr	%r16, %r5, %r3
	.word 0xc657c000  ! 731: LDSH_R	ldsh	[%r31 + %r0], %r3
debug_0_304:
	setx debug_0_304 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 732: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_305:
	setx 0xc4fe71fffd9e60dd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 733: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 734: BPVC	<illegal instruction>
DS_0_306:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x8b5d42b1	! Random illegal ?
	.word 0xe5130005  ! 1: LDQF_R	-	[%r12, %r5], %f18
	.word 0xa5a40832  ! 735: FADDs	fadds	%f16, %f18, %f18
	set 0xbb796769, %r28
	stxa %r28, [%g0] 0x73
intvec_0_307:
	.word 0x39400001  ! 736: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_308:
	tsubcctv %r14, 0x13fb, %r6
	.word 0xe407e001  ! 737: LDUW_I	lduw	[%r31 + 0x0001], %r18
debug_0_309:
	mov 8, %r18
	.word 0xe8f00852  ! 738: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 739: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_310)) -> intp(0,0,17)
intvec_0_310:
	.word 0x39400001  ! 740: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_311:
	setx 0x3bdab74b0531606f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 741: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85520000  ! 742: RDPR_PIL	rdpr	%pil, %r2
mondo_0_312:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d908005  ! 743: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
	.word 0xc41fe001  ! 744: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 745: FqTOd	dis not found

mondo_0_314:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d918006  ! 746: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
	.word 0x93902000  ! 747: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_0_315:
	setx 0xa459f08ba3e1cf68, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 748: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x28800001  ! 749: BLEU	bleu,a	<label_0x1>
	.word 0xd097e010  ! 750: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
debug_0_316:
	setx debug_0_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 751: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08fe010  ! 752: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd0dfe030  ! 753: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0x91d02033  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd0dfe000  ! 755: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
intveclr_0_317:
	set 0x2f8e30a0, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 756: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd047e001  ! 757: LDSW_I	ldsw	[%r31 + 0x0001], %r8
debug_0_318:
	mov 8, %r18
	.word 0xd6f00852  ! 758: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
DS_0_319:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f22, %f8, %f2
	.word 0xa1b1c314  ! 759: ALIGNADDRESS	alignaddr	%r7, %r20, %r16
	.word 0xa1902003  ! 760: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_0_320:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 761: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xa7454000  ! 762: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x81982355  ! 763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0xe6800a60  ! 764: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0xe69fc020  ! 765: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0xa190200c  ! 766: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_0_321:
	mov 8, %r18
	.word 0xdef00852  ! 767: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_322)) -> intp(0,0,9)
intvec_0_322:
	.word 0x39400001  ! 768: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902203  ! 769: WRPR_TT_I	wrpr	%r0, 0x0203, %tt
	.word 0x87802004  ! 770: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_323:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 771: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
DS_0_324:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 772: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe6c804a0  ! 773: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
tagged_0_325:
	taddcctv %r19, 0x16cf, %r3
	.word 0xe607e001  ! 774: LDUW_I	lduw	[%r31 + 0x0001], %r19
debug_0_326:
	mov 0x38, %r18
	.word 0xfef00b12  ! 775: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90373a  ! 776: WRPR_PSTATE_I	wrpr	%r0, 0x173a, %pstate
mondo_0_327:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950008  ! 777: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_328)) -> intp(0,0,23)
intvec_0_328:
	.word 0x39400001  ! 778: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_329)) -> intp(0,1,3)
xir_0_329:
	.word 0xa981a001  ! 779: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01968  ! 780: FqTOd	dis not found

	.word 0x87802004  ! 781: WRASI_I	wr	%r0, 0x0004, %asi
	set 0xfef02076, %r28
	stxa %r28, [%g0] 0x73
intvec_0_331:
	.word 0x39400001  ! 782: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_332:
	setx 0x7e14af7476994b74, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 783: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_333:
	set 0xca813f0f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 784: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_334)) -> intp(0,0,0)
intvec_0_334:
	.word 0x39400001  ! 785: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b540000  ! 786: RDPR_GL	rdpr	%-, %r13
DS_0_335:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5312001  ! 1: STQF_I	-	%f10, [0x0001, %r4]
	normalw
	.word 0x8d458000  ! 787: RD_SOFTINT_REG	rd	%softint, %r6
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 788: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903228  ! 789: WRPR_PSTATE_I	wrpr	%r0, 0x1228, %pstate
	.word 0x97464000  ! 790: RD_STICK_CMPR_REG	rd	%-, %r11
debug_0_336:
	mov 8, %r18
	.word 0xd2f00852  ! 791: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	set 0xbbd4144d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_337:
	.word 0x39400001  ! 792: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_338:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d918009  ! 793: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0xd607c000  ! 794: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x8790206c  ! 795: WRPR_TT_I	wrpr	%r0, 0x006c, %tt
mondo_0_339:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92c014  ! 796: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56ae001  ! 797: SDIVX_I	sdivx	%r11, 0x0001, %r18
	ta	T_CHANGE_HPRIV	! macro
	set 0x9879361, %r28
	stxa %r28, [%g0] 0x73
intvec_0_341:
	.word 0x39400001  ! 799: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_342:
	setx 0x387a22608d7d44d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 800: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 801: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
intveclr_0_343:
	set 0x251bf4c8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 802: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_344:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d924010  ! 803: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
tagged_0_345:
	taddcctv %r25, 0x1f0e, %r9
	.word 0xd407e001  ! 804: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x91d020b3  ! 805: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x2a800001  ! 806: BCS	bcs,a	<label_0x1>
	.word 0xd48008a0  ! 807: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_cmpr_0_346:
	setx 0x2381ede3f7119d42, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 808: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 809: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 811: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd49fc020  ! 812: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_cmpr_0_347:
	setx 0x5c541e447319a838, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 813: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_348)) -> intp(0,0,0)
intvec_0_348:
	.word 0x39400001  ! 814: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 815: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 816: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93902001  ! 817: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd48008a0  ! 818: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
tagged_0_349:
	taddcctv %r4, 0x1f7f, %r7
	.word 0xd407e001  ! 819: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xa7520000  ! 820: RDPR_PIL	rdpr	%pil, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 821: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6dfe000  ! 822: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
	.word 0x8d902c11  ! 823: WRPR_PSTATE_I	wrpr	%r0, 0x0c11, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 824: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_0_350:
	setx 0x2b068741164c0e2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 825: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790220b  ! 826: WRPR_TT_I	wrpr	%r0, 0x020b, %tt
splash_cmpr_0_351:
	setx 0x96c86cd7cd879301, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 827: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_352:
	tsubcctv %r9, 0x11d8, %r19
	.word 0xe607e001  ! 828: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe71fe001  ! 829: LDDF_I	ldd	[%r31, 0x0001], %f19
intveclr_0_353:
	set 0x2373a792, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 830: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 831: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe6bfe001  ! 832: STDA_I	stda	%r19, [%r31 + 0x0001] %asi
	.word 0xe69fc020  ! 833: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x99902004  ! 834: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xe6c7e000  ! 835: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
	.word 0xe63fc010  ! 836: STD_R	std	%r19, [%r31 + %r16]
	.word 0xa190200e  ! 837: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8790202a  ! 838: WRPR_TT_I	wrpr	%r0, 0x002a, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 839: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_354:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc131e001  ! 1: STQF_I	-	%f0, [0x0001, %r7]
	normalw
	.word 0x9b458000  ! 840: RD_SOFTINT_REG	rd	%softint, %r13
	set 0xdf75f6a0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_355:
	.word 0x39400001  ! 841: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 842: BPNEG	<illegal instruction>
	.word 0xda8804a0  ! 843: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_356)) -> intp(0,1,3)
xir_0_356:
	.word 0xa9852001  ! 844: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	set 0x80e1ce87, %r28
	stxa %r28, [%g0] 0x73
intvec_0_357:
	.word 0x39400001  ! 845: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xdb27c010  ! 846: STF_R	st	%f13, [%r16, %r31]
splash_cmpr_0_358:
	setx 0x7cf7c388378e6b11, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 847: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 848: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_359:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 849: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
debug_0_360:
	mov 8, %r18
	.word 0xe2f00852  ! 850: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x26700001  ! 851: BPL	<illegal instruction>
tagged_0_361:
	taddcctv %r17, 0x12e0, %r16
	.word 0xda07e001  ! 852: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda1fc000  ! 853: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x91d02033  ! 854: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_0_362:
	tsubcctv %r18, 0x15b3, %r7
	.word 0xda07e001  ! 855: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_lsu_0_363:
	setx 0x056c5cb21386e725, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 856: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 857: RDPR_GL	rdpr	%-, %r9
	.word 0x8d9023df  ! 858: WRPR_PSTATE_I	wrpr	%r0, 0x03df, %pstate
splash_lsu_0_364:
	setx 0x2f3a63175dfe01d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 859: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 860: Tcc_I	ta	icc_or_xcc, %r0 + 179
	set 0x2a6bc13c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_365:
	.word 0x39400001  ! 861: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd31fe001  ! 862: LDDF_I	ldd	[%r31, 0x0001], %f9
debug_0_366:
	mov 8, %r18
	.word 0xdef00852  ! 863: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d6c2001  ! 864: SDIVX_I	sdivx	%r16, 0x0001, %r6
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_368)) -> intp(0,0,30)
intvec_0_368:
	.word 0x39400001  ! 865: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xccffc026  ! 866: SWAPA_R	swapa	%r6, [%r31 + %r6] 0x01
debug_0_369:
	mov 8, %r18
	.word 0xd2f00852  ! 867: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_0_370:
	setx debug_0_370 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 868: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_371:
	mov 0x38, %r18
	.word 0xfef00b12  ! 869: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_372:
	mov 8, %r18
	.word 0xdcf00852  ! 870: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x36700001  ! 871: BPGE	<illegal instruction>
	.word 0x93902004  ! 872: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902fb2  ! 873: WRPR_PSTATE_I	wrpr	%r0, 0x0fb2, %pstate
	.word 0x22800001  ! 874: BE	be,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_373)) -> intp(0,1,3)
xir_0_373:
	.word 0xa982a001  ! 875: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xccdfe000  ! 876: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
splash_htba_0_374:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 877: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81b48fe1  ! 878: FONES	e	%f0
	.word 0xc0cfe000  ! 879: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
DS_0_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 880: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902003  ! 881: WRPR_GL_I	wrpr	%r0, 0x0003, %-
intveclr_0_376:
	set 0xb6643518, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 882: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_377:
	mov 0x38, %r18
	.word 0xfef00b12  ! 883: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8bb00fe7  ! 884: FONES	e	%f5
debug_0_378:
	mov 8, %r18
	.word 0xd4f00852  ! 885: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 886: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcb27e001  ! 887: STF_I	st	%f5, [0x0001, %r31]
tagged_0_379:
	taddcctv %r16, 0x1621, %r20
	.word 0xca07e001  ! 888: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x87802020  ! 889: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xca4fc000  ! 890: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x87902389  ! 891: WRPR_TT_I	wrpr	%r0, 0x0389, %tt
splash_tba_0_380:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 892: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xca9fe001  ! 893: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0x91d02032  ! 894: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xca8008a0  ! 895: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x879021d1  ! 896: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	set 0x156f6360, %r28
	stxa %r28, [%g0] 0x73
intvec_0_381:
	.word 0x39400001  ! 897: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 899: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xa7500000  ! 900: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x93902002  ! 901: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_0_382:
	set 0x8eee8be8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 902: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x705ba5c9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_383:
	.word 0x39400001  ! 903: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe69fe001  ! 904: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0xe61fe001  ! 905: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0x8d903f1e  ! 906: WRPR_PSTATE_I	wrpr	%r0, 0x1f1e, %pstate
	.word 0x95464000  ! 907: RD_STICK_CMPR_REG	rd	%-, %r10
intveclr_0_384:
	set 0x59614fc3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 908: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0xe94eeb3b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_385:
	.word 0x39400001  ! 909: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c20  ! 910: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r10
DS_0_386:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 911: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 912: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 180
	set 0xf6f579c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_387:
	.word 0x39400001  ! 914: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_388:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 915: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d90318d  ! 916: WRPR_PSTATE_I	wrpr	%r0, 0x118d, %pstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 917: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1a189b4  ! 918: FDIVs	fdivs	%f6, %f20, %f16
	.word 0xe01fc000  ! 919: LDD_R	ldd	[%r31 + %r0], %r16
splash_htba_0_389:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 920: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_390:
	mov 8, %r18
	.word 0xd2f00852  ! 921: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_0_391:
	setx debug_0_391 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 922: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 923: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe027c014  ! 924: STW_R	stw	%r16, [%r31 + %r20]
	.word 0xe04fc000  ! 925: LDSB_R	ldsb	[%r31 + %r0], %r16
	.word 0xe01fc000  ! 926: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0xe0d80e80  ! 927: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
debug_0_392:
	mov 0x38, %r18
	.word 0xfef00b12  ! 928: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa5540000  ! 929: RDPR_GL	rdpr	%-, %r18
	.word 0x879023e6  ! 930: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
	.word 0x87802004  ! 931: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 932: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8d90240c  ! 933: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
	set 0xbae814dd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_393:
	.word 0x39400001  ! 934: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 935: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 936: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020d7  ! 937: WRPR_TT_I	wrpr	%r0, 0x00d7, %tt
	.word 0x81982b0e  ! 938: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
DS_0_394:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 939: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 940: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_395:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d90c007  ! 941: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
	.word 0x8790214d  ! 942: WRPR_TT_I	wrpr	%r0, 0x014d, %tt
tagged_0_396:
	tsubcctv %r17, 0x170e, %r17
	.word 0xe407e001  ! 943: LDUW_I	lduw	[%r31 + 0x0001], %r18
debug_0_397:
	setx debug_0_397 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 944: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_398:
	mov 0x38, %r18
	.word 0xfef00b12  ! 945: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x24800001  ! 946: BLE	ble,a	<label_0x1>
	.word 0x20800001  ! 947: BN	bn,a	<label_0x1>
	.word 0x9ad2e001  ! 948: UMULcc_I	umulcc 	%r11, 0x0001, %r13
	.word 0x81460000  ! 949: RD_STICK_REG	stbar
mondo_0_399:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 950: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x93d020b2  ! 951: Tcc_I	tne	icc_or_xcc, %r0 + 178
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 952: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 953: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d9037f0  ! 954: WRPR_PSTATE_I	wrpr	%r0, 0x17f0, %pstate
	.word 0x8790203c  ! 955: WRPR_TT_I	wrpr	%r0, 0x003c, %tt
intveclr_0_400:
	set 0x7e358d9c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 956: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_401:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d908009  ! 957: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0x26700001  ! 958: BPL	<illegal instruction>
debug_0_402:
	mov 8, %r18
	.word 0xe8f00852  ! 959: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x8d802000  ! 960: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902216  ! 961: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
debug_0_403:
	setx debug_0_403 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 962: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 963: SIR	sir	0x0001
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 964: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda1fe001  ! 965: LDD_I	ldd	[%r31 + 0x0001], %r13
tagged_0_404:
	tsubcctv %r12, 0x1283, %r14
	.word 0xda07e001  ! 966: LDUW_I	lduw	[%r31 + 0x0001], %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 967: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_405:
	setx 0x62fb64e3d8e522b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda800bc0  ! 969: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0xa7464000  ! 970: RD_STICK_CMPR_REG	rd	%-, %r19
tagged_0_406:
	tsubcctv %r12, 0x1219, %r26
	.word 0xe607e001  ! 971: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_lsu_0_407:
	setx 0x16bed79bd943d995, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 972: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_408:
	mov 8, %r18
	.word 0xd2f00852  ! 973: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe637e001  ! 974: STH_I	sth	%r19, [%r31 + 0x0001]
splash_lsu_0_409:
	setx 0x4273626d22f17191, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 975: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 976: LDX_R	ldx	[%r31 + %r0], %r19
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_410)) -> intp(0,0,9)
intvec_0_410:
	.word 0x39400001  ! 977: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xad852001  ! 978: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	.word 0xe6900e80  ! 979: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
	.word 0xe647e001  ! 980: LDSW_I	ldsw	[%r31 + 0x0001], %r19
debug_0_411:
	mov 8, %r18
	.word 0xdef00852  ! 981: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe68fe010  ! 982: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r19
splash_lsu_0_412:
	setx 0xf24236c9ba2fc743, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 983: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_413:
	mov 0x38, %r18
	.word 0xfef00b12  ! 984: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x85520000  ! 985: RDPR_PIL	rdpr	%pil, %r2
	.word 0xc48008a0  ! 986: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
intveclr_0_414:
	set 0x28417b74, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 987: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 988: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_415:
	setx debug_0_415 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 989: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902042  ! 990: WRPR_TT_I	wrpr	%r0, 0x0042, %tt
debug_0_416:
	mov 0x38, %r18
	.word 0xfef00b12  ! 991: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc48008a0  ! 992: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81464000  ! 994: RD_STICK_CMPR_REG	stbar
	.word 0xc03fc009  ! 995: STD_R	std	%r0, [%r31 + %r9]
	.word 0x93902006  ! 996: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_417:
	setx 0x63577465fa094185, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 997: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_418:
	setx 0xc812d381c00cc8ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 998: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_419:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94c00c  ! 999: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0x93902001  ! 1000: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02032  ! 1001: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_420:
	mov 8, %r18
	.word 0xd0f00852  ! 1002: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
mondo_0_421:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d908009  ! 1003: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
mondo_0_422:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d918007  ! 1004: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	.word 0xc04fc000  ! 1005: LDSB_R	ldsb	[%r31 + %r0], %r0
debug_0_423:
	mov 8, %r18
	.word 0xe6f00852  ! 1006: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
mondo_0_424:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d92000b  ! 1007: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xa1902009  ! 1008: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_0_425:
	setx 0x169ee421c4829043, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1009: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802001  ! 1010: SIR	sir	0x0001
change_to_randtl_0_426:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_426:
	.word 0x8f902002  ! 1011: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc0800c20  ! 1012: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r0
DS_0_427:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1013: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8198208e  ! 1014: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008e, %hpstate
	.word 0x8d903b22  ! 1015: WRPR_PSTATE_I	wrpr	%r0, 0x1b22, %pstate
	.word 0x99902000  ! 1016: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x9b480000  ! 1017: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
tagged_0_428:
	tsubcctv %r26, 0x1a23, %r3
	.word 0xda07e001  ! 1018: LDUW_I	lduw	[%r31 + 0x0001], %r13
	set 0xfdd82363, %r28
	stxa %r28, [%g0] 0x73
intvec_0_429:
	.word 0x39400001  ! 1019: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033e8  ! 1020: WRPR_PSTATE_I	wrpr	%r0, 0x13e8, %pstate
	.word 0xdb37c00b  ! 1021: STQF_R	-	%f13, [%r11, %r31]
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1022: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdb27e001  ! 1023: STF_I	st	%f13, [0x0001, %r31]
	.word 0x8d903625  ! 1024: WRPR_PSTATE_I	wrpr	%r0, 0x1625, %pstate
	.word 0x8b540000  ! 1025: RDPR_GL	rdpr	%-, %r5
	.word 0x22800001  ! 1026: BE	be,a	<label_0x1>
intveclr_0_430:
	set 0xf92fdfff, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1027: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1028: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_431:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1029: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_432:
	setx 0xc68cacafb0b15197, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1030: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcad804a0  ! 1031: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x93902007  ! 1032: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87450000  ! 1033: RD_SET_SOFTINT	rd	%set_softint, %r3
	.word 0x22800001  ! 1034: BE	be,a	<label_0x1>
	.word 0x93d02035  ! 1035: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xc71fc000  ! 1036: LDDF_R	ldd	[%r31, %r0], %f3
	.word 0x8d903a73  ! 1037: WRPR_PSTATE_I	wrpr	%r0, 0x1a73, %pstate
	.word 0xad842001  ! 1038: WR_SOFTINT_REG_I	wr	%r16, 0x0001, %softint
	.word 0x8cc42001  ! 1039: ADDCcc_I	addccc 	%r16, 0x0001, %r6
	.word 0x81510000  ! 1040: RDPR_TICK	<illegal instruction>
intveclr_0_433:
	set 0x21c05ec9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1041: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xccd00e60  ! 1042: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r6
	.word 0x26700001  ! 1043: BPL	<illegal instruction>
	.word 0xa7802001  ! 1044: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x0001, %-
	.word 0x93902004  ! 1045: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_434:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1046: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_435:
	set 0xb28da189, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1047: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_436:
	setx 0x5abe0c4cb5091b07, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1048: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1049: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc1fc000  ! 1050: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x87802080  ! 1051: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xcc4fc000  ! 1052: LDSB_R	ldsb	[%r31 + %r0], %r6
mondo_0_437:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d93000b  ! 1053: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0xcc9fe001  ! 1054: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
DS_0_438:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x99b28306  ! 1055: ALIGNADDRESS	alignaddr	%r10, %r6, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_439)) -> intp(0,1,3)
xir_0_439:
	.word 0xa984e001  ! 1056: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xd84fe001  ! 1057: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x87802055  ! 1058: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d9031ed  ! 1059: WRPR_PSTATE_I	wrpr	%r0, 0x11ed, %pstate
	.word 0x8d903152  ! 1060: WRPR_PSTATE_I	wrpr	%r0, 0x1152, %pstate
splash_lsu_0_440:
	setx 0x7e45f5231fa36a5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1061: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8b50c000  ! 1062: RDPR_TT	rdpr	%tt, %r5
	.word 0xcb27c006  ! 1063: STF_R	st	%f5, [%r6, %r31]
	set 0xd781a876, %r28
	stxa %r28, [%g0] 0x73
intvec_0_441:
	.word 0x39400001  ! 1064: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 1065: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xa190200f  ! 1066: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d903961  ! 1067: WRPR_PSTATE_I	wrpr	%r0, 0x1961, %pstate
	.word 0x8790217b  ! 1068: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
	.word 0xca8804a0  ! 1069: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
DS_0_442:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7344001  ! 1: STQF_R	-	%f11, [%r1, %r17]
	normalw
	.word 0x95458000  ! 1070: RD_SOFTINT_REG	rd	%softint, %r10
DS_0_443:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1071: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_444)) -> intp(0,0,24)
intvec_0_444:
	.word 0x39400001  ! 1072: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 1073: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 1074: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa7480000  ! 1075: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1076: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3480000  ! 1077: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xe29fe001  ! 1078: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	.word 0x81460000  ! 1079: RD_STICK_REG	stbar
	.word 0x91d02035  ! 1080: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x26800001  ! 1081: BL	bl,a	<label_0x1>
tagged_0_445:
	taddcctv %r19, 0x128d, %r23
	.word 0xe207e001  ! 1082: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe337c001  ! 1083: STQF_R	-	%f17, [%r1, %r31]
DS_0_446:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f18, %f26
	.word 0x91b48304  ! 1084: ALIGNADDRESS	alignaddr	%r18, %r4, %r8
	.word 0x879022d4  ! 1085: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	set 0xe203cdac, %r28
	stxa %r28, [%g0] 0x73
intvec_0_447:
	.word 0x39400001  ! 1086: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd127e001  ! 1087: STF_I	st	%f8, [0x0001, %r31]
debug_0_448:
	setx debug_0_448 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1088: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_449:
	set 0xd510afea, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1089: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1090: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd137c004  ! 1091: STQF_R	-	%f8, [%r4, %r31]
	.word 0xa150c000  ! 1092: RDPR_TT	rdpr	%tt, %r16
	.word 0xe11fc000  ! 1093: LDDF_R	ldd	[%r31, %r0], %f16
	.word 0xe057c000  ! 1094: LDSH_R	ldsh	[%r31 + %r0], %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_450)) -> intp(0,1,3)
xir_0_450:
	.word 0xa9836001  ! 1095: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x864b4001  ! 1096: MULX_R	mulx 	%r13, %r1, %r3
debug_0_451:
	setx debug_0_451 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1097: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902292  ! 1098: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
splash_lsu_0_452:
	setx 0xb88408ed78c42921, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1099: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_453:
	mov 8, %r18
	.word 0xe2f00852  ! 1100: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xc61fc000  ! 1101: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x36800001  ! 1102: BGE	bge,a	<label_0x1>
	.word 0xc68008a0  ! 1103: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc607c000  ! 1104: LDUW_R	lduw	[%r31 + %r0], %r3
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 1105: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1106: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_0_454:
	set 0xd05b305, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1107: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc61fc000  ! 1108: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc6c004a0  ! 1109: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xa1902004  ! 1110: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_0_455:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1111: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 1112: SIR	sir	0x0001
	.word 0x87802014  ! 1113: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc69004a0  ! 1114: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
splash_cmpr_0_456:
	setx 0x520d9a00391f52d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1115: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc607c000  ! 1116: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0x93902006  ! 1117: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	set 0x463a8e98, %r28
	stxa %r28, [%g0] 0x73
intvec_0_457:
	.word 0x39400001  ! 1118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc6ffc021  ! 1119: SWAPA_R	swapa	%r3, [%r31 + %r1] 0x01
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_458)) -> intp(0,1,3)
xir_0_458:
	.word 0xa9846001  ! 1120: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	set 0x15dbb691, %r28
	stxa %r28, [%g0] 0x73
intvec_0_459:
	.word 0x39400001  ! 1121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc63fe001  ! 1122: STD_I	std	%r3, [%r31 + 0x0001]
	.word 0x9550c000  ! 1123: RDPR_TT	rdpr	%tt, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_460)) -> intp(0,1,3)
xir_0_460:
	.word 0xa982a001  ! 1125: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x87802058  ! 1126: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd4dfe000  ! 1127: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x87802088  ! 1128: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_0_461:
	setx 0x3c1557e2f49b7321, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_462)) -> intp(0,0,14)
intvec_0_462:
	.word 0x39400001  ! 1130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1131: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4d004a0  ! 1132: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	set 0x4bb627bf, %r28
	stxa %r28, [%g0] 0x73
intvec_0_463:
	.word 0x39400001  ! 1133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_464:
	set 0x1442b535, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_465:
	mov 8, %r18
	.word 0xe6f00852  ! 1135: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_466)) -> intp(0,0,21)
intvec_0_466:
	.word 0x39400001  ! 1136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_467:
	taddcctv %r7, 0x1406, %r16
	.word 0xd407e001  ! 1137: LDUW_I	lduw	[%r31 + 0x0001], %r10
DS_0_468:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x81b1c302  ! 1138: ALIGNADDRESS	alignaddr	%r7, %r2, %r0
	.word 0xc08fe030  ! 1139: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
debug_0_469:
	setx debug_0_469 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1140: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 1141: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_470:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1142: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc08008a0  ! 1143: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9553c000  ! 1144: RDPR_FQ	<illegal instruction>
tagged_0_471:
	taddcctv %r2, 0x1971, %r9
	.word 0xd407e001  ! 1145: LDUW_I	lduw	[%r31 + 0x0001], %r10
debug_0_472:
	setx debug_0_472 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd517c000  ! 1147: LDQF_R	-	[%r31, %r0], %f10
mondo_0_473:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d920001  ! 1148: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
	.word 0x83d02034  ! 1149: Tcc_I	te	icc_or_xcc, %r0 + 52
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91520000  ! 1151: RDPR_PIL	rdpr	%pil, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 1152: LDX_R	ldx	[%r31 + %r0], %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_474)) -> intp(0,1,3)
xir_0_474:
	.word 0xa980e001  ! 1153: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xad852001  ! 1154: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	.word 0xa1902003  ! 1155: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_0_475:
	setx debug_0_475 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1156: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd01fe001  ! 1157: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0xd0c804a0  ! 1158: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
debug_0_476:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1159: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 1160: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_0_477:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1161: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_0_478:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_478:
	.word 0x8f902002  ! 1162: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_0_479:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 1163: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xd0880e80  ! 1164: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
debug_0_480:
	mov 8, %r18
	.word 0xe4f00852  ! 1165: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xa1902008  ! 1166: WRPR_GL_I	wrpr	%r0, 0x0008, %-
intveclr_0_481:
	set 0xef176a4a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_482:
	setx 0xed3608828f02596b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1168: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_0_483:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1169: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81510000  ! 1170: RDPR_TICK	rdpr	%tick, %r0
debug_0_484:
	setx debug_0_484 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1171: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_485:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1172: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x24800001  ! 1173: BLE	ble,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 1174: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91d020b5  ! 1175: Tcc_I	ta	icc_or_xcc, %r0 + 181
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_486)) -> intp(0,1,3)
xir_0_486:
	.word 0xa9822001  ! 1176: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0xd057c000  ! 1177: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x83d02032  ! 1178: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x956d0011  ! 1179: SDIVX_R	sdivx	%r20, %r17, %r10
	.word 0x91d02032  ! 1180: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 1181: LDX_R	ldx	[%r31 + %r0], %r10
debug_0_487:
	setx debug_0_487 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 1183: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd4800bc0  ! 1184: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_488)) -> intp(0,0,12)
intvec_0_488:
	.word 0x39400001  ! 1185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 1186: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd4880e40  ! 1187: LDUBA_R	lduba	[%r0, %r0] 0x72, %r10
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1189: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x89500000  ! 1191: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x9192a001  ! 1192: WRPR_PIL_I	wrpr	%r10, 0x0001, %pil
	.word 0x8790215f  ! 1193: WRPR_TT_I	wrpr	%r0, 0x015f, %tt
mondo_0_489:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d940005  ! 1194: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xa545c000  ! 1195: RD_TICK_CMPR_REG	rd	%-, %r18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_490)) -> intp(0,0,12)
intvec_0_490:
	.word 0x39400001  ! 1196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 1197: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902003  ! 1198: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1199: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe517c000  ! 1200: LDQF_R	-	[%r31, %r0], %f18
debug_0_491:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1201: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 1202: LDX_R	ldx	[%r31 + %r0], %r18
tagged_0_492:
	tsubcctv %r6, 0x165c, %r8
	.word 0xe407e001  ! 1203: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xa345c000  ! 1204: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x9f802001  ! 1205: SIR	sir	0x0001
debug_0_493:
	setx debug_0_493 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1206: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_0_494:
	setx 0x9e424706154f4b95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_495:
	mov 8, %r18
	.word 0xe0f00852  ! 1209: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x97464000  ! 1210: RD_STICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_496)) -> intp(0,0,28)
intvec_0_496:
	.word 0x39400001  ! 1211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd60fe001  ! 1212: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 1213: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_0_497:
	set 0x15595029, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 1215: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa1902009  ! 1216: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d9039b4  ! 1217: WRPR_PSTATE_I	wrpr	%r0, 0x19b4, %pstate
splash_htba_0_498:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1218: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_499:
	setx 0xce27a77c2e79c44b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1219: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 1220: RDPR_TICK	rdpr	%tick, %r0
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790238a  ! 1222: WRPR_TT_I	wrpr	%r0, 0x038a, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 1223: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd647c000  ! 1224: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x95480000  ! 1225: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xd48008a0  ! 1226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_0_500:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1227: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1228: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93902002  ! 1229: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa6d0c008  ! 1230: UMULcc_R	umulcc 	%r3, %r8, %r19
	.word 0xe727c008  ! 1231: STF_R	st	%f19, [%r8, %r31]
debug_0_501:
	mov 8, %r18
	.word 0xdef00852  ! 1232: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1500000  ! 1234: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x87802063  ! 1235: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_0_502:
	setx 0x2a11bfd3b9417aec, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1236: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 1237: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe077c008  ! 1238: STX_R	stx	%r16, [%r31 + %r8]
	.word 0xe08008a0  ! 1239: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
tagged_0_503:
	taddcctv %r24, 0x176d, %r17
	.word 0xe007e001  ! 1240: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d53c000  ! 1241: RDPR_FQ	<illegal instruction>
	.word 0xccd804a0  ! 1242: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x91d020b3  ! 1243: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xcc800b80  ! 1244: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r6
DS_0_504:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xa740f5bd	! Random illegal ?
	.word 0xc1120010  ! 1: LDQF_R	-	[%r8, %r16], %f0
	.word 0x8da40833  ! 1245: FADDs	fadds	%f16, %f19, %f6
tagged_0_505:
	taddcctv %r5, 0x1ca8, %r24
	.word 0xcc07e001  ! 1246: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcd27e001  ! 1247: STF_I	st	%f6, [0x0001, %r31]
	.word 0xcd3fe001  ! 1248: STDF_I	std	%f6, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902002  ! 1250: WRPR_GL_I	wrpr	%r0, 0x0002, %-
intveclr_0_506:
	set 0xbe51d5c3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1251: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_507:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8db2c309  ! 1252: ALIGNADDRESS	alignaddr	%r11, %r9, %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1253: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc37c009  ! 1254: STH_R	sth	%r6, [%r31 + %r9]
	.word 0x93902006  ! 1255: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x89480000  ! 1256: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0xc8cfe000  ! 1257: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 1258: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc91fc000  ! 1259: LDDF_R	ldd	[%r31, %r0], %f4
splash_lsu_0_508:
	setx 0x6bbaca3151b3ff1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 1261: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_0_509:
	setx 0x8447162166789af7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1262: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_510:
	mov 8, %r18
	.word 0xe2f00852  ! 1263: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x93d02035  ! 1264: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_0_511:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb350012  ! 1: STQF_R	-	%f13, [%r18, %r20]
	normalw
	.word 0x83458000  ! 1265: RD_SOFTINT_REG	rd	%softint, %r1
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1266: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc29fe001  ! 1267: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xc28008a0  ! 1268: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x87b14ff1  ! 1269: FONES	e	%f3
debug_0_512:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1270: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_513:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1271: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc64fe001  ! 1272: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xa0d30004  ! 1273: UMULcc_R	umulcc 	%r12, %r4, %r16
	.word 0xe11fe001  ! 1274: LDDF_I	ldd	[%r31, 0x0001], %f16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_514)) -> intp(0,0,27)
intvec_0_514:
	.word 0x39400001  ! 1275: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_515:
	setx 0x95d500bcd7cc36e4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1276: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe08008a0  ! 1277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_516)) -> intp(0,0,23)
intvec_0_516:
	.word 0x39400001  ! 1278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 1279: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93d02032  ! 1280: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 1281: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	set 0x2056adc7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_517:
	.word 0x39400001  ! 1282: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_518)) -> intp(0,1,3)
xir_0_518:
	.word 0xa981a001  ! 1283: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
DS_0_519:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe332e001  ! 1: STQF_I	-	%f17, [0x0001, %r11]
	normalw
	.word 0x93458000  ! 1284: RD_SOFTINT_REG	rd	%softint, %r9
debug_0_520:
	setx debug_0_520 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1285: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_521:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1286: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_522:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb4c312  ! 1287: ALIGNADDRESS	alignaddr	%r19, %r18, %r13
splash_lsu_0_523:
	setx 0x7341d976cde0361d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1288: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda4fe001  ! 1289: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x87802080  ! 1290: WRASI_I	wr	%r0, 0x0080, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_524)) -> intp(0,0,24)
intvec_0_524:
	.word 0x39400001  ! 1291: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1292: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1293: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_525:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d91c009  ! 1294: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_526)) -> intp(0,0,5)
intvec_0_526:
	.word 0x39400001  ! 1295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_527:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1296: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb1fe001  ! 1297: LDDF_I	ldd	[%r31, 0x0001], %f13
	.word 0xda1fe001  ! 1298: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x8d802000  ! 1299: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8780204f  ! 1300: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_528:
	setx 0x6323bce8dfe16e13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1301: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8da1c9cd  ! 1302: FDIVd	fdivd	%f38, %f44, %f6
debug_0_529:
	setx debug_0_529 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1303: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_530:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1304: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xcd1fc000  ! 1305: LDDF_R	ldd	[%r31, %r0], %f6
	.word 0x85454000  ! 1306: RD_CLEAR_SOFTINT	rd	%clear_softint, %r2
	.word 0x87902398  ! 1307: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0x2c700001  ! 1308: BPNEG	<illegal instruction>
intveclr_0_531:
	set 0xefaa250b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1310: SIR	sir	0x0001
debug_0_532:
	setx debug_0_532 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 1312: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	set 0x5dd3eac6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_533:
	.word 0x39400001  ! 1313: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_534:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1314: SAVE_R	save	%r31, %r0, %r31
	.word 0xa780a001  ! 1315: WR_GRAPHICS_STATUS_REG_I	wr	%r2, 0x0001, %-
	.word 0xc537c00d  ! 1316: STQF_R	-	%f2, [%r13, %r31]
splash_tba_0_535:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 1318: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x99902004  ! 1319: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_0_536:
	setx 0x2468aed15666d258, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02035  ! 1321: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93d02034  ! 1322: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc42fe001  ! 1323: STB_I	stb	%r2, [%r31 + 0x0001]
	.word 0xa1902004  ! 1324: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_0_537:
	setx 0x0e3d5007b805c05f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1325: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_538:
	setx 0xd0f6abab24907096, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1326: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc457c000  ! 1327: LDSH_R	ldsh	[%r31 + %r0], %r2
	set 0xa92db22, %r28
	stxa %r28, [%g0] 0x73
intvec_0_539:
	.word 0x39400001  ! 1328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc53fc00d  ! 1329: STDF_R	std	%f2, [%r13, %r31]
	.word 0xc447c000  ! 1330: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0xc41fc000  ! 1331: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0xc53fe001  ! 1332: STDF_I	std	%f2, [0x0001, %r31]
tagged_0_540:
	tsubcctv %r20, 0x1a8b, %r3
	.word 0xc407e001  ! 1333: LDUW_I	lduw	[%r31 + 0x0001], %r2
tagged_0_541:
	taddcctv %r14, 0x15ab, %r15
	.word 0xc407e001  ! 1334: LDUW_I	lduw	[%r31 + 0x0001], %r2
tagged_0_542:
	tsubcctv %r24, 0x1a53, %r16
	.word 0xc407e001  ! 1335: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_0_543:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1336: SAVE_R	save	%r31, %r0, %r31
	.word 0xc4800c60  ! 1337: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
	.word 0x20700001  ! 1338: BPN	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_544)) -> intp(0,0,16)
intvec_0_544:
	.word 0x39400001  ! 1339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc447e001  ! 1340: LDSW_I	ldsw	[%r31 + 0x0001], %r2
mondo_0_545:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d930001  ! 1341: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_546)) -> intp(0,0,2)
intvec_0_546:
	.word 0x39400001  ! 1342: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1343: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	set 0x880cffa5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_547:
	.word 0x39400001  ! 1344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc457e001  ! 1345: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc43fc001  ! 1346: STD_R	std	%r2, [%r31 + %r1]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_548)) -> intp(0,0,28)
intvec_0_548:
	.word 0x39400001  ! 1347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a00547  ! 1348: FSQRTd	fsqrt	
	.word 0x34700001  ! 1349: BPG	<illegal instruction>
debug_0_549:
	mov 8, %r18
	.word 0xd8f00852  ! 1350: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
DS_0_550:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f30, %f0
	.word 0xa7b20309  ! 1351: ALIGNADDRESS	alignaddr	%r8, %r9, %r19
	.word 0x87802004  ! 1352: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1353: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_0_551:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1354: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_552)) -> intp(0,0,4)
intvec_0_552:
	.word 0x39400001  ! 1355: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1356: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_553:
	setx debug_0_553 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1357: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x85a000c9  ! 1358: FNEGd	fnegd	%f40, %f2
	.word 0xc48008a0  ! 1359: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
mondo_0_554:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d91c008  ! 1360: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1361: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_555:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1362: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc51fe001  ! 1363: LDDF_I	ldd	[%r31, 0x0001], %f2
	.word 0xa7450000  ! 1364: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xe717c000  ! 1365: LDQF_R	-	[%r31, %r0], %f19
	.word 0xe68008a0  ! 1366: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
mondo_0_556:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d928014  ! 1367: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0x8d90251e  ! 1368: WRPR_PSTATE_I	wrpr	%r0, 0x051e, %pstate
splash_htba_0_557:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1369: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1370: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe62fe001  ! 1371: STB_I	stb	%r19, [%r31 + 0x0001]
	.word 0xe69004a0  ! 1372: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_558)) -> intp(0,0,12)
intvec_0_558:
	.word 0x39400001  ! 1373: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 1374: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	set 0xcad7b2fd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_559:
	.word 0x39400001  ! 1375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_560)) -> intp(0,1,3)
xir_0_560:
	.word 0xa9816001  ! 1376: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	set 0x9b9cfa74, %r28
	stxa %r28, [%g0] 0x73
intvec_0_561:
	.word 0x39400001  ! 1377: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_562:
	set 0xecd7c156, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1378: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 1379: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802088  ! 1380: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe6c004a0  ! 1382: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
mondo_0_563:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d940012  ! 1383: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x93902003  ! 1384: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe737e001  ! 1385: STQF_I	-	%f19, [0x0001, %r31]
	.word 0x91a28d24  ! 1386: FsMULd	fsmuld	%f10, %f4, %f8
intveclr_0_564:
	set 0xdcc069b3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1387: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800b00  ! 1388: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
	.word 0xa1902000  ! 1389: WRPR_GL_I	wrpr	%r0, 0x0000, %-
tagged_0_565:
	taddcctv %r5, 0x1a89, %r24
	.word 0xd007e001  ! 1390: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x879021d1  ! 1391: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	.word 0xd08008a0  ! 1392: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x80c06001  ! 1393: ADDCcc_I	addccc 	%r1, 0x0001, %r0
	.word 0xc08008a0  ! 1394: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x28700001  ! 1395: BPLEU	<illegal instruction>
splash_lsu_0_566:
	setx 0x4bb7e1a55975da59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1396: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc09fe001  ! 1397: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0x81510000  ! 1399: RDPR_TICK	rdpr	%tick, %r0
DS_0_567:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x81a00548  ! 1: FSQRTd	fsqrt	
	.word 0x85a4c831  ! 1400: FADDs	fadds	%f19, %f17, %f2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 1401: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x85454000  ! 1402: RD_CLEAR_SOFTINT	rd	%clear_softint, %r2
	.word 0x81460000  ! 1403: RD_STICK_REG	stbar
DS_0_568:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1404: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
tagged_0_569:
	taddcctv %r13, 0x13d3, %r2
	.word 0xc407e001  ! 1405: LDUW_I	lduw	[%r31 + 0x0001], %r2
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_570:
	tsubcctv %r15, 0x184d, %r23
	.word 0xc407e001  ! 1407: LDUW_I	lduw	[%r31 + 0x0001], %r2
intveclr_0_571:
	set 0xb522913e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1408: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_572)) -> intp(0,1,3)
xir_0_572:
	.word 0xa984a001  ! 1409: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 1410: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa190200a  ! 1411: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc45fe001  ! 1412: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x87902370  ! 1413: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
DS_0_573:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1414: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa190200c  ! 1415: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93480000  ! 1416: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x93902000  ! 1417: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_574)) -> intp(0,1,3)
xir_0_574:
	.word 0xa9812001  ! 1418: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
intveclr_0_575:
	set 0x8a4351b4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1419: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd21fc000  ! 1420: LDD_R	ldd	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_576)) -> intp(0,0,14)
intvec_0_576:
	.word 0x39400001  ! 1421: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 1422: Tcc_I	tne	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 1423: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8150c000  ! 1424: RDPR_TT	rdpr	%tt, %r0
	set 0xd8d80526, %r28
	stxa %r28, [%g0] 0x73
intvec_0_577:
	.word 0x39400001  ! 1425: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_578:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1426: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d464000  ! 1427: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0x99500000  ! 1428: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x87802055  ! 1429: WRASI_I	wr	%r0, 0x0055, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_579)) -> intp(0,1,3)
xir_0_579:
	.word 0xa982e001  ! 1430: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x93902002  ! 1431: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902001  ! 1432: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x99520000  ! 1433: RDPR_PIL	rdpr	%pil, %r12
	.word 0x97480000  ! 1434: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd69004a0  ! 1435: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
tagged_0_580:
	tsubcctv %r16, 0x1cd9, %r9
	.word 0xd607e001  ! 1436: LDUW_I	lduw	[%r31 + 0x0001], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 1437: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_581:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1438: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99520000  ! 1439: RDPR_PIL	rdpr	%pil, %r12
	.word 0x38800001  ! 1440: BGU	bgu,a	<label_0x1>
	.word 0xd84fe001  ! 1441: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0xd8c004a0  ! 1442: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x97a18dd4  ! 1443: FdMULq	fdmulq	
DS_0_582:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7340004  ! 1: STQF_R	-	%f11, [%r4, %r16]
	normalw
	.word 0x87458000  ! 1444: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x87802016  ! 1445: WRASI_I	wr	%r0, 0x0016, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 1446: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc68008a0  ! 1447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
DS_0_583:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1448: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_584)) -> intp(0,0,3)
intvec_0_584:
	.word 0x39400001  ! 1449: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xa96db079, %r28
	stxa %r28, [%g0] 0x73
intvec_0_585:
	.word 0x39400001  ! 1450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 1451: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93d02035  ! 1452: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_0_586:
	setx 0x000ac821f5565347, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1453: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc6c804a0  ! 1454: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
splash_cmpr_0_587:
	setx 0xbeb03fca6f3b2850, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1455: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc61fe001  ! 1456: LDD_I	ldd	[%r31 + 0x0001], %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x91916001  ! 1458: WRPR_PIL_I	wrpr	%r5, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_588)) -> intp(0,0,3)
intvec_0_588:
	.word 0x39400001  ! 1459: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc6800ba0  ! 1460: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r3
	.word 0xc727e001  ! 1461: STF_I	st	%f3, [0x0001, %r31]
intveclr_0_589:
	set 0x2979a390, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1462: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 1463: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_cmpr_0_590:
	setx 0x2c6eb9a4ab58b9d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1464: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021f4  ! 1465: WRPR_TT_I	wrpr	%r0, 0x01f4, %tt
mondo_0_591:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 1466: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
splash_cmpr_0_592:
	setx 0x4ca5455dbf10b29b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1467: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc737c003  ! 1468: STQF_R	-	%f3, [%r3, %r31]
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1469: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_0_593:
	setx 0x51e191492d670fb9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1470: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc6bfe001  ! 1471: STDA_I	stda	%r3, [%r31 + 0x0001] %asi
	.word 0x87902058  ! 1472: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
	.word 0xc6d00e60  ! 1473: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r3
	.word 0xc6880e80  ! 1474: LDUBA_R	lduba	[%r0, %r0] 0x74, %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 1475: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x879023d0  ! 1476: WRPR_TT_I	wrpr	%r0, 0x03d0, %tt
splash_lsu_0_594:
	setx 0x1bf70f77a597c6c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1477: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 1478: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xc64fe001  ! 1479: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 1480: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
intveclr_0_595:
	set 0x412df72, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 1482: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_0_596:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91480000  ! 1484: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x93902003  ! 1485: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1486: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 1487: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x9750c000  ! 1488: RDPR_TT	rdpr	%tt, %r11
DS_0_597:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x97b30305  ! 1489: ALIGNADDRESS	alignaddr	%r12, %r5, %r11
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1490: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_598:
	setx debug_0_598 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1491: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd60fc000  ! 1493: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x91d020b5  ! 1494: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_htba_0_599:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1495: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd68008a0  ! 1496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x91d020b3  ! 1497: Tcc_I	ta	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_600)) -> intp(0,1,3)
xir_0_600:
	.word 0xa980a001  ! 1498: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
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

	.xword	0x7e9955c961b88023
	.xword	0x5664fbc450b6a381
	.xword	0x34508b4e6ba9943f
	.xword	0xd176ce579fedae7f
	.xword	0xf84e84978f518b67
	.xword	0xec8ec6137c02e3ef
	.xword	0xdb3e2ca40b44c3f1
	.xword	0x515c77b4fe7e2431
	.xword	0x027eeab3a32a00fa
	.xword	0xb50905c2506bd90a
	.xword	0x1cfb5410440e5315
	.xword	0x24fa668891d83792
	.xword	0x9f7b1ba37602ae86
	.xword	0x701f71923c7d6699
	.xword	0x935391fe5167f78e
	.xword	0x51e2f5328388bd2d
	.xword	0x68fd4609344c1eb5
	.xword	0x80a21bd89346f020
	.xword	0x4c1428029ff17318
	.xword	0xb3f558ab8948887a
	.xword	0x841d820dd83bbe22
	.xword	0x13e24eaaf194b1c0
	.xword	0x9a0b05e19856c1bb
	.xword	0x48a5fa146fc0ac95
	.xword	0x645e89ed77064618
	.xword	0x02b3b085e40d2a9d
	.xword	0x0f8abfacb987515d
	.xword	0xe8996880fb81cb77
	.xword	0x9f2bd5b33543ef58
	.xword	0x55223f48956cdd8f
	.xword	0x71eeb71a29604eb1
	.xword	0x06a6ee4059ab3c82
	.xword	0x4831cbcbdc58a6be
	.xword	0xfe0ba8713eb35972
	.xword	0x54d8d0575271a552
	.xword	0xd134ef5046144d22
	.xword	0xd56f4a569ede5e51
	.xword	0xba046d67ff34cc94
	.xword	0x10801173d6f4f941
	.xword	0x07591a1ad5b3db5b
	.xword	0xed7e77545ac3b869
	.xword	0xc35c681b97982d91
	.xword	0xe6463967be1791c0
	.xword	0xd2453fc5a5ba22f0
	.xword	0x4131a74991c2a12b
	.xword	0xc37ad939836ce54b
	.xword	0x376d67c807940a04
	.xword	0x8a2f6264fd4694bb
	.xword	0x70f27cac2434eba7
	.xword	0xf5f8559e5110e0cd
	.xword	0x2c014575cf5feefb
	.xword	0xaf9bb05deba1c326
	.xword	0x38789e66d7fe399c
	.xword	0xd64975f8df043c78
	.xword	0x875a6d3d6cb23a40
	.xword	0x900a7cd54bd98c32
	.xword	0x3f273aa3ec17eb1a
	.xword	0xd102a13e2b440451
	.xword	0x93c4167acc5bc102
	.xword	0xe5207b1acfbffc45
	.xword	0xf63c4536a39c79fe
	.xword	0x0abf7c2213fb746b
	.xword	0xc3355b407a4f13bf
	.xword	0x2962d135ab556da3
	.xword	0xfc85fb758f6edf1e
	.xword	0x13f75302bc1dc1e1
	.xword	0x18918616791c0f9c
	.xword	0xf3c7da435d123faa
	.xword	0x20665b3fa154eda8
	.xword	0x1b61c25d0416dbef
	.xword	0x1d15a5c84e271bba
	.xword	0xddc0de2ef64784c0
	.xword	0x5238ab06508f8c41
	.xword	0xc231c664389f371a
	.xword	0xcd6492abb9395f7e
	.xword	0x3b062b13fd55a1ae
	.xword	0x7c2ff94283669a58
	.xword	0x7ddc5baa5ce5691e
	.xword	0xdf3a14f6134ac5fd
	.xword	0x9e3b27a35c7933fe
	.xword	0x12dcb80727f8e83a
	.xword	0xb583664d539dd88e
	.xword	0x48a53ddf106b140a
	.xword	0x0d053b4311e8ebe1
	.xword	0x8ea26ed788621cf1
	.xword	0x36cd0065d7547b74
	.xword	0xf93fdf7cafbc0778
	.xword	0xfd6188537b39f06c
	.xword	0x053a9bf919e17219
	.xword	0x8c8078ce778926c1
	.xword	0xcbfab99961b125f6
	.xword	0xd9a725da6a60442a
	.xword	0x1634427798af5176
	.xword	0x43646b23bff313b0
	.xword	0x2ba6307f60ecd5b5
	.xword	0x3d8e15e0dd44a3d3
	.xword	0xffbb0fb879778671
	.xword	0x1f5b7a3b6897f835
	.xword	0x27c993432af3ac90
	.xword	0xb7082072338fd587
	.xword	0x8856f029be278606
	.xword	0x208d0a80c10e4892
	.xword	0x6b64d83b36e92513
	.xword	0xd1f3913e07650375
	.xword	0x09ad4c8b07ab0f32
	.xword	0xeb277715a747f77f
	.xword	0xea7d9e93aed6fb02
	.xword	0xc81ca2a56e3cc21e
	.xword	0xbcf9fb23d4dc481c
	.xword	0xdf8c1e95aed2bdb8
	.xword	0x7ea4f79ff2094bcf
	.xword	0xd406d1dc99d1bf3a
	.xword	0x1ab07fc9cefbd2b4
	.xword	0xae59486a235d651a
	.xword	0x5efb9150f209b376
	.xword	0x6038efb7d2786717
	.xword	0x17238bc30e51bbf7
	.xword	0xe5a121c6e9075a7a
	.xword	0x286d65bb0f3268f6
	.xword	0xfd7ef05794dda31d
	.xword	0x28cbbbc96dc5bf87
	.xword	0x226029ee0a8e6dca
	.xword	0x6730b3db4dd775cf
	.xword	0x84228c4b37667995
	.xword	0xe5a65a917aef0954
	.xword	0xd73a9d61bca21bea
	.xword	0x9e27cf232542e007
	.xword	0x203ff515e7575ed8
	.xword	0xfb49bf41e0ab8610
	.xword	0xc580dd6b8da1c254
	.xword	0xbb236d3c61b96885
	.xword	0xb78317462f2dedae
	.xword	0x49a7003a3ea332da
	.xword	0xc1b0f95034a17596
	.xword	0x5b822ee749c43fa4
	.xword	0xe93dafcb5f7dafd2
	.xword	0xb893f4ab25319796
	.xword	0x9c6b2bef89fec8dc
	.xword	0xd449ff5c1c49f960
	.xword	0xb8fc5ecfe13b2d9e
	.xword	0xaa6ea9ed6b9986e3
	.xword	0x6cfb0d63d2026be7
	.xword	0x9e4ca880003bda26
	.xword	0x38d3a8f35b3b6e33
	.xword	0xb4f18f3562eadbe9
	.xword	0xf6470d4d5c6e0e29
	.xword	0x45c841e243a8eb30
	.xword	0xe4860893bd0903b3
	.xword	0xa9b4f70d35635c85
	.xword	0x45ea5684c1c9e617
	.xword	0x1aaa2889b8999c4c
	.xword	0xcc14a329884cf071
	.xword	0x2280f61babf50bac
	.xword	0xcd60e1fdad7aea35
	.xword	0x17be838190816f1d
	.xword	0x8b0719ec131be71e
	.xword	0x81f158ed58aab9df
	.xword	0x0384b3649e69bde9
	.xword	0x36a44fb0b74eb386
	.xword	0x8734ef55f4af82e6
	.xword	0x68aa4a911e21b29e
	.xword	0x16998ddde0bc592c
	.xword	0x206e0ab7286dfad0
	.xword	0x24884c627bc6daf9
	.xword	0xa6326dc4d7e2e3d5
	.xword	0x6db57c0733d43821
	.xword	0xa717bd1656e827f6
	.xword	0x2cd9c182a34cd0f9
	.xword	0x1e88d4a06d1eaa42
	.xword	0x06b35970a1b1f8dd
	.xword	0x34ac33031ccdd274
	.xword	0x22e31402568c2e38
	.xword	0x08952686d675f629
	.xword	0x43b04144a9302a16
	.xword	0x12705a4c337cff59
	.xword	0x6f56e0724c932a4c
	.xword	0xbe3a6c85d8e1f097
	.xword	0xaf18408a55bc7eae
	.xword	0x6da0f93be2de41ee
	.xword	0xafb835ffe144bde1
	.xword	0x5104dd080c7e91e2
	.xword	0xae4cf8d20d76e291
	.xword	0xb09cb01b30203489
	.xword	0xa83bab4780217759
	.xword	0xcb3f63ad8aa23659
	.xword	0x2f71c56e678b2d3b
	.xword	0xa4db76f823618630
	.xword	0x38608c5b1462d9b1
	.xword	0xf029178307a538df
	.xword	0xbc3601a897d264fa
	.xword	0xf0fae6e29e8e0c8f
	.xword	0x4efb4c9859d26f47
	.xword	0x6dba1e5cd6a23f8f
	.xword	0xdf19a52f70fff24c
	.xword	0x3fc5275bd169e679
	.xword	0x6b8feb27399dd3dd
	.xword	0xe22c54f86744aec8
	.xword	0x28b0c3c53a718bf9
	.xword	0x91e8c69616db22d3
	.xword	0xd5d2560f3779d3a2
	.xword	0x1687891df9de1ded
	.xword	0x6a280231793c1d1c
	.xword	0x111697ac815d1ce0
	.xword	0x0e544a8a54fb7849
	.xword	0x0da16a5b7625f9cb
	.xword	0x08c295c4002aee8b
	.xword	0xba2f7211ac4b3007
	.xword	0x6bb89dcd6af0a550
	.xword	0x7dc976ea762de77c
	.xword	0x1910dc88146f5af2
	.xword	0xd83560eb994c4be5
	.xword	0xd164709bf6615afb
	.xword	0xf1253c5c32631f10
	.xword	0xd29785486d196026
	.xword	0x4b45f99453fede5c
	.xword	0x56bf7d1455a6b14c
	.xword	0xdc57b352f82f35e3
	.xword	0x9a7cfc05ebb61af5
	.xword	0xe43d27848e47a809
	.xword	0x62cb6bf6869814b9
	.xword	0x837ace2c09572d63
	.xword	0x46f2e627608f5c4f
	.xword	0x19fe8dc08a3f38e7
	.xword	0xc4de5487b986606c
	.xword	0xc338342618f78246
	.xword	0x140c435f68416878
	.xword	0xe59ae68e87fb8d24
	.xword	0x2e0261f26da57972
	.xword	0xf22f6e3e9bc5ff07
	.xword	0x99283081bb609e3c
	.xword	0x260cd2853fc6254a
	.xword	0x1df0ea8a1a7baf5c
	.xword	0x1cbb2f7640524f7d
	.xword	0x81591ecb3c91f320
	.xword	0x27fb4559d1821a33
	.xword	0xbae14e7a8baf767a
	.xword	0x35fb75dc5d583e53
	.xword	0x00f84005171f9046
	.xword	0x5b947305411cab6b
	.xword	0x8c61ae54534f6d46
	.xword	0xa53a816f98114057
	.xword	0x9dcadc98aeb16561
	.xword	0xf812d37f0cf92c37
	.xword	0x38034b76e9b1cc52
	.xword	0x12cecc82a4681ac6
	.xword	0x779bc07ca367d088
	.xword	0x4681db0a18c99fda
	.xword	0x2333b994b950f73e
	.xword	0x35e1938a97183ff0
	.xword	0x1657f2348f45eab7
	.xword	0xe694a4e42dfb2151
	.xword	0x41dbec78c921ae64
	.xword	0xf671c7d40718e366
	.xword	0xb2bdb86015b9d898
	.xword	0xe7bcf67a3c0ed4a6
	.xword	0xd3eb757da9480bd2

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext

SECTION .HTRAPS
.text
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
    stxa    %g0, [%g0] ASI_ERROR_INJECT
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1
    cmp %l1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htba, %l2
    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    jmp %l2
    nop
# 51 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
    stxa    %g0, [%g0] ASI_ERROR_INJECT

    rdpr %tt, %l1
    sllx %l1, 5, %l1
    rdhpr %htba, %l2
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
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

 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
    done
# 332 "diag.j"



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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_X	 = 1
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
	TTE_E	 = 0,
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



#if 0
#endif

