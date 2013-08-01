/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_04.s
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
# 215 "diag.j"
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
	mov 0xb4, %r30
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
	mov 0xb2, %r14
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
	mov 0xb1, %r14
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
	mov 0xb5, %r14
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

debug_0_0:
	mov 8, %r18
	.word 0xe0f00852  ! 1: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
splash_tba_0_1:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe727e001  ! 3: STF_I	st	%f19, [0x0001, %r31]
	.word 0x97a289f1  ! 4: FDIVq	dis not found

	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 5: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd73fe001  ! 6: STDF_I	std	%f11, [0x0001, %r31]
	.word 0x93902007  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9031af  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x11af, %pstate
intveclr_0_2:
	set 0x835d2d01, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 9: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 10: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93a449e3  ! 11: FDIVq	dis not found

	.word 0x8d90342f  ! 12: WRPR_PSTATE_I	wrpr	%r0, 0x142f, %pstate
	.word 0x97480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x87902138  ! 14: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0x81460000  ! 15: RD_STICK_REG	stbar
intveclr_0_3:
	set 0x6767b636, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 16: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_4:
	tsubcctv %r23, 0x1cbf, %r12
	.word 0xd607e001  ! 17: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68fe000  ! 18: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0xd65fe001  ! 19: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd61fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd727c003  ! 21: STF_R	st	%f11, [%r3, %r31]
	.word 0x87504000  ! 22: RDPR_TNPC	rdpr	%tnpc, %r3
DS_0_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f28, %f20
	.word 0x85b40304  ! 23: ALIGNADDRESS	alignaddr	%r16, %r4, %r2
	.word 0x91922001  ! 24: WRPR_PIL_I	wrpr	%r8, 0x0001, %pil
	.word 0xc497e020  ! 25: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	.word 0xc4ffc024  ! 26: SWAPA_R	swapa	%r2, [%r31 + %r4] 0x01
	.word 0x87802089  ! 27: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa190200d  ! 28: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879021cf  ! 29: WRPR_TT_I	wrpr	%r0, 0x01cf, %tt
debug_0_6:
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902cfa  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x0cfa, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa1902002  ! 33: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x85450000  ! 34: RD_SET_SOFTINT	rd	%set_softint, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1508000  ! 36: RDPR_TSTATE	rdpr	%tstate, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_7)) -> intp(0,1,3)
xir_0_7:
	.word 0xa981e001  ! 37: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
DS_0_8:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 38: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe137e001  ! 39: STQF_I	-	%f16, [0x0001, %r31]
	.word 0xe01fc000  ! 40: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0x8d9023e8  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x03e8, %pstate
	.word 0x99a009a1  ! 42: FDIVs	fdivs	%f0, %f1, %f12
DS_0_9:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb50308  ! 43: ALIGNADDRESS	alignaddr	%r20, %r8, %r13
	.word 0xa4d48008  ! 44: UMULcc_R	umulcc 	%r18, %r8, %r18
	.word 0x86d44006  ! 45: UMULcc_R	umulcc 	%r17, %r6, %r3
	.word 0x91d020b5  ! 46: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa7a00551  ! 47: FSQRTd	fsqrt	
	.word 0xe6bfc031  ! 48: STDA_R	stda	%r19, [%r31 + %r17] 0x01
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 49: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_10:
	tsubcctv %r9, 0x1edd, %r8
	.word 0xe607e001  ! 50: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe68008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x36800001  ! 52: BGE	bge,a	<label_0x1>
mondo_0_11:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d930007  ! 53: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
splash_cmpr_0_12:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 54: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x91d020b3  ! 55: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe60fe001  ! 56: LDUB_I	ldub	[%r31 + 0x0001], %r19
	.word 0x83540000  ! 57: RDPR_GL	<illegal instruction>
	.word 0xc31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f1
mondo_0_13:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d94000c  ! 59: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0xc29004a0  ! 60: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x87802055  ! 61: WRASI_I	wr	%r0, 0x0055, %asi
splash_htba_0_14:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_0_15:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 63: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 64: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x97504000  ! 65: RDPR_TNPC	<illegal instruction>
	.word 0xd6800b00  ! 66: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
splash_lsu_0_16:
	setx 0xfbe449384e3563df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 67: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_17:
	set 0x134df18b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 68: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 69: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd697e030  ! 70: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
	.word 0xd6cfe030  ! 71: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x8d902a3a  ! 72: WRPR_PSTATE_I	wrpr	%r0, 0x0a3a, %pstate
DS_0_18:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa7b0c302  ! 73: ALIGNADDRESS	alignaddr	%r3, %r2, %r19
splash_lsu_0_19:
	setx 0x8ed10e45091e986b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 74: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe69fc020  ! 75: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0xe6d00e40  ! 76: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r19
	.word 0xe607c000  ! 77: LDUW_R	lduw	[%r31 + %r0], %r19
	.word 0x89504000  ! 78: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x87902211  ! 79: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0xc82fc002  ! 80: STB_R	stb	%r4, [%r31 + %r2]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r4
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 82: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 83: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x99902000  ! 84: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc917c000  ! 85: LDQF_R	-	[%r31, %r0], %f4
	.word 0x8198265c  ! 86: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
	.word 0xc937c002  ! 87: STQF_R	-	%f4, [%r2, %r31]
DS_0_20:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 88: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 89: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa945c000  ! 90: RD_TICK_CMPR_REG	rd	%-, %r20
tagged_0_21:
	taddcctv %r24, 0x17f5, %r3
	.word 0xe807e001  ! 91: LDUW_I	lduw	[%r31 + 0x0001], %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_22)) -> intp(0,1,3)
xir_0_22:
	.word 0xa984e001  ! 92: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xa1902007  ! 93: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_0_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_23:
	.word 0x8f902003  ! 94: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	ta	T_CHANGE_PRIV	! macro
splash_lsu_0_24:
	setx 0x465e55d93c3b966d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8750c000  ! 97: RDPR_TT	rdpr	%tt, %r3
	.word 0xc637e001  ! 98: STH_I	sth	%r3, [%r31 + 0x0001]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc6800c20  ! 100: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_25:
	set 0x3738891a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 103: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 104: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_26)) -> intp(0,1,3)
xir_0_26:
	.word 0xa9822001  ! 105: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
intveclr_0_27:
	set 0x3e8a5a07, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 106: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8b504000  ! 107: RDPR_TNPC	rdpr	%tnpc, %r5
splash_htba_0_28:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 108: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903267  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x1267, %pstate
	.word 0x8f51c000  ! 110: RDPR_TL	rdpr	%tl, %r7
	.word 0x83d02034  ! 111: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93d020b3  ! 112: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_0_29:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d944005  ! 113: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
intveclr_0_30:
	set 0x393f3d96, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcf1fe001  ! 115: LDDF_I	ldd	[%r31, 0x0001], %f7
	.word 0xa0fa8014  ! 116: SDIVcc_R	sdivcc 	%r10, %r20, %r16
	.word 0x91d02035  ! 117: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe08008a0  ! 118: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x87802004  ! 119: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe08008a0  ! 120: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_0_31:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d924010  ! 121: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0xe0cfe010  ! 122: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9500000  ! 124: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xe8c7e000  ! 125: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe88fe030  ! 126: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
	.word 0xe8dfe000  ! 127: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
tagged_0_32:
	tsubcctv %r12, 0x14d3, %r10
	.word 0xe807e001  ! 128: LDUW_I	lduw	[%r31 + 0x0001], %r20
splash_lsu_0_33:
	setx 0xe6c623b0fad3ca83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_34:
	setx 0xa5237dde9aaf7665, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 131: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020a5  ! 132: WRPR_TT_I	wrpr	%r0, 0x00a5, %tt
intveclr_0_35:
	set 0x76d5edee, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe89fe001  ! 135: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	.word 0xe857e001  ! 136: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 138: SIR	sir	0x0001
	.word 0xa1902001  ! 139: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x81a2cd34  ! 140: FsMULd	fsmuld	%f11, %f20, %f0
	.word 0x30700001  ! 141: BPA	<illegal instruction>
	.word 0x9953c000  ! 142: RDPR_FQ	<illegal instruction>
tagged_0_36:
	tsubcctv %r26, 0x1dae, %r6
	.word 0xd807e001  ! 143: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_0_37:
	taddcctv %r26, 0x17dd, %r23
	.word 0xd807e001  ! 144: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x93902005  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x85702001  ! 146: POPC_I	popc	0x0001, %r2
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 147: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_0_38:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 148: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
DS_0_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd731a001  ! 1: STQF_I	-	%f11, [0x0001, %r6]
	normalw
	.word 0x8f458000  ! 149: RD_SOFTINT_REG	rd	%softint, %r7
splash_cmpr_0_40:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 150: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0xcf1fe001  ! 151: LDDF_I	ldd	[%r31, 0x0001], %f7
	.word 0x93902001  ! 152: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xced7e010  ! 153: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 154: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99a00dcc  ! 155: FdMULq	fdmulq	
	.word 0x85a000c8  ! 156: FNEGd	fnegd	%f8, %f2
DS_0_41:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f26, %f26
	.word 0x97b50307  ! 157: ALIGNADDRESS	alignaddr	%r20, %r7, %r11
	.word 0x20700001  ! 158: BPN	<illegal instruction>
	.word 0x8790226b  ! 159: WRPR_TT_I	wrpr	%r0, 0x026b, %tt
	.word 0xa048000c  ! 160: MULX_R	mulx 	%r0, %r12, %r16
splash_lsu_0_42:
	setx 0xebe705525f026c5d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 161: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 162: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x91d02033  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9b508000  ! 164: RDPR_TSTATE	rdpr	%tstate, %r13
tagged_0_43:
	taddcctv %r1, 0x186b, %r8
	.word 0xda07e001  ! 165: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x8198294c  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0xda0fe001  ! 167: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xa5514000  ! 168: RDPR_TBA	rdpr	%tba, %r18
	.word 0x91d02032  ! 169: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe44fc000  ! 170: LDSB_R	ldsb	[%r31 + %r0], %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 171: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe51fe001  ! 173: LDDF_I	ldd	[%r31, 0x0001], %f18
	.word 0xe48008a0  ! 174: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
tagged_0_44:
	tsubcctv %r14, 0x1220, %r2
	.word 0xe407e001  ! 175: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x87902112  ! 176: WRPR_TT_I	wrpr	%r0, 0x0112, %tt
mondo_0_45:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d948014  ! 177: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xa1902005  ! 178: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802089  ! 179: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 180: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 181: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_0_46:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d934002  ! 182: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0x8d902f57  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x0f57, %pstate
	.word 0xe49fc020  ! 184: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x38700001  ! 185: BPGU	<illegal instruction>
	.word 0x93d02034  ! 186: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe40fc000  ! 187: LDUB_R	ldub	[%r31 + %r0], %r18
	.word 0x87902039  ! 188: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
	.word 0xe527c002  ! 189: STF_R	st	%f18, [%r2, %r31]
	.word 0xe48008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4d004a0  ! 191: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0xe4d804a0  ! 192: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 193: LDX_R	ldx	[%r31 + %r0], %r18
tagged_0_47:
	taddcctv %r12, 0x1bd1, %r5
	.word 0xe407e001  ! 194: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x9269c011  ! 195: UDIVX_R	udivx 	%r7, %r17, %r9
	.word 0x8d903249  ! 196: WRPR_PSTATE_I	wrpr	%r0, 0x1249, %pstate
	.word 0x30700001  ! 197: BPA	<illegal instruction>
	.word 0xd28008a0  ! 198: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
mondo_0_48:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c008  ! 199: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
splash_lsu_0_49:
	setx 0x3b9aa7b7c117a081, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 201: LDX_R	ldx	[%r31 + %r0], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 202: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d450000  ! 203: RD_SET_SOFTINT	rd	%set_softint, %r6
	.word 0x879022ab  ! 204: WRPR_TT_I	wrpr	%r0, 0x02ab, %tt
	.word 0x8d902f82  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0f82, %pstate
mondo_0_50:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d91c000  ! 206: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
	.word 0x87902144  ! 207: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0x97520000  ! 208: RDPR_PIL	rdpr	%pil, %r11
	.word 0xd6cfe020  ! 209: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	.word 0xa190200c  ! 210: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd6d804a0  ! 211: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd68fe010  ! 212: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x87802089  ! 213: WRASI_I	wr	%r0, 0x0089, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_51)) -> intp(0,1,3)
xir_0_51:
	.word 0xa980e001  ! 214: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x8d9034a3  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x14a3, %pstate
	.word 0x91902001  ! 216: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
DS_0_52:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f4, %f0
	.word 0x9bb0430a  ! 217: ALIGNADDRESS	alignaddr	%r1, %r10, %r13
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 219: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda9fc020  ! 220: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0x81510000  ! 221: RDPR_TICK	rdpr	%tick, %r0
	.word 0xda9fc020  ! 222: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89848001  ! 223: WRTICK_R	wr	%r18, %r1, %tick
	.word 0xda8008a0  ! 224: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda77c001  ! 225: STX_R	stx	%r13, [%r31 + %r1]
	.word 0x8f454000  ! 226: RD_CLEAR_SOFTINT	rd	%clear_softint, %r7
	.word 0xce8fe010  ! 227: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0xcf27c001  ! 228: STF_R	st	%f7, [%r1, %r31]
	.word 0x87902309  ! 229: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
	.word 0x8d90393f  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x193f, %pstate
splash_lsu_0_54:
	setx 0x4ca9c1dfdb94366b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_0_55:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 232: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02035  ! 233: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_0_56:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d908012  ! 234: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 235: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d9027d0  ! 236: WRPR_PSTATE_I	wrpr	%r0, 0x07d0, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r7
intveclr_0_57:
	set 0xa7e63104, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 238: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcf37e001  ! 239: STQF_I	-	%f7, [0x0001, %r31]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xceffc032  ! 241: SWAPA_R	swapa	%r7, [%r31 + %r18] 0x01
splash_htba_0_58:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 242: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 243: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d9038c4  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x18c4, %pstate
	.word 0x9f802001  ! 245: SIR	sir	0x0001
splash_htba_0_59:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 246: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
intveclr_0_60:
	set 0x3ee589fc, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 247: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xced00e40  ! 248: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r7
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_61:
	taddcctv %r1, 0x1ed2, %r23
	.word 0xce07e001  ! 250: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x85450000  ! 251: RD_SET_SOFTINT	rd	%set_softint, %r2
debug_0_62:
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 253: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982f4d  ! 256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_63)) -> intp(0,1,3)
xir_0_63:
	.word 0xa9816001  ! 257: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xc44fc000  ! 258: LDSB_R	ldsb	[%r31 + %r0], %r2
splash_lsu_0_64:
	setx 0xc66a4a36829449ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 259: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc497e010  ! 261: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r2
	.word 0x87902395  ! 262: WRPR_TT_I	wrpr	%r0, 0x0395, %tt
	.word 0x819820d4  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
	.word 0x91d02033  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_65:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 265: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_66)) -> intp(0,1,3)
xir_0_66:
	.word 0xa984a001  ! 266: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
splash_lsu_0_67:
	setx 0x4625f7657fbe6d87, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 267: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc537e001  ! 268: STQF_I	-	%f2, [0x0001, %r31]
DS_0_68:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xd7473f43	! Random illegal ?
	.word 0xe312c005  ! 1: LDQF_R	-	[%r11, %r5], %f17
	.word 0xa3a28829  ! 269: FADDs	fadds	%f10, %f9, %f17
	.word 0xe2c7e020  ! 270: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
	.word 0x81510000  ! 271: RDPR_TICK	rdpr	%tick, %r0
change_to_randtl_0_69:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_69:
	.word 0x8f902003  ! 272: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
intveclr_0_70:
	set 0x944c1e8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982d44  ! 274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
splash_lsu_0_71:
	setx 0xbecfeca64fd0549b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 275: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_0_72:
	tsubcctv %r5, 0x1ac2, %r19
	.word 0xe207e001  ! 277: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_lsu_0_73:
	setx 0xce5c093731060c9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 278: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c80e40  ! 279: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r17
	.word 0xe2d004a0  ! 280: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902255  ! 283: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0xe2cfe000  ! 284: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xa190200a  ! 285: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_0_74:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91800d  ! 286: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	.word 0x8345c000  ! 287: RD_TICK_CMPR_REG	rd	%-, %r1
	.word 0xc327e001  ! 288: STF_I	st	%f1, [0x0001, %r31]
	.word 0xc317c000  ! 289: LDQF_R	-	[%r31, %r0], %f1
intveclr_0_75:
	set 0x8e4ebc20, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_76:
	tsubcctv %r25, 0x15da, %r14
	.word 0xc207e001  ! 291: LDUW_I	lduw	[%r31 + 0x0001], %r1
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 293: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 294: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879022e7  ! 295: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc25fc000  ! 296: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc2dfe030  ! 297: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0x24700001  ! 298: BPLE	<illegal instruction>
	.word 0x97a000d0  ! 299: FNEGd	fnegd	%f16, %f42
	.word 0xd647e001  ! 300: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0xa9500000  ! 301: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xe88008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x9482a001  ! 303: ADDcc_I	addcc 	%r10, 0x0001, %r10
tagged_0_77:
	taddcctv %r19, 0x19f1, %r1
	.word 0xd407e001  ! 304: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x93902004  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879021ef  ! 306: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0x93902000  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_78)) -> intp(0,1,3)
xir_0_78:
	.word 0xa984a001  ! 308: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
debug_0_79:
	setx debug_0_79 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa551c000  ! 311: RDPR_TL	<illegal instruction>
	.word 0xe49fc020  ! 312: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0xe4c004a0  ! 313: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0x87802014  ! 314: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe48008a0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d9029d4  ! 316: WRPR_PSTATE_I	wrpr	%r0, 0x09d4, %pstate
	.word 0xe4dfe010  ! 317: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r18
	.word 0xa0d4000d  ! 318: UMULcc_R	umulcc 	%r16, %r13, %r16
mondo_0_80:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 319: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
intveclr_0_81:
	set 0x75c521ac, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 320: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902003  ! 322: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x34700001  ! 323: BPG	<illegal instruction>
	.word 0x87802014  ! 324: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93520000  ! 325: RDPR_PIL	rdpr	%pil, %r9
	.word 0x81460000  ! 326: RD_STICK_REG	stbar
	.word 0xa190200a  ! 327: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd337c001  ! 328: STQF_R	-	%f9, [%r1, %r31]
change_to_randtl_0_82:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_82:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_0_83:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 330: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xd25fe001  ! 331: LDX_I	ldx	[%r31 + 0x0001], %r9
splash_lsu_0_84:
	setx 0xebfbb68e06ca92fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 332: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_85:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f22, %f16
	.word 0x99b2c302  ! 333: ALIGNADDRESS	alignaddr	%r11, %r2, %r12
splash_lsu_0_86:
	setx 0xcd5a6011b7b5ba8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 334: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8c004a0  ! 335: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0xa1902006  ! 336: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_0_87:
	setx 0x4d3eef8b79b5a54d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 337: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd82fe001  ! 338: STB_I	stb	%r12, [%r31 + 0x0001]
	.word 0x2e700001  ! 339: BPVS	<illegal instruction>
	.word 0xd857c000  ! 340: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x8d802000  ! 341: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd91fc000  ! 342: LDDF_R	ldd	[%r31, %r0], %f12
debug_0_88:
	setx debug_0_88 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 343: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_89)) -> intp(0,1,3)
xir_0_89:
	.word 0xa9802001  ! 344: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xd88fe000  ! 345: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xd89fe001  ! 346: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
intveclr_0_90:
	set 0xfa8553a3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 347: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8b454000  ! 348: RD_CLEAR_SOFTINT	rd	%clear_softint, %r5
	.word 0xca1fc000  ! 349: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xca8008a0  ! 350: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcb37c002  ! 351: STQF_R	-	%f5, [%r2, %r31]
tagged_0_91:
	taddcctv %r1, 0x1159, %r19
	.word 0xca07e001  ! 352: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca2fe001  ! 353: STB_I	stb	%r5, [%r31 + 0x0001]
	.word 0x30800001  ! 354: BA	ba,a	<label_0x1>
	.word 0x82fc4010  ! 355: SDIVcc_R	sdivcc 	%r17, %r16, %r1
	.word 0x8780204f  ! 356: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_0_92:
	set 0xdb36d206, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 357: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc2880e40  ! 358: LDUBA_R	lduba	[%r0, %r0] 0x72, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc2800be0  ! 360: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_93)) -> intp(0,1,3)
xir_0_93:
	.word 0xa984e001  ! 361: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xa781e001  ! 362: WR_GRAPHICS_STATUS_REG_I	wr	%r7, 0x0001, %-
	.word 0xc2c80e60  ! 363: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r1
	.word 0x99540000  ! 364: RDPR_GL	<illegal instruction>
tagged_0_94:
	tsubcctv %r18, 0x196b, %r3
	.word 0xd807e001  ! 365: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_lsu_0_95:
	setx 0xecf48de86f45f96f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_96:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 367: WR_STICK_REG_I	wr	%r13, 0x0001, %-
change_to_randtl_0_97:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_97:
	.word 0x8f902003  ! 368: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd80fe001  ! 369: LDUB_I	ldub	[%r31 + 0x0001], %r12
tagged_0_98:
	tsubcctv %r22, 0x15b6, %r14
	.word 0xd807e001  ! 370: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_cmpr_0_99:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 371: WR_STICK_REG_I	wr	%r0, 0x0001, %-
splash_htba_0_100:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 372: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
intveclr_0_101:
	set 0x4571992b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 374: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8d7e020  ! 375: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x34800001  ! 377: BG	bg,a	<label_0x1>
	.word 0xd88fe030  ! 378: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	.word 0x89514000  ! 379: RDPR_TBA	rdpr	%tba, %r4
splash_cmpr_0_102:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 380: WR_STICK_REG_I	wr	%r4, 0x0001, %-
splash_lsu_0_103:
	setx 0x0b730996ccedddab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 381: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
mondo_0_104:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d950011  ! 383: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xa1902001  ! 384: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_0_105:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x87b0c30d  ! 385: ALIGNADDRESS	alignaddr	%r3, %r13, %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 386: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x879020da  ! 387: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
debug_0_106:
	setx debug_0_106 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 388: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc68008a0  ! 389: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1834004  ! 390: WR_STICK_REG_R	wr	%r13, %r4, %-
	.word 0x87802020  ! 391: WRASI_I	wr	%r0, 0x0020, %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 393: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_108:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c00d  ! 394: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x87802058  ! 395: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_0_109:
	setx 0x3dfdaf8fbba9d493, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 396: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 397: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 398: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x91464000  ! 399: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0x879021c5  ! 400: WRPR_TT_I	wrpr	%r0, 0x01c5, %tt
splash_lsu_0_110:
	setx 0x3f8d249fa0033bef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 401: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd03fc00d  ! 402: STD_R	std	%r8, [%r31 + %r13]
	.word 0xd08008a0  ! 403: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0800ac0  ! 404: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0x8d9025f3  ! 405: WRPR_PSTATE_I	wrpr	%r0, 0x05f3, %pstate
	.word 0xd0d7e000  ! 406: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	.word 0xa1508000  ! 407: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8780204f  ! 408: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe0bfe001  ! 409: STDA_I	stda	%r16, [%r31 + 0x0001] %asi
splash_lsu_0_111:
	setx 0x3cae23498eda6655, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_112:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 411: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0xe11fe001  ! 412: LDDF_I	ldd	[%r31, 0x0001], %f16
	.word 0xe00fe001  ! 413: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0x9194a001  ! 414: WRPR_PIL_I	wrpr	%r18, 0x0001, %pil
	.word 0xe01fc000  ! 415: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0x819824cd  ! 416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
	.word 0xa1902004  ! 417: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802080  ! 418: WRASI_I	wr	%r0, 0x0080, %asi
DS_0_113:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd310005  ! 1: STQF_R	-	%f6, [%r5, %r4]
	normalw
	.word 0x8f458000  ! 419: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xcedfe020  ! 420: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0xa1508000  ! 421: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x8d902738  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x0738, %pstate
	.word 0xa1902000  ! 423: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe08008a0  ! 424: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d802000  ! 425: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa951c000  ! 426: RDPR_TL	rdpr	%tl, %r20
debug_0_114:
	mov 0x38, %r18
	.word 0xfef00b12  ! 427: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_115:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 428: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 429: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe89fe001  ! 430: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
debug_0_116:
	mov 0x38, %r18
	.word 0xfef00b12  ! 431: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_117:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d92c00a  ! 432: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0x2c700001  ! 433: BPNEG	<illegal instruction>
debug_0_118:
	setx debug_0_118 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 434: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad82a001  ! 435: WR_SOFTINT_REG_I	wr	%r10, 0x0001, %softint
splash_lsu_0_119:
	setx 0xc2ab32fb51e207b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 436: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_120:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_120:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 438: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_0_121:
	set 0x7a17402a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 439: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_122:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3332001  ! 1: STQF_I	-	%f17, [0x0001, %r12]
	normalw
	.word 0x8b458000  ! 440: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x87902060  ! 441: WRPR_TT_I	wrpr	%r0, 0x0060, %tt
	.word 0xcacfe020  ! 442: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0x8d903a01  ! 443: WRPR_PSTATE_I	wrpr	%r0, 0x1a01, %pstate
tagged_0_123:
	taddcctv %r9, 0x1e6e, %r19
	.word 0xca07e001  ! 444: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 445: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d020b4  ! 446: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8790235e  ! 447: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
mondo_0_124:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d920010  ! 448: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 449: LDX_R	ldx	[%r31 + %r0], %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_125)) -> intp(0,1,3)
xir_0_125:
	.word 0xa984a001  ! 450: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x87802088  ! 451: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81460000  ! 452: RD_STICK_REG	stbar
splash_lsu_0_126:
	setx 0x515a6ec186474b0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 453: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 454: RDPR_GL	rdpr	%-, %r9
	.word 0xd2dfe000  ! 455: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
	.word 0x879020e0  ! 456: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_127)) -> intp(0,1,3)
xir_0_127:
	.word 0xa9816001  ! 457: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xa1902004  ! 458: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902008  ! 459: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802016  ! 460: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa5508000  ! 461: RDPR_TSTATE	rdpr	%tstate, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 462: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_128:
	mov 0x38, %r18
	.word 0xfef00b12  ! 463: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x30700001  ! 464: BPA	<illegal instruction>
	.word 0x93902003  ! 465: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe41fe001  ! 466: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0xe527e001  ! 467: STF_I	st	%f18, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe457c000  ! 469: LDSH_R	ldsh	[%r31 + %r0], %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_129)) -> intp(0,1,3)
xir_0_129:
	.word 0xa9816001  ! 470: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
tagged_0_130:
	tsubcctv %r13, 0x119a, %r9
	.word 0xe407e001  ! 472: LDUW_I	lduw	[%r31 + 0x0001], %r18
DS_0_131:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f8, %f8
	.word 0x91b4830c  ! 473: ALIGNADDRESS	alignaddr	%r18, %r12, %r8
	.word 0xd08008a0  ! 474: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x99902001  ! 475: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
tagged_0_132:
	tsubcctv %r24, 0x1fc9, %r14
	.word 0xd007e001  ! 476: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8cd2e001  ! 477: UMULcc_I	umulcc 	%r11, 0x0001, %r6
	.word 0x8d9033a5  ! 478: WRPR_PSTATE_I	wrpr	%r0, 0x13a5, %pstate
	.word 0xcc47c000  ! 479: LDSW_R	ldsw	[%r31 + %r0], %r6
tagged_0_133:
	taddcctv %r21, 0x1be5, %r12
	.word 0xcc07e001  ! 480: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8008a0  ! 481: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91d02034  ! 482: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d020b3  ! 483: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902006  ! 484: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_134:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 485: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x93902004  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902001  ! 487: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9351c000  ! 488: RDPR_TL	rdpr	%tl, %r9
	.word 0xd2d7e020  ! 489: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
	.word 0xd257e001  ! 490: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0x93902002  ! 491: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902000  ! 492: WRPR_GL_I	wrpr	%r0, 0x0000, %-
intveclr_0_135:
	set 0xc01c98d7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 493: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_136:
	setx 0x2ee6ee4c12a07905, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_137:
	set 0xb20a2c20, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 495: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 496: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 497: LDX_R	ldx	[%r31 + %r0], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd29004a0  ! 499: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xab81c005  ! 500: WR_CLEAR_SOFTINT_R	wr	%r7, %r5, %clear_softint
	.word 0xa1902001  ! 501: WRPR_GL_I	wrpr	%r0, 0x0001, %-
tagged_0_138:
	tsubcctv %r20, 0x133b, %r2
	.word 0xd207e001  ! 502: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8d508000  ! 503: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x9f802001  ! 504: SIR	sir	0x0001
	.word 0x93d02032  ! 505: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x36700001  ! 506: BPGE	<illegal instruction>
	.word 0x93902007  ! 507: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_139:
	set 0x28f1a4ad, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_140:
	tsubcctv %r3, 0x1cf8, %r7
	.word 0xcc07e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_141:
	set 0x70b55117, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 510: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_0_142:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 511: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_143:
	setx 0xc7be667712d3004b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 512: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 513: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 514: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x81460000  ! 515: RD_STICK_REG	stbar
DS_0_144:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xf9570c17	! Random illegal ?
	.word 0xa1a00540  ! 1: FSQRTd	fsqrt	
	.word 0x97a50824  ! 516: FADDs	fadds	%f20, %f4, %f11
	.word 0x8780204f  ! 517: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_0_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_145:
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd727c004  ! 519: STF_R	st	%f11, [%r4, %r31]
	.word 0x8d9020a0  ! 520: WRPR_PSTATE_I	wrpr	%r0, 0x00a0, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 521: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c7e030  ! 522: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
splash_cmpr_0_146:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 523: WR_STICK_REG_I	wr	%r8, 0x0001, %-
splash_lsu_0_147:
	setx 0x15e4994fefb118b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 524: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 525: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802089  ! 526: WRASI_I	wr	%r0, 0x0089, %asi
intveclr_0_148:
	set 0x7d44c514, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 527: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 528: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 529: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd64fe001  ! 530: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x87802063  ! 531: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x82d2400d  ! 532: UMULcc_R	umulcc 	%r9, %r13, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_149)) -> intp(0,1,3)
xir_0_149:
	.word 0xa9836001  ! 533: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xc2800a60  ! 534: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
	.word 0xc2cfe000  ! 535: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0x93d02035  ! 536: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_0_150:
	setx 0xe793aa480099cde5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 537: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_151:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d930012  ! 538: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xc2800a80  ! 539: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r1
	.word 0xc237e001  ! 540: STH_I	sth	%r1, [%r31 + 0x0001]
	.word 0xc20fc000  ! 541: LDUB_R	ldub	[%r31 + %r0], %r1
splash_lsu_0_152:
	setx 0x786ce455a7146841, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 542: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 543: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_153:
	setx 0xf3e5432b9048f589, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc2d7e000  ! 545: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0xc257e001  ! 546: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0xc207c000  ! 547: LDUW_R	lduw	[%r31 + %r0], %r1
DS_0_154:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9306001  ! 1: STQF_I	-	%f20, [0x0001, %r1]
	normalw
	.word 0x93458000  ! 548: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x91d02035  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd2d80e40  ! 550: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
	.word 0xd28008a0  ! 551: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	ta	T_CHANGE_HPRIV	! macro
debug_0_155:
	mov 0x38, %r18
	.word 0xfef00b12  ! 553: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_156:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 554: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x91906001  ! 555: WRPR_PIL_I	wrpr	%r1, 0x0001, %pil
	.word 0xd20fe001  ! 556: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x87802010  ! 557: WRASI_I	wr	%r0, 0x0010, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 558: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x879022a0  ! 559: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 560: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_157)) -> intp(0,1,3)
xir_0_157:
	.word 0xa980a001  ! 561: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 562: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_158:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3332001  ! 1: STQF_I	-	%f17, [0x0001, %r12]
	normalw
	.word 0x93458000  ! 563: RD_SOFTINT_REG	rd	%softint, %r9
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 564: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd257c000  ! 565: LDSH_R	ldsh	[%r31 + %r0], %r9
intveclr_0_159:
	set 0xdd42f7dc, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 566: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 567: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa04a4010  ! 568: MULX_R	mulx 	%r9, %r16, %r16
mondo_0_160:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d918008  ! 569: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
DS_0_161:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 570: SAVE_R	save	%r31, %r0, %r31
	.word 0xe0dfe020  ! 571: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r16
	.word 0x93902004  ! 572: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_162)) -> intp(0,1,3)
xir_0_162:
	.word 0xa9846001  ! 573: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xa1902005  ! 574: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe0dfe000  ! 575: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0x8d9029eb  ! 576: WRPR_PSTATE_I	wrpr	%r0, 0x09eb, %pstate
intveclr_0_163:
	set 0x94426d32, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 577: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
intveclr_0_164:
	set 0x9bf277e5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 579: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 580: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x90fa0012  ! 581: SDIVcc_R	sdivcc 	%r8, %r18, %r8
	.word 0x8198251d  ! 582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051d, %hpstate
	.word 0xd04fc000  ! 583: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xd01fe001  ! 584: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0xd007c000  ! 585: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0x87802014  ! 586: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902082  ! 587: WRPR_TT_I	wrpr	%r0, 0x0082, %tt
	.word 0xd08804a0  ! 588: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xd137e001  ! 589: STQF_I	-	%f8, [0x0001, %r31]
	.word 0xd00fe001  ! 590: LDUB_I	ldub	[%r31 + 0x0001], %r8
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 591: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd09fc020  ! 592: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 593: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 594: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_lsu_0_165:
	setx 0x292677de1d2b98bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 595: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd08008a0  ! 597: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x38700001  ! 598: BPGU	<illegal instruction>
	.word 0xd137e001  ! 599: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x20800001  ! 600: BN	bn,a	<label_0x1>
change_to_randtl_0_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_166:
	.word 0x8f902002  ! 601: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x97a01a6d  ! 602: FqTOi	fqtoi	
	.word 0x2c700001  ! 603: BPNEG	<illegal instruction>
	.word 0xd657c000  ! 604: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x8145c000  ! 605: RD_TICK_CMPR_REG	stbar
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36c2001  ! 606: SDIVX_I	sdivx	%r16, 0x0001, %r17
	.word 0x26800001  ! 607: BL	bl,a	<label_0x1>
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8790233d  ! 609: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	.word 0xe29fe001  ! 610: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
splash_lsu_0_168:
	setx 0x8c3a4695c2da39bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 611: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1514000  ! 613: RDPR_TBA	rdpr	%tba, %r16
	.word 0xe08008a0  ! 614: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 615: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe127e001  ! 616: STF_I	st	%f16, [0x0001, %r31]
	.word 0x879020d6  ! 617: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
splash_lsu_0_169:
	setx 0xc26fdfa9875876d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 618: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe197e001  ! 619: LDQFA_I	-	[%r31, 0x0001], %f16
tagged_0_170:
	tsubcctv %r3, 0x1ab5, %r15
	.word 0xe007e001  ! 620: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x93902004  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe0d7e000  ! 622: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_0_171:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 623: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0xe08008a0  ! 624: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 625: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x87902131  ! 626: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
	.word 0x9745c000  ! 627: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xd69fe001  ! 628: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0x8d902bc6  ! 629: WRPR_PSTATE_I	wrpr	%r0, 0x0bc6, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7494000  ! 631: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x9f802001  ! 632: SIR	sir	0x0001
	.word 0xa981800d  ! 633: WR_SET_SOFTINT_R	wr	%r6, %r13, %set_softint
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 634: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 635: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe6c804a0  ! 637: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
tagged_0_172:
	tsubcctv %r2, 0x1a59, %r14
	.word 0xe607e001  ! 638: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe6800b40  ! 639: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r19
	.word 0x36700001  ! 640: BPGE	<illegal instruction>
	.word 0x8d903913  ! 641: WRPR_PSTATE_I	wrpr	%r0, 0x1913, %pstate
	.word 0x8f500000  ! 642: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x24800001  ! 643: BLE	ble,a	<label_0x1>
DS_0_173:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd530c001  ! 1: STQF_R	-	%f10, [%r1, %r3]
	normalw
	.word 0x89458000  ! 644: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x81510000  ! 645: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d802000  ! 646: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_174:
	mov 0x38, %r18
	.word 0xfef00b12  ! 647: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902009  ! 648: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9f802001  ! 649: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0xa9454000  ! 651: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe81fc000  ! 652: LDD_R	ldd	[%r31 + %r0], %r20
splash_lsu_0_175:
	setx 0xf48636b8c1b67627, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 654: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_176:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x815151ea	! Random illegal ?
	.word 0xcb11000b  ! 1: LDQF_R	-	[%r4, %r11], %f5
	.word 0x99a20830  ! 655: FADDs	fadds	%f8, %f16, %f12
	.word 0xd88008a0  ! 656: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_0_177:
	set 0x2bea3e9d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 657: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_178:
	setx 0x92a4fbd16f912261, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 658: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1844002  ! 659: WR_STICK_REG_R	wr	%r17, %r2, %-
	.word 0xa190200c  ! 660: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 662: BG	bg,a	<label_0x1>
	.word 0x8f51c000  ! 663: RDPR_TL	rdpr	%tl, %r7
	.word 0xced804a0  ! 664: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0x26800001  ! 665: BL	bl,a	<label_0x1>
	.word 0x91d02032  ! 666: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_180:
	mov 0x38, %r18
	.word 0xfef00b12  ! 667: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b454000  ! 668: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_0_181:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 670: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda4fe001  ! 671: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x879022ff  ! 672: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
	.word 0xdb3fc002  ! 673: STDF_R	std	%f13, [%r2, %r31]
	.word 0xa8d8c00c  ! 674: SMULcc_R	smulcc 	%r3, %r12, %r20
DS_0_182:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 675: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8780204f  ! 676: WRASI_I	wr	%r0, 0x004f, %asi
mondo_0_183:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d948003  ! 677: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x24700001  ! 678: BPLE	<illegal instruction>
	.word 0x8d9037a6  ! 679: WRPR_PSTATE_I	wrpr	%r0, 0x17a6, %pstate
	.word 0x87802014  ! 680: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902002  ! 681: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902004  ! 682: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
intveclr_0_184:
	set 0xc10ba964, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 683: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe847e001  ! 684: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0x9745c000  ! 685: RD_TICK_CMPR_REG	rd	%-, %r11
tagged_0_185:
	taddcctv %r12, 0x158f, %r23
	.word 0xd607e001  ! 686: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd60fe001  ! 687: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0xd6800bc0  ! 688: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	.word 0x87802063  ! 689: WRASI_I	wr	%r0, 0x0063, %asi
tagged_0_186:
	tsubcctv %r11, 0x1226, %r25
	.word 0xd607e001  ! 690: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x879021cf  ! 691: WRPR_TT_I	wrpr	%r0, 0x01cf, %tt
	.word 0x87802004  ! 692: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902233  ! 693: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
intveclr_0_187:
	set 0x3e061b87, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 694: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd717c000  ! 695: LDQF_R	-	[%r31, %r0], %f11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 696: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 697: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 698: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xad81e001  ! 699: WR_SOFTINT_REG_I	wr	%r7, 0x0001, %softint
	.word 0xd797e001  ! 700: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0xa7480000  ! 701: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
tagged_0_188:
	tsubcctv %r19, 0x1e6b, %r19
	.word 0xe607e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x8790236d  ! 703: WRPR_TT_I	wrpr	%r0, 0x036d, %tt
	.word 0xe6dfe030  ! 704: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
	.word 0x87802016  ! 705: WRASI_I	wr	%r0, 0x0016, %asi
splash_htba_0_189:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 706: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_190)) -> intp(0,1,3)
xir_0_190:
	.word 0xa980e001  ! 707: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
tagged_0_191:
	taddcctv %r1, 0x1a8e, %r13
	.word 0xe607e001  ! 708: LDUW_I	lduw	[%r31 + 0x0001], %r19
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 709: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_192:
	mov 0x38, %r18
	.word 0xfef00b12  ! 710: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe60fe001  ! 711: LDUB_I	ldub	[%r31 + 0x0001], %r19
	.word 0x8d802000  ! 712: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982056  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0056, %hpstate
	.word 0x95500000  ! 714: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xd4c00e60  ! 715: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
	ta	T_CHANGE_HPRIV	! macro
debug_0_193:
	setx debug_0_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 717: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd597e001  ! 718: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x93902007  ! 719: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 720: LDX_R	ldx	[%r31 + %r0], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 722: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87454000  ! 723: RD_CLEAR_SOFTINT	rd	%clear_softint, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_194)) -> intp(0,1,3)
xir_0_194:
	.word 0xa984e001  ! 724: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 725: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc68fe010  ! 726: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	.word 0xa1902002  ! 727: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8f702001  ! 728: POPC_I	popc	0x0001, %r7
DS_0_195:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3346001  ! 1: STQF_I	-	%f17, [0x0001, %r17]
	normalw
	.word 0x95458000  ! 729: RD_SOFTINT_REG	rd	%softint, %r10
debug_0_196:
	setx debug_0_196 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 730: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 731: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa9520000  ! 732: RDPR_PIL	rdpr	%pil, %r20
	.word 0xe8d004a0  ! 733: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
intveclr_0_197:
	set 0xacdc86eb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 734: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_198:
	setx 0xd13f1eb7efeef94b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 735: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 736: RDPR_GL	rdpr	%-, %r9
	.word 0x81982086  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0xd28008a0  ! 738: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 739: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd28fe010  ! 740: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 741: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d514000  ! 742: RDPR_TBA	rdpr	%tba, %r6
	.word 0x87802014  ! 743: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93702001  ! 744: POPC_I	popc	0x0001, %r9
DS_0_199:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 745: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_0_200:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d910012  ! 746: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
intveclr_0_201:
	set 0xa7bb4bab, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 747: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_202:
	setx debug_0_202 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 748: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd2dfe010  ! 749: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd28fe000  ! 750: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d903ce3  ! 751: WRPR_PSTATE_I	wrpr	%r0, 0x1ce3, %pstate
	.word 0xd28fe000  ! 752: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r9
	.word 0x93902000  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_203)) -> intp(0,1,3)
xir_0_203:
	.word 0xa982a001  ! 754: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x81510000  ! 755: RDPR_TICK	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 756: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd29004a0  ! 757: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_204)) -> intp(0,1,3)
xir_0_204:
	.word 0xa9826001  ! 758: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xa190200d  ! 759: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd29fc020  ! 760: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xa1902004  ! 761: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd2d7e010  ! 762: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0x93902003  ! 763: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d464000  ! 764: RD_STICK_CMPR_REG	rd	%-, %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_205)) -> intp(0,1,3)
xir_0_205:
	.word 0xa9836001  ! 765: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x93450000  ! 766: RD_SET_SOFTINT	rd	%set_softint, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 767: LDX_R	ldx	[%r31 + %r0], %r9
	ta	T_CHANGE_PRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_206)) -> intp(0,1,3)
xir_0_206:
	.word 0xa984a001  ! 769: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xd2d00e60  ! 770: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_207)) -> intp(0,1,3)
xir_0_207:
	.word 0xa980e001  ! 771: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
intveclr_0_208:
	set 0xfac03f18, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 772: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 773: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_0_209:
	setx 0x920e914cf3e53815, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 774: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87a149d3  ! 775: FDIVd	fdivd	%f36, %f50, %f34
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8968e001  ! 776: SDIVX_I	sdivx	%r3, 0x0001, %r4
	.word 0x879021a6  ! 777: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
mondo_0_211:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d950012  ! 778: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xc88008a0  ! 779: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
intveclr_0_212:
	set 0x789c8a26, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 780: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7816001  ! 781: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x0001, %-
	.word 0x91d020b2  ! 782: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1814003  ! 783: WR_STICK_REG_R	wr	%r5, %r3, %-
	.word 0x879020e9  ! 784: WRPR_TT_I	wrpr	%r0, 0x00e9, %tt
	.word 0xa190200a  ! 785: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x26800001  ! 786: BL	bl,a	<label_0x1>
splash_lsu_0_214:
	setx 0x0ae0012d82e1867d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 787: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 788: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_0_215:
	mov 0x38, %r18
	.word 0xfef00b12  ! 789: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879022b9  ! 790: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	.word 0x3e700001  ! 791: BPVC	<illegal instruction>
	.word 0xc857e001  ! 792: LDSH_I	ldsh	[%r31 + 0x0001], %r4
intveclr_0_216:
	set 0xff24f65e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 793: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021d6  ! 794: WRPR_TT_I	wrpr	%r0, 0x01d6, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 795: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8d9029d2  ! 796: WRPR_PSTATE_I	wrpr	%r0, 0x09d2, %pstate
	.word 0x8f454000  ! 797: RD_CLEAR_SOFTINT	rd	%clear_softint, %r7
	.word 0x83d020b5  ! 798: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xce8008a0  ! 799: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
intveclr_0_217:
	set 0x13788f5d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 800: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_218:
	tsubcctv %r4, 0x1093, %r18
	.word 0xce07e001  ! 801: LDUW_I	lduw	[%r31 + 0x0001], %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_219)) -> intp(0,1,3)
xir_0_219:
	.word 0xa980a001  ! 802: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xcedfe030  ! 803: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0x81982dcf  ! 804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcf, %hpstate
	.word 0x87802088  ! 805: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99902000  ! 806: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902005  ! 807: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_0_220:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f2, %f16
	.word 0x8bb0c305  ! 808: ALIGNADDRESS	alignaddr	%r3, %r5, %r5
splash_tba_0_221:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 809: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_222:
	set 0x293a41b2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 810: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 811: BPGU	<illegal instruction>
intveclr_0_223:
	set 0x2816c8e8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 812: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xca900e60  ! 813: LDUHA_R	lduha	[%r0, %r0] 0x73, %r5
	.word 0x87902120  ! 814: WRPR_TT_I	wrpr	%r0, 0x0120, %tt
debug_0_224:
	mov 0x38, %r18
	.word 0xfef00b12  ! 815: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xca9fc020  ! 816: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
change_to_randtl_0_225:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_225:
	.word 0x8f902003  ! 817: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_226:
	setx debug_0_226 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 818: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
tagged_0_227:
	taddcctv %r19, 0x1e23, %r11
	.word 0xca07e001  ! 820: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca47e001  ! 821: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0x8780201c  ! 822: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xca0fc000  ! 823: LDUB_R	ldub	[%r31 + %r0], %r5
DS_0_228:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 824: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 825: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 826: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa5450000  ! 827: RD_SET_SOFTINT	rd	%set_softint, %r18
mondo_0_229:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d94400b  ! 828: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
intveclr_0_230:
	set 0x1668248a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 829: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99508000  ! 830: RDPR_TSTATE	rdpr	%tstate, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 831: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x879023b3  ! 832: WRPR_TT_I	wrpr	%r0, 0x03b3, %tt
	.word 0x8d802004  ! 833: WRFPRS_I	wr	%r0, 0x0004, %fprs
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 834: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8cfe020  ! 835: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0xd8c7e010  ! 836: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
mondo_0_231:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d910004  ! 837: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r12
debug_0_232:
	setx debug_0_232 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 839: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd84fc000  ! 840: LDSB_R	ldsb	[%r31 + %r0], %r12
splash_tba_0_233:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 841: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_234:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 842: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x8d90208f  ! 843: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1824011  ! 844: WR_STICK_REG_R	wr	%r9, %r17, %-
	.word 0x8790233b  ! 845: WRPR_TT_I	wrpr	%r0, 0x033b, %tt
intveclr_0_236:
	set 0x16a2dea5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 846: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e94  ! 847: WRPR_PSTATE_I	wrpr	%r0, 0x1e94, %pstate
	.word 0x8d90306a  ! 848: WRPR_PSTATE_I	wrpr	%r0, 0x106a, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_237)) -> intp(0,1,3)
xir_0_237:
	.word 0xa9836001  ! 849: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x87802004  ! 850: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902003  ! 851: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd84fe001  ! 852: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x8b520000  ! 853: RDPR_PIL	rdpr	%pil, %r5
mondo_0_238:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d91c007  ! 854: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	ta	T_CHANGE_PRIV	! macro
debug_0_239:
	mov 0x38, %r18
	.word 0xfef00b12  ! 856: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81460000  ! 857: RD_STICK_REG	stbar
	.word 0x9194a001  ! 858: WRPR_PIL_I	wrpr	%r18, 0x0001, %pil
	.word 0xca47e001  ! 859: LDSW_I	ldsw	[%r31 + 0x0001], %r5
tagged_0_240:
	tsubcctv %r5, 0x12a3, %r1
	.word 0xca07e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca47c000  ! 861: LDSW_R	ldsw	[%r31 + %r0], %r5
debug_0_241:
	setx debug_0_241 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 862: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_242:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 863: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_243:
	setx 0x579803d591825e75, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 864: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_244:
	setx 0xa11f9c696e7b4d2b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 865: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_cmpr_0_245:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 867: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xcacfe010  ! 868: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0xa5690007  ! 869: SDIVX_R	sdivx	%r4, %r7, %r18
	.word 0x87802058  ! 870: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x30800001  ! 871: BA	ba,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 872: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_246:
	mov 0x38, %r18
	.word 0xfef00b12  ! 873: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_247:
	setx debug_0_247 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 874: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 875: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_0_248:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f28, %f12
	.word 0x8bb28303  ! 876: ALIGNADDRESS	alignaddr	%r10, %r3, %r5
splash_lsu_0_249:
	setx 0x31b4774585f9eb29, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 877: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x80d42001  ! 878: UMULcc_I	umulcc 	%r16, 0x0001, %r0
	.word 0x93902001  ! 879: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802088  ! 880: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 881: WRASI_I	wr	%r0, 0x0004, %asi
tagged_0_250:
	tsubcctv %r6, 0x1362, %r9
	.word 0xc007e001  ! 882: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2c700001  ! 883: BPNEG	<illegal instruction>
	.word 0x93d02034  ! 884: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc09fc020  ! 885: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_251)) -> intp(0,1,3)
xir_0_251:
	.word 0xa984a001  ! 886: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xc047c000  ! 887: LDSW_R	ldsw	[%r31 + %r0], %r0
DS_0_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 888: SAVE_R	save	%r31, %r0, %r31
	.word 0xc0800c80  ! 889: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r0
	.word 0xc09004a0  ! 890: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_253)) -> intp(0,1,3)
xir_0_253:
	.word 0xa9802001  ! 891: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xc09004a0  ! 892: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 893: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 894: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879022a2  ! 895: WRPR_TT_I	wrpr	%r0, 0x02a2, %tt
	.word 0x87802016  ! 896: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_0_254:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 897: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_255:
	mov 0x38, %r18
	.word 0xfef00b12  ! 898: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc02fc003  ! 899: STB_R	stb	%r0, [%r31 + %r3]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 900: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc04fc000  ! 901: LDSB_R	ldsb	[%r31 + %r0], %r0
tagged_0_256:
	tsubcctv %r24, 0x158b, %r2
	.word 0xc007e001  ! 902: LDUW_I	lduw	[%r31 + 0x0001], %r0
splash_lsu_0_257:
	setx 0x42694b4ce39cee4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 903: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc097e020  ! 905: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc05fc000  ! 906: LDX_R	ldx	[%r31 + %r0], %r0
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87480000  ! 908: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
mondo_0_258:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d948001  ! 909: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
mondo_0_259:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d940007  ! 910: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0xa190200a  ! 911: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_0_260:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 912: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0xc61fe001  ! 913: LDD_I	ldd	[%r31 + 0x0001], %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 914: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x83d020b2  ! 915: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xc6d004a0  ! 916: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x87902249  ! 917: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0x36800001  ! 918: BGE	bge,a	<label_0x1>
debug_0_261:
	mov 0x38, %r18
	.word 0xfef00b12  ! 919: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200a  ! 920: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 921: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x93902000  ! 922: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_0_262:
	setx 0x97028b648c75f769, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 923: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_263:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 924: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0xc68008a0  ! 925: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8780201c  ! 926: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902007  ! 927: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa9494000  ! 928: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x97540000  ! 929: RDPR_GL	<illegal instruction>
	.word 0x9f802001  ! 930: SIR	sir	0x0001
mondo_0_264:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d908012  ! 931: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0xd727e001  ! 932: STF_I	st	%f11, [0x0001, %r31]
	.word 0x97514000  ! 933: RDPR_TBA	rdpr	%tba, %r11
	.word 0x91d02033  ! 934: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd61fc000  ! 935: LDD_R	ldd	[%r31 + %r0], %r11
splash_htba_0_265:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 936: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879022cc  ! 937: WRPR_TT_I	wrpr	%r0, 0x02cc, %tt
	.word 0xa1454000  ! 938: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0x8d90320c  ! 939: WRPR_PSTATE_I	wrpr	%r0, 0x120c, %pstate
debug_0_266:
	mov 0x38, %r18
	.word 0xfef00b12  ! 940: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_267:
	set 0x75871710, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 941: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 942: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe057e001  ! 943: LDSH_I	ldsh	[%r31 + 0x0001], %r16
	.word 0x8790208d  ! 944: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
	.word 0x8d902e9b  ! 945: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	.word 0xe09fe001  ! 946: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x93902007  ! 947: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_269:
	set 0xaa1f7e35, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 948: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902084  ! 949: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
	.word 0x81460000  ! 950: RD_STICK_REG	stbar
splash_cmpr_0_270:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 951: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x8d9029c9  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x09c9, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89808005  ! 953: WRTICK_R	wr	%r2, %r5, %tick
	.word 0xe01fc000  ! 954: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0xe0800c40  ! 955: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r16
	.word 0xa9830010  ! 956: WR_SET_SOFTINT_R	wr	%r12, %r16, %set_softint
tagged_0_272:
	tsubcctv %r4, 0x1e58, %r22
	.word 0xe007e001  ! 957: LDUW_I	lduw	[%r31 + 0x0001], %r16
DS_0_273:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8fa0054c  ! 1: FSQRTd	fsqrt	
	.word 0x8fa1c826  ! 958: FADDs	fadds	%f7, %f6, %f7
debug_0_274:
	setx debug_0_274 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 959: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200c  ! 960: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa9514000  ! 961: RDPR_TBA	rdpr	%tba, %r20
	.word 0x87802063  ! 962: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe8c004a0  ! 963: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
splash_lsu_0_275:
	setx 0xbeea313563849e07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 964: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_276:
	tsubcctv %r20, 0x145f, %r13
	.word 0xe807e001  ! 965: LDUW_I	lduw	[%r31 + 0x0001], %r20
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 966: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa945c000  ! 967: RD_TICK_CMPR_REG	rd	%-, %r20
splash_lsu_0_277:
	setx 0x8c3134bbc38c0d5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab82c000  ! 969: WR_CLEAR_SOFTINT_R	wr	%r11, %r0, %clear_softint
	.word 0xe88008a0  ! 970: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa190200f  ! 971: WRPR_GL_I	wrpr	%r0, 0x000f, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_278)) -> intp(0,1,3)
xir_0_278:
	.word 0xa981a001  ! 972: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0x93494000  ! 973: RDHPR_HTBA	rdhpr	%htba, %r9
DS_0_279:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc3114011  ! 1: LDQF_R	-	[%r5, %r17], %f1
	.word 0x8fa44834  ! 974: FADDs	fadds	%f17, %f20, %f7
splash_lsu_0_280:
	setx 0xd69d82322d778f8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 975: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_281)) -> intp(0,1,3)
xir_0_281:
	.word 0xa9812001  ! 976: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_282)) -> intp(0,1,3)
xir_0_282:
	.word 0xa9852001  ! 977: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
intveclr_0_283:
	set 0x77f6918f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 978: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879023df  ! 979: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 980: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_284:
	tsubcctv %r13, 0x1aaf, %r21
	.word 0xce07e001  ! 981: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce8804a0  ! 982: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xce8008a0  ! 983: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
DS_0_285:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc1302001  ! 1: STQF_I	-	%f0, [0x0001, %r0]
	normalw
	.word 0x95458000  ! 984: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8780201c  ! 985: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879021a8  ! 986: WRPR_TT_I	wrpr	%r0, 0x01a8, %tt
tagged_0_286:
	tsubcctv %r13, 0x1d96, %r16
	.word 0xd407e001  ! 987: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4d804a0  ! 988: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd48008a0  ! 989: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x879023e5  ! 990: WRPR_TT_I	wrpr	%r0, 0x03e5, %tt
	.word 0xd4c7e020  ! 991: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0x93902003  ! 992: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 993: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd44fe001  ! 994: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xa190200e  ! 995: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902003  ! 996: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_287)) -> intp(0,1,3)
xir_0_287:
	.word 0xa9832001  ! 997: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xd4800ba0  ! 998: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
splash_tba_0_288:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 999: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_289:
	set 0x43849fe2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1000: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd527e001  ! 1001: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8d90294b  ! 1002: WRPR_PSTATE_I	wrpr	%r0, 0x094b, %pstate
	.word 0xd4c7e030  ! 1003: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
splash_tba_0_290:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1004: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_291)) -> intp(0,1,3)
xir_0_291:
	.word 0xa9816001  ! 1005: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
splash_lsu_0_292:
	setx 0xb42bbab3876b1b45, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1006: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a3b  ! 1007: WRPR_PSTATE_I	wrpr	%r0, 0x1a3b, %pstate
	.word 0x879021ad  ! 1008: WRPR_TT_I	wrpr	%r0, 0x01ad, %tt
splash_tba_0_293:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1009: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x36700001  ! 1010: BPGE	<illegal instruction>
	.word 0x93902006  ! 1011: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_cmpr_0_294:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1846001  ! 1012: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0xd437c014  ! 1013: STH_R	sth	%r10, [%r31 + %r20]
debug_0_295:
	setx debug_0_295 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1014: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd49fc020  ! 1015: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
DS_0_296:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1016: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d903a52  ! 1017: WRPR_PSTATE_I	wrpr	%r0, 0x1a52, %pstate
	.word 0xd427c014  ! 1018: STW_R	stw	%r10, [%r31 + %r20]
intveclr_0_297:
	set 0x52e7fab7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1019: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 1020: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_298)) -> intp(0,1,3)
xir_0_298:
	.word 0xa984e001  ! 1021: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xd517c000  ! 1022: LDQF_R	-	[%r31, %r0], %f10
debug_0_299:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1023: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_300)) -> intp(0,1,3)
xir_0_300:
	.word 0xa9852001  ! 1024: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa1902006  ! 1025: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_0_301:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_301:
	.word 0x8f902005  ! 1026: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8d9035f3  ! 1027: WRPR_PSTATE_I	wrpr	%r0, 0x15f3, %pstate
intveclr_0_302:
	set 0x54c4ce55, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1028: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_303:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x81b3030a  ! 1029: ALIGNADDRESS	alignaddr	%r12, %r10, %r0
	.word 0xc057e001  ! 1030: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	.word 0x8d903917  ! 1031: WRPR_PSTATE_I	wrpr	%r0, 0x1917, %pstate
	.word 0x8d464000  ! 1032: RD_STICK_CMPR_REG	rd	%-, %r6
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1033: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 1034: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93d020b2  ! 1035: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x87802080  ! 1036: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879020bf  ! 1037: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
	.word 0xcc1fe001  ! 1038: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8790224b  ! 1039: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
tagged_0_304:
	tsubcctv %r16, 0x181a, %r22
	.word 0xcc07e001  ! 1040: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_305:
	set 0x84755cdd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1041: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_306)) -> intp(0,1,3)
xir_0_306:
	.word 0xa981a001  ! 1042: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xcd17c000  ! 1043: LDQF_R	-	[%r31, %r0], %f6
	ta	T_CHANGE_PRIV	! macro
debug_0_307:
	setx debug_0_307 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1045: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9810003  ! 1046: WR_SET_SOFTINT_R	wr	%r4, %r3, %set_softint
	.word 0xcc1fc000  ! 1047: LDD_R	ldd	[%r31 + %r0], %r6
splash_htba_0_308:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1048: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_0_309:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1049: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_310:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1050: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802004  ! 1051: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90259e  ! 1052: WRPR_PSTATE_I	wrpr	%r0, 0x059e, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 1053: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_311)) -> intp(0,1,3)
xir_0_311:
	.word 0xa9806001  ! 1054: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
DS_0_312:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b1c305  ! 1055: ALIGNADDRESS	alignaddr	%r7, %r5, %r9
	.word 0xd31fe001  ! 1056: LDDF_I	ldd	[%r31, 0x0001], %f9
	.word 0xa1902001  ! 1057: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x83d02035  ! 1058: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902004  ! 1059: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_PRIV	! macro
tagged_0_313:
	taddcctv %r14, 0x111f, %r3
	.word 0xd207e001  ! 1061: LDUW_I	lduw	[%r31 + 0x0001], %r9
intveclr_0_314:
	set 0xb5d8d33, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1062: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83504000  ! 1063: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x36700001  ! 1064: BPGE	<illegal instruction>
	.word 0x3e700001  ! 1065: BPVC	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_315)) -> intp(0,1,3)
xir_0_315:
	.word 0xa9842001  ! 1066: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xc2c004a0  ! 1067: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_316)) -> intp(0,1,3)
xir_0_316:
	.word 0xa980a001  ! 1068: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x87802058  ! 1069: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802063  ! 1070: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa353c000  ! 1071: RDPR_FQ	<illegal instruction>
	.word 0xe21fc000  ! 1072: LDD_R	ldd	[%r31 + %r0], %r17
tagged_0_317:
	taddcctv %r22, 0x16ab, %r3
	.word 0xe207e001  ! 1073: LDUW_I	lduw	[%r31 + 0x0001], %r17
debug_0_318:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1074: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87540000  ! 1075: RDPR_GL	rdpr	%-, %r3
mondo_0_319:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d910009  ! 1076: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
debug_0_320:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1077: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_321:
	setx 0xd173642680f8288b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1078: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_0_322:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1079: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_323:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d918011  ! 1080: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 1081: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 1082: LDD_R	ldd	[%r31 + %r0], %r3
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1083: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902313  ! 1084: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
tagged_0_324:
	tsubcctv %r21, 0x151b, %r18
	.word 0xc607e001  ! 1085: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x99514000  ! 1086: RDPR_TBA	rdpr	%tba, %r12
	.word 0xa190200d  ! 1087: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa9840007  ! 1088: WR_SET_SOFTINT_R	wr	%r16, %r7, %set_softint
	.word 0x8d802000  ! 1089: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902074  ! 1090: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
	ta	T_CHANGE_PRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1092: LDX_R	ldx	[%r31 + %r0], %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_325)) -> intp(0,1,3)
xir_0_325:
	.word 0xa9812001  ! 1093: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xd8d804a0  ! 1094: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x87802016  ! 1095: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd81fc000  ! 1096: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x8945c000  ! 1097: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0x91d02033  ! 1098: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_326:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1099: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xc997e001  ! 1100: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0xc8800aa0  ! 1101: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r4
	.word 0x2c700001  ! 1102: BPNEG	<illegal instruction>
	.word 0x8d902d72  ! 1103: WRPR_PSTATE_I	wrpr	%r0, 0x0d72, %pstate
splash_lsu_0_327:
	setx 0xf549581886076077, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 1105: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc81fc000  ! 1106: LDD_R	ldd	[%r31 + %r0], %r4
splash_tba_0_328:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1107: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 1108: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc91fc000  ! 1109: LDDF_R	ldd	[%r31, %r0], %f4
	.word 0x99480000  ! 1110: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xa5494000  ! 1111: RDHPR_HTBA	rdhpr	%htba, %r18
debug_0_329:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1112: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4c004a0  ! 1113: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0x9345c000  ! 1114: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xa190200e  ! 1115: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 1116: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 1117: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xd31fc000  ! 1118: LDDF_R	ldd	[%r31, %r0], %f9
	.word 0xd2dfe030  ! 1119: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xd31fe001  ! 1120: LDDF_I	ldd	[%r31, 0x0001], %f9
	.word 0xa3702001  ! 1121: POPC_I	popc	0x0001, %r17
intveclr_0_330:
	set 0xdf040808, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1122: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe2d004a0  ! 1123: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
change_to_randtl_0_331:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_331:
	.word 0x8f902004  ! 1124: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe247e001  ! 1125: LDSW_I	ldsw	[%r31 + 0x0001], %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_332)) -> intp(0,1,3)
xir_0_332:
	.word 0xa9806001  ! 1126: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x89500000  ! 1127: RDPR_TPC	<illegal instruction>
	.word 0xc82fe001  ! 1128: STB_I	stb	%r4, [%r31 + 0x0001]
	.word 0xc89fe001  ! 1129: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
debug_0_333:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_334:
	setx 0xbaf8d330519ffa25, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_335)) -> intp(0,1,3)
xir_0_335:
	.word 0xa982a001  ! 1132: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x87902323  ! 1133: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
splash_tba_0_336:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1134: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 1135: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x38800001  ! 1136: BGU	bgu,a	<label_0x1>
mondo_0_337:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d940004  ! 1137: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
tagged_0_338:
	tsubcctv %r17, 0x1e58, %r5
	.word 0xc807e001  ! 1138: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x87802016  ! 1139: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_339:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1140: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_340:
	tsubcctv %r21, 0x1a0c, %r4
	.word 0xc807e001  ! 1141: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x93902002  ! 1142: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022b7  ! 1144: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
	.word 0xc84fe001  ! 1145: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x87802063  ! 1146: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc857e001  ! 1147: LDSH_I	ldsh	[%r31 + 0x0001], %r4
DS_0_341:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcb30c012  ! 1: STQF_R	-	%f5, [%r18, %r3]
	normalw
	.word 0x85458000  ! 1148: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4cfe000  ! 1149: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0xc4d7e030  ! 1150: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0xc4dfe010  ! 1151: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0xc447c000  ! 1152: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x87802016  ! 1153: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982c86  ! 1154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c86, %hpstate
	.word 0xc4c7e000  ! 1155: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x8d802000  ! 1156: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_342:
	tsubcctv %r9, 0x1b84, %r12
	.word 0xc407e001  ! 1157: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4c004a0  ! 1158: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0xc48804a0  ! 1159: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0x83d020b5  ! 1160: Tcc_I	te	icc_or_xcc, %r0 + 181
mondo_0_343:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944003  ! 1161: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0x8353c000  ! 1162: RDPR_FQ	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_344)) -> intp(0,1,3)
xir_0_344:
	.word 0xa9806001  ! 1163: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
DS_0_345:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba00548  ! 1: FSQRTd	fsqrt	
	.word 0x83a1c82c  ! 1164: FADDs	fadds	%f7, %f12, %f1
	.word 0xc2d00e40  ! 1165: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r1
splash_cmpr_0_346:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 1166: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xc28804a0  ! 1167: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
tagged_0_347:
	taddcctv %r6, 0x15cd, %r19
	.word 0xc207e001  ! 1168: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc29004a0  ! 1169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0xc237e001  ! 1170: STH_I	sth	%r1, [%r31 + 0x0001]
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1171: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01969  ! 1172: FqTOd	dis not found

	.word 0x87902282  ! 1173: WRPR_TT_I	wrpr	%r0, 0x0282, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_349:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc3352001  ! 1: STQF_I	-	%f1, [0x0001, %r20]
	normalw
	.word 0x99458000  ! 1175: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x93d02033  ! 1176: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0xa984800a  ! 1178: WR_SET_SOFTINT_R	wr	%r18, %r10, %set_softint
	.word 0xd81fc000  ! 1179: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x99902004  ! 1180: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 1182: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8f480000  ! 1183: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xcec7e010  ! 1184: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 1185: LDX_R	ldx	[%r31 + %r0], %r7
intveclr_0_350:
	set 0x59f53b11, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90347b  ! 1187: WRPR_PSTATE_I	wrpr	%r0, 0x147b, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87514000  ! 1190: RDPR_TBA	rdpr	%tba, %r3
	.word 0x879022d3  ! 1191: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0xc677c00a  ! 1192: STX_R	stx	%r3, [%r31 + %r10]
tagged_0_351:
	taddcctv %r8, 0x1a3f, %r22
	.word 0xc607e001  ! 1193: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc61fc000  ! 1194: LDD_R	ldd	[%r31 + %r0], %r3
debug_0_352:
	setx debug_0_352 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1195: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc6c80e40  ! 1196: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
	.word 0x93902001  ! 1197: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc68008a0  ! 1198: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
mondo_0_353:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92c005  ! 1199: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
	.word 0x93902005  ! 1200: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902697  ! 1201: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
tagged_0_354:
	tsubcctv %r18, 0x1476, %r21
	.word 0xc607e001  ! 1202: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_0_355:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f4, %f18
	.word 0x83b44306  ! 1203: ALIGNADDRESS	alignaddr	%r17, %r6, %r1
	.word 0x8d902daf  ! 1204: WRPR_PSTATE_I	wrpr	%r0, 0x0daf, %pstate
	.word 0xc21fc000  ! 1205: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x91d020b2  ! 1206: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_0_356:
	setx 0x900295a070704b85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1207: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc29fc020  ! 1208: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
splash_tba_0_357:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790215a  ! 1210: WRPR_TT_I	wrpr	%r0, 0x015a, %tt
	.word 0xa550c000  ! 1211: RDPR_TT	rdpr	%tt, %r18
	.word 0xe41fe001  ! 1212: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0x819827dd  ! 1213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
debug_0_358:
	setx debug_0_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1214: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02035  ! 1216: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_0_359:
	set 0xf30744e5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1217: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab828012  ! 1218: WR_CLEAR_SOFTINT_R	wr	%r10, %r18, %clear_softint
	.word 0x38700001  ! 1219: BPGU	<illegal instruction>
	.word 0x99902002  ! 1220: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902001  ! 1221: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe48008a0  ! 1222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_0_360:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1223: SAVE_R	save	%r31, %r0, %r31
	.word 0xe41fe001  ! 1224: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0xa1902002  ! 1225: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790221b  ! 1226: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	.word 0x8e826001  ! 1227: ADDcc_I	addcc 	%r9, 0x0001, %r7
	.word 0xa9828004  ! 1228: WR_SET_SOFTINT_R	wr	%r10, %r4, %set_softint
DS_0_361:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe932a001  ! 1: STQF_I	-	%f20, [0x0001, %r10]
	normalw
	.word 0x8f458000  ! 1229: RD_SOFTINT_REG	rd	%softint, %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_362)) -> intp(0,1,3)
xir_0_362:
	.word 0xa9816001  ! 1230: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
mondo_0_363:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d904014  ! 1231: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0x34800001  ! 1232: BG	bg,a	<label_0x1>
	.word 0xa1902001  ! 1233: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802004  ! 1234: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_364)) -> intp(0,1,3)
xir_0_364:
	.word 0xa980e001  ! 1235: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xced004a0  ! 1236: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x8d902a07  ! 1237: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
tagged_0_365:
	taddcctv %r15, 0x1ce0, %r26
	.word 0xce07e001  ! 1238: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x9b50c000  ! 1239: RDPR_TT	rdpr	%tt, %r13
	.word 0xda8fe000  ! 1240: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0xdb37c014  ! 1241: STQF_R	-	%f13, [%r20, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1242: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 1243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d903b90  ! 1244: WRPR_PSTATE_I	wrpr	%r0, 0x1b90, %pstate
splash_lsu_0_366:
	setx 0x32c491ea21c888ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1245: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 1246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa6d4a001  ! 1247: UMULcc_I	umulcc 	%r18, 0x0001, %r19
DS_0_367:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f26, %f24
	.word 0xa7b2c312  ! 1248: ALIGNADDRESS	alignaddr	%r11, %r18, %r19
	.word 0xa9800010  ! 1249: WR_SET_SOFTINT_R	wr	%r0, %r16, %set_softint
	.word 0x8750c000  ! 1250: RDPR_TT	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_368)) -> intp(0,1,3)
xir_0_368:
	.word 0xa9846001  ! 1251: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1252: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc797e001  ! 1253: LDQFA_I	-	[%r31, 0x0001], %f3
	.word 0xc6dfe010  ! 1254: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1255: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6c804a0  ! 1256: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x81510000  ! 1257: RDPR_TICK	<illegal instruction>
DS_0_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd534c010  ! 1: STQF_R	-	%f10, [%r16, %r19]
	normalw
	.word 0x93458000  ! 1258: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd23fe001  ! 1259: STD_I	std	%r9, [%r31 + 0x0001]
splash_cmpr_0_370:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 1260: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x93902004  ! 1261: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 1262: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd2c00e40  ! 1263: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r9
	.word 0x91d02035  ! 1264: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa9834013  ! 1265: WR_SET_SOFTINT_R	wr	%r13, %r19, %set_softint
	.word 0x87802088  ! 1266: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95464000  ! 1267: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd48008a0  ! 1268: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd48fe020  ! 1269: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd42fe001  ! 1270: STB_I	stb	%r10, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_371)) -> intp(0,1,3)
xir_0_371:
	.word 0xa9826001  ! 1271: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 1272: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_372:
	tsubcctv %r11, 0x1713, %r14
	.word 0xd407e001  ! 1273: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 1274: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4bfc033  ! 1275: STDA_R	stda	%r10, [%r31 + %r19] 0x01
splash_tba_0_373:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1276: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x30700001  ! 1277: BPA	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1278: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87902317  ! 1279: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xd51fe001  ! 1281: LDDF_I	ldd	[%r31, 0x0001], %f10
	ta	T_CHANGE_PRIV	! macro
	.word 0xd4d004a0  ! 1283: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xa1902008  ! 1284: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902001  ! 1285: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd4d004a0  ! 1286: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd4800b00  ! 1287: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r10
	.word 0x8d802004  ! 1288: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd4800c00  ! 1289: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x93450000  ! 1290: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0x99494000  ! 1291: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xd80fe001  ! 1292: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0xd84fc000  ! 1293: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x879021e4  ! 1294: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
debug_0_374:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1295: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02035  ! 1296: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xd83fc013  ! 1297: STD_R	std	%r12, [%r31 + %r19]
	.word 0xd927c013  ! 1298: STF_R	st	%f12, [%r19, %r31]
mondo_0_375:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 1299: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x91d02034  ! 1300: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1301: LDX_R	ldx	[%r31 + %r0], %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1302: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 1303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_lsu_0_376:
	setx 0x17757377aad87247, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1304: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 1305: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb184800d  ! 1306: WR_STICK_REG_R	wr	%r18, %r13, %-
tagged_0_378:
	tsubcctv %r26, 0x1cf1, %r19
	.word 0xd807e001  ! 1307: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd8900e60  ! 1308: LDUHA_R	lduha	[%r0, %r0] 0x73, %r12
	.word 0xd91fe001  ! 1309: LDDF_I	ldd	[%r31, 0x0001], %f12
	.word 0x87454000  ! 1310: RD_CLEAR_SOFTINT	rd	%clear_softint, %r3
debug_0_379:
	setx debug_0_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1311: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802058  ! 1312: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d802000  ! 1313: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_0_380:
	setx 0xb2d9efa4c04233f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f06  ! 1315: WRPR_PSTATE_I	wrpr	%r0, 0x0f06, %pstate
	.word 0xa1902008  ! 1316: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_381:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1317: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 1318: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 1319: LDD_R	ldd	[%r31 + %r0], %r3
	ta	T_CHANGE_PRIV	! macro
tagged_0_382:
	tsubcctv %r7, 0x1899, %r1
	.word 0xc607e001  ! 1321: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x8d903763  ! 1322: WRPR_PSTATE_I	wrpr	%r0, 0x1763, %pstate
	.word 0xad802001  ! 1323: WR_SOFTINT_REG_I	wr	%r0, 0x0001, %softint
	.word 0x81982956  ! 1324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
DS_0_383:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f6, %f10
	.word 0x91b44311  ! 1325: ALIGNADDRESS	alignaddr	%r17, %r17, %r8
tagged_0_384:
	tsubcctv %r21, 0x132e, %r5
	.word 0xd007e001  ! 1326: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x3c800001  ! 1327: BPOS	bpos,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 1328: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd047e001  ! 1329: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f696001  ! 1330: SDIVX_I	sdivx	%r5, 0x0001, %r7
	.word 0x8780201c  ! 1331: WRASI_I	wr	%r0, 0x001c, %asi
splash_htba_0_386:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1332: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_387:
	setx 0x0a43f4d68a5c972f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1333: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903300  ! 1334: WRPR_PSTATE_I	wrpr	%r0, 0x1300, %pstate
	.word 0xa5a00549  ! 1335: FSQRTd	fsqrt	
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1336: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 1337: BNE	bne,a	<label_0x1>
debug_0_388:
	setx debug_0_388 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1338: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe44fe001  ! 1339: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0xe4cfe010  ! 1340: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r18
splash_lsu_0_389:
	setx 0x7cdcfd560df498c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1341: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1342: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe4c7e010  ! 1343: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_390:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1345: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xe48008a0  ! 1346: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4cfe020  ! 1347: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1348: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe4d004a0  ! 1349: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
mondo_0_391:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 1350: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xe48008a0  ! 1351: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x91d020b5  ! 1352: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1353: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe40fc000  ! 1354: LDUB_R	ldub	[%r31 + %r0], %r18
intveclr_0_392:
	set 0x15d90c98, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1355: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4ffc034  ! 1356: SWAPA_R	swapa	%r18, [%r31 + %r20] 0x01
	.word 0xa1a489e4  ! 1357: FDIVq	dis not found

	.word 0x93d02032  ! 1358: Tcc_I	tne	icc_or_xcc, %r0 + 50
DS_0_393:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1359: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe007c000  ! 1360: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0x93902003  ! 1361: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_394)) -> intp(0,1,3)
xir_0_394:
	.word 0xa980e001  ! 1362: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
mondo_0_395:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d92c004  ! 1363: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
tagged_0_396:
	tsubcctv %r10, 0x1dc7, %r5
	.word 0xe007e001  ! 1364: LDUW_I	lduw	[%r31 + 0x0001], %r16
splash_lsu_0_397:
	setx 0x03d294a90164f091, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90318b  ! 1366: WRPR_PSTATE_I	wrpr	%r0, 0x118b, %pstate
	.word 0xe197e001  ! 1367: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0x87802089  ! 1368: WRASI_I	wr	%r0, 0x0089, %asi
splash_lsu_0_398:
	setx 0xb898e4b94308bb7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1370: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_399:
	setx 0xb557d5c767517acf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1494000  ! 1372: RDHPR_HTBA	rdhpr	%htba, %r16
intveclr_0_400:
	set 0x5b33b914, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790205f  ! 1374: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_401)) -> intp(0,1,3)
xir_0_401:
	.word 0xa9802001  ! 1375: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_402)) -> intp(0,1,3)
xir_0_402:
	.word 0xa9806001  ! 1376: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
splash_lsu_0_403:
	setx 0xaf1e75afd269acb9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 1378: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe097e030  ! 1379: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
	.word 0xe08008a0  ! 1380: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200f  ! 1381: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe097e030  ! 1382: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
splash_tba_0_404:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87514000  ! 1384: RDPR_TBA	rdpr	%tba, %r3
	.word 0xc727e001  ! 1385: STF_I	st	%f3, [0x0001, %r31]
DS_0_405:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc334e001  ! 1: STQF_I	-	%f1, [0x0001, %r19]
	normalw
	.word 0x9b458000  ! 1386: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x88c1a001  ! 1387: ADDCcc_I	addccc 	%r6, 0x0001, %r4
	.word 0xc857e001  ! 1388: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8168e001  ! 1389: SDIVX_I	sdivx	%r3, 0x0001, %r0
mondo_0_407:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d940003  ! 1390: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	ta	T_CHANGE_PRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_408)) -> intp(0,1,3)
xir_0_408:
	.word 0xa9846001  ! 1392: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xc11fe001  ! 1393: LDDF_I	ldd	[%r31, 0x0001], %f0
	.word 0xc047e001  ! 1394: LDSW_I	ldsw	[%r31 + 0x0001], %r0
debug_0_409:
	setx debug_0_409 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1395: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 1396: SIR	sir	0x0001
	.word 0x93902003  ! 1397: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_0_410:
	setx 0xfc6eb337b9dc3c55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_411:
	setx 0x35aeb9aa986ad1cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1400: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1401: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc09fe001  ! 1402: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0x93902000  ! 1403: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902005  ! 1404: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc04fe001  ! 1405: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0x9b51c000  ! 1406: RDPR_TL	rdpr	%tl, %r13
	.word 0xda9fe001  ! 1407: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
debug_0_412:
	setx debug_0_412 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1408: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_413:
	setx 0x1893aad47def564b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1409: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 1410: BPGE	<illegal instruction>
	.word 0x93902002  ! 1411: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_0_414:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1412: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1413: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8d902085  ! 1414: WRPR_PSTATE_I	wrpr	%r0, 0x0085, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 1416: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xda8804a0  ! 1417: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
splash_lsu_0_415:
	setx 0x3245bc3ac31729bf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1418: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_416:
	setx 0xbde59968793c44df, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1419: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 1420: WRPR_GL_I	wrpr	%r0, 0x000b, %-
mondo_0_417:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c007  ! 1421: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0x87802089  ! 1422: WRASI_I	wr	%r0, 0x0089, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1423: LDX_R	ldx	[%r31 + %r0], %r13
tagged_0_418:
	tsubcctv %r26, 0x11f9, %r2
	.word 0xda07e001  ! 1424: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x93902002  ! 1425: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xdaffc027  ! 1426: SWAPA_R	swapa	%r13, [%r31 + %r7] 0x01
	.word 0xdacfe020  ! 1427: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
splash_lsu_0_419:
	setx 0xd5b67aaf2a7ada71, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1428: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_420:
	setx 0x2039bc13e4db39a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1429: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda9fc020  ! 1430: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
splash_tba_0_421:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1431: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_422)) -> intp(0,1,3)
xir_0_422:
	.word 0xa980a001  ! 1432: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x81510000  ! 1433: RDPR_TICK	<illegal instruction>
	.word 0x8780204f  ! 1434: WRASI_I	wr	%r0, 0x004f, %asi
DS_0_423:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc9144001  ! 1: LDQF_R	-	[%r17, %r1], %f4
	.word 0x8fa40829  ! 1435: FADDs	fadds	%f16, %f9, %f7
	.word 0xce800b60  ! 1436: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	.word 0x884ac008  ! 1437: MULX_R	mulx 	%r11, %r8, %r4
	.word 0x89480000  ! 1438: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0xc89fc020  ! 1439: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x93902006  ! 1440: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902574  ! 1441: WRPR_PSTATE_I	wrpr	%r0, 0x0574, %pstate
	.word 0x87902362  ! 1442: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 1443: LDX_R	ldx	[%r31 + %r0], %r4
splash_lsu_0_424:
	setx 0x18ce6ef5b047bf7f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01967  ! 1445: FqTOd	dis not found

	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_426:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xd3685bf5	! Random illegal ?
	.word 0x9ba00547  ! 1: FSQRTd	fsqrt	
	.word 0x81a18834  ! 1447: FADDs	fadds	%f6, %f20, %f0
	.word 0x93902001  ! 1448: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902003  ! 1449: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_0_427:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8780201c  ! 1451: WRASI_I	wr	%r0, 0x001c, %asi
splash_lsu_0_428:
	setx 0x45e25b250502b9f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1452: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 1454: BPGE	<illegal instruction>
	.word 0xc00fc000  ! 1455: LDUB_R	ldub	[%r31 + %r0], %r0
debug_0_429:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1456: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982997  ! 1458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0997, %hpstate
	.word 0xc0d004a0  ! 1459: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0xc08fe010  ! 1460: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0x91d02034  ! 1461: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02033  ! 1462: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_0_430:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d90c00c  ! 1463: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	.word 0x83d02034  ! 1464: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_0_431:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1465: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_tba_0_432:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1466: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc02fc00c  ! 1467: STB_R	stb	%r0, [%r31 + %r12]
	.word 0x36700001  ! 1468: BPGE	<illegal instruction>
	.word 0xa1902001  ! 1469: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc09fe001  ! 1470: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
DS_0_433:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02033  ! 1472: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x28800001  ! 1474: BLEU	bleu,a	<label_0x1>
	.word 0xc04fe001  ! 1475: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xc0c7e020  ! 1476: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0xc13fe001  ! 1477: STDF_I	std	%f0, [0x0001, %r31]
	.word 0x8f454000  ! 1478: RD_CLEAR_SOFTINT	rd	%clear_softint, %r7
	.word 0x8780201c  ! 1479: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8790203f  ! 1480: WRPR_TT_I	wrpr	%r0, 0x003f, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_434)) -> intp(0,1,3)
xir_0_434:
	.word 0xa9842001  ! 1481: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 1482: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xa1902003  ! 1483: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xce47e001  ! 1484: LDSW_I	ldsw	[%r31 + 0x0001], %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_435)) -> intp(0,1,3)
xir_0_435:
	.word 0xa9812001  ! 1485: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
splash_tba_0_436:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_437:
	set 0x945ea1e9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1487: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_438:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_0_439:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1489: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_440:
	setx 0x0b9376f70340b547, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1490: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_441:
	setx 0xe5913434fe5b4b57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 1492: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xce800c20  ! 1493: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r7
	.word 0x93902003  ! 1494: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_442:
	set 0x650feecd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1495: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 1496: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x87520000  ! 1497: RDPR_PIL	rdpr	%pil, %r3
	.word 0xc68008a0  ! 1498: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_tba_0_443:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
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

	.xword	0xa0880633b6bdd05a
	.xword	0x9135b6587545bb2b
	.xword	0x045491a5eee2304c
	.xword	0xb8248a55ae43c7b2
	.xword	0x9e70947fe71e0ed8
	.xword	0xca131aa2c2974500
	.xword	0xe0a5cc49d4de75d1
	.xword	0xf4afce28b4bc8913
	.xword	0xaaa271d75a7eda62
	.xword	0x2e3dca51a740b902
	.xword	0x8f931ca7f29d083e
	.xword	0xdd04a7c831fbff63
	.xword	0xafabdfa246602d0e
	.xword	0x70aa8606bb4e9baa
	.xword	0xa478b3f2ae832c81
	.xword	0xf69802b1f3bb198c
	.xword	0x2381ec2b05a1b7b8
	.xword	0x810c7fb4391d6430
	.xword	0xb300d5cc03e47790
	.xword	0xcc7386647d321f3c
	.xword	0x885f1513b2cdd0c4
	.xword	0x446c2714ec11298c
	.xword	0xfa4b88ed39df9582
	.xword	0xf5deef33fcb3cfaa
	.xword	0x17d6c6195012245b
	.xword	0xdf9bb46184128f18
	.xword	0xb5d999aade816ecf
	.xword	0xa2d20b4413597734
	.xword	0xf5d98e3166e1467f
	.xword	0xa2055d8ce4bae129
	.xword	0x2d5de560edfd51d5
	.xword	0xe2a399fe408d17c6
	.xword	0xa0418b850d6bf4d4
	.xword	0xe42f65cdbaf4ea5e
	.xword	0x40a8115e3af46c4b
	.xword	0x70b7a70dd84efe9c
	.xword	0x7194c5652bb30c05
	.xword	0x7a013c429e974af8
	.xword	0xda283306598d77cc
	.xword	0xe1f746f48daee9a4
	.xword	0x739ca7ca1c0a0637
	.xword	0x672b0fbae6a8b8bb
	.xword	0x7a8d51dd3f302dee
	.xword	0x55e5410f31be6127
	.xword	0xba378fe6081aff05
	.xword	0x2155bb4f29d8d65d
	.xword	0x52b6a92918092afb
	.xword	0x09aed8361c1af0ca
	.xword	0x64136ef92752a63e
	.xword	0xbdfbe6a7e8804ea4
	.xword	0x5acc24573d539ba6
	.xword	0xe80eb5c54ede2cd9
	.xword	0x69eeed322d4566a4
	.xword	0x624883e5bd9c4067
	.xword	0x30135d2af5e31cc7
	.xword	0xf12691eec4d1f0d0
	.xword	0x4bb7aac74ffb2ce0
	.xword	0xda95958195ce0607
	.xword	0x857c79030700a136
	.xword	0xdb4cf8a63f5f7227
	.xword	0x4bcb3bc98e3b36ef
	.xword	0x9884fba6016a942b
	.xword	0xc71fbbafe70b9812
	.xword	0x5dd526514b8a58e9
	.xword	0x8473269b9cee4018
	.xword	0xed2bbf299f1deb5c
	.xword	0x729a238392bdf6ef
	.xword	0xd7b4602c8d48babb
	.xword	0x4fbc80c127b21cf7
	.xword	0x3d4001fe94ef1d01
	.xword	0x3bbd9ae13bc60c57
	.xword	0xff2a1720b8230b10
	.xword	0x0f70545c76d763db
	.xword	0x101078d74304a4c6
	.xword	0x69f2777769bee38d
	.xword	0xbf5f9ec0e17fb2fc
	.xword	0x92dae2f8732af0f9
	.xword	0xe2675afe691a9f82
	.xword	0x4e730001f6fb1694
	.xword	0xd90a0a33557b6d7a
	.xword	0x2184d900e19e2e5b
	.xword	0xa4d28b1e63e2bed8
	.xword	0x61370918c7aa9b51
	.xword	0xab59201d66e1cc7d
	.xword	0xcc350e62c9dd8556
	.xword	0xc35b1f27ebcbbd58
	.xword	0x798a078d6cb355d2
	.xword	0x4f225a8cb80b2632
	.xword	0x510447c04ecb2d35
	.xword	0xa754ad040d110c7b
	.xword	0x0c6bed3976fa1107
	.xword	0x89dac3cb0e35ee0b
	.xword	0x9d5a5d71a335ba56
	.xword	0xc10761ae0229ffcc
	.xword	0xc836ab4af722c6a5
	.xword	0x3a103a6605c73643
	.xword	0x1280055776e5cedb
	.xword	0xc4c4c7d84c7f4147
	.xword	0x8ca8586172276199
	.xword	0x26c352644f5c2f7c
	.xword	0xa09cc05a783aa940
	.xword	0x21c56b16c88d382b
	.xword	0x04931f8462b012bd
	.xword	0x7a64c4c3075a90c6
	.xword	0x0f631535274e5c2e
	.xword	0x4fe3ee7c100714c1
	.xword	0xbdd6eba51b97ea2e
	.xword	0x3287172c31c1f730
	.xword	0xc7e95a4cda065de8
	.xword	0xfcb00cdf6137a40f
	.xword	0x2c4a6a321b8c629a
	.xword	0xc5d9046f5b68e580
	.xword	0xca0d6a601052bd62
	.xword	0xbf26f61cf6de9881
	.xword	0x1f5df7d529710291
	.xword	0xc8f0623c7bf25677
	.xword	0x6ae36e604c2e6e97
	.xword	0xf7e670e776a6844a
	.xword	0xa472961124795dd9
	.xword	0x2f8bca29be515efa
	.xword	0xaf04ee79f1073af7
	.xword	0x5bdcdaddb81a695c
	.xword	0xe089a2e77db0c98d
	.xword	0xac413c7d4b95d73b
	.xword	0x28657650659c9462
	.xword	0xded24ef2012ae0d6
	.xword	0xce90fcf31c5287c3
	.xword	0x6325bd9c5b55890a
	.xword	0x53ce1c4794938bfc
	.xword	0x796e271e70ff593e
	.xword	0xff7cdaee50936817
	.xword	0xd66b4c69ccbd3398
	.xword	0x23b22a7f22c45107
	.xword	0x0c648174ed713e1e
	.xword	0x8e30cd61244f5890
	.xword	0xf31f24861a13a269
	.xword	0xce2e2f570e986b79
	.xword	0x93e8e56b8f8eef17
	.xword	0x249c4877c4e787ba
	.xword	0x7b270a24315a3096
	.xword	0xd3854350bd1abbaf
	.xword	0x3a059f784e81fca9
	.xword	0x07b754d38cc7abe5
	.xword	0x406d6d9f94fa8f87
	.xword	0x4a5e05aa41c872cf
	.xword	0x8b34a63c3be916c0
	.xword	0xee9b5a136df4e62a
	.xword	0x53148d54822384d4
	.xword	0x12059d6577050de5
	.xword	0x96a2820fcefcc9dc
	.xword	0x5be0577b5ada9fb1
	.xword	0x7d32c56c58f0db61
	.xword	0x693786384511471f
	.xword	0x505a60a5dd5ef266
	.xword	0x97253fb0b49c2de9
	.xword	0x4647a3748e24d164
	.xword	0x3f9a05fa329fcb06
	.xword	0x7533b05a6752f549
	.xword	0xad4207e45032495a
	.xword	0x4f2dec4599961818
	.xword	0xf7c1cb87b4c768bd
	.xword	0xa3a0c127ddb3076f
	.xword	0x431f239bf739c7e3
	.xword	0x85d077f3cfb3bbfc
	.xword	0x4b080cffc3d1f99f
	.xword	0x6587efd4331ec7c0
	.xword	0x55405ff98f3b72fa
	.xword	0xe3f7d936b377ede0
	.xword	0xf1a061af9db68778
	.xword	0x93cf82d9a825257e
	.xword	0x8ed781f553e36d2d
	.xword	0xf794430d9e9ad864
	.xword	0xbb58db700484dc48
	.xword	0x805d76c3fd873b53
	.xword	0xda3a8083a2d4709c
	.xword	0xdf93c6d30a4e0226
	.xword	0x0ff329f667e7afbf
	.xword	0xef8fd16aa2f6e248
	.xword	0xd0912736400bd6a9
	.xword	0x9d7f7d2a3a47ee19
	.xword	0x5a8369a691b04da8
	.xword	0x3ae4a5fb09607354
	.xword	0x2d5dd0740ae7dccf
	.xword	0x66a5790e3caa756f
	.xword	0x37230be47c1f01ab
	.xword	0x651bacdc0b494272
	.xword	0x6368d21b23e23c34
	.xword	0xe48b5b89a2b97b7a
	.xword	0x26db0b4ecf068177
	.xword	0xd68f46a0b6e1df88
	.xword	0x54f902113da76149
	.xword	0x023ab4033924cb75
	.xword	0x12670f29b4ca7fb7
	.xword	0x25f37169a2371ed4
	.xword	0x24077d32ea381eb3
	.xword	0x298256c0de8fed6e
	.xword	0x24ed87a30772b048
	.xword	0xcb12e71536d98f68
	.xword	0x8f2ad94b67209df0
	.xword	0x73a05c6157cf5040
	.xword	0x55bf3fd70a9c6bca
	.xword	0x21b40be227cf546e
	.xword	0x86bd37ce8600767c
	.xword	0x256b21fb84fd6913
	.xword	0x7306aa1304a5da76
	.xword	0xf3084419305116e1
	.xword	0x493dde165ca27c43
	.xword	0x7dae822663ac843e
	.xword	0xdb3068ced2747733
	.xword	0x5b75950df42e0574
	.xword	0x5097f85e0da557a7
	.xword	0xf386768186e8ce4e
	.xword	0x633fc3a36070e12b
	.xword	0x7912e3cc2718a5f0
	.xword	0x1aea69da41124eea
	.xword	0xd5dfc671d3894b59
	.xword	0x4359217aa9d449df
	.xword	0x98ac2cfea531a68b
	.xword	0x9b1e1261ffd856a0
	.xword	0x61f4bac5adcceb53
	.xword	0x4158b3c5d0a9e867
	.xword	0x6eb5529fc0ab3ceb
	.xword	0xef2eb8600d8d88bc
	.xword	0x91b1075288884020
	.xword	0x2aa78ead6f6a15b9
	.xword	0x214d854e7eccfd6d
	.xword	0x81deb5d656df8bde
	.xword	0x4a39c33ce67d1b19
	.xword	0xe76945590baf9bd7
	.xword	0x0c80d358232ad99e
	.xword	0x455b45442bec7bae
	.xword	0x3ee88052ac1fcb2f
	.xword	0xf942be152d8220be
	.xword	0x267161469327def6
	.xword	0xcd185505d7314341
	.xword	0xa6d8190708c855b7
	.xword	0xd95f1face25116bc
	.xword	0xb6e63ba286ae7a69
	.xword	0xe6bf0ce1c953754d
	.xword	0x6f6394546672f844
	.xword	0xa93f274ab659922d
	.xword	0x539a6d5fcdda25cf
	.xword	0x9c25d8a8aaaa9389
	.xword	0x1d567950d2ec770e
	.xword	0x71eb5ce1da395879
	.xword	0xa11275bc6061e478
	.xword	0xb796cb4e0a8d45e4
	.xword	0x1cb6e677a4701c85
	.xword	0xf54eb0f9e297cb29
	.xword	0x1d2c1b084a37e4f0
	.xword	0x2a1f7f57d1ae5dcf
	.xword	0xa556dd202c2744ba
	.xword	0x128173e839a1ed04
	.xword	0x05b245b5e53bdb7a
	.xword	0x67e45d716ee2a6dc
	.xword	0xcb0195e583761117

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
# 329 "diag.j"



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

