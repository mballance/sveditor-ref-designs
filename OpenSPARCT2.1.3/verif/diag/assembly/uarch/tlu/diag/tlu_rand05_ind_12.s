/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_12.s
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
	mov 0xb1, %r14
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
	mov 0x30, %r30
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

	.word 0xa1902002  ! 1: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd0bfc021  ! 2: STDA_R	stda	%r8, [%r31 + %r1] 0x01
splash_lsu_0_0:
	setx 0x52fea17e4a5e5727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_0_1:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 4: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd047e001  ! 5: LDSW_I	ldsw	[%r31 + 0x0001], %r8
debug_0_2:
	mov 0x38, %r18
	.word 0xfef00b12  ! 6: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x2e700001  ! 7: BPVS	<illegal instruction>
	.word 0xa2ad0005  ! 8: ANDNcc_R	andncc 	%r20, %r5, %r17
	.word 0x87802058  ! 9: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe28008a0  ! 10: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87802014  ! 11: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802055  ! 12: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802004  ! 13: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe24fc000  ! 14: LDSB_R	ldsb	[%r31 + %r0], %r17
debug_0_3:
	mov 8, %r18
	.word 0xe2f00852  ! 15: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_4)) -> intp(0,1,3)
xir_0_4:
	.word 0xa9812001  ! 16: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xa1902001  ! 17: WRPR_GL_I	wrpr	%r0, 0x0001, %-
tagged_0_5:
	taddcctv %r21, 0x1687, %r8
	.word 0xe207e001  ! 18: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe337e001  ! 19: STQF_I	-	%f17, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_6)) -> intp(0,0,12)
intvec_0_6:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x533e4dce, %r28
	stxa %r28, [%g0] 0x73
intvec_0_7:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_8:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f26, %f4
	.word 0x97b2430a  ! 22: ALIGNADDRESS	alignaddr	%r9, %r10, %r11
	.word 0xa1480000  ! 23: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x93902006  ! 24: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_9)) -> intp(0,1,3)
xir_0_9:
	.word 0xa980a001  ! 26: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
debug_0_10:
	setx debug_0_10 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 28: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x816ca001  ! 29: SDIVX_I	sdivx	%r18, 0x0001, %r0
	.word 0xc127e001  ! 30: STF_I	st	%f0, [0x0001, %r31]
	.word 0x8d903ab9  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x1ab9, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_12)) -> intp(0,1,3)
xir_0_12:
	.word 0xa9832001  ! 32: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xc047c000  ! 33: LDSW_R	ldsw	[%r31 + %r0], %r0
debug_0_13:
	setx debug_0_13 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 34: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 35: RDPR_TICK	<illegal instruction>
	.word 0xa945c000  ! 36: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x81460000  ! 37: RD_STICK_REG	stbar
	.word 0x99902003  ! 38: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_0_14:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d924006  ! 39: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
debug_0_15:
	mov 8, %r18
	.word 0xdaf00852  ! 40: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xa7702001  ! 41: POPC_I	popc	0x0001, %r19
	.word 0xe61fc000  ! 42: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0xe6800a60  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0x879021ba  ! 44: WRPR_TT_I	wrpr	%r0, 0x01ba, %tt
	.word 0xa1902007  ! 45: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa6f98010  ! 46: SDIVcc_R	sdivcc 	%r6, %r16, %r19
debug_0_16:
	setx debug_0_16 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 47: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_17)) -> intp(0,1,3)
xir_0_17:
	.word 0xa9802001  ! 48: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xe61fe001  ! 49: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0xa1902005  ! 50: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_0_18:
	tsubcctv %r16, 0x11af, %r26
	.word 0xe607e001  ! 51: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x9545c000  ! 52: RD_TICK_CMPR_REG	rd	%-, %r10
	ta	T_CHANGE_PRIV	! macro
debug_0_19:
	setx debug_0_19 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 54: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d802000  ! 55: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_20)) -> intp(0,1,3)
xir_0_20:
	.word 0xa9826001  ! 56: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	set 0x918ab260, %r28
	stxa %r28, [%g0] 0x73
intvec_0_21:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa26a2001  ! 58: UDIVX_I	udivx 	%r8, 0x0001, %r17
	.word 0xe25fe001  ! 59: LDX_I	ldx	[%r31 + 0x0001], %r17
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_0_22:
	setx 0xbf170c6017bbaae7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe327c010  ! 63: STF_R	st	%f17, [%r16, %r31]
	.word 0xad846001  ! 64: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
mondo_0_23:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c008  ! 65: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x879023a3  ! 66: WRPR_TT_I	wrpr	%r0, 0x03a3, %tt
	.word 0x93902004  ! 67: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe28008a0  ! 68: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x83d020b2  ! 69: Tcc_I	te	icc_or_xcc, %r0 + 178
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe327c008  ! 71: STF_R	st	%f17, [%r8, %r31]
	.word 0xe21fe001  ! 72: LDD_I	ldd	[%r31 + 0x0001], %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0x87520000  ! 74: RDPR_PIL	rdpr	%pil, %r3
	.word 0x8d903135  ! 75: WRPR_PSTATE_I	wrpr	%r0, 0x1135, %pstate
	ta	T_CHANGE_PRIV	! macro
tagged_0_24:
	tsubcctv %r2, 0x15e7, %r19
	.word 0xc607e001  ! 77: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x93d02035  ! 78: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xc717c000  ! 79: LDQF_R	-	[%r31, %r0], %f3
	set 0x358b6b93, %r28
	stxa %r28, [%g0] 0x73
intvec_0_25:
	.word 0x39400001  ! 80: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9702001  ! 81: POPC_I	popc	0x0001, %r20
	.word 0x9f802001  ! 82: SIR	sir	0x0001
	.word 0xab84c014  ! 83: WR_CLEAR_SOFTINT_R	wr	%r19, %r20, %clear_softint
	.word 0xe927e001  ! 84: STF_I	st	%f20, [0x0001, %r31]
intveclr_0_26:
	set 0x6afa35fa, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xad81e001  ! 86: WR_SOFTINT_REG_I	wr	%r7, 0x0001, %softint
	.word 0xa1902002  ! 87: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d903394  ! 88: WRPR_PSTATE_I	wrpr	%r0, 0x1394, %pstate
DS_0_27:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 89: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x87802089  ! 90: WRASI_I	wr	%r0, 0x0089, %asi
DS_0_28:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1322001  ! 1: STQF_I	-	%f16, [0x0001, %r8]
	normalw
	.word 0x9b458000  ! 91: RD_SOFTINT_REG	rd	%softint, %r13
intveclr_0_29:
	set 0x9b4dfc31, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 92: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 93: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d90205a  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0xdad7e030  ! 95: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0xdad7e020  ! 96: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0xdb37e001  ! 97: STQF_I	-	%f13, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_30)) -> intp(0,1,3)
xir_0_30:
	.word 0xa9816001  ! 98: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x91d02033  ! 99: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa5464000  ! 100: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x91702001  ! 101: POPC_I	popc	0x0001, %r8
intveclr_0_31:
	set 0x5fcfc531, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_32:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 103: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
	.word 0x93902006  ! 104: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd0c804a0  ! 105: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x95454000  ! 106: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	set 0xef255a95, %r28
	stxa %r28, [%g0] 0x73
intvec_0_33:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 108: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d02034  ! 109: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_0_34:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d904007  ! 110: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
	.word 0xd4bfe001  ! 111: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
	.word 0x32800001  ! 112: BNE	bne,a	<label_0x1>
debug_0_35:
	mov 0x38, %r18
	.word 0xfef00b12  ! 113: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_36:
	mov 8, %r18
	.word 0xe0f00852  ! 114: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x22800001  ! 115: BE	be,a	<label_0x1>
	set 0x1e78a4af, %r28
	stxa %r28, [%g0] 0x73
intvec_0_37:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91946001  ! 117: WRPR_PIL_I	wrpr	%r17, 0x0001, %pil
	.word 0x99454000  ! 118: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0x2a800001  ! 119: BCS	bcs,a	<label_0x1>
	.word 0x8d903d67  ! 120: WRPR_PSTATE_I	wrpr	%r0, 0x1d67, %pstate
	.word 0xd88008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
debug_0_38:
	mov 0x38, %r18
	.word 0xfef00b12  ! 122: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8800a60  ! 123: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_39)) -> intp(0,1,3)
xir_0_39:
	.word 0xa9842001  ! 124: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xd8dfe020  ! 125: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83a01972  ! 127: FqTOd	dis not found

	.word 0x91d02034  ! 128: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_0_41:
	mov 0x38, %r18
	.word 0xfef00b12  ! 129: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 130: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc2bfc032  ! 131: STDA_R	stda	%r1, [%r31 + %r18] 0x01
	.word 0x8d802000  ! 132: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc277c012  ! 133: STX_R	stx	%r1, [%r31 + %r18]
	.word 0xc207c000  ! 134: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xa1520000  ! 135: RDPR_PIL	rdpr	%pil, %r16
	.word 0xe057e001  ! 136: LDSH_I	ldsh	[%r31 + 0x0001], %r16
	.word 0x9b480000  ! 137: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
intveclr_0_42:
	set 0x60c8800d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 138: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda1fe001  ! 139: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x87902282  ! 140: WRPR_TT_I	wrpr	%r0, 0x0282, %tt
	.word 0x81460000  ! 141: RD_STICK_REG	stbar
	.word 0xda8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
mondo_0_43:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d944010  ! 143: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xda8008a0  ! 144: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_0_44:
	tsubcctv %r26, 0x149a, %r17
	.word 0xda07e001  ! 145: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x87802004  ! 146: WRASI_I	wr	%r0, 0x0004, %asi
debug_0_45:
	mov 8, %r18
	.word 0xd0f00852  ! 147: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xdad004a0  ! 148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xdad00e60  ! 149: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r13
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda800ba0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
DS_0_46:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 152: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x89540000  ! 153: RDPR_GL	rdpr	%-, %r4
debug_0_47:
	mov 0x38, %r18
	.word 0xfef00b12  ! 154: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_48)) -> intp(0,0,30)
intvec_0_48:
	.word 0x39400001  ! 155: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x304910ff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_49:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc8d804a0  ! 157: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0x9f802001  ! 158: SIR	sir	0x0001
splash_lsu_0_50:
	setx 0x52227e9717cb1069, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 159: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_0_51:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 160: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_52:
	setx debug_0_52 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 162: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200e  ! 163: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902005  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	set 0xd6126de1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_53:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_54:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 166: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_55:
	setx debug_0_55 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 167: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x95450000  ! 168: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd4d7e000  ! 169: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd48008a0  ! 170: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 171: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_0_56:
	setx 0xaa1ef1ac800815b7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd4ffc030  ! 173: SWAPA_R	swapa	%r10, [%r31 + %r16] 0x01
	.word 0xd4c00e40  ! 174: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r10
	.word 0xd4d004a0  ! 175: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x81454000  ! 176: RD_CLEAR_SOFTINT	stbar
splash_cmpr_0_57:
	setx 0x077c479439f0b34a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_58)) -> intp(0,1,3)
xir_0_58:
	.word 0xa9816001  ! 178: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x8f500000  ! 179: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 180: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce9fc020  ! 181: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
DS_0_59:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 182: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d903e8c  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x1e8c, %pstate
	.word 0x81510000  ! 184: RDPR_TICK	rdpr	%tick, %r0
debug_0_60:
	mov 8, %r18
	.word 0xdaf00852  ! 185: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xced00e40  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r7
	.word 0xce07c000  ! 187: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0x87902078  ! 188: WRPR_TT_I	wrpr	%r0, 0x0078, %tt
	.word 0x91d02034  ! 189: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_61:
	setx 0x8b652ac9c1ed7dda, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 190: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_62:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf7617aad	! Random illegal ?
	.word 0xe3124007  ! 1: LDQF_R	-	[%r9, %r7], %f17
	.word 0x81a50831  ! 191: FADDs	fadds	%f20, %f17, %f0
	.word 0x8b50c000  ! 192: RDPR_TT	<illegal instruction>
	.word 0x8d902b2c  ! 193: WRPR_PSTATE_I	wrpr	%r0, 0x0b2c, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_63)) -> intp(0,1,3)
xir_0_63:
	.word 0xa9802001  ! 194: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x87802004  ! 195: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa66a2001  ! 196: UDIVX_I	udivx 	%r8, 0x0001, %r19
	.word 0x8790213b  ! 197: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0xe797e001  ! 198: LDQFA_I	-	[%r31, 0x0001], %f19
	.word 0xe6c7e030  ! 199: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x93902001  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe68fe010  ! 201: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r19
	.word 0xa984c004  ! 202: WR_SET_SOFTINT_R	wr	%r19, %r4, %set_softint
	.word 0x87902013  ! 203: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
	.word 0x24800001  ! 204: BLE	ble,a	<label_0x1>
intveclr_0_64:
	set 0xea41c9a6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 205: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe010  ! 206: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0x93902000  ! 207: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x3e700001  ! 208: BPVC	<illegal instruction>
	.word 0x93902007  ! 209: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902002  ! 210: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_0_65:
	setx 0xe99592b1be6f3a4d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 211: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_66:
	mov 8, %r18
	.word 0xd2f00852  ! 212: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
DS_0_67:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f12, %f24
	.word 0xa3b30303  ! 213: ALIGNADDRESS	alignaddr	%r12, %r3, %r17
	.word 0x8d903701  ! 214: WRPR_PSTATE_I	wrpr	%r0, 0x1701, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_68)) -> intp(0,1,3)
xir_0_68:
	.word 0xa9836001  ! 215: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xe317c000  ! 216: LDQF_R	-	[%r31, %r0], %f17
	.word 0xe2cfe000  ! 217: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0xe2800b00  ! 218: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
	.word 0x9f802001  ! 219: SIR	sir	0x0001
	.word 0x8968c013  ! 220: SDIVX_R	sdivx	%r3, %r19, %r4
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_69)) -> intp(0,1,3)
xir_0_69:
	.word 0xa9816001  ! 221: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x87454000  ! 222: RD_CLEAR_SOFTINT	rd	%clear_softint, %r3
debug_0_70:
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 223: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93d020b4  ! 224: Tcc_I	tne	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 225: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc69fe001  ! 226: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xc6c7e010  ! 227: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
debug_0_71:
	mov 0x38, %r18
	.word 0xfef00b12  ! 228: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902003  ! 229: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_0_72:
	tsubcctv %r4, 0x1c7e, %r3
	.word 0xc607e001  ! 230: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_0_73:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f8, %f28
	.word 0x8fb2430b  ! 231: ALIGNADDRESS	alignaddr	%r9, %r11, %r7
	.word 0xcf1fe001  ! 232: LDDF_I	ldd	[%r31, 0x0001], %f7
intveclr_0_74:
	set 0x884ff20e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_75:
	set 0xff1167c4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 234: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xce57e001  ! 235: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0xced80e60  ! 236: LDXA_R	ldxa	[%r0, %r0] 0x73, %r7
DS_0_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 237: SAVE_R	save	%r31, %r0, %r31
intveclr_0_77:
	set 0xd312b6e2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 238: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902215  ! 239: WRPR_TT_I	wrpr	%r0, 0x0215, %tt
	.word 0xcec004a0  ! 240: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
tagged_0_78:
	tsubcctv %r12, 0x1f6d, %r22
	.word 0xce07e001  ! 241: LDUW_I	lduw	[%r31 + 0x0001], %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r7
splash_lsu_0_79:
	setx 0x8276216ed7c68f89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce27e001  ! 244: STW_I	stw	%r7, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_80)) -> intp(0,0,4)
intvec_0_80:
	.word 0x39400001  ! 245: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xce4fc000  ! 246: LDSB_R	ldsb	[%r31 + %r0], %r7
splash_lsu_0_81:
	setx 0x3db358fd49e34059, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_82)) -> intp(0,1,3)
xir_0_82:
	.word 0xa9842001  ! 248: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
splash_cmpr_0_83:
	setx 0xc0a38094790d4226, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 249: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce1fc000  ! 250: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce97e010  ! 251: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0x93902006  ! 252: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_84:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940004  ! 253: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0xce1fe001  ! 254: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0xce57e001  ! 255: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x87802063  ! 256: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x34700001  ! 257: BPG	<illegal instruction>
	.word 0xa190200d  ! 258: WRPR_GL_I	wrpr	%r0, 0x000d, %-
tagged_0_85:
	taddcctv %r24, 0x1a0a, %r9
	.word 0xce07e001  ! 259: LDUW_I	lduw	[%r31 + 0x0001], %r7
debug_0_86:
	mov 0x38, %r18
	.word 0xfef00b12  ! 260: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91540000  ! 261: RDPR_GL	rdpr	%-, %r8
	set 0x17570df, %r28
	stxa %r28, [%g0] 0x73
intvec_0_87:
	.word 0x39400001  ! 262: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_88)) -> intp(0,0,3)
intvec_0_88:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902003  ! 265: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_0_89:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 266: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd11fe001  ! 267: LDDF_I	ldd	[%r31, 0x0001], %f8
	.word 0xd08804a0  ! 268: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xa9844001  ! 269: WR_SET_SOFTINT_R	wr	%r17, %r1, %set_softint
DS_0_90:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc5352001  ! 1: STQF_I	-	%f2, [0x0001, %r20]
	normalw
	.word 0xa7458000  ! 270: RD_SOFTINT_REG	rd	%softint, %r19
splash_tba_0_91:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 271: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_92:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe627e001  ! 273: STW_I	stw	%r19, [%r31 + 0x0001]
	.word 0x8da1cd2c  ! 274: FsMULd	fsmuld	%f7, %f12, %f6
intveclr_0_93:
	set 0x6d6239e9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 275: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_94:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc3310004  ! 1: STQF_R	-	%f1, [%r4, %r4]
	normalw
	.word 0xa5458000  ! 276: RD_SOFTINT_REG	rd	%softint, %r18
change_to_randtl_0_95:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_95:
	.word 0x8f902004  ! 277: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe4900e80  ! 278: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
change_to_randtl_0_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_96:
	.word 0x8f902001  ! 279: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x22700001  ! 280: BPE	<illegal instruction>
	.word 0xe40fe001  ! 281: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0x93902000  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200e  ! 283: WRPR_GL_I	wrpr	%r0, 0x000e, %-
intveclr_0_97:
	set 0x6813cceb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a449ab  ! 285: FDIVs	fdivs	%f17, %f11, %f19
	.word 0x87802055  ! 286: WRASI_I	wr	%r0, 0x0055, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_98)) -> intp(0,0,14)
intvec_0_98:
	.word 0x39400001  ! 287: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 288: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xe6800c60  ! 289: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
	.word 0xa1450000  ! 290: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xe197e001  ! 291: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0x93902003  ! 292: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe00fc000  ! 293: LDUB_R	ldub	[%r31 + %r0], %r16
	set 0xdc36458b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_99:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8b464000  ! 295: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0x91d02033  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02034  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xcac004a0  ! 298: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
debug_0_100:
	setx debug_0_100 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xcacfe000  ! 300: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
DS_0_101:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f30, %f12
	.word 0xa3b40305  ! 301: ALIGNADDRESS	alignaddr	%r16, %r5, %r17
	.word 0xe2d7e010  ! 302: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
	.word 0x28700001  ! 303: BPLEU	<illegal instruction>
intveclr_0_102:
	set 0xb2cd275b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 304: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe2d7e010  ! 305: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
	.word 0x9b464000  ! 306: RD_STICK_CMPR_REG	rd	%-, %r13
	set 0x68baeb1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_103:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 308: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb27c005  ! 309: STF_R	st	%f13, [%r5, %r31]
DS_0_104:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 310: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
debug_0_105:
	mov 8, %r18
	.word 0xe8f00852  ! 311: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x8cd8c00c  ! 312: SMULcc_R	smulcc 	%r3, %r12, %r6
	.word 0xa3450000  ! 313: RD_SET_SOFTINT	rd	%set_softint, %r17
DS_0_106:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 314: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 315: SIR	sir	0x0001
	.word 0xa9814002  ! 316: WR_SET_SOFTINT_R	wr	%r5, %r2, %set_softint
change_to_randtl_0_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_107:
	.word 0x8f902003  ! 317: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02034  ! 318: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87902327  ! 319: WRPR_TT_I	wrpr	%r0, 0x0327, %tt
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 320: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe29fe001  ! 321: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	.word 0x91a000d0  ! 322: FNEGd	fnegd	%f16, %f8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_108)) -> intp(0,0,27)
intvec_0_108:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_109)) -> intp(0,1,3)
xir_0_109:
	.word 0xa9826001  ! 324: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
mondo_0_110:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d904006  ! 326: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	set 0x996c68df, %r28
	stxa %r28, [%g0] 0x73
intvec_0_111:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x22800001  ! 328: BE	be,a	<label_0x1>
	.word 0x8d802004  ! 329: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 330: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_112:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 331: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0d804a0  ! 333: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xd0d7e010  ! 334: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
splash_lsu_0_113:
	setx 0x5ae620d55db11ced, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 335: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902134  ! 336: WRPR_TT_I	wrpr	%r0, 0x0134, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_114)) -> intp(0,0,17)
intvec_0_114:
	.word 0x39400001  ! 337: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790203b  ! 338: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
	.word 0xd0c004a0  ! 339: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_115)) -> intp(0,1,3)
xir_0_115:
	.word 0xa9846001  ! 340: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
tagged_0_116:
	tsubcctv %r13, 0x1961, %r22
	.word 0xd007e001  ! 341: LDUW_I	lduw	[%r31 + 0x0001], %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_117)) -> intp(0,1,3)
xir_0_117:
	.word 0xa9806001  ! 342: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
debug_0_118:
	setx debug_0_118 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 344: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c804a0  ! 346: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
debug_0_119:
	mov 0x38, %r18
	.word 0xfef00b12  ! 347: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd09fe001  ! 348: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
debug_0_120:
	mov 8, %r18
	.word 0xe2f00852  ! 349: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 350: LDX_R	ldx	[%r31 + %r0], %r8
splash_htba_0_121:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 351: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8780204f  ! 352: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd08804a0  ! 353: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 354: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_0_122:
	setx 0x79405eb9bb7f69a6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 355: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd127c014  ! 356: STF_R	st	%f8, [%r20, %r31]
	.word 0x8d9027bd  ! 357: WRPR_PSTATE_I	wrpr	%r0, 0x07bd, %pstate
debug_0_123:
	mov 8, %r18
	.word 0xdcf00852  ! 358: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xd137c014  ! 359: STQF_R	-	%f8, [%r20, %r31]
	.word 0x8790224c  ! 360: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
intveclr_0_124:
	set 0x7b738155, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0dfe020  ! 362: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 363: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 364: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd03fc014  ! 365: STD_R	std	%r8, [%r31 + %r20]
mondo_0_125:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d90c010  ! 366: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0x91d02034  ! 367: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_126:
	setx 0x732beb62f2799780, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x2a800001  ! 369: BCS	bcs,a	<label_0x1>
	.word 0x81510000  ! 370: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d450000  ! 371: RD_SET_SOFTINT	rd	%set_softint, %r6
	.word 0xcc5fe001  ! 372: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x20800001  ! 373: BN	bn,a	<label_0x1>
	set 0x9cf662b7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_127:
	.word 0x39400001  ! 374: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_128)) -> intp(0,1,3)
xir_0_128:
	.word 0xa9812001  ! 375: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
intveclr_0_129:
	set 0x36dc8346, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 376: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcc57c000  ! 377: LDSH_R	ldsh	[%r31 + %r0], %r6
mondo_0_130:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d94400d  ! 378: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	.word 0xa1902008  ! 379: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_131:
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982857  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
splash_htba_0_132:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 382: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902000  ! 383: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02033  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa5a000d4  ! 385: FNEGd	fnegd	%f20, %f18
splash_cmpr_0_133:
	setx 0x052b994336162334, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 386: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_134:
	mov 0x38, %r18
	.word 0xfef00b12  ! 387: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_135:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d940008  ! 388: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0xe48008a0  ! 389: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe497e000  ! 390: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
debug_0_136:
	setx debug_0_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 391: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x32700001  ! 392: BPNE	<illegal instruction>
	set 0x2dfba9be, %r28
	stxa %r28, [%g0] 0x73
intvec_0_137:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 394: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x97540000  ! 395: RDPR_GL	rdpr	%-, %r11
tagged_0_138:
	tsubcctv %r24, 0x1fff, %r9
	.word 0xd607e001  ! 396: LDUW_I	lduw	[%r31 + 0x0001], %r11
splash_cmpr_0_139:
	setx 0x9391b6a68887754f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 397: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902005  ! 398: WRPR_GL_I	wrpr	%r0, 0x0005, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_140)) -> intp(0,1,3)
xir_0_140:
	.word 0xa981e001  ! 399: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xd6c00e80  ! 400: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	.word 0xd697e030  ! 401: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
splash_lsu_0_141:
	setx 0x419df8889a05cbd9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 402: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x30700001  ! 403: BPA	<illegal instruction>
	.word 0xd6dfe030  ! 404: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x91d020b5  ! 405: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_142:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d904004  ! 407: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0xd727e001  ! 408: STF_I	st	%f11, [0x0001, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 409: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982ad7  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad7, %hpstate
	.word 0x87500000  ! 411: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d903130  ! 412: WRPR_PSTATE_I	wrpr	%r0, 0x1130, %pstate
	.word 0x9f802001  ! 413: SIR	sir	0x0001
	.word 0xa1902005  ! 414: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802063  ! 415: WRASI_I	wr	%r0, 0x0063, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_143)) -> intp(0,1,3)
xir_0_143:
	.word 0xa982e001  ! 416: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 417: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_144)) -> intp(0,0,6)
intvec_0_144:
	.word 0x39400001  ! 418: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc6bfc024  ! 419: STDA_R	stda	%r3, [%r31 + %r4] 0x01
	.word 0x87802016  ! 420: WRASI_I	wr	%r0, 0x0016, %asi
debug_0_145:
	setx debug_0_145 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 421: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_146:
	setx 0x131c9ec084db6778, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_147:
	mov 8, %r18
	.word 0xd2f00852  ! 423: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_0_148:
	setx debug_0_148 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 424: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902004  ! 425: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x879022bd  ! 426: WRPR_TT_I	wrpr	%r0, 0x02bd, %tt
	.word 0xad80a001  ! 427: WR_SOFTINT_REG_I	wr	%r2, 0x0001, %softint
	.word 0xc6c804a0  ! 428: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x83480000  ! 429: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc22fc004  ! 430: STB_R	stb	%r1, [%r31 + %r4]
tagged_0_149:
	taddcctv %r5, 0x1d78, %r21
	.word 0xc207e001  ! 431: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_lsu_0_150:
	setx 0x934052209acaaf4f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d8a  ! 433: WRPR_PSTATE_I	wrpr	%r0, 0x0d8a, %pstate
	set 0x615b9b5f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_151:
	.word 0x39400001  ! 434: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 435: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc31fc000  ! 436: LDDF_R	ldd	[%r31, %r0], %f1
debug_0_152:
	mov 0x38, %r18
	.word 0xfef00b12  ! 437: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_153:
	setx 0x63099237e7102479, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 438: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_154)) -> intp(0,0,10)
intvec_0_154:
	.word 0x39400001  ! 439: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 440: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc23fc004  ! 441: STD_R	std	%r1, [%r31 + %r4]
	.word 0xc24fc000  ! 442: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xa190200c  ! 443: WRPR_GL_I	wrpr	%r0, 0x000c, %-
intveclr_0_155:
	set 0xdf3c135d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 444: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_156)) -> intp(0,0,27)
intvec_0_156:
	.word 0x39400001  ! 445: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 446: SIR	sir	0x0001
	.word 0x879023f9  ! 447: WRPR_TT_I	wrpr	%r0, 0x03f9, %tt
	.word 0xc2cfe030  ! 448: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
splash_lsu_0_157:
	setx 0x4db91e8ee2a4b9bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_158:
	setx 0xebcd920caf1798d7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 450: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc33fe001  ! 451: STDF_I	std	%f1, [0x0001, %r31]
splash_lsu_0_159:
	setx 0x96c260d2847af899, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 452: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902639  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x0639, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 454: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x81510000  ! 455: RDPR_TICK	rdpr	%tick, %r0
DS_0_160:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xab5a3cf9	! Random illegal ?
	.word 0xd5150013  ! 1: LDQF_R	-	[%r20, %r19], %f10
	.word 0x95a2882d  ! 456: FADDs	fadds	%f10, %f13, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89686001  ! 457: SDIVX_I	sdivx	%r1, 0x0001, %r4
	.word 0xc847e001  ! 458: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0xc89fe001  ! 459: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_162)) -> intp(0,1,3)
xir_0_162:
	.word 0xa9846001  ! 460: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
DS_0_163:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc732c00a  ! 1: STQF_R	-	%f3, [%r10, %r11]
	normalw
	.word 0x91458000  ! 461: RD_SOFTINT_REG	rd	%softint, %r8
debug_0_164:
	mov 0x38, %r18
	.word 0xfef00b12  ! 462: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x3cac99b1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_165:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd097e030  ! 464: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0xd0bfc02a  ! 465: STDA_R	stda	%r8, [%r31 + %r10] 0x01
debug_0_166:
	setx debug_0_166 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 466: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_167:
	setx 0x9f684a9b4648a504, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 467: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_168:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 468: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_0_169:
	setx 0x05152c7e9fc10545, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 469: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_170:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc9308012  ! 1: STQF_R	-	%f4, [%r18, %r2]
	normalw
	.word 0x93458000  ! 470: RD_SOFTINT_REG	rd	%softint, %r9
mondo_0_171:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90c00a  ! 471: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0x8790218c  ! 472: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
	.word 0x83d02033  ! 473: Tcc_I	te	icc_or_xcc, %r0 + 51
intveclr_0_172:
	set 0xc75553fb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 474: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd21fe001  ! 475: LDD_I	ldd	[%r31 + 0x0001], %r9
	set 0x92f5f3d2, %r28
	stxa %r28, [%g0] 0x73
intvec_0_173:
	.word 0x39400001  ! 476: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2c7e000  ! 477: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	.word 0xa1902005  ! 478: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xab81c00c  ! 479: WR_CLEAR_SOFTINT_R	wr	%r7, %r12, %clear_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_174)) -> intp(0,0,27)
intvec_0_174:
	.word 0x39400001  ! 480: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe001  ! 481: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x93902002  ! 482: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9968c00b  ! 483: SDIVX_R	sdivx	%r3, %r11, %r12
	.word 0xd91fc000  ! 484: LDDF_R	ldd	[%r31, %r0], %f12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 485: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 486: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd80fe001  ! 487: LDUB_I	ldub	[%r31 + 0x0001], %r12
	set 0x2979ac84, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd857e001  ! 489: LDSH_I	ldsh	[%r31 + 0x0001], %r12
intveclr_0_176:
	set 0xc017226f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 490: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_177:
	mov 8, %r18
	.word 0xdaf00852  ! 491: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_lsu_0_178:
	setx 0x2723a426cf19f3e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 492: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_179:
	taddcctv %r26, 0x173a, %r9
	.word 0xd807e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd88008a0  ! 494: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_0_180:
	set 0xeb40a230, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 495: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_181:
	taddcctv %r2, 0x1621, %r17
	.word 0xd807e001  ! 496: LDUW_I	lduw	[%r31 + 0x0001], %r12
debug_0_182:
	mov 0x38, %r18
	.word 0xfef00b12  ! 497: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_183:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d920006  ! 498: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	.word 0xa1902003  ! 499: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93500000  ! 500: RDPR_TPC	rdpr	%tpc, %r9
splash_cmpr_0_184:
	setx 0xb6876d0ffb7554a5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 501: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd28008a0  ! 502: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
debug_0_185:
	mov 0x38, %r18
	.word 0xfef00b12  ! 503: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_186:
	mov 8, %r18
	.word 0xe4f00852  ! 504: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
splash_htba_0_187:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 505: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_0_188:
	setx 0x741169c2a17496d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 506: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200a  ! 507: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8780201c  ! 508: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd23fe001  ! 509: STD_I	std	%r9, [%r31 + 0x0001]
	set 0x8c08a02b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_189:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 511: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_190)) -> intp(0,0,8)
intvec_0_190:
	.word 0x39400001  ! 512: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_191:
	set 0x3e3fa3d8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 514: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87540000  ! 515: RDPR_GL	rdpr	%-, %r3
splash_htba_0_192:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 516: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_193:
	setx 0x439fa2ce7153caa7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 517: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 518: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_194)) -> intp(0,0,2)
intvec_0_194:
	.word 0x39400001  ! 520: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 521: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_196)) -> intp(0,0,1)
intvec_0_196:
	.word 0x39400001  ! 522: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9350c000  ! 523: RDPR_TT	rdpr	%tt, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_197)) -> intp(0,1,3)
xir_0_197:
	.word 0xa980e001  ! 524: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
splash_lsu_0_198:
	setx 0x9797464fb78de811, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 525: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd227e001  ! 526: STW_I	stw	%r9, [%r31 + 0x0001]
	.word 0xa190200c  ! 527: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	set 0x127aa52, %r28
	stxa %r28, [%g0] 0x73
intvec_0_199:
	.word 0x39400001  ! 528: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198275d  ! 529: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
splash_lsu_0_200:
	setx 0x20fe68b297ded8a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 530: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023d8  ! 531: WRPR_PSTATE_I	wrpr	%r0, 0x03d8, %pstate
	.word 0x8d903587  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x1587, %pstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 533: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd397e001  ! 534: LDQFA_I	-	[%r31, 0x0001], %f9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_201)) -> intp(0,1,3)
xir_0_201:
	.word 0xa9826001  ! 535: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_202)) -> intp(0,1,3)
xir_0_202:
	.word 0xa9816001  ! 536: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x99902005  ! 537: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd29fc020  ! 538: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2c7e000  ! 539: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
debug_0_203:
	mov 0x38, %r18
	.word 0xfef00b12  ! 540: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd2800be0  ! 541: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
splash_cmpr_0_204:
	setx 0xf6d4bd80d3f646e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 542: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e020  ! 543: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x8d903cef  ! 544: WRPR_PSTATE_I	wrpr	%r0, 0x1cef, %pstate
	.word 0x87802058  ! 545: WRASI_I	wr	%r0, 0x0058, %asi
debug_0_205:
	setx debug_0_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 546: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 547: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 548: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd28804a0  ! 549: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd2800bc0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
	.word 0xd227e001  ! 551: STW_I	stw	%r9, [%r31 + 0x0001]
splash_cmpr_0_206:
	setx 0x7139fdbd78b64001, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 552: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd21fc000  ! 553: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x8d9026c7  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0xa1480000  ! 555: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
debug_0_207:
	mov 8, %r18
	.word 0xe4f00852  ! 556: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
intveclr_0_208:
	set 0x39f09fc3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 557: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe137c009  ! 558: STQF_R	-	%f16, [%r9, %r31]
	.word 0x87802004  ! 559: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902003  ! 560: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802020  ! 561: WRASI_I	wr	%r0, 0x0020, %asi
	set 0x147876e5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_209:
	.word 0x39400001  ! 562: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b2  ! 563: Tcc_I	tne	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_210)) -> intp(0,0,13)
intvec_0_210:
	.word 0x39400001  ! 564: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_211:
	taddcctv %r4, 0x1bed, %r19
	.word 0xe007e001  ! 565: LDUW_I	lduw	[%r31 + 0x0001], %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_212)) -> intp(0,0,30)
intvec_0_212:
	.word 0x39400001  ! 566: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_213:
	mov 8, %r18
	.word 0xdaf00852  ! 567: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x9f802001  ! 568: SIR	sir	0x0001
	.word 0xe05fe001  ! 569: LDX_I	ldx	[%r31 + 0x0001], %r16
	.word 0x2c700001  ! 570: BPNEG	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_214)) -> intp(0,0,30)
intvec_0_214:
	.word 0x39400001  ! 571: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_215)) -> intp(0,1,3)
xir_0_215:
	.word 0xa9802001  ! 572: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_216)) -> intp(0,1,3)
xir_0_216:
	.word 0xa9806001  ! 573: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902285  ! 575: WRPR_TT_I	wrpr	%r0, 0x0285, %tt
	.word 0x93902007  ! 576: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_217:
	set 0xc0134bd7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 577: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_218:
	tsubcctv %r21, 0x1112, %r13
	.word 0xe007e001  ! 578: LDUW_I	lduw	[%r31 + 0x0001], %r16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 579: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_219:
	taddcctv %r4, 0x11d9, %r8
	.word 0xe007e001  ! 580: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe01fe001  ! 581: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0x8d903d37  ! 582: WRPR_PSTATE_I	wrpr	%r0, 0x1d37, %pstate
	.word 0x93902000  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 584: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5500000  ! 585: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xad84e001  ! 586: WR_SOFTINT_REG_I	wr	%r19, 0x0001, %softint
	.word 0x99902000  ! 587: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa984800a  ! 588: WR_SET_SOFTINT_R	wr	%r18, %r10, %set_softint
	.word 0x8d9030cd  ! 589: WRPR_PSTATE_I	wrpr	%r0, 0x10cd, %pstate
	.word 0xe407c000  ! 590: LDUW_R	lduw	[%r31 + %r0], %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_220)) -> intp(0,1,3)
xir_0_220:
	.word 0xa982a001  ! 591: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x97520000  ! 592: RDPR_PIL	<illegal instruction>
mondo_0_221:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c000  ! 593: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	.word 0xd647c000  ! 594: LDSW_R	ldsw	[%r31 + %r0], %r11
splash_lsu_0_222:
	setx 0x6e4c8b6023c77131, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 595: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
DS_0_223:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 597: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd7e7c020  ! 598: CASA_I	casa	[%r31] 0x 1, %r0, %r11
mondo_0_224:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d900008  ! 599: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c2001  ! 600: SDIVX_I	sdivx	%r16, 0x0001, %r8
intveclr_0_226:
	set 0xe12db6b1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 601: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_227:
	setx 0x681cdb08fbe6048f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 602: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 603: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_228:
	setx 0x1cbdf7902e22614c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 604: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd04fc000  ! 605: LDSB_R	ldsb	[%r31 + %r0], %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903434  ! 607: WRPR_PSTATE_I	wrpr	%r0, 0x1434, %pstate
intveclr_0_229:
	set 0x6b384f41, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 608: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_230)) -> intp(0,0,20)
intvec_0_230:
	.word 0x39400001  ! 609: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_231:
	taddcctv %r7, 0x193f, %r11
	.word 0xd007e001  ! 610: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd0800c60  ! 611: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 612: LDX_R	ldx	[%r31 + %r0], %r8
debug_0_232:
	setx debug_0_232 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 613: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902001  ! 614: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd09fc020  ! 615: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd127e001  ! 616: STF_I	st	%f8, [0x0001, %r31]
	set 0x34397f47, %r28
	stxa %r28, [%g0] 0x73
intvec_0_233:
	.word 0x39400001  ! 617: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a01972  ! 618: FqTOd	dis not found

	.word 0xc6c7e020  ! 619: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 620: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_235:
	setx 0x713557640a6f03c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 621: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc737c012  ! 622: STQF_R	-	%f3, [%r18, %r31]
	.word 0x87802010  ! 623: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 624: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc68fe010  ! 625: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	.word 0xc68008a0  ! 626: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
debug_0_236:
	mov 0x38, %r18
	.word 0xfef00b12  ! 627: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9550c000  ! 628: RDPR_TT	rdpr	%tt, %r10
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_237)) -> intp(0,1,3)
xir_0_237:
	.word 0xa984e001  ! 629: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 630: LDX_R	ldx	[%r31 + %r0], %r10
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 631: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 632: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_238)) -> intp(0,0,5)
intvec_0_238:
	.word 0x39400001  ! 633: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_239:
	mov 0x38, %r18
	.word 0xfef00b12  ! 634: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x32800001  ! 635: BNE	bne,a	<label_0x1>
splash_cmpr_0_240:
	setx 0x0c760055607f0203, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 636: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd48008a0  ! 637: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_0_241:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 638: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
DS_0_242:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 639: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902f87  ! 640: WRPR_PSTATE_I	wrpr	%r0, 0x0f87, %pstate
	.word 0x8790208a  ! 641: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	.word 0x91d02034  ! 642: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_0_243:
	setx 0xbc5d77572dd707e4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 644: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_244:
	setx debug_0_244 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 645: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_245:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f22, %f8
	.word 0x81b10311  ! 646: ALIGNADDRESS	alignaddr	%r4, %r17, %r0
	.word 0x8d903590  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1590, %pstate
	.word 0xc04fe001  ! 648: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xc0d804a0  ! 649: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
mondo_0_246:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d908000  ! 650: WRPR_WSTATE_R	wrpr	%r2, %r0, %wstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_247:
	setx debug_0_247 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 653: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_248:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d904006  ! 654: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 655: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 656: LDX_R	ldx	[%r31 + %r0], %r0
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 657: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc137e001  ! 658: STQF_I	-	%f0, [0x0001, %r31]
debug_0_249:
	mov 8, %r18
	.word 0xe6f00852  ! 659: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xc057e001  ! 660: LDSH_I	ldsh	[%r31 + 0x0001], %r0
mondo_0_250:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d904014  ! 661: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
splash_lsu_0_251:
	setx 0xe4dd6ed164d3ee7b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 662: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 663: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc0dfe020  ! 664: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
splash_cmpr_0_252:
	setx 0x6c505865602f512a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 665: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_0_253:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 666: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_254:
	setx 0x1df726d0892131cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 667: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc08008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87802088  ! 669: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692001  ! 670: SDIVX_I	sdivx	%r4, 0x0001, %r16
	.word 0xa190200e  ! 671: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x879022c0  ! 672: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0x91d020b4  ! 673: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x93902002  ! 674: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe08804a0  ! 675: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
splash_cmpr_0_256:
	setx 0x1a82565b95681591, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 676: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_257)) -> intp(0,1,3)
xir_0_257:
	.word 0xa9826001  ! 677: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xe13fe001  ! 678: STDF_I	std	%f16, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_258)) -> intp(0,0,4)
intvec_0_258:
	.word 0x39400001  ! 679: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_259:
	taddcctv %r12, 0x1d4b, %r22
	.word 0xe007e001  ! 680: LDUW_I	lduw	[%r31 + 0x0001], %r16
DS_0_260:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xef6efaf8	! Random illegal ?
	.word 0x87a00553  ! 1: FSQRTd	fsqrt	
	.word 0x95a2c82c  ! 681: FADDs	fadds	%f11, %f12, %f10
	.word 0x8d802004  ! 682: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd597e001  ! 683: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x93902002  ! 684: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	set 0x8877fd12, %r28
	stxa %r28, [%g0] 0x73
intvec_0_261:
	.word 0x39400001  ! 685: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_262:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5340007  ! 1: STQF_R	-	%f10, [%r7, %r16]
	normalw
	.word 0xa1458000  ! 686: RD_SOFTINT_REG	rd	%softint, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_263)) -> intp(0,1,3)
xir_0_263:
	.word 0xa980e001  ! 687: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
DS_0_264:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x93b10303  ! 688: ALIGNADDRESS	alignaddr	%r4, %r3, %r9
	.word 0xd28008a0  ! 689: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_265:
	setx debug_0_265 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 692: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_266:
	tsubcctv %r17, 0x1858, %r11
	.word 0xd207e001  ! 693: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd257e001  ! 694: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd29fe001  ! 695: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
DS_0_267:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0x8da4c831  ! 696: FADDs	fadds	%f19, %f17, %f6
	.word 0x87802016  ! 697: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 698: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_268)) -> intp(0,1,3)
xir_0_268:
	.word 0xa982e001  ! 699: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x3a800001  ! 700: BCC	bcc,a	<label_0x1>
DS_0_269:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 701: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x22700001  ! 702: BPE	<illegal instruction>
	.word 0x95a0054d  ! 703: FSQRTd	fsqrt	
	.word 0xd48008a0  ! 704: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 705: LDQFA_I	-	[%r31, 0x0001], %f10
splash_lsu_0_270:
	setx 0x370a5a637f1c2d65, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 706: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd407c000  ! 707: LDUW_R	lduw	[%r31 + %r0], %r10
debug_0_271:
	setx debug_0_271 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 708: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_272)) -> intp(0,0,12)
intvec_0_272:
	.word 0x39400001  ! 709: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 710: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 711: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd4800b40  ! 712: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
intveclr_0_273:
	set 0xca66f17e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 713: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd48008a0  ! 715: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_274)) -> intp(0,1,3)
xir_0_274:
	.word 0xa9812001  ! 716: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
splash_cmpr_0_275:
	setx 0xb4c3f38b39ae6aed, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 717: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902002  ! 718: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd4dfe030  ! 719: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0xd517c000  ! 720: LDQF_R	-	[%r31, %r0], %f10
	.word 0x9345c000  ! 721: RD_TICK_CMPR_REG	rd	%-, %r9
splash_lsu_0_276:
	setx 0xcab3ab6291f95a95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 722: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_277:
	setx debug_0_277 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 723: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_278)) -> intp(0,0,14)
intvec_0_278:
	.word 0x39400001  ! 724: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_279:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3108013  ! 1: LDQF_R	-	[%r2, %r19], %f17
	.word 0xa3a4082c  ! 725: FADDs	fadds	%f16, %f12, %f17
mondo_0_280:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c001  ! 726: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
	.word 0x93902001  ! 727: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81460000  ! 728: RD_STICK_REG	stbar
	.word 0x32800001  ! 729: BNE	bne,a	<label_0x1>
	.word 0x8780201c  ! 730: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa968800d  ! 731: SDIVX_R	sdivx	%r2, %r13, %r20
change_to_randtl_0_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_281:
	.word 0x8f902003  ! 732: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe917c000  ! 733: LDQF_R	-	[%r31, %r0], %f20
	.word 0x8d802000  ! 734: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_282)) -> intp(0,1,3)
xir_0_282:
	.word 0xa984e001  ! 735: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x93902002  ! 736: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_0_283:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d930012  ! 737: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0x87802058  ! 738: WRASI_I	wr	%r0, 0x0058, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_284)) -> intp(0,1,3)
xir_0_284:
	.word 0xa984a001  ! 739: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	set 0xfe78ba26, %r28
	stxa %r28, [%g0] 0x73
intvec_0_285:
	.word 0x39400001  ! 740: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe857c000  ! 741: LDSH_R	ldsh	[%r31 + %r0], %r20
debug_0_286:
	setx debug_0_286 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 742: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_287:
	taddcctv %r23, 0x153f, %r13
	.word 0xe807e001  ! 743: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x81460000  ! 744: RD_STICK_REG	stbar
	.word 0xe93fe001  ! 745: STDF_I	std	%f20, [0x0001, %r31]
	.word 0x32700001  ! 746: BPNE	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_288)) -> intp(0,0,31)
intvec_0_288:
	.word 0x39400001  ! 747: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 748: FqTOd	dis not found

splash_lsu_0_290:
	setx 0x545e2676d477955b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 749: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 750: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe69fe001  ! 751: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
splash_htba_0_291:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 752: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b2  ! 753: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d802004  ! 754: WRFPRS_I	wr	%r0, 0x0004, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_292)) -> intp(0,0,1)
intvec_0_292:
	.word 0x39400001  ! 755: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe6d7e000  ! 756: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
splash_cmpr_0_293:
	setx 0x593b3df0987a4217, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 757: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xe69fc020  ! 759: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
splash_htba_0_294:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 760: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe71fe001  ! 761: LDDF_I	ldd	[%r31, 0x0001], %f19
	set 0xd1d2af4e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_295:
	.word 0x39400001  ! 762: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_296)) -> intp(0,0,23)
intvec_0_296:
	.word 0x39400001  ! 763: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xdf5764ca, %r28
	stxa %r28, [%g0] 0x73
intvec_0_297:
	.word 0x39400001  ! 764: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcb34e001  ! 1: STQF_I	-	%f5, [0x0001, %r19]
	normalw
	.word 0xa9458000  ! 765: RD_SOFTINT_REG	rd	%softint, %r20
	set 0xb45b1e95, %r28
	stxa %r28, [%g0] 0x73
intvec_0_299:
	.word 0x39400001  ! 766: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x976a8006  ! 767: SDIVX_R	sdivx	%r10, %r6, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd647c000  ! 769: LDSW_R	ldsw	[%r31 + %r0], %r11
splash_cmpr_0_300:
	setx 0x7625649ce89191fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 770: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802001  ! 771: SIR	sir	0x0001
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_301)) -> intp(0,1,3)
xir_0_301:
	.word 0xa9806001  ! 772: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0xd6c804a0  ! 773: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(0,0,29)
intvec_0_302:
	.word 0x39400001  ! 774: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020f0  ! 775: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x866ce001  ! 777: UDIVX_I	udivx 	%r19, 0x0001, %r3
	.word 0xa1902007  ! 778: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 779: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x99902005  ! 780: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	set 0xd52e1bea, %r28
	stxa %r28, [%g0] 0x73
intvec_0_303:
	.word 0x39400001  ! 781: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_304:
	set 0xb7c702e5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 782: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_305)) -> intp(0,1,3)
xir_0_305:
	.word 0xa982e001  ! 783: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_306)) -> intp(0,1,3)
xir_0_306:
	.word 0xa9802001  ! 784: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xa190200b  ! 785: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_0_307:
	setx 0x4973226670a07391, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 786: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_308)) -> intp(0,1,3)
xir_0_308:
	.word 0xa9846001  ! 787: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xc68008a0  ! 788: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
tagged_0_309:
	taddcctv %r3, 0x1289, %r2
	.word 0xc607e001  ! 789: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc727e001  ! 790: STF_I	st	%f3, [0x0001, %r31]
tagged_0_310:
	tsubcctv %r20, 0x1cda, %r18
	.word 0xc607e001  ! 791: LDUW_I	lduw	[%r31 + 0x0001], %r3
debug_0_311:
	mov 0x38, %r18
	.word 0xfef00b12  ! 792: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_312:
	mov 8, %r18
	.word 0xd4f00852  ! 793: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xc67fe001  ! 794: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0xc69004a0  ! 795: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0xa1902008  ! 796: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 797: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790202c  ! 798: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902fdb  ! 800: WRPR_PSTATE_I	wrpr	%r0, 0x0fdb, %pstate
	.word 0xc6dfe020  ! 801: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
debug_0_313:
	setx debug_0_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 802: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 803: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02034  ! 804: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_0_314:
	set 0x6f8b56c0, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 805: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 806: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xab848002  ! 807: WR_CLEAR_SOFTINT_R	wr	%r18, %r2, %clear_softint
	.word 0x8790201f  ! 808: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
DS_0_315:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa1b2c304  ! 809: ALIGNADDRESS	alignaddr	%r11, %r4, %r16
splash_cmpr_0_316:
	setx 0x5e5d92ec57eefc44, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 810: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe09fe001  ! 811: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
DS_0_317:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 812: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe13fe001  ! 813: STDF_I	std	%f16, [0x0001, %r31]
debug_0_318:
	mov 8, %r18
	.word 0xdcf00852  ! 814: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 815: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_0_319:
	taddcctv %r11, 0x1b3d, %r6
	.word 0xe007e001  ! 816: LDUW_I	lduw	[%r31 + 0x0001], %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_320)) -> intp(0,0,22)
intvec_0_320:
	.word 0x39400001  ! 817: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0d7e030  ! 818: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_0_321:
	mov 8, %r18
	.word 0xe2f00852  ! 819: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xe027e001  ! 820: STW_I	stw	%r16, [%r31 + 0x0001]
	.word 0x9f802001  ! 821: SIR	sir	0x0001
	.word 0xe127e001  ! 822: STF_I	st	%f16, [0x0001, %r31]
	.word 0x9ba4c9b2  ! 823: FDIVs	fdivs	%f19, %f18, %f13
	.word 0xa9a489b3  ! 824: FDIVs	fdivs	%f18, %f19, %f20
	.word 0x81982897  ! 825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0897, %hpstate
debug_0_322:
	setx debug_0_322 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 826: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe897e030  ! 827: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0x87802014  ! 828: WRASI_I	wr	%r0, 0x0014, %asi
	set 0xc56ec27d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_323:
	.word 0x39400001  ! 829: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe89fe001  ! 830: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_324)) -> intp(0,0,31)
intvec_0_324:
	.word 0x39400001  ! 831: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe897e020  ! 832: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
debug_0_325:
	setx debug_0_325 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 833: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 834: LDX_R	ldx	[%r31 + %r0], %r20
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_326)) -> intp(0,0,15)
intvec_0_326:
	.word 0x39400001  ! 835: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_327:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d904004  ! 836: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0xe847c000  ! 837: LDSW_R	ldsw	[%r31 + %r0], %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 838: LDX_R	ldx	[%r31 + %r0], %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 839: LDX_R	ldx	[%r31 + %r0], %r20
tagged_0_328:
	tsubcctv %r15, 0x16d3, %r2
	.word 0xe807e001  ! 840: LDUW_I	lduw	[%r31 + 0x0001], %r20
DS_0_329:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5108006  ! 1: LDQF_R	-	[%r2, %r6], %f18
	.word 0xa9a14822  ! 841: FADDs	fadds	%f5, %f2, %f20
splash_lsu_0_330:
	setx 0x704082d5aa5d3fd1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 842: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 843: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe81fc000  ! 844: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x93902001  ! 845: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 846: LDX_R	ldx	[%r31 + %r0], %r20
DS_0_331:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1108008  ! 1: LDQF_R	-	[%r2, %r8], %f16
	.word 0x93a10822  ! 847: FADDs	fadds	%f4, %f2, %f9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_332)) -> intp(0,0,16)
intvec_0_332:
	.word 0x39400001  ! 848: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903fee  ! 849: WRPR_PSTATE_I	wrpr	%r0, 0x1fee, %pstate
	.word 0x8790205b  ! 850: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0xa190200a  ! 851: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd2c7e000  ! 852: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_333)) -> intp(0,1,3)
xir_0_333:
	.word 0xa9806001  ! 853: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x9f802001  ! 854: SIR	sir	0x0001
debug_0_334:
	setx debug_0_334 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 855: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_335:
	setx 0x1d7b99d4e875efcd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 856: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 857: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd22fc002  ! 858: STB_R	stb	%r9, [%r31 + %r2]
	.word 0xa1902004  ! 859: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd327c002  ! 860: STF_R	st	%f9, [%r2, %r31]
	.word 0x91d020b3  ! 861: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802089  ! 862: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd247c000  ! 863: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x9f802001  ! 864: SIR	sir	0x0001
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_336)) -> intp(0,0,0)
intvec_0_336:
	.word 0x39400001  ! 865: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_tba_0_337:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 867: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_338:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f0, %f2
	.word 0xa5b00313  ! 868: ALIGNADDRESS	alignaddr	%r0, %r19, %r18
	.word 0x3e700001  ! 869: BPVC	<illegal instruction>
	.word 0xe44fe001  ! 870: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x87902342  ! 871: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
tagged_0_339:
	taddcctv %r9, 0x13a2, %r12
	.word 0xe407e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe457e001  ! 873: LDSH_I	ldsh	[%r31 + 0x0001], %r18
debug_0_340:
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 874: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902033  ! 875: WRPR_TT_I	wrpr	%r0, 0x0033, %tt
	.word 0xe4dfe030  ! 876: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
debug_0_341:
	mov 0x38, %r18
	.word 0xfef00b12  ! 877: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97520000  ! 878: RDPR_PIL	rdpr	%pil, %r11
tagged_0_342:
	tsubcctv %r6, 0x1407, %r17
	.word 0xd607e001  ! 879: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87802063  ! 880: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x30800001  ! 881: BA	ba,a	<label_0x1>
	set 0xa7983e53, %r28
	stxa %r28, [%g0] 0x73
intvec_0_343:
	.word 0x39400001  ! 882: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_344:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_344:
	.word 0x8f902000  ! 883: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd727e001  ! 884: STF_I	st	%f11, [0x0001, %r31]
	.word 0x8d500000  ! 885: RDPR_TPC	rdpr	%tpc, %r6
debug_0_345:
	mov 8, %r18
	.word 0xd0f00852  ! 886: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 887: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x87802004  ! 888: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902003  ! 889: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xcc7fe001  ! 890: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x91d020b3  ! 891: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x819823c4  ! 892: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0x8790202c  ! 893: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_346)) -> intp(0,1,3)
xir_0_346:
	.word 0xa9852001  ! 894: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
splash_cmpr_0_347:
	setx 0x4fad6eeaf4bef747, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 895: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_348)) -> intp(0,0,26)
intvec_0_348:
	.word 0x39400001  ! 896: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_349)) -> intp(0,1,3)
xir_0_349:
	.word 0xa9816001  ! 897: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
DS_0_350:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 898: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa7520000  ! 899: RDPR_PIL	<illegal instruction>
tagged_0_351:
	taddcctv %r22, 0x14b6, %r9
	.word 0xe607e001  ! 900: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe6800b00  ! 901: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	.word 0xa1902002  ! 902: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_352)) -> intp(0,0,0)
intvec_0_352:
	.word 0x39400001  ! 903: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 904: BPL	<illegal instruction>
	.word 0x93902006  ! 905: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe647c000  ! 906: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xa1902006  ! 907: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa945c000  ! 908: RD_TICK_CMPR_REG	rd	%-, %r20
	set 0x66eaab60, %r28
	stxa %r28, [%g0] 0x73
intvec_0_353:
	.word 0x39400001  ! 909: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_354:
	mov 8, %r18
	.word 0xe4f00852  ! 910: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xa1a4c9c4  ! 911: FDIVd	fdivd	%f50, %f4, %f16
splash_cmpr_0_355:
	setx 0x80f7308098133628, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 912: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 913: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902e38  ! 914: WRPR_PSTATE_I	wrpr	%r0, 0x0e38, %pstate
splash_lsu_0_356:
	setx 0x0ae441537ad0a2a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 915: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903483  ! 916: WRPR_PSTATE_I	wrpr	%r0, 0x1483, %pstate
	.word 0xa1902005  ! 917: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x30800001  ! 918: BA	ba,a	<label_0x1>
debug_0_357:
	mov 8, %r18
	.word 0xe2f00852  ! 919: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x8d903aff  ! 920: WRPR_PSTATE_I	wrpr	%r0, 0x1aff, %pstate
	.word 0x95a01a6a  ! 921: FqTOi	fqtoi	
	.word 0xa1902007  ! 922: WRPR_GL_I	wrpr	%r0, 0x0007, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_358)) -> intp(0,0,18)
intvec_0_358:
	.word 0x39400001  ! 923: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 924: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a01972  ! 925: FqTOd	dis not found

	.word 0x91d02035  ! 926: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902000  ! 927: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903051  ! 928: WRPR_PSTATE_I	wrpr	%r0, 0x1051, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_360)) -> intp(0,1,3)
xir_0_360:
	.word 0xa9852001  ! 929: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 930: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x99902002  ! 931: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc00fc000  ! 932: LDUB_R	ldub	[%r31 + %r0], %r0
splash_htba_0_361:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 933: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_362:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc5326001  ! 1: STQF_I	-	%f2, [0x0001, %r9]
	normalw
	.word 0xa9458000  ! 934: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe8d00e80  ! 935: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r20
	.word 0x87902164  ! 936: WRPR_TT_I	wrpr	%r0, 0x0164, %tt
debug_0_363:
	mov 8, %r18
	.word 0xe4f00852  ! 937: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
DS_0_364:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7312001  ! 1: STQF_I	-	%f11, [0x0001, %r4]
	normalw
	.word 0xa9458000  ! 938: RD_SOFTINT_REG	rd	%softint, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 939: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe847c000  ! 940: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0xe8c7e020  ! 941: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
	.word 0x91d02034  ! 942: Tcc_I	ta	icc_or_xcc, %r0 + 52
	set 0xfe1c933a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_365:
	.word 0x39400001  ! 943: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_366:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 944: RESTORE_R	restore	%r31, %r0, %r31
intveclr_0_367:
	set 0x136b33c2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 945: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 946: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_368:
	setx 0x3f30330cfc3c7256, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 947: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_369:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 948: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0xe837c011  ! 949: STH_R	sth	%r20, [%r31 + %r17]
splash_cmpr_0_370:
	setx 0xb1abc7267aa1500a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 950: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 951: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a4cdc9  ! 952: FdMULq	fdmulq	
splash_lsu_0_371:
	setx 0x18b427371b74bf1b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 953: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc24fc000  ! 954: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xa6d00000  ! 955: UMULcc_R	umulcc 	%r0, %r0, %r19
	.word 0x87802058  ! 956: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe69fc020  ! 957: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0xe71fc000  ! 958: LDDF_R	ldd	[%r31, %r0], %f19
debug_0_372:
	mov 8, %r18
	.word 0xd2f00852  ! 959: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_cmpr_0_373:
	setx 0xb281606031c76035, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 960: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_374:
	setx 0x7d07853de277d36f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 961: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6880e40  ! 962: LDUBA_R	lduba	[%r0, %r0] 0x72, %r19
change_to_randtl_0_375:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_375:
	.word 0x8f902003  ! 963: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe6800c40  ! 964: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
	.word 0xa1902007  ! 965: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe6800b40  ! 966: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r19
	.word 0xe647c000  ! 967: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x8d90355c  ! 968: WRPR_PSTATE_I	wrpr	%r0, 0x155c, %pstate
	.word 0xa1902005  ! 969: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02034  ! 970: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81460000  ! 971: RD_STICK_REG	stbar
	.word 0x83450000  ! 972: RD_SET_SOFTINT	rd	%set_softint, %r1
splash_cmpr_0_376:
	setx 0x50c466538454fdb2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 973: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_377:
	set 0x9fa04def, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 974: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 975: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 976: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x3c700001  ! 977: BPPOS	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_378)) -> intp(0,0,3)
intvec_0_378:
	.word 0x39400001  ! 978: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_379:
	setx debug_0_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 979: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99464000  ! 980: RD_STICK_CMPR_REG	rd	%-, %r12
debug_0_380:
	mov 0x38, %r18
	.word 0xfef00b12  ! 981: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_381:
	mov 8, %r18
	.word 0xdef00852  ! 982: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
DS_0_382:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 983: SAVE_R	save	%r31, %r0, %r31
splash_htba_0_383:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 984: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_384:
	mov 8, %r18
	.word 0xd8f00852  ! 985: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x8d90318d  ! 986: WRPR_PSTATE_I	wrpr	%r0, 0x118d, %pstate
mondo_0_385:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d944001  ! 987: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xd8c7e010  ! 988: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd8cfe000  ! 989: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x34800001  ! 990: BG	bg,a	<label_0x1>
	.word 0xa1902001  ! 991: WRPR_GL_I	wrpr	%r0, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_386)) -> intp(0,0,16)
intvec_0_386:
	.word 0x39400001  ! 992: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x7fd4bded, %r28
	stxa %r28, [%g0] 0x73
intvec_0_387:
	.word 0x39400001  ! 993: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_388)) -> intp(0,0,7)
intvec_0_388:
	.word 0x39400001  ! 994: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe020  ! 995: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	.word 0xad826001  ! 996: WR_SOFTINT_REG_I	wr	%r9, 0x0001, %softint
	.word 0xd8d004a0  ! 997: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x81510000  ! 998: RDPR_TICK	<illegal instruction>
	.word 0x8d903e7e  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x1e7e, %pstate
splash_htba_0_389:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1000: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200c  ! 1001: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8790206b  ! 1002: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1003: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903af2  ! 1004: WRPR_PSTATE_I	wrpr	%r0, 0x1af2, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x879023a1  ! 1006: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_390)) -> intp(0,1,3)
xir_0_390:
	.word 0xa9836001  ! 1007: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xd80fe001  ! 1008: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x83d02032  ! 1009: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d903193  ! 1010: WRPR_PSTATE_I	wrpr	%r0, 0x1193, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1011: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd91fe001  ! 1012: LDDF_I	ldd	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 1013: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
DS_0_391:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd930a001  ! 1: STQF_I	-	%f12, [0x0001, %r2]
	normalw
	.word 0x9b458000  ! 1014: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa1902002  ! 1015: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xda8008a0  ! 1016: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 1017: LDX_R	ldx	[%r31 + %r0], %r13
mondo_0_392:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 1018: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xda1fe001  ! 1019: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0xad846001  ! 1020: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
	.word 0x8284e001  ! 1021: ADDcc_I	addcc 	%r19, 0x0001, %r1
	.word 0x87802004  ! 1022: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_0_393:
	setx 0xa246410056388353, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1023: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_394:
	setx 0x8ded62dbab8e57f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1024: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 1025: BPNEG	<illegal instruction>
debug_0_395:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1026: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902000  ! 1027: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_0_396:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_396:
	.word 0x8f902001  ! 1028: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_0_397:
	set 0x85f3d381, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1029: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc29fe001  ! 1030: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xc2d7e010  ! 1031: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0x91d02035  ! 1032: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9b480000  ! 1033: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xa2f80001  ! 1034: SDIVcc_R	sdivcc 	%r0, %r1, %r17
	.word 0x9f802001  ! 1035: SIR	sir	0x0001
debug_0_398:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1036: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3a0c9c3  ! 1037: FDIVd	fdivd	%f34, %f34, %f48
	.word 0x879023f2  ! 1038: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_399)) -> intp(0,1,3)
xir_0_399:
	.word 0xa981e001  ! 1039: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
tagged_0_400:
	tsubcctv %r9, 0x118a, %r4
	.word 0xe207e001  ! 1040: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87802088  ! 1041: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe28008a0  ! 1042: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_0_401:
	setx 0x1a0ad340430297c9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1043: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1540000  ! 1044: RDPR_GL	rdpr	%-, %r16
	.word 0xa3450000  ! 1045: RD_SET_SOFTINT	rd	%set_softint, %r17
debug_0_402:
	mov 8, %r18
	.word 0xdef00852  ! 1046: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe2d004a0  ! 1047: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_0_403:
	setx 0x1b9d0daadc101c5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1048: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 1049: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802010  ! 1050: WRASI_I	wr	%r0, 0x0010, %asi
debug_0_404:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1051: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802063  ! 1052: WRASI_I	wr	%r0, 0x0063, %asi
mondo_0_405:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d92800d  ! 1053: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
	.word 0x87802055  ! 1054: WRASI_I	wr	%r0, 0x0055, %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1055: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_406:
	setx debug_0_406 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1056: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_407:
	setx 0x7914f4a9afab3997, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1057: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790235e  ! 1058: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
	.word 0x32800001  ! 1059: BNE	bne,a	<label_0x1>
splash_lsu_0_408:
	setx 0x607af817bba49f45, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1060: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0x3a669b18, %r28
	stxa %r28, [%g0] 0x73
intvec_0_409:
	.word 0x39400001  ! 1061: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2800b20  ! 1062: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r17
	ta	T_CHANGE_PRIV	! macro
debug_0_410:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1064: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_411:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 1065: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xe2800be0  ! 1066: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r17
splash_cmpr_0_412:
	setx 0x0955592d0f0ed8a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1067: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_413)) -> intp(0,1,3)
xir_0_413:
	.word 0xa9832001  ! 1068: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 1069: LDX_R	ldx	[%r31 + %r0], %r17
splash_cmpr_0_414:
	setx 0x1a06e437db9e9400, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1070: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 1071: Tcc_I	tne	icc_or_xcc, %r0 + 52
debug_0_415:
	setx debug_0_415 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1072: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe237c014  ! 1073: STH_R	sth	%r17, [%r31 + %r20]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1074: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91902001  ! 1075: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
	.word 0x87802014  ! 1076: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91922001  ! 1077: WRPR_PIL_I	wrpr	%r8, 0x0001, %pil
	.word 0x83500000  ! 1078: RDPR_TPC	rdpr	%tpc, %r1
splash_cmpr_0_416:
	setx 0xf6baa1ba56b23e2d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1079: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_417:
	taddcctv %r16, 0x1434, %r17
	.word 0xc207e001  ! 1080: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2d004a0  ! 1081: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x91520000  ! 1082: RDPR_PIL	<illegal instruction>
	.word 0xd08008a0  ! 1083: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
mondo_0_418:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d934005  ! 1084: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
	.word 0xa5464000  ! 1085: RD_STICK_CMPR_REG	rd	%-, %r18
splash_htba_0_419:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1086: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 1087: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1088: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_420:
	setx 0x26ff4b475c3b2307, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1089: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_421)) -> intp(0,1,3)
xir_0_421:
	.word 0xa9852001  ! 1090: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa1902004  ! 1091: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902003  ! 1092: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe4dfe020  ! 1093: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
	.word 0xe43fc005  ! 1094: STD_R	std	%r18, [%r31 + %r5]
change_to_randtl_0_422:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_422:
	.word 0x8f902000  ! 1095: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1096: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x83d020b5  ! 1097: Tcc_I	te	icc_or_xcc, %r0 + 181
DS_0_423:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a00544  ! 1: FSQRTd	fsqrt	
	.word 0x83a30830  ! 1098: FADDs	fadds	%f12, %f16, %f1
	.word 0x8790225c  ! 1099: WRPR_TT_I	wrpr	%r0, 0x025c, %tt
splash_lsu_0_424:
	setx 0xc0fb15216b1bfaf3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc237e001  ! 1101: STH_I	sth	%r1, [%r31 + 0x0001]
	.word 0xc28008a0  ! 1102: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_425)) -> intp(0,1,3)
xir_0_425:
	.word 0xa982a001  ! 1103: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xa5450000  ! 1104: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xa1454000  ! 1105: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_426)) -> intp(0,0,3)
intvec_0_426:
	.word 0x39400001  ! 1106: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe01fe001  ! 1107: LDD_I	ldd	[%r31 + 0x0001], %r16
	set 0xd307b060, %r28
	stxa %r28, [%g0] 0x73
intvec_0_427:
	.word 0x39400001  ! 1108: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 1109: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 1110: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_428:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1111: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902007  ! 1112: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d802000  ! 1113: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0d804a0  ! 1114: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x8d903cf9  ! 1115: WRPR_PSTATE_I	wrpr	%r0, 0x1cf9, %pstate
debug_0_429:
	mov 8, %r18
	.word 0xd0f00852  ! 1116: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xe01fe001  ! 1117: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0xa1a00565  ! 1118: FSQRTq	fsqrt	
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_430)) -> intp(0,0,20)
intvec_0_430:
	.word 0x39400001  ! 1119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_431:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1120: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08fe010  ! 1121: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_432)) -> intp(0,0,23)
intvec_0_432:
	.word 0x39400001  ! 1122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe037c005  ! 1123: STH_R	sth	%r16, [%r31 + %r5]
	.word 0x87802016  ! 1124: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02033  ! 1125: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_433:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe734000a  ! 1: STQF_R	-	%f19, [%r10, %r16]
	normalw
	.word 0xa3458000  ! 1126: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x91d02034  ! 1127: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 1128: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe21fe001  ! 1129: LDD_I	ldd	[%r31 + 0x0001], %r17
DS_0_434:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1130: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe2cfe000  ! 1131: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0x87802089  ! 1132: WRASI_I	wr	%r0, 0x0089, %asi
	set 0x3c02f6f4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_435:
	.word 0x39400001  ! 1133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_436:
	setx 0x4268a3175f8c7bf4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1134: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 1135: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02034  ! 1136: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe247c000  ! 1137: LDSW_R	ldsw	[%r31 + %r0], %r17
	.word 0xe31fc000  ! 1138: LDDF_R	ldd	[%r31, %r0], %f17
	.word 0x9194e001  ! 1139: WRPR_PIL_I	wrpr	%r19, 0x0001, %pil
	.word 0xe2c7e020  ! 1140: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
splash_lsu_0_437:
	setx 0x0a9013c3ad10e9c1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_438)) -> intp(0,1,3)
xir_0_438:
	.word 0xa982a001  ! 1142: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x87802004  ! 1143: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe28008a0  ! 1144: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_0_439:
	setx 0x620d09612b5751fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1145: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 1146: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81460000  ! 1147: RD_STICK_REG	stbar
	.word 0xe2dfe010  ! 1148: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
debug_0_440:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1149: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02035  ! 1150: Tcc_I	te	icc_or_xcc, %r0 + 53
mondo_0_441:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d90400a  ! 1151: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0x81982194  ! 1152: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0194, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_442)) -> intp(0,0,18)
intvec_0_442:
	.word 0x39400001  ! 1153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_443:
	set 0x4c459d14, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1155: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_444:
	set 0x31612295, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1157: SIR	sir	0x0001
	.word 0x8790207a  ! 1158: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
	.word 0x8d802000  ! 1159: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_445:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d900011  ! 1160: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x87802055  ! 1161: WRASI_I	wr	%r0, 0x0055, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_446)) -> intp(0,0,3)
intvec_0_446:
	.word 0x39400001  ! 1162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe25fe001  ! 1163: LDX_I	ldx	[%r31 + 0x0001], %r17
	set 0x69ae69d0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_447:
	.word 0x39400001  ! 1164: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_448)) -> intp(0,1,3)
xir_0_448:
	.word 0xa980e001  ! 1165: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xe397e001  ! 1166: LDQFA_I	-	[%r31, 0x0001], %f17
intveclr_0_449:
	set 0xf97344d4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe28fe020  ! 1168: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_450)) -> intp(0,0,2)
intvec_0_450:
	.word 0x39400001  ! 1169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_451)) -> intp(0,1,3)
xir_0_451:
	.word 0xa980a001  ! 1170: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x91936001  ! 1171: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
	.word 0xe2dfe020  ! 1172: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
DS_0_452:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe732c003  ! 1: STQF_R	-	%f19, [%r3, %r11]
	normalw
	.word 0x83458000  ! 1173: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc22fe001  ! 1174: STB_I	stb	%r1, [%r31 + 0x0001]
intveclr_0_453:
	set 0xa630db4f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1175: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_454)) -> intp(0,0,3)
intvec_0_454:
	.word 0x39400001  ! 1176: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 1178: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc20fe001  ! 1179: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xc21fc000  ! 1180: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0xa1902000  ! 1181: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc327e001  ! 1182: STF_I	st	%f1, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab800012  ! 1184: WR_CLEAR_SOFTINT_R	wr	%r0, %r18, %clear_softint
	.word 0x8d9023f7  ! 1185: WRPR_PSTATE_I	wrpr	%r0, 0x03f7, %pstate
	.word 0xc2d7e010  ! 1186: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0x87802020  ! 1187: WRASI_I	wr	%r0, 0x0020, %asi
tagged_0_455:
	taddcctv %r21, 0x1362, %r11
	.word 0xc207e001  ! 1188: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc327e001  ! 1189: STF_I	st	%f1, [0x0001, %r31]
splash_lsu_0_456:
	setx 0x9d3afcc5870ba551, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x34700001  ! 1191: BPG	<illegal instruction>
	.word 0x8d802000  ! 1192: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2dfe030  ! 1193: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
splash_lsu_0_457:
	setx 0x0e08fbdfa1842833, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1194: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1540000  ! 1195: RDPR_GL	rdpr	%-, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_458)) -> intp(0,0,13)
intvec_0_458:
	.word 0x39400001  ! 1196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_459:
	taddcctv %r13, 0x1f9e, %r14
	.word 0xe007e001  ! 1197: LDUW_I	lduw	[%r31 + 0x0001], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 1198: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x34700001  ! 1199: BPG	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_460)) -> intp(0,0,7)
intvec_0_460:
	.word 0x39400001  ! 1200: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b53c000  ! 1202: RDPR_FQ	<illegal instruction>
	.word 0xad81e001  ! 1203: WR_SOFTINT_REG_I	wr	%r7, 0x0001, %softint
debug_0_461:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1204: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_462:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 1205: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x87802004  ! 1206: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_0_463:
	set 0x1aa47591, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1207: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_464)) -> intp(0,0,21)
intvec_0_464:
	.word 0x39400001  ! 1208: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdb27e001  ! 1210: STF_I	st	%f13, [0x0001, %r31]
DS_0_465:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1211: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xda4fc000  ! 1212: LDSB_R	ldsb	[%r31 + %r0], %r13
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_466)) -> intp(0,0,7)
intvec_0_466:
	.word 0x39400001  ! 1213: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_467:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f12, %f16
	.word 0x95b18301  ! 1214: ALIGNADDRESS	alignaddr	%r6, %r1, %r10
debug_0_468:
	mov 8, %r18
	.word 0xd0f00852  ! 1215: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x91d020b3  ! 1216: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802080  ! 1217: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_469:
	setx debug_0_469 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1218: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902004  ! 1219: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1220: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_470)) -> intp(0,0,22)
intvec_0_470:
	.word 0x39400001  ! 1221: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd43fe001  ! 1222: STD_I	std	%r10, [%r31 + 0x0001]
debug_0_471:
	mov 8, %r18
	.word 0xe2f00852  ! 1223: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_472)) -> intp(0,0,14)
intvec_0_472:
	.word 0x39400001  ! 1224: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_473:
	set 0x9a069c9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_474)) -> intp(0,1,3)
xir_0_474:
	.word 0xa984e001  ! 1226: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
splash_htba_0_475:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1227: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_476)) -> intp(0,0,3)
intvec_0_476:
	.word 0x39400001  ! 1228: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x896cc013  ! 1229: SDIVX_R	sdivx	%r19, %r19, %r4
	.word 0xa1902000  ! 1230: WRPR_GL_I	wrpr	%r0, 0x0000, %-
intveclr_0_477:
	set 0x174ea544, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1231: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1232: SIR	sir	0x0001
	.word 0x93902001  ! 1233: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02035  ! 1234: Tcc_I	te	icc_or_xcc, %r0 + 53
debug_0_478:
	setx debug_0_478 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1235: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x89480000  ! 1236: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
DS_0_479:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1237: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_0_480:
	setx 0xa64cabe552614528, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1239: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_481:
	setx debug_0_481 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1240: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1241: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_482:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1242: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x8cb906a1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_483:
	.word 0x39400001  ! 1243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 1244: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879021c4  ! 1245: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
intveclr_0_484:
	set 0x155161c1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x80f11660, %r28
	stxa %r28, [%g0] 0x73
intvec_0_485:
	.word 0x39400001  ! 1247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903190  ! 1248: WRPR_PSTATE_I	wrpr	%r0, 0x1190, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_486)) -> intp(0,1,3)
xir_0_486:
	.word 0xa9806001  ! 1249: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
splash_lsu_0_487:
	setx 0xf0a6b680b0ef1e9d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1250: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_488:
	tsubcctv %r5, 0x1b8f, %r10
	.word 0xc807e001  ! 1251: LDUW_I	lduw	[%r31 + 0x0001], %r4
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1252: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1253: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x97a01a71  ! 1254: FqTOi	fqtoi	
	.word 0x8d902d5e  ! 1255: WRPR_PSTATE_I	wrpr	%r0, 0x0d5e, %pstate
	.word 0x87902085  ! 1256: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
	set 0xa3e014da, %r28
	stxa %r28, [%g0] 0x73
intvec_0_489:
	.word 0x39400001  ! 1257: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1258: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd68008a0  ! 1259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_0_490:
	set 0x567efcc8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1262: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_491:
	taddcctv %r26, 0x13be, %r14
	.word 0xd607e001  ! 1263: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x83d02035  ! 1264: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_0_492:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7346001  ! 1: STQF_I	-	%f11, [0x0001, %r17]
	normalw
	.word 0x83458000  ! 1265: RD_SOFTINT_REG	rd	%softint, %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc25fc000  ! 1266: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8682a001  ! 1267: ADDcc_I	addcc 	%r10, 0x0001, %r3
DS_0_493:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa5a10822  ! 1268: FADDs	fadds	%f4, %f2, %f18
	.word 0xa9804014  ! 1269: WR_SET_SOFTINT_R	wr	%r1, %r20, %set_softint
	.word 0xe4d004a0  ! 1270: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x91d02035  ! 1271: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_494)) -> intp(0,1,3)
xir_0_494:
	.word 0xa9816001  ! 1272: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
debug_0_495:
	mov 8, %r18
	.word 0xd6f00852  ! 1273: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x87802088  ! 1274: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802058  ! 1275: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_0_496:
	setx 0xb2b7be0ef905c351, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_497)) -> intp(0,1,3)
xir_0_497:
	.word 0xa981e001  ! 1277: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xe497e020  ! 1278: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0x93902003  ! 1279: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 1280: RD_STICK_REG	stbar
	.word 0xe4bfe001  ! 1281: STDA_I	stda	%r18, [%r31 + 0x0001] %asi
tagged_0_498:
	tsubcctv %r18, 0x1c41, %r9
	.word 0xe407e001  ! 1282: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x9f802001  ! 1283: SIR	sir	0x0001
	.word 0xa9814004  ! 1284: WR_SET_SOFTINT_R	wr	%r5, %r4, %set_softint
	.word 0xe51fe001  ! 1285: LDDF_I	ldd	[%r31, 0x0001], %f18
	.word 0xe48008a0  ! 1286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
debug_0_499:
	setx debug_0_499 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1287: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d702001  ! 1288: POPC_I	popc	0x0001, %r6
	.word 0xcc8fe000  ! 1289: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_500)) -> intp(0,1,3)
xir_0_500:
	.word 0xa984a001  ! 1290: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xcc27c004  ! 1291: STW_R	stw	%r6, [%r31 + %r4]
	.word 0x8d903419  ! 1292: WRPR_PSTATE_I	wrpr	%r0, 0x1419, %pstate
	set 0x9dde8d36, %r28
	stxa %r28, [%g0] 0x73
intvec_0_501:
	.word 0x39400001  ! 1293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_502)) -> intp(0,0,6)
intvec_0_502:
	.word 0x39400001  ! 1294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 1295: BNE	bne,a	<label_0x1>
splash_htba_0_503:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1296: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_504)) -> intp(0,0,2)
intvec_0_504:
	.word 0x39400001  ! 1297: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1298: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xccc804a0  ! 1299: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
intveclr_0_505:
	set 0x6b1d3333, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1300: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_0_506:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1301: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc27c004  ! 1303: STW_R	stw	%r6, [%r31 + %r4]
	.word 0xcc5fe001  ! 1304: LDX_I	ldx	[%r31 + 0x0001], %r6
debug_0_507:
	mov 8, %r18
	.word 0xdaf00852  ! 1305: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x8d9025ac  ! 1306: WRPR_PSTATE_I	wrpr	%r0, 0x05ac, %pstate
	.word 0x87802058  ! 1307: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa3464000  ! 1308: RD_STICK_CMPR_REG	rd	%-, %r17
splash_cmpr_0_508:
	setx 0x74ada6651ace0e56, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1309: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2c7e000  ! 1310: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe277e001  ! 1311: STX_I	stx	%r17, [%r31 + 0x0001]
	.word 0xe257c000  ! 1312: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe28fe010  ! 1313: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
debug_0_509:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_510:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d908001  ! 1315: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
	.word 0xe2d80e80  ! 1316: LDXA_R	ldxa	[%r0, %r0] 0x74, %r17
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1317: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 1318: BPPOS	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_511)) -> intp(0,1,3)
xir_0_511:
	.word 0xa984e001  ! 1319: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_512)) -> intp(0,1,3)
xir_0_512:
	.word 0xa9802001  ! 1320: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1321: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 1322: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe21fe001  ! 1323: LDD_I	ldd	[%r31 + 0x0001], %r17
debug_0_513:
	mov 8, %r18
	.word 0xe2f00852  ! 1324: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_0_514:
	setx 0xa4609744c183263f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1325: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_515:
	set 0xf56ba12d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1326: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_516:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5330014  ! 1: STQF_R	-	%f10, [%r20, %r12]
	normalw
	.word 0x89458000  ! 1327: RD_SOFTINT_REG	rd	%softint, %r4
debug_0_517:
	setx debug_0_517 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_518:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1329: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc8c00e60  ! 1330: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 1331: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x879021e2  ! 1332: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_519)) -> intp(0,1,3)
xir_0_519:
	.word 0xa982a001  ! 1333: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
intveclr_0_520:
	set 0xab33c416, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1334: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1335: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_0_521:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_521:
	.word 0x8f902004  ! 1337: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d020b4  ! 1338: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902006  ! 1339: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa7852001  ! 1340: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0001, %-
	.word 0x9f802001  ! 1341: SIR	sir	0x0001
debug_0_522:
	mov 8, %r18
	.word 0xdaf00852  ! 1342: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x38800001  ! 1343: BGU	bgu,a	<label_0x1>
	set 0xb86c6076, %r28
	stxa %r28, [%g0] 0x73
intvec_0_523:
	.word 0x39400001  ! 1344: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 1345: RDPR_GL	rdpr	%-, %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_524)) -> intp(0,0,29)
intvec_0_524:
	.word 0x39400001  ! 1346: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x6cfdc5d6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_525:
	.word 0x39400001  ! 1347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1464000  ! 1348: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0xa7464000  ! 1349: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x30700001  ! 1350: BPA	<illegal instruction>
	.word 0x93902000  ! 1351: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_526)) -> intp(0,1,3)
xir_0_526:
	.word 0xa981a001  ! 1352: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xe6c004a0  ! 1353: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	.word 0x81982795  ! 1354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0xa345c000  ! 1355: RD_TICK_CMPR_REG	rd	%-, %r17
debug_0_527:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1356: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8e4d000d  ! 1357: MULX_R	mulx 	%r20, %r13, %r7
	.word 0x93d02033  ! 1358: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8198264c  ! 1359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064c, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_528)) -> intp(0,0,3)
intvec_0_528:
	.word 0x39400001  ! 1360: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1361: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 1362: LDX_R	ldx	[%r31 + %r0], %r7
	ta	T_CHANGE_HPRIV	! macro
tagged_0_529:
	taddcctv %r5, 0x1397, %r19
	.word 0xce07e001  ! 1364: LDUW_I	lduw	[%r31 + 0x0001], %r7
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_530)) -> intp(0,0,20)
intvec_0_530:
	.word 0x39400001  ! 1365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_531:
	set 0x199560e2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1366: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_532)) -> intp(0,0,8)
intvec_0_532:
	.word 0x39400001  ! 1367: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xce37c00d  ! 1368: STH_R	sth	%r7, [%r31 + %r13]
	.word 0xce800ae0  ! 1369: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	.word 0x8790239d  ! 1370: WRPR_TT_I	wrpr	%r0, 0x039d, %tt
	.word 0x87802088  ! 1371: WRASI_I	wr	%r0, 0x0088, %asi
mondo_0_533:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 1372: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
mondo_0_534:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d914007  ! 1373: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0xced7e020  ! 1374: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0xa0fc4003  ! 1375: SDIVcc_R	sdivcc 	%r17, %r3, %r16
	.word 0x8198200e  ! 1376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
mondo_0_535:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d944005  ! 1377: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
debug_0_536:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1378: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_537:
	setx 0x1132e397724e25e6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1379: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9768400b  ! 1380: SDIVX_R	sdivx	%r1, %r11, %r11
tagged_0_538:
	tsubcctv %r25, 0x172f, %r22
	.word 0xd607e001  ! 1381: LDUW_I	lduw	[%r31 + 0x0001], %r11
splash_cmpr_0_539:
	setx 0xc0c75647d7f756d9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1382: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd60fe001  ! 1383: LDUB_I	ldub	[%r31 + 0x0001], %r11
	.word 0x93d02035  ! 1384: Tcc_I	tne	icc_or_xcc, %r0 + 53
change_to_randtl_0_540:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_540:
	.word 0x8f902000  ! 1385: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d90262a  ! 1386: WRPR_PSTATE_I	wrpr	%r0, 0x062a, %pstate
	.word 0xd6bfc02b  ! 1387: STDA_R	stda	%r11, [%r31 + %r11] 0x01
intveclr_0_541:
	set 0xb8666716, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1388: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_542)) -> intp(0,1,3)
xir_0_542:
	.word 0xa982e001  ! 1389: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0xd61fe001  ! 1390: LDD_I	ldd	[%r31 + 0x0001], %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_543)) -> intp(0,1,3)
xir_0_543:
	.word 0xa982a001  ! 1391: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 1392: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x2a700001  ! 1393: BPCS	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1394: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_544)) -> intp(0,1,3)
xir_0_544:
	.word 0xa981e001  ! 1395: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xd6800b60  ! 1396: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
	.word 0xd68008a0  ! 1397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_0_545:
	setx 0x48c9523f077e735b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_546:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948008  ! 1399: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0xd627c008  ! 1400: STW_R	stw	%r11, [%r31 + %r8]
	.word 0xd6c00e40  ! 1401: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r11
intveclr_0_547:
	set 0xa6f760f8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd73fc008  ! 1403: STDF_R	std	%f11, [%r8, %r31]
	.word 0x9f802001  ! 1404: SIR	sir	0x0001
	.word 0x82fb6001  ! 1405: SDIVcc_I	sdivcc 	%r13, 0x0001, %r1
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_548)) -> intp(0,0,0)
intvec_0_548:
	.word 0x39400001  ! 1406: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc2800c80  ! 1407: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r1
	.word 0xc337c008  ! 1408: STQF_R	-	%f1, [%r8, %r31]
	set 0xf41ec548, %r28
	stxa %r28, [%g0] 0x73
intvec_0_549:
	.word 0x39400001  ! 1409: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 1410: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d903bc1  ! 1411: WRPR_PSTATE_I	wrpr	%r0, 0x1bc1, %pstate
	.word 0x98dc8014  ! 1412: SMULcc_R	smulcc 	%r18, %r20, %r12
mondo_0_550:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d914003  ! 1413: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xd937c003  ! 1414: STQF_R	-	%f12, [%r3, %r31]
	.word 0x2a800001  ! 1415: BCS	bcs,a	<label_0x1>
	.word 0x9f802001  ! 1416: SIR	sir	0x0001
	.word 0xd88fe010  ! 1417: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0x8d6b4013  ! 1418: SDIVX_R	sdivx	%r13, %r19, %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_551)) -> intp(0,1,3)
xir_0_551:
	.word 0xa980e001  ! 1419: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xcc1fe001  ! 1420: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcc57c000  ! 1421: LDSH_R	ldsh	[%r31 + %r0], %r6
splash_cmpr_0_552:
	setx 0x1f3f58c253a12b4d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1422: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_553:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1423: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_554:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1424: RESTORE_R	restore	%r31, %r0, %r31
debug_0_555:
	mov 8, %r18
	.word 0xd4f00852  ! 1425: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xa1902005  ! 1426: WRPR_GL_I	wrpr	%r0, 0x0005, %-
intveclr_0_556:
	set 0xe12d6ff2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcd1fc000  ! 1428: LDDF_R	ldd	[%r31, %r0], %f6
	.word 0xa9800005  ! 1429: WR_SET_SOFTINT_R	wr	%r0, %r5, %set_softint
mondo_0_557:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d930006  ! 1430: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0xa1902004  ! 1431: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xcc27c006  ! 1432: STW_R	stw	%r6, [%r31 + %r6]
	.word 0xcc8008a0  ! 1433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_0_558:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1434: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_lsu_0_559:
	setx 0xeb9b0206aa7379f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcd1fc000  ! 1436: LDDF_R	ldd	[%r31, %r0], %f6
	.word 0x93902002  ! 1437: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d9030fb  ! 1438: WRPR_PSTATE_I	wrpr	%r0, 0x10fb, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1439: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1440: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x36800001  ! 1441: BGE	bge,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_560)) -> intp(0,0,25)
intvec_0_560:
	.word 0x39400001  ! 1442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xccbfe001  ! 1443: STDA_I	stda	%r6, [%r31 + 0x0001] %asi
	.word 0x8b53c000  ! 1444: RDPR_FQ	<illegal instruction>
	.word 0xca800c40  ! 1445: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r5
intveclr_0_561:
	set 0x208fa9b5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90303b  ! 1447: WRPR_PSTATE_I	wrpr	%r0, 0x103b, %pstate
debug_0_562:
	setx debug_0_562 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1448: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_0_563:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_563:
	.word 0x8f902003  ! 1449: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
debug_0_564:
	mov 8, %r18
	.word 0xd4f00852  ! 1450: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x93902003  ! 1451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_565:
	set 0x107bb317, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1452: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 1453: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xca8fe030  ! 1454: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	.word 0x8fa509f0  ! 1455: FDIVq	dis not found

	.word 0xa1a0054d  ! 1456: FSQRTd	fsqrt	
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_566)) -> intp(0,0,0)
intvec_0_566:
	.word 0x39400001  ! 1457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xfcd095c3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_567:
	.word 0x39400001  ! 1458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_568:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1459: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9025af  ! 1460: WRPR_PSTATE_I	wrpr	%r0, 0x05af, %pstate
	.word 0x8a808010  ! 1461: ADDcc_R	addcc 	%r2, %r16, %r5
DS_0_569:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe332a001  ! 1: STQF_I	-	%f17, [0x0001, %r10]
	normalw
	.word 0x99458000  ! 1462: RD_SOFTINT_REG	rd	%softint, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_570)) -> intp(0,1,3)
xir_0_570:
	.word 0xa984e001  ! 1463: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xd88008a0  ! 1464: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	set 0xc5e7af1f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_571:
	.word 0x39400001  ! 1465: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa780a001  ! 1466: WR_GRAPHICS_STATUS_REG_I	wr	%r2, 0x0001, %-
splash_cmpr_0_572:
	setx 0x9334ba563c57782e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1467: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 1468: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa190200a  ! 1469: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa7822001  ! 1470: WR_GRAPHICS_STATUS_REG_I	wr	%r8, 0x0001, %-
	.word 0x22800001  ! 1471: BE	be,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_573)) -> intp(0,1,3)
xir_0_573:
	.word 0xa9836001  ! 1472: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0xd88fe010  ! 1474: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
DS_0_574:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xed63434c	! Random illegal ?
	.word 0xc911000d  ! 1: LDQF_R	-	[%r4, %r13], %f4
	.word 0xa7a2482d  ! 1475: FADDs	fadds	%f9, %f13, %f19
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1476: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 1477: LDX_R	ldx	[%r31 + %r0], %r19
DS_0_575:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x89a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa1a40821  ! 1478: FADDs	fadds	%f16, %f1, %f16
DS_0_576:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xdf675271	! Random illegal ?
	.word 0xa1a00544  ! 1: FSQRTd	fsqrt	
	.word 0x93a18825  ! 1479: FADDs	fadds	%f6, %f5, %f9
DS_0_577:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1480: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 1481: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd297e020  ! 1482: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x93902002  ! 1483: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_0_578:
	setx 0x20d2b49a5373e1e2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1484: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_579)) -> intp(0,1,3)
xir_0_579:
	.word 0xa980a001  ! 1485: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xa24b0012  ! 1486: MULX_R	mulx 	%r12, %r18, %r17
	.word 0x879022c3  ! 1487: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0xe337c012  ! 1488: STQF_R	-	%f17, [%r18, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_580)) -> intp(0,0,14)
intvec_0_580:
	.word 0x39400001  ! 1489: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_581:
	taddcctv %r22, 0x12d6, %r14
	.word 0xe207e001  ! 1490: LDUW_I	lduw	[%r31 + 0x0001], %r17
tagged_0_582:
	tsubcctv %r22, 0x1691, %r24
	.word 0xe207e001  ! 1491: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa0852001  ! 1492: ADDcc_I	addcc 	%r20, 0x0001, %r16
	.word 0xe057c000  ! 1493: LDSH_R	ldsh	[%r31 + %r0], %r16
debug_0_583:
	setx debug_0_583 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1494: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_584:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1495: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08008a0  ! 1496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0c7e020  ! 1497: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	.word 0x93902002  ! 1498: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
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

	.xword	0x27a1290d2451225a
	.xword	0xa957891eca581173
	.xword	0xa54b8f67fb09867b
	.xword	0x4881cfa4b504bfb6
	.xword	0x85d4686bffa2dd53
	.xword	0x909fe875820d2039
	.xword	0x42912df545a19726
	.xword	0xa842efd87f0996cc
	.xword	0x5e223491b3725946
	.xword	0xa365b94b93fdaf61
	.xword	0xecb448c8d7278b1b
	.xword	0x117f4a8fb72f148a
	.xword	0x889c8d59ad8cc9de
	.xword	0x2e6f77aaad8f8f21
	.xword	0xf8bbb0401709ce28
	.xword	0x53c05f477982ab03
	.xword	0xab71d5d64a65e16c
	.xword	0xb0f586ba80dc1295
	.xword	0x9709c3d6d68890bf
	.xword	0x9deffd9f59b4a8c3
	.xword	0x06a5fb0a62e1a458
	.xword	0xe3d5a1ba5fcac077
	.xword	0x3fb246cb67e2a878
	.xword	0x08f6ba89117ec697
	.xword	0xd0d1f8e44871f7b1
	.xword	0xe24885015179ba54
	.xword	0xd1558f22a6f4ab7a
	.xword	0xe54885456382e342
	.xword	0x427aefa9783da44b
	.xword	0xab1f3675111b1c1a
	.xword	0x7f3e4f166172bd60
	.xword	0x51b82c461c1a5964
	.xword	0x045cf7290ae86caa
	.xword	0x34ed768fb102d8e5
	.xword	0xe144b1367358293e
	.xword	0xa7509db1939994fb
	.xword	0x38b6fdaf3ec6e2d1
	.xword	0x8c5d37b5ce21f302
	.xword	0xf616f87341f7d2ee
	.xword	0xc1a6a5f78ab77bc9
	.xword	0xbd368ce94902e4ac
	.xword	0x0583f562edde1331
	.xword	0x979ab9524db3f506
	.xword	0x18cac5f872f5149b
	.xword	0x207007b088b7213a
	.xword	0x4911512a23113fe1
	.xword	0xb8e27e3a68bcf63b
	.xword	0x3dcdbdea17ad2801
	.xword	0xe7753bea826102bf
	.xword	0xb44415dd8e45e6a7
	.xword	0x764442c5512b873c
	.xword	0x81069f1ea5791306
	.xword	0xe052b32dae1d828a
	.xword	0xa754a0fcbf845b11
	.xword	0x1f1523c3d7a2e950
	.xword	0x51ec80c700bd1ddd
	.xword	0x37bb76136c4f818b
	.xword	0xb3fc7c28e4592ec3
	.xword	0x4d1a06cc8c07ef30
	.xword	0x9cb96aae1902816f
	.xword	0x938fab3778eec142
	.xword	0xc24b85fb5ad14046
	.xword	0xa11b6b00cad5d588
	.xword	0x8027a3c0989c195f
	.xword	0x7546d2591ada641d
	.xword	0x7cba2cd6f88b265b
	.xword	0x44f61c556abfb5ba
	.xword	0xf2e54e646ca0e849
	.xword	0x427c10214f93def1
	.xword	0x6756b916d66ef19e
	.xword	0x5c0da444afab639c
	.xword	0xf6a396c8ec904db7
	.xword	0xae33658824da404a
	.xword	0xa896fcf09a9ea1e5
	.xword	0x3984ec31346af559
	.xword	0xd2516879dbeb47ce
	.xword	0x75c7e419d830553f
	.xword	0x66fabd418b7ff4b1
	.xword	0xbb362a838651a8f1
	.xword	0x2f149acc9caeaada
	.xword	0x0ddc118efb5cb2c4
	.xword	0x8a0f4ca81329dcf8
	.xword	0xe2447156582de111
	.xword	0x41134cc871a014d4
	.xword	0x4e34a99b02b36fea
	.xword	0xd3449c9a0b77c59a
	.xword	0xbd70e2207a163898
	.xword	0x95dcd529129e0df1
	.xword	0x0aa69a4c0e58ec35
	.xword	0x81f30b57ce7143db
	.xword	0xe0fdd6ffe3ecf326
	.xword	0x1755fe360807afbf
	.xword	0xefbc69922d606925
	.xword	0x8584ac1d35daed38
	.xword	0x3cab90fd025221c1
	.xword	0x807e5c1a1617c76a
	.xword	0x5c0d8d88df1378ac
	.xword	0x8ec4f9c7b7e10208
	.xword	0x18bfa5bf24d3d44d
	.xword	0x4919c82fd9239d47
	.xword	0x71367c10f8f2f54b
	.xword	0x506eea6e99b6d588
	.xword	0x54c30b577fa967fc
	.xword	0x15faa94cc81e6cc6
	.xword	0x8688f1a8e0c2c25f
	.xword	0x49daa6e1dd431230
	.xword	0xc11a326bd2609156
	.xword	0x2261fde4998808da
	.xword	0xe4a27d4bbaf38ade
	.xword	0x2da0750504875230
	.xword	0x355a3886451ae411
	.xword	0x16831c86d808ea67
	.xword	0x5b196dc2f0e0e347
	.xword	0x75fc4909ad2b68e9
	.xword	0xc027401e2ace7f82
	.xword	0xbcdc6167af11bc76
	.xword	0x340dbfee31b3851f
	.xword	0x86df7bb924fbe49e
	.xword	0x94837eaa56ee4fce
	.xword	0xa4a1eca4f0a33370
	.xword	0xb1dc176a9cf8b726
	.xword	0xb3a91ee5f46c1226
	.xword	0x7e2c12d1f859df39
	.xword	0x7960d4200d6c1830
	.xword	0x07808e5ccc7d925d
	.xword	0xcd9011b43b4131fc
	.xword	0x238d8d453bb716e1
	.xword	0xb802f7ab9b86d8b8
	.xword	0xf4a621f538d51fd2
	.xword	0xbef3bc1d6fb378b0
	.xword	0xaeff2e8b99f7a61c
	.xword	0xea258bd6fb999a38
	.xword	0xacaef4df44dd4fe4
	.xword	0x0b09c85f7a4849e1
	.xword	0xea30cd40b87a5b08
	.xword	0xad30b9daacb7a3e8
	.xword	0x320d86a5b6c0e788
	.xword	0x49f36f24248f2370
	.xword	0x00bcd22bf35c7d01
	.xword	0x75352e8a3d12802f
	.xword	0x03b9c2109a85ab49
	.xword	0x0d6a2726552faab2
	.xword	0x39c6731d952bbc41
	.xword	0xe06a960302aa99dd
	.xword	0xf43f98b5674444dd
	.xword	0xcee3b67bba278369
	.xword	0xb84117c6fa4f7a40
	.xword	0x449e54f3952c863d
	.xword	0xa1d996736d9bacea
	.xword	0xbfbf844ea22a0115
	.xword	0x6355fbc9c086e3ff
	.xword	0x9af137ecd9a07953
	.xword	0x79679681fb016797
	.xword	0x578f6fcdd5467535
	.xword	0x89346eea14bbef93
	.xword	0xb6ffc32941291d6b
	.xword	0x4a5b1b2760835d4d
	.xword	0xfe31a9e016e6912a
	.xword	0xd57a67acfaa3b5f5
	.xword	0xc109ae9a89929cf4
	.xword	0xfefca060b446c3d0
	.xword	0xe4447eb45f65d195
	.xword	0x4750accb6ac03571
	.xword	0x69be7a13d289a539
	.xword	0x0b0d67f7f78f3f8a
	.xword	0x3a747861dedce29d
	.xword	0x8ed54edfc6cb58c3
	.xword	0x9750a0ff068e3de5
	.xword	0x1c4869963953b382
	.xword	0xd8706f74919d9457
	.xword	0xfeed80dd383431d3
	.xword	0x821a8f50a8db984b
	.xword	0xd0ccce9f5cad8915
	.xword	0xe902501a2f5f00aa
	.xword	0x3d54ed1bf386ef2b
	.xword	0x1d62ab50e483842b
	.xword	0x26e116791d05a720
	.xword	0xb08b58567b8abf2c
	.xword	0xf05f38aa63c9b99e
	.xword	0xe7185e43abdc035a
	.xword	0x88963f4003243b16
	.xword	0xa49a3a42d0e47865
	.xword	0xb0f311b23dcb9d2a
	.xword	0x9fc13638b4b6a9b2
	.xword	0x90620d5882aa7088
	.xword	0x59ac6ae4cfbb8dbf
	.xword	0x2626f0e07b8596d8
	.xword	0x96e61c7d518811a9
	.xword	0xd95d106925011a02
	.xword	0xcb971b1bc55b8470
	.xword	0x5fbdecc6d6f3511d
	.xword	0x0809e995b5911c86
	.xword	0xb3fd05f3024abaf9
	.xword	0x4b190185b04d16f3
	.xword	0xe89806f69accc37c
	.xword	0xe2d8f5e526631e27
	.xword	0x68f8bfeb3546085c
	.xword	0x409534c7c8e5e1a8
	.xword	0xb59ec71a6bc48669
	.xword	0x12234c4139bfd105
	.xword	0x3ccca4a50c261309
	.xword	0x2c9ffcfe37168204
	.xword	0xc773c2471571f045
	.xword	0xfe37a4cc943695c7
	.xword	0x87c14a07fc5c94f2
	.xword	0xc063e4a963421906
	.xword	0xe9a714ae912c8b2f
	.xword	0x13a5e17db0b1a81d
	.xword	0xa07f57ee0462050d
	.xword	0xd00761ae12bef426
	.xword	0x0fd07023088e8630
	.xword	0xaca9cf37b19f2256
	.xword	0xa20cdb794f84f008
	.xword	0xeab4a11ede1ddd4c
	.xword	0xa618b29cbc2dc00f
	.xword	0xb2155aeb1e46434c
	.xword	0xecce9a1f96042294
	.xword	0xe9a88659ad529edc
	.xword	0x1cfe3b3e2d0c98f5
	.xword	0xca2d4c2dd32479a5
	.xword	0x3318209546978388
	.xword	0xf19020d2c8eadce8
	.xword	0xacc1d1efa2c4aed5
	.xword	0x6dfbffde0a3feaa5
	.xword	0x54e6a0212a5d1196
	.xword	0x1a1576a3f0658034
	.xword	0x1b0c7d58bf0368b2
	.xword	0x7151b66ab45b1854
	.xword	0xf758d4f527c8c6b1
	.xword	0xd47e4b6926e76f20
	.xword	0x2c6da78089cc7c89
	.xword	0x9597e6186a8c5feb
	.xword	0xd52aae214acd437b
	.xword	0x9b87e569e7308c30
	.xword	0x262b2fe5c07a2ccb
	.xword	0xa39074b8d985ecb9
	.xword	0x5ddc5b839129e0e9
	.xword	0xd18b4e2a68ab0afb
	.xword	0x4435fd8b66a810ea
	.xword	0x6393f2e8820936db
	.xword	0x4e874d84f3c1e466
	.xword	0x9eb1174aab0ce603
	.xword	0x39beb5f831cdb59f
	.xword	0xf83c320383eec271
	.xword	0x07644a2b9995e046
	.xword	0xdf7d1bf0ac7989b3
	.xword	0x8ee3340fa50aed2e
	.xword	0xf08c41da548d0a33
	.xword	0xaa70d3f679e56758
	.xword	0xfb5209b92cd340e7
	.xword	0x193d7200dc11aa7c
	.xword	0x00c1ddcba1b4f9da
	.xword	0xdc467f0e7b8737e3
	.xword	0x31955a398160298e
	.xword	0xa69920c548d90564
	.xword	0x87cad6fc2d03b3b3

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

