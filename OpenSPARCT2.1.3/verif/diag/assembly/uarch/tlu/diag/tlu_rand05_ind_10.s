/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_10.s
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
	mov 0x31, %r14
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
	mov 0x35, %r14
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
	mov 0x34, %r14
	mov 0xb0, %r30
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

splash_cmpr_0_0:
	setx 0x002a07617d7b0f3f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_1:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 2: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
debug_0_2:
	mov 0x38, %r18
	.word 0xfef00b12  ! 3: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x819825dd  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dd, %hpstate
splash_cmpr_0_3:
	setx 0x5955406cb6178f37, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 5: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_4)) -> intp(0,0,9)
intvec_0_4:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97464000  ! 7: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xd717c000  ! 8: LDQF_R	-	[%r31, %r0], %f11
	.word 0xab84000b  ! 9: WR_CLEAR_SOFTINT_R	wr	%r16, %r11, %clear_softint
	set 0x1961a660, %r28
	stxa %r28, [%g0] 0x73
intvec_0_5:
	.word 0x39400001  ! 10: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68fe010  ! 11: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0xad81a001  ! 12: WR_SOFTINT_REG_I	wr	%r6, 0x0001, %softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_6)) -> intp(0,1,3)
xir_0_6:
	.word 0xa9812001  ! 13: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	set 0xde40a9d1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_7:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_8:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d950004  ! 15: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xd6bfe001  ! 16: STDA_I	stda	%r11, [%r31 + 0x0001] %asi
	.word 0xd71fe001  ! 17: LDDF_I	ldd	[%r31, 0x0001], %f11
	.word 0x99464000  ! 18: RD_STICK_CMPR_REG	rd	%-, %r12
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 19: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_0_9:
	set 0x221e351b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_10:
	setx 0xa1d75941479a31af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85540000  ! 22: RDPR_GL	rdpr	%-, %r2
	set 0xc5213544, %r28
	stxa %r28, [%g0] 0x73
intvec_0_11:
	.word 0x39400001  ! 23: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 24: RD_STICK_REG	stbar
	.word 0x9f802001  ! 25: SIR	sir	0x0001
	.word 0xa5500000  ! 26: RDPR_TPC	rdpr	%tpc, %r18
splash_cmpr_0_12:
	setx 0x9aeda00a8d8547e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 27: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_13:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a01973  ! 30: FqTOd	dis not found

	.word 0xc68008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68008a0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
change_to_randtl_0_15:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_15:
	.word 0x8f902003  ! 33: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87902093  ! 34: WRPR_TT_I	wrpr	%r0, 0x0093, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_16)) -> intp(0,1,3)
xir_0_16:
	.word 0xa9822001  ! 35: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_17)) -> intp(0,1,3)
xir_0_17:
	.word 0xa982e001  ! 36: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
mondo_0_18:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 37: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0xc657c000  ! 38: LDSH_R	ldsh	[%r31 + %r0], %r3
splash_htba_0_19:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 39: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_20:
	mov 0x38, %r18
	.word 0xfef00b12  ! 40: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x5aa99856, %r28
	stxa %r28, [%g0] 0x73
intvec_0_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 42: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_22:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 43: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0x2a800001  ! 44: BCS	bcs,a	<label_0x1>
	.word 0x9945c000  ! 45: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xd897e000  ! 46: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_0_23:
	setx 0xaf8e52d2a564cf9c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 47: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_24:
	mov 8, %r18
	.word 0xe0f00852  ! 48: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
intveclr_0_25:
	set 0xee0b72, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 50: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd85fe001  ! 51: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0xd83fe001  ! 52: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0xab850012  ! 53: WR_CLEAR_SOFTINT_R	wr	%r20, %r18, %clear_softint
	.word 0xd927e001  ! 54: STF_I	st	%f12, [0x0001, %r31]
	.word 0x8d90386d  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x186d, %pstate
splash_lsu_0_26:
	setx 0xa692cc469c6996c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 56: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_27:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 57: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01970  ! 58: FqTOd	dis not found

	ta	T_CHANGE_PRIV	! macro
	.word 0xe8d004a0  ! 60: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x8790222f  ! 61: WRPR_TT_I	wrpr	%r0, 0x022f, %tt
	.word 0xe84fe001  ! 62: LDSB_I	ldsb	[%r31 + 0x0001], %r20
	.word 0x8d450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r6
mondo_0_29:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d904001  ! 64: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
splash_cmpr_0_30:
	setx 0x653b83ff780ce9c7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 65: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 66: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc3fe001  ! 67: STD_I	std	%r6, [%r31 + 0x0001]
	set 0x42ba1bc0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_31:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c31  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x1c31, %pstate
	.word 0xcc8008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_32)) -> intp(0,0,2)
intvec_0_32:
	.word 0x39400001  ! 71: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6a9c014  ! 72: ANDNcc_R	andncc 	%r7, %r20, %r19
tagged_0_33:
	taddcctv %r1, 0x1052, %r8
	.word 0xe607e001  ! 73: LDUW_I	lduw	[%r31 + 0x0001], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_34)) -> intp(0,1,3)
xir_0_34:
	.word 0xa9822001  ! 74: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0xe63fc014  ! 75: STD_R	std	%r19, [%r31 + %r20]
	.word 0xe68008a0  ! 76: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	set 0xe479b5de, %r28
	stxa %r28, [%g0] 0x73
intvec_0_35:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9350c000  ! 78: RDPR_TT	rdpr	%tt, %r9
debug_0_36:
	mov 8, %r18
	.word 0xdef00852  ! 79: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d802000  ! 81: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_37)) -> intp(0,1,3)
xir_0_37:
	.word 0xa982e001  ! 83: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_38)) -> intp(0,1,3)
xir_0_38:
	.word 0xa9802001  ! 84: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x83d02033  ! 85: Tcc_I	te	icc_or_xcc, %r0 + 51
tagged_0_39:
	taddcctv %r13, 0x1dbe, %r1
	.word 0xd207e001  ! 86: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x93902007  ! 87: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd31fc000  ! 88: LDDF_R	ldd	[%r31, %r0], %f9
tagged_0_40:
	tsubcctv %r17, 0x1236, %r20
	.word 0xd207e001  ! 89: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xad846001  ! 90: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
mondo_0_41:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d918011  ! 91: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0xd2d804a0  ! 92: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x91926001  ! 93: WRPR_PIL_I	wrpr	%r9, 0x0001, %pil
	.word 0x87902141  ! 94: WRPR_TT_I	wrpr	%r0, 0x0141, %tt
	.word 0xd2cfe010  ! 95: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
splash_cmpr_0_42:
	setx 0x8696d098ecb55a35, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 96: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_43:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5326001  ! 1: STQF_I	-	%f18, [0x0001, %r9]
	normalw
	.word 0x89458000  ! 97: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xa190200b  ! 98: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x22700001  ! 99: BPE	<illegal instruction>
	.word 0x879023cb  ! 100: WRPR_TT_I	wrpr	%r0, 0x03cb, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 101: LDX_R	ldx	[%r31 + %r0], %r4
DS_0_44:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 102: SAVE_R	save	%r31, %r0, %r31
DS_0_45:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b18305  ! 103: ALIGNADDRESS	alignaddr	%r6, %r5, %r12
	.word 0xa1520000  ! 104: RDPR_PIL	rdpr	%pil, %r16
tagged_0_46:
	tsubcctv %r17, 0x1493, %r7
	.word 0xe007e001  ! 105: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
debug_0_47:
	mov 0x38, %r18
	.word 0xfef00b12  ! 107: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9545c000  ! 108: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x93902001  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 110: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_48:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x9b5f3417	! Random illegal ?
	.word 0xdb114010  ! 1: LDQF_R	-	[%r5, %r16], %f13
	.word 0x8fa2882b  ! 111: FADDs	fadds	%f10, %f11, %f7
DS_0_49:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x83a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa5a2c82d  ! 112: FADDs	fadds	%f11, %f13, %f18
	.word 0xa66b2001  ! 113: UDIVX_I	udivx 	%r12, 0x0001, %r19
DS_0_50:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9324004  ! 1: STQF_R	-	%f20, [%r4, %r9]
	normalw
	.word 0x89458000  ! 114: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc88008a0  ! 115: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x9f802001  ! 116: SIR	sir	0x0001
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 117: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_51:
	mov 8, %r18
	.word 0xd6f00852  ! 118: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_cmpr_0_52:
	setx 0xe253c2133497015a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 119: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_PRIV	! macro
DS_0_53:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 121: SAVE_R	save	%r31, %r0, %r31
	.word 0xc88008a0  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
debug_0_54:
	mov 8, %r18
	.word 0xd2f00852  ! 123: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	set 0xe507a8c5, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1480000  ! 125: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe09004a0  ! 126: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
splash_htba_0_56:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 127: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902000  ! 128: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02034  ! 129: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe117c000  ! 130: LDQF_R	-	[%r31, %r0], %f16
	set 0x3dc3ff77, %r28
	stxa %r28, [%g0] 0x73
intvec_0_57:
	.word 0x39400001  ! 131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 132: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 133: BPL	<illegal instruction>
	.word 0xa190200c  ! 134: WRPR_GL_I	wrpr	%r0, 0x000c, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_58)) -> intp(0,0,22)
intvec_0_58:
	.word 0x39400001  ! 135: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95500000  ! 136: RDPR_TPC	rdpr	%tpc, %r10
change_to_randtl_0_59:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_59:
	.word 0x8f902003  ! 137: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
tagged_0_60:
	tsubcctv %r16, 0x1b2c, %r9
	.word 0xd407e001  ! 138: LDUW_I	lduw	[%r31 + 0x0001], %r10
tagged_0_61:
	taddcctv %r24, 0x1a54, %r23
	.word 0xd407e001  ! 139: LDUW_I	lduw	[%r31 + 0x0001], %r10
intveclr_0_62:
	set 0xf97ff908, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_63:
	set 0x5badb743, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 141: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa2dcc006  ! 142: SMULcc_R	smulcc 	%r19, %r6, %r17
DS_0_64:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xaf54b134	! Random illegal ?
	.word 0x95a0054c  ! 1: FSQRTd	fsqrt	
	.word 0x85a0c829  ! 143: FADDs	fadds	%f3, %f9, %f2
splash_cmpr_0_65:
	setx 0xf99ae83d5abe8d2d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc41fe001  ! 145: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xc53fe001  ! 146: STDF_I	std	%f2, [0x0001, %r31]
	.word 0x87902325  ! 147: WRPR_TT_I	wrpr	%r0, 0x0325, %tt
	.word 0xc4800c60  ! 148: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
	.word 0x87450000  ! 149: RD_SET_SOFTINT	rd	%set_softint, %r3
	.word 0xa190200b  ! 150: WRPR_GL_I	wrpr	%r0, 0x000b, %-
debug_0_66:
	mov 8, %r18
	.word 0xdaf00852  ! 151: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
debug_0_67:
	setx debug_0_67 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 152: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_HPRIV	! macro
debug_0_68:
	mov 0x38, %r18
	.word 0xfef00b12  ! 154: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 155: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc69fe001  ! 156: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
mondo_0_69:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918004  ! 157: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0x87702001  ! 158: POPC_I	popc	0x0001, %r3
	.word 0x8790204d  ! 159: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
	.word 0xa4dc0014  ! 160: SMULcc_R	smulcc 	%r16, %r20, %r18
debug_0_70:
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 161: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe4800b40  ! 162: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0x91932001  ! 163: WRPR_PIL_I	wrpr	%r12, 0x0001, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 164: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 165: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa6fae001  ! 166: SDIVcc_I	sdivcc 	%r11, 0x0001, %r19
	.word 0x8e82a001  ! 167: ADDcc_I	addcc 	%r10, 0x0001, %r7
	set 0x14087b59, %r28
	stxa %r28, [%g0] 0x73
intvec_0_71:
	.word 0x39400001  ! 168: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_72:
	.word 0x8f902000  ! 169: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_0_73:
	taddcctv %r4, 0x11de, %r25
	.word 0xce07e001  ! 170: LDUW_I	lduw	[%r31 + 0x0001], %r7
debug_0_74:
	mov 0x38, %r18
	.word 0xfef00b12  ! 171: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902003  ! 172: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_0_75:
	setx 0x1d0b1dd6a964180d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_76)) -> intp(0,1,3)
xir_0_76:
	.word 0xa981a001  ! 174: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
debug_0_77:
	mov 0x38, %r18
	.word 0xfef00b12  ! 175: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_78)) -> intp(0,0,14)
intvec_0_78:
	.word 0x39400001  ! 176: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 177: SIR	sir	0x0001
	set 0xed8e9d7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_79:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_80:
	tsubcctv %r16, 0x117b, %r13
	.word 0xce07e001  ! 179: LDUW_I	lduw	[%r31 + 0x0001], %r7
	set 0xeea858fe, %r28
	stxa %r28, [%g0] 0x73
intvec_0_81:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xce0fc000  ! 181: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x93902005  ! 182: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e1f  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1f, %hpstate
	.word 0xce9fc020  ! 185: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0xce8804a0  ! 186: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_82)) -> intp(0,1,3)
xir_0_82:
	.word 0xa980e001  ! 187: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x8d454000  ! 188: RD_CLEAR_SOFTINT	rd	%clear_softint, %r6
splash_lsu_0_83:
	setx 0x5a08b81b44b906dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 189: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 190: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_84:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d900002  ! 191: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
	.word 0x93902006  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81460000  ! 193: RD_STICK_REG	stbar
	.word 0xccc804a0  ! 194: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
tagged_0_85:
	taddcctv %r15, 0x13fe, %r22
	.word 0xcc07e001  ! 195: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8008a0  ! 196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87802020  ! 197: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02032  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcc1fc000  ! 199: LDD_R	ldd	[%r31 + %r0], %r6
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 200: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_0_86:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_86:
	.word 0x8f902001  ! 201: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902000  ! 202: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_0_87:
	set 0x8fc55c1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 204: LDX_R	ldx	[%r31 + %r0], %r6
DS_0_88:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xeb6b6336	! Random illegal ?
	.word 0xc9118008  ! 1: LDQF_R	-	[%r6, %r8], %f4
	.word 0x87a3082c  ! 205: FADDs	fadds	%f12, %f12, %f3
	.word 0xa1902001  ! 206: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc627e001  ! 207: STW_I	stw	%r3, [%r31 + 0x0001]
debug_0_89:
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x28800001  ! 209: BLEU	bleu,a	<label_0x1>
	.word 0x87802063  ! 210: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802063  ! 211: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d902f36  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x0f36, %pstate
splash_cmpr_0_90:
	setx 0x693b8fc62931b369, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x6ec2d80, %r28
	stxa %r28, [%g0] 0x73
intvec_0_91:
	.word 0x39400001  ! 214: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_92:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 215: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d90335b  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x135b, %pstate
	.word 0x88a8c013  ! 217: ANDNcc_R	andncc 	%r3, %r19, %r4
	.word 0x87802004  ! 218: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200c  ! 219: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_0_93:
	mov 8, %r18
	.word 0xe8f00852  ! 220: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
intveclr_0_94:
	set 0x44d82451, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 221: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_95:
	setx 0x5d2427dc16b04fd0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 222: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc8d7e000  ! 223: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0x83d02032  ! 224: Tcc_I	te	icc_or_xcc, %r0 + 50
debug_0_96:
	mov 8, %r18
	.word 0xe8f00852  ! 225: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xc8c80e60  ! 226: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r4
mondo_0_97:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d934010  ! 227: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0x22800001  ! 228: BE	be,a	<label_0x1>
splash_cmpr_0_98:
	setx 0x5374b00f6abf2047, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 229: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 230: LDX_R	ldx	[%r31 + %r0], %r4
tagged_0_99:
	taddcctv %r7, 0x1205, %r18
	.word 0xc807e001  ! 231: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc93fe001  ! 232: STDF_I	std	%f4, [0x0001, %r31]
	.word 0x8d90243b  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x043b, %pstate
	.word 0x87902029  ! 234: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
	.word 0x81460000  ! 235: RD_STICK_REG	stbar
splash_cmpr_0_100:
	setx 0x4a3ac7584e9186c1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 236: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902003  ! 237: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc89fe001  ! 238: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x8d902849  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x0849, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 240: LDX_R	ldx	[%r31 + %r0], %r4
mondo_0_101:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 241: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x8790206d  ! 242: WRPR_TT_I	wrpr	%r0, 0x006d, %tt
mondo_0_102:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d92800a  ! 243: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0x88d0e001  ! 244: UMULcc_I	umulcc 	%r3, 0x0001, %r4
	.word 0xc80fe001  ! 245: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0x91d02032  ! 246: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_103:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d948008  ! 247: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
splash_cmpr_0_104:
	setx 0x520c417d2499aa23, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 248: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200a  ! 249: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_0_105:
	setx 0x5028e55d9a5c428b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 250: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_106)) -> intp(0,0,30)
intvec_0_106:
	.word 0x39400001  ! 251: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_107:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x95a28828  ! 252: FADDs	fadds	%f10, %f8, %f10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 253: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c004a0  ! 254: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
change_to_randtl_0_108:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_108:
	.word 0x8f902002  ! 255: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 256: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 257: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 258: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa190200d  ! 259: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 260: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 261: SIR	sir	0x0001
	set 0xfa003472, %r28
	stxa %r28, [%g0] 0x73
intvec_0_109:
	.word 0x39400001  ! 262: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_110:
	setx 0x7851ce2e894f15a9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_111)) -> intp(0,1,3)
xir_0_111:
	.word 0xa981a001  ! 265: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xd427e001  ! 266: STW_I	stw	%r10, [%r31 + 0x0001]
	.word 0xd4dfe020  ! 267: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0xa1902002  ! 268: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902d3a  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x0d3a, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_112)) -> intp(0,0,0)
intvec_0_112:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xab850010  ! 272: WR_CLEAR_SOFTINT_R	wr	%r20, %r16, %clear_softint
debug_0_113:
	mov 0x38, %r18
	.word 0xfef00b12  ! 273: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 274: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_114:
	mov 8, %r18
	.word 0xe0f00852  ! 275: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
DS_0_115:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc5340001  ! 1: STQF_R	-	%f2, [%r1, %r16]
	normalw
	.word 0xa5458000  ! 276: RD_SOFTINT_REG	rd	%softint, %r18
debug_0_116:
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9702001  ! 278: POPC_I	popc	0x0001, %r20
	.word 0x879023bc  ! 279: WRPR_TT_I	wrpr	%r0, 0x03bc, %tt
	.word 0x8d902243  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x2a700001  ! 281: BPCS	<illegal instruction>
intveclr_0_117:
	set 0xfe398cd6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 282: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_118:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 283: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_119:
	setx 0x670f7636da71ab97, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 284: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b3  ! 285: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa9848011  ! 286: WR_SET_SOFTINT_R	wr	%r18, %r17, %set_softint
DS_0_120:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b48310  ! 287: ALIGNADDRESS	alignaddr	%r18, %r16, %r18
mondo_0_121:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d934003  ! 288: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_122)) -> intp(0,0,4)
intvec_0_122:
	.word 0x39400001  ! 289: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_123:
	mov 8, %r18
	.word 0xdef00852  ! 290: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x99902003  ! 291: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x91d020b3  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_0_124:
	setx debug_0_124 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 293: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_125:
	set 0x57a28b0d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 294: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 295: WRASI_I	wr	%r0, 0x0058, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 297: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x2a700001  ! 298: BPCS	<illegal instruction>
	.word 0x879020e8  ! 299: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
splash_cmpr_0_126:
	setx 0x150606bef25943fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 300: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_127:
	setx 0xcef5b8caae13aced, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 301: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 302: BPLEU	<illegal instruction>
	.word 0x879023e9  ! 303: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
	.word 0x93d02033  ! 304: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87902133  ! 305: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
splash_cmpr_0_128:
	setx 0x63faa9a6c8f9addb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 306: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xf56340f6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_129:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 308: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 309: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_130:
	setx debug_0_130 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 310: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_131:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 311: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_132)) -> intp(0,1,3)
xir_0_132:
	.word 0xa984a001  ! 312: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x81982f46  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f46, %hpstate
	.word 0x81460000  ! 314: RD_STICK_REG	stbar
	.word 0xe477e001  ! 315: STX_I	stx	%r18, [%r31 + 0x0001]
	.word 0xe527c011  ! 316: STF_R	st	%f18, [%r17, %r31]
	.word 0xa1902007  ! 317: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8d90264a  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
debug_0_133:
	setx debug_0_133 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 320: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa9520000  ! 321: RDPR_PIL	rdpr	%pil, %r20
debug_0_134:
	mov 0x38, %r18
	.word 0xfef00b12  ! 322: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_135:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1334001  ! 1: STQF_R	-	%f16, [%r1, %r13]
	normalw
	.word 0x83458000  ! 323: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8780204f  ! 324: WRASI_I	wr	%r0, 0x004f, %asi
tagged_0_136:
	tsubcctv %r22, 0x1a95, %r19
	.word 0xc207e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x91912001  ! 326: WRPR_PIL_I	wrpr	%r4, 0x0001, %pil
tagged_0_137:
	taddcctv %r2, 0x1a07, %r15
	.word 0xc207e001  ! 327: LDUW_I	lduw	[%r31 + 0x0001], %r1
debug_0_138:
	mov 8, %r18
	.word 0xdaf00852  ! 328: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01970  ! 329: FqTOd	dis not found

mondo_0_140:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 330: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x91d02035  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d90385c  ! 332: WRPR_PSTATE_I	wrpr	%r0, 0x185c, %pstate
	.word 0xab804008  ! 333: WR_CLEAR_SOFTINT_R	wr	%r1, %r8, %clear_softint
debug_0_141:
	mov 8, %r18
	.word 0xe6f00852  ! 334: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x93d02034  ! 335: Tcc_I	tne	icc_or_xcc, %r0 + 52
tagged_0_142:
	tsubcctv %r15, 0x1fc8, %r8
	.word 0xd807e001  ! 336: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_0_143:
	taddcctv %r23, 0x146e, %r5
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_144)) -> intp(0,0,15)
intvec_0_144:
	.word 0x39400001  ! 338: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_145:
	set 0xb1827d99, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 339: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8790202d  ! 340: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
	.word 0x92c52001  ! 341: ADDCcc_I	addccc 	%r20, 0x0001, %r9
splash_cmpr_0_146:
	setx 0xb5b56322dc5cf49a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 342: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_147:
	set 0x4067104c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 343: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd24fc000  ! 344: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0xa190200f  ! 345: WRPR_GL_I	wrpr	%r0, 0x000f, %-
tagged_0_148:
	tsubcctv %r5, 0x196d, %r5
	.word 0xd207e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r9
DS_0_149:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 347: RESTORE_R	restore	%r31, %r0, %r31
debug_0_150:
	mov 8, %r18
	.word 0xd4f00852  ! 348: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_0_151:
	setx debug_0_151 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 349: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903e73  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1e73, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 351: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_152:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 352: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xd327e001  ! 353: STF_I	st	%f9, [0x0001, %r31]
debug_0_153:
	mov 8, %r18
	.word 0xdaf00852  ! 354: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x879020c7  ! 355: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
debug_0_154:
	setx debug_0_154 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 356: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xab84c000  ! 357: WR_CLEAR_SOFTINT_R	wr	%r19, %r0, %clear_softint
	.word 0x2c700001  ! 358: BPNEG	<illegal instruction>
splash_tba_0_155:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 359: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_156:
	mov 8, %r18
	.word 0xe4f00852  ! 360: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_157)) -> intp(0,1,3)
xir_0_157:
	.word 0xa9846001  ! 361: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x8d90316b  ! 362: WRPR_PSTATE_I	wrpr	%r0, 0x116b, %pstate
intveclr_0_158:
	set 0x582c43e5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 363: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031e7  ! 364: WRPR_PSTATE_I	wrpr	%r0, 0x11e7, %pstate
	.word 0xd337e001  ! 365: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0x9192a001  ! 367: WRPR_PIL_I	wrpr	%r10, 0x0001, %pil
tagged_0_159:
	taddcctv %r16, 0x13f8, %r19
	.word 0xd207e001  ! 368: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x91d020b2  ! 369: Tcc_I	ta	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_160)) -> intp(0,0,30)
intvec_0_160:
	.word 0x39400001  ! 370: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24700001  ! 371: BPLE	<illegal instruction>
	.word 0xd28008a0  ! 372: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_161:
	taddcctv %r20, 0x1ba5, %r15
	.word 0xd207e001  ! 374: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x83d02033  ! 375: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
debug_0_162:
	mov 8, %r18
	.word 0xe4f00852  ! 377: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8d802004  ! 378: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d903edb  ! 379: WRPR_PSTATE_I	wrpr	%r0, 0x1edb, %pstate
mondo_0_163:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d93400d  ! 380: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
	.word 0xa1450000  ! 381: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xa190200f  ! 382: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_0_164:
	mov 0x38, %r18
	.word 0xfef00b12  ! 383: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe11fc000  ! 384: LDDF_R	ldd	[%r31, %r0], %f16
	.word 0x91d02034  ! 385: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_0_165:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 387: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_166:
	setx debug_0_166 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 388: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	set 0xc312b739, %r28
	stxa %r28, [%g0] 0x73
intvec_0_167:
	.word 0x39400001  ! 389: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_168)) -> intp(0,0,12)
intvec_0_168:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0800bc0  ! 391: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r16
	.word 0xe01fe001  ! 392: LDD_I	ldd	[%r31 + 0x0001], %r16
	set 0x2c7ce87e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_169:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 394: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_0_170:
	mov 0x38, %r18
	.word 0xfef00b12  ! 395: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7500000  ! 396: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x93d020b3  ! 397: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xa190200c  ! 398: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200e  ! 399: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 400: LDX_R	ldx	[%r31 + %r0], %r19
splash_htba_0_171:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 401: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02034  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_172)) -> intp(0,1,3)
xir_0_172:
	.word 0xa9822001  ! 403: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0xe68008a0  ! 404: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_htba_0_173:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 405: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83d020b4  ! 406: Tcc_I	te	icc_or_xcc, %r0 + 180
debug_0_174:
	mov 8, %r18
	.word 0xe0f00852  ! 407: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x81510000  ! 408: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d903fa4  ! 409: WRPR_PSTATE_I	wrpr	%r0, 0x1fa4, %pstate
	.word 0x87802088  ! 410: WRASI_I	wr	%r0, 0x0088, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_175)) -> intp(0,1,3)
xir_0_175:
	.word 0xa9816001  ! 411: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
splash_htba_0_176:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 412: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02032  ! 413: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe61fe001  ! 414: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0x9192e001  ! 415: WRPR_PIL_I	wrpr	%r11, 0x0001, %pil
splash_cmpr_0_177:
	setx 0x59e297761696da4e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 416: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_178)) -> intp(0,1,3)
xir_0_178:
	.word 0xa9806001  ! 417: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x87a000c4  ! 418: FNEGd	fnegd	%f4, %f34
DS_0_179:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc5342001  ! 1: STQF_I	-	%f2, [0x0001, %r16]
	normalw
	.word 0x8f458000  ! 419: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x91936001  ! 420: WRPR_PIL_I	wrpr	%r13, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_180)) -> intp(0,0,17)
intvec_0_180:
	.word 0x39400001  ! 421: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_181:
	setx debug_0_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 422: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 423: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790233d  ! 424: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
DS_0_182:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xbd52e03f	! Random illegal ?
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x8da44825  ! 425: FADDs	fadds	%f17, %f5, %f6
	.word 0xcc0fc000  ! 426: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0xa545c000  ! 427: RD_TICK_CMPR_REG	rd	%-, %r18
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 428: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 429: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
DS_0_183:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a00546  ! 1: FSQRTd	fsqrt	
	.word 0x85a08825  ! 431: FADDs	fadds	%f2, %f5, %f2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa745c000  ! 433: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xe6800a60  ! 434: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0xe6ffc025  ! 435: SWAPA_R	swapa	%r19, [%r31 + %r5] 0x01
DS_0_184:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 436: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 437: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe68804a0  ! 438: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
	.word 0x93902004  ! 439: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 440: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_0_185:
	setx 0x761be10065f3ea65, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 441: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_186:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 442: SAVE_R	save	%r31, %r0, %r31
	.word 0xe64fc000  ! 443: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_cmpr_0_187:
	setx 0x16c5476185cc6746, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 444: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_188:
	setx 0x7f1598d3a4767610, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_189:
	mov 8, %r18
	.word 0xe6f00852  ! 446: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x8790218c  ! 447: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
	.word 0x93902006  ! 448: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_0_190:
	tsubcctv %r9, 0x1a29, %r8
	.word 0xe607e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_lsu_0_191:
	setx 0x035ad7731bced0d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 450: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe68fe010  ! 452: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r19
	.word 0xa1902003  ! 453: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902000  ! 454: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902147  ! 455: WRPR_TT_I	wrpr	%r0, 0x0147, %tt
DS_0_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x977221ff	! Random illegal ?
	.word 0x89a00552  ! 1: FSQRTd	fsqrt	
	.word 0x83a48829  ! 456: FADDs	fadds	%f18, %f9, %f1
	.word 0xc21fc000  ! 457: LDD_R	ldd	[%r31 + %r0], %r1
	set 0xcb7793c0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_193:
	.word 0x39400001  ! 458: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 459: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc21fe001  ! 460: LDD_I	ldd	[%r31 + 0x0001], %r1
DS_0_194:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 461: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc21fc000  ! 462: LDD_R	ldd	[%r31 + %r0], %r1
intveclr_0_195:
	set 0xc6106491, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 463: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_196)) -> intp(0,0,30)
intvec_0_196:
	.word 0x39400001  ! 464: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902369  ! 465: WRPR_PSTATE_I	wrpr	%r0, 0x0369, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_197)) -> intp(0,1,3)
xir_0_197:
	.word 0xa9816001  ! 466: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xc327c009  ! 467: STF_R	st	%f1, [%r9, %r31]
	.word 0xc247e001  ! 468: LDSW_I	ldsw	[%r31 + 0x0001], %r1
splash_tba_0_198:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 469: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc29fc020  ! 470: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x91d02035  ! 471: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_0_199:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f30, %f2
	.word 0x8db14312  ! 472: ALIGNADDRESS	alignaddr	%r5, %r18, %r6
tagged_0_200:
	tsubcctv %r18, 0x1a9c, %r7
	.word 0xcc07e001  ! 473: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8008a0  ! 474: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
intveclr_0_201:
	set 0x2e3c30c7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_202:
	tsubcctv %r21, 0x1c33, %r17
	.word 0xcc07e001  ! 476: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_0_203:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 477: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc2fc012  ! 478: STB_R	stb	%r6, [%r31 + %r18]
	.word 0x93902002  ! 479: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_0_204:
	set 0x89b8ba0f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 480: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 481: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x32700001  ! 482: BPNE	<illegal instruction>
	.word 0xcc47e001  ! 483: LDSW_I	ldsw	[%r31 + 0x0001], %r6
debug_0_205:
	setx debug_0_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xcd3fe001  ! 485: STDF_I	std	%f6, [0x0001, %r31]
DS_0_206:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 486: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc900e40  ! 487: LDUHA_R	lduha	[%r0, %r0] 0x72, %r6
DS_0_207:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b0c307  ! 488: ALIGNADDRESS	alignaddr	%r3, %r7, %r18
	.word 0x879020ad  ! 489: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 490: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_208:
	setx debug_0_208 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 491: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90264d  ! 492: WRPR_PSTATE_I	wrpr	%r0, 0x064d, %pstate
splash_htba_0_209:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 493: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802080  ! 494: WRASI_I	wr	%r0, 0x0080, %asi
debug_0_210:
	mov 8, %r18
	.word 0xd2f00852  ! 495: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe40fc000  ! 496: LDUB_R	ldub	[%r31 + %r0], %r18
	.word 0xe4800ac0  ! 497: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
	set 0xe434c8a2, %r28
	stxa %r28, [%g0] 0x73
intvec_0_211:
	.word 0x39400001  ! 498: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 499: LDX_R	ldx	[%r31 + %r0], %r18
mondo_0_212:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d944001  ! 500: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
intveclr_0_213:
	set 0x633632a5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 501: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e010  ! 502: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
	.word 0x93902004  ! 503: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 504: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902009  ! 506: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_0_214:
	setx 0xab2358205ab353e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 507: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_215:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d928003  ! 508: WRPR_WSTATE_R	wrpr	%r10, %r3, %wstate
	.word 0x8198230f  ! 509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0xe49fe001  ! 510: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x91d020b2  ! 511: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x81460000  ! 512: RD_STICK_REG	stbar
	.word 0x8cd90012  ! 513: SMULcc_R	smulcc 	%r4, %r18, %r6
DS_0_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xa363e290	! Random illegal ?
	.word 0xa5a00549  ! 1: FSQRTd	fsqrt	
	.word 0x9ba0c82c  ! 514: FADDs	fadds	%f3, %f12, %f13
	.word 0x9b540000  ! 515: RDPR_GL	rdpr	%-, %r13
	.word 0xda8008a0  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 517: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 518: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_randtl_0_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_217:
	.word 0x8f902003  ! 519: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_0_218:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f6, %f18
	.word 0x8bb1c311  ! 520: ALIGNADDRESS	alignaddr	%r7, %r17, %r5
	.word 0x8198268c  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
	.word 0xcb3fe001  ! 522: STDF_I	std	%f5, [0x0001, %r31]
	.word 0xcb97e001  ! 523: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0xca0fe001  ! 524: LDUB_I	ldub	[%r31 + 0x0001], %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_219)) -> intp(0,1,3)
xir_0_219:
	.word 0xa980a001  ! 525: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x8d90349d  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x149d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 527: LDX_R	ldx	[%r31 + %r0], %r5
debug_0_220:
	setx debug_0_220 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 528: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xca9004a0  ! 529: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xca9fc020  ! 530: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0x91d02034  ! 531: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa9454000  ! 532: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	set 0x43046367, %r28
	stxa %r28, [%g0] 0x73
intvec_0_221:
	.word 0x39400001  ! 533: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa745c000  ! 534: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xa1902009  ! 535: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85686001  ! 536: SDIVX_I	sdivx	%r1, 0x0001, %r2
	.word 0xa9834010  ! 537: WR_SET_SOFTINT_R	wr	%r13, %r16, %set_softint
	.word 0xc527c010  ! 538: STF_R	st	%f2, [%r16, %r31]
intveclr_0_223:
	set 0xea1669e6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 539: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc41fe001  ! 540: LDD_I	ldd	[%r31 + 0x0001], %r2
splash_lsu_0_224:
	setx 0x48c4e279754fda73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 541: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0xdc51a6a9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_225:
	.word 0x39400001  ! 542: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9520000  ! 543: RDPR_PIL	rdpr	%pil, %r20
	.word 0xa4d30012  ! 544: UMULcc_R	umulcc 	%r12, %r18, %r18
	.word 0x87902216  ! 545: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_226)) -> intp(0,0,20)
intvec_0_226:
	.word 0x39400001  ! 546: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe40fc000  ! 548: LDUB_R	ldub	[%r31 + %r0], %r18
intveclr_0_227:
	set 0x51a0a242, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_228:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x8bb24312  ! 550: ALIGNADDRESS	alignaddr	%r9, %r18, %r5
DS_0_229:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 551: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_0_230:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 552: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0x8790238f  ! 553: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
debug_0_231:
	mov 8, %r18
	.word 0xd0f00852  ! 554: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xa1902007  ! 555: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902006  ! 556: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xcb1fc000  ! 557: LDDF_R	ldd	[%r31, %r0], %f5
	.word 0xca2fc00a  ! 558: STB_R	stb	%r5, [%r31 + %r10]
	.word 0x8d903a32  ! 559: WRPR_PSTATE_I	wrpr	%r0, 0x1a32, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 560: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_232:
	tsubcctv %r17, 0x1455, %r24
	.word 0xca07e001  ! 561: LDUW_I	lduw	[%r31 + 0x0001], %r5
debug_0_233:
	mov 0x38, %r18
	.word 0xfef00b12  ! 562: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xcb17c000  ! 563: LDQF_R	-	[%r31, %r0], %f5
	.word 0x93d02033  ! 564: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x99902003  ! 565: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d9030ff  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x10ff, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 567: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a00553  ! 568: FSQRTd	fsqrt	
	.word 0x8d903ead  ! 569: WRPR_PSTATE_I	wrpr	%r0, 0x1ead, %pstate
	.word 0x93902004  ! 570: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc28008a0  ! 571: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x93902004  ! 572: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802088  ! 573: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d02035  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_234:
	mov 8, %r18
	.word 0xd6f00852  ! 575: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	set 0xb0d49ae3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_235:
	.word 0x39400001  ! 576: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_236:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f20, %f8
	.word 0x83b48311  ! 577: ALIGNADDRESS	alignaddr	%r18, %r17, %r1
debug_0_237:
	mov 8, %r18
	.word 0xe0f00852  ! 578: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x87802016  ! 579: WRASI_I	wr	%r0, 0x0016, %asi
splash_htba_0_238:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 580: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc29fc020  ! 581: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0xc257e001  ! 582: LDSH_I	ldsh	[%r31 + 0x0001], %r1
debug_0_239:
	mov 0x38, %r18
	.word 0xfef00b12  ! 583: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_240:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_240:
	.word 0x8f902001  ! 584: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xad81e001  ! 585: WR_SOFTINT_REG_I	wr	%r7, 0x0001, %softint
	set 0xac8de10, %r28
	stxa %r28, [%g0] 0x73
intvec_0_241:
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc28008a0  ! 587: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x91d020b2  ! 588: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc227e001  ! 589: STW_I	stw	%r1, [%r31 + 0x0001]
	.word 0x8d902a22  ! 590: WRPR_PSTATE_I	wrpr	%r0, 0x0a22, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 591: LDX_R	ldx	[%r31 + %r0], %r1
debug_0_242:
	mov 0x38, %r18
	.word 0xfef00b12  ! 592: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81520000  ! 593: RDPR_PIL	rdpr	%pil, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc09fc020  ! 595: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0xc08008a0  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
debug_0_243:
	mov 8, %r18
	.word 0xe6f00852  ! 597: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xc0800b40  ! 598: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r0
splash_lsu_0_244:
	setx 0xc9d7c0f8ca0c31c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 599: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_245)) -> intp(0,1,3)
xir_0_245:
	.word 0xa9832001  ! 600: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xc197e001  ! 601: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0xa1902001  ! 602: WRPR_GL_I	wrpr	%r0, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_246)) -> intp(0,0,9)
intvec_0_246:
	.word 0x39400001  ! 603: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_247:
	set 0x5ab2ba3d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_248)) -> intp(0,1,3)
xir_0_248:
	.word 0xa9846001  ! 605: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x93d02035  ! 606: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc197e001  ! 608: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0xc0800ac0  ! 609: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r0
	.word 0xc01fc000  ! 610: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x91480000  ! 611: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xa190200c  ! 612: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	set 0x4252c83c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_249:
	.word 0x39400001  ! 613: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 614: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902006  ! 615: WRPR_GL_I	wrpr	%r0, 0x0006, %-
tagged_0_250:
	tsubcctv %r6, 0x1913, %r19
	.word 0xd007e001  ! 616: LDUW_I	lduw	[%r31 + 0x0001], %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_251)) -> intp(0,1,3)
xir_0_251:
	.word 0xa9816001  ! 617: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_252)) -> intp(0,0,23)
intvec_0_252:
	.word 0x39400001  ! 618: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 619: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_253)) -> intp(0,1,3)
xir_0_253:
	.word 0xa984e001  ! 620: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x91d020b5  ! 621: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 622: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_254)) -> intp(0,0,26)
intvec_0_254:
	.word 0x39400001  ! 623: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_255:
	mov 8, %r18
	.word 0xd0f00852  ! 624: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
mondo_0_256:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 625: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
debug_0_257:
	mov 0x38, %r18
	.word 0xfef00b12  ! 626: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x38800001  ! 627: BGU	bgu,a	<label_0x1>
tagged_0_258:
	tsubcctv %r24, 0x1797, %r26
	.word 0xd007e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r8
	set 0xec161fce, %r28
	stxa %r28, [%g0] 0x73
intvec_0_259:
	.word 0x39400001  ! 629: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_260:
	mov 0x38, %r18
	.word 0xfef00b12  ! 630: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_261:
	taddcctv %r8, 0x1944, %r15
	.word 0xd007e001  ! 631: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x93902000  ! 632: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879020a0  ! 633: WRPR_TT_I	wrpr	%r0, 0x00a0, %tt
	.word 0x9b500000  ! 634: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xa1450000  ! 635: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xe0800ac0  ! 636: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
change_to_randtl_0_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_262:
	.word 0x8f902001  ! 637: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	set 0x1c7931da, %r28
	stxa %r28, [%g0] 0x73
intvec_0_263:
	.word 0x39400001  ! 638: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3c700001  ! 639: BPPOS	<illegal instruction>
	.word 0xe0d7e000  ! 640: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_tba_0_264:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 641: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802020  ! 642: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_0_265:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 643: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 644: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56b2001  ! 645: SDIVX_I	sdivx	%r12, 0x0001, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_267)) -> intp(0,1,3)
xir_0_267:
	.word 0xa9826001  ! 646: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xe4cfe020  ! 647: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
debug_0_268:
	setx debug_0_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 648: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe41fe001  ! 649: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0xe457e001  ! 650: LDSH_I	ldsh	[%r31 + 0x0001], %r18
	set 0x33449038, %r28
	stxa %r28, [%g0] 0x73
intvec_0_269:
	.word 0x39400001  ! 651: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_270:
	setx 0xe795f35c16ee225b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 652: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_271:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x83a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa1a20834  ! 653: FADDs	fadds	%f8, %f20, %f16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 654: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe047e001  ! 655: LDSW_I	ldsw	[%r31 + 0x0001], %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_272)) -> intp(0,0,23)
intvec_0_272:
	.word 0x39400001  ! 656: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_273:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 657: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 658: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_274)) -> intp(0,1,3)
xir_0_274:
	.word 0xa9802001  ! 659: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x91d02035  ! 660: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 661: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802004  ! 662: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 663: WRASI_I	wr	%r0, 0x0004, %asi
	set 0xadb0fb7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_275:
	.word 0x39400001  ! 664: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87520000  ! 665: RDPR_PIL	rdpr	%pil, %r3
	.word 0xc61fe001  ! 666: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 667: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d903b7c  ! 668: WRPR_PSTATE_I	wrpr	%r0, 0x1b7c, %pstate
splash_lsu_0_276:
	setx 0xfca2a00a4f75c7a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 669: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028ef  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x08ef, %pstate
	.word 0x3e800001  ! 671: BVC	bvc,a	<label_0x1>
splash_htba_0_277:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 672: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_278:
	mov 0x38, %r18
	.word 0xfef00b12  ! 673: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc68008a0  ! 674: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x99902004  ! 675: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
debug_0_279:
	mov 8, %r18
	.word 0xd0f00852  ! 676: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
tagged_0_280:
	tsubcctv %r25, 0x1c74, %r14
	.word 0xc607e001  ! 677: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x91d020b4  ! 678: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc717c000  ! 679: LDQF_R	-	[%r31, %r0], %f3
splash_cmpr_0_281:
	setx 0x6deefad12333dd3f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 680: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a000d1  ! 681: FNEGd	fnegd	%f48, %f12
	.word 0xd88fe010  ! 682: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
mondo_0_282:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d92c013  ! 683: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	set 0xeecc079f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_283:
	.word 0x39400001  ! 684: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_284:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f26, %f8
	.word 0x8fb50302  ! 685: ALIGNADDRESS	alignaddr	%r20, %r2, %r7
	.word 0x879022d6  ! 686: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
	.word 0x3c700001  ! 687: BPPOS	<illegal instruction>
	set 0x774f06c4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_285:
	.word 0x39400001  ! 688: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83464000  ! 689: RD_STICK_CMPR_REG	rd	%-, %r1
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_286)) -> intp(0,0,0)
intvec_0_286:
	.word 0x39400001  ! 690: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 691: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x91d02035  ! 692: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d9023eb  ! 693: WRPR_PSTATE_I	wrpr	%r0, 0x03eb, %pstate
	.word 0xc2cfe010  ! 694: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_287)) -> intp(0,1,3)
xir_0_287:
	.word 0xa980a001  ! 695: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 697: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_0_288:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 698: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa5520000  ! 699: RDPR_PIL	rdpr	%pil, %r18
splash_tba_0_289:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 701: SIR	sir	0x0001
splash_lsu_0_290:
	setx 0xa6bb15d9f732eb47, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 702: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 703: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xab82000b  ! 704: WR_CLEAR_SOFTINT_R	wr	%r8, %r11, %clear_softint
DS_0_291:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 705: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 706: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa345c000  ! 707: RD_TICK_CMPR_REG	rd	%-, %r17
change_to_randtl_0_292:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_292:
	.word 0x8f902001  ! 708: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_0_293:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc912c003  ! 1: LDQF_R	-	[%r11, %r3], %f4
	.word 0x99a2c824  ! 709: FADDs	fadds	%f11, %f4, %f12
intveclr_0_294:
	set 0x52d22b3e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 710: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_295:
	setx 0x629e9156b231f629, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 711: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8198299d  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099d, %hpstate
	.word 0x8d902d0b  ! 713: WRPR_PSTATE_I	wrpr	%r0, 0x0d0b, %pstate
splash_lsu_0_296:
	setx 0xf9fa430d3e31c3f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 714: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 715: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd997e001  ! 716: LDQFA_I	-	[%r31, 0x0001], %f12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 717: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8e4c8014  ! 718: MULX_R	mulx 	%r18, %r20, %r7
	.word 0xce07c000  ! 719: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0xa1902008  ! 720: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_0_297:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x87a00553  ! 1: FSQRTd	fsqrt	
	.word 0x99a18826  ! 721: FADDs	fadds	%f6, %f6, %f12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_298)) -> intp(0,1,3)
xir_0_298:
	.word 0xa980a001  ! 722: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xa1902006  ! 723: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	set 0xdf0d9112, %r28
	stxa %r28, [%g0] 0x73
intvec_0_299:
	.word 0x39400001  ! 724: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_300:
	mov 8, %r18
	.word 0xe4f00852  ! 725: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8d802004  ! 726: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd8800c00  ! 727: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x93902002  ! 728: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d9039d3  ! 729: WRPR_PSTATE_I	wrpr	%r0, 0x19d3, %pstate
	.word 0xd8d7e030  ! 730: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	set 0x5d91a49d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 731: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3c700001  ! 732: BPPOS	<illegal instruction>
splash_cmpr_0_302:
	setx 0x7463fa175936ee33, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 733: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 734: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 735: RD_STICK_REG	stbar
	.word 0xa1902003  ! 736: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	set 0x688bfd28, %r28
	stxa %r28, [%g0] 0x73
intvec_0_303:
	.word 0x39400001  ! 737: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 738: LDX_R	ldx	[%r31 + %r0], %r12
mondo_0_304:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 739: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x91d02033  ! 740: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd89fc020  ! 741: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_305)) -> intp(0,1,3)
xir_0_305:
	.word 0xa9826001  ! 742: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
splash_cmpr_0_306:
	setx 0x169ac4110570d824, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 743: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_307:
	setx 0xc185e3bf881a61cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 744: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd85fe001  ! 745: LDX_I	ldx	[%r31 + 0x0001], %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_308)) -> intp(0,0,28)
intvec_0_308:
	.word 0x39400001  ! 746: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd997e001  ! 747: LDQFA_I	-	[%r31, 0x0001], %f12
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 748: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd85fe001  ! 749: LDX_I	ldx	[%r31 + 0x0001], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 750: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x28800001  ! 751: BLEU	bleu,a	<label_0x1>
	.word 0xd91fc000  ! 752: LDDF_R	ldd	[%r31, %r0], %f12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_309)) -> intp(0,1,3)
xir_0_309:
	.word 0xa9802001  ! 753: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a0196b  ! 754: FqTOd	dis not found

mondo_0_311:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d910007  ! 755: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
tagged_0_312:
	tsubcctv %r23, 0x16a0, %r17
	.word 0xc607e001  ! 756: LDUW_I	lduw	[%r31 + 0x0001], %r3
tagged_0_313:
	taddcctv %r24, 0x1d21, %r20
	.word 0xc607e001  ! 757: LDUW_I	lduw	[%r31 + 0x0001], %r3
debug_0_314:
	mov 0x38, %r18
	.word 0xfef00b12  ! 758: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc63fe001  ! 759: STD_I	std	%r3, [%r31 + 0x0001]
	.word 0xc6dfe030  ! 760: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r3
intveclr_0_315:
	set 0x3f4de71a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 761: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_316:
	setx debug_0_316 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 762: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 763: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_317:
	mov 0x38, %r18
	.word 0xfef00b12  ! 764: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_318:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 765: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xc697e000  ! 766: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	set 0x7dd638dc, %r28
	stxa %r28, [%g0] 0x73
intvec_0_319:
	.word 0x39400001  ! 767: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_320:
	set 0x1c081c94, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 768: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_321:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 769: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 770: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x91480000  ! 771: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 772: LDX_R	ldx	[%r31 + %r0], %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 773: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_322:
	set 0x955e925b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 774: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e60  ! 775: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
	.word 0x8d450000  ! 776: RD_SET_SOFTINT	rd	%set_softint, %r6
DS_0_323:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcb14800d  ! 1: LDQF_R	-	[%r18, %r13], %f5
	.word 0x93a14825  ! 777: FADDs	fadds	%f5, %f5, %f9
splash_htba_0_324:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 778: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x26700001  ! 779: BPL	<illegal instruction>
	.word 0xa550c000  ! 780: RDPR_TT	rdpr	%tt, %r18
DS_0_325:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f22, %f4
	.word 0x91b00301  ! 781: ALIGNADDRESS	alignaddr	%r0, %r1, %r8
mondo_0_326:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d934000  ! 782: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x8d9034a1  ! 783: WRPR_PSTATE_I	wrpr	%r0, 0x14a1, %pstate
	.word 0xd0cfe020  ! 784: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
tagged_0_327:
	taddcctv %r17, 0x1179, %r9
	.word 0xd007e001  ! 785: LDUW_I	lduw	[%r31 + 0x0001], %r8
DS_0_328:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f16, %f20
	.word 0x99b1430a  ! 786: ALIGNADDRESS	alignaddr	%r5, %r10, %r12
mondo_0_329:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d910005  ! 787: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
splash_lsu_0_330:
	setx 0x79aaf93f91e44d85, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 788: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 789: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd80fe001  ! 790: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8d802004  ! 791: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_331:
	setx debug_0_331 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 792: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x95454000  ! 793: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
splash_htba_0_332:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 794: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd48fe000  ! 795: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
splash_cmpr_0_333:
	setx 0x980fac2fe7afcde9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 796: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_334)) -> intp(0,1,3)
xir_0_334:
	.word 0xa984e001  ! 797: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
tagged_0_335:
	taddcctv %r8, 0x1068, %r15
	.word 0xd407e001  ! 798: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd40fe001  ! 799: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x8d903fa6  ! 800: WRPR_PSTATE_I	wrpr	%r0, 0x1fa6, %pstate
	.word 0xa9500000  ! 801: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x87902300  ! 802: WRPR_TT_I	wrpr	%r0, 0x0300, %tt
	.word 0xa1902004  ! 803: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe8c7e010  ! 804: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r20
	.word 0xe87fe001  ! 805: SWAP_I	swap	%r20, [%r31 + 0x0001]
debug_0_336:
	mov 8, %r18
	.word 0xdcf00852  ! 806: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x93902002  ! 807: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8780204f  ! 808: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_0_337:
	set 0x110151, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 809: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_338:
	tsubcctv %r17, 0x1ab1, %r15
	.word 0xe807e001  ! 810: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xa1902006  ! 811: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d802000  ! 812: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe807c000  ! 813: LDUW_R	lduw	[%r31 + %r0], %r20
splash_cmpr_0_339:
	setx 0x4ae7ba0d6a759504, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 814: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe827c005  ! 815: STW_R	stw	%r20, [%r31 + %r5]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_340)) -> intp(0,0,31)
intvec_0_340:
	.word 0x39400001  ! 816: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_341:
	mov 0x38, %r18
	.word 0xfef00b12  ! 817: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 818: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e001  ! 819: LDQFA_I	-	[%r31, 0x0001], %f20
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 820: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 821: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902006  ! 822: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 823: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903d49  ! 824: WRPR_PSTATE_I	wrpr	%r0, 0x1d49, %pstate
splash_tba_0_342:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 825: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	set 0x6a0fda66, %r28
	stxa %r28, [%g0] 0x73
intvec_0_343:
	.word 0x39400001  ! 826: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_344:
	mov 0x38, %r18
	.word 0xfef00b12  ! 827: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902005  ! 828: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe8d804a0  ! 829: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
	.word 0xa2c52001  ! 830: ADDCcc_I	addccc 	%r20, 0x0001, %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_345)) -> intp(0,1,3)
xir_0_345:
	.word 0xa9842001  ! 831: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
debug_0_346:
	setx debug_0_346 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 832: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x92d2a001  ! 833: UMULcc_I	umulcc 	%r10, 0x0001, %r9
	.word 0xd31fc000  ! 834: LDDF_R	ldd	[%r31, %r0], %f9
debug_0_347:
	mov 0x38, %r18
	.word 0xfef00b12  ! 835: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902000  ! 836: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_0_348:
	mov 8, %r18
	.word 0xd2f00852  ! 837: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
DS_0_349:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb322001  ! 1: STQF_I	-	%f13, [0x0001, %r8]
	normalw
	.word 0xa5458000  ! 838: RD_SOFTINT_REG	rd	%softint, %r18
intveclr_0_350:
	set 0x93491fda, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 839: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 840: WRASI_I	wr	%r0, 0x001c, %asi
debug_0_351:
	mov 8, %r18
	.word 0xdef00852  ! 841: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe497e010  ! 842: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_352)) -> intp(0,1,3)
xir_0_352:
	.word 0xa9832001  ! 843: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
DS_0_353:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 844: SAVE_R	save	%r31, %r0, %r31
change_to_randtl_0_354:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_354:
	.word 0x8f902000  ! 845: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	set 0x31d16f5b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_355:
	.word 0x39400001  ! 846: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_356:
	mov 0x38, %r18
	.word 0xfef00b12  ! 847: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa190200b  ! 848: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe4c004a0  ! 849: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0x8d802000  ! 850: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 851: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 852: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe48008a0  ! 853: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
tagged_0_357:
	taddcctv %r11, 0x1428, %r15
	.word 0xe407e001  ! 854: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x24700001  ! 855: BPLE	<illegal instruction>
	.word 0x8780201c  ! 856: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_0_358:
	setx 0xf827448d2770c45b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 857: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a000c8  ! 858: FNEGd	fnegd	%f8, %f10
	.word 0x87802004  ! 859: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9745c000  ! 860: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xa9a509c0  ! 861: FDIVd	fdivd	%f20, %f0, %f20
tagged_0_359:
	taddcctv %r5, 0x1887, %r6
	.word 0xe807e001  ! 862: LDUW_I	lduw	[%r31 + 0x0001], %r20
tagged_0_360:
	tsubcctv %r15, 0x1215, %r4
	.word 0xe807e001  ! 863: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d802000  ! 864: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 865: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe93fc000  ! 866: STDF_R	std	%f20, [%r0, %r31]
debug_0_361:
	setx debug_0_361 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 867: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_362:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xff58f8d1	! Random illegal ?
	.word 0x81a00548  ! 1: FSQRTd	fsqrt	
	.word 0x8ba0482c  ! 868: FADDs	fadds	%f1, %f12, %f5
	set 0xa8bb187, %r28
	stxa %r28, [%g0] 0x73
intvec_0_363:
	.word 0x39400001  ! 869: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90348a  ! 870: WRPR_PSTATE_I	wrpr	%r0, 0x148a, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 871: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x81460000  ! 872: RD_STICK_REG	stbar
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_364)) -> intp(0,1,3)
xir_0_364:
	.word 0xa9852001  ! 873: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
debug_0_365:
	mov 0x38, %r18
	.word 0xfef00b12  ! 874: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_366:
	setx 0x615f6e27207fcfb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 875: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 876: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 877: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x3a800001  ! 878: BCC	bcc,a	<label_0x1>
	.word 0xcacfe010  ! 879: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
tagged_0_367:
	taddcctv %r12, 0x17a8, %r19
	.word 0xca07e001  ! 880: LDUW_I	lduw	[%r31 + 0x0001], %r5
mondo_0_368:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 881: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x91906001  ! 882: WRPR_PIL_I	wrpr	%r1, 0x0001, %pil
splash_cmpr_0_369:
	setx 0x3ac3bbf864c05443, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 883: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xca9fe001  ! 884: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
intveclr_0_370:
	set 0x2b7c600a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 885: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_371:
	mov 0x38, %r18
	.word 0xfef00b12  ! 886: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_372:
	set 0xcea21ebc, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 887: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 888: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_0_373:
	setx 0x84105996b8bc284d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 889: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8da149c3  ! 890: FDIVd	fdivd	%f36, %f34, %f6
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_374)) -> intp(0,0,8)
intvec_0_374:
	.word 0x39400001  ! 891: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_375:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8ba0054b  ! 1: FSQRTd	fsqrt	
	.word 0x8fa5082c  ! 892: FADDs	fadds	%f20, %f12, %f7
	.word 0x90fd0013  ! 893: SDIVcc_R	sdivcc 	%r20, %r19, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_376)) -> intp(0,0,22)
intvec_0_376:
	.word 0x39400001  ! 894: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd097e000  ! 895: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x81982c4c  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	.word 0xd13fc013  ! 897: STDF_R	std	%f8, [%r19, %r31]
	.word 0x93902002  ! 898: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 899: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 900: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 901: SIR	sir	0x0001
	.word 0xa7540000  ! 902: RDPR_GL	rdpr	%-, %r19
	.word 0xe6d7e030  ! 903: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
	.word 0x8780204f  ! 904: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_HPRIV	! macro
	set 0xf3a80448, %r28
	stxa %r28, [%g0] 0x73
intvec_0_377:
	.word 0x39400001  ! 906: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe6c7e030  ! 907: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 908: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802058  ! 909: WRASI_I	wr	%r0, 0x0058, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_378)) -> intp(0,0,17)
intvec_0_378:
	.word 0x39400001  ! 910: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 911: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa9480000  ! 912: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa190200a  ! 913: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x20800001  ! 914: BN	bn,a	<label_0x1>
intveclr_0_379:
	set 0xbe6f8293, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 915: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_380:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 916: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x38700001  ! 917: BPGU	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 918: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x26700001  ! 919: BPL	<illegal instruction>
splash_tba_0_381:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 920: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa350c000  ! 921: RDPR_TT	rdpr	%tt, %r17
	.word 0x93d020b2  ! 922: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xe2900e80  ! 923: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
	.word 0xe2d004a0  ! 924: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
DS_0_382:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 925: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 926: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe2dfe030  ! 927: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	.word 0x8950c000  ! 928: RDPR_TT	rdpr	%tt, %r4
	.word 0x8790228b  ! 929: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0x91d02034  ! 930: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02032  ! 931: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d90258d  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x058d, %pstate
	.word 0x8d90324c  ! 933: WRPR_PSTATE_I	wrpr	%r0, 0x124c, %pstate
	.word 0xa64a400d  ! 934: MULX_R	mulx 	%r9, %r13, %r19
	.word 0xa190200a  ! 935: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_0_383:
	setx 0xc1d17c726cf43aa8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 936: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_384:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_384:
	.word 0x8f902000  ! 937: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_385:
	setx debug_0_385 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 938: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802004  ! 939: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_386:
	setx 0x6c9deac2e2c54a42, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 940: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802001  ! 941: SIR	sir	0x0001
	.word 0xe6800bc0  ! 942: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
mondo_0_387:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 943: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xe737e001  ! 944: STQF_I	-	%f19, [0x0001, %r31]
splash_cmpr_0_388:
	setx 0xdaa370a99d0c43f6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 945: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e700001  ! 946: BPVC	<illegal instruction>
	.word 0x8790203b  ! 947: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
	.word 0x8d903d57  ! 948: WRPR_PSTATE_I	wrpr	%r0, 0x1d57, %pstate
	.word 0x879023db  ! 949: WRPR_TT_I	wrpr	%r0, 0x03db, %tt
	set 0xc82ab5bd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_389:
	.word 0x39400001  ! 950: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe71fe001  ! 951: LDDF_I	ldd	[%r31, 0x0001], %f19
	.word 0xe61fc000  ! 952: LDD_R	ldd	[%r31 + %r0], %r19
splash_cmpr_0_390:
	setx 0xc4f6432ed9b39000, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 953: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 954: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_0_391:
	setx 0x51d02bae2bc5090d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 955: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 956: LDX_R	ldx	[%r31 + %r0], %r19
debug_0_392:
	mov 0x38, %r18
	.word 0xfef00b12  ! 957: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0x4300096f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_393:
	.word 0x39400001  ! 958: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_394:
	tsubcctv %r10, 0x1575, %r20
	.word 0xe607e001  ! 959: LDUW_I	lduw	[%r31 + 0x0001], %r19
	set 0x6a1ff4f9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_395:
	.word 0x39400001  ! 960: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902083  ! 961: WRPR_TT_I	wrpr	%r0, 0x0083, %tt
	.word 0x8790218b  ! 962: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
mondo_0_396:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d91c00a  ! 963: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x87802058  ! 964: WRASI_I	wr	%r0, 0x0058, %asi
DS_0_397:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 965: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad816001  ! 966: WR_SOFTINT_REG_I	wr	%r5, 0x0001, %softint
	.word 0x87802088  ! 967: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe6d804a0  ! 968: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
DS_0_398:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f18, %f10, %f26
	.word 0xa3b3430d  ! 969: ALIGNADDRESS	alignaddr	%r13, %r13, %r17
	.word 0x8950c000  ! 970: RDPR_TT	rdpr	%tt, %r4
splash_htba_0_399:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 971: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc81fc000  ! 972: LDD_R	ldd	[%r31 + %r0], %r4
intveclr_0_400:
	set 0x4cccc67a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 973: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_401:
	set 0xe3a8a4fc, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 974: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902242  ! 975: WRPR_TT_I	wrpr	%r0, 0x0242, %tt
DS_0_402:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 976: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_403:
	setx 0xd20e022d8dcaf51b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 977: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 978: BPGE	<illegal instruction>
intveclr_0_404:
	set 0xdf2f9b8d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 979: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 980: WRASI_I	wr	%r0, 0x0004, %asi
DS_0_405:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 981: RESTORE_R	restore	%r31, %r0, %r31
debug_0_406:
	setx debug_0_406 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 982: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc85fc000  ! 983: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x22800001  ! 984: BE	be,a	<label_0x1>
mondo_0_407:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d900009  ! 985: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 986: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_0_408:
	setx 0x0eb1c80e45bcde7e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 987: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 988: WRASI_I	wr	%r0, 0x0058, %asi
debug_0_409:
	setx debug_0_409 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 989: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa190200f  ! 990: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa5480000  ! 991: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x81510000  ! 992: RDPR_TICK	<illegal instruction>
	.word 0x8d9034c7  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x14c7, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe49fc020  ! 995: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
DS_0_410:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 996: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe45fe001  ! 997: LDX_I	ldx	[%r31 + 0x0001], %r18
splash_cmpr_0_411:
	setx 0x573c7fc1acd63c54, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 998: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_412:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d944001  ! 999: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe4800b00  ! 1001: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
tagged_0_413:
	taddcctv %r11, 0x1cd8, %r25
	.word 0xe407e001  ! 1002: LDUW_I	lduw	[%r31 + 0x0001], %r18
intveclr_0_414:
	set 0xd9add4c9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1003: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_415:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d90c008  ! 1004: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
splash_cmpr_0_416:
	setx 0xb3529e8d106e45e8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1005: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_417:
	set 0xccd57ce7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1006: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_418:
	set 0x873df935, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1007: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1008: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_419)) -> intp(0,1,3)
xir_0_419:
	.word 0xa982e001  ! 1009: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
tagged_0_420:
	tsubcctv %r20, 0x152f, %r10
	.word 0xe407e001  ! 1010: LDUW_I	lduw	[%r31 + 0x0001], %r18
tagged_0_421:
	taddcctv %r23, 0x1e39, %r12
	.word 0xe407e001  ! 1011: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x9afc4012  ! 1012: SDIVcc_R	sdivcc 	%r17, %r18, %r13
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1013: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_422:
	tsubcctv %r21, 0x1879, %r25
	.word 0xda07e001  ! 1014: LDUW_I	lduw	[%r31 + 0x0001], %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1015: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda07c000  ! 1016: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x93902001  ! 1017: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xda07c000  ! 1018: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xda9fc020  ! 1019: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	set 0xe3bb0dc0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_423:
	.word 0x39400001  ! 1020: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 1021: BGU	bgu,a	<label_0x1>
	.word 0x97450000  ! 1022: RD_SET_SOFTINT	rd	%set_softint, %r11
debug_0_424:
	setx debug_0_424 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1023: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_425:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d90c013  ! 1024: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0xa190200a  ! 1025: WRPR_GL_I	wrpr	%r0, 0x000a, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_426)) -> intp(0,0,3)
intvec_0_426:
	.word 0x39400001  ! 1026: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_427:
	setx debug_0_427 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1027: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802014  ! 1028: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902b74  ! 1029: WRPR_PSTATE_I	wrpr	%r0, 0x0b74, %pstate
change_to_randtl_0_428:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_428:
	.word 0x8f902001  ! 1030: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_0_429:
	mov 8, %r18
	.word 0xdcf00852  ! 1031: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
DS_0_430:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xa1401d02	! Random illegal ?
	.word 0xc9128005  ! 1: LDQF_R	-	[%r10, %r5], %f4
	.word 0x8ba34823  ! 1032: FADDs	fadds	%f13, %f3, %f5
	.word 0xca1fc000  ! 1033: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xca57c000  ! 1034: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0xa1902000  ! 1035: WRPR_GL_I	wrpr	%r0, 0x0000, %-
debug_0_431:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1036: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xcb1fc000  ! 1037: LDDF_R	ldd	[%r31, %r0], %f5
	.word 0xa945c000  ! 1038: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe847e001  ! 1039: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0xa1902008  ! 1040: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902007  ! 1041: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_htba_0_432:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1042: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_433:
	setx debug_0_433 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1043: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_434:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1044: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe927c003  ! 1045: STF_R	st	%f20, [%r3, %r31]
	set 0xf2d99d64, %r28
	stxa %r28, [%g0] 0x73
intvec_0_435:
	.word 0x39400001  ! 1046: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1047: SIR	sir	0x0001
debug_0_436:
	setx debug_0_436 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1048: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe8d804a0  ! 1049: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
	.word 0xa190200d  ! 1050: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe81fc000  ! 1051: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x87802088  ! 1052: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe80fe001  ! 1053: LDUB_I	ldub	[%r31 + 0x0001], %r20
	.word 0x9545c000  ! 1054: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd4880e80  ! 1055: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0x8d802004  ! 1056: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_0_437:
	setx 0x4fd73e268d359043, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1057: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_438)) -> intp(0,0,5)
intvec_0_438:
	.word 0x39400001  ! 1058: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90334c  ! 1059: WRPR_PSTATE_I	wrpr	%r0, 0x134c, %pstate
	.word 0x83a409e3  ! 1060: FDIVq	dis not found

	.word 0x87802014  ! 1061: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d020b2  ! 1062: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xc207c000  ! 1063: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xc2800be0  ! 1064: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r1
	.word 0xa1902000  ! 1065: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_0_439:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1340002  ! 1: STQF_R	-	%f8, [%r2, %r16]
	normalw
	.word 0x95458000  ! 1066: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x87802004  ! 1067: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xab800011  ! 1068: WR_CLEAR_SOFTINT_R	wr	%r0, %r17, %clear_softint
tagged_0_440:
	tsubcctv %r21, 0x1e10, %r25
	.word 0xd407e001  ! 1069: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x91d020b4  ! 1070: Tcc_I	ta	icc_or_xcc, %r0 + 180
	ta	T_CHANGE_PRIV	! macro
debug_0_441:
	mov 8, %r18
	.word 0xd6f00852  ! 1072: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
debug_0_442:
	setx debug_0_442 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1073: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 1074: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4880e80  ! 1075: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1076: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_0_443:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1077: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902a05  ! 1078: WRPR_PSTATE_I	wrpr	%r0, 0x0a05, %pstate
debug_0_444:
	mov 8, %r18
	.word 0xe8f00852  ! 1079: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1080: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x9102b448, %r28
	stxa %r28, [%g0] 0x73
intvec_0_445:
	.word 0x39400001  ! 1081: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_446:
	tsubcctv %r7, 0x184a, %r23
	.word 0xd407e001  ! 1082: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d802004  ! 1083: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd457c000  ! 1084: LDSH_R	ldsh	[%r31 + %r0], %r10
tagged_0_447:
	taddcctv %r18, 0x1622, %r6
	.word 0xd407e001  ! 1085: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968e001  ! 1086: SDIVX_I	sdivx	%r3, 0x0001, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1087: LDX_R	ldx	[%r31 + %r0], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1088: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8d004a0  ! 1089: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0xd837c011  ! 1090: STH_R	sth	%r12, [%r31 + %r17]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 1091: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87902200  ! 1092: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0x91d020b3  ! 1093: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa190200d  ! 1094: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902206  ! 1095: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
	.word 0xa3520000  ! 1096: RDPR_PIL	rdpr	%pil, %r17
	.word 0x9550c000  ! 1097: RDPR_TT	<illegal instruction>
	.word 0x3e700001  ! 1098: BPVC	<illegal instruction>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1099: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902201  ! 1100: WRPR_TT_I	wrpr	%r0, 0x0201, %tt
splash_lsu_0_449:
	setx 0x3d1cc1dd30639fef, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b520000  ! 1102: RDPR_PIL	rdpr	%pil, %r13
	.word 0xda47c000  ! 1103: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0xa9808007  ! 1104: WR_SET_SOFTINT_R	wr	%r2, %r7, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1105: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_0_450:
	setx 0xd0ce169d86c87bbd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9808003  ! 1107: WR_SET_SOFTINT_R	wr	%r2, %r3, %set_softint
	.word 0x81540000  ! 1108: RDPR_GL	<illegal instruction>
	.word 0x9f802001  ! 1109: SIR	sir	0x0001
	.word 0x91d020b4  ! 1110: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc05fe001  ! 1111: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x87802010  ! 1112: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8780201c  ! 1113: WRASI_I	wr	%r0, 0x001c, %asi
change_to_randtl_0_451:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_451:
	.word 0x8f902004  ! 1114: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc047c000  ! 1115: LDSW_R	ldsw	[%r31 + %r0], %r0
intveclr_0_452:
	set 0x5427cc68, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1116: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x22700001  ! 1117: BPE	<illegal instruction>
	set 0x2cc919e0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_453:
	.word 0x39400001  ! 1118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_454:
	setx debug_0_454 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1119: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 1120: RDPR_TICK	rdpr	%tick, %r0
	.word 0x9169400d  ! 1121: SDIVX_R	sdivx	%r5, %r13, %r8
	set 0xef6debc6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_455:
	.word 0x39400001  ! 1122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_456)) -> intp(0,0,17)
intvec_0_456:
	.word 0x39400001  ! 1123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_457:
	taddcctv %r23, 0x187f, %r18
	.word 0xd007e001  ! 1124: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd08008a0  ! 1125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_458:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f22, %f18
	.word 0xa9b50313  ! 1127: ALIGNADDRESS	alignaddr	%r20, %r19, %r20
DS_0_459:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b44310  ! 1128: ALIGNADDRESS	alignaddr	%r17, %r16, %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_460)) -> intp(0,0,11)
intvec_0_460:
	.word 0x39400001  ! 1129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81510000  ! 1131: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02034  ! 1132: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa5450000  ! 1133: RD_SET_SOFTINT	rd	%set_softint, %r18
splash_tba_0_461:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1134: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe41fe001  ! 1135: LDD_I	ldd	[%r31 + 0x0001], %r18
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1136: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_462:
	mov 8, %r18
	.word 0xd8f00852  ! 1137: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x83d02032  ! 1138: Tcc_I	te	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_463)) -> intp(0,1,3)
xir_0_463:
	.word 0xa9842001  ! 1139: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_464)) -> intp(0,0,4)
intvec_0_464:
	.word 0x39400001  ! 1140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81b01021  ! 1141: SIAM	siam	1
debug_0_465:
	mov 8, %r18
	.word 0xe4f00852  ! 1142: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x87a409b2  ! 1143: FDIVs	fdivs	%f16, %f18, %f3
	.word 0x93902006  ! 1144: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802080  ! 1145: WRASI_I	wr	%r0, 0x0080, %asi
DS_0_466:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1146: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802080  ! 1147: WRASI_I	wr	%r0, 0x0080, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1148: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6900e40  ! 1149: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
	.word 0xc6d7e000  ! 1150: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0x87802058  ! 1151: WRASI_I	wr	%r0, 0x0058, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 1152: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc69fc020  ! 1153: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
intveclr_0_467:
	set 0x610ab33e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_468:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_469:
	setx debug_0_469 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1156: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_470:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f22, %f14
	.word 0x95b44311  ! 1157: ALIGNADDRESS	alignaddr	%r17, %r17, %r10
	.word 0xd4c004a0  ! 1158: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x91d020b2  ! 1159: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa7540000  ! 1160: RDPR_GL	rdpr	%-, %r19
	.word 0x81982c47  ! 1161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
	.word 0x8790215e  ! 1162: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	.word 0x9945c000  ! 1163: RD_TICK_CMPR_REG	rd	%-, %r12
debug_0_471:
	mov 8, %r18
	.word 0xe0f00852  ! 1164: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x8d903dd5  ! 1165: WRPR_PSTATE_I	wrpr	%r0, 0x1dd5, %pstate
debug_0_472:
	setx debug_0_472 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1166: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_473:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f8, %f8
	.word 0x8db1c309  ! 1167: ALIGNADDRESS	alignaddr	%r7, %r9, %r6
mondo_0_474:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d930001  ! 1168: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
	.word 0x8b464000  ! 1169: RD_STICK_CMPR_REG	rd	%-, %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 1170: LDX_R	ldx	[%r31 + %r0], %r5
DS_0_475:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7108010  ! 1: LDQF_R	-	[%r2, %r16], %f19
	.word 0xa7a30833  ! 1171: FADDs	fadds	%f12, %f19, %f19
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5464000  ! 1173: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x8cd46001  ! 1174: UMULcc_I	umulcc 	%r17, 0x0001, %r6
tagged_0_476:
	tsubcctv %r5, 0x1e6d, %r10
	.word 0xcc07e001  ! 1175: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xa190200d  ! 1176: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_0_477:
	mov 8, %r18
	.word 0xd4f00852  ! 1177: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x91d02032  ! 1178: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcc9fe001  ! 1179: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1180: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1181: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8780201c  ! 1182: WRASI_I	wr	%r0, 0x001c, %asi
debug_0_478:
	setx debug_0_478 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1183: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790214b  ! 1184: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0x8d9034c9  ! 1185: WRPR_PSTATE_I	wrpr	%r0, 0x14c9, %pstate
	.word 0xcd27e001  ! 1186: STF_I	st	%f6, [0x0001, %r31]
	.word 0x819828ce  ! 1187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
intveclr_0_479:
	set 0x9d2df71e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_480:
	setx 0xdf1a3cac1e7b9b44, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1189: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_481:
	setx 0xb60a9f79db030839, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_482)) -> intp(0,1,3)
xir_0_482:
	.word 0xa9802001  ! 1191: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
splash_htba_0_483:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1192: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_484:
	setx debug_0_484 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1193: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	set 0x6304aa36, %r28
	stxa %r28, [%g0] 0x73
intvec_0_485:
	.word 0x39400001  ! 1194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 1195: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 1196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902006  ! 1198: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa3500000  ! 1199: RDPR_TPC	rdpr	%tpc, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_486)) -> intp(0,0,10)
intvec_0_486:
	.word 0x39400001  ! 1200: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe25fe001  ! 1201: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0x91d020b2  ! 1202: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_0_487:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d940009  ! 1203: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
tagged_0_488:
	tsubcctv %r23, 0x15fa, %r11
	.word 0xe207e001  ! 1204: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa1902007  ! 1205: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x99902002  ! 1206: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x819828cd  ! 1207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	.word 0xe28008a0  ! 1208: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8790233b  ! 1209: WRPR_TT_I	wrpr	%r0, 0x033b, %tt
	.word 0xe21fc000  ! 1210: LDD_R	ldd	[%r31 + %r0], %r17
splash_cmpr_0_489:
	setx 0x442fb8250fe4dd91, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1211: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_490:
	setx 0x137b792777b5557d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 1213: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xab84c00b  ! 1214: WR_CLEAR_SOFTINT_R	wr	%r19, %r11, %clear_softint
	.word 0xe31fe001  ! 1215: LDDF_I	ldd	[%r31, 0x0001], %f17
	.word 0x91d02032  ! 1216: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_0_491:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1217: RESTORE_R	restore	%r31, %r0, %r31
DS_0_492:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8bb4c305  ! 1218: ALIGNADDRESS	alignaddr	%r19, %r5, %r5
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_493:
	set 0xaf8c3a8f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1220: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 1221: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_tba_0_494:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1222: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcb27c005  ! 1223: STF_R	st	%f5, [%r5, %r31]
	.word 0x8d903947  ! 1224: WRPR_PSTATE_I	wrpr	%r0, 0x1947, %pstate
	.word 0xa1902001  ! 1225: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87902068  ! 1226: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_495)) -> intp(0,1,3)
xir_0_495:
	.word 0xa980a001  ! 1227: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
splash_lsu_0_496:
	setx 0xf9a4791e166d5633, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1228: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_497:
	set 0x1d01d085, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1229: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_498:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d934006  ! 1230: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0xa1902002  ! 1231: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_0_499:
	setx 0x74b456c3a3f9429f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1232: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcac804a0  ! 1233: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_500)) -> intp(0,0,10)
intvec_0_500:
	.word 0x39400001  ! 1234: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1235: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903e64  ! 1236: WRPR_PSTATE_I	wrpr	%r0, 0x1e64, %pstate
splash_cmpr_0_501:
	setx 0x53b320567cfd32a3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1237: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 1239: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xca9004a0  ! 1240: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xca900e40  ! 1241: LDUHA_R	lduha	[%r0, %r0] 0x72, %r5
debug_0_502:
	setx debug_0_502 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1242: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81510000  ! 1243: RDPR_TICK	rdpr	%tick, %r0
debug_0_503:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1244: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xca57c000  ! 1245: LDSH_R	ldsh	[%r31 + %r0], %r5
DS_0_504:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xc75c37da	! Random illegal ?
	.word 0xc1140013  ! 1: LDQF_R	-	[%r16, %r19], %f0
	.word 0xa1a10832  ! 1246: FADDs	fadds	%f4, %f18, %f16
	.word 0xe0dfe000  ! 1247: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0x87a00dc8  ! 1248: FdMULq	fdmulq	
	.word 0xc6cfe020  ! 1249: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0x87802004  ! 1250: WRASI_I	wr	%r0, 0x0004, %asi
mondo_0_505:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d920005  ! 1251: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	.word 0x8198200c  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 1253: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_506)) -> intp(0,1,3)
xir_0_506:
	.word 0xa984e001  ! 1254: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x89454000  ! 1255: RD_CLEAR_SOFTINT	rd	%clear_softint, %r4
	set 0x29f423d7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_507:
	.word 0x39400001  ! 1256: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_508:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1257: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	set 0x6fbbf51e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_509:
	.word 0x39400001  ! 1258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_510:
	mov 8, %r18
	.word 0xdef00852  ! 1259: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8d902504  ! 1260: WRPR_PSTATE_I	wrpr	%r0, 0x0504, %pstate
	.word 0x91520000  ! 1261: RDPR_PIL	rdpr	%pil, %r8
	.word 0x38700001  ! 1262: BPGU	<illegal instruction>
	.word 0xab82800d  ! 1263: WR_CLEAR_SOFTINT_R	wr	%r10, %r13, %clear_softint
	.word 0xa9450000  ! 1264: RD_SET_SOFTINT	rd	%set_softint, %r20
intveclr_0_511:
	set 0x15f23ce9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_512:
	setx 0x928dae23bf2b04b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1266: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902008  ! 1267: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_513:
	mov 8, %r18
	.word 0xdcf00852  ! 1268: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
tagged_0_514:
	tsubcctv %r19, 0x1bef, %r14
	.word 0xe807e001  ! 1269: LDUW_I	lduw	[%r31 + 0x0001], %r20
debug_0_515:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1270: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe847e001  ! 1271: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0xe8c7e020  ! 1272: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
	.word 0x8d903d30  ! 1273: WRPR_PSTATE_I	wrpr	%r0, 0x1d30, %pstate
debug_0_516:
	mov 8, %r18
	.word 0xe4f00852  ! 1274: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xe93fe001  ! 1275: STDF_I	std	%f20, [0x0001, %r31]
	.word 0x91d020b3  ! 1276: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93a000c7  ! 1277: FNEGd	fnegd	%f38, %f40
DS_0_517:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1278: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd2800ae0  ! 1279: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_518)) -> intp(0,0,2)
intvec_0_518:
	.word 0x39400001  ! 1280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1281: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_0_519:
	setx 0x0ee1ab57086440e5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1282: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd29004a0  ! 1283: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0xd28fe010  ! 1284: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
splash_lsu_0_520:
	setx 0xaba87e0d0554e83f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1285: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 1286: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd24fe001  ! 1287: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0xd2dfe030  ! 1288: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xd2c7e020  ! 1289: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x8198218e  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018e, %hpstate
	.word 0x91d02034  ! 1291: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 1292: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd23fe001  ! 1293: STD_I	std	%r9, [%r31 + 0x0001]
	.word 0xd28008a0  ! 1294: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93902002  ! 1295: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	set 0xa001830c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_521:
	.word 0x39400001  ! 1296: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 1297: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd2dfe010  ! 1298: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1299: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_522:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc3312001  ! 1: STQF_I	-	%f1, [0x0001, %r4]
	normalw
	.word 0x9b458000  ! 1300: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdb17c000  ! 1301: LDQF_R	-	[%r31, %r0], %f13
	.word 0x99902005  ! 1302: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xda800a80  ! 1303: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
	.word 0x87802004  ! 1304: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902003  ! 1306: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	set 0x1238c61e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_523:
	.word 0x39400001  ! 1307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_524)) -> intp(0,1,3)
xir_0_524:
	.word 0xa980e001  ! 1308: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_525)) -> intp(0,1,3)
xir_0_525:
	.word 0xa984e001  ! 1309: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
mondo_0_526:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d90400c  ! 1310: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	.word 0xda4fe001  ! 1311: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x8d902b26  ! 1312: WRPR_PSTATE_I	wrpr	%r0, 0x0b26, %pstate
	.word 0x87802089  ! 1313: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3e700001  ! 1314: BPVC	<illegal instruction>
DS_0_527:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f30, %f30
	.word 0x8bb44310  ! 1315: ALIGNADDRESS	alignaddr	%r17, %r16, %r5
	.word 0x879022af  ! 1316: WRPR_TT_I	wrpr	%r0, 0x02af, %tt
	.word 0x8d9034d9  ! 1317: WRPR_PSTATE_I	wrpr	%r0, 0x14d9, %pstate
	.word 0xca5fe001  ! 1318: LDX_I	ldx	[%r31 + 0x0001], %r5
tagged_0_528:
	tsubcctv %r10, 0x1773, %r19
	.word 0xca07e001  ! 1319: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xcbe7c030  ! 1320: CASA_I	casa	[%r31] 0x 1, %r16, %r5
debug_0_529:
	setx debug_0_529 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1321: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_530)) -> intp(0,0,21)
intvec_0_530:
	.word 0x39400001  ! 1323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790212b  ! 1324: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
tagged_0_531:
	taddcctv %r2, 0x143a, %r21
	.word 0xca07e001  ! 1325: LDUW_I	lduw	[%r31 + 0x0001], %r5
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_532)) -> intp(0,1,3)
xir_0_532:
	.word 0xa9826001  ! 1326: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x93902001  ! 1327: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1328: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xad846001  ! 1329: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 1330: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x2e700001  ! 1331: BPVS	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f50c000  ! 1333: RDPR_TT	rdpr	%tt, %r7
	.word 0xcf27e001  ! 1334: STF_I	st	%f7, [0x0001, %r31]
	.word 0x8d45c000  ! 1335: RD_TICK_CMPR_REG	rd	%-, %r6
debug_0_533:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1336: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xcc8008a0  ! 1337: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93902002  ! 1338: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_0_534:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe330c00d  ! 1: STQF_R	-	%f17, [%r13, %r3]
	normalw
	.word 0x83458000  ! 1339: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xa1902004  ! 1340: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902007  ! 1341: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02033  ! 1342: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc327e001  ! 1343: STF_I	st	%f1, [0x0001, %r31]
	.word 0xc327c00d  ! 1344: STF_R	st	%f1, [%r13, %r31]
	.word 0x91906001  ! 1345: WRPR_PIL_I	wrpr	%r1, 0x0001, %pil
	.word 0x87802004  ! 1346: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902002  ! 1347: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc20fc000  ! 1348: LDUB_R	ldub	[%r31 + %r0], %r1
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 1349: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9830011  ! 1350: WR_SET_SOFTINT_R	wr	%r12, %r17, %set_softint
	.word 0xc31fe001  ! 1351: LDDF_I	ldd	[%r31, 0x0001], %f1
	.word 0xc2d7e010  ! 1352: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0xc25fe001  ! 1353: LDX_I	ldx	[%r31 + 0x0001], %r1
	set 0xb727f5f4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_535:
	.word 0x39400001  ! 1354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_536)) -> intp(0,0,5)
intvec_0_536:
	.word 0x39400001  ! 1355: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc25fe001  ! 1356: LDX_I	ldx	[%r31 + 0x0001], %r1
tagged_0_537:
	taddcctv %r7, 0x1740, %r15
	.word 0xc207e001  ! 1357: LDUW_I	lduw	[%r31 + 0x0001], %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 1358: LDX_R	ldx	[%r31 + %r0], %r1
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_538)) -> intp(0,0,24)
intvec_0_538:
	.word 0x39400001  ! 1359: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c45  ! 1360: WRPR_PSTATE_I	wrpr	%r0, 0x0c45, %pstate
	.word 0x87802010  ! 1361: WRASI_I	wr	%r0, 0x0010, %asi
mondo_0_539:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 1362: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0xc207c000  ! 1363: LDUW_R	lduw	[%r31 + %r0], %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc25fc000  ! 1364: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc28008a0  ! 1365: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_tba_0_540:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1366: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x32800001  ! 1367: BNE	bne,a	<label_0x1>
splash_cmpr_0_541:
	setx 0xa536c4c38d07da32, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 1369: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902633  ! 1370: WRPR_PSTATE_I	wrpr	%r0, 0x0633, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_542)) -> intp(0,0,29)
intvec_0_542:
	.word 0x39400001  ! 1371: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038f4  ! 1372: WRPR_PSTATE_I	wrpr	%r0, 0x18f4, %pstate
splash_htba_0_543:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1373: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_0_544:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1374: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	set 0x821fb0cc, %r28
	stxa %r28, [%g0] 0x73
intvec_0_545:
	.word 0x39400001  ! 1375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_546:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1376: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_547:
	setx 0x43dc2cf3b06a3257, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 1378: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0x8d464000  ! 1379: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0x879023df  ! 1380: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
mondo_0_548:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 1381: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xccdfe030  ! 1382: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0xcd1fc000  ! 1383: LDDF_R	ldd	[%r31, %r0], %f6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc07c000  ! 1385: LDUW_R	lduw	[%r31 + %r0], %r6
mondo_0_549:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d92c006  ! 1386: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0xcc800aa0  ! 1387: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r6
	.word 0xccbfc026  ! 1388: STDA_R	stda	%r6, [%r31 + %r6] 0x01
debug_0_550:
	setx debug_0_550 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1389: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_551:
	set 0xa8b096c2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1390: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 1391: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902003  ! 1392: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_0_552:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xab56aeed	! Random illegal ?
	.word 0xe114c013  ! 1: LDQF_R	-	[%r19, %r19], %f16
	.word 0xa1a10821  ! 1393: FADDs	fadds	%f4, %f1, %f16
debug_0_553:
	setx debug_0_553 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1394: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902000  ! 1395: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802055  ! 1396: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa5464000  ! 1397: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0xad826001  ! 1398: WR_SOFTINT_REG_I	wr	%r9, 0x0001, %softint
	.word 0xe48008a0  ! 1399: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe49004a0  ! 1400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
DS_0_554:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1401: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	set 0xd2e73a04, %r28
	stxa %r28, [%g0] 0x73
intvec_0_555:
	.word 0x39400001  ! 1402: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_556)) -> intp(0,1,3)
xir_0_556:
	.word 0xa9802001  ! 1403: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x93d02035  ! 1404: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa190200b  ! 1405: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe447e001  ! 1406: LDSW_I	ldsw	[%r31 + 0x0001], %r18
	.word 0x93d02034  ! 1407: Tcc_I	tne	icc_or_xcc, %r0 + 52
intveclr_0_557:
	set 0xa0fb7462, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1408: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4d7e020  ! 1409: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1410: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 1411: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x93902001  ! 1412: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_558)) -> intp(0,1,3)
xir_0_558:
	.word 0xa9836001  ! 1413: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xe4c7e010  ! 1414: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8d902e66  ! 1415: WRPR_PSTATE_I	wrpr	%r0, 0x0e66, %pstate
debug_0_559:
	setx debug_0_559 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1416: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe537c001  ! 1417: STQF_R	-	%f18, [%r1, %r31]
	.word 0xa7540000  ! 1418: RDPR_GL	rdpr	%-, %r19
	.word 0x91d020b5  ! 1419: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xab844009  ! 1420: WR_CLEAR_SOFTINT_R	wr	%r17, %r9, %clear_softint
splash_lsu_0_560:
	setx 0x20ace9b4c1535165, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe727c009  ! 1422: STF_R	st	%f19, [%r9, %r31]
splash_cmpr_0_561:
	setx 0xb170b911ca8fb1fb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1423: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_562:
	setx 0xfc292b10cef969b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1424: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3500000  ! 1425: RDPR_TPC	<illegal instruction>
	.word 0x87902275  ! 1426: WRPR_TT_I	wrpr	%r0, 0x0275, %tt
intveclr_0_563:
	set 0x5b6d8beb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1427: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_564:
	setx 0xda8efd69d93fbe81, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1428: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1429: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
debug_0_565:
	setx debug_0_565 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1431: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8eac400c  ! 1432: ANDNcc_R	andncc 	%r17, %r12, %r7
	.word 0xce1fc000  ! 1433: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x87902124  ! 1434: WRPR_TT_I	wrpr	%r0, 0x0124, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902000  ! 1436: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x24700001  ! 1437: BPLE	<illegal instruction>
splash_tba_0_566:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1438: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 1439: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802089  ! 1440: WRASI_I	wr	%r0, 0x0089, %asi
debug_0_567:
	mov 8, %r18
	.word 0xe6f00852  ! 1441: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x8ba509a5  ! 1442: FDIVs	fdivs	%f20, %f5, %f5
debug_0_568:
	setx debug_0_568 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1443: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_569:
	setx 0x9f87aea25a1dda48, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1444: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 1445: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xca0fe001  ! 1446: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0x87902159  ! 1447: WRPR_TT_I	wrpr	%r0, 0x0159, %tt
mondo_0_570:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d90c013  ! 1448: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
splash_cmpr_0_571:
	setx 0x3222dc2c9304169f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1449: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xad82e001  ! 1450: WR_SOFTINT_REG_I	wr	%r11, 0x0001, %softint
	.word 0xcac7e010  ! 1451: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x8198239e  ! 1452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039e, %hpstate
	.word 0xca1fc000  ! 1453: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0x93902004  ! 1454: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_0_572:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 1455: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x34800001  ! 1456: BG	bg,a	<label_0x1>
intveclr_0_573:
	set 0x3e482a1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1457: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcacfe000  ! 1458: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_574)) -> intp(0,0,19)
intvec_0_574:
	.word 0x39400001  ! 1459: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 1460: Tcc_I	ta	icc_or_xcc, %r0 + 179
debug_0_575:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93540000  ! 1462: RDPR_GL	rdpr	%-, %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_576)) -> intp(0,0,31)
intvec_0_576:
	.word 0x39400001  ! 1463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_577)) -> intp(0,1,3)
xir_0_577:
	.word 0xa9842001  ! 1464: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
splash_cmpr_0_578:
	setx 0x6b652a578d59daf1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1465: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902003  ! 1467: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x92d40011  ! 1468: UMULcc_R	umulcc 	%r16, %r17, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_579)) -> intp(0,1,3)
xir_0_579:
	.word 0xa9806001  ! 1469: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x8b45c000  ! 1470: RD_TICK_CMPR_REG	rd	%-, %r5
	.word 0x81a4c9cb  ! 1471: FDIVd	fdivd	%f50, %f42, %f0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_580)) -> intp(0,0,29)
intvec_0_580:
	.word 0x39400001  ! 1472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc05fe001  ! 1473: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x93902002  ! 1474: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa5520000  ! 1475: RDPR_PIL	rdpr	%pil, %r18
	.word 0x99902004  ! 1476: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x87802004  ! 1477: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x86d24008  ! 1478: UMULcc_R	umulcc 	%r9, %r8, %r3
	set 0x34afb12a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_581:
	.word 0x39400001  ! 1479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_582:
	mov 8, %r18
	.word 0xdef00852  ! 1480: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_583)) -> intp(0,1,3)
xir_0_583:
	.word 0xa9822001  ! 1481: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_584)) -> intp(0,0,22)
intvec_0_584:
	.word 0x39400001  ! 1482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1483: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa980c00d  ! 1484: WR_SET_SOFTINT_R	wr	%r3, %r13, %set_softint
splash_cmpr_0_585:
	setx 0x84048c3df154eaf8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1485: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_586)) -> intp(0,0,30)
intvec_0_586:
	.word 0x39400001  ! 1486: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x7a929321, %r28
	stxa %r28, [%g0] 0x73
intvec_0_587:
	.word 0x39400001  ! 1488: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 1489: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc68008a0  ! 1490: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x87802020  ! 1491: WRASI_I	wr	%r0, 0x0020, %asi
tagged_0_588:
	tsubcctv %r10, 0x18b7, %r22
	.word 0xc607e001  ! 1492: LDUW_I	lduw	[%r31 + 0x0001], %r3
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1493: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_589:
	setx 0x6a750810c5b49858, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1494: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_590:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1495: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81b01021  ! 1496: SIAM	siam	1
	.word 0x91d02033  ! 1497: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879023c5  ! 1498: WRPR_TT_I	wrpr	%r0, 0x03c5, %tt
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

	.xword	0x2c98c07003dc7a2a
	.xword	0x798a938b4ddf8983
	.xword	0xdf28c3e97fc8d8ca
	.xword	0x0bc9f291b7f1ce10
	.xword	0xb27a577cdbc17ce6
	.xword	0x45cfd6b79e17c0b8
	.xword	0x533608e02c636be5
	.xword	0xdbbf78a7bebe1647
	.xword	0x3448590a4590bed0
	.xword	0xccacb0bd958ac672
	.xword	0x74d369f1a040b128
	.xword	0x0d9413f02b427102
	.xword	0x69834cf73b9569e0
	.xword	0x359f5005c5b136f1
	.xword	0x7106ea8c4ed83969
	.xword	0x2769073846120344
	.xword	0x871dbcc0529a3b6f
	.xword	0x0b6f180fb9f84e07
	.xword	0x3122d33f36dbb463
	.xword	0xea67111fe59ff4fa
	.xword	0x698c6383e4271666
	.xword	0x036f73fa05426bb6
	.xword	0x2377df09eb1c043b
	.xword	0x66c7f4a1ad41774a
	.xword	0xaaa02855701c01a6
	.xword	0x4fc5d147a01d80a3
	.xword	0x5ce220cbee1f9cea
	.xword	0xc386d627109d46b6
	.xword	0x0d3bde224169260e
	.xword	0xdee726f774de1576
	.xword	0xab1fab3e0ed5bea1
	.xword	0xeea83037fe2a2e1a
	.xword	0xc3943743968f9d7a
	.xword	0xcfcba3d485cc5c26
	.xword	0x3c17fda54d7a1d64
	.xword	0xb97b3ced7c81f2ae
	.xword	0x85f63c4805651e07
	.xword	0xd3813a185eb65516
	.xword	0x31916241e089a462
	.xword	0x6f44628a3de7bee0
	.xword	0x30d8534416f1adee
	.xword	0xd19bbbc7d667c483
	.xword	0x58c049a9e27fb727
	.xword	0x71f816d2e9857b76
	.xword	0x9d54d7d2acb99dd4
	.xword	0x70065992888205dd
	.xword	0x057cab4daa39a129
	.xword	0xce6da34c58e5a8fa
	.xword	0x4cdb1c202e89c4a8
	.xword	0x12404a8938b0fcb3
	.xword	0xf929999f5c62bd19
	.xword	0x6a28ce139a512f8f
	.xword	0x7d530e9a83f47ca4
	.xword	0xe551525cf805c8d3
	.xword	0x3238ced590544090
	.xword	0x941744bc6218adf5
	.xword	0xd76a1686f3aef559
	.xword	0x88de0652a1bafba8
	.xword	0xfafa9a810a9ba92b
	.xword	0xc49cfa0569b35455
	.xword	0x73537878629750c3
	.xword	0x096072f69648119c
	.xword	0x100f1e2ab3cf045c
	.xword	0x1860136c8c79d80b
	.xword	0x0d507c8ba7da8dc5
	.xword	0x2d6a98d51b09b9b3
	.xword	0xbba7a5865d7c5afe
	.xword	0x5faac5ca139c44fc
	.xword	0x51b8d3ec952abe9b
	.xword	0xe1cd4fbdeea7ebda
	.xword	0x5652d700ba467212
	.xword	0x70e3def1b31fb7a3
	.xword	0x8f3b5cc3d86a39b6
	.xword	0xf3e5620b2da7ce34
	.xword	0xd5f1e336aaa07f18
	.xword	0x5e74df8a0d66bd90
	.xword	0x3caf28c473d91974
	.xword	0xcc3eefe768762140
	.xword	0x0e6919ac3c7a4d90
	.xword	0x9652c390ad1e4c69
	.xword	0xea4c7efa027c55e5
	.xword	0xb0f01b511260a739
	.xword	0x8328a44b43a7c44f
	.xword	0x198340dd4046ff12
	.xword	0x67ed6a04daf98aa3
	.xword	0xce6a7b6cdfc16387
	.xword	0xe44c2810b47ef472
	.xword	0x25d17a8bb2fa5407
	.xword	0xb4b247f50b419cc9
	.xword	0xe5bab2b73d0c8757
	.xword	0xd9e95cc264ca8943
	.xword	0xb272aa3c6e3a6b9f
	.xword	0xda5b4c67268e6cc4
	.xword	0x2f3c2c6040594d17
	.xword	0x04845db95e22bf36
	.xword	0xe2c0f298e1b2eb51
	.xword	0x789b94e42abf0ccb
	.xword	0xf78035201b781ce2
	.xword	0x9208f75c9ae25990
	.xword	0xb25ecef808e28e99
	.xword	0x0b0fd7b413801e20
	.xword	0xecfad3537ccbe449
	.xword	0x1b8e091fc0dd9c61
	.xword	0x903635e09bd5dd2c
	.xword	0x3c65b079558c3432
	.xword	0xb43ac136366f6b3b
	.xword	0x2c9f27fda1e06fe7
	.xword	0x90b870f1ce3448be
	.xword	0xa37fe399574be3da
	.xword	0x136ce5d181bb81d1
	.xword	0x4aa7502e9a917e94
	.xword	0x978b5400de915be9
	.xword	0x1c753841932ac5ff
	.xword	0x0efe4fe53d78c6c8
	.xword	0x423fc2611d8589fd
	.xword	0x407c9d8360db5646
	.xword	0xcf3433146d722e6f
	.xword	0x1a02c942b6fb9e55
	.xword	0x4c212fdca099c37b
	.xword	0x7958cd2b27d74807
	.xword	0x63829d3e09057b69
	.xword	0x4b6a1b703f1ad03b
	.xword	0x0157127a0c8fbbdc
	.xword	0xdc099213cd1a7be4
	.xword	0x234fb566d40c71f1
	.xword	0xe3cbb1965cf32257
	.xword	0x8e6d1bd1a433a362
	.xword	0x47c715c7b0ce3a4e
	.xword	0x6ced6d81cb032e6a
	.xword	0x555fe9efe94d6458
	.xword	0x1cdc166b3321ed80
	.xword	0xc83687acf13c2a5f
	.xword	0x73009705a51055c9
	.xword	0xdfcefe8931c831cf
	.xword	0x23471b28fd95a81b
	.xword	0xb76b8b954c6de5ee
	.xword	0x56518f05b4222e09
	.xword	0x22d94f5498d6d9a5
	.xword	0xd58b17f033de4d73
	.xword	0x9a0b996a8a13f7ac
	.xword	0xba85bf5e18edcf71
	.xword	0x8559f2c03e4a7b42
	.xword	0x3b23b4449a177d31
	.xword	0x1c02ebbdd54645f7
	.xword	0x73db5ee89a2b0f86
	.xword	0x82cfcc26a0d716e3
	.xword	0xc7ea720b25d42bb6
	.xword	0x54a069dc0621f64b
	.xword	0x6403a2b59fba6c90
	.xword	0xf263dc27a2ebc8af
	.xword	0xd43cefdf57d1d430
	.xword	0xbda14b1de08e839a
	.xword	0xea8b3f6af7cafb3b
	.xword	0xf6d83fb3ca3229c1
	.xword	0x37ab4526da575e2f
	.xword	0x88e89f650b57f6d5
	.xword	0x52e003f3b95fc54e
	.xword	0x709fe13e2e855a29
	.xword	0x9ec76b29866d6713
	.xword	0xbc21c63e70a13412
	.xword	0x3799382c943c8771
	.xword	0x31eb74e6fff58bc1
	.xword	0xfe737f59c65cb4af
	.xword	0x8797b96ef7ea00e8
	.xword	0x09e244f8a6c4c8c1
	.xword	0x55415be4be076d4f
	.xword	0x7dd08af02905c033
	.xword	0xcd6ed8ccb3a41814
	.xword	0xdcdf03b5d9f7ec80
	.xword	0x5b06c1570829b039
	.xword	0x29ac2ad56c954d77
	.xword	0x0c6180ccb523c39c
	.xword	0x11e67d4c96ed3dc9
	.xword	0x3dfa8f86c35f4953
	.xword	0x7af0e24cf8900628
	.xword	0x985d74bf0ed0ceee
	.xword	0x025f32ce83c3b944
	.xword	0x49106c5020fed398
	.xword	0x5adef77877e919f5
	.xword	0x0484de156155a729
	.xword	0x1ffdfece4ff93809
	.xword	0x1c5d53aeddf5d086
	.xword	0x66428a2bb1c7114a
	.xword	0x51a91c68491f79e1
	.xword	0x123be42041ee57da
	.xword	0x4c679d40c7ebd529
	.xword	0x7dd4c15bffc473a4
	.xword	0x1634e97b3982f363
	.xword	0x8c44a75fcd86044d
	.xword	0x4fb5bfa04d2a33be
	.xword	0xe61a0be48a5b78ed
	.xword	0x975a0e4ef253e144
	.xword	0x298f386662bfbaea
	.xword	0x53bac5253da3bcbc
	.xword	0x5b006edd6008b241
	.xword	0xe481193a5d4d7269
	.xword	0x9d1dd8110f66e8af
	.xword	0xa28158a6110b030d
	.xword	0x6baeab38db93e00f
	.xword	0xfff59733a1f63644
	.xword	0x1815c111db93ec52
	.xword	0x0ea111e94aa2cf3f
	.xword	0xa95edbe87228be45
	.xword	0x9d651ad41df58dd8
	.xword	0x52aa89f5a3bbf7c3
	.xword	0x720699ca70366fcc
	.xword	0xd428dcfe51172b9f
	.xword	0x1e5d6d8d48871913
	.xword	0x99a4b7575fad0729
	.xword	0xcaca45bfe84f4a04
	.xword	0x48a52c14fc65889e
	.xword	0x5f5c23ed89e36997
	.xword	0xd5f5e612671c1251
	.xword	0x650ab578549f5643
	.xword	0x71ea4d4626d52725
	.xword	0xc5f80e93c4ba0988
	.xword	0x964d4bbfc78ebf6d
	.xword	0xe5fd0a4e6c6e12b9
	.xword	0x5f07dc30f4727b41
	.xword	0xb3661d0dd57f5cff
	.xword	0x065793ddc62006e4
	.xword	0x21a807a948243dfd
	.xword	0x077e92aa415df82e
	.xword	0x68bb08d579c87056
	.xword	0x6a612697615064ee
	.xword	0x2b019dc5323073e4
	.xword	0x13849f345bffeffe
	.xword	0xf138232d7274c0f1
	.xword	0xfcb628e2882a03b1
	.xword	0x8b95ff500d9fbe56
	.xword	0x1c1ed97fc77abf2b
	.xword	0xc82de99dde20d831
	.xword	0xda855af581af0f66
	.xword	0xe19cbf2089926ff4
	.xword	0xf926bafe0883f24b
	.xword	0xb8c9cd660db95eba
	.xword	0xd9b7ac7b9db905a7
	.xword	0x7994347a056ffde8
	.xword	0x3e250833713573a0
	.xword	0xb49839930c74521e
	.xword	0x1a5bc50e48d0ed89
	.xword	0x8a520158dbe80d07
	.xword	0x1d844670774ba7b0
	.xword	0x1a80c1a3fb69e4cb
	.xword	0x3ae3a5b3add7efa8
	.xword	0x47901fbdafbc1e52
	.xword	0x4c1b340f94a32cf1
	.xword	0xe0e822e8a85fe2ce
	.xword	0x1fd8020fdc0c451a
	.xword	0xeeaca9ed92583fad
	.xword	0xf44a6cc73a1c325e
	.xword	0x85150fbe042fd968
	.xword	0x2c2c28ca7a856d8a
	.xword	0x6b67c1fa64ccbf00
	.xword	0x2235caaf5de0d3c5
	.xword	0x1e4b56dafe74cd6c

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

