/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_11.s
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

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
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
	mov 0xb3, %r14
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
	mov 0xb3, %r14
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

	.word 0x9b454000  ! 1: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xa190200f  ! 2: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xad846001  ! 3: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
splash_cmpr_0_0:
	setx 0xc6983605b1cb85bb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 4: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_1:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d944004  ! 5: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
intveclr_0_2:
	set 0x8b36e81f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_3)) -> intp(0,1,3)
xir_0_3:
	.word 0xa980a001  ! 7: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x93902007  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8790217b  ! 9: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
DS_0_4:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x9b5bb0a7	! Random illegal ?
	.word 0xa1a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x9ba08832  ! 10: FADDs	fadds	%f2, %f18, %f13
tagged_0_5:
	taddcctv %r10, 0x14aa, %r6
	.word 0xda07e001  ! 11: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x2c800001  ! 12: BNEG	bneg,a	<label_0x1>
	.word 0x89b20fe8  ! 13: FONES	e	%f4
	.word 0xc847e001  ! 14: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0xc917c000  ! 15: LDQF_R	-	[%r31, %r0], %f4
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 16: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90284d  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
tagged_0_6:
	tsubcctv %r26, 0x1f80, %r25
	.word 0xc807e001  ! 18: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x819826dd  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	.word 0x82f98001  ! 20: SDIVcc_R	sdivcc 	%r6, %r1, %r1
	.word 0xc21fc000  ! 21: LDD_R	ldd	[%r31 + %r0], %r1
tagged_0_7:
	taddcctv %r16, 0x1bea, %r14
	.word 0xc207e001  ! 22: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc27fe001  ! 23: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x8d9036e4  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x16e4, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_8)) -> intp(0,1,3)
xir_0_8:
	.word 0xa9826001  ! 25: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a01971  ! 26: FqTOd	dis not found

	.word 0x8150c000  ! 27: RDPR_TT	<illegal instruction>
DS_0_10:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 28: SAVE_R	save	%r31, %r0, %r31
intveclr_0_11:
	set 0x9d9a5e7c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc09fe001  ! 30: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0x81982546  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
	.word 0x22800001  ! 32: BE	be,a	<label_0x1>
	.word 0x8d902f27  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x0f27, %pstate
	.word 0xa1902005  ! 34: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc007c000  ! 35: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x879022d4  ! 36: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
splash_cmpr_0_12:
	setx 0xed8573da9b105d2e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 37: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_13:
	setx debug_0_13 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 38: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_14:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 39: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc047e001  ! 40: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x83d02034  ! 41: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_0_15:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe714c00b  ! 1: LDQF_R	-	[%r19, %r11], %f19
	.word 0x99a50827  ! 42: FADDs	fadds	%f20, %f7, %f12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_16)) -> intp(0,0,17)
intvec_0_16:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc020  ! 44: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_17)) -> intp(0,1,3)
xir_0_17:
	.word 0xa984e001  ! 45: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
DS_0_18:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x81b24313  ! 46: ALIGNADDRESS	alignaddr	%r9, %r19, %r0
	.word 0xa984c00a  ! 47: WR_SET_SOFTINT_R	wr	%r19, %r10, %set_softint
	.word 0x8cfcc002  ! 48: SDIVcc_R	sdivcc 	%r19, %r2, %r6
	.word 0x83540000  ! 49: RDPR_GL	<illegal instruction>
	.word 0xc237c002  ! 50: STH_R	sth	%r1, [%r31 + %r2]
	.word 0xc28008a0  ! 51: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
debug_0_19:
	setx debug_0_19 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 52: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_20)) -> intp(0,0,17)
intvec_0_20:
	.word 0x39400001  ! 53: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_21:
	setx 0xa0d8125982b74143, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 54: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903132  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1132, %pstate
splash_cmpr_0_22:
	setx 0xc1ff03bec47afab2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 56: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xc7291af5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_23:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc2880e40  ! 58: LDUBA_R	lduba	[%r0, %r0] 0x72, %r1
splash_lsu_0_24:
	setx 0x6df25a8a028986fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3464000  ! 60: RD_STICK_CMPR_REG	rd	%-, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xe24fe001  ! 62: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	.word 0x93902005  ! 63: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_25:
	setx debug_0_25 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 64: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_26:
	setx 0xff175fc877f93c23, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 65: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 66: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_0_27:
	mov 8, %r18
	.word 0xdaf00852  ! 67: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 68: LDX_R	ldx	[%r31 + %r0], %r17
splash_htba_0_28:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 69: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_29:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3128011  ! 1: LDQF_R	-	[%r10, %r17], %f9
	.word 0x97a2482b  ! 70: FADDs	fadds	%f9, %f11, %f11
	.word 0xd697e010  ! 71: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0xd68fe030  ! 72: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x8d9031b6  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x11b6, %pstate
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 74: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_30)) -> intp(0,0,30)
intvec_0_30:
	.word 0x39400001  ! 75: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_31)) -> intp(0,1,3)
xir_0_31:
	.word 0xa984e001  ! 76: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
splash_lsu_0_32:
	setx 0x78561e736d0cf9bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_33)) -> intp(0,1,3)
xir_0_33:
	.word 0xa9832001  ! 78: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_34)) -> intp(0,0,9)
intvec_0_34:
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02032  ! 81: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x32700001  ! 82: BPNE	<illegal instruction>
	.word 0x89500000  ! 83: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x87802089  ! 84: WRASI_I	wr	%r0, 0x0089, %asi
	set 0x52bb2bd5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_35:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902130  ! 86: WRPR_TT_I	wrpr	%r0, 0x0130, %tt
	.word 0x99450000  ! 87: RD_SET_SOFTINT	rd	%set_softint, %r12
splash_lsu_0_36:
	setx 0x92f8f6d93a35daad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_37:
	set 0x749e07f6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8880e80  ! 90: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
	.word 0xd927c00b  ! 91: STF_R	st	%f12, [%r11, %r31]
	.word 0x8780204f  ! 92: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f802001  ! 93: SIR	sir	0x0001
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_38)) -> intp(0,1,3)
xir_0_38:
	.word 0xa9802001  ! 94: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	set 0x771307f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_39:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 96: SIR	sir	0x0001
debug_0_40:
	setx debug_0_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 97: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_41:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d910002  ! 98: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
splash_cmpr_0_42:
	setx 0x1d16b0c217c0a492, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81510000  ! 100: RDPR_TICK	<illegal instruction>
DS_0_43:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc731e001  ! 1: STQF_I	-	%f3, [0x0001, %r7]
	normalw
	.word 0xa1458000  ! 101: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe04fe001  ! 102: LDSB_I	ldsb	[%r31 + 0x0001], %r16
	.word 0x91d020b4  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x81510000  ! 104: RDPR_TICK	<illegal instruction>
	.word 0x879020de  ! 105: WRPR_TT_I	wrpr	%r0, 0x00de, %tt
	.word 0xad846001  ! 106: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
	.word 0x93902004  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe02fc002  ! 108: STB_R	stb	%r16, [%r31 + %r2]
splash_lsu_0_44:
	setx 0xff0d058d8f65f693, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 110: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x2448cdca, %r28
	stxa %r28, [%g0] 0x73
intvec_0_45:
	.word 0x39400001  ! 111: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_46:
	setx 0x7d9d7e58808679a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902206  ! 113: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
splash_lsu_0_47:
	setx 0xbca7805a8cc26837, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 114: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe137c002  ! 115: STQF_R	-	%f16, [%r2, %r31]
	.word 0x879020d2  ! 116: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 117: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_48)) -> intp(0,0,21)
intvec_0_48:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3480000  ! 119: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x93902007  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200c  ! 121: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 122: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902096  ! 123: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
	set 0xe5c9af03, %r28
	stxa %r28, [%g0] 0x73
intvec_0_49:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_50:
	mov 0x38, %r18
	.word 0xfef00b12  ! 125: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe25fe001  ! 126: LDX_I	ldx	[%r31 + 0x0001], %r17
debug_0_51:
	mov 8, %r18
	.word 0xd8f00852  ! 127: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xe29fe001  ! 128: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
debug_0_52:
	setx debug_0_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 129: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe327c002  ! 130: STF_R	st	%f17, [%r2, %r31]
	.word 0xe2d804a0  ! 131: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
	.word 0x8945c000  ! 132: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0x879021bc  ! 133: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	.word 0xc8ffc022  ! 134: SWAPA_R	swapa	%r4, [%r31 + %r2] 0x01
	.word 0xad84a001  ! 135: WR_SOFTINT_REG_I	wr	%r18, 0x0001, %softint
	.word 0x879023a7  ! 136: WRPR_TT_I	wrpr	%r0, 0x03a7, %tt
	.word 0x93902001  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_53:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f8, %f28
	.word 0x87b20302  ! 138: ALIGNADDRESS	alignaddr	%r8, %r2, %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(0,0,20)
intvec_0_54:
	.word 0x39400001  ! 139: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b2  ! 140: Tcc_I	tne	icc_or_xcc, %r0 + 178
debug_0_55:
	setx debug_0_55 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 141: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_56:
	setx 0x2c5a0256eb30b195, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9190e001  ! 143: WRPR_PIL_I	wrpr	%r3, 0x0001, %pil
DS_0_57:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 144: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xc6900e60  ! 145: LDUHA_R	lduha	[%r0, %r0] 0x73, %r3
	.word 0xc677c002  ! 146: STX_R	stx	%r3, [%r31 + %r2]
mondo_0_58:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 147: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0xc737c001  ! 148: STQF_R	-	%f3, [%r1, %r31]
	.word 0xc717c000  ! 149: LDQF_R	-	[%r31, %r0], %f3
	.word 0xc64fe001  ! 150: LDSB_I	ldsb	[%r31 + 0x0001], %r3
splash_lsu_0_59:
	setx 0xc3dae96ad3ede4f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 151: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_60)) -> intp(0,1,3)
xir_0_60:
	.word 0xa981a001  ! 153: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xc68008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x91d02032  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 156: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x95480000  ! 157: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
intveclr_0_61:
	set 0xfe162794, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_62:
	setx 0x5b6f5a1633eb2835, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 159: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd527e001  ! 160: STF_I	st	%f10, [0x0001, %r31]
	set 0x5def991a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_63:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_64:
	setx 0x9f863305b8697f47, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 163: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x879020f8  ! 164: WRPR_TT_I	wrpr	%r0, 0x00f8, %tt
change_to_randtl_0_65:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_65:
	.word 0x8f902004  ! 165: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_66)) -> intp(0,1,3)
xir_0_66:
	.word 0xa9816001  ! 166: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
DS_0_67:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 167: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_68:
	setx 0x828f4dc944f47d0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 168: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 169: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_0_69:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_69:
	.word 0x8f902004  ! 170: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xd4c7e000  ! 171: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x99902001  ! 173: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd527e001  ! 174: STF_I	st	%f10, [0x0001, %r31]
	.word 0xd4bfc021  ! 175: STDA_R	stda	%r10, [%r31 + %r1] 0x01
	.word 0xa190200f  ! 176: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd4d00e60  ! 177: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
debug_0_70:
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 178: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81982a04  ! 179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
DS_0_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 180: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802063  ! 181: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87902373  ! 182: WRPR_TT_I	wrpr	%r0, 0x0373, %tt
	.word 0xd49fc020  ! 183: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0xd4d00e80  ! 184: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	.word 0x8198200e  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
	.word 0x879021d9  ! 186: WRPR_TT_I	wrpr	%r0, 0x01d9, %tt
	.word 0x8d903d8d  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x1d8d, %pstate
intveclr_0_72:
	set 0x7850eef1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd41fe001  ! 189: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0xd41fc000  ! 190: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd41fc000  ! 191: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xa1902005  ! 192: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_0_73:
	taddcctv %r10, 0x1567, %r16
	.word 0xd407e001  ! 193: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_lsu_0_74:
	setx 0xfb4d5c7d7cb43441, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 194: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_75:
	mov 8, %r18
	.word 0xe8f00852  ! 195: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
DS_0_76:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 196: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 197: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_0_77:
	setx 0xc19896557f6555c3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 198: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8282c00a  ! 199: ADDcc_R	addcc 	%r11, %r10, %r1
	.word 0xad812001  ! 200: WR_SOFTINT_REG_I	wr	%r4, 0x0001, %softint
	.word 0xc28fe030  ! 201: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02033  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc2d7e020  ! 204: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0x86d0e001  ! 205: UMULcc_I	umulcc 	%r3, 0x0001, %r3
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 206: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8da149b3  ! 207: FDIVs	fdivs	%f5, %f19, %f6
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_78)) -> intp(0,0,22)
intvec_0_78:
	.word 0x39400001  ! 208: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81982f45  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	.word 0xa5a109a3  ! 210: FDIVs	fdivs	%f4, %f3, %f18
	.word 0x91d02034  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_0_79:
	setx debug_0_79 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 212: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 213: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_80:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 214: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe447c000  ! 215: LDSW_R	ldsw	[%r31 + %r0], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902003  ! 217: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200a  ! 218: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8790219e  ! 219: WRPR_TT_I	wrpr	%r0, 0x019e, %tt
debug_0_81:
	mov 8, %r18
	.word 0xe0f00852  ! 220: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xe4900e80  ! 221: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
	.word 0x87802063  ! 222: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902000  ! 223: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9029b2  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x09b2, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_82)) -> intp(0,0,23)
intvec_0_82:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
DS_0_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe730c013  ! 1: STQF_R	-	%f19, [%r19, %r3]
	normalw
	.word 0xa1458000  ! 227: RD_SOFTINT_REG	rd	%softint, %r16
debug_0_84:
	mov 8, %r18
	.word 0xe8f00852  ! 228: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	ta	T_CHANGE_HPRIV	! macro
	set 0x1d22b250, %r28
	stxa %r28, [%g0] 0x73
intvec_0_85:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
DS_0_86:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5320012  ! 1: STQF_R	-	%f10, [%r18, %r8]
	normalw
	.word 0xa7458000  ! 232: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe68008a0  ! 233: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x879021cd  ! 234: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
intveclr_0_87:
	set 0x7f243e5e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 235: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 236: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01966  ! 237: FqTOd	dis not found

	.word 0xd6800c40  ! 238: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
	.word 0x91d020b5  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_0_89:
	mov 0x38, %r18
	.word 0xfef00b12  ! 240: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_90:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 241: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0xd6800b00  ! 242: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
	.word 0xa5480000  ! 243: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x91936001  ! 244: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
intveclr_0_91:
	set 0x6b91f0b4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 245: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 246: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe49fe001  ! 247: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x8fa249e5  ! 248: FDIVq	dis not found

	.word 0xced00e40  ! 249: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r7
	.word 0xce0fe001  ! 250: LDUB_I	ldub	[%r31 + 0x0001], %r7
	.word 0x91d02032  ! 251: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790228b  ! 252: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
mondo_0_92:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 253: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcf27e001  ! 255: STF_I	st	%f7, [0x0001, %r31]
	.word 0x28800001  ! 256: BLEU	bleu,a	<label_0x1>
	.word 0xcedfe010  ! 257: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	set 0xd9508626, %r28
	stxa %r28, [%g0] 0x73
intvec_0_93:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_94:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 259: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x93902007  ! 260: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xcec7e000  ! 261: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
splash_cmpr_0_95:
	setx 0x15fb12494ede50db, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 262: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x20700001  ! 263: BPN	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xcf37c012  ! 267: STQF_R	-	%f7, [%r18, %r31]
	.word 0xcf3fe001  ! 268: STDF_I	std	%f7, [0x0001, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r7
debug_0_96:
	mov 8, %r18
	.word 0xd0f00852  ! 270: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_0_97:
	setx 0xd9921b717997c15d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 271: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_98:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d93000a  ! 272: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	set 0x126c531b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_99:
	.word 0x39400001  ! 273: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xce47e001  ! 274: LDSW_I	ldsw	[%r31 + 0x0001], %r7
	.word 0xce800b60  ! 275: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	.word 0x91d02035  ! 276: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_100:
	setx debug_0_100 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 277: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xcecfe030  ! 278: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r7
	.word 0x2e800001  ! 279: BVS	bvs,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97696001  ! 280: SDIVX_I	sdivx	%r5, 0x0001, %r11
	.word 0x9190a001  ! 281: WRPR_PIL_I	wrpr	%r2, 0x0001, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 282: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87902262  ! 283: WRPR_TT_I	wrpr	%r0, 0x0262, %tt
	.word 0xd6c7e010  ! 284: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_102)) -> intp(0,0,27)
intvec_0_102:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 286: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
intveclr_0_103:
	set 0x95da34b7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 289: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_104:
	setx 0xb2ddf819da4baa0f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 290: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_105:
	set 0x51f9456c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 292: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_106)) -> intp(0,0,20)
intvec_0_106:
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 294: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd6c804a0  ! 295: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x9b500000  ! 296: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_htba_0_107:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 298: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93d02032  ! 299: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x83454000  ! 300: RD_CLEAR_SOFTINT	rd	%clear_softint, %r1
	.word 0xc2c7e030  ! 301: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
	.word 0x87802089  ! 302: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 303: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_108:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 304: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
mondo_0_109:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 305: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x9f802001  ! 306: SIR	sir	0x0001
	.word 0x879021c1  ! 307: WRPR_TT_I	wrpr	%r0, 0x01c1, %tt
	.word 0xc28008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x93902002  ! 309: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_0_110:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c002  ! 310: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
tagged_0_111:
	taddcctv %r10, 0x1e5f, %r22
	.word 0xc207e001  ! 311: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x91d02033  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200c  ! 313: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_0_112:
	setx debug_0_112 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 314: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_113:
	taddcctv %r14, 0x1564, %r19
	.word 0xc207e001  ! 315: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28fe020  ! 316: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0xc257e001  ! 317: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686001  ! 318: SDIVX_I	sdivx	%r1, 0x0001, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_115)) -> intp(0,1,3)
xir_0_115:
	.word 0xa9812001  ! 319: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0x8d902943  ! 320: WRPR_PSTATE_I	wrpr	%r0, 0x0943, %pstate
splash_lsu_0_116:
	setx 0x50f3c301ebbc38e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 321: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_117:
	setx 0xabde45ab7650ab94, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 322: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 323: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd29fe001  ! 325: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_118)) -> intp(0,0,12)
intvec_0_118:
	.word 0x39400001  ! 326: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 327: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_119:
	mov 0x38, %r18
	.word 0xfef00b12  ! 328: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0xd297e030  ! 330: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0x3e800001  ! 331: BVC	bvc,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_120)) -> intp(0,0,28)
intvec_0_120:
	.word 0x39400001  ! 332: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902509  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x0509, %pstate
	.word 0x91d020b4  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd2c80e40  ! 335: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
mondo_0_121:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d900003  ! 336: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
debug_0_122:
	mov 0x38, %r18
	.word 0xfef00b12  ! 337: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902003  ! 338: WRPR_GL_I	wrpr	%r0, 0x0003, %-
mondo_0_123:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94800d  ! 339: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0x8d903e62  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x1e62, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_124)) -> intp(0,0,13)
intvec_0_124:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab840004  ! 342: WR_CLEAR_SOFTINT_R	wr	%r16, %r4, %clear_softint
	.word 0x83d02033  ! 343: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d903cd3  ! 344: WRPR_PSTATE_I	wrpr	%r0, 0x1cd3, %pstate
	.word 0xd2c7e030  ! 345: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0x30800001  ! 346: BA	ba,a	<label_0x1>
	.word 0x879022f8  ! 347: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
	.word 0x38700001  ! 348: BPGU	<illegal instruction>
	set 0xed62be14, %r28
	stxa %r28, [%g0] 0x73
intvec_0_125:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_126)) -> intp(0,0,28)
intvec_0_126:
	.word 0x39400001  ! 350: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_127:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_127:
	.word 0x8f902004  ! 351: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
debug_0_128:
	mov 0x38, %r18
	.word 0xfef00b12  ! 352: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81a00545  ! 353: FSQRTd	fsqrt	
	.word 0x93902005  ! 354: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc077e001  ! 355: STX_I	stx	%r0, [%r31 + 0x0001]
debug_0_129:
	mov 8, %r18
	.word 0xd2f00852  ! 356: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x9f802001  ! 357: SIR	sir	0x0001
DS_0_130:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02034  ! 359: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc0c004a0  ! 360: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
tagged_0_131:
	taddcctv %r26, 0x11fc, %r22
	.word 0xc007e001  ! 361: LDUW_I	lduw	[%r31 + 0x0001], %r0
change_to_randtl_0_132:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_132:
	.word 0x8f902002  ! 362: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x99480000  ! 363: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x87902222  ! 364: WRPR_TT_I	wrpr	%r0, 0x0222, %tt
	.word 0x93902005  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa784a001  ! 366: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x0001, %-
	.word 0xd81fc000  ! 367: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0xd88fe010  ! 368: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0xd807c000  ! 369: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0xd937c005  ! 370: STQF_R	-	%f12, [%r5, %r31]
intveclr_0_133:
	set 0x9b1310a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 371: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_134)) -> intp(0,1,3)
xir_0_134:
	.word 0xa9832001  ! 372: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0x91d02035  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_0_135:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d928008  ! 374: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	.word 0xa082c000  ! 375: ADDcc_R	addcc 	%r11, %r0, %r16
	.word 0x9f802001  ! 376: SIR	sir	0x0001
intveclr_0_136:
	set 0x7d568339, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e010  ! 378: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	.word 0x8d902dd2  ! 379: WRPR_PSTATE_I	wrpr	%r0, 0x0dd2, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 380: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_0_137:
	setx 0xca7d0a66b0f093ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 381: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_138:
	setx 0x8ad39d15a278a961, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 382: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_139)) -> intp(0,1,3)
xir_0_139:
	.word 0xa984e001  ! 383: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x8d540000  ! 384: RDPR_GL	<illegal instruction>
	.word 0xcd97e001  ! 385: LDQFA_I	-	[%r31, 0x0001], %f6
mondo_0_140:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d91400c  ! 386: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
	.word 0x91d02033  ! 387: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_0_141:
	mov 8, %r18
	.word 0xe6f00852  ! 388: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
splash_tba_0_142:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 389: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02033  ! 390: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8b45c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r5
	set 0x225fd75a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_143:
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_144:
	set 0xf46a39b2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_145:
	setx debug_0_145 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 394: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_146:
	setx 0x104ce8f593663f4e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 395: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 396: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_147:
	taddcctv %r21, 0x1f33, %r11
	.word 0xca07e001  ! 397: LDUW_I	lduw	[%r31 + 0x0001], %r5
mondo_0_148:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d924014  ! 398: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x876ce001  ! 399: SDIVX_I	sdivx	%r19, 0x0001, %r3
	.word 0x8d802004  ! 400: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc69fc020  ! 402: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
debug_0_150:
	mov 8, %r18
	.word 0xdcf00852  ! 403: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_151)) -> intp(0,1,3)
xir_0_151:
	.word 0xa9842001  ! 404: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xa5500000  ! 405: RDPR_TPC	<illegal instruction>
intveclr_0_152:
	set 0x831deea4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 406: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_153:
	setx 0x26eb427de2b430d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 407: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 408: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe43fe001  ! 409: STD_I	std	%r18, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_154)) -> intp(0,1,3)
xir_0_154:
	.word 0xa982e001  ! 410: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	set 0x160dd620, %r28
	stxa %r28, [%g0] 0x73
intvec_0_155:
	.word 0x39400001  ! 411: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_156)) -> intp(0,0,16)
intvec_0_156:
	.word 0x39400001  ! 412: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_157:
	set 0x9592c535, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 413: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 414: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 415: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa745c000  ! 417: RD_TICK_CMPR_REG	rd	%-, %r19
debug_0_159:
	mov 8, %r18
	.word 0xdaf00852  ! 418: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_0_160:
	setx debug_0_160 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 419: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_161:
	mov 0x38, %r18
	.word 0xfef00b12  ! 420: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x906cc012  ! 422: UDIVX_R	udivx 	%r19, %r18, %r8
	.word 0x93902002  ! 423: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d020b2  ! 424: Tcc_I	te	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_162)) -> intp(0,0,6)
intvec_0_162:
	.word 0x39400001  ! 425: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 426: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd00fe001  ! 427: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c2001  ! 428: SDIVX_I	sdivx	%r16, 0x0001, %r19
	.word 0xe61fc000  ! 429: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0xab828012  ! 430: WR_CLEAR_SOFTINT_R	wr	%r10, %r18, %clear_softint
	.word 0xe677c012  ! 431: STX_R	stx	%r19, [%r31 + %r18]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_164)) -> intp(0,1,3)
xir_0_164:
	.word 0xa984e001  ! 432: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x9750c000  ! 433: RDPR_TT	<illegal instruction>
	set 0x1412258a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_165:
	.word 0x39400001  ! 434: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_166:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3346001  ! 1: STQF_I	-	%f9, [0x0001, %r17]
	normalw
	.word 0x83458000  ! 435: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x2a800001  ! 436: BCS	bcs,a	<label_0x1>
debug_0_167:
	mov 0x38, %r18
	.word 0xfef00b12  ! 437: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_168:
	tsubcctv %r17, 0x10e8, %r10
	.word 0xc207e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r1
	set 0x9dd64ac3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_169:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_170:
	mov 0x38, %r18
	.word 0xfef00b12  ! 440: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_171:
	set 0x80ead12a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 441: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 442: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87802020  ! 443: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xc207c000  ! 444: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xa190200e  ! 445: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xc20fe001  ! 446: LDUB_I	ldub	[%r31 + 0x0001], %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902005  ! 448: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02033  ! 449: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc247c000  ! 450: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0xc2d80e40  ! 451: LDXA_R	ldxa	[%r0, %r0] 0x72, %r1
	.word 0xc2c00e40  ! 452: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_172)) -> intp(0,1,3)
xir_0_172:
	.word 0xa982e001  ! 453: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x93902002  ! 454: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	set 0x3ebc3c63, %r28
	stxa %r28, [%g0] 0x73
intvec_0_173:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91936001  ! 456: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_174)) -> intp(0,0,2)
intvec_0_174:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xeb0defd9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 459: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc237e001  ! 460: STH_I	sth	%r1, [%r31 + 0x0001]
	.word 0xc25fe001  ! 461: LDX_I	ldx	[%r31 + 0x0001], %r1
mondo_0_176:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 462: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0xc277c010  ! 463: STX_R	stx	%r1, [%r31 + %r16]
	.word 0xc27fe001  ! 464: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0xc2800c80  ! 465: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r1
tagged_0_177:
	taddcctv %r6, 0x1e7d, %r22
	.word 0xc207e001  ! 466: LDUW_I	lduw	[%r31 + 0x0001], %r1
DS_0_178:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc3302001  ! 1: STQF_I	-	%f1, [0x0001, %r0]
	normalw
	.word 0x89458000  ! 467: RD_SOFTINT_REG	rd	%softint, %r4
mondo_0_179:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d918008  ! 468: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
	.word 0xc8d804a0  ! 469: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
debug_0_180:
	mov 8, %r18
	.word 0xd2f00852  ! 470: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xa782a001  ! 471: WR_GRAPHICS_STATUS_REG_I	wr	%r10, 0x0001, %-
	.word 0xc8880e60  ! 472: LDUBA_R	lduba	[%r0, %r0] 0x73, %r4
	.word 0xc8d7e020  ! 473: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x38700001  ! 474: BPGU	<illegal instruction>
	.word 0x2e800001  ! 475: BVS	bvs,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_181)) -> intp(0,1,3)
xir_0_181:
	.word 0xa982a001  ! 476: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xa1902005  ! 477: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc827c008  ! 478: STW_R	stw	%r4, [%r31 + %r8]
splash_lsu_0_182:
	setx 0x9e1678372b630225, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 479: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_183:
	setx 0xdf3ce5c55f23b980, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 481: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c6001  ! 482: SDIVX_I	sdivx	%r17, 0x0001, %r16
	.word 0x87802020  ! 483: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe01fc000  ! 484: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0xe197e001  ! 485: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0xe007c000  ! 486: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0x87902038  ! 487: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0xe0c804a0  ! 488: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
	.word 0x826a8001  ! 489: UDIVX_R	udivx 	%r10, %r1, %r1
intveclr_0_185:
	set 0x96613eae, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 490: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_186:
	set 0x10f042d2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 491: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_187:
	setx debug_0_187 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 492: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc2dfe020  ! 493: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r1
	.word 0xc297e000  ! 494: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0xc28008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_cmpr_0_188:
	setx 0x476c324794e983e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_189:
	setx 0xfe00dce2ddb04b33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 497: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_190:
	setx debug_0_190 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 498: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_191:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc1332001  ! 1: STQF_I	-	%f0, [0x0001, %r12]
	normalw
	.word 0xa3458000  ! 499: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe21fe001  ! 500: LDD_I	ldd	[%r31 + 0x0001], %r17
mondo_0_192:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d948007  ! 501: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0x87802063  ! 502: WRASI_I	wr	%r0, 0x0063, %asi
debug_0_193:
	setx debug_0_193 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 503: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 504: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_194:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d900013  ! 505: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xe207c000  ! 506: LDUW_R	lduw	[%r31 + %r0], %r17
	set 0xfcb9d79a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_195:
	.word 0x39400001  ! 507: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2d00e60  ! 508: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
	.word 0x99902004  ! 509: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_0_196:
	setx 0x403595b0c986a194, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 510: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2ffc033  ! 511: SWAPA_R	swapa	%r17, [%r31 + %r19] 0x01
intveclr_0_197:
	set 0x87390ca0, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_198:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d944006  ! 513: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x9f802001  ! 514: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 515: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 516: WRASI_I	wr	%r0, 0x0016, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 517: LDX_R	ldx	[%r31 + %r0], %r17
	set 0x2263af0a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_199:
	.word 0x39400001  ! 518: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_200:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xf346d598	! Random illegal ?
	.word 0x9ba00547  ! 1: FSQRTd	fsqrt	
	.word 0x85a18828  ! 519: FADDs	fadds	%f6, %f8, %f2
	.word 0xa9850011  ! 520: WR_SET_SOFTINT_R	wr	%r20, %r17, %set_softint
	.word 0xa9848003  ! 521: WR_SET_SOFTINT_R	wr	%r18, %r3, %set_softint
	set 0xdfd7fba5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_201:
	.word 0x39400001  ! 522: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8750c000  ! 523: RDPR_TT	rdpr	%tt, %r3
	.word 0x8d902f5b  ! 524: WRPR_PSTATE_I	wrpr	%r0, 0x0f5b, %pstate
	.word 0xa150c000  ! 525: RDPR_TT	rdpr	%tt, %r16
	.word 0xe197e001  ! 526: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0xe04fe001  ! 527: LDSB_I	ldsb	[%r31 + 0x0001], %r16
	.word 0x95520000  ! 528: RDPR_PIL	rdpr	%pil, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_202)) -> intp(0,0,22)
intvec_0_202:
	.word 0x39400001  ! 529: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 530: WRPR_GL_I	wrpr	%r0, 0x0007, %-
debug_0_203:
	mov 0x38, %r18
	.word 0xfef00b12  ! 531: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x30700001  ! 533: BPA	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_204)) -> intp(0,1,3)
xir_0_204:
	.word 0xa9806001  ! 534: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
DS_0_205:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd330000c  ! 1: STQF_R	-	%f9, [%r12, %r0]
	normalw
	.word 0x83458000  ! 535: RD_SOFTINT_REG	rd	%softint, %r1
DS_0_206:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f28, %f4
	.word 0xa9b1c314  ! 536: ALIGNADDRESS	alignaddr	%r7, %r20, %r20
	.word 0x93902006  ! 537: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 538: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 539: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_207:
	mov 8, %r18
	.word 0xd6f00852  ! 540: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
tagged_0_208:
	tsubcctv %r8, 0x1f7d, %r4
	.word 0xe807e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01970  ! 542: FqTOd	dis not found

debug_0_210:
	mov 8, %r18
	.word 0xd0f00852  ! 543: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_0_211:
	setx 0xad2a8381fb9c37b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_212:
	mov 0x38, %r18
	.word 0xfef00b12  ! 545: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879022a9  ! 546: WRPR_TT_I	wrpr	%r0, 0x02a9, %tt
	.word 0xd24fe001  ! 547: LDSB_I	ldsb	[%r31 + 0x0001], %r9
tagged_0_213:
	taddcctv %r8, 0x1c28, %r2
	.word 0xd207e001  ! 548: LDUW_I	lduw	[%r31 + 0x0001], %r9
tagged_0_214:
	tsubcctv %r25, 0x16b3, %r6
	.word 0xd207e001  ! 549: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x93d02033  ! 550: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87902066  ! 551: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
mondo_0_215:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940005  ! 552: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
debug_0_216:
	mov 8, %r18
	.word 0xdef00852  ! 553: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_cmpr_0_217:
	setx 0xb880493a2565f331, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902001  ! 555: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x90d42001  ! 556: UMULcc_I	umulcc 	%r16, 0x0001, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_218)) -> intp(0,1,3)
xir_0_218:
	.word 0xa981e001  ! 557: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
change_to_randtl_0_219:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_219:
	.word 0x8f902003  ! 558: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_htba_0_220:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 559: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xab81400d  ! 560: WR_CLEAR_SOFTINT_R	wr	%r5, %r13, %clear_softint
	.word 0xd09004a0  ! 561: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x87802055  ! 562: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd01fe001  ! 563: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x8d902cb0  ! 564: WRPR_PSTATE_I	wrpr	%r0, 0x0cb0, %pstate
	.word 0x91d020b4  ! 565: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd01fe001  ! 566: LDD_I	ldd	[%r31 + 0x0001], %r8
DS_0_221:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3344001  ! 1: STQF_R	-	%f17, [%r1, %r17]
	normalw
	.word 0x99458000  ! 567: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_PRIV	! macro
debug_0_222:
	mov 8, %r18
	.word 0xe4f00852  ! 569: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8d9028ba  ! 570: WRPR_PSTATE_I	wrpr	%r0, 0x08ba, %pstate
	.word 0xd8d004a0  ! 571: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x87802010  ! 572: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9194a001  ! 573: WRPR_PIL_I	wrpr	%r18, 0x0001, %pil
	.word 0xa0498011  ! 574: MULX_R	mulx 	%r6, %r17, %r16
	.word 0xe0d00e40  ! 575: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r16
intveclr_0_223:
	set 0xf4adc79a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 577: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 578: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe137c011  ! 579: STQF_R	-	%f16, [%r17, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_224)) -> intp(0,1,3)
xir_0_224:
	.word 0xa9806001  ! 580: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x81982f5e  ! 581: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0xe137c011  ! 582: STQF_R	-	%f16, [%r17, %r31]
	.word 0x93902003  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8e68c00c  ! 584: UDIVX_R	udivx 	%r3, %r12, %r7
	.word 0xa1902005  ! 585: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	set 0x77e46eff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_225:
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_226:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 587: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 588: SIR	sir	0x0001
	.word 0xad836001  ! 589: WR_SOFTINT_REG_I	wr	%r13, 0x0001, %softint
tagged_0_227:
	taddcctv %r2, 0x1918, %r21
	.word 0xce07e001  ! 590: LDUW_I	lduw	[%r31 + 0x0001], %r7
debug_0_228:
	mov 8, %r18
	.word 0xdaf00852  ! 591: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x856c0001  ! 592: SDIVX_R	sdivx	%r16, %r1, %r2
debug_0_229:
	setx debug_0_229 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 593: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d520000  ! 594: RDPR_PIL	<illegal instruction>
	.word 0x36700001  ! 595: BPGE	<illegal instruction>
	.word 0xcc47c000  ! 596: LDSW_R	ldsw	[%r31 + %r0], %r6
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 597: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87480000  ! 599: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_230)) -> intp(0,0,4)
intvec_0_230:
	.word 0x39400001  ! 600: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc69fc020  ! 601: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0xad836001  ! 602: WR_SOFTINT_REG_I	wr	%r13, 0x0001, %softint
debug_0_231:
	mov 8, %r18
	.word 0xdef00852  ! 603: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x93a1cdc5  ! 604: FdMULq	fdmulq	
	.word 0xa1902009  ! 605: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_232:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 606: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
debug_0_233:
	mov 0x38, %r18
	.word 0xfef00b12  ! 607: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd207c000  ! 608: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x93902003  ! 609: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_234:
	mov 8, %r18
	.word 0xd6f00852  ! 610: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
mondo_0_235:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 611: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x83464000  ! 612: RD_STICK_CMPR_REG	rd	%-, %r1
	.word 0xc2880e60  ! 613: LDUBA_R	lduba	[%r0, %r0] 0x73, %r1
	.word 0xc28008a0  ! 614: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_tba_0_236:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 615: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8084000b  ! 616: ADDcc_R	addcc 	%r16, %r11, %r0
	.word 0xc0c004a0  ! 617: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x8d9025e3  ! 618: WRPR_PSTATE_I	wrpr	%r0, 0x05e3, %pstate
intveclr_0_237:
	set 0xca46e984, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_238:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xb37c7985	! Random illegal ?
	.word 0x81a00549  ! 1: FSQRTd	fsqrt	
	.word 0x8ba2882b  ! 620: FADDs	fadds	%f10, %f11, %f5
	set 0xa536656b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_239:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_240:
	set 0xf0487eb4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 622: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0xd2033a5b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_241:
	.word 0x39400001  ! 623: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_242:
	tsubcctv %r14, 0x1423, %r17
	.word 0xca07e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r5
	set 0xd74fb03b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_243:
	.word 0x39400001  ! 625: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_244:
	setx 0x27197be84930e173, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 626: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_245:
	setx 0xe06ad3ea30e80d97, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 627: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87a449f1  ! 628: FDIVq	dis not found

	.word 0x8f50c000  ! 629: RDPR_TT	<illegal instruction>
	.word 0xcec004a0  ! 630: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce1fc000  ! 631: LDD_R	ldd	[%r31 + %r0], %r7
debug_0_246:
	mov 8, %r18
	.word 0xe4f00852  ! 632: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x91d02033  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_247:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f16, %f22
	.word 0xa3b48302  ! 634: ALIGNADDRESS	alignaddr	%r18, %r2, %r17
	.word 0x22700001  ! 635: BPE	<illegal instruction>
	.word 0xa190200d  ! 636: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe2c804a0  ! 637: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	.word 0xe28008a0  ! 638: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2c80e40  ! 639: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r17
	.word 0x8d802000  ! 640: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe28008a0  ! 641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe29fe001  ! 642: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_248)) -> intp(0,0,19)
intvec_0_248:
	.word 0x39400001  ! 643: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_249:
	set 0xaec56419, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 644: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 645: SIR	sir	0x0001
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 647: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87902214  ! 648: WRPR_TT_I	wrpr	%r0, 0x0214, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_250)) -> intp(0,0,1)
intvec_0_250:
	.word 0x39400001  ! 649: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 650: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa190200f  ! 651: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_0_251:
	set 0x2e471cf3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 652: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 653: WRASI_I	wr	%r0, 0x0080, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_252)) -> intp(0,0,17)
intvec_0_252:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe20fc000  ! 655: LDUB_R	ldub	[%r31 + %r0], %r17
intveclr_0_253:
	set 0xb2959ac7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 656: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 657: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_0_254:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 658: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x8d9032b1  ! 659: WRPR_PSTATE_I	wrpr	%r0, 0x12b1, %pstate
splash_cmpr_0_255:
	setx 0x909f41cb6e453e3f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa153c000  ! 661: RDPR_FQ	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_256)) -> intp(0,1,3)
xir_0_256:
	.word 0xa9836001  ! 662: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
splash_cmpr_0_257:
	setx 0x72a26704b4855d7b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 663: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_258)) -> intp(0,0,0)
intvec_0_258:
	.word 0x39400001  ! 664: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe127c014  ! 665: STF_R	st	%f16, [%r20, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 666: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe097e010  ! 667: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
intveclr_0_259:
	set 0xf0d1e9b5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 668: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 669: WRPR_GL_I	wrpr	%r0, 0x000e, %-
mondo_0_260:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 670: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x8780204f  ! 671: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_0_261:
	setx 0x546ee44570811e98, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200d  ! 673: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802016  ! 674: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_0_262:
	set 0x972d6a1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0c004a0  ! 676: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
	.word 0x93902004  ! 677: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81460000  ! 678: RD_STICK_REG	stbar
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 680: WRPR_GL_I	wrpr	%r0, 0x0008, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_263)) -> intp(0,1,3)
xir_0_263:
	.word 0xa9806001  ! 681: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
tagged_0_264:
	tsubcctv %r3, 0x1120, %r9
	.word 0xe007e001  ! 682: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0cfe010  ! 683: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_265)) -> intp(0,1,3)
xir_0_265:
	.word 0xa980a001  ! 684: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
tagged_0_266:
	tsubcctv %r26, 0x1277, %r11
	.word 0xe007e001  ! 685: LDUW_I	lduw	[%r31 + 0x0001], %r16
	set 0x91d65595, %r28
	stxa %r28, [%g0] 0x73
intvec_0_267:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa350c000  ! 687: RDPR_TT	rdpr	%tt, %r17
	.word 0xa190200a  ! 688: WRPR_GL_I	wrpr	%r0, 0x000a, %-
tagged_0_268:
	tsubcctv %r9, 0x1328, %r1
	.word 0xe207e001  ! 689: LDUW_I	lduw	[%r31 + 0x0001], %r17
tagged_0_269:
	taddcctv %r6, 0x1a14, %r25
	.word 0xe207e001  ! 690: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe20fc000  ! 691: LDUB_R	ldub	[%r31 + %r0], %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_270)) -> intp(0,0,21)
intvec_0_270:
	.word 0x39400001  ! 692: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
splash_tba_0_271:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 694: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_0_272:
	tsubcctv %r8, 0x13b2, %r25
	.word 0xe207e001  ! 695: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_cmpr_0_273:
	setx 0x2d3dc15fdf7e32d8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95454000  ! 697: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	.word 0xd427e001  ! 698: STW_I	stw	%r10, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_274)) -> intp(0,0,30)
intvec_0_274:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4c004a0  ! 700: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 701: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd49004a0  ! 702: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_PRIV	! macro
intveclr_0_275:
	set 0xc50ee537, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 704: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_276:
	tsubcctv %r19, 0x1420, %r20
	.word 0xd407e001  ! 705: LDUW_I	lduw	[%r31 + 0x0001], %r10
	set 0x9d5b3980, %r28
	stxa %r28, [%g0] 0x73
intvec_0_277:
	.word 0x39400001  ! 706: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_278)) -> intp(0,0,2)
intvec_0_278:
	.word 0x39400001  ! 707: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b686001  ! 708: SDIVX_I	sdivx	%r1, 0x0001, %r13
	.word 0x99902001  ! 709: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xda9004a0  ! 710: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_280)) -> intp(0,1,3)
xir_0_280:
	.word 0xa984a001  ! 711: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	set 0x780f961d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_281:
	.word 0x39400001  ! 712: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_282:
	setx 0x9be8585a6abe44aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 713: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xdac80e80  ! 714: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 715: LDX_R	ldx	[%r31 + %r0], %r13
	set 0x3062fbff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_283:
	.word 0x39400001  ! 716: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 717: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02032  ! 718: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_284:
	mov 0x38, %r18
	.word 0xfef00b12  ! 719: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x3a700001  ! 720: BPCC	<illegal instruction>
	.word 0x91d02033  ! 721: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99464000  ! 722: RD_STICK_CMPR_REG	rd	%-, %r12
splash_htba_0_285:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 723: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_286)) -> intp(0,0,13)
intvec_0_286:
	.word 0x39400001  ! 724: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87a509f0  ! 725: FDIVq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 726: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xa2c2e001  ! 727: ADDCcc_I	addccc 	%r11, 0x0001, %r17
	.word 0xe2c804a0  ! 728: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	.word 0xe2c004a0  ! 729: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0x32800001  ! 730: BNE	bne,a	<label_0x1>
	.word 0xa9540000  ! 731: RDPR_GL	rdpr	%-, %r20
	.word 0xe847e001  ! 732: LDSW_I	ldsw	[%r31 + 0x0001], %r20
splash_cmpr_0_287:
	setx 0x68b28e7abdf26f8d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 733: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe8c004a0  ! 734: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
debug_0_288:
	mov 8, %r18
	.word 0xd6f00852  ! 735: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 736: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe88008a0  ! 737: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x8f480000  ! 738: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
DS_0_289:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f6, %f10
	.word 0xa3b2c305  ! 739: ALIGNADDRESS	alignaddr	%r11, %r5, %r17
	.word 0xe2c804a0  ! 740: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	.word 0x81460000  ! 741: RD_STICK_REG	stbar
debug_0_290:
	mov 0x38, %r18
	.word 0xfef00b12  ! 742: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790208a  ! 743: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	.word 0x87802058  ! 744: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x88c02001  ! 745: ADDCcc_I	addccc 	%r0, 0x0001, %r4
splash_cmpr_0_291:
	setx 0x2849c9c012d88585, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 746: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902303  ! 747: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0x93902006  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d903203  ! 749: WRPR_PSTATE_I	wrpr	%r0, 0x1203, %pstate
debug_0_292:
	setx debug_0_292 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 750: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc93fc005  ! 751: STDF_R	std	%f4, [%r5, %r31]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 752: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc89004a0  ! 753: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0xad806001  ! 754: WR_SOFTINT_REG_I	wr	%r1, 0x0001, %softint
	.word 0x99902002  ! 755: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
intveclr_0_293:
	set 0xa3803ce2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 756: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_294:
	set 0x2d0b610a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 757: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 758: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x22800001  ! 759: BE	be,a	<label_0x1>
	.word 0x91d020b4  ! 760: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_295:
	setx debug_0_295 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 761: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902002  ! 762: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_0_296:
	setx 0x5c618857aef4a6b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 763: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_297)) -> intp(0,1,3)
xir_0_297:
	.word 0xa9832001  ! 764: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
splash_cmpr_0_298:
	setx 0xa92fe631669611ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 765: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 766: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902002  ! 767: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d020b3  ! 768: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_0_299:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 769: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_0_300:
	set 0x76157a8d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 770: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 771: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa190200e  ! 772: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa7846001  ! 773: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0001, %-
	.word 0x2a800001  ! 774: BCS	bcs,a	<label_0x1>
splash_cmpr_0_301:
	setx 0x1b807313b628e485, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 775: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc88008a0  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790214c  ! 778: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	.word 0x81b01021  ! 779: SIAM	siam	1
	.word 0x99902003  ! 780: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
debug_0_302:
	mov 0x38, %r18
	.word 0xfef00b12  ! 781: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902179  ! 782: WRPR_TT_I	wrpr	%r0, 0x0179, %tt
DS_0_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 783: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
DS_0_304:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 785: RESTORE_R	restore	%r31, %r0, %r31
	set 0xaecaf044, %r28
	stxa %r28, [%g0] 0x73
intvec_0_305:
	.word 0x39400001  ! 786: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903419  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x1419, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_306)) -> intp(0,0,15)
intvec_0_306:
	.word 0x39400001  ! 788: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc88008a0  ! 789: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x83480000  ! 790: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc317c000  ! 791: LDQF_R	-	[%r31, %r0], %f1
intveclr_0_307:
	set 0x66c8b4cf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 792: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc2d00e40  ! 793: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_308)) -> intp(0,1,3)
xir_0_308:
	.word 0xa9842001  ! 794: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
intveclr_0_309:
	set 0x5d8710f5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 795: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_310:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d91c003  ! 796: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x87802088  ! 797: WRASI_I	wr	%r0, 0x0088, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_311)) -> intp(0,1,3)
xir_0_311:
	.word 0xa9822001  ! 798: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0x8780201c  ! 799: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_0_312:
	set 0x2169b776, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 800: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_313:
	set 0x67ccaca8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 801: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 802: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x94ad0010  ! 803: ANDNcc_R	andncc 	%r20, %r16, %r10
	.word 0xa190200e  ! 804: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d802000  ! 805: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_314:
	mov 0x38, %r18
	.word 0xfef00b12  ! 806: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4d004a0  ! 807: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x819821cc  ! 808: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cc, %hpstate
	.word 0x93902001  ! 809: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_0_315:
	mov 8, %r18
	.word 0xe0f00852  ! 810: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 811: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9026a7  ! 812: WRPR_PSTATE_I	wrpr	%r0, 0x06a7, %pstate
debug_0_316:
	setx debug_0_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 813: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa7464000  ! 814: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x8d9039a6  ! 815: WRPR_PSTATE_I	wrpr	%r0, 0x19a6, %pstate
splash_cmpr_0_317:
	setx 0xdfe6b26ff46e2dfa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 816: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_318)) -> intp(0,0,16)
intvec_0_318:
	.word 0x39400001  ! 817: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022e8  ! 818: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
	.word 0x8780201c  ! 819: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87902270  ! 820: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
	.word 0x87802080  ! 821: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87540000  ! 822: RDPR_GL	rdpr	%-, %r3
	.word 0x83d02032  ! 823: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d902adc  ! 824: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
debug_0_319:
	setx debug_0_319 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 825: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_320:
	setx 0x16ed4d1987c0f7fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 826: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_321:
	taddcctv %r21, 0x1a08, %r10
	.word 0xc607e001  ! 827: LDUW_I	lduw	[%r31 + 0x0001], %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 828: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xa190200c  ! 829: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902006  ! 830: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 831: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 832: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc69fc020  ! 833: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
tagged_0_322:
	tsubcctv %r3, 0x1b6b, %r11
	.word 0xc607e001  ! 834: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x886c8002  ! 835: UDIVX_R	udivx 	%r18, %r2, %r4
splash_htba_0_323:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 836: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_324)) -> intp(0,1,3)
xir_0_324:
	.word 0xa9802001  ! 837: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xc91fe001  ! 838: LDDF_I	ldd	[%r31, 0x0001], %f4
	.word 0x91d020b5  ! 839: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_0_325:
	setx debug_0_325 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 840: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab810011  ! 841: WR_CLEAR_SOFTINT_R	wr	%r4, %r17, %clear_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_326)) -> intp(0,0,11)
intvec_0_326:
	.word 0x39400001  ! 842: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 843: SIAM	siam	1
	.word 0xa7464000  ! 844: RD_STICK_CMPR_REG	rd	%-, %r19
debug_0_327:
	mov 8, %r18
	.word 0xe2f00852  ! 845: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_328)) -> intp(0,1,3)
xir_0_328:
	.word 0xa9836001  ! 846: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_329)) -> intp(0,1,3)
xir_0_329:
	.word 0xa9852001  ! 847: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
DS_0_330:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa1b1430b  ! 848: ALIGNADDRESS	alignaddr	%r5, %r11, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_331)) -> intp(0,1,3)
xir_0_331:
	.word 0xa9852001  ! 849: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
debug_0_332:
	mov 0x38, %r18
	.word 0xfef00b12  ! 850: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08fe010  ! 851: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_333)) -> intp(0,1,3)
xir_0_333:
	.word 0xa982a001  ! 852: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x8d9036db  ! 853: WRPR_PSTATE_I	wrpr	%r0, 0x16db, %pstate
	.word 0xe047c000  ! 854: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0x8d902d61  ! 855: WRPR_PSTATE_I	wrpr	%r0, 0x0d61, %pstate
DS_0_334:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb346001  ! 1: STQF_I	-	%f13, [0x0001, %r17]
	normalw
	.word 0x85458000  ! 856: RD_SOFTINT_REG	rd	%softint, %r2
	set 0x35a2458, %r28
	stxa %r28, [%g0] 0x73
intvec_0_335:
	.word 0x39400001  ! 857: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc40fe001  ! 858: LDUB_I	ldub	[%r31 + 0x0001], %r2
DS_0_336:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1318006  ! 1: STQF_R	-	%f8, [%r6, %r6]
	normalw
	.word 0x83458000  ! 859: RD_SOFTINT_REG	rd	%softint, %r1
debug_0_337:
	setx debug_0_337 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 860: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc397e001  ! 861: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0xc31fc000  ! 862: LDDF_R	ldd	[%r31, %r0], %f1
tagged_0_338:
	tsubcctv %r26, 0x1030, %r14
	.word 0xc207e001  ! 863: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc21fe001  ! 864: LDD_I	ldd	[%r31 + 0x0001], %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 865: LDX_R	ldx	[%r31 + %r0], %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 866: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc24fc000  ! 867: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xc397e001  ! 868: LDQFA_I	-	[%r31, 0x0001], %f1
	set 0x913860c7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_339:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc227c006  ! 870: STW_R	stw	%r1, [%r31 + %r6]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_340)) -> intp(0,0,18)
intvec_0_340:
	.word 0x39400001  ! 871: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_341:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 872: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_342)) -> intp(0,1,3)
xir_0_342:
	.word 0xa981a001  ! 873: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xa190200c  ! 874: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01970  ! 875: FqTOd	dis not found

	.word 0x8d802000  ! 876: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdad00e80  ! 877: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
debug_0_344:
	mov 0x38, %r18
	.word 0xfef00b12  ! 878: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 879: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	set 0xa6978d87, %r28
	stxa %r28, [%g0] 0x73
intvec_0_345:
	.word 0x39400001  ! 880: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 881: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xda0fe001  ! 882: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xa1540000  ! 883: RDPR_GL	rdpr	%-, %r16
	.word 0xa1902007  ! 884: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe11fc000  ! 885: LDDF_R	ldd	[%r31, %r0], %f16
splash_cmpr_0_346:
	setx 0x2e0058ca2dce7dcd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 886: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 887: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_347:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x89a00551  ! 1: FSQRTd	fsqrt	
	.word 0x8da4c834  ! 888: FADDs	fadds	%f19, %f20, %f6
	.word 0xccc7e000  ! 889: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
debug_0_348:
	mov 8, %r18
	.word 0xd4f00852  ! 890: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
splash_lsu_0_349:
	setx 0x6e2b3fa7be8eec31, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 891: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 892: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc07c000  ! 893: LDUW_R	lduw	[%r31 + %r0], %r6
splash_tba_0_350:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 894: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x88d0c002  ! 895: UMULcc_R	umulcc 	%r3, %r2, %r4
	.word 0x81982697  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x22800001  ! 897: BE	be,a	<label_0x1>
	.word 0xc84fc000  ! 898: LDSB_R	ldsb	[%r31 + %r0], %r4
debug_0_351:
	mov 8, %r18
	.word 0xe8f00852  ! 899: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
mondo_0_352:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d914004  ! 900: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
splash_cmpr_0_353:
	setx 0x2d5831d64febbde9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 901: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f45c000  ! 902: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x99902004  ! 903: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_0_354:
	setx 0xb2d7336185322663, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 904: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 905: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce0fe001  ! 906: LDUB_I	ldub	[%r31 + 0x0001], %r7
debug_0_355:
	setx debug_0_355 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 907: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_356:
	setx 0x37290754f2ebcd14, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 908: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_357)) -> intp(0,1,3)
xir_0_357:
	.word 0xa9846001  ! 909: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xce8008a0  ! 910: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce1fe001  ! 911: LDD_I	ldd	[%r31 + 0x0001], %r7
splash_cmpr_0_358:
	setx 0x181429a4b83fda6d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 912: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790211c  ! 913: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
	.word 0xa190200c  ! 914: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 915: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x701eaf0d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_359:
	.word 0x39400001  ! 916: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 917: WRASI_I	wr	%r0, 0x0080, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_360)) -> intp(0,0,3)
intvec_0_360:
	.word 0x39400001  ! 918: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 919: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_361:
	setx 0xdd60aaa3968c9b5c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 920: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81510000  ! 921: RDPR_TICK	<illegal instruction>
	.word 0xab848007  ! 922: WR_CLEAR_SOFTINT_R	wr	%r18, %r7, %clear_softint
	.word 0xcf37c007  ! 923: STQF_R	-	%f7, [%r7, %r31]
	.word 0xcedfe010  ! 924: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0xce47c000  ! 925: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0xcf1fc000  ! 926: LDDF_R	ldd	[%r31, %r0], %f7
	ta	T_CHANGE_PRIV	! macro
debug_0_362:
	mov 0x38, %r18
	.word 0xfef00b12  ! 928: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 929: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 930: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 931: WRPR_GL_I	wrpr	%r0, 0x000e, %-
intveclr_0_363:
	set 0x841176a8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 932: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 933: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce5fe001  ! 934: LDX_I	ldx	[%r31 + 0x0001], %r7
debug_0_364:
	setx debug_0_364 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 935: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_365:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8ba00546  ! 1: FSQRTd	fsqrt	
	.word 0xa3a40825  ! 936: FADDs	fadds	%f16, %f5, %f17
	.word 0x87802004  ! 937: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 938: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902036  ! 939: WRPR_TT_I	wrpr	%r0, 0x0036, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 940: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_0_366:
	setx 0xf05702c0c9e92bbb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 941: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81982257  ! 942: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 943: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x99902001  ! 944: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe28008a0  ! 945: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_0_367:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 946: SAVE_R	save	%r31, %r0, %r31
	.word 0x87902258  ! 947: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
splash_lsu_0_368:
	setx 0x5733524ae02df0d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 948: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_369:
	mov 8, %r18
	.word 0xdef00852  ! 949: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe23fc005  ! 950: STD_R	std	%r17, [%r31 + %r5]
	.word 0x87802020  ! 951: WRASI_I	wr	%r0, 0x0020, %asi
tagged_0_370:
	tsubcctv %r22, 0x13f7, %r16
	.word 0xe207e001  ! 952: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x8d9022ab  ! 953: WRPR_PSTATE_I	wrpr	%r0, 0x02ab, %pstate
	.word 0xe277e001  ! 954: STX_I	stx	%r17, [%r31 + 0x0001]
	.word 0x91d02032  ! 955: Tcc_I	ta	icc_or_xcc, %r0 + 50
	set 0x8935fcb7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_371:
	.word 0x39400001  ! 956: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257c000  ! 957: LDSH_R	ldsh	[%r31 + %r0], %r17
change_to_randtl_0_372:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_372:
	.word 0x8f902000  ! 958: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_373)) -> intp(0,1,3)
xir_0_373:
	.word 0xa9842001  ! 959: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xa753c000  ! 960: RDPR_FQ	<illegal instruction>
	.word 0x879022d3  ! 961: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0x8d802000  ! 962: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa3454000  ! 963: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
DS_0_374:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xbd7f1b9d	! Random illegal ?
	.word 0x9ba00554  ! 1: FSQRTd	fsqrt	
	.word 0xa1a48824  ! 964: FADDs	fadds	%f18, %f4, %f16
	.word 0x9f802001  ! 965: SIR	sir	0x0001
splash_lsu_0_375:
	setx 0x2446163aa28e0833, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 966: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_376:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 967: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe08804a0  ! 968: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0xe08008a0  ! 969: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x819825d7  ! 970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	.word 0x8945c000  ! 971: RD_TICK_CMPR_REG	rd	%-, %r4
splash_cmpr_0_377:
	setx 0x9564bb84384527f0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 972: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9030af  ! 973: WRPR_PSTATE_I	wrpr	%r0, 0x10af, %pstate
mondo_0_378:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d948001  ! 974: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d6b6001  ! 975: SDIVX_I	sdivx	%r13, 0x0001, %r6
	.word 0x99902002  ! 976: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 977: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x9f802001  ! 978: SIR	sir	0x0001
splash_tba_0_380:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_381:
	setx 0xcefc3e9a88b0cf75, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 980: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc3fe001  ! 981: STD_I	std	%r6, [%r31 + 0x0001]
	.word 0x87902321  ! 982: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
	.word 0x8d903e6f  ! 983: WRPR_PSTATE_I	wrpr	%r0, 0x1e6f, %pstate
	.word 0x93902004  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_0_382:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_382:
	.word 0x8f902002  ! 985: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_0_383:
	taddcctv %r9, 0x17bb, %r8
	.word 0xcc07e001  ! 986: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_384:
	set 0xf9cb6b47, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 987: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_385:
	taddcctv %r7, 0x1315, %r4
	.word 0xcc07e001  ! 988: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87902292  ! 989: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0x93d020b5  ! 990: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x99902000  ! 991: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_386)) -> intp(0,1,3)
xir_0_386:
	.word 0xa9846001  ! 992: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x8d90221d  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0xa1902004  ! 994: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9f802001  ! 995: SIR	sir	0x0001
	set 0x34181f9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_387:
	.word 0x39400001  ! 996: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xcc57c000  ! 997: LDSH_R	ldsh	[%r31 + %r0], %r6
DS_0_388:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 998: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802004  ! 999: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902006  ! 1000: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02035  ! 1001: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1002: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_0_389:
	setx 0x880eeaef6e582169, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1003: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1004: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcd1fc000  ! 1005: LDDF_R	ldd	[%r31, %r0], %f6
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1006: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 1007: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
debug_0_390:
	mov 8, %r18
	.word 0xe8f00852  ! 1008: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
debug_0_391:
	setx debug_0_391 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1009: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790204f  ! 1010: WRPR_TT_I	wrpr	%r0, 0x004f, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1011: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xa681400c  ! 1012: ADDcc_R	addcc 	%r5, %r12, %r19
	.word 0x91d02033  ! 1013: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_0_392:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920000  ! 1014: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
tagged_0_393:
	taddcctv %r5, 0x1da6, %r4
	.word 0xe607e001  ! 1015: LDUW_I	lduw	[%r31 + 0x0001], %r19
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1016: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790210f  ! 1017: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_394)) -> intp(0,0,6)
intvec_0_394:
	.word 0x39400001  ! 1018: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 1019: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_0_395:
	setx 0xa8657ea9d926d301, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1020: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 1021: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe607c000  ! 1022: LDUW_R	lduw	[%r31 + %r0], %r19
	.word 0x87802004  ! 1023: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802088  ! 1024: WRASI_I	wr	%r0, 0x0088, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 1025: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe73fc000  ! 1026: STDF_R	std	%f19, [%r0, %r31]
DS_0_396:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1027: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1028: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_397:
	taddcctv %r5, 0x18e6, %r3
	.word 0xe607e001  ! 1029: LDUW_I	lduw	[%r31 + 0x0001], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_398)) -> intp(0,1,3)
xir_0_398:
	.word 0xa9852001  ! 1030: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	set 0xd4c69447, %r28
	stxa %r28, [%g0] 0x73
intvec_0_399:
	.word 0x39400001  ! 1031: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x88d9800c  ! 1033: SMULcc_R	smulcc 	%r6, %r12, %r4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 1034: FqTOd	dis not found

tagged_0_401:
	taddcctv %r25, 0x1dc7, %r7
	.word 0xe207e001  ! 1035: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe20fc000  ! 1036: LDUB_R	ldub	[%r31 + %r0], %r17
splash_cmpr_0_402:
	setx 0x8120159d81b61556, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1037: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9022ae  ! 1038: WRPR_PSTATE_I	wrpr	%r0, 0x02ae, %pstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1039: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_0_403:
	set 0xa2038746, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1040: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_404)) -> intp(0,0,11)
intvec_0_404:
	.word 0x39400001  ! 1041: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 1042: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe2c80e60  ! 1043: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r17
	.word 0xe20fc000  ! 1044: LDUB_R	ldub	[%r31 + %r0], %r17
	.word 0x87802014  ! 1045: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe28fe010  ! 1046: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
mondo_0_405:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c00a  ! 1047: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x8b454000  ! 1048: RD_CLEAR_SOFTINT	rd	%clear_softint, %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_406)) -> intp(0,1,3)
xir_0_406:
	.word 0xa9836001  ! 1049: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
tagged_0_407:
	taddcctv %r1, 0x189e, %r4
	.word 0xca07e001  ! 1051: LDUW_I	lduw	[%r31 + 0x0001], %r5
splash_lsu_0_408:
	setx 0x3fa8b165b298cad1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1052: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 1053: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_0_409:
	taddcctv %r17, 0x1119, %r11
	.word 0xca07e001  ! 1054: LDUW_I	lduw	[%r31 + 0x0001], %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_410)) -> intp(0,0,31)
intvec_0_410:
	.word 0x39400001  ! 1055: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xcac00e60  ! 1056: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r5
	.word 0x879021e3  ! 1057: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
	.word 0xcac7e010  ! 1058: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x8d802004  ! 1059: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200c  ! 1060: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_0_411:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81a00546  ! 1: FSQRTd	fsqrt	
	.word 0x91a0c822  ! 1061: FADDs	fadds	%f3, %f2, %f8
debug_0_412:
	setx debug_0_412 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1062: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08fe010  ! 1063: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xab81c00b  ! 1064: WR_CLEAR_SOFTINT_R	wr	%r7, %r11, %clear_softint
	.word 0xd08008a0  ! 1065: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1066: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_413:
	setx 0x5929810355fc6ae0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1067: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_414:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9348009  ! 1: STQF_R	-	%f12, [%r9, %r18]
	normalw
	.word 0x9b458000  ! 1068: RD_SOFTINT_REG	rd	%softint, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 1069: LDX_R	ldx	[%r31 + %r0], %r13
	set 0xd9cb72aa, %r28
	stxa %r28, [%g0] 0x73
intvec_0_415:
	.word 0x39400001  ! 1070: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 1071: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023a9  ! 1072: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
DS_0_416:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1073: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93d020b2  ! 1074: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xda8008a0  ! 1075: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902001  ! 1076: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x28700001  ! 1077: BPLEU	<illegal instruction>
DS_0_417:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3348010  ! 1: STQF_R	-	%f17, [%r16, %r18]
	normalw
	.word 0xa5458000  ! 1078: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x87902264  ! 1079: WRPR_TT_I	wrpr	%r0, 0x0264, %tt
	.word 0x93d020b2  ! 1080: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xe4c7e020  ! 1081: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r18
debug_0_418:
	setx debug_0_418 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1082: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad81a001  ! 1083: WR_SOFTINT_REG_I	wr	%r6, 0x0001, %softint
	.word 0x8d903e2e  ! 1084: WRPR_PSTATE_I	wrpr	%r0, 0x1e2e, %pstate
	.word 0x87802080  ! 1085: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_419:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1086: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_420:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1087: SAVE_R	save	%r31, %r0, %r31
DS_0_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1348011  ! 1: STQF_R	-	%f8, [%r17, %r18]
	normalw
	.word 0x9b458000  ! 1088: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d903e6a  ! 1089: WRPR_PSTATE_I	wrpr	%r0, 0x1e6a, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_422)) -> intp(0,0,23)
intvec_0_422:
	.word 0x39400001  ! 1090: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1091: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 1092: BCS	bcs,a	<label_0x1>
	.word 0x8d902aef  ! 1093: WRPR_PSTATE_I	wrpr	%r0, 0x0aef, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 1094: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802088  ! 1095: WRASI_I	wr	%r0, 0x0088, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1096: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_0_423:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_423:
	.word 0x8f902003  ! 1097: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_424:
	setx debug_0_424 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1098: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81540000  ! 1099: RDPR_GL	rdpr	%-, %r0
	.word 0xc04fe001  ! 1100: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 1101: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x93d02035  ! 1102: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93480000  ! 1103: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
tagged_0_425:
	taddcctv %r12, 0x12b0, %r18
	.word 0xd207e001  ! 1104: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x81460000  ! 1105: RD_STICK_REG	stbar
	.word 0x8d9023bd  ! 1106: WRPR_PSTATE_I	wrpr	%r0, 0x03bd, %pstate
splash_cmpr_0_426:
	setx 0x32fe8b99682c40b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1107: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93540000  ! 1108: RDPR_GL	<illegal instruction>
	.word 0x34700001  ! 1109: BPG	<illegal instruction>
	.word 0x93d02032  ! 1110: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_tba_0_427:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1111: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd297e010  ! 1112: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd327c011  ! 1113: STF_R	st	%f9, [%r17, %r31]
debug_0_428:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1114: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91912001  ! 1115: WRPR_PIL_I	wrpr	%r4, 0x0001, %pil
	.word 0x91d02032  ! 1116: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_0_429:
	taddcctv %r16, 0x1455, %r10
	.word 0xd207e001  ! 1117: LDUW_I	lduw	[%r31 + 0x0001], %r9
splash_tba_0_430:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1118: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd29fc020  ! 1119: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x91d020b5  ! 1120: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d9025e1  ! 1121: WRPR_PSTATE_I	wrpr	%r0, 0x05e1, %pstate
debug_0_431:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1122: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982ed6  ! 1123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed6, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_432)) -> intp(0,1,3)
xir_0_432:
	.word 0xa981a001  ! 1124: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0x87802004  ! 1125: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_0_433:
	setx 0xc0bdd1a4d4f0819f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_434:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1127: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_435:
	set 0x185356b4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 1129: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_436)) -> intp(0,0,30)
intvec_0_436:
	.word 0x39400001  ! 1130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 1131: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd28008a0  ! 1132: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2c004a0  ! 1133: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 1135: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902003  ! 1136: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd207c000  ! 1137: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x8d903b1c  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x1b1c, %pstate
	.word 0xd327c011  ! 1139: STF_R	st	%f9, [%r17, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 1140: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_437)) -> intp(0,1,3)
xir_0_437:
	.word 0xa982a001  ! 1141: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
debug_0_438:
	mov 8, %r18
	.word 0xdcf00852  ! 1142: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x26700001  ! 1143: BPL	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 1144: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x81510000  ! 1145: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd2d804a0  ! 1146: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x83454000  ! 1147: RD_CLEAR_SOFTINT	rd	%clear_softint, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_439)) -> intp(0,1,3)
xir_0_439:
	.word 0xa984e001  ! 1148: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x8d9021b5  ! 1149: WRPR_PSTATE_I	wrpr	%r0, 0x01b5, %pstate
	.word 0xa1902008  ! 1150: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902005  ! 1151: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368a001  ! 1152: SDIVX_I	sdivx	%r2, 0x0001, %r17
	set 0x54203f31, %r28
	stxa %r28, [%g0] 0x73
intvec_0_441:
	.word 0x39400001  ! 1153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1154: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902005  ! 1155: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99902002  ! 1156: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8d903cc2  ! 1157: WRPR_PSTATE_I	wrpr	%r0, 0x1cc2, %pstate
DS_0_442:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5334014  ! 1: STQF_R	-	%f18, [%r20, %r13]
	normalw
	.word 0x87458000  ! 1158: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc68fe030  ! 1159: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	.word 0x87802020  ! 1160: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x88850013  ! 1161: ADDcc_R	addcc 	%r20, %r19, %r4
	.word 0xc8d004a0  ! 1162: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0xa1540000  ! 1163: RDPR_GL	rdpr	%-, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 1164: LDX_R	ldx	[%r31 + %r0], %r16
mondo_0_443:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d910002  ! 1165: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
	.word 0xe0800b60  ! 1166: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_444)) -> intp(0,1,3)
xir_0_444:
	.word 0xa9842001  ! 1167: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x87802014  ! 1168: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe00fe001  ! 1169: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0x93902001  ! 1170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_445)) -> intp(0,1,3)
xir_0_445:
	.word 0xa9816001  ! 1171: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x93902002  ! 1172: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_0_446:
	setx 0x65c6cde24e4885b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_447:
	mov 8, %r18
	.word 0xe2f00852  ! 1174: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 1175: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0d7e030  ! 1176: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0xe077e001  ! 1177: STX_I	stx	%r16, [%r31 + 0x0001]
	.word 0xe077e001  ! 1178: STX_I	stx	%r16, [%r31 + 0x0001]
splash_cmpr_0_448:
	setx 0x34d3477836f1e4ab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1179: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9033ef  ! 1180: WRPR_PSTATE_I	wrpr	%r0, 0x13ef, %pstate
	.word 0x9f802001  ! 1181: SIR	sir	0x0001
	.word 0xe057e001  ! 1182: LDSH_I	ldsh	[%r31 + 0x0001], %r16
	.word 0xe047e001  ! 1183: LDSW_I	ldsw	[%r31 + 0x0001], %r16
	.word 0x87802089  ! 1184: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe0c004a0  ! 1185: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
splash_lsu_0_449:
	setx 0x9ccf72fb984f5cb3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1186: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad846001  ! 1187: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x81510000  ! 1189: RDPR_TICK	<illegal instruction>
	.word 0xe137e001  ! 1190: STQF_I	-	%f16, [0x0001, %r31]
	.word 0xa984c00a  ! 1191: WR_SET_SOFTINT_R	wr	%r19, %r10, %set_softint
splash_lsu_0_450:
	setx 0xe869d35513d3899f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1192: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_451:
	setx debug_0_451 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1194: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_452:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1195: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9480000  ! 1196: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
tagged_0_453:
	taddcctv %r17, 0x14bc, %r19
	.word 0xe807e001  ! 1197: LDUW_I	lduw	[%r31 + 0x0001], %r20
DS_0_454:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3346001  ! 1: STQF_I	-	%f17, [0x0001, %r17]
	normalw
	.word 0x95458000  ! 1198: RD_SOFTINT_REG	rd	%softint, %r10
	ta	T_CHANGE_HPRIV	! macro
debug_0_455:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1200: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802014  ! 1201: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802055  ! 1202: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x81510000  ! 1203: RDPR_TICK	rdpr	%tick, %r0
mondo_0_456:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940007  ! 1204: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
splash_cmpr_0_457:
	setx 0xa976c69e33f1ae36, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1205: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_458:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7348011  ! 1: STQF_R	-	%f11, [%r17, %r18]
	normalw
	.word 0xa3458000  ! 1206: RD_SOFTINT_REG	rd	%softint, %r17
debug_0_459:
	mov 8, %r18
	.word 0xdaf00852  ! 1207: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xa9824013  ! 1208: WR_SET_SOFTINT_R	wr	%r9, %r19, %set_softint
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b500000  ! 1210: RDPR_TPC	<illegal instruction>
tagged_0_460:
	tsubcctv %r25, 0x17c9, %r16
	.word 0xca07e001  ! 1211: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca97e010  ! 1212: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
debug_0_461:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1213: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 1214: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 1216: LDX_R	ldx	[%r31 + %r0], %r5
mondo_0_462:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d900010  ! 1217: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
debug_0_463:
	setx debug_0_463 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1218: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_464)) -> intp(0,0,26)
intvec_0_464:
	.word 0x39400001  ! 1219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_465:
	mov 8, %r18
	.word 0xdcf00852  ! 1220: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xcb1fe001  ! 1221: LDDF_I	ldd	[%r31, 0x0001], %f5
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1222: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 1223: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902211  ! 1224: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
tagged_0_466:
	tsubcctv %r6, 0x1ea9, %r20
	.word 0xca07e001  ! 1225: LDUW_I	lduw	[%r31 + 0x0001], %r5
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1226: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802020  ! 1227: WRASI_I	wr	%r0, 0x0020, %asi
	set 0x62d16ed4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_467:
	.word 0x39400001  ! 1228: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_468:
	setx 0x253ebb287b3762ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1229: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81510000  ! 1230: RDPR_TICK	<illegal instruction>
splash_lsu_0_469:
	setx 0xd2db22aa068218ab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca8008a0  ! 1232: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x93902007  ! 1233: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_470:
	set 0xe727e933, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 1235: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca1fc000  ! 1236: LDD_R	ldd	[%r31 + %r0], %r5
debug_0_471:
	mov 8, %r18
	.word 0xd0f00852  ! 1237: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x93902004  ! 1238: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 1239: LDX_R	ldx	[%r31 + %r0], %r5
tagged_0_472:
	tsubcctv %r7, 0x1116, %r10
	.word 0xca07e001  ! 1240: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x81460000  ! 1241: RD_STICK_REG	stbar
	.word 0xa190200c  ! 1242: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	set 0x241462b4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_473:
	.word 0x39400001  ! 1243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xca4fe001  ! 1244: LDSB_I	ldsb	[%r31 + 0x0001], %r5
debug_0_474:
	mov 8, %r18
	.word 0xe6f00852  ! 1245: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	set 0x26de6ce5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_475:
	.word 0x39400001  ! 1246: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 1247: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x30700001  ! 1248: BPA	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_476)) -> intp(0,1,3)
xir_0_476:
	.word 0xa9802001  ! 1249: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x3e700001  ! 1250: BPVC	<illegal instruction>
DS_0_477:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe732400c  ! 1: STQF_R	-	%f19, [%r12, %r9]
	normalw
	.word 0x83458000  ! 1251: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x3a800001  ! 1252: BCC	bcc,a	<label_0x1>
	.word 0x819826c5  ! 1253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_478)) -> intp(0,0,12)
intvec_0_478:
	.word 0x39400001  ! 1254: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790216a  ! 1255: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	.word 0x8198210d  ! 1256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010d, %hpstate
	set 0x765e9ba, %r28
	stxa %r28, [%g0] 0x73
intvec_0_479:
	.word 0x39400001  ! 1257: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1258: SIR	sir	0x0001
	.word 0x87802014  ! 1259: WRASI_I	wr	%r0, 0x0014, %asi
debug_0_480:
	mov 8, %r18
	.word 0xd0f00852  ! 1260: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_0_481:
	setx 0xbf7bcbfb8aa9d0cf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9037d7  ! 1263: WRPR_PSTATE_I	wrpr	%r0, 0x17d7, %pstate
splash_lsu_0_482:
	setx 0xb47553479b2deb65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 1265: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_0_483:
	setx 0x725f9dcabfcf5ab0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802000  ! 1267: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_484:
	tsubcctv %r12, 0x1c08, %r13
	.word 0xc207e001  ! 1268: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x879021a7  ! 1269: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
DS_0_485:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcf31a001  ! 1: STQF_I	-	%f7, [0x0001, %r6]
	normalw
	.word 0x8f458000  ! 1270: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xa190200d  ! 1271: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xce1fe001  ! 1272: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0xce1fe001  ! 1273: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x9b454000  ! 1274: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
splash_lsu_0_486:
	setx 0x659da0c93ee9bab7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1275: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_487:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d91400b  ! 1276: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
splash_lsu_0_488:
	setx 0x7573931d7811b05b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 1278: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_0_489:
	set 0xa3ce80f9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1279: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_490:
	tsubcctv %r19, 0x10db, %r21
	.word 0xda07e001  ! 1280: LDUW_I	lduw	[%r31 + 0x0001], %r13
DS_0_491:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1281: SAVE_R	save	%r31, %r0, %r31
	.word 0xda880e40  ! 1282: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
	.word 0xdabfe001  ! 1283: STDA_I	stda	%r13, [%r31 + 0x0001] %asi
	.word 0xa7454000  ! 1284: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x94a8c014  ! 1285: ANDNcc_R	andncc 	%r3, %r20, %r10
	.word 0xd48008a0  ! 1286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87902270  ! 1287: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
	.word 0x9f802001  ! 1288: SIR	sir	0x0001
	.word 0xa1902005  ! 1289: WRPR_GL_I	wrpr	%r0, 0x0005, %-
intveclr_0_492:
	set 0xe5b353a3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd51fc000  ! 1291: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0xd527e001  ! 1292: STF_I	st	%f10, [0x0001, %r31]
mondo_0_493:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 1293: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xd48804a0  ! 1294: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x8d802000  ! 1295: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819826d7  ! 1296: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0xd4d804a0  ! 1297: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_494)) -> intp(0,0,9)
intvec_0_494:
	.word 0x39400001  ! 1298: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 1299: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	set 0x98b3ddc0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_495:
	.word 0x39400001  ! 1300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8145c000  ! 1301: RD_TICK_CMPR_REG	stbar
	.word 0xa3450000  ! 1302: RD_SET_SOFTINT	rd	%set_softint, %r17
DS_0_496:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f16, %f6
	.word 0x97b4c313  ! 1303: ALIGNADDRESS	alignaddr	%r19, %r19, %r11
	.word 0xa3520000  ! 1304: RDPR_PIL	rdpr	%pil, %r17
	.word 0xe297e020  ! 1305: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
tagged_0_497:
	taddcctv %r6, 0x181f, %r20
	.word 0xe207e001  ! 1306: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe327c013  ! 1307: STF_R	st	%f17, [%r19, %r31]
	.word 0x3c800001  ! 1308: BPOS	bpos,a	<label_0x1>
	.word 0xe24fe001  ! 1309: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	.word 0xe2800b40  ! 1310: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95692001  ! 1311: SDIVX_I	sdivx	%r4, 0x0001, %r10
	.word 0x8d903b86  ! 1312: WRPR_PSTATE_I	wrpr	%r0, 0x1b86, %pstate
	.word 0x97540000  ! 1313: RDPR_GL	rdpr	%-, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_499)) -> intp(0,1,3)
xir_0_499:
	.word 0xa980a001  ! 1314: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xd61fc000  ! 1315: LDD_R	ldd	[%r31 + %r0], %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_500)) -> intp(0,1,3)
xir_0_500:
	.word 0xa984a001  ! 1316: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xa0c22001  ! 1317: ADDCcc_I	addccc 	%r8, 0x0001, %r16
	.word 0x9745c000  ! 1318: RD_TICK_CMPR_REG	rd	%-, %r11
intveclr_0_501:
	set 0x4b2cbeaf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1319: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91906001  ! 1320: WRPR_PIL_I	wrpr	%r1, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_502)) -> intp(0,0,27)
intvec_0_502:
	.word 0x39400001  ! 1321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 1322: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1323: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_503)) -> intp(0,1,3)
xir_0_503:
	.word 0xa982a001  ! 1324: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xd69fe001  ! 1325: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0xd68008a0  ! 1326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87902218  ! 1327: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_504)) -> intp(0,1,3)
xir_0_504:
	.word 0xa9852001  ! 1328: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0x8d9033d8  ! 1329: WRPR_PSTATE_I	wrpr	%r0, 0x13d8, %pstate
splash_cmpr_0_505:
	setx 0x498d488a50d2a195, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1330: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 1331: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x83d02033  ! 1332: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x24700001  ! 1333: BPLE	<illegal instruction>
debug_0_506:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1334: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902001  ! 1335: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 1336: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd68804a0  ! 1337: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_507)) -> intp(0,1,3)
xir_0_507:
	.word 0xa9842001  ! 1338: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x87802058  ! 1339: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802080  ! 1340: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd69fc020  ! 1341: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x87802080  ! 1342: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1343: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_508:
	setx debug_0_508 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1344: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd737c013  ! 1345: STQF_R	-	%f11, [%r19, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 1346: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87902061  ! 1347: WRPR_TT_I	wrpr	%r0, 0x0061, %tt
	.word 0xd6d7e020  ! 1348: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1349: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_509)) -> intp(0,1,3)
xir_0_509:
	.word 0xa9842001  ! 1350: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x9950c000  ! 1351: RDPR_TT	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1352: LDX_R	ldx	[%r31 + %r0], %r12
DS_0_510:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1353: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8d004a0  ! 1354: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x879023f6  ! 1355: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
DS_0_511:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1356: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_512)) -> intp(0,1,3)
xir_0_512:
	.word 0xa9832001  ! 1357: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xa6c16001  ! 1358: ADDCcc_I	addccc 	%r5, 0x0001, %r19
splash_cmpr_0_513:
	setx 0xea0d8a8888a8eef0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1359: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02033  ! 1360: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe637c013  ! 1361: STH_R	sth	%r19, [%r31 + %r19]
	.word 0x8d802004  ! 1362: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_514:
	setx debug_0_514 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1363: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902529  ! 1364: WRPR_PSTATE_I	wrpr	%r0, 0x0529, %pstate
splash_lsu_0_515:
	setx 0xc1fb79256ee2ca1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790237f  ! 1366: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0x81982786  ! 1367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0786, %hpstate
DS_0_516:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1368: SAVE_R	save	%r31, %r0, %r31
	set 0x94a84d0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_517:
	.word 0x39400001  ! 1369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1370: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab850004  ! 1371: WR_CLEAR_SOFTINT_R	wr	%r20, %r4, %clear_softint
	.word 0xe727e001  ! 1372: STF_I	st	%f19, [0x0001, %r31]
	.word 0xe62fc004  ! 1373: STB_R	stb	%r19, [%r31 + %r4]
	.word 0x8d903b92  ! 1374: WRPR_PSTATE_I	wrpr	%r0, 0x1b92, %pstate
splash_cmpr_0_518:
	setx 0x199193e876fe9a9a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1375: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 1376: WRASI_I	wr	%r0, 0x0088, %asi
debug_0_519:
	mov 8, %r18
	.word 0xdcf00852  ! 1377: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
mondo_0_520:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 1378: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x87902334  ! 1379: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
debug_0_521:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe71fe001  ! 1381: LDDF_I	ldd	[%r31, 0x0001], %f19
debug_0_522:
	mov 8, %r18
	.word 0xd8f00852  ! 1382: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_523)) -> intp(0,1,3)
xir_0_523:
	.word 0xa981e001  ! 1383: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xe637e001  ! 1384: STH_I	sth	%r19, [%r31 + 0x0001]
	.word 0x93902000  ! 1385: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe737e001  ! 1386: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xe61fc000  ! 1387: LDD_R	ldd	[%r31 + %r0], %r19
debug_0_524:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe65fe001  ! 1389: LDX_I	ldx	[%r31 + 0x0001], %r19
	.word 0x8d9036f4  ! 1390: WRPR_PSTATE_I	wrpr	%r0, 0x16f4, %pstate
	.word 0xe717c000  ! 1391: LDQF_R	-	[%r31, %r0], %f19
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0xc57f199f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_525:
	.word 0x39400001  ! 1393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_526)) -> intp(0,1,3)
xir_0_526:
	.word 0xa984a001  ! 1394: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xa5500000  ! 1395: RDPR_TPC	<illegal instruction>
	.word 0xab848014  ! 1396: WR_CLEAR_SOFTINT_R	wr	%r18, %r20, %clear_softint
	.word 0xe497e020  ! 1397: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe4800bc0  ! 1398: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r18
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1399: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_0_527:
	setx 0x554f3f22b1e89dab, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9194e001  ! 1401: WRPR_PIL_I	wrpr	%r19, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_528)) -> intp(0,0,14)
intvec_0_528:
	.word 0x39400001  ! 1402: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_529:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 1403: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xa1902004  ! 1404: WRPR_GL_I	wrpr	%r0, 0x0004, %-
intveclr_0_530:
	set 0x6a15f7c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1405: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_531:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1407: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe457e001  ! 1408: LDSH_I	ldsh	[%r31 + 0x0001], %r18
intveclr_0_532:
	set 0x710928a2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1409: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4c804a0  ! 1410: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xa1902004  ! 1411: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe4d7e010  ! 1412: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
	.word 0x93d02033  ! 1413: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 1414: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_0_533:
	taddcctv %r18, 0x192f, %r13
	.word 0xe407e001  ! 1415: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe43fc00a  ! 1416: STD_R	std	%r18, [%r31 + %r10]
	.word 0x91d02032  ! 1417: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe447e001  ! 1418: LDSW_I	ldsw	[%r31 + 0x0001], %r18
tagged_0_534:
	tsubcctv %r16, 0x1bea, %r10
	.word 0xe407e001  ! 1419: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xa7826001  ! 1420: WR_GRAPHICS_STATUS_REG_I	wr	%r9, 0x0001, %-
	.word 0xe4c00e80  ! 1421: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r18
tagged_0_535:
	taddcctv %r3, 0x18cd, %r12
	.word 0xe407e001  ! 1422: LDUW_I	lduw	[%r31 + 0x0001], %r18
change_to_randtl_0_536:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_536:
	.word 0x8f902002  ! 1423: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_0_537:
	mov 8, %r18
	.word 0xdcf00852  ! 1424: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xe48008a0  ! 1425: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_0_538:
	setx debug_0_538 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1426: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_539:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 1427: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x8d802004  ! 1428: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902197  ! 1429: WRPR_TT_I	wrpr	%r0, 0x0197, %tt
tagged_0_540:
	tsubcctv %r10, 0x1781, %r8
	.word 0xe407e001  ! 1430: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_lsu_0_541:
	setx 0x112feb4495c4b40f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1431: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 1432: BPNEG	<illegal instruction>
	.word 0x36700001  ! 1433: BPGE	<illegal instruction>
	.word 0xe497e020  ! 1434: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_542)) -> intp(0,0,1)
intvec_0_542:
	.word 0x39400001  ! 1435: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 1436: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f480000  ! 1437: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
debug_0_543:
	mov 8, %r18
	.word 0xe0f00852  ! 1438: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_544)) -> intp(0,0,6)
intvec_0_544:
	.word 0x39400001  ! 1439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022fd  ! 1440: WRPR_TT_I	wrpr	%r0, 0x02fd, %tt
	.word 0x87802020  ! 1441: WRASI_I	wr	%r0, 0x0020, %asi
	set 0xc3088910, %r28
	stxa %r28, [%g0] 0x73
intvec_0_545:
	.word 0x39400001  ! 1442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_546:
	mov 8, %r18
	.word 0xd0f00852  ! 1443: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 1444: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xcec804a0  ! 1445: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	set 0x410e7369, %r28
	stxa %r28, [%g0] 0x73
intvec_0_547:
	.word 0x39400001  ! 1446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_548:
	setx 0xdb58103a96624111, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1447: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce9004a0  ! 1448: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
tagged_0_549:
	taddcctv %r20, 0x11e5, %r9
	.word 0xce07e001  ! 1449: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xab81400a  ! 1450: WR_CLEAR_SOFTINT_R	wr	%r5, %r10, %clear_softint
	.word 0xce800b20  ! 1451: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r7
debug_0_550:
	setx debug_0_550 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1452: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802014  ! 1453: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa190200f  ! 1454: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_0_551:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1455: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce2fc00a  ! 1456: STB_R	stb	%r7, [%r31 + %r10]
	.word 0xa750c000  ! 1457: RDPR_TT	rdpr	%tt, %r19
	.word 0xe6d80e80  ! 1458: LDXA_R	ldxa	[%r0, %r0] 0x74, %r19
	.word 0x99520000  ! 1459: RDPR_PIL	<illegal instruction>
mondo_0_552:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d908014  ! 1460: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ca001  ! 1461: SDIVX_I	sdivx	%r18, 0x0001, %r16
debug_0_554:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1462: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x7b3b1cd7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_555:
	.word 0x39400001  ! 1463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_556:
	setx debug_0_556 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1464: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x22800001  ! 1465: BE	be,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x28700001  ! 1467: BPLEU	<illegal instruction>
	set 0x34a36ff6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_557:
	.word 0x39400001  ! 1468: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_558:
	mov 8, %r18
	.word 0xd0f00852  ! 1469: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_tba_0_559:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1470: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81460000  ! 1471: RD_STICK_REG	stbar
DS_0_560:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1472: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe0cfe030  ! 1473: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 1474: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 1475: RD_STICK_REG	stbar
	.word 0x8d802004  ! 1476: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_561:
	mov 8, %r18
	.word 0xe2f00852  ! 1477: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xe11fe001  ! 1478: LDDF_I	ldd	[%r31, 0x0001], %f16
tagged_0_562:
	tsubcctv %r3, 0x108a, %r9
	.word 0xe007e001  ! 1479: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x99450000  ! 1480: RD_SET_SOFTINT	rd	%set_softint, %r12
	.word 0x879023d9  ! 1481: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	.word 0xa5454000  ! 1482: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	set 0x7f90c4ba, %r28
	stxa %r28, [%g0] 0x73
intvec_0_563:
	.word 0x39400001  ! 1483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_564:
	tsubcctv %r4, 0x138b, %r17
	.word 0xe407e001  ! 1484: LDUW_I	lduw	[%r31 + 0x0001], %r18
debug_0_565:
	setx debug_0_565 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1485: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe40fe001  ! 1486: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0x8198220c  ! 1487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020c, %hpstate
intveclr_0_566:
	set 0x9c27a192, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1488: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x937a83a7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_567:
	.word 0x39400001  ! 1489: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_568:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcf34c012  ! 1: STQF_R	-	%f7, [%r18, %r19]
	normalw
	.word 0xa9458000  ! 1490: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe937c012  ! 1491: STQF_R	-	%f20, [%r18, %r31]
debug_0_569:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1492: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x26700001  ! 1493: BPL	<illegal instruction>
	.word 0x91d02033  ! 1494: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_0_570:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_570:
	.word 0x8f902001  ! 1496: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02033  ! 1497: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8d7e030  ! 1498: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
debug_0_571:
	setx debug_0_571 + 64, %r11, %r19
	mov 0x38, %r18
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

	.xword	0x51d40ca05daae022
	.xword	0x39ddadad6b17775a
	.xword	0xe956358d83278a10
	.xword	0xbcc00750af72b7d6
	.xword	0xe905562f2574138c
	.xword	0xf5e9c855c3fd83e1
	.xword	0x84dbd22c7c295a59
	.xword	0x3ef48eccb21f6540
	.xword	0xf4381eccfc15d64f
	.xword	0x2ac2cb5b0e7bd1cb
	.xword	0xa553693b0457d69f
	.xword	0x9e71a7fb65c0d34e
	.xword	0x99d63d1be88e6166
	.xword	0x990de0d26c767f86
	.xword	0x1f9f8e35128f8dab
	.xword	0x80dadb657c291352
	.xword	0x8c0f9f453ff80ac6
	.xword	0xc01066878a8be37f
	.xword	0xb8e03c63f4c5529a
	.xword	0xef69c5a346f578f2
	.xword	0xc721bdc2608b49ee
	.xword	0xce94b3b37486104a
	.xword	0xdaf311ae0e178875
	.xword	0xb541eaa3e2c7f306
	.xword	0x76605eff0270ea32
	.xword	0xb7b0f85c7f26f6ba
	.xword	0x3e1797e9c35c1f88
	.xword	0x5bd3b61d0e08e13a
	.xword	0x21e3fd308bd8ead3
	.xword	0x5b1b7a98072b74e6
	.xword	0x3240d0adfa7b0bea
	.xword	0xe5a894fea4663cec
	.xword	0xe5855f54b98b3962
	.xword	0xc8ba30e373f5a473
	.xword	0xafadff512789a173
	.xword	0x7da370d6cfdeccb2
	.xword	0x4633eb0ac7f7cf9c
	.xword	0x71509adea92564f5
	.xword	0xb1f741f97020e351
	.xword	0xe02ff9d86f432442
	.xword	0x23dc84d807e6c7cc
	.xword	0xb8106c9d15760e53
	.xword	0x36a597a382968929
	.xword	0x2876d77b979ff873
	.xword	0x94822622b1a5b530
	.xword	0x376c8cfc4cacede3
	.xword	0x8c292db18fccc918
	.xword	0x45ec21580d585c01
	.xword	0xf41d002e2be51e81
	.xword	0x1cf789722ab682fc
	.xword	0xaec05629795d9f9f
	.xword	0xbef9af4daeb11cfd
	.xword	0x3c18284cc392660f
	.xword	0xf7982b6a3fff98b0
	.xword	0x2e288a9ec34d49a8
	.xword	0xc5184efcfd2bfeb7
	.xword	0x074496430d20ca95
	.xword	0x64830cadfd4eac57
	.xword	0xe4d839667db01c92
	.xword	0xfc587a1aa6cac7a0
	.xword	0x0f764bb482cfe5cf
	.xword	0x2c700d61357e8d3e
	.xword	0xfca60400531c7fc2
	.xword	0xbc18155dcdfe65a7
	.xword	0xd8e5d66fafe7002e
	.xword	0x3156f283ba7ca974
	.xword	0x792fb03a4a8fdc70
	.xword	0xba42b4723cf49f90
	.xword	0x9f45e23c5929d6dc
	.xword	0x63da0b0729987728
	.xword	0xfdd8841864661248
	.xword	0x9e34d94ce410ee25
	.xword	0xfb84f6ee2303bcb1
	.xword	0x197b33897e305e29
	.xword	0x4ad27a4b8360225b
	.xword	0xcd268e914bfaa99e
	.xword	0x4c92b5481ef39183
	.xword	0x2ecb1e203385db37
	.xword	0x8f74c878c454d1a2
	.xword	0x5f0e847b74dcbfc7
	.xword	0x5b0397e1b63f2c35
	.xword	0xb54681031033be0f
	.xword	0xd3625a02fef6861f
	.xword	0x79a8de90380727b3
	.xword	0x0be9ac835e436ca8
	.xword	0x40a94d5c737a812f
	.xword	0x78ade925fd493152
	.xword	0x72c1727c3a95a1a9
	.xword	0x91aaffd08401f7fb
	.xword	0x496ac6fce276d512
	.xword	0xfe2b957061faa334
	.xword	0xbf73e8ac8cc0daf9
	.xword	0x84769054d24f8b20
	.xword	0x1b53352ba7b8d2dd
	.xword	0x32b8103f555d6f81
	.xword	0x7dd917f4084568c8
	.xword	0xc293496df5a48dc2
	.xword	0xb0a3485ae69f74f7
	.xword	0x18361ea1ebb39c9f
	.xword	0xf1b69d35a2c3d91a
	.xword	0x0fe129ad61c9388a
	.xword	0xb0074f517cce7095
	.xword	0xbbc864323e983340
	.xword	0xcf6784e4c4cbf945
	.xword	0x7bec1d693d9a7b93
	.xword	0x3288b2d5000c3308
	.xword	0x75f189218d1d24e1
	.xword	0x1694921ff67c34ae
	.xword	0x5ca39e54b4754b4b
	.xword	0xc7966ee6991e6a5d
	.xword	0xb9ea9444c2ed3dcf
	.xword	0xe8ead63bc255b83b
	.xword	0xddf14ec6bf0c5fa1
	.xword	0xd21a7fc0c9cea5bf
	.xword	0xf5c447f6ad806eb0
	.xword	0x9f847b3b92bf6d48
	.xword	0x8d3481d6729b0335
	.xword	0x33aa3c5e9105afdf
	.xword	0xdc2af87d4132b45a
	.xword	0xd428852f4f726912
	.xword	0x810c7bb12b960a56
	.xword	0xd07e87b744f84e14
	.xword	0x9bd7380f5ae1f42c
	.xword	0x665068183d9258d3
	.xword	0x4418fc95d255f8a9
	.xword	0xae4640712cf6bec7
	.xword	0xc535816868fbc83b
	.xword	0x8820c731b169c736
	.xword	0x45af4975335b79ed
	.xword	0x9748c244b6723a59
	.xword	0x71c4d498b7ec8427
	.xword	0xe3e7f6beed3e1400
	.xword	0xc89ff8821d0bdca9
	.xword	0x9448318cf8e94266
	.xword	0x11de166c1a98d325
	.xword	0x9d6741a506fca95b
	.xword	0x5ff8f0d424eff10a
	.xword	0x0e358f0a9c86de1b
	.xword	0x78330fbf5ad9c25e
	.xword	0xc8a348689d7fec8b
	.xword	0x1371975d498bafc0
	.xword	0xad9ce067a6e25d8b
	.xword	0x664089b368498338
	.xword	0xfa32bc517e70bbf6
	.xword	0x1fc5f4727ba5217f
	.xword	0xb5c986ffc0fe1335
	.xword	0xbf64c0dec466745f
	.xword	0x15d1cc29ee475171
	.xword	0xe642ea6bc8a75f46
	.xword	0xc7edcb2e4f41694d
	.xword	0xe3ebbfe51c9c1477
	.xword	0x82ac914adbdbad76
	.xword	0x590ae7acf5131b31
	.xword	0xbe75683216646e5d
	.xword	0x4e4fc4f5dbc4b0db
	.xword	0x530814fe35af98a8
	.xword	0xcca478303152b371
	.xword	0x06c3a7c8d4f3fe73
	.xword	0xaff151d83770633f
	.xword	0x870bc540f82384d8
	.xword	0x9357f8a5c6cfea70
	.xword	0x0488f5b325ffbcdd
	.xword	0x0c9fb249abf18a33
	.xword	0x9c917ab06372fbf4
	.xword	0xf85127bc1850f36d
	.xword	0x57c6905696c6394f
	.xword	0x0a470de00d898bec
	.xword	0x26acd5a7bc3c8bae
	.xword	0x45bad876643278d4
	.xword	0xd34e93a0f52d81dc
	.xword	0x7ae9aa84bd01f9d1
	.xword	0xcaf3c391fef2bf89
	.xword	0xf599a79e2e547c35
	.xword	0xc2aeb7f25a2fea66
	.xword	0x17d39bcff8071072
	.xword	0x0bf5ad48838cc7f9
	.xword	0xef3fb10c3d1052a6
	.xword	0x3c34bd88058d06b5
	.xword	0x8c2bbd8328d3f168
	.xword	0x731bfbbfe1975c37
	.xword	0x8fda2bb368661fd5
	.xword	0x9d19799428ad0432
	.xword	0x232b18ac7dc8ec39
	.xword	0xb0757cb6b277797c
	.xword	0x1c2bbe06f304737e
	.xword	0x9521768168dc80e0
	.xword	0x212d6311241b4fb9
	.xword	0x6fa5895a95932321
	.xword	0x2792b96d7f87829f
	.xword	0x594c80ee832241b1
	.xword	0x849242701f668837
	.xword	0x7386a817a0b2d430
	.xword	0xe9cd106172fd1f5e
	.xword	0x9b0def013550d763
	.xword	0x6b7620c8d9b37081
	.xword	0x76326bb42e410710
	.xword	0x4089353df4a2214f
	.xword	0x293515566f017a70
	.xword	0xd74284ea32d2190f
	.xword	0x4cc6859d383e0f3b
	.xword	0xecb1290f3800ec21
	.xword	0x28a818b75f690e20
	.xword	0xb183b55057d2b52a
	.xword	0x846fa1e95129544b
	.xword	0x726d985619b0d175
	.xword	0x310727585e0229df
	.xword	0xb2aad01610a48731
	.xword	0x3c87011b82940e60
	.xword	0xc552d5f7c675cd79
	.xword	0x74da9b46a55a7ab5
	.xword	0x30ce988ce38a39ad
	.xword	0x0f59e7255a6e088b
	.xword	0xf8d0610d658d0b8c
	.xword	0xccf8caed02da9419
	.xword	0x7d4f10c666e34896
	.xword	0x576d7ac51248b206
	.xword	0xad9297c3a848d846
	.xword	0xf7c8cee9e024bfb4
	.xword	0x4125d2a402de660e
	.xword	0xe8331d7978f0abe9
	.xword	0x659dbf32b390145d
	.xword	0xc668562ce680007a
	.xword	0x33c3fdd3d19f59f7
	.xword	0xc72da3551e97e0c9
	.xword	0xa170c055d84531ca
	.xword	0x3d42788c21efcb40
	.xword	0xf7fe4892c3c98013
	.xword	0x2f5c6c8ea469487e
	.xword	0x75f2f5ff06f79633
	.xword	0x8f303ac6de3ea8d0
	.xword	0x90f9609386f301a8
	.xword	0x34c3f863be8c9392
	.xword	0x3a69464a1653e121
	.xword	0x29c2a32839c6beb7
	.xword	0xd1690200499b0d80
	.xword	0x16e0468ba1dd9b17
	.xword	0xf7ec7063a81861c0
	.xword	0xe9ee28dd218c19e2
	.xword	0x946c243feba892ad
	.xword	0xdc86ff38348915be
	.xword	0x02a33fb7e248126a
	.xword	0xf83274292797d1a5
	.xword	0xaab5a83ba237923a
	.xword	0x35446d7674d10cf4
	.xword	0x05f3545e502dc0be
	.xword	0xa28addeee50bde84
	.xword	0x3d8f1c4f1b3d6271
	.xword	0x96bbbd9e325042d8
	.xword	0xa20ba18c03693938
	.xword	0x0f6e1252434f012d
	.xword	0xa1aa817ba1a8ea04
	.xword	0x1fd97c21e497f788
	.xword	0x82a3b3d9bb3c41c2
	.xword	0x7357c33aa8d12698
	.xword	0x30552ba1576bfd59
	.xword	0xc0f0fd04ba48827f

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

