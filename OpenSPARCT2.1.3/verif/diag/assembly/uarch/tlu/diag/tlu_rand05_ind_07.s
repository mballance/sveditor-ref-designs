/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_07.s
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
	mov 0xb4, %r14
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
	mov 0xb3, %r14
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
	mov 0x35, %r14
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
	mov 0xb4, %r14
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
	mov 0x31, %r14
	mov 0x33, %r30
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

	.word 0xc04fe001  ! 1: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xa190200f  ! 2: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_0_0:
	mov 8, %r18
	.word 0xe6f00852  ! 3: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xc0d804a0  ! 4: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
splash_cmpr_0_1:
	setx 0x4b5488302b24d105, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_2:
	setx 0x11f5f38c2d1232a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc08008a0  ! 7: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
debug_0_3:
	mov 8, %r18
	.word 0xe2f00852  ! 8: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x99902002  ! 9: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_lsu_0_4:
	setx 0x24f5967c2e89c7cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_5:
	mov 0x38, %r18
	.word 0xfef00b12  ! 11: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc007c000  ! 12: LDUW_R	lduw	[%r31 + %r0], %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r0
DS_0_6:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b40312  ! 14: ALIGNADDRESS	alignaddr	%r16, %r18, %r17
	.word 0x34700001  ! 15: BPG	<illegal instruction>
	.word 0xe23fc012  ! 16: STD_R	std	%r17, [%r31 + %r18]
debug_0_7:
	setx debug_0_7 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 17: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xad822001  ! 18: WR_SOFTINT_REG_I	wr	%r8, 0x0001, %softint
splash_lsu_0_8:
	setx 0xd1f4c5d9f26efb5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_9:
	mov 8, %r18
	.word 0xe6f00852  ! 20: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
intveclr_0_10:
	set 0xa1bf2187, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe317c000  ! 22: LDQF_R	-	[%r31, %r0], %f17
tagged_0_11:
	taddcctv %r21, 0x1a35, %r11
	.word 0xe207e001  ! 23: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe29fe001  ! 24: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
intveclr_0_12:
	set 0xea4fd6ea, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_13:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 26: SAVE_R	save	%r31, %r0, %r31
tagged_0_14:
	tsubcctv %r11, 0x1037, %r5
	.word 0xe207e001  ! 27: LDUW_I	lduw	[%r31 + 0x0001], %r17
intveclr_0_15:
	set 0x72064909, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_16:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 29: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d020b4  ! 30: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x87802080  ! 31: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902501  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x0501, %pstate
	.word 0xe3e7c032  ! 33: CASA_I	casa	[%r31] 0x 1, %r18, %r17
	.word 0xe337e001  ! 34: STQF_I	-	%f17, [0x0001, %r31]
	.word 0x81982a87  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
splash_lsu_0_17:
	setx 0x14aada38a7d48bbd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 36: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_18:
	mov 8, %r18
	.word 0xd4f00852  ! 37: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x87902154  ! 38: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
DS_0_19:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd5120010  ! 1: LDQF_R	-	[%r8, %r16], %f10
	.word 0x97a20832  ! 39: FADDs	fadds	%f8, %f18, %f11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_20:
	mov 0x38, %r18
	.word 0xfef00b12  ! 41: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_21:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d90c006  ! 42: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
splash_lsu_0_22:
	setx 0xe082572aee3a2807, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 43: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_23:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 44: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0x81982397  ! 45: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0397, %hpstate
intveclr_0_24:
	set 0x19a772aa, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 46: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6800b60  ! 47: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
	.word 0x87802080  ! 48: WRASI_I	wr	%r0, 0x0080, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_25)) -> intp(0,1,3)
xir_0_25:
	.word 0xa981a001  ! 49: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 50: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x91952001  ! 51: WRPR_PIL_I	wrpr	%r20, 0x0001, %pil
	.word 0x83d02034  ! 52: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd727e001  ! 53: STF_I	st	%f11, [0x0001, %r31]
splash_lsu_0_26:
	setx 0x2e7745d0fd4a905d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 54: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 55: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8780201c  ! 56: WRASI_I	wr	%r0, 0x001c, %asi
DS_0_27:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc7350014  ! 1: STQF_R	-	%f3, [%r20, %r20]
	normalw
	.word 0xa3458000  ! 57: RD_SOFTINT_REG	rd	%softint, %r17
mondo_0_28:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d908009  ! 58: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0xe257c000  ! 59: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe24fe001  ! 60: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r17
mondo_0_29:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d90c012  ! 62: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
DS_0_30:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 63: RESTORE_R	restore	%r31, %r0, %r31
debug_0_31:
	setx debug_0_31 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 64: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x94812001  ! 65: ADDcc_I	addcc 	%r4, 0x0001, %r10
mondo_0_32:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d948011  ! 66: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 67: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8745c000  ! 68: RD_TICK_CMPR_REG	rd	%-, %r3
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 69: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_33:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a00546  ! 1: FSQRTd	fsqrt	
	.word 0x81a34828  ! 70: FADDs	fadds	%f13, %f8, %f0
	.word 0x85450000  ! 71: RD_SET_SOFTINT	rd	%set_softint, %r2
	.word 0x93902000  ! 72: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8790203c  ! 73: WRPR_TT_I	wrpr	%r0, 0x003c, %tt
debug_0_34:
	setx debug_0_34 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 74: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc42fc008  ! 75: STB_R	stb	%r2, [%r31 + %r8]
tagged_0_35:
	taddcctv %r10, 0x1d25, %r19
	.word 0xc407e001  ! 76: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x36700001  ! 77: BPGE	<illegal instruction>
	.word 0x92d26001  ! 78: UMULcc_I	umulcc 	%r9, 0x0001, %r9
DS_0_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 79: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd2c7e020  ! 80: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0xd2800bc0  ! 81: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
	.word 0x87802058  ! 82: WRASI_I	wr	%r0, 0x0058, %asi
tagged_0_37:
	taddcctv %r19, 0x1a7e, %r21
	.word 0xd207e001  ! 83: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8d90259f  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x059f, %pstate
debug_0_38:
	mov 0x38, %r18
	.word 0xfef00b12  ! 85: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r9
debug_0_39:
	mov 8, %r18
	.word 0xe4f00852  ! 87: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
debug_0_40:
	setx debug_0_40 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 88: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 89: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 90: BPA	<illegal instruction>
	.word 0xd2cfe020  ! 91: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x9f802001  ! 92: SIR	sir	0x0001
splash_cmpr_0_41:
	setx 0x31d60e5870e5bceb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 93: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_42:
	setx 0xce601d42af5c8003, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 94: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd2c804a0  ! 95: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_0_43:
	setx debug_0_43 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 96: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd28008a0  ! 97: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2ffc028  ! 98: SWAPA_R	swapa	%r9, [%r31 + %r8] 0x01
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968a001  ! 99: SDIVX_I	sdivx	%r2, 0x0001, %r12
	.word 0x8198245e  ! 100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045e, %hpstate
	.word 0xd83fe001  ! 101: STD_I	std	%r12, [%r31 + 0x0001]
debug_0_45:
	mov 8, %r18
	.word 0xd2f00852  ! 102: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x879022de  ! 103: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
mondo_0_46:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d928010  ! 104: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
DS_0_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f28, %f16
	.word 0x81b2430d  ! 105: ALIGNADDRESS	alignaddr	%r9, %r13, %r0
	.word 0xc0d00e40  ! 106: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r0
	.word 0x93d02033  ! 107: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_lsu_0_48:
	setx 0xf3de9d93ea0d8709, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 108: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_49:
	setx debug_0_49 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 109: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_50:
	setx 0x7005fd08f689e228, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 110: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902000  ! 111: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d020b5  ! 112: Tcc_I	tne	icc_or_xcc, %r0 + 181
change_to_randtl_0_51:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_51:
	.word 0x8f902003  ! 113: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xc08008a0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d903f77  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1f77, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_52)) -> intp(0,1,3)
xir_0_52:
	.word 0xa9852001  ! 116: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0x87802004  ! 117: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_0_53:
	set 0x86c507d7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 118: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc0d7e010  ! 119: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
debug_0_54:
	mov 8, %r18
	.word 0xd4f00852  ! 120: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_0_55:
	setx debug_0_55 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 121: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_56:
	mov 0x38, %r18
	.word 0xfef00b12  ! 122: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3540000  ! 123: RDPR_GL	rdpr	%-, %r17
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3e800001  ! 125: BVC	bvc,a	<label_0x1>
DS_0_57:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x93b14307  ! 126: ALIGNADDRESS	alignaddr	%r5, %r7, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 127: LDX_R	ldx	[%r31 + %r0], %r9
splash_lsu_0_58:
	setx 0xe9c92508dbc7bebf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 128: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 129: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
tagged_0_59:
	taddcctv %r13, 0x10e6, %r1
	.word 0xd207e001  ! 130: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x20700001  ! 131: BPN	<illegal instruction>
	.word 0xd2800ba0  ! 132: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
	.word 0x8d802004  ! 133: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8780204f  ! 134: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d020b3  ! 135: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_0_60:
	tsubcctv %r26, 0x1834, %r19
	.word 0xd207e001  ! 136: LDUW_I	lduw	[%r31 + 0x0001], %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 137: LDX_R	ldx	[%r31 + %r0], %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_61)) -> intp(0,1,3)
xir_0_61:
	.word 0xa982a001  ! 138: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x9550c000  ! 139: RDPR_TT	<illegal instruction>
	.word 0xd40fc000  ! 140: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x8d90240c  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
	.word 0x8780204f  ! 142: WRASI_I	wr	%r0, 0x004f, %asi
mondo_0_62:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d928000  ! 143: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
splash_tba_0_63:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 144: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 145: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93454000  ! 146: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xa9454000  ! 147: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xa9848003  ! 148: WR_SET_SOFTINT_R	wr	%r18, %r3, %set_softint
	.word 0xad852001  ! 149: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	.word 0xa1902007  ! 150: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d9024d5  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0x97540000  ! 152: RDPR_GL	rdpr	%-, %r11
	.word 0xa1540000  ! 153: RDPR_GL	rdpr	%-, %r16
	.word 0xe127c003  ! 154: STF_R	st	%f16, [%r3, %r31]
DS_0_64:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f6, %f0
	.word 0x8bb10303  ! 155: ALIGNADDRESS	alignaddr	%r4, %r3, %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 156: LDX_R	ldx	[%r31 + %r0], %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 157: LDX_R	ldx	[%r31 + %r0], %r5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 158: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab840000  ! 159: WR_CLEAR_SOFTINT_R	wr	%r16, %r0, %clear_softint
	.word 0x87902150  ! 160: WRPR_TT_I	wrpr	%r0, 0x0150, %tt
DS_0_65:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9ba00554  ! 1: FSQRTd	fsqrt	
	.word 0x8fa04823  ! 161: FADDs	fadds	%f1, %f3, %f7
	.word 0xcf3fe001  ! 162: STDF_I	std	%f7, [0x0001, %r31]
	.word 0xad852001  ! 163: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
mondo_0_66:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d904005  ! 164: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0x83d02034  ! 165: Tcc_I	te	icc_or_xcc, %r0 + 52
change_to_randtl_0_67:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_67:
	.word 0x8f902003  ! 166: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xce57c000  ! 167: LDSH_R	ldsh	[%r31 + %r0], %r7
	.word 0xcec804a0  ! 168: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x8d903493  ! 169: WRPR_PSTATE_I	wrpr	%r0, 0x1493, %pstate
	.word 0xcf27e001  ! 170: STF_I	st	%f7, [0x0001, %r31]
splash_tba_0_68:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 171: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_69:
	set 0xe263b503, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 172: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903187  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1187, %pstate
DS_0_70:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 174: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81510000  ! 175: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8345c000  ! 176: RD_TICK_CMPR_REG	rd	%-, %r1
	.word 0x93902000  ! 177: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902046  ! 178: WRPR_TT_I	wrpr	%r0, 0x0046, %tt
	.word 0xa1902004  ! 179: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023c0  ! 180: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
	.word 0xc22fe001  ! 181: STB_I	stb	%r1, [%r31 + 0x0001]
	.word 0x3c700001  ! 182: BPPOS	<illegal instruction>
	.word 0x9b454000  ! 183: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0x82db0012  ! 184: SMULcc_R	smulcc 	%r12, %r18, %r1
	.word 0xc397e001  ! 185: LDQFA_I	-	[%r31, 0x0001], %f1
DS_0_71:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 186: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 187: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 189: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81460000  ! 190: RD_STICK_REG	stbar
debug_0_72:
	mov 8, %r18
	.word 0xd4f00852  ! 191: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
mondo_0_73:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 192: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x87802010  ! 193: WRASI_I	wr	%r0, 0x0010, %asi
DS_0_74:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f12, %f28
	.word 0x93b1c306  ! 194: ALIGNADDRESS	alignaddr	%r7, %r6, %r9
tagged_0_75:
	taddcctv %r5, 0x1b4f, %r18
	.word 0xd207e001  ! 195: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x99902002  ! 196: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87802020  ! 197: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802080  ! 198: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_76:
	setx debug_0_76 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 199: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_77:
	mov 0x38, %r18
	.word 0xfef00b12  ! 200: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_78:
	mov 8, %r18
	.word 0xdaf00852  ! 201: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x87802063  ! 202: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 203: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022c5  ! 205: WRPR_TT_I	wrpr	%r0, 0x02c5, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 206: LDX_R	ldx	[%r31 + %r0], %r9
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 207: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902166  ! 209: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x93902003  ! 210: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_0_79:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 211: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x81982f9d  ! 212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9d, %hpstate
	.word 0x93d02035  ! 213: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd247c000  ! 215: LDSW_R	ldsw	[%r31 + %r0], %r9
debug_0_80:
	mov 0x38, %r18
	.word 0xfef00b12  ! 216: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802089  ! 217: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8780201c  ! 218: WRASI_I	wr	%r0, 0x001c, %asi
DS_0_81:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd31a001  ! 1: STQF_I	-	%f6, [0x0001, %r6]
	normalw
	.word 0x9b458000  ! 219: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xa3454000  ! 220: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 221: LDX_R	ldx	[%r31 + %r0], %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902007  ! 223: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 224: RD_STICK_REG	stbar
intveclr_0_82:
	set 0x599d7107, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902161  ! 226: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
splash_lsu_0_83:
	setx 0x74dbcceb28107c63, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe25fe001  ! 228: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0xe28008a0  ! 229: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa7852001  ! 230: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0001, %-
	.word 0xe247c000  ! 231: LDSW_R	ldsw	[%r31 + %r0], %r17
	.word 0xe2c7e020  ! 232: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
debug_0_84:
	mov 8, %r18
	.word 0xd2f00852  ! 233: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe21fc000  ! 234: LDD_R	ldd	[%r31 + %r0], %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_85)) -> intp(0,1,3)
xir_0_85:
	.word 0xa9826001  ! 235: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
splash_lsu_0_86:
	setx 0xd101fe49b5af13f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2d004a0  ! 237: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe28008a0  ! 238: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 239: LDX_R	ldx	[%r31 + %r0], %r17
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_87:
	setx 0x71fbb6cb25cfd553, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_88:
	setx 0x930f0d93c5bf9287, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 242: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_89:
	setx 0xdfd3a636daedb2b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 243: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 244: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 245: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe21fe001  ! 246: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1686001  ! 247: SDIVX_I	sdivx	%r1, 0x0001, %r16
	.word 0xe08008a0  ! 248: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x32800001  ! 249: BNE	bne,a	<label_0x1>
	.word 0x98fb4006  ! 250: SDIVcc_R	sdivcc 	%r13, %r6, %r12
	.word 0xd927e001  ! 251: STF_I	st	%f12, [0x0001, %r31]
	.word 0x81510000  ! 252: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd89fc020  ! 253: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01972  ! 254: FqTOd	dis not found

	.word 0x93d02032  ! 255: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd24fe001  ! 256: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x87802016  ! 257: WRASI_I	wr	%r0, 0x0016, %asi
splash_lsu_0_92:
	setx 0x160c71dddfe199bb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 259: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902003  ! 260: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd2cfe030  ! 261: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x83464000  ! 262: RD_STICK_CMPR_REG	rd	%-, %r1
	.word 0x91d02032  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d020b4  ! 264: Tcc_I	tne	icc_or_xcc, %r0 + 180
DS_0_93:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd14400b  ! 1: LDQF_R	-	[%r17, %r11], %f6
	.word 0x81a1c826  ! 265: FADDs	fadds	%f7, %f6, %f0
	.word 0x91d020b3  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_0_94:
	setx debug_0_94 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 267: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f14, %f2, %f20
	.word 0x97b28308  ! 268: ALIGNADDRESS	alignaddr	%r10, %r8, %r11
splash_lsu_0_96:
	setx 0xde3eb3b8ae7232b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_97:
	setx 0xfaf9be36a8ed94a1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_98:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 271: SAVE_R	save	%r31, %r0, %r31
change_to_randtl_0_99:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_99:
	.word 0x8f902005  ! 272: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x93d02035  ! 273: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd69fe001  ! 274: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
DS_0_100:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 275: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd637e001  ! 276: STH_I	sth	%r11, [%r31 + 0x0001]
DS_0_101:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 277: SAVE_R	save	%r31, %r0, %r31
	.word 0xd64fe001  ! 278: LDSB_I	ldsb	[%r31 + 0x0001], %r11
splash_lsu_0_102:
	setx 0x9747a88005560e55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 279: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6800a80  ! 280: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
mondo_0_103:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940006  ! 281: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xd71fe001  ! 282: LDDF_I	ldd	[%r31, 0x0001], %f11
	.word 0xd68008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa1902006  ! 284: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd647e001  ! 285: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x87802080  ! 286: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81510000  ! 287: RDPR_TICK	rdpr	%tick, %r0
	.word 0x9f802001  ! 288: SIR	sir	0x0001
	.word 0x81510000  ! 289: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d90220d  ! 290: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 291: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x92d52001  ! 292: UMULcc_I	umulcc 	%r20, 0x0001, %r9
	.word 0x91d020b2  ! 293: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa7540000  ! 294: RDPR_GL	rdpr	%-, %r19
	.word 0x87902076  ! 295: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0xe62fe001  ! 296: STB_I	stb	%r19, [%r31 + 0x0001]
mondo_0_104:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92c00a  ! 297: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0xe6d80e40  ! 298: LDXA_R	ldxa	[%r0, %r0] 0x72, %r19
mondo_0_105:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 299: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
debug_0_106:
	setx debug_0_106 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 300: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f6a4004  ! 301: SDIVX_R	sdivx	%r9, %r4, %r7
	.word 0x93902007  ! 302: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_0_107:
	set 0xa2ddf98, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7520000  ! 304: RDPR_PIL	rdpr	%pil, %r19
	.word 0x99902000  ! 305: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
tagged_0_108:
	tsubcctv %r9, 0x1267, %r23
	.word 0xe607e001  ! 306: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x93902000  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_109:
	setx debug_0_109 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 308: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 309: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93d02035  ! 310: Tcc_I	tne	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 311: LDX_R	ldx	[%r31 + %r0], %r19
mondo_0_110:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 312: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0x8d9020fc  ! 313: WRPR_PSTATE_I	wrpr	%r0, 0x00fc, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a01968  ! 314: FqTOd	dis not found

	.word 0x93902000  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc08008a0  ! 316: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x3c800001  ! 317: BPOS	bpos,a	<label_0x1>
change_to_randtl_0_112:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_112:
	.word 0x8f902001  ! 318: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc047c000  ! 319: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0xc0800c60  ! 320: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r0
	.word 0xc0c80e40  ! 321: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r0
mondo_0_113:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d908002  ! 322: WRPR_WSTATE_R	wrpr	%r2, %r2, %wstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 323: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802016  ! 325: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02035  ! 326: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81510000  ! 327: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8ac4a001  ! 328: ADDCcc_I	addccc 	%r18, 0x0001, %r5
	.word 0x8d902435  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0435, %pstate
change_to_randtl_0_114:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_114:
	.word 0x8f902000  ! 330: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_htba_0_115:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 331: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_0_116:
	tsubcctv %r18, 0x1cf4, %r16
	.word 0xca07e001  ! 332: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xa1902008  ! 333: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xcb1fe001  ! 334: LDDF_I	ldd	[%r31, 0x0001], %f5
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 335: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcac804a0  ! 336: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0xa550c000  ! 337: RDPR_TT	rdpr	%tt, %r18
	.word 0xe4c7e010  ! 338: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x9f802001  ! 339: SIR	sir	0x0001
debug_0_117:
	mov 8, %r18
	.word 0xe4f00852  ! 340: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_118)) -> intp(0,1,3)
xir_0_118:
	.word 0xa981e001  ! 341: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xe4800b60  ! 342: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0x87802089  ! 343: WRASI_I	wr	%r0, 0x0089, %asi
debug_0_119:
	mov 0x38, %r18
	.word 0xfef00b12  ! 344: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe51fc000  ! 345: LDDF_R	ldd	[%r31, %r0], %f18
	.word 0x93902003  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_0_120:
	tsubcctv %r21, 0x1605, %r5
	.word 0xe407e001  ! 347: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_htba_0_121:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 348: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902004  ! 349: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe48804a0  ! 350: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x879021e9  ! 351: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0x87902074  ! 352: WRPR_TT_I	wrpr	%r0, 0x0074, %tt
	.word 0xe41fe001  ! 353: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0xe48008a0  ! 354: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xab82c011  ! 355: WR_CLEAR_SOFTINT_R	wr	%r11, %r17, %clear_softint
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 356: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8350c000  ! 357: RDPR_TT	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_122)) -> intp(0,1,3)
xir_0_122:
	.word 0xa980a001  ! 358: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
intveclr_0_123:
	set 0x932b7f88, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 359: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 360: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x28700001  ! 361: BPLEU	<illegal instruction>
splash_cmpr_0_124:
	setx 0xbb523b07021366c5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903b7d  ! 363: WRPR_PSTATE_I	wrpr	%r0, 0x1b7d, %pstate
	.word 0x93902003  ! 364: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802016  ! 365: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99902003  ! 366: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87802014  ! 367: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 368: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99500000  ! 369: RDPR_TPC	rdpr	%tpc, %r12
DS_0_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_0_126:
	tsubcctv %r16, 0x15cc, %r22
	.word 0xd807e001  ! 371: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902202  ! 372: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0xd8c804a0  ! 373: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 374: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_0_127:
	setx 0xc6835aae8d0b33f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 375: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 376: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa3480000  ! 377: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_0_128:
	set 0xe8a0dfc6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe22fe001  ! 380: STB_I	stb	%r17, [%r31 + 0x0001]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 381: LDX_R	ldx	[%r31 + %r0], %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_129)) -> intp(0,1,3)
xir_0_129:
	.word 0xa984e001  ! 382: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_130)) -> intp(0,1,3)
xir_0_130:
	.word 0xa980e001  ! 383: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x93902007  ! 384: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902005  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_0_131:
	set 0xb4c985ad, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 387: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_cmpr_0_132:
	setx 0xa4e2b753fe36ea0b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 388: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2800ac0  ! 389: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
	.word 0xe20fe001  ! 390: LDUB_I	ldub	[%r31 + 0x0001], %r17
	ta	T_CHANGE_HPRIV	! macro
tagged_0_133:
	taddcctv %r3, 0x1751, %r18
	.word 0xe207e001  ! 392: LDUW_I	lduw	[%r31 + 0x0001], %r17
debug_0_134:
	mov 0x38, %r18
	.word 0xfef00b12  ! 393: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790206a  ! 394: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0xe297e010  ! 395: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0x87802088  ! 396: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe327c011  ! 397: STF_R	st	%f17, [%r17, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da01973  ! 398: FqTOd	dis not found

mondo_0_136:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d924000  ! 399: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
splash_lsu_0_137:
	setx 0x65ad8aea2e031b05, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 401: SIR	sir	0x0001
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 402: LDX_R	ldx	[%r31 + %r0], %r6
splash_cmpr_0_138:
	setx 0x7fd744575d7d694c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 403: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_139:
	setx 0xd90dd30c18837882, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 404: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcc57e001  ! 405: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0x87902179  ! 406: WRPR_TT_I	wrpr	%r0, 0x0179, %tt
	.word 0x93a049c0  ! 407: FDIVd	fdivd	%f32, %f0, %f40
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 408: LDX_R	ldx	[%r31 + %r0], %r9
tagged_0_140:
	tsubcctv %r13, 0x1979, %r24
	.word 0xd207e001  ! 409: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd21fc000  ! 410: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x87802004  ! 411: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8849c014  ! 412: MULX_R	mulx 	%r7, %r20, %r4
debug_0_141:
	mov 8, %r18
	.word 0xdef00852  ! 413: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x93902002  ! 414: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802010  ! 415: WRASI_I	wr	%r0, 0x0010, %asi
splash_lsu_0_142:
	setx 0x7fd03f8114817ec9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 416: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_143:
	taddcctv %r3, 0x13b5, %r9
	.word 0xc807e001  ! 417: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x93454000  ! 418: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xa5450000  ! 419: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xe527e001  ! 420: STF_I	st	%f18, [0x0001, %r31]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4bfc034  ! 422: STDA_R	stda	%r18, [%r31 + %r20] 0x01
mondo_0_144:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d940005  ! 423: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xe48008a0  ! 424: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x81982e47  ! 425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
splash_cmpr_0_145:
	setx 0xfb05ebde6ea14864, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 428: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x93d02034  ! 429: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902002  ! 430: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe4d004a0  ! 431: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
mondo_0_146:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c00c  ! 432: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 433: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_147:
	mov 8, %r18
	.word 0xd4f00852  ! 434: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_0_148:
	setx debug_0_148 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 435: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81464000  ! 436: RD_STICK_CMPR_REG	stbar
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_149)) -> intp(0,1,3)
xir_0_149:
	.word 0xa9852001  ! 437: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
intveclr_0_150:
	set 0xb4538387, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 438: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027bb  ! 439: WRPR_PSTATE_I	wrpr	%r0, 0x07bb, %pstate
	.word 0xc127e001  ! 440: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc05fe001  ! 441: LDX_I	ldx	[%r31 + 0x0001], %r0
tagged_0_151:
	taddcctv %r25, 0x1e5a, %r5
	.word 0xc007e001  ! 442: LDUW_I	lduw	[%r31 + 0x0001], %r0
DS_0_152:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x9f51af11	! Random illegal ?
	.word 0xd9130012  ! 1: LDQF_R	-	[%r12, %r18], %f12
	.word 0x99a4882c  ! 443: FADDs	fadds	%f18, %f12, %f12
	.word 0xa1902000  ! 444: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902001  ! 445: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879020ba  ! 446: WRPR_TT_I	wrpr	%r0, 0x00ba, %tt
	.word 0x91d02034  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802058  ! 448: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd8c80e60  ! 449: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r12
	.word 0x2c800001  ! 450: BNEG	bneg,a	<label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 451: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 452: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88008a0  ! 453: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xab804009  ! 454: WR_CLEAR_SOFTINT_R	wr	%r1, %r9, %clear_softint
	.word 0xa9464000  ! 455: RD_STICK_CMPR_REG	rd	%-, %r20
debug_0_153:
	mov 8, %r18
	.word 0xe8f00852  ! 456: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
debug_0_154:
	setx debug_0_154 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 457: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_155:
	taddcctv %r17, 0x154d, %r22
	.word 0xe807e001  ! 458: LDUW_I	lduw	[%r31 + 0x0001], %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 459: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x38700001  ! 460: BPGU	<illegal instruction>
intveclr_0_156:
	set 0x72320fd9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 461: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_157:
	setx 0xd0b52251859e5293, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 463: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_158)) -> intp(0,1,3)
xir_0_158:
	.word 0xa9826001  ! 464: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x22800001  ! 465: BE	be,a	<label_0x1>
	.word 0x91d020b2  ! 466: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe81fc000  ! 467: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x8d90390f  ! 468: WRPR_PSTATE_I	wrpr	%r0, 0x190f, %pstate
	.word 0x8d902e10  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0x28700001  ! 470: BPLEU	<illegal instruction>
	.word 0xe927e001  ! 471: STF_I	st	%f20, [0x0001, %r31]
	.word 0xe89fe001  ! 472: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
mondo_0_159:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 473: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 474: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x91d02034  ! 475: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_0_160:
	tsubcctv %r22, 0x1012, %r21
	.word 0xe807e001  ! 476: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x87802020  ! 477: WRASI_I	wr	%r0, 0x0020, %asi
tagged_0_161:
	taddcctv %r22, 0x1f63, %r6
	.word 0xe807e001  ! 478: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe937e001  ! 479: STQF_I	-	%f20, [0x0001, %r31]
mondo_0_162:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d944004  ! 480: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x93902006  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802004  ! 482: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 483: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_163:
	setx debug_0_163 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790238f  ! 485: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
debug_0_164:
	mov 0x38, %r18
	.word 0xfef00b12  ! 486: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_165:
	setx 0x0d392ee7bc88311b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_166:
	setx debug_0_166 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 488: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_167:
	setx 0xb914164f30a37c39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 489: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_168:
	set 0x7ae1df04, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 490: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87a289a0  ! 491: FDIVs	fdivs	%f10, %f0, %f3
intveclr_0_169:
	set 0x22120ce2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 492: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_170:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f4, %f16
	.word 0x8fb4c310  ! 493: ALIGNADDRESS	alignaddr	%r19, %r16, %r7
	.word 0x87802089  ! 494: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xce57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r7
tagged_0_171:
	taddcctv %r24, 0x1e7f, %r4
	.word 0xce07e001  ! 496: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xa1902007  ! 497: WRPR_GL_I	wrpr	%r0, 0x0007, %-
debug_0_172:
	setx debug_0_172 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 498: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_173)) -> intp(0,1,3)
xir_0_173:
	.word 0xa9842001  ! 499: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x28800001  ! 500: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01966  ! 502: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_0_175)) -> intp(0,1,3)
xir_0_175:
	.word 0xa9836001  ! 503: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x81460000  ! 504: RD_STICK_REG	stbar
	.word 0x8d903709  ! 505: WRPR_PSTATE_I	wrpr	%r0, 0x1709, %pstate
	.word 0xda9fc020  ! 506: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xda1fe001  ! 507: LDD_I	ldd	[%r31 + 0x0001], %r13
mondo_0_176:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d918014  ! 508: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x8790234c  ! 509: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0x879021c2  ! 510: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
	.word 0x93a149a7  ! 511: FDIVs	fdivs	%f5, %f7, %f9
splash_cmpr_0_177:
	setx 0x4570112630ef4c40, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 512: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 513: LDX_R	ldx	[%r31 + %r0], %r9
mondo_0_178:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 514: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xd337c010  ! 515: STQF_R	-	%f9, [%r16, %r31]
	.word 0x91d02033  ! 516: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd2d7e030  ! 517: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
	.word 0x87802010  ! 518: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_179)) -> intp(0,1,3)
xir_0_179:
	.word 0xa982e001  ! 519: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da01972  ! 520: FqTOd	dis not found

	.word 0x81460000  ! 521: RD_STICK_REG	stbar
DS_0_181:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f0, %f18
	.word 0xa7b1c301  ! 522: ALIGNADDRESS	alignaddr	%r7, %r1, %r19
	.word 0xa7802001  ! 523: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x0001, %-
splash_cmpr_0_182:
	setx 0x8dad23c65939489d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 524: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa981c00d  ! 525: WR_SET_SOFTINT_R	wr	%r7, %r13, %set_softint
	.word 0x91480000  ! 526: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd01fc000  ! 527: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0x20800001  ! 528: BN	bn,a	<label_0x1>
splash_lsu_0_183:
	setx 0xde57963ff25faf83, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 529: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_184:
	setx debug_0_184 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa7a01a69  ! 532: FqTOi	fqtoi	
splash_lsu_0_185:
	setx 0x057b0a69b0dd62bd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 533: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_186:
	tsubcctv %r18, 0x1c7f, %r22
	.word 0xe607e001  ! 534: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe68008a0  ! 535: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe61fc000  ! 536: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902007  ! 537: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x83d020b5  ! 538: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa1902002  ! 539: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_187)) -> intp(0,1,3)
xir_0_187:
	.word 0xa9802001  ! 540: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x91936001  ! 541: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
splash_tba_0_188:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 542: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_189:
	mov 8, %r18
	.word 0xd6f00852  ! 543: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x93902004  ! 544: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_190)) -> intp(0,1,3)
xir_0_190:
	.word 0xa9816001  ! 545: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x9190a001  ! 546: WRPR_PIL_I	wrpr	%r2, 0x0001, %pil
mondo_0_191:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 547: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xa3464000  ! 548: RD_STICK_CMPR_REG	rd	%-, %r17
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 549: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_192:
	mov 8, %r18
	.word 0xdaf00852  ! 550: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe20fe001  ! 551: LDUB_I	ldub	[%r31 + 0x0001], %r17
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 552: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 553: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976d2001  ! 554: SDIVX_I	sdivx	%r20, 0x0001, %r11
	.word 0xa9850007  ! 555: WR_SET_SOFTINT_R	wr	%r20, %r7, %set_softint
	.word 0x81a2cd25  ! 556: FsMULd	fsmuld	%f11, %f36, %f0
	.word 0x93d02033  ! 557: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91942001  ! 558: WRPR_PIL_I	wrpr	%r16, 0x0001, %pil
mondo_0_194:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d91000d  ! 559: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
	.word 0x93902001  ! 560: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790200a  ! 561: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 562: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 563: BCS	bcs,a	<label_0x1>
	.word 0xc0c7e030  ! 564: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
splash_cmpr_0_195:
	setx 0x3ac297f8fb642234, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 565: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9036e2  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x16e2, %pstate
splash_lsu_0_196:
	setx 0x1521be4dd84ac745, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 567: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_197:
	mov 0x38, %r18
	.word 0xfef00b12  ! 568: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc04fe001  ! 569: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xc09fe001  ! 570: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
intveclr_0_198:
	set 0x45b44f48, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 571: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc05fc000  ! 572: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xab848006  ! 573: WR_CLEAR_SOFTINT_R	wr	%r18, %r6, %clear_softint
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x876ce001  ! 574: SDIVX_I	sdivx	%r19, 0x0001, %r3
	.word 0xc62fc006  ! 575: STB_R	stb	%r3, [%r31 + %r6]
intveclr_0_200:
	set 0x695ee9df, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc737e001  ! 577: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x87902281  ! 578: WRPR_TT_I	wrpr	%r0, 0x0281, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f6ce001  ! 579: SDIVX_I	sdivx	%r19, 0x0001, %r7
debug_0_202:
	setx debug_0_202 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 580: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903b60  ! 581: WRPR_PSTATE_I	wrpr	%r0, 0x1b60, %pstate
debug_0_203:
	mov 0x38, %r18
	.word 0xfef00b12  ! 582: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8adac008  ! 583: SMULcc_R	smulcc 	%r11, %r8, %r5
	.word 0xca800b60  ! 584: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x8d903284  ! 585: WRPR_PSTATE_I	wrpr	%r0, 0x1284, %pstate
debug_0_204:
	mov 8, %r18
	.word 0xe4f00852  ! 586: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xcad804a0  ! 587: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x8edc400d  ! 588: SMULcc_R	smulcc 	%r17, %r13, %r7
	.word 0x91d02034  ! 589: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xce4fc000  ! 591: LDSB_R	ldsb	[%r31 + %r0], %r7
debug_0_205:
	setx debug_0_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 592: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_206:
	tsubcctv %r25, 0x1de7, %r26
	.word 0xce07e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r7
mondo_0_207:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d90000a  ! 594: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 595: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce2fe001  ! 596: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0xa1902004  ! 597: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_0_208:
	setx debug_0_208 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 598: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 599: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_0_209:
	set 0x69431fa8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 600: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_210:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 601: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93450000  ! 602: RD_SET_SOFTINT	rd	%set_softint, %r9
debug_0_211:
	setx debug_0_211 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 603: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_212:
	mov 0x38, %r18
	.word 0xfef00b12  ! 604: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902002  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02035  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902325  ! 607: WRPR_TT_I	wrpr	%r0, 0x0325, %tt
splash_lsu_0_213:
	setx 0x3712c7b4eebd6bc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 608: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_214:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d900011  ! 609: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x87902249  ! 610: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0xd2d804a0  ! 611: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
tagged_0_215:
	taddcctv %r23, 0x1d06, %r1
	.word 0xd207e001  ! 612: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd27fe001  ! 613: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0xd2c7e010  ! 614: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	.word 0xd28fe010  ! 615: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x93450000  ! 616: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xd397e001  ! 617: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0x8d802004  ! 618: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd24fe001  ! 619: LDSB_I	ldsb	[%r31 + 0x0001], %r9
change_to_randtl_0_216:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_216:
	.word 0x8f902001  ! 620: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9024e8  ! 621: WRPR_PSTATE_I	wrpr	%r0, 0x04e8, %pstate
	.word 0xd33fc011  ! 622: STDF_R	std	%f9, [%r17, %r31]
	.word 0x91942001  ! 623: WRPR_PIL_I	wrpr	%r16, 0x0001, %pil
	.word 0x8d902229  ! 624: WRPR_PSTATE_I	wrpr	%r0, 0x0229, %pstate
tagged_0_217:
	taddcctv %r7, 0x18a1, %r12
	.word 0xd207e001  ! 625: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x93902002  ! 626: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802063  ! 627: WRASI_I	wr	%r0, 0x0063, %asi
debug_0_218:
	mov 0x38, %r18
	.word 0xfef00b12  ! 628: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0xd29fe001  ! 630: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
mondo_0_219:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94800c  ! 631: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0x87802088  ! 632: WRASI_I	wr	%r0, 0x0088, %asi
DS_0_220:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f14, %f30
	.word 0xa3b24314  ! 633: ALIGNADDRESS	alignaddr	%r9, %r20, %r17
	.word 0x8d90277d  ! 634: WRPR_PSTATE_I	wrpr	%r0, 0x077d, %pstate
	.word 0x2e800001  ! 635: BVS	bvs,a	<label_0x1>
	.word 0xe29004a0  ! 636: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x9f802001  ! 637: SIR	sir	0x0001
	.word 0xa1902007  ! 638: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_0_221:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92800c  ! 639: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
DS_0_222:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 640: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe257e001  ! 641: LDSH_I	ldsh	[%r31 + 0x0001], %r17
tagged_0_223:
	taddcctv %r23, 0x1ed0, %r18
	.word 0xe207e001  ! 642: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe28008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe227e001  ! 644: STW_I	stw	%r17, [%r31 + 0x0001]
tagged_0_224:
	tsubcctv %r22, 0x1bfa, %r9
	.word 0xe207e001  ! 645: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_lsu_0_225:
	setx 0x45dcc46e29a82941, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_226:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3350000  ! 1: STQF_R	-	%f17, [%r0, %r20]
	normalw
	.word 0x93458000  ! 647: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x91d02035  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3c800001  ! 649: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 651: LDX_R	ldx	[%r31 + %r0], %r9
DS_0_227:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f4, %f14
	.word 0x8fb00306  ! 652: ALIGNADDRESS	alignaddr	%r0, %r6, %r7
	.word 0xce8008a0  ! 653: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
change_to_randtl_0_228:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_228:
	.word 0x8f902002  ! 654: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_0_229:
	taddcctv %r23, 0x1854, %r22
	.word 0xce07e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xced804a0  ! 656: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 657: LDX_R	ldx	[%r31 + %r0], %r7
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 658: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_230)) -> intp(0,1,3)
xir_0_230:
	.word 0xa9822001  ! 659: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0x93d020b5  ! 660: Tcc_I	tne	icc_or_xcc, %r0 + 181
tagged_0_231:
	taddcctv %r23, 0x13f2, %r24
	.word 0xce07e001  ! 661: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8f520000  ! 662: RDPR_PIL	<illegal instruction>
debug_0_232:
	setx debug_0_232 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 663: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9adcc004  ! 664: SMULcc_R	smulcc 	%r19, %r4, %r13
tagged_0_233:
	taddcctv %r12, 0x12c2, %r12
	.word 0xda07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad804a0  ! 666: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
splash_cmpr_0_234:
	setx 0xc64ec3f801ae44f3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 667: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802020  ! 668: WRASI_I	wr	%r0, 0x0020, %asi
tagged_0_235:
	taddcctv %r8, 0x1237, %r22
	.word 0xda07e001  ! 669: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xa190200b  ! 670: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x97450000  ! 671: RD_SET_SOFTINT	rd	%set_softint, %r11
debug_0_236:
	mov 0x38, %r18
	.word 0xfef00b12  ! 672: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_237:
	mov 8, %r18
	.word 0xdef00852  ! 673: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_tba_0_238:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 674: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02034  ! 675: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
intveclr_0_239:
	set 0xc153a31b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 677: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879022d9  ! 678: WRPR_TT_I	wrpr	%r0, 0x02d9, %tt
	.word 0x8d9034dc  ! 679: WRPR_PSTATE_I	wrpr	%r0, 0x14dc, %pstate
	.word 0xd68008a0  ! 680: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879021f9  ! 681: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
	.word 0xd657c000  ! 682: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xd68008a0  ! 683: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_240)) -> intp(0,1,3)
xir_0_240:
	.word 0xa9802001  ! 684: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x8d902f1a  ! 685: WRPR_PSTATE_I	wrpr	%r0, 0x0f1a, %pstate
	.word 0xd6d80e60  ! 686: LDXA_R	ldxa	[%r0, %r0] 0x73, %r11
tagged_0_241:
	taddcctv %r20, 0x18ec, %r2
	.word 0xd607e001  ! 687: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x99902001  ! 688: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x99902003  ! 689: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd647c000  ! 690: LDSW_R	ldsw	[%r31 + %r0], %r11
splash_lsu_0_242:
	setx 0xc5ada2da4610ee0b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 691: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 692: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd6ffc024  ! 693: SWAPA_R	swapa	%r11, [%r31 + %r4] 0x01
splash_cmpr_0_243:
	setx 0xe83009e9df5b07c5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_244:
	setx debug_0_244 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 695: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ae001  ! 696: SDIVX_I	sdivx	%r11, 0x0001, %r11
debug_0_246:
	mov 8, %r18
	.word 0xd8f00852  ! 697: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x879020ad  ! 698: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0x8d9028cb  ! 699: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
	.word 0xd6c00e60  ! 700: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r11
debug_0_247:
	setx debug_0_247 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 701: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_248:
	mov 0x38, %r18
	.word 0xfef00b12  ! 702: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_249:
	taddcctv %r26, 0x1e8e, %r3
	.word 0xd607e001  ! 704: LDUW_I	lduw	[%r31 + 0x0001], %r11
tagged_0_250:
	tsubcctv %r13, 0x1ea9, %r16
	.word 0xd607e001  ! 705: LDUW_I	lduw	[%r31 + 0x0001], %r11
debug_0_251:
	mov 0x38, %r18
	.word 0xfef00b12  ! 706: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902249  ! 707: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0xd627c004  ! 708: STW_R	stw	%r11, [%r31 + %r4]
	.word 0xd6d7e010  ! 709: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0xd68008a0  ! 710: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_0_252:
	set 0x5d361bb2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 711: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd647e001  ! 712: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x93902001  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 714: WRASI_I	wr	%r0, 0x0004, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 715: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727c004  ! 716: STF_R	st	%f11, [%r4, %r31]
	.word 0xd6800c00  ! 717: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
	.word 0x9150c000  ! 718: RDPR_TT	rdpr	%tt, %r8
mondo_0_253:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d94800a  ! 719: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
debug_0_254:
	mov 0x38, %r18
	.word 0xfef00b12  ! 720: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x82d88013  ! 721: SMULcc_R	smulcc 	%r2, %r19, %r1
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a01973  ! 722: FqTOd	dis not found

	.word 0xc43fe001  ! 723: STD_I	std	%r2, [%r31 + 0x0001]
	.word 0xc527c013  ! 724: STF_R	st	%f2, [%r19, %r31]
	.word 0x87902176  ! 725: WRPR_TT_I	wrpr	%r0, 0x0176, %tt
intveclr_0_256:
	set 0x942fbdbd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 726: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 727: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_htba_0_257:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 728: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_258:
	mov 8, %r18
	.word 0xd4f00852  ! 729: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
intveclr_0_259:
	set 0xefcd8bb8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 730: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_260:
	tsubcctv %r24, 0x145a, %r26
	.word 0xc407e001  ! 731: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8d902ae9  ! 732: WRPR_PSTATE_I	wrpr	%r0, 0x0ae9, %pstate
	.word 0x26800001  ! 733: BL	bl,a	<label_0x1>
	.word 0x87902000  ! 734: WRPR_TT_I	wrpr	%r0, 0x0000, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 735: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_261:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d91c004  ! 736: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0xa190200d  ! 737: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_0_262:
	setx 0xcb88388ebe4e8d27, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 738: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc53fe001  ! 739: STDF_I	std	%f2, [0x0001, %r31]
	.word 0xc4800aa0  ! 740: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_263)) -> intp(0,1,3)
xir_0_263:
	.word 0xa981e001  ! 741: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
intveclr_0_264:
	set 0x7734747d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 742: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_265:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_265:
	.word 0x8f902004  ! 743: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02032  ! 744: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_266:
	mov 0x38, %r18
	.word 0xfef00b12  ! 745: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_267)) -> intp(0,1,3)
xir_0_267:
	.word 0xa9852001  ! 746: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
tagged_0_268:
	tsubcctv %r3, 0x1248, %r10
	.word 0xc407e001  ! 748: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xa190200b  ! 749: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_269:
	setx 0x21a990a7b72d1aef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 751: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 752: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_0_270:
	tsubcctv %r14, 0x1f56, %r6
	.word 0xc407e001  ! 753: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x879023a5  ! 754: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
debug_0_271:
	setx debug_0_271 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 755: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 756: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91d02032  ! 757: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802058  ! 758: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8198240f  ! 759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0x87902017  ! 760: WRPR_TT_I	wrpr	%r0, 0x0017, %tt
splash_cmpr_0_272:
	setx 0xc3fdcc67b4268ccd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 761: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 762: WRPR_GL_I	wrpr	%r0, 0x0004, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_273)) -> intp(0,1,3)
xir_0_273:
	.word 0xa9802001  ! 763: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x81464000  ! 764: RD_STICK_CMPR_REG	stbar
mondo_0_274:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d93000c  ! 765: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x93902005  ! 767: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879022a0  ! 768: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	.word 0xc137e001  ! 769: STQF_I	-	%f0, [0x0001, %r31]
mondo_0_275:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 770: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0x81510000  ! 771: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa5480000  ! 772: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 773: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 774: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa5500000  ! 775: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x8d9024da  ! 776: WRPR_PSTATE_I	wrpr	%r0, 0x04da, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_276)) -> intp(0,1,3)
xir_0_276:
	.word 0xa9816001  ! 777: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x8d802004  ! 778: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe4d7e020  ! 779: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0x879020d1  ! 780: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
tagged_0_277:
	taddcctv %r17, 0x1403, %r3
	.word 0xe407e001  ! 781: LDUW_I	lduw	[%r31 + 0x0001], %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4c80e60  ! 783: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r18
	.word 0x8145c000  ! 784: RD_TICK_CMPR_REG	stbar
	.word 0xc127e001  ! 785: STF_I	st	%f0, [0x0001, %r31]
	.word 0xc08008a0  ! 786: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8d902140  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0140, %pstate
	.word 0xc08fe010  ! 788: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0xc08008a0  ! 789: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8790230b  ! 790: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	.word 0x8d9037c9  ! 791: WRPR_PSTATE_I	wrpr	%r0, 0x17c9, %pstate
splash_cmpr_0_278:
	setx 0x4eaf4ccdfec882dc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 792: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc097e030  ! 793: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
	.word 0x87902256  ! 794: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
	.word 0x8790214c  ! 795: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	.word 0xc057c000  ! 796: LDSH_R	ldsh	[%r31 + %r0], %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_279)) -> intp(0,1,3)
xir_0_279:
	.word 0xa9852001  ! 797: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xc0c004a0  ! 798: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
debug_0_280:
	setx debug_0_280 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 799: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc11fc000  ! 800: LDDF_R	ldd	[%r31, %r0], %f0
change_to_randtl_0_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_281:
	.word 0x8f902003  ! 801: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xc097e030  ! 802: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
tagged_0_282:
	tsubcctv %r20, 0x10f2, %r6
	.word 0xc007e001  ! 803: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x87902364  ! 804: WRPR_TT_I	wrpr	%r0, 0x0364, %tt
debug_0_283:
	setx debug_0_283 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 805: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8945c000  ! 807: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0x9f802001  ! 808: SIR	sir	0x0001
tagged_0_284:
	tsubcctv %r17, 0x1486, %r17
	.word 0xc807e001  ! 809: LDUW_I	lduw	[%r31 + 0x0001], %r4
DS_0_285:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7344012  ! 1: STQF_R	-	%f11, [%r18, %r17]
	normalw
	.word 0x93458000  ! 810: RD_SOFTINT_REG	rd	%softint, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_286)) -> intp(0,1,3)
xir_0_286:
	.word 0xa980a001  ! 811: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
intveclr_0_287:
	set 0xfb746c67, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 812: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_288:
	mov 8, %r18
	.word 0xdaf00852  ! 813: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xd21fe001  ! 814: LDD_I	ldd	[%r31 + 0x0001], %r9
debug_0_289:
	setx debug_0_289 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 815: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa945c000  ! 816: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe8900e60  ! 817: LDUHA_R	lduha	[%r0, %r0] 0x73, %r20
	.word 0xa7450000  ! 818: RD_SET_SOFTINT	rd	%set_softint, %r19
tagged_0_290:
	tsubcctv %r4, 0x13fd, %r25
	.word 0xe607e001  ! 819: LDUW_I	lduw	[%r31 + 0x0001], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_291)) -> intp(0,1,3)
xir_0_291:
	.word 0xa984e001  ! 820: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x93902004  ! 821: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802088  ! 822: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe65fe001  ! 823: LDX_I	ldx	[%r31 + 0x0001], %r19
	.word 0x87902256  ! 824: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 825: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902000  ! 826: WRPR_TT_I	wrpr	%r0, 0x0000, %tt
splash_lsu_0_292:
	setx 0xbb593520390f675f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 827: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe69004a0  ! 828: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 830: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902186  ! 831: WRPR_TT_I	wrpr	%r0, 0x0186, %tt
debug_0_293:
	mov 0x38, %r18
	.word 0xfef00b12  ! 832: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe61fe001  ! 833: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0x81982e5d  ! 834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0x87902161  ! 835: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
	.word 0xab850013  ! 836: WR_CLEAR_SOFTINT_R	wr	%r20, %r19, %clear_softint
DS_0_294:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 837: SAVE_R	save	%r31, %r0, %r31
tagged_0_295:
	taddcctv %r12, 0x1ab5, %r5
	.word 0xe607e001  ! 838: LDUW_I	lduw	[%r31 + 0x0001], %r19
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 839: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_296:
	mov 0x38, %r18
	.word 0xfef00b12  ! 840: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02035  ! 841: Tcc_I	tne	icc_or_xcc, %r0 + 53
tagged_0_297:
	taddcctv %r20, 0x121c, %r4
	.word 0xe607e001  ! 842: LDUW_I	lduw	[%r31 + 0x0001], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_298)) -> intp(0,1,3)
xir_0_298:
	.word 0xa982a001  ! 843: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xe737c013  ! 844: STQF_R	-	%f19, [%r19, %r31]
	.word 0xe71fc000  ! 845: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x87a00dcd  ! 846: FdMULq	fdmulq	
debug_0_299:
	mov 0x38, %r18
	.word 0xfef00b12  ! 847: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_300)) -> intp(0,1,3)
xir_0_300:
	.word 0xa980a001  ! 848: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xa190200f  ! 849: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc6dfe020  ! 850: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0xa1902002  ! 851: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_301)) -> intp(0,1,3)
xir_0_301:
	.word 0xa9836001  ! 852: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xc697e010  ! 853: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r3
	.word 0xc737c00d  ! 854: STQF_R	-	%f3, [%r13, %r31]
	.word 0x93902000  ! 855: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xad832001  ! 856: WR_SOFTINT_REG_I	wr	%r12, 0x0001, %softint
	.word 0xa9818000  ! 857: WR_SET_SOFTINT_R	wr	%r6, %r0, %set_softint
	.word 0xc6c804a0  ! 858: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0xa190200c  ! 859: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xc68008a0  ! 860: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_302)) -> intp(0,1,3)
xir_0_302:
	.word 0xa980e001  ! 861: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x87802004  ! 862: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc60fc000  ! 863: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0x93d02033  ! 864: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc657e001  ! 865: LDSH_I	ldsh	[%r31 + 0x0001], %r3
mondo_0_303:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 866: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xc737e001  ! 867: STQF_I	-	%f3, [0x0001, %r31]
	.word 0xc64fe001  ! 868: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 869: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_304)) -> intp(0,1,3)
xir_0_304:
	.word 0xa9822001  ! 870: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
splash_cmpr_0_305:
	setx 0xf009c0451dce55b0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 871: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_306:
	set 0x9ad3e492, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 872: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc73fe001  ! 873: STDF_I	std	%f3, [0x0001, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_307)) -> intp(0,1,3)
xir_0_307:
	.word 0xa982a001  ! 874: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc697e000  ! 876: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
DS_0_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xa94d82ad	! Random illegal ?
	.word 0xcd15000a  ! 1: LDQF_R	-	[%r20, %r10], %f6
	.word 0x87a48821  ! 877: FADDs	fadds	%f18, %f1, %f3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 878: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x8d802000  ! 879: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc67fe001  ! 880: SWAP_I	swap	%r3, [%r31 + 0x0001]
debug_0_309:
	mov 8, %r18
	.word 0xd0f00852  ! 881: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x87902021  ! 882: WRPR_TT_I	wrpr	%r0, 0x0021, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_310)) -> intp(0,1,3)
xir_0_310:
	.word 0xa9832001  ! 883: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 884: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xa1902002  ! 885: WRPR_GL_I	wrpr	%r0, 0x0002, %-
debug_0_311:
	mov 0x38, %r18
	.word 0xfef00b12  ! 886: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_312:
	set 0xaaa930f2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 887: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_313:
	setx debug_0_313 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 888: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 889: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_0_314:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91942001  ! 891: WRPR_PIL_I	wrpr	%r16, 0x0001, %pil
debug_0_315:
	mov 8, %r18
	.word 0xdcf00852  ! 892: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_0_316:
	setx debug_0_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 893: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8950c000  ! 894: RDPR_TT	rdpr	%tt, %r4
	.word 0xc89004a0  ! 895: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0xc927c001  ! 896: STF_R	st	%f4, [%r1, %r31]
	.word 0xc8c00e40  ! 897: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r4
debug_0_317:
	mov 0x38, %r18
	.word 0xfef00b12  ! 898: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879021c8  ! 899: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0xc8800b00  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r4
	.word 0xc857c000  ! 901: LDSH_R	ldsh	[%r31 + %r0], %r4
intveclr_0_318:
	set 0x3fad2892, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 902: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 903: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902004  ! 904: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0_319:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f2, %f2
	.word 0x8db4c313  ! 905: ALIGNADDRESS	alignaddr	%r19, %r19, %r6
	.word 0x87902323  ! 906: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
splash_cmpr_0_320:
	setx 0xc6eb2f3eb2e29a00, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 907: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_PRIV	! macro
debug_0_321:
	mov 8, %r18
	.word 0xd2f00852  ! 909: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_htba_0_322:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 910: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_323)) -> intp(0,1,3)
xir_0_323:
	.word 0xa982e001  ! 911: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
debug_0_324:
	mov 8, %r18
	.word 0xdcf00852  ! 912: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x87902185  ! 913: WRPR_TT_I	wrpr	%r0, 0x0185, %tt
	.word 0x8d903736  ! 914: WRPR_PSTATE_I	wrpr	%r0, 0x1736, %pstate
	.word 0x93902006  ! 915: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcd97e001  ! 916: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0xccc004a0  ! 917: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xcc9fe001  ! 918: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 919: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc77e001  ! 920: STX_I	stx	%r6, [%r31 + 0x0001]
	.word 0xcc3fe001  ! 921: STD_I	std	%r6, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_325)) -> intp(0,1,3)
xir_0_325:
	.word 0xa9852001  ! 922: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa1902001  ! 923: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xcc07c000  ! 924: LDUW_R	lduw	[%r31 + %r0], %r6
splash_cmpr_0_326:
	setx 0x4683fce392074d6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 925: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcd3fe001  ! 926: STDF_I	std	%f6, [0x0001, %r31]
	.word 0x93902004  ! 927: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87464000  ! 928: RD_STICK_CMPR_REG	rd	%-, %r3
splash_cmpr_0_327:
	setx 0x9dc301e9b6ff92dc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 929: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_328:
	set 0xc0b8e5d4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 930: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_329:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f2, %f2
	.word 0x91b50313  ! 931: ALIGNADDRESS	alignaddr	%r20, %r19, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 933: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_330:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d92000b  ! 934: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
tagged_0_331:
	taddcctv %r5, 0x19d5, %r16
	.word 0xd007e001  ! 935: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xa1902008  ! 936: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_0_332:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d93400b  ! 937: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
debug_0_333:
	mov 8, %r18
	.word 0xd2f00852  ! 938: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_lsu_0_334:
	setx 0x0248c86d36786145, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 939: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 940: RD_STICK_REG	stbar
	.word 0x93d02032  ! 941: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 942: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_335:
	taddcctv %r16, 0x1a90, %r22
	.word 0xd007e001  ! 943: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd09fe001  ! 944: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0x93902004  ! 945: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd08008a0  ! 946: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
mondo_0_336:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 947: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 948: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_337:
	setx debug_0_337 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 949: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 950: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 951: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 952: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 953: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200d  ! 955: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_338)) -> intp(0,1,3)
xir_0_338:
	.word 0xa9842001  ! 956: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
splash_cmpr_0_339:
	setx 0x10c395802cbcd51a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 957: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 958: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd0800a60  ! 959: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r8
	.word 0xab844006  ! 960: WR_CLEAR_SOFTINT_R	wr	%r17, %r6, %clear_softint
debug_0_340:
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 961: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 962: RDPR_TICK	<illegal instruction>
	.word 0x87500000  ! 963: RDPR_TPC	<illegal instruction>
	.word 0xa190200c  ! 964: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902006  ! 965: WRPR_GL_I	wrpr	%r0, 0x0006, %-
debug_0_341:
	mov 0x38, %r18
	.word 0xfef00b12  ! 966: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02033  ! 967: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d9038b1  ! 968: WRPR_PSTATE_I	wrpr	%r0, 0x18b1, %pstate
	.word 0x8780204f  ! 969: WRASI_I	wr	%r0, 0x004f, %asi
tagged_0_342:
	tsubcctv %r20, 0x1fca, %r12
	.word 0xc607e001  ! 970: LDUW_I	lduw	[%r31 + 0x0001], %r3
debug_0_343:
	setx debug_0_343 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 971: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 972: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_344:
	mov 0x38, %r18
	.word 0xfef00b12  ! 973: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b5  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 975: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_345:
	taddcctv %r26, 0x1835, %r15
	.word 0xc607e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_cmpr_0_346:
	setx 0x30d080eaebee1623, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 977: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b3  ! 978: Tcc_I	tne	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_347)) -> intp(0,1,3)
xir_0_347:
	.word 0xa982e001  ! 979: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x9f802001  ! 980: SIR	sir	0x0001
	.word 0xa1902000  ! 981: WRPR_GL_I	wrpr	%r0, 0x0000, %-
tagged_0_348:
	tsubcctv %r2, 0x10e6, %r2
	.word 0xc607e001  ! 982: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_0_349:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc3342001  ! 1: STQF_I	-	%f1, [0x0001, %r16]
	normalw
	.word 0x8f458000  ! 983: RD_SOFTINT_REG	rd	%softint, %r7
debug_0_350:
	mov 0x38, %r18
	.word 0xfef00b12  ! 984: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_351:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc5108008  ! 1: LDQF_R	-	[%r2, %r8], %f2
	.word 0xa5a44830  ! 985: FADDs	fadds	%f17, %f16, %f18
	.word 0xe48008a0  ! 986: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4c804a0  ! 987: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
splash_cmpr_0_352:
	setx 0xa961151880e9de74, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 988: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_353:
	set 0x635d6f09, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 989: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_354:
	mov 8, %r18
	.word 0xd2f00852  ! 990: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x20700001  ! 991: BPN	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_355)) -> intp(0,1,3)
xir_0_355:
	.word 0xa9822001  ! 992: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 994: RD_STICK_REG	stbar
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 995: LDX_R	ldx	[%r31 + %r0], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe457e001  ! 997: LDSH_I	ldsh	[%r31 + 0x0001], %r18
	.word 0xa1902005  ! 998: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe49fe001  ! 999: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1000: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa950c000  ! 1001: RDPR_TT	rdpr	%tt, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81a0196a  ! 1002: FqTOd	dis not found

change_to_randtl_0_357:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_357:
	.word 0x8f902004  ! 1003: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
debug_0_358:
	setx debug_0_358 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1004: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc08008a0  ! 1005: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x97500000  ! 1006: RDPR_TPC	rdpr	%tpc, %r11
debug_0_359:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1007: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902001  ! 1008: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_0_360:
	tsubcctv %r1, 0x1f94, %r7
	.word 0xd607e001  ! 1009: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 1010: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
debug_0_361:
	setx debug_0_361 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1011: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93520000  ! 1012: RDPR_PIL	rdpr	%pil, %r9
DS_0_362:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1013: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa1902001  ! 1014: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x22700001  ! 1015: BPE	<illegal instruction>
	.word 0xa190200e  ! 1016: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902260  ! 1017: WRPR_PSTATE_I	wrpr	%r0, 0x0260, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 1018: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x85480000  ! 1019: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
tagged_0_363:
	taddcctv %r26, 0x1710, %r18
	.word 0xc407e001  ! 1020: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x81b01021  ! 1021: SIAM	siam	1
	.word 0x93902003  ! 1022: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902005  ! 1023: WRPR_GL_I	wrpr	%r0, 0x0005, %-
intveclr_0_364:
	set 0xda6a660b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1024: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc49fe001  ! 1025: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1026: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e5e  ! 1027: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x81a00553  ! 1028: FSQRTd	fsqrt	
intveclr_0_365:
	set 0x1c1646a3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1029: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_366:
	set 0x9d36a2f8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1030: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_367:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x95a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xa7a50831  ! 1031: FADDs	fadds	%f20, %f17, %f19
	.word 0xe737e001  ! 1032: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xa5a30d27  ! 1033: FsMULd	fsmuld	%f12, %f38, %f18
DS_0_368:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f8, %f26
	.word 0xa3b4c310  ! 1034: ALIGNADDRESS	alignaddr	%r19, %r16, %r17
change_to_randtl_0_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_369:
	.word 0x8f902003  ! 1035: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe247c000  ! 1036: LDSW_R	ldsw	[%r31 + %r0], %r17
	.word 0xe2800bc0  ! 1037: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
	.word 0xe28008a0  ! 1038: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2900e40  ! 1039: LDUHA_R	lduha	[%r0, %r0] 0x72, %r17
	.word 0xa9450000  ! 1040: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0x87802016  ! 1041: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d9020ab  ! 1042: WRPR_PSTATE_I	wrpr	%r0, 0x00ab, %pstate
splash_htba_0_370:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1043: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02035  ! 1044: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 1045: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe8c004a0  ! 1046: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
debug_0_371:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1047: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802010  ! 1048: WRASI_I	wr	%r0, 0x0010, %asi
debug_0_372:
	mov 8, %r18
	.word 0xd2f00852  ! 1049: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
debug_0_373:
	setx debug_0_373 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1050: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97450000  ! 1051: RD_SET_SOFTINT	rd	%set_softint, %r11
tagged_0_374:
	tsubcctv %r5, 0x1e94, %r17
	.word 0xd607e001  ! 1052: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x83d02033  ! 1053: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8968a001  ! 1054: SDIVX_I	sdivx	%r2, 0x0001, %r4
splash_cmpr_0_376:
	setx 0xc10f39c3101d7629, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1055: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x84f9e001  ! 1056: SDIVcc_I	sdivcc 	%r7, 0x0001, %r2
	.word 0xc48008a0  ! 1057: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x91d020b5  ! 1058: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1059: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_377:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1060: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802058  ! 1061: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc48008a0  ! 1062: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x87802088  ! 1063: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc4800ac0  ! 1064: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r2
mondo_0_378:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 1065: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1066: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_379:
	setx debug_0_379 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1067: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_380:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d948002  ! 1068: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	.word 0xc48fe020  ! 1069: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	.word 0x95500000  ! 1070: RDPR_TPC	rdpr	%tpc, %r10
mondo_0_381:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91c006  ! 1071: WRPR_WSTATE_R	wrpr	%r7, %r6, %wstate
	.word 0x8d902f4e  ! 1072: WRPR_PSTATE_I	wrpr	%r0, 0x0f4e, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d6a2001  ! 1073: SDIVX_I	sdivx	%r8, 0x0001, %r6
	.word 0xcc57c000  ! 1074: LDSH_R	ldsh	[%r31 + %r0], %r6
	.word 0x91d02034  ! 1075: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02033  ! 1076: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_0_383:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1077: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_384:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d920008  ! 1078: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
DS_0_385:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1079: SAVE_R	save	%r31, %r0, %r31
	.word 0x9f802001  ! 1080: SIR	sir	0x0001
intveclr_0_386:
	set 0x5585b894, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1081: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 1082: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
intveclr_0_387:
	set 0x9e005f76, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1083: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1084: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902005  ! 1085: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xcd17c000  ! 1086: LDQF_R	-	[%r31, %r0], %f6
	.word 0xccdfe010  ! 1087: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
	.word 0xcc800a60  ! 1088: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r6
tagged_0_388:
	tsubcctv %r18, 0x1c60, %r24
	.word 0xcc07e001  ! 1089: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_389:
	set 0xc1f3e423, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1090: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 1091: RD_STICK_REG	stbar
splash_cmpr_0_390:
	setx 0x8edfee80930c0036, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1092: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902422  ! 1093: WRPR_PSTATE_I	wrpr	%r0, 0x0422, %pstate
	.word 0x2c800001  ! 1094: BNEG	bneg,a	<label_0x1>
	.word 0xa1902000  ! 1095: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xcc47e001  ! 1096: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0xa190200a  ! 1097: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa3480000  ! 1098: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x99a289eb  ! 1099: FDIVq	dis not found

	.word 0x97540000  ! 1100: RDPR_GL	<illegal instruction>
splash_cmpr_0_391:
	setx 0x452bdec9c8f5ff5c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1101: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_392)) -> intp(0,1,3)
xir_0_392:
	.word 0xa9842001  ! 1102: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xd6d004a0  ! 1103: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1104: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902084  ! 1105: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
	.word 0xd6cfe010  ! 1106: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
mondo_0_393:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 1107: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_394)) -> intp(0,1,3)
xir_0_394:
	.word 0xa982e001  ! 1108: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
mondo_0_395:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d920007  ! 1109: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0xd69fc020  ! 1110: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x8d9026c1  ! 1111: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0xd6800ba0  ! 1112: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r11
	.word 0x8d90376b  ! 1113: WRPR_PSTATE_I	wrpr	%r0, 0x176b, %pstate
	.word 0x8753c000  ! 1114: RDPR_FQ	<illegal instruction>
	.word 0xa1902008  ! 1115: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_396:
	mov 8, %r18
	.word 0xe4f00852  ! 1116: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8780201c  ! 1117: WRASI_I	wr	%r0, 0x001c, %asi
DS_0_397:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa1a4c832  ! 1118: FADDs	fadds	%f19, %f18, %f16
DS_0_398:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f10, %f10
	.word 0x85b1c306  ! 1119: ALIGNADDRESS	alignaddr	%r7, %r6, %r2
	.word 0x8d903532  ! 1120: WRPR_PSTATE_I	wrpr	%r0, 0x1532, %pstate
DS_0_399:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7332001  ! 1: STQF_I	-	%f19, [0x0001, %r12]
	normalw
	.word 0x89458000  ! 1121: RD_SOFTINT_REG	rd	%softint, %r4
splash_tba_0_400:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_401:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1123: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
debug_0_402:
	mov 8, %r18
	.word 0xd4f00852  ! 1124: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x87902370  ! 1125: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
splash_cmpr_0_403:
	setx 0x4a9397397c7f71c9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1126: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc89fe001  ! 1127: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1128: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc88fe000  ! 1129: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
mondo_0_404:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d940012  ! 1130: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
tagged_0_405:
	taddcctv %r24, 0x160f, %r10
	.word 0xc807e001  ! 1131: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x8d903f40  ! 1132: WRPR_PSTATE_I	wrpr	%r0, 0x1f40, %pstate
	.word 0xc847e001  ! 1133: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0x83540000  ! 1134: RDPR_GL	rdpr	%-, %r1
change_to_randtl_0_406:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_406:
	.word 0x8f902000  ! 1135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc2dfe010  ! 1136: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x87902174  ! 1137: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0xa9848012  ! 1138: WR_SET_SOFTINT_R	wr	%r18, %r18, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 1139: LDX_R	ldx	[%r31 + %r0], %r1
debug_0_407:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1140: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc28fe020  ! 1141: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0xc24fe001  ! 1142: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x91d020b4  ! 1143: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_408:
	mov 8, %r18
	.word 0xe4f00852  ! 1144: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_409)) -> intp(0,1,3)
xir_0_409:
	.word 0xa9836001  ! 1145: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
debug_0_410:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1146: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95500000  ! 1147: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_411)) -> intp(0,1,3)
xir_0_411:
	.word 0xa980a001  ! 1148: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xd51fe001  ! 1149: LDDF_I	ldd	[%r31, 0x0001], %f10
	.word 0xd48008a0  ! 1150: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_0_412:
	setx 0x6a20168aff273517, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1151: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 1152: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
debug_0_413:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1153: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_414:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcf31c000  ! 1: STQF_R	-	%f7, [%r0, %r7]
	normalw
	.word 0x8f458000  ! 1154: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xa1902001  ! 1155: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xcf27e001  ! 1156: STF_I	st	%f7, [0x0001, %r31]
mondo_0_415:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948005  ! 1157: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	.word 0x87802016  ! 1158: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902001  ! 1159: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_0_416:
	set 0x74e8ee09, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1160: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 1161: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d802004  ! 1162: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9ad8c005  ! 1163: SMULcc_R	smulcc 	%r3, %r5, %r13
	.word 0x8d903cf4  ! 1164: WRPR_PSTATE_I	wrpr	%r0, 0x1cf4, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_417)) -> intp(0,1,3)
xir_0_417:
	.word 0xa984a001  ! 1165: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c2001  ! 1166: SDIVX_I	sdivx	%r16, 0x0001, %r20
	.word 0x99902000  ! 1167: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x9f802001  ! 1168: SIR	sir	0x0001
	.word 0xe88008a0  ! 1169: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81510000  ! 1170: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02034  ! 1171: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90313b  ! 1172: WRPR_PSTATE_I	wrpr	%r0, 0x113b, %pstate
	.word 0xab804010  ! 1173: WR_CLEAR_SOFTINT_R	wr	%r1, %r16, %clear_softint
	.word 0xe81fc000  ! 1174: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0xe8c004a0  ! 1175: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
debug_0_419:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1176: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790211b  ! 1177: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
	.word 0xe857e001  ! 1178: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0xe91fe001  ! 1179: LDDF_I	ldd	[%r31, 0x0001], %f20
	.word 0x92d02001  ! 1180: UMULcc_I	umulcc 	%r0, 0x0001, %r9
	.word 0xd2880e80  ! 1181: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
	.word 0xd2ffc030  ! 1182: SWAPA_R	swapa	%r9, [%r31 + %r16] 0x01
debug_0_420:
	mov 8, %r18
	.word 0xe8f00852  ! 1183: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x8780201c  ! 1184: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x91d020b2  ! 1185: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d9024d6  ! 1186: WRPR_PSTATE_I	wrpr	%r0, 0x04d6, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 1187: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2d004a0  ! 1188: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd327e001  ! 1189: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd337e001  ! 1190: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x8f520000  ! 1191: RDPR_PIL	rdpr	%pil, %r7
	.word 0x9f802001  ! 1192: SIR	sir	0x0001
	.word 0x87802089  ! 1193: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1194: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_421:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f12, %f16
	.word 0x91b2430a  ! 1195: ALIGNADDRESS	alignaddr	%r9, %r10, %r8
	.word 0x8f480000  ! 1196: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xce8008a0  ! 1197: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x28800001  ! 1198: BLEU	bleu,a	<label_0x1>
	.word 0xcf27c00a  ! 1199: STF_R	st	%f7, [%r10, %r31]
	.word 0x24700001  ! 1200: BPLE	<illegal instruction>
	.word 0xce8008a0  ! 1201: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x2a800001  ! 1202: BCS	bcs,a	<label_0x1>
	.word 0x83d020b5  ! 1203: Tcc_I	te	icc_or_xcc, %r0 + 181
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 1204: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xced7e010  ! 1205: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
tagged_0_422:
	tsubcctv %r24, 0x18bd, %r12
	.word 0xce07e001  ! 1206: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_0_423:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1207: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xce800ac0  ! 1208: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r7
splash_lsu_0_424:
	setx 0xcf01a6c8436e3999, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1209: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce900e60  ! 1210: LDUHA_R	lduha	[%r0, %r0] 0x73, %r7
	.word 0x91d02033  ! 1211: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_0_425:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1212: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_426)) -> intp(0,1,3)
xir_0_426:
	.word 0xa9832001  ! 1214: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0x8780204f  ! 1215: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xcec80e40  ! 1216: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r7
	.word 0xa190200f  ! 1217: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_0_427:
	set 0xb15967ee, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1218: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_428:
	setx 0x04207b1b318915c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1219: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce1fe001  ! 1220: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x91d02034  ! 1221: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_0_429:
	setx 0xc7af7b02cfb20da9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1222: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_430:
	setx debug_0_430 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1223: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99a000c0  ! 1224: FNEGd	fnegd	%f0, %f12
	.word 0xd80fe001  ! 1225: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0xd88008a0  ! 1226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd88008a0  ! 1227: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81510000  ! 1228: RDPR_TICK	rdpr	%tick, %r0
	.word 0x89a1c9d4  ! 1229: FDIVd	fdivd	%f38, %f20, %f4
	.word 0x87802004  ! 1230: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc877c014  ! 1231: STX_R	stx	%r4, [%r31 + %r20]
tagged_0_431:
	taddcctv %r12, 0x1395, %r15
	.word 0xc807e001  ! 1232: LDUW_I	lduw	[%r31 + 0x0001], %r4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 1233: LDX_R	ldx	[%r31 + %r0], %r4
DS_0_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x89b40306  ! 1234: ALIGNADDRESS	alignaddr	%r16, %r6, %r4
	.word 0xc80fc000  ! 1235: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d6b6001  ! 1236: SDIVX_I	sdivx	%r13, 0x0001, %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_434)) -> intp(0,1,3)
xir_0_434:
	.word 0xa9802001  ! 1237: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
debug_0_435:
	mov 8, %r18
	.word 0xd2f00852  ! 1238: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xa190200e  ! 1239: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1241: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 1242: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xcd37e001  ! 1243: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x93902005  ! 1244: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x2a800001  ! 1245: BCS	bcs,a	<label_0x1>
DS_0_436:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc5350007  ! 1: STQF_R	-	%f2, [%r7, %r20]
	normalw
	.word 0x85458000  ! 1246: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc427c007  ! 1247: STW_R	stw	%r2, [%r31 + %r7]
	.word 0xc49fe001  ! 1248: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
splash_lsu_0_437:
	setx 0xde462256b20a8835, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1249: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_438:
	tsubcctv %r2, 0x1dda, %r1
	.word 0xc407e001  ! 1250: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc49fc020  ! 1251: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
splash_lsu_0_439:
	setx 0x9c0303f0ff8a45b3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1252: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_440:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1253: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_441:
	taddcctv %r10, 0x1e8a, %r15
	.word 0xc407e001  ! 1254: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x24700001  ! 1255: BPLE	<illegal instruction>
	.word 0x91d020b2  ! 1256: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x819823cf  ! 1257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cf, %hpstate
	.word 0xc4c00e60  ! 1258: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
tagged_0_442:
	tsubcctv %r4, 0x1323, %r21
	.word 0xc407e001  ! 1259: LDUW_I	lduw	[%r31 + 0x0001], %r2
debug_0_443:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1260: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_444:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x83b1c30c  ! 1261: ALIGNADDRESS	alignaddr	%r7, %r12, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_445)) -> intp(0,1,3)
xir_0_445:
	.word 0xa984a001  ! 1262: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
tagged_0_446:
	tsubcctv %r23, 0x1960, %r5
	.word 0xc207e001  ! 1263: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xa190200d  ! 1264: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9150c000  ! 1265: RDPR_TT	rdpr	%tt, %r8
	.word 0xd0c004a0  ! 1266: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
DS_0_447:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1267: RESTORE_R	restore	%r31, %r0, %r31
debug_0_448:
	setx debug_0_448 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1268: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1269: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_0_449:
	setx 0x67e380f8c676bfd8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1270: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd0c804a0  ! 1271: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
mondo_0_450:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d90c010  ! 1272: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
	.word 0xd04fe001  ! 1273: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd0d804a0  ! 1274: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 1275: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8790213c  ! 1276: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
splash_cmpr_0_451:
	setx 0xd48720acec3ef64c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1277: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81982dd7  ! 1278: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
intveclr_0_452:
	set 0xeaacda83, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1279: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99520000  ! 1280: RDPR_PIL	rdpr	%pil, %r12
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 1283: BPGU	<illegal instruction>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1284: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1285: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902000  ! 1286: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd917c000  ! 1287: LDQF_R	-	[%r31, %r0], %f12
	.word 0xd88008a0  ! 1288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x85b4cfe7  ! 1289: FONES	e	%f2
splash_cmpr_0_453:
	setx 0x1bdccf49d3068ffc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1290: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_454:
	set 0x3dd18969, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1291: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_455:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f16, %f2
	.word 0x85b0c312  ! 1292: ALIGNADDRESS	alignaddr	%r3, %r18, %r2
mondo_0_456:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d934012  ! 1293: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_457)) -> intp(0,1,3)
xir_0_457:
	.word 0xa9836001  ! 1294: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x87802014  ! 1295: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc48008a0  ! 1296: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa190200f  ! 1297: WRPR_GL_I	wrpr	%r0, 0x000f, %-
tagged_0_458:
	tsubcctv %r10, 0x1c3e, %r9
	.word 0xc407e001  ! 1298: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x91d020b2  ! 1299: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_0_459:
	mov 8, %r18
	.word 0xd2f00852  ! 1300: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xc43fc012  ! 1301: STD_R	std	%r2, [%r31 + %r18]
splash_cmpr_0_460:
	setx 0xdaa37b69d27d225e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1302: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902373  ! 1303: WRPR_TT_I	wrpr	%r0, 0x0373, %tt
DS_0_461:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7324006  ! 1: STQF_R	-	%f19, [%r6, %r9]
	normalw
	.word 0x85458000  ! 1304: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x91d020b3  ! 1305: Tcc_I	ta	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 1306: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc49fe001  ! 1307: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x93902003  ! 1308: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_462:
	set 0x134fce11, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1309: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 1310: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa1902001  ! 1311: WRPR_GL_I	wrpr	%r0, 0x0001, %-
debug_0_463:
	setx debug_0_463 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1312: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902001  ! 1313: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xc44fc000  ! 1314: LDSB_R	ldsb	[%r31 + %r0], %r2
	.word 0x8790200d  ! 1315: WRPR_TT_I	wrpr	%r0, 0x000d, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 1316: LDX_R	ldx	[%r31 + %r0], %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_464)) -> intp(0,1,3)
xir_0_464:
	.word 0xa9836001  ! 1317: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x8d500000  ! 1318: RDPR_TPC	<illegal instruction>
	.word 0x8950c000  ! 1319: RDPR_TT	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8369a001  ! 1320: SDIVX_I	sdivx	%r6, 0x0001, %r1
change_to_randtl_0_466:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_466:
	.word 0x8f902000  ! 1321: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1322: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_467:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1323: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x85a00562  ! 1324: FSQRTq	fsqrt	
	.word 0x91d02033  ! 1325: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc477c002  ! 1326: STX_R	stx	%r2, [%r31 + %r2]
	.word 0x81460000  ! 1327: RD_STICK_REG	stbar
tagged_0_468:
	tsubcctv %r8, 0x1770, %r13
	.word 0xc407e001  ! 1328: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x81460000  ! 1329: RD_STICK_REG	stbar
	.word 0x95464000  ! 1330: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd49fc020  ! 1331: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0xd48fe030  ! 1332: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 1333: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd51fc000  ! 1334: LDDF_R	ldd	[%r31, %r0], %f10
splash_lsu_0_469:
	setx 0xb808bfa0347faccf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1335: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 1336: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_0_470:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1337: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02032  ! 1338: Tcc_I	te	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1339: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xab844013  ! 1340: WR_CLEAR_SOFTINT_R	wr	%r17, %r19, %clear_softint
tagged_0_471:
	taddcctv %r13, 0x111c, %r4
	.word 0xd407e001  ! 1341: LDUW_I	lduw	[%r31 + 0x0001], %r10
tagged_0_472:
	tsubcctv %r26, 0x19bc, %r23
	.word 0xd407e001  ! 1342: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8198200c  ! 1343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x8d902081  ! 1344: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	.word 0x9545c000  ! 1345: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x879023c9  ! 1346: WRPR_TT_I	wrpr	%r0, 0x03c9, %tt
	.word 0xd43fe001  ! 1347: STD_I	std	%r10, [%r31 + 0x0001]
	.word 0x87802010  ! 1348: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd497e020  ! 1349: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xa190200d  ! 1350: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802014  ! 1351: WRASI_I	wr	%r0, 0x0014, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_473)) -> intp(0,1,3)
xir_0_473:
	.word 0xa9852001  ! 1352: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
mondo_0_474:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d928002  ! 1353: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
	.word 0x8780201c  ! 1354: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd4800c20  ! 1355: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r10
	.word 0x91d02035  ! 1356: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_475:
	setx 0xa689f819de18370b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1357: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790233f  ! 1358: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0x83d020b2  ! 1359: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd527c002  ! 1360: STF_R	st	%f10, [%r2, %r31]
	.word 0xd427c002  ! 1361: STW_R	stw	%r10, [%r31 + %r2]
	.word 0xd44fc000  ! 1362: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x93902000  ! 1363: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_476:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd41fe001  ! 1365: LDD_I	ldd	[%r31 + 0x0001], %r10
intveclr_0_477:
	set 0xe120f7f8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1366: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_478:
	tsubcctv %r20, 0x1de0, %r8
	.word 0xd407e001  ! 1367: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd45fe001  ! 1368: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0x87902266  ! 1369: WRPR_TT_I	wrpr	%r0, 0x0266, %tt
tagged_0_479:
	taddcctv %r15, 0x1b0e, %r22
	.word 0xd407e001  ! 1370: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x91d020b3  ! 1371: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x24800001  ! 1372: BLE	ble,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1373: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x99500000  ! 1374: RDPR_TPC	rdpr	%tpc, %r12
splash_cmpr_0_480:
	setx 0xa6ab02e7bbf5a5b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1375: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_481:
	setx debug_0_481 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1376: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_482:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1377: SAVE_R	save	%r31, %r0, %r31
debug_0_483:
	mov 8, %r18
	.word 0xd4f00852  ! 1378: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
mondo_0_484:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d908007  ! 1379: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_485:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1381: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xab850010  ! 1382: WR_CLEAR_SOFTINT_R	wr	%r20, %r16, %clear_softint
	.word 0x38700001  ! 1383: BPGU	<illegal instruction>
splash_cmpr_0_486:
	setx 0xe210525d9a23103c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1384: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_487:
	taddcctv %r3, 0x1fca, %r16
	.word 0xd807e001  ! 1385: LDUW_I	lduw	[%r31 + 0x0001], %r12
mondo_0_488:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d900009  ! 1386: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	.word 0xd847e001  ! 1387: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902368  ! 1389: WRPR_PSTATE_I	wrpr	%r0, 0x0368, %pstate
	.word 0xd88008a0  ! 1390: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_0_489:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8bb2c308  ! 1391: ALIGNADDRESS	alignaddr	%r11, %r8, %r5
splash_cmpr_0_490:
	setx 0x71887d61cb2abb68, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1392: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982c1d  ! 1394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
mondo_0_491:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 1395: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x8d9031c0  ! 1396: WRPR_PSTATE_I	wrpr	%r0, 0x11c0, %pstate
debug_0_492:
	mov 8, %r18
	.word 0xe2f00852  ! 1397: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1398: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_493:
	setx debug_0_493 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1399: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1400: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_494:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c007  ! 1401: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x8d902b4c  ! 1402: WRPR_PSTATE_I	wrpr	%r0, 0x0b4c, %pstate
	.word 0x8d902a85  ! 1403: WRPR_PSTATE_I	wrpr	%r0, 0x0a85, %pstate
tagged_0_495:
	taddcctv %r16, 0x1296, %r12
	.word 0xca07e001  ! 1404: LDUW_I	lduw	[%r31 + 0x0001], %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 1405: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca0fc000  ! 1406: LDUB_R	ldub	[%r31 + %r0], %r5
DS_0_496:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1407: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02033  ! 1408: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_0_497:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1409: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902005  ! 1410: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_0_498:
	mov 8, %r18
	.word 0xd4f00852  ! 1411: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 1412: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x9f802001  ! 1413: SIR	sir	0x0001
	.word 0xca07c000  ! 1414: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0xad826001  ! 1415: WR_SOFTINT_REG_I	wr	%r9, 0x0001, %softint
	.word 0xa1902001  ! 1416: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xca8008a0  ! 1417: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_cmpr_0_499:
	setx 0x255d2f7fdd1765e3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1418: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcac004a0  ! 1419: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x87902338  ! 1420: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0xca57c000  ! 1421: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0x8780204f  ! 1422: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1423: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca900e80  ! 1424: LDUHA_R	lduha	[%r0, %r0] 0x74, %r5
	.word 0x8d90253d  ! 1425: WRPR_PSTATE_I	wrpr	%r0, 0x053d, %pstate
	.word 0x9350c000  ! 1426: RDPR_TT	rdpr	%tt, %r9
	.word 0xad832001  ! 1427: WR_SOFTINT_REG_I	wr	%r12, 0x0001, %softint
	.word 0xd257c000  ! 1428: LDSH_R	ldsh	[%r31 + %r0], %r9
splash_lsu_0_500:
	setx 0x0bf96e0b48d6ab0d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1429: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd327e001  ! 1430: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd2c004a0  ! 1431: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x879022d6  ! 1432: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
	.word 0x91d02034  ! 1433: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd2c004a0  ! 1434: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0x879022b7  ! 1435: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1436: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903b48  ! 1437: WRPR_PSTATE_I	wrpr	%r0, 0x1b48, %pstate
	.word 0xa1902003  ! 1438: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_0_501:
	mov 8, %r18
	.word 0xe6f00852  ! 1439: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xa9810005  ! 1440: WR_SET_SOFTINT_R	wr	%r4, %r5, %set_softint
	.word 0x9191e001  ! 1441: WRPR_PIL_I	wrpr	%r7, 0x0001, %pil
	.word 0x8da01a6c  ! 1442: FqTOi	fqtoi	
	.word 0x91d02035  ! 1443: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_0_502:
	tsubcctv %r25, 0x116c, %r25
	.word 0xcc07e001  ! 1444: LDUW_I	lduw	[%r31 + 0x0001], %r6
intveclr_0_503:
	set 0x83865fec, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1445: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xccd7e020  ! 1446: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x8d90263a  ! 1447: WRPR_PSTATE_I	wrpr	%r0, 0x063a, %pstate
	.word 0xa190200e  ! 1448: WRPR_GL_I	wrpr	%r0, 0x000e, %-
intveclr_0_504:
	set 0xa62f981c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1449: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_505:
	setx 0xcbce6ce9075f4860, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1450: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_506:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1451: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81510000  ! 1452: RDPR_TICK	<illegal instruction>
DS_0_507:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1453: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa1902003  ! 1454: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902d89  ! 1455: WRPR_PSTATE_I	wrpr	%r0, 0x0d89, %pstate
	.word 0xcc9004a0  ! 1456: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
debug_0_508:
	setx debug_0_508 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1457: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa784a001  ! 1458: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x0001, %-
splash_htba_0_509:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1459: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8780204f  ! 1460: WRASI_I	wr	%r0, 0x004f, %asi
DS_0_510:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1461: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_511)) -> intp(0,1,3)
xir_0_511:
	.word 0xa9852001  ! 1462: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
mondo_0_512:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 1463: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
debug_0_513:
	mov 8, %r18
	.word 0xd2f00852  ! 1464: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xcc57e001  ! 1465: LDSH_I	ldsh	[%r31 + 0x0001], %r6
debug_0_514:
	setx debug_0_514 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1466: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa683000a  ! 1467: ADDcc_R	addcc 	%r12, %r10, %r19
splash_lsu_0_515:
	setx 0xb04f84b2b96afd57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1468: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 1469: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_0_516:
	setx 0x93e8f1d67145d691, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1470: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_517:
	taddcctv %r4, 0x142e, %r26
	.word 0xe607e001  ! 1471: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_lsu_0_518:
	setx 0xa47724ae49377a9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1472: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 1473: WRASI_I	wr	%r0, 0x0020, %asi
mondo_0_519:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948004  ! 1474: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
splash_cmpr_0_520:
	setx 0xbfcf006e14b21b22, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1475: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe68008a0  ! 1476: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93902005  ! 1477: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe6d80e60  ! 1478: LDXA_R	ldxa	[%r0, %r0] 0x73, %r19
	.word 0xe6800ac0  ! 1479: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_521)) -> intp(0,1,3)
xir_0_521:
	.word 0xa9822001  ! 1480: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0xe6cfe010  ! 1481: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	.word 0x91d02032  ! 1482: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_0_522:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1483: SAVE_R	save	%r31, %r0, %r31
	.word 0x91936001  ! 1484: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
	.word 0x83a209f2  ! 1485: FDIVq	dis not found

splash_cmpr_0_523:
	setx 0x25d6802d1f47e883, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1486: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_524:
	tsubcctv %r24, 0x110a, %r13
	.word 0xc207e001  ! 1487: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_htba_0_525:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1488: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1489: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 1490: FqTOd	dis not found

debug_0_527:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1491: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802080  ! 1492: WRASI_I	wr	%r0, 0x0080, %asi
tagged_0_528:
	tsubcctv %r21, 0x1f42, %r12
	.word 0xe007e001  ! 1493: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe117c000  ! 1494: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe08008a0  ! 1495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_0_529:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d90400d  ! 1496: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
intveclr_0_530:
	set 0xd3f5c958, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1497: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe09fc020  ! 1498: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
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

	.xword	0x1434210c3fb34e21
	.xword	0x42177e544f612c49
	.xword	0xada764d5c19bee35
	.xword	0x64cbb2a324338c9d
	.xword	0x1bd6bebeb745d72f
	.xword	0xdb790c19f6c17e73
	.xword	0xa51c5b05f8d567a1
	.xword	0xb08335d402691fcf
	.xword	0x5b031c2240d4674a
	.xword	0x60429b6c21e0b63c
	.xword	0x6776ae0e8d9f67e7
	.xword	0x49b7a89b090031bf
	.xword	0x7b6cda46a1b91b0c
	.xword	0x9b294ed8f42d1b0e
	.xword	0x784b8462bd34a729
	.xword	0xedb83aa70f63326a
	.xword	0x9013f0d05c040458
	.xword	0x4f130f723a435e1d
	.xword	0xe6884ee9423b665b
	.xword	0x1202ca24214d8bd5
	.xword	0x80c0eb332029ce52
	.xword	0x102a01ac67f46bcb
	.xword	0x2901e8f54daa47bd
	.xword	0x9ef42925653e789b
	.xword	0x6e73833269992b79
	.xword	0x4efce1bc87f81550
	.xword	0xab473d8ff63ea93c
	.xword	0x8bdea70b29edb6c8
	.xword	0x2336480941ead8cb
	.xword	0x97ccce3dde07bf4b
	.xword	0x40dd995fb8cd5b2d
	.xword	0xb42915d53b1314fa
	.xword	0xfc9c7412ab7d7a92
	.xword	0xec4280a71b3a1bfb
	.xword	0xef4177d41f927ffc
	.xword	0xe4bf0863d4953ded
	.xword	0xf454cdd64d72f4c6
	.xword	0x2a47ff633e635d30
	.xword	0x2928373a783f3180
	.xword	0xe5c75b2715267d1e
	.xword	0x9be63b62afd9fed5
	.xword	0x8d7662b9aeaf5231
	.xword	0xe50f3f3dc8c15bd7
	.xword	0x92732bd932a879fd
	.xword	0xe63fa8116eec1124
	.xword	0x59e7b7b937c1eb73
	.xword	0xd86f724fa697081c
	.xword	0x676fea63e42e818f
	.xword	0xd613fcf19dca168b
	.xword	0xd40c3ea5d8023432
	.xword	0xdc0e72fc9fb20c7c
	.xword	0x4641d1e465c28140
	.xword	0x9cbde4d5fd3f225c
	.xword	0x80064154d203b619
	.xword	0xc83e09ba319556b2
	.xword	0x7e1b691aad021b06
	.xword	0x801321f0fbf0cf00
	.xword	0x0c908dd8318c9bdf
	.xword	0xf12c11021f89abc8
	.xword	0xcd138f3886b96f25
	.xword	0x656953d239f1e1a6
	.xword	0x4b796f6be46925f7
	.xword	0xf5102d5ac7a380b3
	.xword	0x8e0ada04853e8d10
	.xword	0x86ea7701703b55b9
	.xword	0xcdf76cb6294dbacf
	.xword	0xcc555829fc6ce0bd
	.xword	0x2a6a9033d94b6c94
	.xword	0x46b36e8d5386b92d
	.xword	0xbf49c5b59ec3f976
	.xword	0xa9921f55b36861ce
	.xword	0x5fe287c39a4c01a4
	.xword	0x29e062ed882761d7
	.xword	0xec821f72d0cebada
	.xword	0xc8a33315ace8a73b
	.xword	0xc515975d906f29c0
	.xword	0xa7be3c6f8db779b0
	.xword	0x2cae46f42b6cb9bd
	.xword	0x2d148091eba52ee6
	.xword	0x60edc7054771875d
	.xword	0x33763c536a6365da
	.xword	0x3edf602f4a620ea8
	.xword	0x1a0271e4496d7008
	.xword	0x8316079c944b02eb
	.xword	0xb66e45a2f4d945a4
	.xword	0xbf3e80798bde5fb9
	.xword	0xe5c419034b39dea2
	.xword	0xb2394a8d93ec1c66
	.xword	0xbbf3a0d6d1852d06
	.xword	0x2b9dcfc63312fa93
	.xword	0x3af69afafda4daca
	.xword	0x9e829b310c7eac6a
	.xword	0xaec7cede64ca475b
	.xword	0x8a02f252477baf6e
	.xword	0xcc1624028c60b054
	.xword	0x288e9c63e343e544
	.xword	0x8c66e6c994254ed8
	.xword	0x5cc5532ce657eff4
	.xword	0x5c5fb227e903410f
	.xword	0xad03d1069f79ba78
	.xword	0xe8bf48f2f8f88b37
	.xword	0xae6619fbbe5d2158
	.xword	0xd4be8a1ba1bf06e2
	.xword	0xbc5814d67973d976
	.xword	0x070c1cff4d63d561
	.xword	0x66984cda300a8dbd
	.xword	0xf27a4e00bfab8e82
	.xword	0x8d130a5e08c78584
	.xword	0xf17b8a13ff6f9689
	.xword	0xb98c6cbc485a7916
	.xword	0x0a6c2d4344901fb0
	.xword	0xf9add9148daf0067
	.xword	0xc12193eb288bdc6b
	.xword	0xcf7ccaeae72549df
	.xword	0xce8a5910e3ab0545
	.xword	0x45fc15f04f8c71b3
	.xword	0x1e42e47eaf328b2d
	.xword	0x93780d5937dd5cb7
	.xword	0xf9b6f6d66ef55253
	.xword	0xcbd6e38875734fc4
	.xword	0x89d1732deca2c6ef
	.xword	0x96134769454942e2
	.xword	0xf8496062505c6341
	.xword	0x514caf1cf7fc1126
	.xword	0x9d14df3d16a071bc
	.xword	0x0aabd63970c1c8fe
	.xword	0xda8a54af766b647f
	.xword	0x5b66fcc537f121a3
	.xword	0x67943d95d07d00ae
	.xword	0x07fb778c59771e93
	.xword	0xb544b1f5a7a7c839
	.xword	0x54adc872d8b3b129
	.xword	0x3be710177a1f3fb2
	.xword	0x3054c9e097154c1b
	.xword	0xf874708ba5180e4f
	.xword	0x5bd11d26747bf97c
	.xword	0x7855740c6b94d8f3
	.xword	0x3aa3f2c1c2d362d0
	.xword	0xdcddeb14f7963004
	.xword	0x730146465b4402df
	.xword	0x5737fa3e2a4baa2b
	.xword	0x220fb0934e740095
	.xword	0x52b951d6df9e4dec
	.xword	0x480e6edececa4e0f
	.xword	0xc6e04a2fdade524d
	.xword	0x5efb8b39889ae1b9
	.xword	0x3f025ef49fef5a86
	.xword	0x6b0fcd16385e025a
	.xword	0x262fb907880bfcdb
	.xword	0x490c1f1f483b4125
	.xword	0x59a09e0c5c1a9e2d
	.xword	0xd41ea747591cf72b
	.xword	0x792e32cc378c971f
	.xword	0x35266bc083e78cf5
	.xword	0xb25bb2799c6951ce
	.xword	0x6fc44821b8760cac
	.xword	0xfd4b7bc1568e57e2
	.xword	0x1145d177d051ba94
	.xword	0x673ff7726bb59c78
	.xword	0xfde1b9b944d363e0
	.xword	0xfae8b7ffe2e719be
	.xword	0x292a7f719a743e2a
	.xword	0xa659f27c5a61e133
	.xword	0xf41347c39dfe8397
	.xword	0x136feba0190ed66b
	.xword	0xcc79be09c9afb826
	.xword	0xccc544f0b0d10271
	.xword	0xdee51a0242abe59e
	.xword	0x9cc657bbc0700ef3
	.xword	0x1d3bfc58109f6201
	.xword	0x507f4374f6bac566
	.xword	0x75137c75bb713ad3
	.xword	0x5ba4163a99566897
	.xword	0x1fa199e9bc6f510c
	.xword	0x55153a3aa1749d7c
	.xword	0x4f1069f8dee69fb7
	.xword	0x8d952d3acb432c4a
	.xword	0x77eb1f4cd2905de3
	.xword	0x7e0b4f73050d11b7
	.xword	0x82361de4f8a6ecf4
	.xword	0xc7433e26786bff14
	.xword	0x31e000fd5616fe52
	.xword	0x919b3ad5be43ca5e
	.xword	0x6a5e7b184a78313f
	.xword	0xf8a4b450bc0670ac
	.xword	0xd680c50e35b2ba24
	.xword	0x5ebb37db153161fa
	.xword	0xe678dd907e68c032
	.xword	0xe3efb9408a2d1280
	.xword	0x95525da85cf5f4c7
	.xword	0xfb16f60113bceb2a
	.xword	0x9ed25760973b939a
	.xword	0xa4d7ce428b347fbc
	.xword	0x89853bf4fb844bfc
	.xword	0x9fb560e69bb8c503
	.xword	0x2b1057da956bfd21
	.xword	0xeac49128fd6b633e
	.xword	0xd1d96eab3b13f882
	.xword	0xef76945027733743
	.xword	0xc75b6fec1f53827c
	.xword	0x9a440afa7fd25907
	.xword	0x53ff9766a1f9b5de
	.xword	0x7a4299e5328ab32d
	.xword	0x26949c591e0e4fdb
	.xword	0x84f93981fe037e9c
	.xword	0xf7e2e2276ce11827
	.xword	0x963230591575c69e
	.xword	0x5aeff30442ec0e9e
	.xword	0x523d6b9349cac429
	.xword	0x59fee6a7a312802c
	.xword	0x7d66e61f303c0894
	.xword	0xf11c530e7443b526
	.xword	0x09a4059542bddbfd
	.xword	0x18c2f6ee756f7230
	.xword	0x97cc045cd07f5a88
	.xword	0x32aa55ab85b04723
	.xword	0x2f8cf272e38c19bc
	.xword	0x44a9fcc7103f2e62
	.xword	0x141cda36bc840364
	.xword	0x9a758012c90e4bad
	.xword	0x0a1a921d38b0d682
	.xword	0x475330348f3e9663
	.xword	0xf706362db4db1420
	.xword	0x4010ab5963c90067
	.xword	0x00d4fe6aaa71b738
	.xword	0x689eb44782251ab3
	.xword	0xc5d55eb54da8d96b
	.xword	0x80b23820342f644c
	.xword	0x3444514dc0765e72
	.xword	0x1a8f8a4ee7ebae0d
	.xword	0x086b89064d29372f
	.xword	0xbc480dbf1134b814
	.xword	0x805e7a324dc824aa
	.xword	0xf43467e2085d1a35
	.xword	0x6a49737bfbf8c19d
	.xword	0x156157984b038584
	.xword	0xf2934f560c95217a
	.xword	0x8b131a53d1b5b959
	.xword	0x01fda078ea230d27
	.xword	0xa25e585917da4d8a
	.xword	0xf2da91fb6c1d987f
	.xword	0x05bc1beb21f5ed4c
	.xword	0x36c80547bb21b861
	.xword	0xf08f0dd296af7497
	.xword	0x787236cbc033a4d4
	.xword	0x3241d80f603a56f5
	.xword	0x6ffe779c6a93daa3
	.xword	0x752abfeef699e91f
	.xword	0x0d2ac30afb069fe0
	.xword	0xf61f7c4a2ecf669c
	.xword	0x28188808431518e8
	.xword	0x95729d66dda83f28
	.xword	0x08e58aa1a8525788
	.xword	0xe286747393657782
	.xword	0x8182bd5dc002e6bc
	.xword	0xa257289d5a7e921e

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

