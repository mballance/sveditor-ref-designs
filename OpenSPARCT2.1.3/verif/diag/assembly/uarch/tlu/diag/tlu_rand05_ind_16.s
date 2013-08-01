/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_16.s
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
    nop; \
    retry;

!!!!! Queue interrupt handler
# 35 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 135 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 138 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 183 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 186 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
	mov 0x32, %r14
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
	mov 0x34, %r14
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
	mov 0xb0, %r14
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
	mov 0xb3, %r14
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

	.word 0x8d903611  ! 1: WRPR_PSTATE_I	wrpr	%r0, 0x1611, %pstate
mondo_0_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d900007  ! 2: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0xd0bfc027  ! 3: STDA_R	stda	%r8, [%r31 + %r7] 0x01
	.word 0x87802089  ! 4: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7686001  ! 5: SDIVX_I	sdivx	%r1, 0x0001, %r19
intveclr_0_2:
	set 0x5bb56123, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_3:
	setx 0x1fe9d648c93edc6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_4:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe930e001  ! 1: STQF_I	-	%f20, [0x0001, %r3]
	normalw
	.word 0xa7458000  ! 8: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe68fe000  ! 9: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r19
	set 0x8d14426e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_5:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_6)) -> intp(0,1,3)
xir_0_6:
	.word 0xa9852001  ! 11: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xe60fc000  ! 12: LDUB_R	ldub	[%r31 + %r0], %r19
	.word 0x9194e001  ! 13: WRPR_PIL_I	wrpr	%r19, 0x0001, %pil
splash_cmpr_0_7:
	setx 0x511651fa94f63892, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 14: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_8:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f12, %f10, %f14
	.word 0xa7b1c309  ! 15: ALIGNADDRESS	alignaddr	%r7, %r9, %r19
	.word 0xe737e001  ! 16: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xe797e001  ! 17: LDQFA_I	-	[%r31, 0x0001], %f19
	set 0x2621f486, %r28
	stxa %r28, [%g0] 0x73
intvec_0_9:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b464000  ! 19: RD_STICK_CMPR_REG	rd	%-, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 21: SIR	sir	0x0001
mondo_0_10:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 22: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
mondo_0_11:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d93400a  ! 23: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
tagged_0_12:
	tsubcctv %r16, 0x132e, %r19
	.word 0xda07e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda8fe000  ! 25: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0xa7832001  ! 26: WR_GRAPHICS_STATUS_REG_I	wr	%r12, 0x0001, %-
	.word 0xda97e010  ! 27: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x38800001  ! 28: BGU	bgu,a	<label_0x1>
	.word 0xda1fe001  ! 29: LDD_I	ldd	[%r31 + 0x0001], %r13
debug_0_13:
	nop
	setx debug_0_13 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 30: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902148  ! 31: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
splash_lsu_0_14:
	setx 0xdc4966423c6374ef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 32: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_15)) -> intp(0,1,3)
xir_0_15:
	.word 0xa9836001  ! 33: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x8ba00550  ! 34: FSQRTd	fsqrt	
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_16)) -> intp(0,0,2)
intvec_0_16:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_17:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 36: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
mondo_0_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d900000  ! 37: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
splash_cmpr_0_19:
	setx 0x306f2c6db6604b54, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_20:
	setx 0x3403a917b51c9dab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 39: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_21:
	setx 0xea6d582f61ec2281, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 40: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_22)) -> intp(0,0,13)
intvec_0_22:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xca47e001  ! 42: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0x8d90203d  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x003d, %pstate
	set 0x795d089f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_23:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xcad7e000  ! 45: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	.word 0xca97e030  ! 46: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r5
tagged_0_24:
	tsubcctv %r7, 0x1d89, %r18
	.word 0xca07e001  ! 47: LDUW_I	lduw	[%r31 + 0x0001], %r5
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 48: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_25:
	set 0x8358e371, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 50: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_0_26:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 51: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_27:
	setx 0xa560acb24f366bfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 52: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 53: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xcad804a0  ! 54: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
debug_0_28:
	nop
	setx debug_0_28 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 55: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_29:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 56: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9033e0  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x13e0, %pstate
DS_0_30:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b10304  ! 58: ALIGNADDRESS	alignaddr	%r4, %r4, %r8
splash_lsu_0_31:
	setx 0x7407a498156283d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 60: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_32:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 61: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_33:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 62: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
debug_0_34:
	nop
	setx debug_0_34 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 63: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_35:
	taddcctv %r19, 0x18ea, %r21
	.word 0xd007e001  ! 64: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x9191a001  ! 65: WRPR_PIL_I	wrpr	%r6, 0x0001, %pil
splash_lsu_0_36:
	setx 0x9e298a837f6cba59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 66: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a800001  ! 67: BCS	bcs,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa8d4c003  ! 69: UMULcc_R	umulcc 	%r19, %r3, %r20
splash_lsu_0_37:
	setx 0x6e89ad4d2f935af3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_38)) -> intp(0,0,17)
intvec_0_38:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 72: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_0_39:
	setx 0xaa565ee745dd4d35, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_40)) -> intp(0,0,30)
intvec_0_40:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab844006  ! 75: WR_CLEAR_SOFTINT_R	wr	%r17, %r6, %clear_softint
debug_0_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 77: LDX_R	ldx	[%r31 + %r0], %r20
	ta	T_CHANGE_PRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 79: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe85fe001  ! 80: LDX_I	ldx	[%r31 + 0x0001], %r20
mondo_0_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d920012  ! 81: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
mondo_0_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c011  ! 82: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
tagged_0_44:
	tsubcctv %r5, 0x1b77, %r11
	.word 0xe807e001  ! 83: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe8dfe000  ! 84: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	set 0x917f5ee3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_45:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe84fe001  ! 86: LDSB_I	ldsb	[%r31 + 0x0001], %r20
mondo_0_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d92000b  ! 87: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xe88008a0  ! 88: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_0_47:
	setx 0x000a2242d4f638e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 89: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802063  ! 90: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe897e010  ! 91: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0x91922001  ! 92: WRPR_PIL_I	wrpr	%r8, 0x0001, %pil
	.word 0x3e700001  ! 93: BPVC	<illegal instruction>
	.word 0xe89fc020  ! 94: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
debug_0_48:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 95: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
DS_0_49:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f22, %f10
	.word 0x83b1030b  ! 96: ALIGNADDRESS	alignaddr	%r4, %r11, %r1
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b6001  ! 97: SDIVX_I	sdivx	%r13, 0x0001, %r9
	.word 0x82c36001  ! 98: ADDCcc_I	addccc 	%r13, 0x0001, %r1
splash_cmpr_0_51:
	setx 0x27f7aa327a5ca1f9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 99: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_52:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 100: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
splash_cmpr_0_53:
	setx 0x6fd558422986394e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b500000  ! 102: RDPR_TPC	<illegal instruction>
	.word 0x8d9029eb  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x09eb, %pstate
tagged_0_54:
	tsubcctv %r1, 0x16df, %r25
	.word 0xda07e001  ! 104: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x879023fc  ! 105: WRPR_TT_I	wrpr	%r0, 0x03fc, %tt
mondo_0_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c00a  ! 106: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xda4fc000  ! 107: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x8d802000  ! 108: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_0_56:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 109: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xdb1fc000  ! 110: LDDF_R	ldd	[%r31, %r0], %f13
	.word 0xda1fe001  ! 111: LDD_I	ldd	[%r31 + 0x0001], %r13
intveclr_0_57:
	set 0x513c0592, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda47e001  ! 113: LDSW_I	ldsw	[%r31 + 0x0001], %r13
DS_0_58:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 114: RESTORE_R	restore	%r31, %r0, %r31
mondo_0_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 115: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
mondo_0_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 116: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x87802080  ! 117: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982307  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0x879020d9  ! 119: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
DS_0_61:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3346001  ! 1: STQF_I	-	%f17, [0x0001, %r17]
	normalw
	.word 0x97458000  ! 120: RD_SOFTINT_REG	rd	%softint, %r11
mondo_0_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d914006  ! 121: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	set 0x38d1f2ad, %r28
	stxa %r28, [%g0] 0x73
intvec_0_63:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_64:
	nop
	setx debug_0_64 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 123: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa553c000  ! 125: RDPR_FQ	<illegal instruction>
	.word 0xe48008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93902004  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa5450000  ! 128: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0x3c700001  ! 129: BPPOS	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
mondo_0_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d918010  ! 131: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	ta	T_CHANGE_PRIV	! macro
DS_0_66:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x8f77f359	! Random illegal ?
	.word 0xd511400c  ! 1: LDQF_R	-	[%r5, %r12], %f10
	.word 0x97a24826  ! 133: FADDs	fadds	%f9, %f6, %f11
	set 0xa816cd06, %r28
	stxa %r28, [%g0] 0x73
intvec_0_67:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d94c004  ! 135: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0xa9844008  ! 136: WR_SET_SOFTINT_R	wr	%r17, %r8, %set_softint
	.word 0x93902007  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_0_69:
	setx 0x39f0515f0995c39b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_70:
	tsubcctv %r20, 0x117e, %r10
	.word 0xd607e001  ! 139: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd727e001  ! 140: STF_I	st	%f11, [0x0001, %r31]
tagged_0_71:
	taddcctv %r23, 0x18a1, %r15
	.word 0xd607e001  ! 141: LDUW_I	lduw	[%r31 + 0x0001], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_72)) -> intp(0,0,12)
intvec_0_72:
	.word 0x39400001  ! 142: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6d004a0  ! 143: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
debug_0_73:
	nop
	setx debug_0_73 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 144: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1500000  ! 145: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xe047c000  ! 146: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0x93d02034  ! 147: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x20700001  ! 148: BPN	<illegal instruction>
splash_lsu_0_74:
	setx 0x6aab414d60040fd5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d50c000  ! 150: RDPR_TT	rdpr	%tt, %r6
	.word 0x8d802004  ! 151: WRFPRS_I	wr	%r0, 0x0004, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_75)) -> intp(0,1,3)
xir_0_75:
	.word 0xa9826001  ! 152: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 153: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90317a  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x117a, %pstate
splash_cmpr_0_76:
	setx 0xdc41e7b70c182fdc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 155: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 156: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
intveclr_0_78:
	set 0x29019b85, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 157: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_79:
	nop
	setx debug_0_79 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 158: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 159: LDX_R	ldx	[%r31 + %r0], %r6
splash_cmpr_0_80:
	setx 0x3f5bc26681ac6b85, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 160: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc3fc009  ! 161: STD_R	std	%r6, [%r31 + %r9]
	.word 0x8d802004  ! 162: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_0_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1350004  ! 1: STQF_R	-	%f8, [%r4, %r20]
	normalw
	.word 0x8b458000  ! 163: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x91d02035  ! 164: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d9037ab  ! 165: WRPR_PSTATE_I	wrpr	%r0, 0x17ab, %pstate
	.word 0xa781a001  ! 166: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x0001, %-
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_82:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90800d  ! 168: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	set 0xbca72216, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_84)) -> intp(0,0,0)
intvec_0_84:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x5e0faa9a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_85:
	.word 0x39400001  ! 171: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_86:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 172: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 173: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01966  ! 174: FqTOd	dis not found

intveclr_0_88:
	set 0xa81e2997, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 175: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 176: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0xa190200a  ! 177: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 178: LDX_R	ldx	[%r31 + %r0], %r20
splash_htba_0_90:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 179: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_91:
	nop
	setx debug_0_91 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 180: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_92)) -> intp(0,1,3)
xir_0_92:
	.word 0xa980e001  ! 181: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x87802014  ! 182: WRASI_I	wr	%r0, 0x0014, %asi
debug_0_93:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 183: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
intveclr_0_94:
	set 0xb91b4c46, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 185: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902040  ! 186: WRPR_TT_I	wrpr	%r0, 0x0040, %tt
tagged_0_95:
	taddcctv %r26, 0x19ad, %r17
	.word 0xe807e001  ! 187: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xad852001  ! 188: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	.word 0xa190200e  ! 189: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe8c804a0  ! 190: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
DS_0_96:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xbd76d1cb	! Random illegal ?
	.word 0x81a00554  ! 1: FSQRTd	fsqrt	
	.word 0x8da4c833  ! 191: FADDs	fadds	%f19, %f19, %f6
	.word 0xcc97e000  ! 192: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0xa9848001  ! 193: WR_SET_SOFTINT_R	wr	%r18, %r1, %set_softint
	.word 0x8d90295f  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x095f, %pstate
	.word 0x87802063  ! 195: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa8694009  ! 196: UDIVX_R	udivx 	%r5, %r9, %r20
	.word 0xe84fe001  ! 197: LDSB_I	ldsb	[%r31 + 0x0001], %r20
	.word 0x8d902426  ! 198: WRPR_PSTATE_I	wrpr	%r0, 0x0426, %pstate
	.word 0x8d802000  ! 199: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_97:
	taddcctv %r16, 0x197a, %r9
	.word 0xe807e001  ! 200: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d902090  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0090, %pstate
	.word 0x8198210c  ! 202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
	.word 0x87902317  ! 203: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
splash_cmpr_0_98:
	setx 0x3865c860bc91e6fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 204: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2e700001  ! 205: BPVS	<illegal instruction>
	.word 0xa1902002  ! 206: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe8800c00  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
mondo_0_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d914007  ! 208: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
mondo_0_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d940007  ! 209: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0x24700001  ! 210: BPLE	<illegal instruction>
debug_0_101:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 211: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_102)) -> intp(0,0,16)
intvec_0_102:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_103:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f18, %f10
	.word 0x99b44301  ! 213: ALIGNADDRESS	alignaddr	%r17, %r1, %r12
	.word 0xd80fe001  ! 214: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0xa1902004  ! 215: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_0_104:
	setx 0x59b3d8e3d057270f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_105:
	setx 0x797d63fcd0858c67, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 217: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_106:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f2, %f2, %f14
	.word 0x8db2c312  ! 218: ALIGNADDRESS	alignaddr	%r11, %r18, %r6
splash_lsu_0_107:
	setx 0x6fdefb8e1b8b6a4b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 219: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 220: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_108)) -> intp(0,0,9)
intvec_0_108:
	.word 0x39400001  ! 221: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4c00e80  ! 222: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
splash_htba_0_109:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 223: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd4c7e010  ! 224: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	.word 0xd497e020  ! 225: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
DS_0_110:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 226: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x83d02032  ! 227: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd407c000  ! 228: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0xd4900e40  ! 229: LDUHA_R	lduha	[%r0, %r0] 0x72, %r10
	set 0x71972b52, %r28
	stxa %r28, [%g0] 0x73
intvec_0_111:
	.word 0x39400001  ! 230: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 231: LDX_R	ldx	[%r31 + %r0], %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 232: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d004a0  ! 233: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_112)) -> intp(0,0,25)
intvec_0_112:
	.word 0x39400001  ! 234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_113:
	setx 0xeb485381a4db265f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 235: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_114:
	setx 0x76999d78561d00a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 236: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x99902005  ! 238: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	set 0xcee49ff4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_115:
	.word 0x39400001  ! 239: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_116:
	setx 0x40573b6ea070a23f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 240: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_117:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 241: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
mondo_0_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 242: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
splash_lsu_0_119:
	setx 0xf31be8f465f738ef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd457c000  ! 244: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x93464000  ! 245: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x9345c000  ! 246: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x93902006  ! 247: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_0_120:
	tsubcctv %r9, 0x1f98, %r16
	.word 0xd207e001  ! 248: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2c804a0  ! 249: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x879020da  ! 250: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
	.word 0xa5464000  ! 251: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x87802063  ! 252: WRASI_I	wr	%r0, 0x0063, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 253: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 254: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d91c012  ! 256: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0x93902000  ! 257: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe45fe001  ! 258: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0x91d020b4  ! 259: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87802004  ! 260: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902074  ! 261: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
mondo_0_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 262: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe44fc000  ! 263: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xa1902009  ! 264: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902374  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0374, %pstate
	.word 0x87802058  ! 266: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_0_124:
	setx 0x1d5381dda8a31559, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 268: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200b  ! 270: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02035  ! 271: Tcc_I	ta	icc_or_xcc, %r0 + 53
	set 0xb5a517cd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_125:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_126:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 273: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_127:
	nop
	setx debug_0_127 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 274: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_tba_0_128:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 275: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_129:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 276: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xa1902009  ! 277: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x83d020b3  ! 278: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa5454000  ! 279: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x8790214e  ! 280: WRPR_TT_I	wrpr	%r0, 0x014e, %tt
	.word 0xe497e020  ! 281: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe537c010  ! 282: STQF_R	-	%f18, [%r16, %r31]
debug_0_130:
	nop
	setx debug_0_130 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 283: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_131:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7332001  ! 1: STQF_I	-	%f19, [0x0001, %r12]
	normalw
	.word 0xa7458000  ! 284: RD_SOFTINT_REG	rd	%softint, %r19
splash_cmpr_0_132:
	setx 0x5544d3fe9e1ee946, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 285: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_133:
	setx 0x0511f31fdfd008a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 286: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_134:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 287: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 288: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 289: WRASI_I	wr	%r0, 0x0080, %asi
mondo_0_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d910009  ! 290: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
intveclr_0_136:
	set 0xa39c3970, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 292: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 293: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90400d  ! 294: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0xa3540000  ! 295: RDPR_GL	rdpr	%-, %r17
splash_lsu_0_138:
	setx 0x5d5e2a5b0d2fa4c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_139:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 297: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
splash_cmpr_0_140:
	setx 0x0ecc1a9396c693f3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_141:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 299: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xe327c011  ! 300: STF_R	st	%f17, [%r17, %r31]
splash_lsu_0_142:
	setx 0x2579730deaaf07cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 301: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_143:
	taddcctv %r16, 0x1254, %r2
	.word 0xe207e001  ! 302: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe20fc000  ! 303: LDUB_R	ldub	[%r31 + %r0], %r17
splash_lsu_0_144:
	setx 0xd44746afc4095f9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 304: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 305: WRPR_GL_I	wrpr	%r0, 0x000b, %-
mondo_0_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d94c00a  ! 306: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xa190200c  ! 307: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe29004a0  ! 308: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x93464000  ! 309: RD_STICK_CMPR_REG	rd	%-, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 310: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_146)) -> intp(0,0,24)
intvec_0_146:
	.word 0x39400001  ! 311: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_147:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 312: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xa1902000  ! 313: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_0_148:
	setx 0xce54d3ebdeee43c6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_0_149:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 315: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_0_150:
	setx 0x1c4ea9627160e098, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902155  ! 317: WRPR_TT_I	wrpr	%r0, 0x0155, %tt
	.word 0xd28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_cmpr_0_151:
	setx 0x9c29ae874e7a8839, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 319: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 320: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_0_152:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d94c006  ! 321: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
mondo_0_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 322: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x87902047  ! 323: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_154)) -> intp(0,0,6)
intvec_0_154:
	.word 0x39400001  ! 324: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903803  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x1803, %pstate
splash_tba_0_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_156)) -> intp(0,1,3)
xir_0_156:
	.word 0xa9852001  ! 327: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa1902000  ! 328: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_0_157:
	nop
	setx debug_0_157 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_158:
	setx 0xf4b4260478b51469, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 330: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28fe010  ! 331: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	set 0xf73804ef, %r28
	stxa %r28, [%g0] 0x73
intvec_0_159:
	.word 0x39400001  ! 332: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 333: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9848002  ! 334: WR_SET_SOFTINT_R	wr	%r18, %r2, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_161)) -> intp(0,1,3)
xir_0_161:
	.word 0xa981e001  ! 335: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0x99450000  ! 336: RD_SET_SOFTINT	rd	%set_softint, %r12
debug_0_162:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 337: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802055  ! 338: WRASI_I	wr	%r0, 0x0055, %asi
DS_0_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a00541  ! 1: FSQRTd	fsqrt	
	.word 0x8fa44831  ! 339: FADDs	fadds	%f17, %f17, %f7
DS_0_164:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc9342001  ! 1: STQF_I	-	%f4, [0x0001, %r16]
	normalw
	.word 0x97458000  ! 340: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x91d02033  ! 341: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1454000  ! 342: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
tagged_0_165:
	taddcctv %r6, 0x1ee6, %r22
	.word 0xe007e001  ! 343: LDUW_I	lduw	[%r31 + 0x0001], %r16
intveclr_0_166:
	set 0x944e8860, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 345: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
splash_cmpr_0_168:
	setx 0x8323035b680e685a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 346: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0dfe030  ! 347: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
intveclr_0_169:
	set 0xdc457fba, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 348: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_170:
	setx 0xb1b7368d4afd85a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 349: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7540000  ! 350: RDPR_GL	rdpr	%-, %r19
mondo_0_171:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d910007  ! 351: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
	.word 0x9553c000  ! 352: RDPR_FQ	<illegal instruction>
mondo_0_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 353: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xd527e001  ! 354: STF_I	st	%f10, [0x0001, %r31]
debug_0_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 355: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903d00  ! 356: WRPR_PSTATE_I	wrpr	%r0, 0x1d00, %pstate
	.word 0x8d902436  ! 357: WRPR_PSTATE_I	wrpr	%r0, 0x0436, %pstate
	.word 0xd537e001  ! 358: STQF_I	-	%f10, [0x0001, %r31]
intveclr_0_174:
	set 0x669d87a1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 359: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 360: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8790215f  ! 361: WRPR_TT_I	wrpr	%r0, 0x015f, %tt
splash_lsu_0_175:
	setx 0xb7f53c19f733903d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 362: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd537c006  ! 363: STQF_R	-	%f10, [%r6, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_176)) -> intp(0,1,3)
xir_0_176:
	.word 0xa981e001  ! 364: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xd48008a0  ! 365: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd40fc000  ! 366: LDUB_R	ldub	[%r31 + %r0], %r10
	set 0x3e5599d6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_177:
	.word 0x39400001  ! 367: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 368: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87902117  ! 369: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
	.word 0xd44fc000  ! 370: LDSB_R	ldsb	[%r31 + %r0], %r10
mondo_0_178:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d92400c  ! 371: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
debug_0_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 372: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_180)) -> intp(0,1,3)
xir_0_180:
	.word 0xa9822001  ! 373: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
splash_lsu_0_181:
	setx 0xf8c1856376bafdf5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02034  ! 375: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_cmpr_0_182:
	setx 0xf28818dca10ca3ee, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 376: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_183:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 377: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x87802014  ! 378: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd48008a0  ! 379: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
change_to_randtl_0_184:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_184:
	.word 0x8f902001  ! 380: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902000  ! 381: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd48fe010  ! 382: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x9194a001  ! 383: WRPR_PIL_I	wrpr	%r18, 0x0001, %pil
	.word 0x81982e0c  ! 384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0x8d902722  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x0722, %pstate
intveclr_0_185:
	set 0x6361b21c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_186)) -> intp(0,0,13)
intvec_0_186:
	.word 0x39400001  ! 387: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_187:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f6, %f30
	.word 0x8fb24313  ! 388: ALIGNADDRESS	alignaddr	%r9, %r19, %r7
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_188)) -> intp(0,0,13)
intvec_0_188:
	.word 0x39400001  ! 389: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 390: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_0_189:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 391: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
mondo_0_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d950006  ! 392: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0x87902318  ! 393: WRPR_TT_I	wrpr	%r0, 0x0318, %tt
	.word 0xce3fe001  ! 394: STD_I	std	%r7, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_191)) -> intp(0,1,3)
xir_0_191:
	.word 0xa9826001  ! 395: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 396: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x81982255  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0255, %hpstate
debug_0_192:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 398: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
intveclr_0_193:
	set 0x40f592cf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 399: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_194:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d948010  ! 400: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
splash_lsu_0_195:
	setx 0x57c357972b6e564b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 401: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 402: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce8008a0  ! 403: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa1902006  ! 404: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_cmpr_0_196:
	setx 0x82027c6b59222c97, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 405: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_197:
	set 0x5fd3aff6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 406: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_198)) -> intp(0,0,15)
intvec_0_198:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 408: WRASI_I	wr	%r0, 0x0016, %asi
DS_0_199:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 409: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xce57c000  ! 410: LDSH_R	ldsh	[%r31 + %r0], %r7
splash_lsu_0_200:
	setx 0x4a9e022dd7f358b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 411: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_201:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 412: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x85464000  ! 413: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x81510000  ! 414: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_0_202:
	setx 0xff071e6e2dee35cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 415: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b57  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0b57, %pstate
	.word 0x81510000  ! 417: RDPR_TICK	rdpr	%tick, %r0
intveclr_0_203:
	set 0x8b940ae2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 418: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab84800a  ! 419: WR_CLEAR_SOFTINT_R	wr	%r18, %r10, %clear_softint
	.word 0x87802088  ! 420: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc48fe000  ! 421: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r2
	.word 0x8790224c  ! 422: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
tagged_0_204:
	tsubcctv %r6, 0x16ad, %r2
	.word 0xc407e001  ! 423: LDUW_I	lduw	[%r31 + 0x0001], %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_205)) -> intp(0,1,3)
xir_0_205:
	.word 0xa9846001  ! 424: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
debug_0_206:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 425: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200d  ! 426: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc4800c40  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r2
	.word 0x8198264d  ! 428: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064d, %hpstate
	.word 0xa545c000  ! 429: RD_TICK_CMPR_REG	rd	%-, %r18
splash_tba_0_207:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_208)) -> intp(0,0,16)
intvec_0_208:
	.word 0x39400001  ! 431: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe47fe001  ! 432: SWAP_I	swap	%r18, [%r31 + 0x0001]
	.word 0x81982c9e  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
splash_lsu_0_209:
	setx 0xe1ab3cb161ef2a4b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 434: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7832001  ! 435: WR_GRAPHICS_STATUS_REG_I	wr	%r12, 0x0001, %-
splash_cmpr_0_210:
	setx 0xc41e50643a41eab7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 436: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_211:
	setx 0x7c0772e437733855, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 437: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_212)) -> intp(0,0,29)
intvec_0_212:
	.word 0x39400001  ! 438: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_213:
	.word 0x8f902003  ! 439: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe4cfe000  ! 440: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
DS_0_214:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 441: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790201e  ! 442: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
mondo_0_215:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d940008  ! 443: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
splash_lsu_0_216:
	setx 0x78ad4db061f65ce1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_217:
	setx 0xbdf9d3ba7138246d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_218:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1348012  ! 1: STQF_R	-	%f8, [%r18, %r18]
	normalw
	.word 0x8d458000  ! 446: RD_SOFTINT_REG	rd	%softint, %r6
debug_0_219:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 447: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
splash_lsu_0_220:
	setx 0x638f16edcad73e41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_221:
	setx 0x42bfc69a04abe358, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022c6  ! 450: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
splash_cmpr_0_222:
	setx 0x081984e37d2504ea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 451: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc0fc000  ! 452: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x93902000  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982e44  ! 454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e44, %hpstate
	set 0xb299955f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_223:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab828014  ! 456: WR_CLEAR_SOFTINT_R	wr	%r10, %r20, %clear_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_224)) -> intp(0,1,3)
xir_0_224:
	.word 0xa9852001  ! 457: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
DS_0_225:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe934a001  ! 1: STQF_I	-	%f20, [0x0001, %r18]
	normalw
	.word 0x87458000  ! 458: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x87902376  ! 459: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 460: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 461: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91902001  ! 462: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
debug_0_226:
	nop
	setx debug_0_226 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 463: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 464: SIR	sir	0x0001
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_227)) -> intp(0,1,3)
xir_0_227:
	.word 0xa984a001  ! 465: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x91d02034  ! 466: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_0_228:
	set 0x4ad4c096, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 467: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x9a9a0a05, %r28
	stxa %r28, [%g0] 0x73
intvec_0_229:
	.word 0x39400001  ! 468: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab81c007  ! 469: WR_CLEAR_SOFTINT_R	wr	%r7, %r7, %clear_softint
DS_0_230:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd32c006  ! 1: STQF_R	-	%f6, [%r6, %r11]
	normalw
	.word 0x81458000  ! 470: RD_SOFTINT_REG	stbar
	.word 0x93902002  ! 471: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_0_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d934012  ! 472: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
debug_0_232:
	nop
	setx debug_0_232 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 473: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 474: SIR	sir	0x0001
	set 0xc0df861, %r28
	stxa %r28, [%g0] 0x73
intvec_0_233:
	.word 0x39400001  ! 475: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc0cfe010  ! 476: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 478: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_234:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d950008  ! 479: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
DS_0_235:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 480: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_236)) -> intp(0,0,6)
intvec_0_236:
	.word 0x39400001  ! 481: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_237:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 482: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_238)) -> intp(0,0,21)
intvec_0_238:
	.word 0x39400001  ! 483: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 484: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	set 0x1586bfed, %r28
	stxa %r28, [%g0] 0x73
intvec_0_239:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_240)) -> intp(0,0,3)
intvec_0_240:
	.word 0x39400001  ! 486: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_241:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x99a0c825  ! 487: FADDs	fadds	%f3, %f5, %f12
mondo_0_242:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 488: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
intveclr_0_243:
	set 0x3833f74d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 489: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_244:
	nop
	setx debug_0_244 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_245:
	taddcctv %r17, 0x11b3, %r24
	.word 0xd807e001  ! 491: LDUW_I	lduw	[%r31 + 0x0001], %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_246)) -> intp(0,1,3)
xir_0_246:
	.word 0xa9836001  ! 492: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x8145c000  ! 493: RD_TICK_CMPR_REG	stbar
mondo_0_247:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950004  ! 494: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xc01fc000  ! 495: LDD_R	ldd	[%r31 + %r0], %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_248)) -> intp(0,1,3)
xir_0_248:
	.word 0xa9842001  ! 496: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	set 0x8199417d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_249:
	.word 0x39400001  ! 497: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_250:
	setx 0xa00efd4080b1868c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 498: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc127c004  ! 499: STF_R	st	%f0, [%r4, %r31]
change_to_randtl_0_251:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_251:
	.word 0x8f902003  ! 500: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1454000  ! 501: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_252)) -> intp(0,1,3)
xir_0_252:
	.word 0xa9836001  ! 502: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xab820012  ! 503: WR_CLEAR_SOFTINT_R	wr	%r8, %r18, %clear_softint
intveclr_0_253:
	set 0xab2e67f1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 504: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe05fe001  ! 505: LDX_I	ldx	[%r31 + 0x0001], %r16
splash_cmpr_0_254:
	setx 0x8b40c3545b103c80, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 506: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_255:
	set 0x758f5899, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 507: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0d004a0  ! 508: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_256)) -> intp(0,0,0)
intvec_0_256:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 511: WRASI_I	wr	%r0, 0x0004, %asi
	set 0xce467d14, %r28
	stxa %r28, [%g0] 0x73
intvec_0_257:
	.word 0x39400001  ! 512: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9464000  ! 513: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8d9035ae  ! 514: WRPR_PSTATE_I	wrpr	%r0, 0x15ae, %pstate
	.word 0xe8d804a0  ! 515: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
	.word 0xe8cfe010  ! 516: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
	.word 0xe8c7e000  ! 517: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe8880e40  ! 518: LDUBA_R	lduba	[%r0, %r0] 0x72, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 519: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe8c00e80  ! 520: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r20
splash_lsu_0_258:
	setx 0x6063e2c7eaec0ff7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 521: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 522: RD_STICK_REG	stbar
DS_0_259:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb108011  ! 1: LDQF_R	-	[%r2, %r17], %f13
	.word 0xa3a18833  ! 523: FADDs	fadds	%f6, %f19, %f17
	.word 0x91d02035  ! 524: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02033  ! 525: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_260)) -> intp(0,0,23)
intvec_0_260:
	.word 0x39400001  ! 526: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_261:
	set 0x18006996, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 527: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 528: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_0_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90c00a  ! 529: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
splash_cmpr_0_263:
	setx 0xd2686f3eb573a430, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 530: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_264)) -> intp(0,1,3)
xir_0_264:
	.word 0xa9836001  ! 531: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
mondo_0_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 532: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x8790234d  ! 533: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 534: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 535: Tcc_I	tne	icc_or_xcc, %r0 + 50
intveclr_0_266:
	set 0x5968154d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_267:
	setx 0xd057334657c3f26e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 537: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa345c000  ! 538: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xe28fe020  ! 539: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
mondo_0_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 540: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 541: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8d903ec1  ! 542: WRPR_PSTATE_I	wrpr	%r0, 0x1ec1, %pstate
	set 0x33ba1f7e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_269:
	.word 0x39400001  ! 543: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028a6  ! 544: WRPR_PSTATE_I	wrpr	%r0, 0x08a6, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_270)) -> intp(0,0,19)
intvec_0_270:
	.word 0x39400001  ! 545: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 546: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9945c000  ! 547: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xa1464000  ! 548: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0x26800001  ! 549: BL	bl,a	<label_0x1>
	.word 0x93d02033  ! 550: Tcc_I	tne	icc_or_xcc, %r0 + 51
	set 0x623f4beb, %r28
	stxa %r28, [%g0] 0x73
intvec_0_271:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_272:
	setx 0x992affe0e7f7c08f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 552: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xb135efb5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_273:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_274:
	setx 0x74fae15a048bb483, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 554: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 555: FqTOd	dis not found

tagged_0_276:
	tsubcctv %r12, 0x15d3, %r8
	.word 0xe407e001  ! 556: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x8d90371e  ! 557: WRPR_PSTATE_I	wrpr	%r0, 0x171e, %pstate
debug_0_277:
	nop
	setx debug_0_277 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 558: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 559: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_0_278:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f18, %f20, %f30
	.word 0xa7b30311  ! 560: ALIGNADDRESS	alignaddr	%r12, %r17, %r19
DS_0_279:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x87b50314  ! 561: ALIGNADDRESS	alignaddr	%r20, %r20, %r3
	.word 0x8790235f  ! 562: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
splash_cmpr_0_280:
	setx 0xce580b1fbd2ca0fd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 563: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc697e030  ! 564: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0xc727e001  ! 565: STF_I	st	%f3, [0x0001, %r31]
	.word 0xc727c014  ! 566: STF_R	st	%f3, [%r20, %r31]
DS_0_281:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f6, %f26
	.word 0x8fb20308  ! 567: ALIGNADDRESS	alignaddr	%r8, %r8, %r7
debug_0_282:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 568: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x99450000  ! 569: RD_SET_SOFTINT	rd	%set_softint, %r12
splash_cmpr_0_283:
	setx 0x2de514e71211e704, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd93fe001  ! 571: STDF_I	std	%f12, [0x0001, %r31]
	.word 0xd89004a0  ! 572: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_284)) -> intp(0,0,19)
intvec_0_284:
	.word 0x39400001  ! 573: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_285:
	setx 0xc60a4a0bcea99787, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 574: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_286:
	set 0x45cc42d4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 575: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x85540000  ! 576: RDPR_GL	rdpr	%-, %r2
	.word 0xa190200e  ! 577: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 578: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc447e001  ! 579: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc517c000  ! 580: LDQF_R	-	[%r31, %r0], %f2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_287)) -> intp(0,1,3)
xir_0_287:
	.word 0xa981a001  ! 581: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_288)) -> intp(0,1,3)
xir_0_288:
	.word 0xa984a001  ! 582: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xc45fe001  ! 583: LDX_I	ldx	[%r31 + 0x0001], %r2
mondo_0_289:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d944012  ! 584: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 585: LDX_R	ldx	[%r31 + %r0], %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 586: LDX_R	ldx	[%r31 + %r0], %r2
debug_0_290:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 587: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc517c000  ! 588: LDQF_R	-	[%r31, %r0], %f2
	.word 0x816a0001  ! 589: SDIVX_R	sdivx	%r8, %r1, %r0
	.word 0xa3464000  ! 590: RD_STICK_CMPR_REG	rd	%-, %r17
	set 0xd50976f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_291:
	.word 0x39400001  ! 591: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_292)) -> intp(0,1,3)
xir_0_292:
	.word 0xa984e001  ! 592: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
splash_cmpr_0_293:
	setx 0x1a2bca48e6a5461e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 593: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe29fe001  ! 594: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
tagged_0_294:
	tsubcctv %r16, 0x13ed, %r21
	.word 0xe207e001  ! 595: LDUW_I	lduw	[%r31 + 0x0001], %r17
intveclr_0_295:
	set 0xd7b7a3dd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 596: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe397e001  ! 597: LDQFA_I	-	[%r31, 0x0001], %f17
	.word 0xe2dfe010  ! 598: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 599: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_296:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 600: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_297:
	setx 0xd79ea1aeec9a4275, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 601: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xd34fda09	! Random illegal ?
	.word 0xcf120001  ! 1: LDQF_R	-	[%r8, %r1], %f7
	.word 0x85a50821  ! 602: FADDs	fadds	%f20, %f1, %f2
splash_tba_0_299:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 604: LDX_R	ldx	[%r31 + %r0], %r2
splash_cmpr_0_300:
	setx 0xb04a932beeaeacb9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 605: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 606: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	set 0x3ef44d11, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 607: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(0,0,13)
intvec_0_302:
	.word 0x39400001  ! 608: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_303:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 609: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x93902001  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
mondo_0_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c009  ! 611: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
tagged_0_305:
	taddcctv %r22, 0x1617, %r16
	.word 0xc407e001  ! 612: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_0_306:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 613: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc457e001  ! 614: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc45fe001  ! 615: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x8d90351d  ! 616: WRPR_PSTATE_I	wrpr	%r0, 0x151d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 617: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x81b01021  ! 618: SIAM	siam	1
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 619: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x20efd8bf, %r28
	stxa %r28, [%g0] 0x73
intvec_0_307:
	.word 0x39400001  ! 620: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 621: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 622: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_309:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 623: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
debug_0_310:
	nop
	setx debug_0_310 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 624: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9028a5  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x08a5, %pstate
	set 0xbbb2cf56, %r28
	stxa %r28, [%g0] 0x73
intvec_0_311:
	.word 0x39400001  ! 626: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 627: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_0_312:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879021e6  ! 629: WRPR_TT_I	wrpr	%r0, 0x01e6, %tt
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 630: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_313:
	setx 0x3b84001fd4ef9439, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 631: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 632: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xc537e001  ! 633: STQF_I	-	%f2, [0x0001, %r31]
	.word 0xc4c80e40  ! 634: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_314)) -> intp(0,0,2)
intvec_0_314:
	.word 0x39400001  ! 635: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 636: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 637: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x93902006  ! 638: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d910011  ! 639: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x93902002  ! 640: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d02035  ! 641: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d903203  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x1203, %pstate
	.word 0xc527e001  ! 643: STF_I	st	%f2, [0x0001, %r31]
	.word 0xa345c000  ! 644: RD_TICK_CMPR_REG	rd	%-, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_316)) -> intp(0,0,21)
intvec_0_316:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_317:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 646: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_318:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_318:
	.word 0x8f902000  ! 647: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902002  ! 648: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902c00  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0xe237e001  ! 650: STH_I	sth	%r17, [%r31 + 0x0001]
	.word 0xa9b40ff0  ! 651: FONES	e	%f20
DS_0_319:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f10, %f28
	.word 0x8bb18308  ! 652: ALIGNADDRESS	alignaddr	%r6, %r8, %r5
	.word 0x85454000  ! 653: RD_CLEAR_SOFTINT	rd	%clear_softint, %r2
	.word 0x879020c6  ! 654: WRPR_TT_I	wrpr	%r0, 0x00c6, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 655: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4cfe000  ! 656: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_320)) -> intp(0,0,17)
intvec_0_320:
	.word 0x39400001  ! 657: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790206a  ! 658: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0xc4dfe020  ! 659: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	set 0xb8a8c28f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_321:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_322:
	nop
	setx debug_0_322 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 661: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_323:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3148003  ! 1: LDQF_R	-	[%r18, %r3], %f17
	.word 0x93a44822  ! 662: FADDs	fadds	%f17, %f2, %f9
	.word 0x879023bd  ! 663: WRPR_TT_I	wrpr	%r0, 0x03bd, %tt
	.word 0x87902255  ! 664: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
mondo_0_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d90c008  ! 665: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
splash_cmpr_0_325:
	setx 0x433c2d402bcaff4d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 666: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_326:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d930006  ! 667: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
splash_cmpr_0_327:
	setx 0x92cf79b35825a92f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 668: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd29fe001  ! 669: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_328)) -> intp(0,1,3)
xir_0_328:
	.word 0xa981e001  ! 670: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
debug_0_329:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 671: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_330)) -> intp(0,0,18)
intvec_0_330:
	.word 0x39400001  ! 672: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_331:
	taddcctv %r19, 0x14a0, %r22
	.word 0xd207e001  ! 673: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x9190e001  ! 674: WRPR_PIL_I	wrpr	%r3, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_332)) -> intp(0,1,3)
xir_0_332:
	.word 0xa9812001  ! 675: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
splash_tba_0_333:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 676: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 677: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902ac2  ! 678: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
debug_0_334:
	nop
	setx debug_0_334 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 679: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_335:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 680: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02032  ! 681: Tcc_I	tne	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_336)) -> intp(0,0,25)
intvec_0_336:
	.word 0x39400001  ! 682: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_337:
	set 0x8db51e13, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 683: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 684: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb336001  ! 1: STQF_I	-	%f13, [0x0001, %r13]
	normalw
	.word 0x8d458000  ! 685: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc8008a0  ! 686: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_0_339:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 687: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9192e001  ! 688: WRPR_PIL_I	wrpr	%r11, 0x0001, %pil
splash_cmpr_0_340:
	setx 0x52084e340eea39c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 689: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc1fe001  ! 690: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xccc004a0  ! 691: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xcd27c006  ! 692: STF_R	st	%f6, [%r6, %r31]
splash_cmpr_0_341:
	setx 0x9c1eab6a6396bff7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 693: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 694: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_342:
	setx 0xd40f9ab786e3eff6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 695: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc8008a0  ! 696: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x879023e3  ! 697: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0x87802063  ! 698: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d902012  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
DS_0_343:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f28, %f6
	.word 0xa5b00308  ! 700: ALIGNADDRESS	alignaddr	%r0, %r8, %r18
	.word 0x879020fa  ! 701: WRPR_TT_I	wrpr	%r0, 0x00fa, %tt
	.word 0x8f45c000  ! 702: RD_TICK_CMPR_REG	rd	%-, %r7
DS_0_344:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc1312001  ! 1: STQF_I	-	%f0, [0x0001, %r4]
	normalw
	.word 0xa7458000  ! 703: RD_SOFTINT_REG	rd	%softint, %r19
intveclr_0_345:
	set 0x17c06946, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 704: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 705: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x8780201c  ! 706: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_0_346:
	set 0x8eba6b43, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 707: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_347:
	setx 0xf02b5af55aab523d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 708: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_348:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90400c  ! 709: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
splash_cmpr_0_349:
	setx 0x1b94c901f733a941, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 710: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 711: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe69fe001  ! 712: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0xad84e001  ! 713: WR_SOFTINT_REG_I	wr	%r19, 0x0001, %softint
	.word 0xe727c00c  ! 714: STF_R	st	%f19, [%r12, %r31]
	.word 0x9b45c000  ! 715: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xda8008a0  ! 716: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_0_350:
	setx 0x48acaf96ece6c0c2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 717: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xf866ff8d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_351:
	.word 0x39400001  ! 718: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d7e  ! 719: WRPR_PSTATE_I	wrpr	%r0, 0x1d7e, %pstate
	.word 0xa1902004  ! 720: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 721: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad00e40  ! 722: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r13
	.word 0x85a409b0  ! 723: FDIVs	fdivs	%f16, %f16, %f2
	.word 0x87902099  ! 724: WRPR_TT_I	wrpr	%r0, 0x0099, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_352)) -> intp(0,0,25)
intvec_0_352:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 726: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 727: SIR	sir	0x0001
	.word 0xc41fe001  ! 728: LDD_I	ldd	[%r31 + 0x0001], %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_353)) -> intp(0,1,3)
xir_0_353:
	.word 0xa9806001  ! 729: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x8f520000  ! 730: RDPR_PIL	<illegal instruction>
	.word 0x3c700001  ! 731: BPPOS	<illegal instruction>
mondo_0_354:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 732: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xce4fc000  ! 733: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_0_355:
	taddcctv %r18, 0x1e34, %r15
	.word 0xce07e001  ! 734: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce57e001  ! 735: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169e001  ! 736: SDIVX_I	sdivx	%r7, 0x0001, %r8
	.word 0xd09004a0  ! 737: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xab82c011  ! 738: WR_CLEAR_SOFTINT_R	wr	%r11, %r17, %clear_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_357)) -> intp(0,1,3)
xir_0_357:
	.word 0xa9832001  ! 739: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xd197e001  ! 740: LDQFA_I	-	[%r31, 0x0001], %f8
	.word 0x84d4800b  ! 741: UMULcc_R	umulcc 	%r18, %r11, %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_358)) -> intp(0,1,3)
xir_0_358:
	.word 0xa984e001  ! 742: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790236c  ! 744: WRPR_TT_I	wrpr	%r0, 0x036c, %tt
mondo_0_359:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 745: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_0_360:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 746: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
DS_0_361:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f24, %f26
	.word 0xa7b2c302  ! 747: ALIGNADDRESS	alignaddr	%r11, %r2, %r19
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 748: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 749: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_362)) -> intp(0,0,24)
intvec_0_362:
	.word 0x39400001  ! 750: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 751: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_363:
	setx 0x7ac4c8294b19b409, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 752: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902006  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d94c013  ! 754: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
DS_0_365:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 755: SAVE_R	save	%r31, %r0, %r31
	.word 0x86a9c014  ! 756: ANDNcc_R	andncc 	%r7, %r20, %r3
	.word 0x81982017  ! 757: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0017, %hpstate
	.word 0x8d902568  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x0568, %pstate
	.word 0x8d903e44  ! 759: WRPR_PSTATE_I	wrpr	%r0, 0x1e44, %pstate
intveclr_0_366:
	set 0x59e6e9ed, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 760: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 761: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc6c80e40  ! 762: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
	set 0xd49685ac, %r28
	stxa %r28, [%g0] 0x73
intvec_0_367:
	.word 0x39400001  ! 763: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_368:
	tsubcctv %r12, 0x1b70, %r20
	.word 0xc607e001  ! 764: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc6800c60  ! 765: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r3
	.word 0xc6cfe010  ! 766: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0x8d90304b  ! 767: WRPR_PSTATE_I	wrpr	%r0, 0x104b, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r3
DS_0_369:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe533400c  ! 1: STQF_R	-	%f18, [%r12, %r13]
	normalw
	.word 0x91458000  ! 769: RD_SOFTINT_REG	rd	%softint, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_370)) -> intp(0,0,13)
intvec_0_370:
	.word 0x39400001  ! 770: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x2fed2bad, %r28
	stxa %r28, [%g0] 0x73
intvec_0_371:
	.word 0x39400001  ! 771: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_372:
	setx 0xa0fd72e600dbfcb1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 772: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_373:
	nop
	setx debug_0_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 773: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_374:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 774: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd09fc020  ! 775: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_cmpr_0_375:
	setx 0xc80a59888bf5eaf2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 776: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0c80e60  ! 777: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0xd08008a0  ! 778: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	ta	T_CHANGE_HPRIV	! macro
mondo_0_376:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92c000  ! 780: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	.word 0xd08008a0  ! 781: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0bfc020  ! 782: STDA_R	stda	%r8, [%r31 + %r0] 0x01
	.word 0xa1454000  ! 783: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe07fe001  ! 784: SWAP_I	swap	%r16, [%r31 + 0x0001]
	.word 0x8d902dd4  ! 785: WRPR_PSTATE_I	wrpr	%r0, 0x0dd4, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 786: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 787: RD_STICK_REG	stbar
	.word 0xe07fe001  ! 788: SWAP_I	swap	%r16, [%r31 + 0x0001]
	.word 0xe0800b60  ! 789: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r16
debug_0_377:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 790: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_378:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 791: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8780201c  ! 792: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_0_379:
	setx 0x1106aaf77f13d23f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 793: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802080  ! 794: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_380:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 795: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x20fcb28, %r28
	stxa %r28, [%g0] 0x73
intvec_0_381:
	.word 0x39400001  ! 796: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 797: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe047e001  ! 798: LDSW_I	ldsw	[%r31 + 0x0001], %r16
	.word 0xe04fe001  ! 799: LDSB_I	ldsb	[%r31 + 0x0001], %r16
	.word 0xe007c000  ! 800: LDUW_R	lduw	[%r31 + %r0], %r16
debug_0_382:
	nop
	setx debug_0_382 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 801: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe09fc020  ! 802: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
debug_0_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 803: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe01fe001  ! 804: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0xa5520000  ! 805: RDPR_PIL	rdpr	%pil, %r18
	.word 0xe41fc000  ! 806: LDD_R	ldd	[%r31 + %r0], %r18
mondo_0_384:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d930006  ! 807: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0x91d020b4  ! 808: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe48008a0  ! 809: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_cmpr_0_385:
	setx 0xa6e9d2b7a3b41951, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 810: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_386:
	setx 0xd3185f62001cfa66, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 811: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe447e001  ! 812: LDSW_I	ldsw	[%r31 + 0x0001], %r18
change_to_randtl_0_387:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_387:
	.word 0x8f902004  ! 813: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
mondo_0_388:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d90c008  ! 814: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
debug_0_389:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 815: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe4800b20  ! 816: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x87902083  ! 817: WRPR_TT_I	wrpr	%r0, 0x0083, %tt
	.word 0x93902003  ! 818: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_0_390:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 819: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8b450000  ! 820: RD_SET_SOFTINT	rd	%set_softint, %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 821: LDX_R	ldx	[%r31 + %r0], %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_391)) -> intp(0,1,3)
xir_0_391:
	.word 0xa984a001  ! 822: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
mondo_0_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d900013  ! 823: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xca37e001  ! 824: STH_I	sth	%r5, [%r31 + 0x0001]
	set 0x6b232841, %r28
	stxa %r28, [%g0] 0x73
intvec_0_393:
	.word 0x39400001  ! 825: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 826: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xca4fe001  ! 827: LDSB_I	ldsb	[%r31 + 0x0001], %r5
DS_0_394:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 828: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_0_395:
	setx 0x0c43322bbfe9fb94, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 829: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_396:
	set 0x81401ea5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 830: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xca8008a0  ! 831: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d9031f6  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x11f6, %pstate
mondo_0_397:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d910008  ! 833: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	ta	T_CHANGE_HPRIV	! macro
debug_0_398:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 835: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902004  ! 836: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_PRIV	! macro
splash_cmpr_0_399:
	setx 0x54a071cad0934122, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 838: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_400:
	setx 0x766f2f0ea8420cf7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 839: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_401:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 840: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81460000  ! 841: RD_STICK_REG	stbar
	.word 0xa1902009  ! 842: WRPR_GL_I	wrpr	%r0, 0x0009, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_402)) -> intp(0,0,22)
intvec_0_402:
	.word 0x39400001  ! 843: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 844: SIR	sir	0x0001
DS_0_403:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 845: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9035f3  ! 846: WRPR_PSTATE_I	wrpr	%r0, 0x15f3, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_404)) -> intp(0,0,10)
intvec_0_404:
	.word 0x39400001  ! 847: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 848: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xca1fc000  ! 849: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xcac804a0  ! 850: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x83a30dc3  ! 851: FdMULq	fdmulq	
DS_0_405:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 852: RESTORE_R	restore	%r31, %r0, %r31
debug_0_406:
	nop
	setx debug_0_406 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 853: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_407:
	set 0xef8ccfbf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 854: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5500000  ! 855: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xe44fc000  ! 856: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x91d02032  ! 857: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_0_408:
	setx 0x6b570ee217b0f818, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 858: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e030  ! 859: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
splash_cmpr_0_409:
	setx 0xf915f3efa0609bda, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 860: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8b45c000  ! 861: RD_TICK_CMPR_REG	rd	%-, %r5
mondo_0_410:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d918009  ! 862: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
	.word 0xcac00e80  ! 863: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 864: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_411:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 865: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d904014  ! 867: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0x8d902103  ! 868: WRPR_PSTATE_I	wrpr	%r0, 0x0103, %pstate
splash_cmpr_0_413:
	setx 0x7c685c9cc6d38cab, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 869: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcb17c000  ! 870: LDQF_R	-	[%r31, %r0], %f5
	.word 0xcad80e80  ! 871: LDXA_R	ldxa	[%r0, %r0] 0x74, %r5
	.word 0x93d020b2  ! 872: Tcc_I	tne	icc_or_xcc, %r0 + 178
mondo_0_414:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91800c  ! 873: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
	.word 0x92f96001  ! 874: SDIVcc_I	sdivcc 	%r5, 0x0001, %r9
	.word 0xa668a001  ! 875: UDIVX_I	udivx 	%r2, 0x0001, %r19
debug_0_415:
	nop
	setx debug_0_415 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 876: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_416:
	setx 0x9d7686fca221ffc7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 877: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_417:
	setx 0xc69d2be519f72287, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 878: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe6d804a0  ! 879: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
splash_htba_0_418:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 880: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe6dfe030  ! 881: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_419)) -> intp(0,1,3)
xir_0_419:
	.word 0xa9822001  ! 882: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_420)) -> intp(0,0,19)
intvec_0_420:
	.word 0x39400001  ! 883: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_421:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc930a001  ! 1: STQF_I	-	%f4, [0x0001, %r2]
	normalw
	.word 0x81458000  ! 884: RD_SOFTINT_REG	stbar
mondo_0_422:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944001  ! 885: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
splash_lsu_0_423:
	setx 0xeda07514a4e1d181, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 886: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902210  ! 887: WRPR_TT_I	wrpr	%r0, 0x0210, %tt
intveclr_0_424:
	set 0x62099d15, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 888: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 889: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93d02035  ! 890: Tcc_I	tne	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_425)) -> intp(0,1,3)
xir_0_425:
	.word 0xa980a001  ! 891: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xc01fe001  ! 892: LDD_I	ldd	[%r31 + 0x0001], %r0
mondo_0_426:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d900014  ! 893: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x87802004  ! 894: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc08fe010  ! 895: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0x8198275f  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075f, %hpstate
	.word 0xc007c000  ! 897: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc0dfe000  ! 898: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	.word 0x87902227  ! 899: WRPR_TT_I	wrpr	%r0, 0x0227, %tt
	.word 0x81510000  ! 900: RDPR_TICK	rdpr	%tick, %r0
mondo_0_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 901: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
mondo_0_428:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d92c00c  ! 902: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	ta	T_CHANGE_PRIV	! macro
	set 0x116dd15e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_429:
	.word 0x39400001  ! 904: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_430:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 905: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90252a  ! 906: WRPR_PSTATE_I	wrpr	%r0, 0x052a, %pstate
splash_cmpr_0_431:
	setx 0x78f296a3c4075816, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 907: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_432:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 908: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8750c000  ! 909: RDPR_TT	rdpr	%tt, %r3
	.word 0x879023aa  ! 910: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0xa945c000  ! 911: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x87802020  ! 912: WRASI_I	wr	%r0, 0x0020, %asi
splash_lsu_0_433:
	setx 0x88420f04442995fb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 913: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 914: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87802058  ! 915: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_0_434:
	setx 0x113ed29b1a32a2e2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 916: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_435:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d900014  ! 917: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x87802016  ! 918: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d802004  ! 919: WRFPRS_I	wr	%r0, 0x0004, %fprs
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 920: LDX_R	ldx	[%r31 + %r0], %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_436)) -> intp(0,1,3)
xir_0_436:
	.word 0xa9826001  ! 921: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xe88fe010  ! 922: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
	.word 0x8790217d  ! 923: WRPR_TT_I	wrpr	%r0, 0x017d, %tt
tagged_0_437:
	taddcctv %r20, 0x1648, %r1
	.word 0xe807e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xa1902004  ! 925: WRPR_GL_I	wrpr	%r0, 0x0004, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_438)) -> intp(0,0,18)
intvec_0_438:
	.word 0x39400001  ! 926: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_439:
	setx 0x064a313daf43c968, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 927: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 928: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802055  ! 929: WRASI_I	wr	%r0, 0x0055, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe927e001  ! 931: STF_I	st	%f20, [0x0001, %r31]
	.word 0x2a700001  ! 932: BPCS	<illegal instruction>
mondo_0_441:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d92c00a  ! 933: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0xab808008  ! 934: WR_CLEAR_SOFTINT_R	wr	%r2, %r8, %clear_softint
splash_lsu_0_442:
	setx 0x3bf95891bcbdb12f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 935: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 936: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 937: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 938: LDX_R	ldx	[%r31 + %r0], %r20
DS_0_444:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb4030c  ! 939: ALIGNADDRESS	alignaddr	%r16, %r12, %r7
DS_0_445:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 940: SAVE_R	save	%r31, %r0, %r31
mondo_0_446:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d940010  ! 941: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
splash_cmpr_0_447:
	setx 0xba47b91c4cc53f73, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 942: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_448:
	setx 0xb0a188f5f39867c0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 943: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 944: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xced7e000  ! 945: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 946: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_0_449:
	setx 0x6e7c60eb283fc70b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 947: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_450:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 948: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 949: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xcf17c000  ! 950: LDQF_R	-	[%r31, %r0], %f7
	set 0xfadfc1cc, %r28
	stxa %r28, [%g0] 0x73
intvec_0_451:
	.word 0x39400001  ! 951: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_452)) -> intp(0,1,3)
xir_0_452:
	.word 0xa9846001  ! 952: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
tagged_0_453:
	taddcctv %r25, 0x1524, %r3
	.word 0xce07e001  ! 953: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_lsu_0_454:
	setx 0x5533581f987403ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 954: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_455:
	taddcctv %r12, 0x16fe, %r11
	.word 0xce07e001  ! 955: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_cmpr_0_456:
	setx 0xce0b9abde08a05cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 956: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902009  ! 957: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d90253d  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x053d, %pstate
	.word 0xce8fe010  ! 959: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0x91d02033  ! 960: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xced804a0  ! 961: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0x93902006  ! 962: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02033  ! 963: Tcc_I	te	icc_or_xcc, %r0 + 51
change_to_randtl_0_457:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_457:
	.word 0x8f902003  ! 964: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_0_458:
	setx 0x1eb36e3d90969759, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 965: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 966: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_459:
	setx 0x05af81d78b76f01c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 967: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce47c000  ! 968: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0x91d020b5  ! 969: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8780201c  ! 970: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x3c800001  ! 971: BPOS	bpos,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_460)) -> intp(0,0,8)
intvec_0_460:
	.word 0x39400001  ! 972: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_461)) -> intp(0,1,3)
xir_0_461:
	.word 0xa9816001  ! 973: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x81510000  ! 974: RDPR_TICK	<illegal instruction>
	.word 0xce1fe001  ! 975: LDD_I	ldd	[%r31 + 0x0001], %r7
intveclr_0_462:
	set 0xeb66c7f9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 976: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xce8008a0  ! 977: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
splash_cmpr_0_463:
	setx 0x8cb11fafe7b7b944, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 978: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_464)) -> intp(0,0,11)
intvec_0_464:
	.word 0x39400001  ! 979: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_465)) -> intp(0,1,3)
xir_0_465:
	.word 0xa9842001  ! 980: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
mondo_0_466:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d910009  ! 981: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0x87902304  ! 982: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
debug_0_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 983: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xce1fe001  ! 984: LDD_I	ldd	[%r31 + 0x0001], %r7
mondo_0_468:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914005  ! 985: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	set 0x7156879b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_469:
	.word 0x39400001  ! 986: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_470)) -> intp(0,0,1)
intvec_0_470:
	.word 0x39400001  ! 987: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_471:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 988: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x8950c000  ! 989: RDPR_TT	rdpr	%tt, %r4
	.word 0xc857c000  ! 990: LDSH_R	ldsh	[%r31 + %r0], %r4
splash_cmpr_0_472:
	setx 0x4e16ae758af42590, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 991: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xcc82a166, %r28
	stxa %r28, [%g0] 0x73
intvec_0_473:
	.word 0x39400001  ! 992: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_474:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d930004  ! 993: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
	.word 0xc8cfe030  ! 994: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r4
	set 0x6e07b5f6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_475:
	.word 0x39400001  ! 995: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_476)) -> intp(0,1,3)
xir_0_476:
	.word 0xa982a001  ! 996: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xa190200b  ! 997: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902003  ! 998: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_477:
	set 0xace001fe, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 999: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 1000: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902d4c  ! 1001: WRPR_PSTATE_I	wrpr	%r0, 0x0d4c, %pstate
splash_cmpr_0_478:
	setx 0x22f1120e0557dc93, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1002: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc81fe001  ! 1003: LDD_I	ldd	[%r31 + 0x0001], %r4
splash_lsu_0_479:
	setx 0x9836bc9308d6eb8b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1004: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 1005: LDX_R	ldx	[%r31 + %r0], %r4
intveclr_0_480:
	set 0x4038437b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1006: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 1007: BPN	<illegal instruction>
	.word 0xc85fe001  ! 1008: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x93d02033  ! 1009: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_htba_0_481:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1010: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
	.word 0x2e800001  ! 1012: BVS	bvs,a	<label_0x1>
DS_0_482:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1013: SAVE_R	save	%r31, %r0, %r31
splash_htba_0_483:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1014: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_484)) -> intp(0,1,3)
xir_0_484:
	.word 0xa9852001  ! 1015: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
splash_cmpr_0_485:
	setx 0xd56509969a2e8203, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1016: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3520000  ! 1017: RDPR_PIL	<illegal instruction>
	.word 0xe2800c80  ! 1018: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
splash_cmpr_0_486:
	setx 0xe1cb604be0b533b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1019: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x43c47c38, %r28
	stxa %r28, [%g0] 0x73
intvec_0_487:
	.word 0x39400001  ! 1020: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_488:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d930006  ! 1021: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
mondo_0_489:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d904009  ! 1022: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0xe297e010  ! 1023: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1024: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_490)) -> intp(0,0,27)
intvec_0_490:
	.word 0x39400001  ! 1025: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_491:
	setx 0x6ad78905713a58c7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1026: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_492:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94400d  ! 1027: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	.word 0x93902005  ! 1028: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 1029: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_0_493:
	setx 0x0b91d2133e9b40f9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1030: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1031: LDX_R	ldx	[%r31 + %r0], %r17
debug_0_494:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1032: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d903f00  ! 1033: WRPR_PSTATE_I	wrpr	%r0, 0x1f00, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_495)) -> intp(0,1,3)
xir_0_495:
	.word 0xa9816001  ! 1034: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_496)) -> intp(0,1,3)
xir_0_496:
	.word 0xa9802001  ! 1035: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x879020c2  ! 1036: WRPR_TT_I	wrpr	%r0, 0x00c2, %tt
	.word 0xe337c00d  ! 1037: STQF_R	-	%f17, [%r13, %r31]
tagged_0_497:
	taddcctv %r5, 0x10bd, %r6
	.word 0xe207e001  ! 1038: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa9464000  ! 1039: RD_STICK_CMPR_REG	rd	%-, %r20
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_498)) -> intp(0,0,8)
intvec_0_498:
	.word 0x39400001  ! 1040: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_499:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d934014  ! 1041: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
mondo_0_500:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944006  ! 1042: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xe8800ac0  ! 1043: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r20
debug_0_501:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 1044: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xe8bfe001  ! 1045: STDA_I	stda	%r20, [%r31 + 0x0001] %asi
	.word 0x91d02035  ! 1046: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902266  ! 1047: WRPR_TT_I	wrpr	%r0, 0x0266, %tt
DS_0_502:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1048: SAVE_R	save	%r31, %r0, %r31
mondo_0_503:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d90c00d  ! 1049: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0xa1902000  ! 1050: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1051: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8800b20  ! 1052: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r20
DS_0_504:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db4830b  ! 1053: ALIGNADDRESS	alignaddr	%r18, %r11, %r6
	.word 0x87902246  ! 1054: WRPR_TT_I	wrpr	%r0, 0x0246, %tt
splash_cmpr_0_505:
	setx 0x9a7e959757e1ab37, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1055: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 1056: WRASI_I	wr	%r0, 0x0020, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_506)) -> intp(0,0,28)
intvec_0_506:
	.word 0x39400001  ! 1057: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x352a7318, %r28
	stxa %r28, [%g0] 0x73
intvec_0_507:
	.word 0x39400001  ! 1058: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_508:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d940004  ! 1059: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x26700001  ! 1060: BPL	<illegal instruction>
	.word 0x99902001  ! 1061: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
debug_0_509:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1062: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xcc4fe001  ! 1063: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1064: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcd97e001  ! 1065: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x8d902725  ! 1066: WRPR_PSTATE_I	wrpr	%r0, 0x0725, %pstate
intveclr_0_510:
	set 0xe624e28e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1067: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_511:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d90000c  ! 1068: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
splash_lsu_0_512:
	setx 0xebb514c9a3497839, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1069: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0x5aaca3b3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_513:
	.word 0x39400001  ! 1070: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 1071: WRASI_I	wr	%r0, 0x004f, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_514)) -> intp(0,0,21)
intvec_0_514:
	.word 0x39400001  ! 1072: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198291e  ! 1073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091e, %hpstate
	.word 0x87802080  ! 1074: WRASI_I	wr	%r0, 0x0080, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1075: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc800b40  ! 1076: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
mondo_0_515:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d924002  ! 1077: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
splash_cmpr_0_516:
	setx 0x62849635038bba62, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1078: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_517:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f26, %f6, %f18
	.word 0x83b48308  ! 1079: ALIGNADDRESS	alignaddr	%r18, %r8, %r1
	.word 0x8d903a5d  ! 1080: WRPR_PSTATE_I	wrpr	%r0, 0x1a5d, %pstate
tagged_0_518:
	tsubcctv %r13, 0x1ae7, %r2
	.word 0xc207e001  ! 1081: LDUW_I	lduw	[%r31 + 0x0001], %r1
	set 0x13cfaee9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_519:
	.word 0x39400001  ! 1082: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_520:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d930014  ! 1083: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x87802010  ! 1084: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_0_521:
	setx 0x39909a1e8a5a3a2f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1085: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81982a85  ! 1086: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a85, %hpstate
	.word 0xc247c000  ! 1087: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0x8d902a48  ! 1088: WRPR_PSTATE_I	wrpr	%r0, 0x0a48, %pstate
mondo_0_522:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950006  ! 1089: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0x2e800001  ! 1090: BVS	bvs,a	<label_0x1>
mondo_0_523:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d930013  ! 1091: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0x879020d0  ! 1092: WRPR_TT_I	wrpr	%r0, 0x00d0, %tt
	.word 0x91902001  ! 1093: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
	.word 0x87902363  ! 1094: WRPR_TT_I	wrpr	%r0, 0x0363, %tt
mondo_0_524:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d93400d  ! 1095: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
	.word 0x91d02033  ! 1096: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_0_525:
	setx 0xb077f4fc8120240e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1097: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_526:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d914010  ! 1098: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
intveclr_0_527:
	set 0x56112cd7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1099: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1100: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 1101: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_0_528:
	setx 0x220c405159535d6f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1102: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc2bfc030  ! 1103: STDA_R	stda	%r1, [%r31 + %r16] 0x01
	.word 0xc327e001  ! 1104: STF_I	st	%f1, [0x0001, %r31]
splash_cmpr_0_529:
	setx 0x12f6f5ec348e336c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1105: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_530:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1106: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902006  ! 1107: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 1109: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa1902007  ! 1110: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_0_531:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1111: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802055  ! 1112: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_532:
	setx 0x205062c899d3c2a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1113: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9844011  ! 1114: WR_SET_SOFTINT_R	wr	%r17, %r17, %set_softint
debug_0_533:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1115: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc2800c20  ! 1116: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r1
	.word 0x89450000  ! 1117: RD_SET_SOFTINT	rd	%set_softint, %r4
	.word 0x93902007  ! 1118: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc88fe030  ! 1120: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0xa1902000  ! 1121: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xc80fe001  ! 1123: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0xa950c000  ! 1124: RDPR_TT	rdpr	%tt, %r20
	.word 0x91d02034  ! 1125: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x83d020b2  ! 1126: Tcc_I	te	icc_or_xcc, %r0 + 178
tagged_0_534:
	tsubcctv %r22, 0x1e01, %r26
	.word 0xe807e001  ! 1127: LDUW_I	lduw	[%r31 + 0x0001], %r20
debug_0_535:
	nop
	setx debug_0_535 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1128: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802020  ! 1129: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa9a14dc1  ! 1130: FdMULq	fdmulq	
	.word 0x93902004  ! 1131: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xab808005  ! 1132: WR_CLEAR_SOFTINT_R	wr	%r2, %r5, %clear_softint
	.word 0x81510000  ! 1133: RDPR_TICK	<illegal instruction>
	.word 0x91d020b4  ! 1134: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_536:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1135: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0xcbe2d904, %r28
	stxa %r28, [%g0] 0x73
intvec_0_537:
	.word 0x39400001  ! 1136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_538:
	nop
	setx debug_0_538 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1137: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	set 0xcb628606, %r28
	stxa %r28, [%g0] 0x73
intvec_0_539:
	.word 0x39400001  ! 1138: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8900e60  ! 1139: LDUHA_R	lduha	[%r0, %r0] 0x73, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91686001  ! 1140: SDIVX_I	sdivx	%r1, 0x0001, %r8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_541:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1143: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xa1902009  ! 1144: WRPR_GL_I	wrpr	%r0, 0x0009, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_542)) -> intp(0,1,3)
xir_0_542:
	.word 0xa9842001  ! 1145: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x8d540000  ! 1146: RDPR_GL	<illegal instruction>
	set 0x7daa639, %r28
	stxa %r28, [%g0] 0x73
intvec_0_543:
	.word 0x39400001  ! 1147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_544)) -> intp(0,0,5)
intvec_0_544:
	.word 0x39400001  ! 1148: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_545:
	setx 0xffccf43fe6747c01, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1149: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ac4a001  ! 1150: ADDCcc_I	addccc 	%r18, 0x0001, %r13
	.word 0xdb97e001  ! 1151: LDQFA_I	-	[%r31, 0x0001], %f13
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_546)) -> intp(0,0,22)
intvec_0_546:
	.word 0x39400001  ! 1152: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87450000  ! 1153: RD_SET_SOFTINT	rd	%set_softint, %r3
	.word 0x91d020b3  ! 1154: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_htba_0_547:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1155: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x2e700001  ! 1156: BPVS	<illegal instruction>
	.word 0xc68fe030  ! 1157: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
splash_cmpr_0_548:
	setx 0x35674d0c87761121, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1158: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x980ee615, %r28
	stxa %r28, [%g0] 0x73
intvec_0_549:
	.word 0x39400001  ! 1159: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc6c804a0  ! 1160: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
debug_0_550:
	nop
	setx debug_0_550 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1161: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc657e001  ! 1162: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0x81b01021  ! 1163: SIAM	siam	1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_551)) -> intp(0,1,3)
xir_0_551:
	.word 0xa9826001  ! 1164: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
intveclr_0_552:
	set 0x706f722a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1165: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc69fe001  ! 1166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xc60fe001  ! 1167: LDUB_I	ldub	[%r31 + 0x0001], %r3
	.word 0x99902004  ! 1168: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93d02032  ! 1169: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_0_553:
	setx 0x22f5372c2afba722, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1170: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_554:
	tsubcctv %r16, 0x1847, %r3
	.word 0xc607e001  ! 1171: LDUW_I	lduw	[%r31 + 0x0001], %r3
tagged_0_555:
	taddcctv %r14, 0x1bbb, %r4
	.word 0xc607e001  ! 1172: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc68fe010  ! 1173: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
DS_0_556:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1174: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc61fc000  ! 1175: LDD_R	ldd	[%r31 + %r0], %r3
	set 0x9d412ede, %r28
	stxa %r28, [%g0] 0x73
intvec_0_557:
	.word 0x39400001  ! 1176: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 1177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
intveclr_0_558:
	set 0xb39ed638, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_559:
	set 0xafaef098, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1179: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc6c804a0  ! 1180: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 1182: RD_STICK_REG	stbar
	.word 0x8d902ade  ! 1183: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
mondo_0_560:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 1184: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
DS_0_561:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1185: SAVE_R	save	%r31, %r0, %r31
splash_lsu_0_562:
	setx 0xf1680d1110afd605, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1186: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023d1  ! 1187: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
splash_cmpr_0_563:
	setx 0x6e003ff241e4ab05, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1188: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91480000  ! 1189: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x8d902ab3  ! 1190: WRPR_PSTATE_I	wrpr	%r0, 0x0ab3, %pstate
debug_0_564:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 1191: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1192: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0xefcc24b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_565:
	.word 0x39400001  ! 1193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd05fe001  ! 1194: LDX_I	ldx	[%r31 + 0x0001], %r8
debug_0_566:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1195: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1197: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902384  ! 1198: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
intveclr_0_567:
	set 0xb76f45cb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0cfe000  ! 1200: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
splash_htba_0_568:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1201: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
intveclr_0_569:
	set 0xc9863ba, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902328  ! 1203: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
debug_0_570:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 1204: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_lsu_0_571:
	setx 0x7f498e4375743e33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1205: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 1206: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_0_572:
	setx 0x577f1c2fe7ac3b2d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1207: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_573:
	taddcctv %r14, 0x1e0e, %r24
	.word 0xd007e001  ! 1208: LDUW_I	lduw	[%r31 + 0x0001], %r8
mondo_0_574:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 1209: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	set 0x370c2bdb, %r28
	stxa %r28, [%g0] 0x73
intvec_0_575:
	.word 0x39400001  ! 1210: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8b45c000  ! 1211: RD_TICK_CMPR_REG	rd	%-, %r5
	.word 0x91d02035  ! 1212: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_576:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 1213: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xcad7e030  ! 1214: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0x87802016  ! 1215: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_577:
	nop
	setx debug_0_577 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1216: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xca7fe001  ! 1217: SWAP_I	swap	%r5, [%r31 + 0x0001]
splash_htba_0_578:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1218: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_579:
	setx 0x16f976fe41769b25, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1219: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_580)) -> intp(0,1,3)
xir_0_580:
	.word 0xa9812001  ! 1220: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
debug_0_581:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1221: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_582:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 1222: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x38800001  ! 1223: BGU	bgu,a	<label_0x1>
	.word 0x87902037  ! 1224: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
	.word 0xca8008a0  ! 1225: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x91d020b2  ! 1226: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x99902000  ! 1227: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_lsu_0_583:
	setx 0xbfc4680d8c759fd7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1228: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_584:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xa346877a	! Random illegal ?
	.word 0x85a00547  ! 1: FSQRTd	fsqrt	
	.word 0x99a00823  ! 1229: FADDs	fadds	%f0, %f3, %f12
splash_tba_0_585:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1230: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1231: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd857e001  ! 1232: LDSH_I	ldsh	[%r31 + 0x0001], %r12
mondo_0_586:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d918010  ! 1233: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	.word 0xd89004a0  ! 1234: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd88008a0  ! 1235: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902007  ! 1236: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xab834002  ! 1237: WR_CLEAR_SOFTINT_R	wr	%r13, %r2, %clear_softint
	.word 0xa1902000  ! 1238: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81460000  ! 1239: RD_STICK_REG	stbar
tagged_0_587:
	taddcctv %r16, 0x1eeb, %r5
	.word 0xd807e001  ! 1240: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790234a  ! 1241: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
debug_0_588:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 1242: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
intveclr_0_589:
	set 0x74eb8a0a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1243: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83520000  ! 1244: RDPR_PIL	rdpr	%pil, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc237e001  ! 1246: STH_I	sth	%r1, [%r31 + 0x0001]
splash_cmpr_0_590:
	setx 0x2ec6e3a8df99f645, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1247: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_591:
	set 0x2c4cfd6a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1248: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_592:
	set 0xdca77503, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x864cc013  ! 1250: MULX_R	mulx 	%r19, %r19, %r3
	.word 0xc69fe001  ! 1251: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
mondo_0_593:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d924008  ! 1252: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
splash_tba_0_594:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1253: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 1254: FqTOd	dis not found

	.word 0xd48008a0  ! 1255: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_0_596:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1256: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd4d80e40  ! 1257: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
mondo_0_597:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 1258: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x91d020b2  ! 1259: Tcc_I	ta	icc_or_xcc, %r0 + 178
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1260: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802089  ! 1261: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd45fe001  ! 1262: LDX_I	ldx	[%r31 + 0x0001], %r10
mondo_0_598:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d950010  ! 1263: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0x8ba00560  ! 1264: FSQRTq	fsqrt	
	.word 0xca9004a0  ! 1265: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xcad7e010  ! 1266: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_599)) -> intp(0,1,3)
xir_0_599:
	.word 0xa9806001  ! 1267: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x91d02032  ! 1268: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_0_600:
	setx 0xe18289352e23be6d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_601:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d920002  ! 1270: WRPR_WSTATE_R	wrpr	%r8, %r2, %wstate
splash_cmpr_0_602:
	setx 0x4068ae52c8a846ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1271: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81510000  ! 1272: RDPR_TICK	<illegal instruction>
	.word 0xca900e80  ! 1273: LDUHA_R	lduha	[%r0, %r0] 0x74, %r5
	.word 0xcac7e000  ! 1274: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0xca8008a0  ! 1275: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8790232c  ! 1276: WRPR_TT_I	wrpr	%r0, 0x032c, %tt
splash_cmpr_0_603:
	setx 0x3c3cf8313073463d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1277: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 1278: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902d73  ! 1279: WRPR_PSTATE_I	wrpr	%r0, 0x0d73, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_604)) -> intp(0,1,3)
xir_0_604:
	.word 0xa982a001  ! 1280: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xca9004a0  ! 1281: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_605)) -> intp(0,1,3)
xir_0_605:
	.word 0xa9812001  ! 1282: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xa1902007  ! 1283: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8198208d  ! 1284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008d, %hpstate
	.word 0x81982356  ! 1285: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
	.word 0xa1480000  ! 1286: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x93902007  ! 1287: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_0_606:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 1288: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	set 0xbfd30d45, %r28
	stxa %r28, [%g0] 0x73
intvec_0_607:
	.word 0x39400001  ! 1289: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_608)) -> intp(0,0,17)
intvec_0_608:
	.word 0x39400001  ! 1290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xb11d68b1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_609:
	.word 0x39400001  ! 1291: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_610:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d924011  ! 1292: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x87902103  ! 1293: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0xe09fe001  ! 1294: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0xa190200b  ! 1295: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 1297: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_611:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1298: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0c7e030  ! 1299: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
	.word 0xe0800c80  ! 1300: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
	.word 0xa9a349c1  ! 1301: FDIVd	fdivd	%f44, %f32, %f20
splash_lsu_0_612:
	setx 0xbfbc1b44ff89fd13, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1302: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e001  ! 1303: STF_I	st	%f20, [0x0001, %r31]
	.word 0x87802016  ! 1304: WRASI_I	wr	%r0, 0x0016, %asi
mondo_0_613:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d924011  ! 1305: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
splash_lsu_0_614:
	setx 0xf630b017a267492d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_615:
	setx 0xd9fe1d4809dcfaf5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1307: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe8800aa0  ! 1308: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
	.word 0xe91fe001  ! 1309: LDDF_I	ldd	[%r31, 0x0001], %f20
debug_0_616:
	nop
	setx debug_0_616 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1311: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1312: SIR	sir	0x0001
	set 0x8c01c279, %r28
	stxa %r28, [%g0] 0x73
intvec_0_617:
	.word 0x39400001  ! 1313: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96ca001  ! 1314: SDIVX_I	sdivx	%r18, 0x0001, %r20
mondo_0_619:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c00c  ! 1315: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x91d020b3  ! 1316: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d90229f  ! 1317: WRPR_PSTATE_I	wrpr	%r0, 0x029f, %pstate
mondo_0_620:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 1318: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 1319: LDX_R	ldx	[%r31 + %r0], %r20
debug_0_621:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 1320: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
intveclr_0_622:
	set 0x73499852, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1321: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1322: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8b520000  ! 1323: RDPR_PIL	rdpr	%pil, %r5
	.word 0xca9fe001  ! 1324: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0xa190200b  ! 1325: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa4686001  ! 1326: UDIVX_I	udivx 	%r1, 0x0001, %r18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1327: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_623:
	setx 0xf4f0ae51009da01d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1328: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_624)) -> intp(0,1,3)
xir_0_624:
	.word 0xa984e001  ! 1329: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
splash_lsu_0_625:
	setx 0x18030972d3d2d9c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1330: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_626)) -> intp(0,0,24)
intvec_0_626:
	.word 0x39400001  ! 1331: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1332: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_627)) -> intp(0,1,3)
xir_0_627:
	.word 0xa981e001  ! 1333: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0x91d02033  ! 1334: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_0_628:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d928007  ! 1335: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_629)) -> intp(0,1,3)
xir_0_629:
	.word 0xa9806001  ! 1336: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_630)) -> intp(0,0,5)
intvec_0_630:
	.word 0x39400001  ! 1337: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_631:
	taddcctv %r22, 0x1176, %r13
	.word 0xe407e001  ! 1338: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_cmpr_0_632:
	setx 0xeef42d7e269c04c9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1339: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021f8  ! 1340: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
debug_0_633:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 1341: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
mondo_0_634:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d948000  ! 1342: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
intveclr_0_635:
	set 0x7a0d614, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1343: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 1344: SIAM	siam	1
	.word 0x9190e001  ! 1345: WRPR_PIL_I	wrpr	%r3, 0x0001, %pil
splash_htba_0_636:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1346: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b2  ! 1347: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d903398  ! 1348: WRPR_PSTATE_I	wrpr	%r0, 0x1398, %pstate
	.word 0xe49004a0  ! 1349: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1350: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_637:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 1351: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0xe4c7e000  ! 1352: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
splash_cmpr_0_638:
	setx 0x998d5fa7697c29ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1353: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_639:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1354: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1355: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_0_640:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_640:
	.word 0x8f902000  ! 1356: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1357: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4800a80  ! 1358: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
mondo_0_641:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920006  ! 1359: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	.word 0xa1902004  ! 1360: WRPR_GL_I	wrpr	%r0, 0x0004, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_642)) -> intp(0,0,11)
intvec_0_642:
	.word 0x39400001  ! 1361: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_643:
	nop
	setx debug_0_643 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1362: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_644:
	setx 0x8d7370dc5671e444, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 1364: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe41fe001  ! 1365: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0xa7520000  ! 1366: RDPR_PIL	rdpr	%pil, %r19
	.word 0x8d90310e  ! 1367: WRPR_PSTATE_I	wrpr	%r0, 0x110e, %pstate
splash_cmpr_0_645:
	setx 0x58ed3c968b2250fc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe727e001  ! 1369: STF_I	st	%f19, [0x0001, %r31]
mondo_0_646:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d940002  ! 1370: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
splash_cmpr_0_647:
	setx 0xb6d74aa3db514add, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1371: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe69fe001  ! 1372: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0xe737c002  ! 1373: STQF_R	-	%f19, [%r2, %r31]
splash_htba_0_648:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1374: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8481c009  ! 1375: ADDcc_R	addcc 	%r7, %r9, %r2
debug_0_649:
	nop
	setx debug_0_649 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1376: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc48804a0  ! 1377: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	ta	T_CHANGE_HPRIV	! macro
intveclr_0_650:
	set 0x1308988b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83b24fe9  ! 1380: FONES	e	%f1
	.word 0xc337c009  ! 1381: STQF_R	-	%f1, [%r9, %r31]
	.word 0x8d90212e  ! 1382: WRPR_PSTATE_I	wrpr	%r0, 0x012e, %pstate
	.word 0x8790210f  ! 1383: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
	.word 0x93902005  ! 1384: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_651:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 1385: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_652)) -> intp(0,0,29)
intvec_0_652:
	.word 0x39400001  ! 1386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_653:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1388: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_654:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 1389: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x91d02034  ! 1390: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_0_655:
	set 0x2195a9f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1391: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_656:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe531e001  ! 1: STQF_I	-	%f18, [0x0001, %r7]
	normalw
	.word 0xa1458000  ! 1392: RD_SOFTINT_REG	rd	%softint, %r16
splash_htba_0_657:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1393: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe0cfe010  ! 1394: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
	.word 0xe0c7e000  ! 1395: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_658)) -> intp(0,0,6)
intvec_0_658:
	.word 0x39400001  ! 1396: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_659:
	setx 0x54bebc0e78c71569, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1397: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023c0  ! 1398: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
tagged_0_660:
	tsubcctv %r23, 0x1f8f, %r10
	.word 0xe007e001  ! 1399: LDUW_I	lduw	[%r31 + 0x0001], %r16
tagged_0_661:
	taddcctv %r19, 0x15f8, %r16
	.word 0xe007e001  ! 1400: LDUW_I	lduw	[%r31 + 0x0001], %r16
mondo_0_662:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d950000  ! 1401: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
	.word 0xe08008a0  ! 1402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
splash_cmpr_0_663:
	setx 0x77307f33f0b06fcd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1403: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe00fc000  ! 1404: LDUB_R	ldub	[%r31 + %r0], %r16
DS_0_664:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1405: SAVE_R	save	%r31, %r0, %r31
change_to_randtl_0_665:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_665:
	.word 0x8f902004  ! 1406: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
splash_lsu_0_666:
	setx 0x6d8b14c78106e74f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1407: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_667:
	set 0x9f58e1f6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1408: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0880e80  ! 1409: LDUBA_R	lduba	[%r0, %r0] 0x74, %r16
	.word 0x8d902fc7  ! 1410: WRPR_PSTATE_I	wrpr	%r0, 0x0fc7, %pstate
	.word 0x83d02034  ! 1411: Tcc_I	te	icc_or_xcc, %r0 + 52
change_to_randtl_0_668:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_668:
	.word 0x8f902002  ! 1412: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_0_669:
	setx 0x6f370a97d33e629f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1413: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_670:
	setx 0x05025c184b2dc462, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1414: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa984c006  ! 1415: WR_SET_SOFTINT_R	wr	%r19, %r6, %set_softint
	.word 0x93d02032  ! 1416: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x3c800001  ! 1417: BPOS	bpos,a	<label_0x1>
	.word 0x87902185  ! 1418: WRPR_TT_I	wrpr	%r0, 0x0185, %tt
splash_cmpr_0_671:
	setx 0x5d803b8826e25fce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1419: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_672:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908003  ! 1420: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
DS_0_673:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1421: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe01fc000  ! 1422: LDD_R	ldd	[%r31 + %r0], %r16
intveclr_0_674:
	set 0x90623a24, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1423: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_675:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d924009  ! 1424: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
	.word 0x93d02033  ! 1425: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 1426: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_0_676:
	set 0x754b280c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe05fe001  ! 1428: LDX_I	ldx	[%r31 + 0x0001], %r16
mondo_0_677:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d920004  ! 1429: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_678)) -> intp(0,0,2)
intvec_0_678:
	.word 0x39400001  ! 1430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xc67c92c6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_679:
	.word 0x39400001  ! 1431: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_680)) -> intp(0,0,9)
intvec_0_680:
	.word 0x39400001  ! 1432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90255b  ! 1433: WRPR_PSTATE_I	wrpr	%r0, 0x055b, %pstate
	.word 0x9f802001  ! 1434: SIR	sir	0x0001
	.word 0xa7520000  ! 1435: RDPR_PIL	rdpr	%pil, %r19
	.word 0x81982fd7  ! 1436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
	.word 0xe69fe001  ! 1437: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
splash_cmpr_0_681:
	setx 0xb3a4f99f54aa8019, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1438: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_682)) -> intp(0,0,24)
intvec_0_682:
	.word 0x39400001  ! 1439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1440: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe61fe001  ! 1441: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0xa350c000  ! 1442: RDPR_TT	rdpr	%tt, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1443: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe25fe001  ! 1444: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0x91d02032  ! 1445: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe030  ! 1447: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r17
	.word 0x91912001  ! 1448: WRPR_PIL_I	wrpr	%r4, 0x0001, %pil
splash_lsu_0_683:
	setx 0x51a7c58f170afb7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_684:
	setx 0x9cb51404caa2bafb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1450: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_685:
	nop
	setx debug_0_685 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1451: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_686)) -> intp(0,1,3)
xir_0_686:
	.word 0xa984e001  ! 1452: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xe29004a0  ! 1453: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xa1902006  ! 1454: WRPR_GL_I	wrpr	%r0, 0x0006, %-
intveclr_0_687:
	set 0xc57c4747, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1455: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_688:
	nop
	setx debug_0_688 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1456: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe327e001  ! 1457: STF_I	st	%f17, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0xe227e001  ! 1459: STW_I	stw	%r17, [%r31 + 0x0001]
	.word 0xe21fe001  ! 1460: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0x87802016  ! 1461: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902006  ! 1462: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe257c000  ! 1463: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0x93902004  ! 1464: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe2d004a0  ! 1465: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8d9023ef  ! 1466: WRPR_PSTATE_I	wrpr	%r0, 0x03ef, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1468: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe29fc020  ! 1469: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
	.word 0xe29004a0  ! 1470: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 1471: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1472: SIR	sir	0x0001
	.word 0xe327c004  ! 1473: STF_R	st	%f17, [%r4, %r31]
splash_lsu_0_689:
	setx 0x7f75555483ccd8af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1474: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_690)) -> intp(0,1,3)
xir_0_690:
	.word 0xa980a001  ! 1475: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xe397e001  ! 1476: LDQFA_I	-	[%r31, 0x0001], %f17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_691)) -> intp(0,1,3)
xir_0_691:
	.word 0xa9806001  ! 1477: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0xa190200d  ! 1478: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_692)) -> intp(0,0,4)
intvec_0_692:
	.word 0x39400001  ! 1479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903149  ! 1480: WRPR_PSTATE_I	wrpr	%r0, 0x1149, %pstate
splash_cmpr_0_693:
	setx 0xa7fdb660aa2be5db, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1481: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_694:
	tsubcctv %r21, 0x1653, %r2
	.word 0xe207e001  ! 1482: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x3a800001  ! 1483: BCC	bcc,a	<label_0x1>
	.word 0x20800001  ! 1484: BN	bn,a	<label_0x1>
	.word 0xe29fc020  ! 1485: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
splash_lsu_0_695:
	setx 0x13231de5fe204977, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1486: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 1487: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_696)) -> intp(0,0,8)
intvec_0_696:
	.word 0x39400001  ! 1488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2900e40  ! 1489: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
	.word 0xe31fe001  ! 1490: LDDF_I	ldd	[%r31, 0x0001], %f17
	.word 0xe2c7e010  ! 1491: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r17
	.word 0xa1902004  ! 1492: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8790200a  ! 1493: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1494: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe247c000  ! 1495: LDSW_R	ldsw	[%r31 + %r0], %r17
intveclr_0_697:
	set 0x732c8e70, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1496: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_698:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944003  ! 1497: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0x87802063  ! 1498: WRASI_I	wr	%r0, 0x0063, %asi
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

	.xword	0xffc39fabc1a6ab13
	.xword	0x29078a8a96315bed
	.xword	0x95ed41884aea03ce
	.xword	0x328090246a4a8c85
	.xword	0xb6f5729b77fc37f9
	.xword	0x55f1ed21594e389a
	.xword	0xc7f9b46835b4bd4d
	.xword	0xaafbf899e617b14c
	.xword	0x98e1bf08dd181f6e
	.xword	0xb50f24cb8bedb63b
	.xword	0x2370dcca0db5aee0
	.xword	0x37acb5896e22a2af
	.xword	0xdd2b221f1c0ae0a8
	.xword	0x5ef72298bda5bdda
	.xword	0x6a0c91316c9738ae
	.xword	0xacddd900fe2abf86
	.xword	0xc1e40f7bca52a8bb
	.xword	0xc6215113c18863be
	.xword	0xf67ca35ae3c94f50
	.xword	0x95189b1becf433af
	.xword	0x3e41e973b2d83abc
	.xword	0x5e0e0b7d3d1d5d55
	.xword	0x2b51b1b1d702c776
	.xword	0xaa68a72bd739a0f5
	.xword	0x93baf5eed1cad25a
	.xword	0xf544475e70ee857b
	.xword	0xc7f5c0768c9e1879
	.xword	0x68848bb25441fa0b
	.xword	0xe421e2a92c9f7331
	.xword	0x82a96fcd2c6c5d46
	.xword	0xd51bbccb3ebc4f6c
	.xword	0x04e4eecba82846f5
	.xword	0x9d999a6c58823a4e
	.xword	0xf3347de0cc1607c5
	.xword	0xc2b96810d4cdcb9d
	.xword	0x76e8372fb9013d0f
	.xword	0xb70081850043ec8a
	.xword	0x34cf3993401a3826
	.xword	0x97e7be16fc1e68de
	.xword	0x593eb35d7deb60e9
	.xword	0x7b9fbe0144e700ad
	.xword	0xd1a529a2a988e684
	.xword	0xa2405c6ce67eb4bb
	.xword	0x12433c1827350e7d
	.xword	0x7943e05bf7b1f895
	.xword	0xb48c42aa311de82a
	.xword	0x5c3462538f27de0a
	.xword	0xf156b8893fe09669
	.xword	0x8a29daf0673cfae5
	.xword	0xd9e9afaf2db81f3a
	.xword	0x2dcf6984064e66b2
	.xword	0xce7ec4fd89ba10af
	.xword	0x4767a2086fb60403
	.xword	0x068571b5288ac110
	.xword	0x44da1feb58da240c
	.xword	0x51a44062baa6eb57
	.xword	0xd11ff20d646af77f
	.xword	0xc37c8f8047de3125
	.xword	0x8fe616e94ec592ed
	.xword	0xfb307a5b8d3b02f1
	.xword	0xe42caf642ff54a50
	.xword	0x466c46045d59b92d
	.xword	0x7339f7e16f916d9f
	.xword	0xbc5f4d971c3bb5a0
	.xword	0x19e3f0bdd49221a5
	.xword	0x03772e1d16587851
	.xword	0x1b6ee1eed5638777
	.xword	0x11ac3fddb4153773
	.xword	0xa26dfab907df3e10
	.xword	0xdc036c065ae11fd5
	.xword	0x8deecfad22a1d2d8
	.xword	0x2ff9d0b446ddc529
	.xword	0xbbbef391cbfa9c69
	.xword	0xed1aab3a6e3d2dce
	.xword	0x59bee43f49c6ae92
	.xword	0x5b0af1302b5027ae
	.xword	0x157ec69766ba0661
	.xword	0xdf92f8a9c28812b5
	.xword	0x55eb40a26c70b107
	.xword	0xa70852022812470a
	.xword	0x6ad9af36f5c51b36
	.xword	0x198fa65d347337c0
	.xword	0xae224752f32de9b9
	.xword	0xb771eda9502a7057
	.xword	0x73821d95a0423c12
	.xword	0x777fb259cb4300a4
	.xword	0xb29e4780bf8e4f6f
	.xword	0xdf527a0c74284cdb
	.xword	0x93cb8880184881f6
	.xword	0xb85b53d4d59593d7
	.xword	0x376a2e61d7b0779a
	.xword	0x779a94dc1b35a1ea
	.xword	0xccb812e59ca4c836
	.xword	0x9c2f7f409fedc74c
	.xword	0x4ccbd894d292f340
	.xword	0xe08c9711c0ded8a2
	.xword	0xac059b6f4e92847b
	.xword	0x6aa294690fe75df2
	.xword	0xf3ba89a3bb2d27f0
	.xword	0x0224dfd3b6198363
	.xword	0xe700fdb099709e78
	.xword	0x974811fae90efd08
	.xword	0xc50487563f2253e1
	.xword	0xb9c6e0310a79fee0
	.xword	0x56a46071c6d15d43
	.xword	0xa250b681bf0702b2
	.xword	0xcf133ab30759ae48
	.xword	0x85aa323dcdc9f59b
	.xword	0x2ddc105f9ee42f09
	.xword	0x32d228875910ea6c
	.xword	0xfb6e41e44d1a1fd9
	.xword	0xc727466bcad74ca7
	.xword	0x60d729797e68dab0
	.xword	0xc07fb0b5c26fc1f0
	.xword	0x3fc49b7f65d30585
	.xword	0x66de06a658345ed4
	.xword	0x28f0485b729be62b
	.xword	0xa6f6312b16f6bad9
	.xword	0x919836fc82e8d351
	.xword	0x637ce60f52f2fabe
	.xword	0x97352001cb897c5a
	.xword	0xf2f68a0bfcd1e8c2
	.xword	0x2f24dd321c1690b6
	.xword	0x10cd7911cbc62034
	.xword	0x90280eafa0d00363
	.xword	0x36ceb1087fe6a35f
	.xword	0xebe5bda3ce15305b
	.xword	0x252be57d5e73f753
	.xword	0xb6c00fde4037795a
	.xword	0x4e5b23beea526195
	.xword	0x3eff56387d2ab7f9
	.xword	0xdf90533f5fc16ba4
	.xword	0x41c396ac8516c1fa
	.xword	0x372d7c6073467dfb
	.xword	0x9f2d666a58a57ef2
	.xword	0x4accc32d4820361e
	.xword	0xc845ea0f761a306b
	.xword	0xb6cee8ea52a21df4
	.xword	0x14ad259f9553c45f
	.xword	0xc412cb095fa186aa
	.xword	0xa1e9ef3f627d7bee
	.xword	0x407c870855b87dc9
	.xword	0xd9c933957e673545
	.xword	0x1ba5dc25b8bcdc5d
	.xword	0x1aa67eaa5c8c67b3
	.xword	0x3127dae57c7a18ef
	.xword	0xe702a788820172d4
	.xword	0x4a838afa4e818d0c
	.xword	0xbb906a51b7c03cd7
	.xword	0xbd8fe9b23a62d1ce
	.xword	0x98653548ffcc4c04
	.xword	0xcf623e3961e539ee
	.xword	0x498155d8786415fd
	.xword	0x3372f15645a840eb
	.xword	0x1fb593c3330caa02
	.xword	0x103d7133a2f1e682
	.xword	0x8ebe74ec8673f528
	.xword	0x487c2b556a52d382
	.xword	0x6657962dbf94fb86
	.xword	0x975d5b1a1dc78daa
	.xword	0x58d4562320b1e8c3
	.xword	0x0153c2a7aee0edbb
	.xword	0x118d7f3039de8320
	.xword	0x416b14376fecf12c
	.xword	0xd3dfc97557d2b23e
	.xword	0x6b00d9e28ee43149
	.xword	0x17d8e9d1555537d2
	.xword	0xae6dd1c62a0ffb63
	.xword	0x31f633e1f0bce10c
	.xword	0x5dcf19992020dc5d
	.xword	0x8c7f4c99b8d69323
	.xword	0x4079d8796235aa91
	.xword	0x484e4634660a4796
	.xword	0x72c699788ba68a49
	.xword	0x11e051635702beb3
	.xword	0x3e87a217a8ae5ca4
	.xword	0xcdcba0b1a829b724
	.xword	0xef54f14d49ed99a4
	.xword	0xecf3745897bece77
	.xword	0x5cfc413e752abfbf
	.xword	0xc2930cbc88a5f527
	.xword	0x86b48963479c57f5
	.xword	0x598796084f1aa229
	.xword	0x81ed5819711d15a7
	.xword	0x9e99f47faa0ebae9
	.xword	0x74e7b71400f05fc6
	.xword	0x8aa1fd45ead00aa0
	.xword	0xaeb382a8ec4d9fec
	.xword	0x561a641ec339fc87
	.xword	0x184dacacdb7e160c
	.xword	0xdbac1b3129b9eb4e
	.xword	0xfa23a3c154d201af
	.xword	0xdc6d4d1912d9161c
	.xword	0x4872b04b0084a373
	.xword	0x54e49b1c0d0ad054
	.xword	0x5b736097610cb075
	.xword	0xabf4ea027fd1cdf6
	.xword	0x56c339ebf67b6399
	.xword	0x5bceb7f262c732f5
	.xword	0x384f7fc2eba2f906
	.xword	0xa71f26616bb2554e
	.xword	0xfe15b3f1b97bda56
	.xword	0x10320e7307938f3c
	.xword	0x4679660489c72111
	.xword	0x008d19c0ec4d0622
	.xword	0xd3707750a4f41d87
	.xword	0x1a9d81672d42ab92
	.xword	0x652c2403378333ee
	.xword	0x851b497948e27028
	.xword	0x1d1ada36a5117f72
	.xword	0x2d3389f932bdd2af
	.xword	0x99ebb68436b98a2b
	.xword	0x5f7b50487de01f0b
	.xword	0x048b63597f2f5b8a
	.xword	0x5304aef5e3b42bb0
	.xword	0x17d93cbffc74b633
	.xword	0x576954eb6c682499
	.xword	0x8e6ed2e86c2a8e26
	.xword	0xffe79e35fe89f9fe
	.xword	0xd9a2b2acb59696fa
	.xword	0x8cc6dc26f95a5465
	.xword	0x47114b03b216396e
	.xword	0x926dc79330d209d0
	.xword	0xc43514c04c269fb1
	.xword	0x633e3d0049abd8f2
	.xword	0x3e13138697634286
	.xword	0x3cd1838b14dcc342
	.xword	0x3ed9aa0dab71bf4f
	.xword	0x992ebcc1c57eb571
	.xword	0x0a7ea6011d0f08a3
	.xword	0x0b39190faf310c51
	.xword	0x4e047c6524a9064b
	.xword	0x70b0bbd466a9d925
	.xword	0xe0aca6f8411ed567
	.xword	0xe243e985130446a6
	.xword	0xdfbe20d03ad022a0
	.xword	0x29d4bca6d3f27623
	.xword	0xe74791101a2f6492
	.xword	0x93fa3a5c4e896529
	.xword	0xb7c59fcaafc121b6
	.xword	0x7865de71d4a2d919
	.xword	0x0d46c73e3a2c474d
	.xword	0xb8eefd35c8595649
	.xword	0x07f53e440e5d5588
	.xword	0x735a92447a59ec17
	.xword	0xb6d6111286ade86f
	.xword	0x4a36570c79929491
	.xword	0x81491d1b5fa7c5cd
	.xword	0xc6ebea493c7e6ac0
	.xword	0x0454efc6b787f081
	.xword	0x8817e2810f6996df
	.xword	0x10c65b3d25e0f721
	.xword	0xbe5ea716e39cca08
	.xword	0x8303da8c283aa766
	.xword	0xf05f34c8ac23ad06
	.xword	0x4cf55581f9300200

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

