/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_15.s
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
	mov 0x31, %r14
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
	mov 0xb1, %r14
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

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_0)) -> intp(0,0,0)
intvec_0_0:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 2: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 3: WRASI_I	wr	%r0, 0x0055, %asi
debug_0_1:
	nop
	setx debug_0_1 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 4: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xe743a435	! Random illegal ?
	.word 0xe9128000  ! 1: LDQF_R	-	[%r10, %r0], %f20
	.word 0x99a44831  ! 5: FADDs	fadds	%f17, %f17, %f12
splash_lsu_0_3:
	setx 0x490881ca6180e8f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 6: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 7: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_4)) -> intp(0,0,29)
intvec_0_4:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 9: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe637e001  ! 10: STH_I	sth	%r19, [%r31 + 0x0001]
	.word 0xe607c000  ! 11: LDUW_R	lduw	[%r31 + %r0], %r19
splash_tba_0_5:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 12: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_0_6:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902004  ! 14: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_0_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d928003  ! 15: WRPR_WSTATE_R	wrpr	%r10, %r3, %wstate
splash_cmpr_0_8:
	setx 0xcf2be1c9a74bf164, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe61fe001  ! 17: LDD_I	ldd	[%r31 + 0x0001], %r19
splash_cmpr_0_9:
	setx 0x3ca95bed73410811, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 18: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_10)) -> intp(0,0,23)
intvec_0_10:
	.word 0x39400001  ! 19: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
intveclr_0_11:
	set 0xe071bda4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 22: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_12:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 23: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0xe68fe010  ! 24: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r19
tagged_0_13:
	taddcctv %r19, 0x18c0, %r12
	.word 0xe607e001  ! 25: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe6d004a0  ! 26: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x91d020b4  ! 27: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x32700001  ! 28: BPNE	<illegal instruction>
	.word 0x8b45c000  ! 29: RD_TICK_CMPR_REG	rd	%-, %r5
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 30: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcad80e40  ! 31: LDXA_R	ldxa	[%r0, %r0] 0x72, %r5
splash_cmpr_0_14:
	setx 0x4b27c96e7cfeaf02, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_15:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 33: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_16)) -> intp(0,0,2)
intvec_0_16:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xca5fe001  ! 35: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x8790229e  ! 36: WRPR_TT_I	wrpr	%r0, 0x029e, %tt
	.word 0xcacfe010  ! 37: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
debug_0_17:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 38: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902f09  ! 39: WRPR_PSTATE_I	wrpr	%r0, 0x0f09, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_18)) -> intp(0,1,3)
xir_0_18:
	.word 0xa984e001  ! 40: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
debug_0_19:
	nop
	setx debug_0_19 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 41: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9345c000  ! 42: RD_TICK_CMPR_REG	rd	%-, %r9
DS_0_20:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 43: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_0_21:
	setx 0xe2afd09235856dc6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 44: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903341  ! 45: WRPR_PSTATE_I	wrpr	%r0, 0x1341, %pstate
	.word 0x87902377  ! 46: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_22)) -> intp(0,0,3)
intvec_0_22:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_23:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d908000  ! 48: WRPR_WSTATE_R	wrpr	%r2, %r0, %wstate
debug_0_24:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 49: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x3c800001  ! 50: BPOS	bpos,a	<label_0x1>
splash_tba_0_25:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_26)) -> intp(0,0,2)
intvec_0_26:
	.word 0x39400001  ! 52: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd257e001  ! 53: LDSH_I	ldsh	[%r31 + 0x0001], %r9
mondo_0_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d904010  ! 54: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xd2d804a0  ! 55: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 56: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd31fc000  ! 57: LDDF_R	ldd	[%r31, %r0], %f9
	.word 0xd2cfe010  ! 58: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d802000  ! 59: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_28:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe1314014  ! 1: STQF_R	-	%f16, [%r20, %r5]
	normalw
	.word 0xa1458000  ! 60: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x26800001  ! 61: BL	bl,a	<label_0x1>
	.word 0xe08008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8790208b  ! 63: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0xe0d7e030  ! 64: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
intveclr_0_29:
	set 0xff1683d5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_0_30:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 66: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b4  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xad806001  ! 68: WR_SOFTINT_REG_I	wr	%r1, 0x0001, %softint
debug_0_31:
	nop
	setx debug_0_31 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 69: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa7852001  ! 70: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0001, %-
	.word 0xa781a001  ! 71: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x0001, %-
splash_lsu_0_32:
	setx 0x034305d973a01297, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 73: BPNEG	<illegal instruction>
	.word 0xe01fe001  ! 74: LDD_I	ldd	[%r31 + 0x0001], %r16
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 75: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_33)) -> intp(0,1,3)
xir_0_33:
	.word 0xa982e001  ! 76: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
tagged_0_34:
	tsubcctv %r25, 0x1f1d, %r3
	.word 0xe007e001  ! 77: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe127c014  ! 78: STF_R	st	%f16, [%r20, %r31]
mondo_0_35:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d910005  ! 79: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_36)) -> intp(0,0,5)
intvec_0_36:
	.word 0x39400001  ! 80: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2e800001  ! 81: BVS	bvs,a	<label_0x1>
	.word 0xe08008a0  ! 82: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x81510000  ! 83: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe09fe001  ! 84: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x87802016  ! 85: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe08008a0  ! 86: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe08008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
splash_cmpr_0_37:
	setx 0xc69defd2be1f6dc1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 88: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_38:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc1304012  ! 1: STQF_R	-	%f0, [%r18, %r1]
	normalw
	.word 0x85458000  ! 89: RD_SOFTINT_REG	rd	%softint, %r2
debug_0_39:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 90: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
intveclr_0_40:
	set 0x8f914108, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 91: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902005  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc48008a0  ! 94: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc477c012  ! 95: STX_R	stx	%r2, [%r31 + %r18]
	.word 0xa082c012  ! 96: ADDcc_R	addcc 	%r11, %r18, %r16
DS_0_41:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 97: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_42)) -> intp(0,1,3)
xir_0_42:
	.word 0xa9812001  ! 98: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0x93902005  ! 99: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90282f  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x082f, %pstate
	.word 0x87802010  ! 101: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe0dfe000  ! 102: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
debug_0_43:
	nop
	setx debug_0_43 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 103: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe097e030  ! 104: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
	.word 0xe0880e80  ! 105: LDUBA_R	lduba	[%r0, %r0] 0x74, %r16
change_to_randtl_0_44:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_44:
	.word 0x8f902002  ! 106: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d903f53  ! 107: WRPR_PSTATE_I	wrpr	%r0, 0x1f53, %pstate
	.word 0x8790201e  ! 108: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
intveclr_0_45:
	set 0x5bf81fa6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa983400b  ! 110: WR_SET_SOFTINT_R	wr	%r13, %r11, %set_softint
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 111: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe08fe020  ! 112: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_46)) -> intp(0,0,13)
intvec_0_46:
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_47:
	set 0xdefb2b5b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe097e020  ! 115: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
debug_0_48:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 116: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
mondo_0_49:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c001  ! 117: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
tagged_0_50:
	tsubcctv %r21, 0x11ee, %r18
	.word 0xe007e001  ! 118: LDUW_I	lduw	[%r31 + 0x0001], %r16
intveclr_0_51:
	set 0x68e61c0e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_52:
	setx 0x4c7fbfc3da067033, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 120: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32800001  ! 121: BNE	bne,a	<label_0x1>
	.word 0xe137c001  ! 122: STQF_R	-	%f16, [%r1, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 123: LDX_R	ldx	[%r31 + %r0], %r16
intveclr_0_53:
	set 0x3b91e5c3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 125: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0x87802088  ! 126: WRASI_I	wr	%r0, 0x0088, %asi
DS_0_55:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 127: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d9025cd  ! 128: WRPR_PSTATE_I	wrpr	%r0, 0x05cd, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_56)) -> intp(0,0,15)
intvec_0_56:
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83500000  ! 130: RDPR_TPC	rdpr	%tpc, %r1
	.word 0xc2880e80  ! 131: LDUBA_R	lduba	[%r0, %r0] 0x74, %r1
	.word 0xc257e001  ! 132: LDSH_I	ldsh	[%r31 + 0x0001], %r1
splash_cmpr_0_57:
	setx 0x7706836bf32aa8c4, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 133: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc28008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
mondo_0_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d91c00a  ! 135: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x87902379  ! 136: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
	set 0xa168459, %r28
	stxa %r28, [%g0] 0x73
intvec_0_59:
	.word 0x39400001  ! 137: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 138: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0xc28fe010  ! 139: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 140: Tcc_R	te	icc_or_xcc, %r0 + %r30
	set 0xac6264ab, %r28
	stxa %r28, [%g0] 0x73
intvec_0_61:
	.word 0x39400001  ! 141: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_0_62:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_62:
	.word 0x8f902001  ! 143: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903d8f  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1d8f, %pstate
	.word 0xc327c013  ! 145: STF_R	st	%f1, [%r19, %r31]
splash_cmpr_0_63:
	setx 0xe8ffa2105259d993, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 146: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_64:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 147: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
splash_lsu_0_65:
	setx 0xd71160b9b7e2a447, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 148: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87454000  ! 149: RD_CLEAR_SOFTINT	rd	%clear_softint, %r3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01963  ! 150: FqTOd	dis not found

	.word 0xe22fe001  ! 151: STB_I	stb	%r17, [%r31 + 0x0001]
tagged_0_67:
	taddcctv %r1, 0x1e17, %r8
	.word 0xe207e001  ! 152: LDUW_I	lduw	[%r31 + 0x0001], %r17
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 154: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_68:
	tsubcctv %r17, 0x1848, %r11
	.word 0xe207e001  ! 155: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87500000  ! 156: RDPR_TPC	rdpr	%tpc, %r3
	.word 0xc68008a0  ! 157: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x91946001  ! 158: WRPR_PIL_I	wrpr	%r17, 0x0001, %pil
	.word 0x9f802001  ! 159: SIR	sir	0x0001
	.word 0xc64fe001  ! 160: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0x91d020b3  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d903ea0  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x1ea0, %pstate
splash_cmpr_0_69:
	setx 0xf092e6de11140706, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 163: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902f63  ! 164: WRPR_PSTATE_I	wrpr	%r0, 0x0f63, %pstate
mondo_0_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 165: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x9aa80001  ! 166: ANDNcc_R	andncc 	%r0, %r1, %r13
	set 0xc6ce8b4b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_71:
	.word 0x39400001  ! 167: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 168: WRASI_I	wr	%r0, 0x0058, %asi
debug_0_72:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 169: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x94692001  ! 170: UDIVX_I	udivx 	%r4, 0x0001, %r10
splash_lsu_0_73:
	setx 0xf32b5bb5bad4b0ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_0_74:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 172: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd42fe001  ! 173: STB_I	stb	%r10, [%r31 + 0x0001]
	.word 0xd4dfe030  ! 174: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
splash_cmpr_0_75:
	setx 0x15dc274b953b91df, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 175: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_76)) -> intp(0,0,30)
intvec_0_76:
	.word 0x39400001  ! 176: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 177: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_0_77:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 178: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_78)) -> intp(0,0,2)
intvec_0_78:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 180: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x3c800001  ! 181: BPOS	bpos,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 182: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_79:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 183: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 184: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x856a2001  ! 185: SDIVX_I	sdivx	%r8, 0x0001, %r2
	.word 0xa9844010  ! 186: WR_SET_SOFTINT_R	wr	%r17, %r16, %set_softint
	.word 0xc447e001  ! 187: LDSW_I	ldsw	[%r31 + 0x0001], %r2
splash_cmpr_0_81:
	setx 0x381552a91240c309, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 188: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81510000  ! 189: RDPR_TICK	<illegal instruction>
	.word 0xc4800ae0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r2
	.word 0x87802016  ! 191: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc51fe001  ! 192: LDDF_I	ldd	[%r31, 0x0001], %f2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_82)) -> intp(0,0,4)
intvec_0_82:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_83:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 194: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_84:
	setx 0x4cf33f53d3a0ef10, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 195: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_85:
	taddcctv %r7, 0x1d0f, %r3
	.word 0xc407e001  ! 196: LDUW_I	lduw	[%r31 + 0x0001], %r2
splash_lsu_0_86:
	setx 0x7cc78175baf30c21, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 197: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc527e001  ! 198: STF_I	st	%f2, [0x0001, %r31]
	.word 0xc4d80e80  ! 199: LDXA_R	ldxa	[%r0, %r0] 0x74, %r2
mondo_0_87:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d920013  ! 200: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0x8d902250  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0250, %pstate
debug_0_88:
	nop
	setx debug_0_88 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 202: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_lsu_0_89:
	setx 0xb643ed812ff80459, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_90:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 204: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x819822d7  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
	.word 0xc41fc000  ! 206: LDD_R	ldd	[%r31 + %r0], %r2
splash_lsu_0_91:
	setx 0x14ce93bea1e9c21d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 207: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc527e001  ! 208: STF_I	st	%f2, [0x0001, %r31]
	.word 0x87802014  ! 209: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa782e001  ! 210: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0001, %-
	.word 0xad846001  ! 211: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
intveclr_0_92:
	set 0x1568b9f8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 212: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc40fe001  ! 213: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x8350c000  ! 214: RDPR_TT	rdpr	%tt, %r1
splash_cmpr_0_93:
	setx 0x848ce272a6cf7093, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 215: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc20fc000  ! 216: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0x81460000  ! 217: RD_STICK_REG	stbar
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 219: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xc2c804a0  ! 220: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0xc2d7e020  ! 221: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	ta	T_CHANGE_HPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 223: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8d450000  ! 224: RD_SET_SOFTINT	rd	%set_softint, %r6
	.word 0xad84a001  ! 225: WR_SOFTINT_REG_I	wr	%r18, 0x0001, %softint
	.word 0x8780201c  ! 226: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_0_95:
	setx 0x74ad63361f8bfd30, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 227: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_96:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c00a  ! 228: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
change_to_randtl_0_97:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_97:
	.word 0x8f902004  ! 229: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
splash_lsu_0_98:
	setx 0x06e8e9d0caaff26f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8fe010  ! 231: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0xcd37c00a  ! 232: STQF_R	-	%f6, [%r10, %r31]
	.word 0xcc8008a0  ! 233: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc5fe001  ! 234: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x8945c000  ! 235: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0x93902005  ! 236: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02035  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_0_99:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9312001  ! 1: STQF_I	-	%f12, [0x0001, %r4]
	normalw
	.word 0x8b458000  ! 238: RD_SOFTINT_REG	rd	%softint, %r5
intveclr_0_100:
	set 0xdf12ea99, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 239: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_101)) -> intp(0,1,3)
xir_0_101:
	.word 0xa981a001  ! 240: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xca5fe001  ! 241: LDX_I	ldx	[%r31 + 0x0001], %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_102)) -> intp(0,0,30)
intvec_0_102:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x31354060, %r28
	stxa %r28, [%g0] 0x73
intvec_0_103:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_104:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 244: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_cmpr_0_105:
	setx 0x623404b89005ccfb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 245: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b3  ! 246: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_cmpr_0_106:
	setx 0x2d7edbe5048ea63c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 247: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xca9004a0  ! 248: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xa1902007  ! 249: WRPR_GL_I	wrpr	%r0, 0x0007, %-
mondo_0_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d944004  ! 250: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x93d02033  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 252: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_108:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 253: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x87802089  ! 254: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xca2fe001  ! 255: STB_I	stb	%r5, [%r31 + 0x0001]
mondo_0_109:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d924008  ! 256: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_110)) -> intp(0,0,4)
intvec_0_110:
	.word 0x39400001  ! 257: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xca3fe001  ! 258: STD_I	std	%r5, [%r31 + 0x0001]
DS_0_111:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db44314  ! 259: ALIGNADDRESS	alignaddr	%r17, %r20, %r6
	.word 0x8d90275e  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x075e, %pstate
	.word 0x91d02035  ! 261: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_112:
	setx 0xb9f50b96d85fb528, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 262: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020d9  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x91d02032  ! 265: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_0_113:
	setx 0x97405fc79f81b4d0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 266: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_114:
	setx 0xf064289f449d0aa9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 268: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3c800001  ! 269: BPOS	bpos,a	<label_0x1>
tagged_0_115:
	taddcctv %r7, 0x14d9, %r7
	.word 0xcc07e001  ! 270: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x81464000  ! 271: RD_STICK_CMPR_REG	stbar
splash_cmpr_0_116:
	setx 0x8811ea4dd5c09e52, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 272: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d802004  ! 273: WRFPRS_I	wr	%r0, 0x0004, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_117)) -> intp(0,1,3)
xir_0_117:
	.word 0xa9822001  ! 274: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
mondo_0_118:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d93000b  ! 275: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	set 0x6d64b1a6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_119:
	.word 0x39400001  ! 276: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 277: WRPR_GL_I	wrpr	%r0, 0x0004, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_120)) -> intp(0,1,3)
xir_0_120:
	.word 0xa981e001  ! 278: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 280: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_0_121:
	setx 0xcc8facfa410b6385, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9480000  ! 282: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xe8cfe000  ! 283: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0xe88008a0  ! 284: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_122)) -> intp(0,0,15)
intvec_0_122:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_0_123:
	taddcctv %r12, 0x1078, %r18
	.word 0xe807e001  ! 287: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x91454000  ! 288: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xd0d7e000  ! 289: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_124)) -> intp(0,0,28)
intvec_0_124:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_125:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_125:
	.word 0x8f902004  ! 291: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
mondo_0_126:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 292: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
splash_cmpr_0_127:
	setx 0x0c9178544bf36f04, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 293: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd137e001  ! 294: STQF_I	-	%f8, [0x0001, %r31]
debug_0_128:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 295: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d90265b  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
mondo_0_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 297: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
debug_0_130:
	nop
	setx debug_0_130 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd0c7e030  ! 299: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ae001  ! 300: SDIVX_I	sdivx	%r11, 0x0001, %r9
splash_lsu_0_132:
	setx 0xe12d750fd1e7af57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 301: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_133:
	taddcctv %r6, 0x1d69, %r18
	.word 0xd207e001  ! 302: LDUW_I	lduw	[%r31 + 0x0001], %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_134)) -> intp(0,0,20)
intvec_0_134:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_0_135:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d924007  ! 305: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
mondo_0_136:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d918012  ! 306: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0x9f802001  ! 307: SIR	sir	0x0001
mondo_0_137:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d944011  ! 308: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_138)) -> intp(0,0,10)
intvec_0_138:
	.word 0x39400001  ! 309: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 310: RD_STICK_REG	stbar
	.word 0xd2900e40  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x72, %r9
	.word 0x20800001  ! 312: BN	bn,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa345c000  ! 314: RD_TICK_CMPR_REG	rd	%-, %r17
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 315: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_139)) -> intp(0,1,3)
xir_0_139:
	.word 0xa980a001  ! 316: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
splash_lsu_0_140:
	setx 0x02e972789a653e61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 317: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe030  ! 318: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	.word 0x8d480000  ! 319: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	set 0xc8301e66, %r28
	stxa %r28, [%g0] 0x73
intvec_0_141:
	.word 0x39400001  ! 320: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_142:
	setx 0x1ed6bb5a2afcb02b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 321: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 322: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x879023e8  ! 323: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
debug_0_144:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 324: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	set 0x6c8e8064, %r28
	stxa %r28, [%g0] 0x73
intvec_0_145:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_146)) -> intp(0,0,18)
intvec_0_146:
	.word 0x39400001  ! 326: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 327: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1a01a6c  ! 328: FqTOi	fqtoi	
	set 0xe28d0ad, %r28
	stxa %r28, [%g0] 0x73
intvec_0_147:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902037  ! 330: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
	.word 0xa1902008  ! 331: WRPR_GL_I	wrpr	%r0, 0x0008, %-
debug_0_148:
	nop
	setx debug_0_148 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 332: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 333: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe09fc020  ! 334: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
tagged_0_149:
	taddcctv %r20, 0x1f99, %r15
	.word 0xe007e001  ! 335: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x87902357  ! 336: WRPR_TT_I	wrpr	%r0, 0x0357, %tt
	.word 0xe01fe001  ! 337: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0x83d02033  ! 338: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_0_150:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d924002  ! 339: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	.word 0xa5464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0xe4d7e010  ! 341: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 342: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_0_151:
	setx 0xb7cfde3e3f4895f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 343: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_152:
	tsubcctv %r6, 0x1f5d, %r26
	.word 0xe407e001  ! 344: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe4d7e030  ! 345: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 346: Tcc_R	te	icc_or_xcc, %r0 + %r30
	set 0x94b1f4fa, %r28
	stxa %r28, [%g0] 0x73
intvec_0_153:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_154)) -> intp(0,0,4)
intvec_0_154:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800c60  ! 350: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
splash_lsu_0_155:
	setx 0xe4f20525a3eb48b5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_156:
	setx 0x35515b2c42fc8515, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 352: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4cfe020  ! 353: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
debug_0_157:
	nop
	setx debug_0_157 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 354: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_158:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d944008  ! 355: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0x99902001  ! 356: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_159)) -> intp(0,1,3)
xir_0_159:
	.word 0xa984e001  ! 357: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 358: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_160)) -> intp(0,0,10)
intvec_0_160:
	.word 0x39400001  ! 359: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_161:
	setx 0x7ff4ff097dd92b8c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 360: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_162)) -> intp(0,1,3)
xir_0_162:
	.word 0xa9842001  ! 361: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xe48008a0  ! 362: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93902004  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
intveclr_0_163:
	set 0xf548614e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 178
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 366: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81510000  ! 367: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe48008a0  ! 368: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8790211e  ! 369: WRPR_TT_I	wrpr	%r0, 0x011e, %tt
mondo_0_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 370: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0xe44fc000  ! 371: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 372: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa7816001  ! 373: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x0001, %-
	.word 0xe51fc000  ! 374: LDDF_R	ldd	[%r31, %r0], %f18
DS_0_165:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b0c300  ! 375: ALIGNADDRESS	alignaddr	%r3, %r0, %r20
	.word 0xe85fe001  ! 376: LDX_I	ldx	[%r31 + 0x0001], %r20
debug_0_166:
	nop
	setx debug_0_166 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 377: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 378: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_167)) -> intp(0,1,3)
xir_0_167:
	.word 0xa9842001  ! 379: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xe88008a0  ! 380: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x9f802001  ! 381: SIR	sir	0x0001
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_168)) -> intp(0,1,3)
xir_0_168:
	.word 0xa980a001  ! 382: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
splash_cmpr_0_169:
	setx 0x5eeef944151c7a29, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 383: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_170:
	setx 0x26791b8a6a7a7f14, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_171:
	setx 0x1d61d6fff1daf9b3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 385: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f45c000  ! 386: RD_TICK_CMPR_REG	rd	%-, %r7
DS_0_172:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 387: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
debug_0_173:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 388: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_174:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 389: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_175)) -> intp(0,1,3)
xir_0_175:
	.word 0xa982a001  ! 390: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
DS_0_176:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7328011  ! 1: STQF_R	-	%f19, [%r17, %r10]
	normalw
	.word 0xa3458000  ! 391: RD_SOFTINT_REG	rd	%softint, %r17
debug_0_177:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 392: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_lsu_0_178:
	setx 0xd8079bcb2913d181, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d930008  ! 394: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0x8d9039ff  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x19ff, %pstate
	.word 0x91d020b3  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8fa000c7  ! 397: FNEGd	fnegd	%f38, %f38
	.word 0xce8008a0  ! 398: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce800b00  ! 399: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r7
mondo_0_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d92000d  ! 400: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
debug_0_181:
	nop
	setx debug_0_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 401: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xce8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce9fc020  ! 403: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
DS_0_182:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1326001  ! 1: STQF_I	-	%f8, [0x0001, %r9]
	normalw
	.word 0x95458000  ! 404: RD_SOFTINT_REG	rd	%softint, %r10
splash_cmpr_0_183:
	setx 0xdd1e9b4b437dcdb5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 405: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_184:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d94c001  ! 406: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0xd4bfe001  ! 407: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 408: LDX_R	ldx	[%r31 + %r0], %r10
	set 0x9c99c683, %r28
	stxa %r28, [%g0] 0x73
intvec_0_185:
	.word 0x39400001  ! 409: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_186:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 410: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
mondo_0_187:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92000b  ! 411: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xd457e001  ! 412: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 413: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x83d02033  ! 414: Tcc_I	te	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_188)) -> intp(0,0,10)
intvec_0_188:
	.word 0x39400001  ! 415: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 416: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x83d020b4  ! 417: Tcc_I	te	icc_or_xcc, %r0 + 180
debug_0_189:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 418: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
DS_0_190:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 419: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd48fe020  ! 420: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd53fc00b  ! 421: STDF_R	std	%f10, [%r11, %r31]
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 422: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0xff6bf1da, %r28
	stxa %r28, [%g0] 0x73
intvec_0_191:
	.word 0x39400001  ! 423: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_192:
	setx 0x6a474f2c104c06bf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 424: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd51fe001  ! 426: LDDF_I	ldd	[%r31, 0x0001], %f10
	set 0xd42b4025, %r28
	stxa %r28, [%g0] 0x73
intvec_0_193:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_194)) -> intp(0,0,1)
intvec_0_194:
	.word 0x39400001  ! 428: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 429: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x81510000  ! 430: RDPR_TICK	rdpr	%tick, %r0
splash_cmpr_0_195:
	setx 0x9944a91047316685, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 431: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_196:
	setx 0xa05cdc1b90ddebf3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 433: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_197:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94400a  ! 434: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
mondo_0_198:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 435: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
intveclr_0_199:
	set 0x9e842092, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 436: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd41fe001  ! 437: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x87802020  ! 438: WRASI_I	wr	%r0, 0x0020, %asi
mondo_0_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d95000b  ! 439: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x87802014  ! 440: WRASI_I	wr	%r0, 0x0014, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r10
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_201)) -> intp(0,1,3)
xir_0_201:
	.word 0xa981a001  ! 442: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
debug_0_202:
	nop
	setx debug_0_202 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 443: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 444: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982e45  ! 445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e45, %hpstate
	.word 0xd537e001  ! 446: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xa150c000  ! 447: RDPR_TT	rdpr	%tt, %r16
	.word 0x87802089  ! 448: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a209e8  ! 449: FDIVq	dis not found

	.word 0xa7450000  ! 450: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xe647c000  ! 451: LDSW_R	ldsw	[%r31 + %r0], %r19
intveclr_0_203:
	set 0x219dfcab, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 452: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 453: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa3500000  ! 454: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x93902000  ! 455: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902403  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
splash_cmpr_0_204:
	setx 0x113c030a8d6dd65d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 457: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe327e001  ! 458: STF_I	st	%f17, [0x0001, %r31]
	.word 0xa1902005  ! 459: WRPR_GL_I	wrpr	%r0, 0x0005, %-
intveclr_0_205:
	set 0xfcb2d689, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 461: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x87802088  ! 462: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_0_207:
	setx 0x42ad5219d2167719, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 463: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_208:
	setx 0x376d8b4df9b5448c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 464: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902007  ! 465: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 466: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2800c80  ! 468: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
	.word 0x91d02035  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_209:
	setx 0x745908fca393c030, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 470: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 471: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x8d802000  ! 472: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 473: LDX_R	ldx	[%r31 + %r0], %r17
splash_lsu_0_211:
	setx 0x577e2c9356408277, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 474: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe24fe001  ! 475: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	.word 0x91d02032  ! 476: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe23fe001  ! 477: STD_I	std	%r17, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_212)) -> intp(0,0,13)
intvec_0_212:
	.word 0x39400001  ! 478: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 479: SIR	sir	0x0001
splash_cmpr_0_213:
	setx 0x0061f2836e3bab13, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 480: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_214:
	nop
	setx debug_0_214 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 481: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_215:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 482: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802088  ! 483: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x80f94013  ! 484: SDIVcc_R	sdivcc 	%r5, %r19, %r0
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_216:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 486: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
splash_cmpr_0_217:
	setx 0xe872d6d149eac6ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 487: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_218:
	setx 0xf67e617e66746b59, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 488: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_219:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 489: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xc08008a0  ! 490: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 491: LDX_R	ldx	[%r31 + %r0], %r0
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_220:
	setx 0x730be9c20c8f5138, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_221:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d944013  ! 494: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
splash_cmpr_0_222:
	setx 0x430d4191e4441c35, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 495: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_223:
	taddcctv %r24, 0x107b, %r7
	.word 0xc007e001  ! 496: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x81982b85  ! 497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b85, %hpstate
tagged_0_224:
	tsubcctv %r23, 0x1777, %r25
	.word 0xc007e001  ! 498: LDUW_I	lduw	[%r31 + 0x0001], %r0
DS_0_225:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3352001  ! 1: STQF_I	-	%f17, [0x0001, %r20]
	normalw
	.word 0xa9458000  ! 499: RD_SOFTINT_REG	rd	%softint, %r20
tagged_0_226:
	tsubcctv %r2, 0x18d7, %r5
	.word 0xe807e001  ! 500: LDUW_I	lduw	[%r31 + 0x0001], %r20
mondo_0_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d934001  ! 501: WRPR_WSTATE_R	wrpr	%r13, %r1, %wstate
	.word 0xe81fc000  ! 502: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x93902005  ! 503: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_0_228:
	setx 0x58e67ed906bd2c14, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 504: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_229:
	setx 0x029dac9bec62d29f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 505: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93902004  ! 506: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_230)) -> intp(0,0,23)
intvec_0_230:
	.word 0x39400001  ! 507: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_231:
	set 0x5fcd3bf5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 508: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903691  ! 509: WRPR_PSTATE_I	wrpr	%r0, 0x1691, %pstate
debug_0_232:
	nop
	setx debug_0_232 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 510: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe927e001  ! 512: STF_I	st	%f20, [0x0001, %r31]
	.word 0x28700001  ! 513: BPLEU	<illegal instruction>
	.word 0x87802010  ! 514: WRASI_I	wr	%r0, 0x0010, %asi
mondo_0_233:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d940006  ! 515: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
splash_cmpr_0_234:
	setx 0x829bfb3e6e5c3063, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 516: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe857c000  ! 517: LDSH_R	ldsh	[%r31 + %r0], %r20
DS_0_235:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd914000b  ! 1: LDQF_R	-	[%r16, %r11], %f12
	.word 0x89a4c833  ! 518: FADDs	fadds	%f19, %f19, %f4
	.word 0x8780201c  ! 519: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d802000  ! 520: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8fa4c9a6  ! 521: FDIVs	fdivs	%f19, %f6, %f7
	.word 0x87802020  ! 522: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa190200a  ! 523: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xce4fc000  ! 524: LDSB_R	ldsb	[%r31 + %r0], %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 525: LDX_R	ldx	[%r31 + %r0], %r7
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_236)) -> intp(0,0,2)
intvec_0_236:
	.word 0x39400001  ! 526: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_237)) -> intp(0,1,3)
xir_0_237:
	.word 0xa9822001  ! 527: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
intveclr_0_238:
	set 0xaa82c6c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 528: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_239:
	setx 0xdd006c166e558a27, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_240:
	setx 0xfff3b17b1b18b6a7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 530: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce800c00  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r7
	.word 0xce3fc006  ! 532: STD_R	std	%r7, [%r31 + %r6]
splash_cmpr_0_241:
	setx 0x6ed7232e0bd58050, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 533: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_242:
	setx 0xda4139bc984c270b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 534: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_243:
	.word 0x8f902003  ! 535: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xad84e001  ! 536: WR_SOFTINT_REG_I	wr	%r19, 0x0001, %softint
	.word 0xce0fc000  ! 537: LDUB_R	ldub	[%r31 + %r0], %r7
	.word 0x91d02035  ! 538: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_0_244:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d910002  ! 539: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
tagged_0_245:
	taddcctv %r4, 0x11e3, %r17
	.word 0xce07e001  ! 540: LDUW_I	lduw	[%r31 + 0x0001], %r7
mondo_0_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d918007  ! 541: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
	.word 0x30800001  ! 542: BA	ba,a	<label_0x1>
splash_cmpr_0_247:
	setx 0x343e0fbc5488e1e0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 543: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_248:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 544: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xce8008a0  ! 545: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa150c000  ! 546: RDPR_TT	<illegal instruction>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 547: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_0_249:
	taddcctv %r2, 0x144a, %r1
	.word 0xe007e001  ! 548: LDUW_I	lduw	[%r31 + 0x0001], %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 549: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe05fe001  ! 550: LDX_I	ldx	[%r31 + 0x0001], %r16
mondo_0_250:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 551: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0xe00fc000  ! 552: LDUB_R	ldub	[%r31 + %r0], %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_251)) -> intp(0,1,3)
xir_0_251:
	.word 0xa9826001  ! 553: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x8d902c7e  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x0c7e, %pstate
	.word 0xab814012  ! 555: WR_CLEAR_SOFTINT_R	wr	%r5, %r18, %clear_softint
debug_0_252:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 556: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8d903500  ! 557: WRPR_PSTATE_I	wrpr	%r0, 0x1500, %pstate
	.word 0xe1e7c032  ! 558: CASA_I	casa	[%r31] 0x 1, %r18, %r16
change_to_randtl_0_253:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_253:
	.word 0x8f902004  ! 559: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
splash_cmpr_0_254:
	setx 0xbf1bd67cc1c1d51b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902032  ! 561: WRPR_PSTATE_I	wrpr	%r0, 0x0032, %pstate
tagged_0_255:
	taddcctv %r5, 0x1b0c, %r7
	.word 0xe007e001  ! 562: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x93902004  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xab844003  ! 564: WR_CLEAR_SOFTINT_R	wr	%r17, %r3, %clear_softint
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01969  ! 565: FqTOd	dis not found

	.word 0xe29fc020  ! 566: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
	.word 0x2e800001  ! 567: BVS	bvs,a	<label_0x1>
	.word 0x8790233d  ! 568: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	set 0xdcf00ea0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_257:
	.word 0x39400001  ! 569: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa4d44002  ! 570: UMULcc_R	umulcc 	%r17, %r2, %r18
	.word 0x93902002  ! 571: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d9032f4  ! 572: WRPR_PSTATE_I	wrpr	%r0, 0x12f4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 573: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9550c000  ! 574: RDPR_TT	rdpr	%tt, %r10
	ta	T_CHANGE_HPRIV	! macro
debug_0_258:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 576: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_259)) -> intp(0,1,3)
xir_0_259:
	.word 0xa9832001  ! 577: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0x8790236e  ! 578: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
intveclr_0_260:
	set 0xca3fb99e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 579: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0xfed144d4, %r28
	stxa %r28, [%g0] 0x73
intvec_0_261:
	.word 0x39400001  ! 580: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d908005  ! 581: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
debug_0_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 582: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8e6a8013  ! 583: UDIVX_R	udivx 	%r10, %r19, %r7
	.word 0x93902006  ! 584: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_264:
	setx 0xb377848d1105c3ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9029b9  ! 586: WRPR_PSTATE_I	wrpr	%r0, 0x09b9, %pstate
intveclr_0_265:
	set 0x988e93d3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 587: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xce8008a0  ! 588: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
splash_tba_0_266:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 589: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802016  ! 590: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902c23  ! 591: WRPR_PSTATE_I	wrpr	%r0, 0x0c23, %pstate
	.word 0xced7e000  ! 592: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
splash_cmpr_0_267:
	setx 0x827fc7fb0074a201, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 593: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcf37e001  ! 594: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x87802063  ! 595: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x91926001  ! 596: WRPR_PIL_I	wrpr	%r9, 0x0001, %pil
debug_0_268:
	nop
	setx debug_0_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 597: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 598: LDX_R	ldx	[%r31 + %r0], %r7
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 599: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x96480001  ! 600: MULX_R	mulx 	%r0, %r1, %r11
mondo_0_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d908014  ! 601: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0xd61fc000  ! 602: LDD_R	ldd	[%r31 + %r0], %r11
debug_0_270:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 603: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x8d903e1e  ! 604: WRPR_PSTATE_I	wrpr	%r0, 0x1e1e, %pstate
	.word 0x93902000  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd697e000  ! 606: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0xd68804a0  ! 607: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x83464000  ! 608: RD_STICK_CMPR_REG	rd	%-, %r1
	set 0x1c69c41f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_271:
	.word 0x39400001  ! 609: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 610: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc2800b40  ! 611: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 612: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x87802020  ! 613: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_0_272:
	setx 0x9b436b40be6f246e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 614: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc297e020  ! 615: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r1
debug_0_273:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 616: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_274)) -> intp(0,0,0)
intvec_0_274:
	.word 0x39400001  ! 617: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022b1  ! 618: WRPR_TT_I	wrpr	%r0, 0x02b1, %tt
	.word 0xc327c014  ! 619: STF_R	st	%f1, [%r20, %r31]
	.word 0x81460000  ! 620: RD_STICK_REG	stbar
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 621: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc31fe001  ! 622: LDDF_I	ldd	[%r31, 0x0001], %f1
	.word 0xa9840010  ! 623: WR_SET_SOFTINT_R	wr	%r16, %r16, %set_softint
	.word 0x99902002  ! 624: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	set 0xa692e5d9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_275:
	.word 0x39400001  ! 625: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5540000  ! 626: RDPR_GL	rdpr	%-, %r18
	.word 0xe447e001  ! 627: LDSW_I	ldsw	[%r31 + 0x0001], %r18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_276)) -> intp(0,0,25)
intvec_0_276:
	.word 0x39400001  ! 628: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 629: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_0_277:
	setx 0x8715a4a2177a4763, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 630: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 631: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe40fc000  ! 632: LDUB_R	ldub	[%r31 + %r0], %r18
splash_lsu_0_279:
	setx 0x971175691da3f279, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 633: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85540000  ! 634: RDPR_GL	rdpr	%-, %r2
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 635: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc45fe001  ! 636: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x8d90319c  ! 637: WRPR_PSTATE_I	wrpr	%r0, 0x119c, %pstate
intveclr_0_280:
	set 0x70480458, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 638: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc45fe001  ! 639: LDX_I	ldx	[%r31 + 0x0001], %r2
splash_lsu_0_281:
	setx 0xf9b0546bec517105, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_282:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 641: SAVE_R	save	%r31, %r0, %r31
	.word 0x81510000  ! 642: RDPR_TICK	rdpr	%tick, %r0
	set 0x2859e571, %r28
	stxa %r28, [%g0] 0x73
intvec_0_283:
	.word 0x39400001  ! 643: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_284)) -> intp(0,0,18)
intvec_0_284:
	.word 0x39400001  ! 644: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 645: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_285)) -> intp(0,1,3)
xir_0_285:
	.word 0xa982a001  ! 647: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xc597e001  ! 648: LDQFA_I	-	[%r31, 0x0001], %f2
intveclr_0_286:
	set 0xbb6e4eb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 649: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	set 0x4ae609b7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_287:
	.word 0x39400001  ! 650: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc457c000  ! 651: LDSH_R	ldsh	[%r31 + %r0], %r2
debug_0_288:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 652: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x93902007  ! 653: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 654: LDX_R	ldx	[%r31 + %r0], %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_289)) -> intp(0,1,3)
xir_0_289:
	.word 0xa9816001  ! 655: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
mondo_0_290:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d944005  ! 656: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
intveclr_0_291:
	set 0x9df727aa, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 657: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_292:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d93000c  ! 658: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
	.word 0xa2d4a001  ! 659: UMULcc_I	umulcc 	%r18, 0x0001, %r17
	set 0x13150c2b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_293:
	.word 0x39400001  ! 660: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_294:
	setx 0xd40e2278aa5a5793, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 661: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_295:
	setx 0x59e404dea7c04a83, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 662: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_296:
	setx 0x2ddb6d86c6d770e9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 663: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_297:
	setx 0xddd144d813ab5dda, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 664: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_298:
	nop
	setx debug_0_298 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_299:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 666: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_0_300:
	setx 0x0c38f4552020155e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 667: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_301:
	setx 0x2a3757660f35d607, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 668: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(0,0,12)
intvec_0_302:
	.word 0x39400001  ! 669: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2c7e010  ! 670: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r17
mondo_0_303:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d90000d  ! 671: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
mondo_0_304:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 672: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 673: LDX_R	ldx	[%r31 + %r0], %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_305)) -> intp(0,1,3)
xir_0_305:
	.word 0xa9812001  ! 674: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xe327c001  ! 675: STF_R	st	%f17, [%r1, %r31]
	.word 0x87802058  ! 676: WRASI_I	wr	%r0, 0x0058, %asi
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 677: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902009  ! 679: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 680: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 681: WRASI_I	wr	%r0, 0x0014, %asi
debug_0_306:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 682: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_htba_0_307:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 683: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1454000  ! 684: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 685: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0d804a0  ! 686: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x93902005  ! 687: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87450000  ! 688: RD_SET_SOFTINT	rd	%set_softint, %r3
	.word 0xa190200f  ! 689: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_0_308:
	setx 0x4892cf3fa21fd025, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 690: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_309:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d948008  ! 691: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_310)) -> intp(0,1,3)
xir_0_310:
	.word 0xa9846001  ! 692: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	set 0x4e68b743, %r28
	stxa %r28, [%g0] 0x73
intvec_0_311:
	.word 0x39400001  ! 693: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_312:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 694: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	set 0x6acfc77, %r28
	stxa %r28, [%g0] 0x73
intvec_0_313:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 696: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_314:
	set 0x79f19f72, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 697: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d918004  ! 698: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
splash_cmpr_0_316:
	setx 0xf12fa0a2e3bb142b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 699: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_317:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 700: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902006  ! 701: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d802000  ! 702: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99902001  ! 703: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_htba_0_318:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 704: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_0_319:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_319:
	.word 0x8f902004  ! 705: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x93902004  ! 706: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802004  ! 707: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 709: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc727c004  ! 710: STF_R	st	%f3, [%r4, %r31]
	.word 0x8d902b46  ! 711: WRPR_PSTATE_I	wrpr	%r0, 0x0b46, %pstate
splash_lsu_0_320:
	setx 0x271ca003797f594b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 712: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 713: FqTOd	dis not found

splash_cmpr_0_322:
	setx 0x5cdbc559ace95550, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 714: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa2fb4000  ! 715: SDIVcc_R	sdivcc 	%r13, %r0, %r17
	.word 0xe327e001  ! 716: STF_I	st	%f17, [0x0001, %r31]
	.word 0xe25fe001  ! 717: LDX_I	ldx	[%r31 + 0x0001], %r17
DS_0_323:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f4, %f26
	.word 0x95b00303  ! 718: ALIGNADDRESS	alignaddr	%r0, %r3, %r10
	.word 0x81510000  ! 719: RDPR_TICK	<illegal instruction>
	.word 0x87902064  ! 720: WRPR_TT_I	wrpr	%r0, 0x0064, %tt
splash_lsu_0_324:
	setx 0x6a081bee0e1c9213, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 721: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9035ea  ! 723: WRPR_PSTATE_I	wrpr	%r0, 0x15ea, %pstate
	.word 0xad81a001  ! 724: WR_SOFTINT_REG_I	wr	%r6, 0x0001, %softint
	.word 0x91d02035  ! 725: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd4c004a0  ! 726: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	set 0xbf2ee03c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_325:
	.word 0x39400001  ! 727: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790214e  ! 728: WRPR_TT_I	wrpr	%r0, 0x014e, %tt
mondo_0_326:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d95000a  ! 729: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0x93902005  ! 730: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790209e  ! 731: WRPR_TT_I	wrpr	%r0, 0x009e, %tt
mondo_0_327:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d93000b  ! 732: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0x93902001  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
intveclr_0_328:
	set 0xfbf03d38, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 734: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_329:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d910009  ! 735: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
	.word 0xd4dfe000  ! 736: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x38800001  ! 737: BGU	bgu,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 738: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0_330:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb340013  ! 1: STQF_R	-	%f13, [%r19, %r16]
	normalw
	.word 0x87458000  ! 739: RD_SOFTINT_REG	rd	%softint, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_331)) -> intp(0,1,3)
xir_0_331:
	.word 0xa9826001  ! 740: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xc6d804a0  ! 741: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 742: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_332)) -> intp(0,1,3)
xir_0_332:
	.word 0xa9832001  ! 743: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 744: LDX_R	ldx	[%r31 + %r0], %r3
mondo_0_333:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d928002  ! 745: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
	.word 0xa190200d  ! 746: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_334)) -> intp(0,0,28)
intvec_0_334:
	.word 0x39400001  ! 747: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 748: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc65fe001  ! 749: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0xc6c004a0  ! 750: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xa2832001  ! 751: ADDcc_I	addcc 	%r12, 0x0001, %r17
	set 0xf48e4052, %r28
	stxa %r28, [%g0] 0x73
intvec_0_335:
	.word 0x39400001  ! 752: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 753: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802010  ! 754: WRASI_I	wr	%r0, 0x0010, %asi
mondo_0_336:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 755: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
mondo_0_337:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d934000  ! 756: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x85450000  ! 757: RD_SET_SOFTINT	rd	%set_softint, %r2
	.word 0xa1902004  ! 758: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_0_338:
	setx 0x251feb2b89284d03, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 759: WR_STICK_REG_R	wr	%r0, %r1, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 760: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_339)) -> intp(0,1,3)
xir_0_339:
	.word 0xa9806001  ! 761: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x8d903778  ! 762: WRPR_PSTATE_I	wrpr	%r0, 0x1778, %pstate
	.word 0x91d020b5  ! 763: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x81510000  ! 764: RDPR_TICK	rdpr	%tick, %r0
	.word 0xc48008a0  ! 765: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x83d02035  ! 766: Tcc_I	te	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 767: LDX_R	ldx	[%r31 + %r0], %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 768: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x93902002  ! 769: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_340:
	nop
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 770: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_341:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f0, %f8
	.word 0x8db24303  ! 771: ALIGNADDRESS	alignaddr	%r9, %r3, %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_342)) -> intp(0,1,3)
xir_0_342:
	.word 0xa9802001  ! 772: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x8d802000  ! 773: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_343:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d900011  ! 774: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x93902007  ! 775: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_344)) -> intp(0,0,29)
intvec_0_344:
	.word 0x39400001  ! 776: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_345:
	taddcctv %r1, 0x1d66, %r16
	.word 0xcc07e001  ! 777: LDUW_I	lduw	[%r31 + 0x0001], %r6
debug_0_346:
	nop
	setx debug_0_346 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 778: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8145c000  ! 779: RD_TICK_CMPR_REG	stbar
	.word 0xc0c7e000  ! 780: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0xc09fc020  ! 781: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
splash_cmpr_0_347:
	setx 0x3db041741d1915d8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 782: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_348:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 783: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xc137e001  ! 784: STQF_I	-	%f0, [0x0001, %r31]
	.word 0x87802089  ! 785: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902006  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	set 0x480fd75c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_349:
	.word 0x39400001  ! 787: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_350:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 788: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xa945c000  ! 789: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe8800c00  ! 790: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
	.word 0xa7520000  ! 791: RDPR_PIL	rdpr	%pil, %r19
debug_0_351:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 792: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe657e001  ! 793: LDSH_I	ldsh	[%r31 + 0x0001], %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_352)) -> intp(0,1,3)
xir_0_352:
	.word 0xa9852001  ! 794: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xe6c80e40  ! 795: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
	.word 0x8d454000  ! 796: RD_CLEAR_SOFTINT	rd	%clear_softint, %r6
debug_0_353:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 797: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902007  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_354)) -> intp(0,0,11)
intvec_0_354:
	.word 0x39400001  ! 799: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 800: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 801: LDX_R	ldx	[%r31 + %r0], %r6
splash_lsu_0_355:
	setx 0x6dd7a35b89018fe5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 802: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc0fc000  ! 803: LDUB_R	ldub	[%r31 + %r0], %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 804: LDX_R	ldx	[%r31 + %r0], %r6
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_356)) -> intp(0,0,24)
intvec_0_356:
	.word 0x39400001  ! 805: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_357:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 806: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_0_358:
	setx 0x35871d612723ce8f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 807: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc1fe001  ! 808: LDD_I	ldd	[%r31 + 0x0001], %r6
	set 0xc36598b6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_359:
	.word 0x39400001  ! 809: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903621  ! 810: WRPR_PSTATE_I	wrpr	%r0, 0x1621, %pstate
	.word 0xcc9fc020  ! 811: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
intveclr_0_360:
	set 0x6c050798, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 812: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_361:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_361:
	.word 0x8f902003  ! 813: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
tagged_0_362:
	tsubcctv %r7, 0x1964, %r24
	.word 0xcc07e001  ! 814: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_cmpr_0_363:
	setx 0x7266a68c456a4e61, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 815: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xcd27c011  ! 816: STF_R	st	%f6, [%r17, %r31]
	.word 0xcc1fc000  ! 817: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x85a509c4  ! 818: FDIVd	fdivd	%f20, %f4, %f2
	.word 0x91d02034  ! 819: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902003  ! 820: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_0_364:
	setx 0x1525557949a1ec61, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 821: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_365:
	setx 0x2a90af93bc027b87, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 822: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 823: LDX_R	ldx	[%r31 + %r0], %r2
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 825: RDPR_TPC	<illegal instruction>
debug_0_366:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 826: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x87802016  ! 827: WRASI_I	wr	%r0, 0x0016, %asi
DS_0_367:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 828: RESTORE_R	restore	%r31, %r0, %r31
mondo_0_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90000a  ! 829: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
debug_0_369:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 830: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_0_370:
	setx 0x7fc059ef87f5247d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd40fc000  ! 832: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x2c800001  ! 833: BNEG	bneg,a	<label_0x1>
	.word 0xd53fe001  ! 834: STDF_I	std	%f10, [0x0001, %r31]
splash_lsu_0_371:
	setx 0x4c06fb8d90d4a65d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 835: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_372:
	set 0xf26c8f75, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 836: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd49004a0  ! 837: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	set 0x57cad640, %r28
	stxa %r28, [%g0] 0x73
intvec_0_373:
	.word 0x39400001  ! 838: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_374:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 839: RESTORE_R	restore	%r31, %r0, %r31
debug_0_375:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 840: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x879021bc  ! 841: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_376)) -> intp(0,0,0)
intvec_0_376:
	.word 0x39400001  ! 842: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd43fc00a  ! 843: STD_R	std	%r10, [%r31 + %r10]
	set 0xa434e627, %r28
	stxa %r28, [%g0] 0x73
intvec_0_377:
	.word 0x39400001  ! 844: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d91c00c  ! 845: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
	.word 0x2c700001  ! 846: BPNEG	<illegal instruction>
	.word 0xd51fc000  ! 847: LDDF_R	ldd	[%r31, %r0], %f10
	.word 0x91d02033  ! 848: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 849: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d020b3  ! 850: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_cmpr_0_379:
	setx 0x3a9734d0a88261a8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 851: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd40fe001  ! 852: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xab804011  ! 853: WR_CLEAR_SOFTINT_R	wr	%r1, %r17, %clear_softint
	.word 0xd49fe001  ! 854: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x8d9035a1  ! 855: WRPR_PSTATE_I	wrpr	%r0, 0x15a1, %pstate
	.word 0xd497e000  ! 856: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0x24800001  ! 857: BLE	ble,a	<label_0x1>
	.word 0x8d902e05  ! 858: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
debug_0_380:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 859: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92000a  ! 860: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
debug_0_382:
	nop
	setx debug_0_382 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 861: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	set 0x233f6205, %r28
	stxa %r28, [%g0] 0x73
intvec_0_383:
	.word 0x39400001  ! 862: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xad836001  ! 863: WR_SOFTINT_REG_I	wr	%r13, 0x0001, %softint
	.word 0xd48fe010  ! 864: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_384)) -> intp(0,0,2)
intvec_0_384:
	.word 0x39400001  ! 865: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x78427841, %r28
	stxa %r28, [%g0] 0x73
intvec_0_385:
	.word 0x39400001  ! 866: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd44fe001  ! 867: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 868: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_386:
	setx 0xd2ba50bd891197a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 869: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_387:
	setx 0xe76df0cbbb8cf3e1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 870: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_388:
	setx 0x5e3bd47b4ffd7b61, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 871: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02032  ! 872: Tcc_I	te	icc_or_xcc, %r0 + 50
change_to_randtl_0_389:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_389:
	.word 0x8f902004  ! 873: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xd48008a0  ! 874: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
tagged_0_390:
	tsubcctv %r24, 0x1ed8, %r11
	.word 0xd407e001  ! 875: LDUW_I	lduw	[%r31 + 0x0001], %r10
DS_0_391:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa1a08831  ! 876: FADDs	fadds	%f2, %f17, %f16
	.word 0x87902206  ! 877: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
mondo_0_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d918004  ! 878: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0xe08008a0  ! 879: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
debug_0_393:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 880: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x8790200b  ! 881: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
	.word 0x87802010  ! 882: WRASI_I	wr	%r0, 0x0010, %asi
debug_0_394:
	nop
	setx debug_0_394 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 883: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9b464000  ! 884: RD_STICK_CMPR_REG	rd	%-, %r13
DS_0_395:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f20, %f10
	.word 0xa5b08302  ! 885: ALIGNADDRESS	alignaddr	%r2, %r2, %r18
DS_0_396:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 886: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe4c7e010  ! 887: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
splash_cmpr_0_397:
	setx 0x817b36cf2bb06a49, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 888: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902003  ! 889: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
tagged_0_398:
	tsubcctv %r10, 0x1bc5, %r15
	.word 0xe407e001  ! 890: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 891: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_399:
	setx 0xb9deb9fc0dab36b5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 892: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8a6d000c  ! 894: UDIVX_R	udivx 	%r20, %r12, %r5
	.word 0x8780204f  ! 895: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_400:
	setx 0xba131a5572fa7a43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 896: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 897: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0xca8008a0  ! 899: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d903dd9  ! 900: WRPR_PSTATE_I	wrpr	%r0, 0x1dd9, %pstate
	set 0x8e08e03b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_401:
	.word 0x39400001  ! 901: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_402)) -> intp(0,0,31)
intvec_0_402:
	.word 0x39400001  ! 902: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 903: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x91d02034  ! 904: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 905: LDX_R	ldx	[%r31 + %r0], %r5
	set 0x587f17e0, %r28
	stxa %r28, [%g0] 0x73
intvec_0_403:
	.word 0x39400001  ! 906: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87a48d2a  ! 907: FsMULd	fsmuld	%f18, %f10, %f34
	.word 0xc6dfe010  ! 908: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x83540000  ! 910: RDPR_GL	rdpr	%-, %r1
	.word 0x91d020b3  ! 911: Tcc_I	ta	icc_or_xcc, %r0 + 179
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
splash_htba_0_404:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 914: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8780204f  ! 916: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_405:
	setx 0xc4105f22cd860347, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 917: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc2800bc0  ! 918: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r1
	.word 0xc297e030  ! 919: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	.word 0x9550c000  ! 920: RDPR_TT	rdpr	%tt, %r10
	.word 0xd40fc000  ! 921: LDUB_R	ldub	[%r31 + %r0], %r10
mondo_0_406:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d910006  ! 922: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
splash_tba_0_407:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 923: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_408:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 924: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xa1902008  ! 925: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	set 0xfa1839eb, %r28
	stxa %r28, [%g0] 0x73
intvec_0_409:
	.word 0x39400001  ! 926: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 927: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_410)) -> intp(0,1,3)
xir_0_410:
	.word 0xa9826001  ! 928: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
DS_0_411:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95a00551  ! 1: FSQRTd	fsqrt	
	.word 0x95a40833  ! 929: FADDs	fadds	%f16, %f19, %f10
	.word 0x879021f0  ! 930: WRPR_TT_I	wrpr	%r0, 0x01f0, %tt
	.word 0xa1902009  ! 931: WRPR_GL_I	wrpr	%r0, 0x0009, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_412)) -> intp(0,0,26)
intvec_0_412:
	.word 0x39400001  ! 932: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_413:
	setx 0xd83d2aa7e2c0a9d7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 933: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_414:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 934: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xd4c7e030  ! 935: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
debug_0_415:
	nop
	setx debug_0_415 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 936: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd4d7e010  ! 937: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd48804a0  ! 938: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
debug_0_416:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 939: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_417:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 940: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 941: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93702001  ! 942: POPC_I	popc	0x0001, %r9
tagged_0_418:
	tsubcctv %r15, 0x1f93, %r18
	.word 0xd207e001  ! 943: LDUW_I	lduw	[%r31 + 0x0001], %r9
	set 0xdc436b5e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_419:
	.word 0x39400001  ! 944: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_420:
	tsubcctv %r3, 0x177e, %r5
	.word 0xd207e001  ! 945: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd327e001  ! 946: STF_I	st	%f9, [0x0001, %r31]
debug_0_421:
	nop
	setx debug_0_421 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 947: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd257c000  ! 948: LDSH_R	ldsh	[%r31 + %r0], %r9
debug_0_422:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 949: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_423:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa9b18306  ! 950: ALIGNADDRESS	alignaddr	%r6, %r6, %r20
	.word 0x81510000  ! 951: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93902002  ! 952: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe927c006  ! 953: STF_R	st	%f20, [%r6, %r31]
	.word 0xe857c000  ! 954: LDSH_R	ldsh	[%r31 + %r0], %r20
splash_cmpr_0_424:
	setx 0x9c4fe032a18de9e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 955: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01964  ! 956: FqTOd	dis not found

	.word 0x91d02033  ! 957: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_426)) -> intp(0,0,22)
intvec_0_426:
	.word 0x39400001  ! 958: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe71fe001  ! 959: LDDF_I	ldd	[%r31, 0x0001], %f19
	.word 0x87802080  ! 960: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa985000b  ! 961: WR_SET_SOFTINT_R	wr	%r20, %r11, %set_softint
	.word 0xe647e001  ! 962: LDSW_I	ldsw	[%r31 + 0x0001], %r19
DS_0_427:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f2, %f20
	.word 0x8bb34306  ! 963: ALIGNADDRESS	alignaddr	%r13, %r6, %r5
	.word 0xcac7e010  ! 964: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0xca1fe001  ! 965: LDD_I	ldd	[%r31 + 0x0001], %r5
debug_0_428:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 966: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xab800007  ! 967: WR_CLEAR_SOFTINT_R	wr	%r0, %r7, %clear_softint
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 968: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_429:
	setx 0x732e5efc61298f01, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 969: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 970: LDX_R	ldx	[%r31 + %r0], %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xca5fc000  ! 971: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x8d903451  ! 972: WRPR_PSTATE_I	wrpr	%r0, 0x1451, %pstate
	.word 0xca77c007  ! 973: STX_R	stx	%r5, [%r31 + %r7]
	.word 0x8b520000  ! 974: RDPR_PIL	rdpr	%pil, %r5
debug_0_430:
	nop
	setx debug_0_430 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 975: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_431:
	setx 0x0d9270c75b8c9b54, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 976: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x81982edd  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_432)) -> intp(0,1,3)
xir_0_432:
	.word 0xa984a001  ! 978: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
splash_tba_0_433:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_434)) -> intp(0,1,3)
xir_0_434:
	.word 0xa9816001  ! 980: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xca97e020  ! 981: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
splash_cmpr_0_435:
	setx 0xbf6c23fee18a693c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 982: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xca1fc000  ! 983: LDD_R	ldd	[%r31 + %r0], %r5
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 984: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_436:
	setx 0xa984826d78676a50, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 985: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xa7a28a0a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_437:
	.word 0x39400001  ! 986: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 987: BLEU	bleu,a	<label_0x1>
	.word 0xcac004a0  ! 988: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
debug_0_438:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 989: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xca9004a0  ! 990: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xca27e001  ! 991: STW_I	stw	%r5, [%r31 + 0x0001]
	.word 0x81982147  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
DS_0_439:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 993: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 994: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcb37c007  ! 995: STQF_R	-	%f5, [%r7, %r31]
	.word 0xcac7e030  ! 996: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
	.word 0x89500000  ! 997: RDPR_TPC	rdpr	%tpc, %r4
mondo_0_440:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d91c012  ! 998: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
splash_cmpr_0_441:
	setx 0x66580360cb38af01, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 999: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 1000: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_0_442:
	setx 0x117c128bd40472e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1001: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802058  ! 1002: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc857e001  ! 1003: LDSH_I	ldsh	[%r31 + 0x0001], %r4
tagged_0_443:
	taddcctv %r16, 0x156d, %r9
	.word 0xc807e001  ! 1004: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x91d02032  ! 1005: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa2fb0003  ! 1006: SDIVcc_R	sdivcc 	%r12, %r3, %r17
mondo_0_444:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d940005  ! 1007: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x879022d2  ! 1008: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0xe337e001  ! 1009: STQF_I	-	%f17, [0x0001, %r31]
intveclr_0_445:
	set 0xff18bafb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1010: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe257e001  ! 1011: LDSH_I	ldsh	[%r31 + 0x0001], %r17
mondo_0_446:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d900012  ! 1012: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x8b454000  ! 1013: RD_CLEAR_SOFTINT	rd	%clear_softint, %r5
	set 0x1a0e0723, %r28
	stxa %r28, [%g0] 0x73
intvec_0_447:
	.word 0x39400001  ! 1014: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1015: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
mondo_0_448:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d91800c  ! 1016: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
mondo_0_449:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d904002  ! 1017: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
intveclr_0_450:
	set 0xe8684aaf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1018: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_451:
	setx 0x9ddf78766682fefc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1019: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_452)) -> intp(0,0,2)
intvec_0_452:
	.word 0x39400001  ! 1021: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 1022: BLEU	bleu,a	<label_0x1>
mondo_0_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d918009  ! 1023: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_454)) -> intp(0,1,3)
xir_0_454:
	.word 0xa981a001  ! 1024: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0x85702001  ! 1025: POPC_I	popc	0x0001, %r2
change_to_randtl_0_455:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_455:
	.word 0x8f902004  ! 1026: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87802080  ! 1027: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc457c000  ! 1028: LDSH_R	ldsh	[%r31 + %r0], %r2
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 1029: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1030: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 1031: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc497e000  ! 1032: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0xc44fc000  ! 1033: LDSB_R	ldsb	[%r31 + %r0], %r2
mondo_0_456:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d920001  ! 1034: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
	.word 0xc4dfe000  ! 1035: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1036: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc48008a0  ! 1037: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 1038: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4cfe020  ! 1039: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 1040: LDX_R	ldx	[%r31 + %r0], %r2
debug_0_457:
	nop
	setx debug_0_457 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1041: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_458:
	setx 0x8eac3a885ac833bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1042: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_459:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa1a00542  ! 1: FSQRTd	fsqrt	
	.word 0x95a00831  ! 1043: FADDs	fadds	%f0, %f17, %f10
	.word 0xd537c011  ! 1044: STQF_R	-	%f10, [%r17, %r31]
splash_cmpr_0_460:
	setx 0xcb5e47235503f8c1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1045: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xb0c0f049, %r28
	stxa %r28, [%g0] 0x73
intvec_0_461:
	.word 0x39400001  ! 1046: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48fe030  ! 1047: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0xa345c000  ! 1048: RD_TICK_CMPR_REG	rd	%-, %r17
change_to_randtl_0_462:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_462:
	.word 0x8f902001  ! 1049: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	set 0x1a732a0a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_463:
	.word 0x39400001  ! 1050: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_464:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb34c005  ! 1: STQF_R	-	%f13, [%r5, %r19]
	normalw
	.word 0x97458000  ! 1051: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x93902003  ! 1052: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902007  ! 1053: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_465:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 1054: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
intveclr_0_466:
	set 0xf8ece6a8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1055: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 1056: WRPR_GL_I	wrpr	%r0, 0x0004, %-
intveclr_0_467:
	set 0xf147051d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1057: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 1058: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x83d02032  ! 1059: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 1060: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 1061: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_0_468:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d91c004  ! 1062: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
mondo_0_469:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d928010  ! 1063: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0xd6c7e030  ! 1064: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6c004a0  ! 1065: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
debug_0_470:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1066: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_471:
	taddcctv %r14, 0x1b2a, %r9
	.word 0xd607e001  ! 1067: LDUW_I	lduw	[%r31 + 0x0001], %r11
splash_cmpr_0_472:
	setx 0x1094ba3d6739fbb3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1068: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90288c  ! 1069: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0x81510000  ! 1070: RDPR_TICK	rdpr	%tick, %r0
	set 0xd905f58e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_473:
	.word 0x39400001  ! 1071: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_474:
	setx 0x10c2a1a0d869a9da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1072: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd68008a0  ! 1073: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_0_475:
	setx 0x34adad30efe81d60, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1074: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd69fe001  ! 1075: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1076: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790233b  ! 1077: WRPR_TT_I	wrpr	%r0, 0x033b, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_476)) -> intp(0,1,3)
xir_0_476:
	.word 0xa9802001  ! 1078: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
splash_lsu_0_477:
	setx 0x0db0c49bf888e3f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1079: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 1080: WRPR_GL_I	wrpr	%r0, 0x000c, %-
mondo_0_478:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d94400b  ! 1081: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0xa9464000  ! 1082: RD_STICK_CMPR_REG	rd	%-, %r20
	set 0x6828073a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_479:
	.word 0x39400001  ! 1083: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8750c000  ! 1084: RDPR_TT	rdpr	%tt, %r3
	.word 0xab85000d  ! 1085: WR_CLEAR_SOFTINT_R	wr	%r20, %r13, %clear_softint
intveclr_0_480:
	set 0x91304289, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1086: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_481:
	nop
	setx debug_0_481 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1087: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9034e1  ! 1088: WRPR_PSTATE_I	wrpr	%r0, 0x14e1, %pstate
DS_0_482:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1089: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xc68008a0  ! 1090: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
DS_0_483:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8fb50305  ! 1091: ALIGNADDRESS	alignaddr	%r20, %r5, %r7
tagged_0_484:
	tsubcctv %r2, 0x1882, %r6
	.word 0xce07e001  ! 1092: LDUW_I	lduw	[%r31 + 0x0001], %r7
debug_0_485:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1093: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1094: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_0_486:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 1095: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 1096: LDX_R	ldx	[%r31 + %r0], %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 1097: LDX_R	ldx	[%r31 + %r0], %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_487)) -> intp(0,1,3)
xir_0_487:
	.word 0xa980a001  ! 1098: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xced004a0  ! 1099: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x81982ed5  ! 1100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed5, %hpstate
	.word 0x93902002  ! 1101: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902007  ! 1103: WRPR_GL_I	wrpr	%r0, 0x0007, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_488)) -> intp(0,1,3)
xir_0_488:
	.word 0xa9846001  ! 1104: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
intveclr_0_489:
	set 0x5b6a462e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_490:
	tsubcctv %r3, 0x1b2b, %r24
	.word 0xce07e001  ! 1106: LDUW_I	lduw	[%r31 + 0x0001], %r7
	ta	T_CHANGE_HPRIV	! macro
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xce5fc000  ! 1108: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x97a00561  ! 1109: FSQRTq	fsqrt	
	.word 0xab830003  ! 1110: WR_CLEAR_SOFTINT_R	wr	%r12, %r3, %clear_softint
	.word 0x93d02035  ! 1111: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8790212f  ! 1112: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0xa1902006  ! 1113: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902002  ! 1114: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902134  ! 1115: WRPR_PSTATE_I	wrpr	%r0, 0x0134, %pstate
splash_lsu_0_491:
	setx 0xbc127cedc2559b39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 1117: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_492:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 1118: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
DS_0_493:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5310002  ! 1: STQF_R	-	%f18, [%r2, %r4]
	normalw
	.word 0xa1458000  ! 1119: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x93902004  ! 1120: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x95b2cfea  ! 1121: FONES	e	%f10
DS_0_494:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xed6340fc	! Random illegal ?
	.word 0x8da00552  ! 1: FSQRTd	fsqrt	
	.word 0x93a1c821  ! 1122: FADDs	fadds	%f7, %f1, %f9
	.word 0xd23fc001  ! 1123: STD_R	std	%r9, [%r31 + %r1]
debug_0_495:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 1124: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
debug_0_496:
	nop
	setx debug_0_496 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1125: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_497:
	setx 0x8db9e8b3671ffb45, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1126: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_0_498:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1127: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902004  ! 1128: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9b45c000  ! 1129: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x9ba289a9  ! 1130: FDIVs	fdivs	%f10, %f9, %f13
	set 0x4b45f46b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_499:
	.word 0x39400001  ! 1131: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_500:
	tsubcctv %r23, 0x1fdb, %r24
	.word 0xda07e001  ! 1132: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x81460000  ! 1133: RD_STICK_REG	stbar
	.word 0xda8804a0  ! 1134: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_501)) -> intp(0,1,3)
xir_0_501:
	.word 0xa984a001  ! 1135: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x8d9035cc  ! 1136: WRPR_PSTATE_I	wrpr	%r0, 0x15cc, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1138: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_502)) -> intp(0,0,21)
intvec_0_502:
	.word 0x39400001  ! 1139: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda800b20  ! 1140: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r13
splash_lsu_0_503:
	setx 0x8641b21e76477bfb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 1142: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902007  ! 1143: WRPR_GL_I	wrpr	%r0, 0x0007, %-
intveclr_0_504:
	set 0xade031d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1144: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 1145: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_0_505:
	setx 0x7566191051b27451, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1146: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_506:
	setx 0xb76f26a20a7ee2f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xdb27e001  ! 1148: STF_I	st	%f13, [0x0001, %r31]
	.word 0x99500000  ! 1149: RDPR_TPC	rdpr	%tpc, %r12
intveclr_0_507:
	set 0x7433564, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5450000  ! 1151: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0x83500000  ! 1152: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x93902003  ! 1153: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc2c004a0  ! 1154: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
splash_cmpr_0_508:
	setx 0x3fb30071767b0ad0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1155: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_509:
	setx 0x696c47667843801e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1156: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc28008a0  ! 1157: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc337e001  ! 1158: STQF_I	-	%f1, [0x0001, %r31]
mondo_0_510:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d928000  ! 1159: WRPR_WSTATE_R	wrpr	%r10, %r0, %wstate
	.word 0xa1a000d4  ! 1160: FNEGd	fnegd	%f20, %f16
splash_cmpr_0_511:
	setx 0x83e1cd8d79952f38, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1161: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d903b7e  ! 1162: WRPR_PSTATE_I	wrpr	%r0, 0x1b7e, %pstate
mondo_0_512:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 1163: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
intveclr_0_513:
	set 0xe4f6cb15, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1164: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 1165: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_514:
	nop
	setx debug_0_514 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1166: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_515:
	setx 0x3d83764e4173f6fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1168: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0d80e80  ! 1169: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
	.word 0x2a800001  ! 1170: BCS	bcs,a	<label_0x1>
	.word 0x87802014  ! 1171: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802089  ! 1172: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_0_516:
	setx 0x2c0ac3a23b537937, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1173: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe057c000  ! 1174: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x81510000  ! 1175: RDPR_TICK	<illegal instruction>
	.word 0xe127c011  ! 1176: STF_R	st	%f16, [%r17, %r31]
	.word 0x87802055  ! 1177: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_517:
	setx 0xf5b98531844c6643, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1178: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_518:
	setx 0xe464e6aaf6281396, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1179: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x6160e8e9, %r28
	stxa %r28, [%g0] 0x73
intvec_0_519:
	.word 0x39400001  ! 1180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe077c011  ! 1181: STX_R	stx	%r16, [%r31 + %r17]
mondo_0_520:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d900004  ! 1182: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
	.word 0xa1902002  ! 1183: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa9454000  ! 1184: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe997e001  ! 1185: LDQFA_I	-	[%r31, 0x0001], %f20
splash_cmpr_0_521:
	setx 0x30584cb8547fb9aa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1186: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_522:
	setx 0xa644be24ded7e96d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1187: WR_STICK_REG_R	wr	%r0, %r1, %-
change_to_randtl_0_523:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_523:
	.word 0x8f902004  ! 1188: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87802080  ! 1189: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902c61  ! 1190: WRPR_PSTATE_I	wrpr	%r0, 0x0c61, %pstate
	.word 0xe937e001  ! 1191: STQF_I	-	%f20, [0x0001, %r31]
DS_0_524:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x9375d318	! Random illegal ?
	.word 0xe5118005  ! 1: LDQF_R	-	[%r6, %r5], %f18
	.word 0x95a44821  ! 1192: FADDs	fadds	%f17, %f1, %f10
	.word 0xd597e001  ! 1193: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d020b4  ! 1194: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd41fc000  ! 1195: LDD_R	ldd	[%r31 + %r0], %r10
	set 0x6a628492, %r28
	stxa %r28, [%g0] 0x73
intvec_0_525:
	.word 0x39400001  ! 1196: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9810008  ! 1197: WR_SET_SOFTINT_R	wr	%r4, %r8, %set_softint
tagged_0_526:
	tsubcctv %r21, 0x1bcb, %r2
	.word 0xd407e001  ! 1198: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xa9824004  ! 1199: WR_SET_SOFTINT_R	wr	%r9, %r4, %set_softint
	set 0xdf8ef308, %r28
	stxa %r28, [%g0] 0x73
intvec_0_527:
	.word 0x39400001  ! 1200: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9350c000  ! 1201: RDPR_TT	rdpr	%tt, %r9
	.word 0x9950c000  ! 1202: RDPR_TT	rdpr	%tt, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_528)) -> intp(0,0,26)
intvec_0_528:
	.word 0x39400001  ! 1203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_529:
	setx 0xcf28bd795d87309b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab83400c  ! 1205: WR_CLEAR_SOFTINT_R	wr	%r13, %r12, %clear_softint
	.word 0xd8bfc02c  ! 1206: STDA_R	stda	%r12, [%r31 + %r12] 0x01
debug_0_530:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1207: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x89a089f3  ! 1208: FDIVq	dis not found

mondo_0_531:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d928001  ! 1209: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	.word 0x9191e001  ! 1210: WRPR_PIL_I	wrpr	%r7, 0x0001, %pil
	.word 0x93540000  ! 1211: RDPR_GL	rdpr	%-, %r9
debug_0_532:
	nop
	setx debug_0_532 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1212: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_533:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1213: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_0_534:
	setx 0xa3b6fa578bac29fb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1214: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0xa2003abd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_535:
	.word 0x39400001  ! 1215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_536:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1216: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81460000  ! 1217: RD_STICK_REG	stbar
mondo_0_537:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d930001  ! 1218: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
splash_cmpr_0_538:
	setx 0x2c09cb2c2ea47d6d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1219: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_539:
	setx 0x130c60328ad57e6b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1220: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_540:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1221: RESTORE_R	restore	%r31, %r0, %r31
	set 0x5bf5198c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_541:
	.word 0x39400001  ! 1222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 1223: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802088  ! 1224: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd20fe001  ! 1225: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x24800001  ! 1226: BLE	ble,a	<label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_542:
	setx 0x00b759d690c8cf10, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1228: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_543:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d93400b  ! 1229: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 1230: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c80e40  ! 1231: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_544)) -> intp(0,1,3)
xir_0_544:
	.word 0xa9852001  ! 1232: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
debug_0_545:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1233: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_546:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 1234: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
DS_0_547:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1235: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd297e030  ! 1236: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
splash_htba_0_548:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1237: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
intveclr_0_549:
	set 0xda59600d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1238: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 1239: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_550)) -> intp(0,0,17)
intvec_0_550:
	.word 0x39400001  ! 1240: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9190a001  ! 1241: WRPR_PIL_I	wrpr	%r2, 0x0001, %pil
	.word 0xd28008a0  ! 1242: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x97a000c1  ! 1243: FNEGd	fnegd	%f32, %f42
	.word 0xd797e001  ! 1244: LDQFA_I	-	[%r31, 0x0001], %f11
splash_lsu_0_551:
	setx 0xda9d77113d3e6e0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1245: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6c80e40  ! 1246: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
	.word 0x81540000  ! 1247: RDPR_GL	rdpr	%-, %r0
	.word 0x93902006  ! 1248: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc00fe001  ! 1249: LDUB_I	ldub	[%r31 + 0x0001], %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc05fc000  ! 1250: LDX_R	ldx	[%r31 + %r0], %r0
mondo_0_552:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d90400a  ! 1251: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
intveclr_0_553:
	set 0xa69d3065, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1252: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc0c004a0  ! 1253: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x879020bb  ! 1254: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0x91d020b3  ! 1255: Tcc_I	ta	icc_or_xcc, %r0 + 179
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1256: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1257: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d9028cf  ! 1258: WRPR_PSTATE_I	wrpr	%r0, 0x08cf, %pstate
	.word 0xc0c804a0  ! 1259: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xa190200c  ! 1260: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_htba_0_554:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1261: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_0_555:
	setx 0x6415978473418209, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1262: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_556:
	set 0xf5647a75, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1263: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc0cfe010  ! 1264: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0x84822001  ! 1265: ADDcc_I	addcc 	%r8, 0x0001, %r2
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1266: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7480000  ! 1267: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xe797e001  ! 1268: LDQFA_I	-	[%r31, 0x0001], %f19
	.word 0xe6c00e60  ! 1269: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r19
	.word 0xe6900e60  ! 1270: LDUHA_R	lduha	[%r0, %r0] 0x73, %r19
	.word 0xe6d804a0  ! 1271: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xab848001  ! 1272: WR_CLEAR_SOFTINT_R	wr	%r18, %r1, %clear_softint
	.word 0x8f520000  ! 1273: RDPR_PIL	<illegal instruction>
	.word 0x93902004  ! 1274: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_0_557:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 1275: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
splash_lsu_0_558:
	setx 0x122467197d477fe3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 1277: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9282c002  ! 1278: ADDcc_R	addcc 	%r11, %r2, %r9
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_559)) -> intp(0,1,3)
xir_0_559:
	.word 0xa981e001  ! 1279: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
DS_0_560:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f24, %f26
	.word 0xa3b10312  ! 1280: ALIGNADDRESS	alignaddr	%r4, %r18, %r17
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1281: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_561)) -> intp(0,1,3)
xir_0_561:
	.word 0xa981e001  ! 1282: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_562)) -> intp(0,0,28)
intvec_0_562:
	.word 0x39400001  ! 1283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_563:
	setx 0xf87275342be44065, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1284: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe20fe001  ! 1285: LDUB_I	ldub	[%r31 + 0x0001], %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_564)) -> intp(0,1,3)
xir_0_564:
	.word 0xa9816001  ! 1286: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xe21fc000  ! 1287: LDD_R	ldd	[%r31 + %r0], %r17
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1288: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa8812001  ! 1289: ADDcc_I	addcc 	%r4, 0x0001, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 1290: LDX_R	ldx	[%r31 + %r0], %r20
splash_cmpr_0_565:
	setx 0xd7859817048d4d2c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1291: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_566:
	setx 0xf4eb5a207fbc82d2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1292: WR_STICK_REG_R	wr	%r0, %r1, %-
	set 0x9dbc97ca, %r28
	stxa %r28, [%g0] 0x73
intvec_0_567:
	.word 0x39400001  ! 1293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 1294: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982557  ! 1295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0557, %hpstate
DS_0_568:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f16, %f30, %f28
	.word 0x93b44304  ! 1296: ALIGNADDRESS	alignaddr	%r17, %r4, %r9
	.word 0xd31fc000  ! 1297: LDDF_R	ldd	[%r31, %r0], %f9
	.word 0xa7464000  ! 1298: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x8150c000  ! 1299: RDPR_TT	rdpr	%tt, %r0
debug_0_569:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1300: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_570:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 1301: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x93d02032  ! 1302: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x99902005  ! 1303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
tagged_0_571:
	taddcctv %r3, 0x1721, %r5
	.word 0xc007e001  ! 1304: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xa1902001  ! 1305: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc13fc014  ! 1306: STDF_R	std	%f0, [%r20, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_572)) -> intp(0,0,1)
intvec_0_572:
	.word 0x39400001  ! 1307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_573:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 1308: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0xc077c012  ! 1309: STX_R	stx	%r0, [%r31 + %r18]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_574)) -> intp(0,0,17)
intvec_0_574:
	.word 0x39400001  ! 1310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc05fc000  ! 1311: LDX_R	ldx	[%r31 + %r0], %r0
mondo_0_575:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d904014  ! 1312: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xc08fe000  ! 1313: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
splash_lsu_0_576:
	setx 0x067236ac412119c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0xe6f0640f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_577:
	.word 0x39400001  ! 1315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_578:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1316: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc08008a0  ! 1317: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1318: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790217b  ! 1319: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
	.word 0x9f802001  ! 1320: SIR	sir	0x0001
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc05fc000  ! 1321: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc09fc020  ! 1322: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0xc04fc000  ! 1323: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0xc00fe001  ! 1324: LDUB_I	ldub	[%r31 + 0x0001], %r0
mondo_0_579:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d904007  ! 1325: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
	.word 0x8caac012  ! 1326: ANDNcc_R	andncc 	%r11, %r18, %r6
	.word 0xcc1fe001  ! 1327: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcd3fe001  ! 1328: STDF_I	std	%f6, [0x0001, %r31]
	.word 0xccc004a0  ! 1329: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xad84a001  ! 1330: WR_SOFTINT_REG_I	wr	%r18, 0x0001, %softint
	.word 0x8d802000  ! 1331: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_0_580:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 1332: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xa1902007  ! 1333: WRPR_GL_I	wrpr	%r0, 0x0007, %-
debug_0_581:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1334: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902001  ! 1335: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xcc0fe001  ! 1336: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0x87802055  ! 1337: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_582:
	setx 0xf0498bef9dbe2a11, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1338: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_583:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1339: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 1340: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xccc7e010  ! 1341: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x81510000  ! 1342: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa769a001  ! 1343: SDIVX_I	sdivx	%r6, 0x0001, %r19
	.word 0x8d90340c  ! 1344: WRPR_PSTATE_I	wrpr	%r0, 0x140c, %pstate
splash_lsu_0_585:
	setx 0xe78d11c1e5dfc46b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1345: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe60fc000  ! 1346: LDUB_R	ldub	[%r31 + %r0], %r19
	.word 0x8b702001  ! 1347: POPC_I	popc	0x0001, %r5
	.word 0x9f802001  ! 1348: SIR	sir	0x0001
	.word 0x93902004  ! 1349: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_0_586:
	setx 0x40f6ac2b0504ab44, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1350: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83500000  ! 1351: RDPR_TPC	<illegal instruction>
	.word 0xc29004a0  ! 1352: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	set 0xc0f14539, %r28
	stxa %r28, [%g0] 0x73
intvec_0_587:
	.word 0x39400001  ! 1353: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_588:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950002  ! 1354: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x93902005  ! 1355: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc327c002  ! 1356: STF_R	st	%f1, [%r2, %r31]
	.word 0xa3500000  ! 1357: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa1902003  ! 1358: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 1359: LDX_R	ldx	[%r31 + %r0], %r17
	set 0xd508ab60, %r28
	stxa %r28, [%g0] 0x73
intvec_0_589:
	.word 0x39400001  ! 1360: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe33fe001  ! 1361: STDF_I	std	%f17, [0x0001, %r31]
	.word 0xe337e001  ! 1362: STQF_I	-	%f17, [0x0001, %r31]
splash_htba_0_590:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1363: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
debug_0_591:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 1364: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x83d02034  ! 1365: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe31fe001  ! 1366: LDDF_I	ldd	[%r31, 0x0001], %f17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36d2001  ! 1367: SDIVX_I	sdivx	%r20, 0x0001, %r17
	set 0x616417e1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_593:
	.word 0x39400001  ! 1368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa545c000  ! 1369: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x91d020b5  ! 1370: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_0_594:
	setx 0xac5392aeed37bbb5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 1373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_lsu_0_595:
	setx 0xb3c05da497de4fed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902050  ! 1375: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0x87902248  ! 1376: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
	.word 0x87480000  ! 1377: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_596)) -> intp(0,1,3)
xir_0_596:
	.word 0xa980e001  ! 1378: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
tagged_0_597:
	taddcctv %r3, 0x1032, %r26
	.word 0xc607e001  ! 1379: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_lsu_0_598:
	setx 0xd265c61288b7db6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1380: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc64fe001  ! 1381: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0x86c0a001  ! 1382: ADDCcc_I	addccc 	%r2, 0x0001, %r3
	.word 0xc68804a0  ! 1383: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	set 0xe0baa27f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_599:
	.word 0x39400001  ! 1384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1385: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_600:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xab6149a3	! Random illegal ?
	.word 0xa5a00554  ! 1: FSQRTd	fsqrt	
	.word 0x85a08825  ! 1386: FADDs	fadds	%f2, %f5, %f2
	.word 0xc40fc000  ! 1387: LDUB_R	ldub	[%r31 + %r0], %r2
	set 0x41b4f88b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_601:
	.word 0x39400001  ! 1388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_602)) -> intp(0,0,16)
intvec_0_602:
	.word 0x39400001  ! 1389: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_603:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d910002  ! 1390: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
tagged_0_604:
	tsubcctv %r1, 0x1532, %r18
	.word 0xc407e001  ! 1391: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xa190200c  ! 1392: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	set 0xc3885d8e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_605:
	.word 0x39400001  ! 1393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc44fc000  ! 1394: LDSB_R	ldsb	[%r31 + %r0], %r2
	.word 0x3c800001  ! 1395: BPOS	bpos,a	<label_0x1>
splash_cmpr_0_606:
	setx 0xb32960bd84f5b87f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1396: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_607:
	nop
	setx debug_0_607 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1397: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_608)) -> intp(0,0,18)
intvec_0_608:
	.word 0x39400001  ! 1398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_609)) -> intp(0,1,3)
xir_0_609:
	.word 0xa9852001  ! 1399: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
splash_cmpr_0_610:
	setx 0xbd79fcf571a68d12, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1400: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc457c000  ! 1401: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0xc4d7e000  ! 1402: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
debug_0_611:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02035  ! 1404: Tcc_I	te	icc_or_xcc, %r0 + 53
mondo_0_612:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d928013  ! 1405: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
tagged_0_613:
	taddcctv %r23, 0x189c, %r23
	.word 0xc407e001  ! 1406: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x91d02032  ! 1407: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_614:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1408: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_615:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 1409: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x87802063  ! 1410: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc49fc020  ! 1411: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93902004  ! 1412: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
intveclr_0_616:
	set 0x9f2ff33c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1413: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1414: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_0_617:
	setx 0x0c8c5578ee65d939, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1415: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_618:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 1416: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x91d02032  ! 1417: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_0_619:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1418: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc49004a0  ! 1419: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0xc427e001  ! 1420: STW_I	stw	%r2, [%r31 + 0x0001]
mondo_0_620:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 1421: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1422: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5450000  ! 1423: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xe49004a0  ! 1424: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0xe49fc020  ! 1425: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0xe4c7e000  ! 1426: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_621)) -> intp(0,1,3)
xir_0_621:
	.word 0xa9832001  ! 1427: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
debug_0_622:
	nop
	setx debug_0_622 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1428: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802089  ! 1429: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81460000  ! 1430: RD_STICK_REG	stbar
	.word 0x86d1a001  ! 1431: UMULcc_I	umulcc 	%r6, 0x0001, %r3
mondo_0_623:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 1432: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
mondo_0_624:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d918012  ! 1433: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1434: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6c7e010  ! 1435: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0xa9820004  ! 1436: WR_SET_SOFTINT_R	wr	%r8, %r4, %set_softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01962  ! 1437: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_626)) -> intp(0,0,6)
intvec_0_626:
	.word 0x39400001  ! 1438: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe25fe001  ! 1439: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0xe28008a0  ! 1440: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
mondo_0_627:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d948006  ! 1441: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0x83a4c9b3  ! 1442: FDIVs	fdivs	%f19, %f19, %f1
mondo_0_628:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d918011  ! 1443: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
splash_cmpr_0_629:
	setx 0x490ac90818246256, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1444: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_630:
	setx 0x29160a844e043a5c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1445: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_631)) -> intp(0,1,3)
xir_0_631:
	.word 0xa9832001  ! 1446: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_632)) -> intp(0,0,0)
intvec_0_632:
	.word 0x39400001  ! 1447: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 1448: LDX_R	ldx	[%r31 + %r0], %r1
debug_0_633:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 1449: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_634)) -> intp(0,0,16)
intvec_0_634:
	.word 0x39400001  ! 1450: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc2dfe030  ! 1451: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0xa1464000  ! 1452: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0xe137c011  ! 1453: STQF_R	-	%f16, [%r17, %r31]
splash_cmpr_0_635:
	setx 0x4493ce397d4dffb6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1454: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe0800a60  ! 1455: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
	.word 0x91d02034  ! 1456: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 1457: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x24800001  ! 1458: BLE	ble,a	<label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1459: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_636:
	tsubcctv %r7, 0x12f8, %r4
	.word 0xe007e001  ! 1460: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d802000  ! 1461: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_637)) -> intp(0,1,3)
xir_0_637:
	.word 0xa9832001  ! 1462: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
change_to_randtl_0_638:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_638:
	.word 0x8f902001  ! 1463: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38800001  ! 1464: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022b5  ! 1466: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
	.word 0x8145c000  ! 1467: RD_TICK_CMPR_REG	stbar
splash_cmpr_0_639:
	setx 0xa58eaccf38b78c33, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1468: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc08008a0  ! 1469: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
splash_lsu_0_640:
	setx 0x54427283c6c93037, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1470: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83480000  ! 1471: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x87902036  ! 1472: WRPR_TT_I	wrpr	%r0, 0x0036, %tt
tagged_0_641:
	taddcctv %r7, 0x1ee0, %r13
	.word 0xc207e001  ! 1473: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x8d903f10  ! 1474: WRPR_PSTATE_I	wrpr	%r0, 0x1f10, %pstate
debug_0_642:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 1475: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xad80e001  ! 1476: WR_SOFTINT_REG_I	wr	%r3, 0x0001, %softint
	.word 0xc337c011  ! 1477: STQF_R	-	%f1, [%r17, %r31]
splash_cmpr_0_643:
	setx 0xc517e9d7a34aa370, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1478: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc28008a0  ! 1479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_644)) -> intp(0,0,15)
intvec_0_644:
	.word 0x39400001  ! 1480: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 1481: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d540000  ! 1482: RDPR_GL	rdpr	%-, %r6
	.word 0x99902005  ! 1483: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d903b9b  ! 1484: WRPR_PSTATE_I	wrpr	%r0, 0x1b9b, %pstate
	set 0x8aeb0ec1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_645:
	.word 0x39400001  ! 1485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 1486: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902001  ! 1487: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 1488: LDX_R	ldx	[%r31 + %r0], %r6
mondo_0_646:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 1489: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0xcd27e001  ! 1490: STF_I	st	%f6, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccc7e020  ! 1492: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	.word 0x87902142  ! 1493: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	.word 0x8f540000  ! 1494: RDPR_GL	rdpr	%-, %r7
debug_0_647:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 1495: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 1496: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0x38800001  ! 1497: BGU	bgu,a	<label_0x1>
debug_0_648:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 1498: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
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

	.xword	0x1beda903f43e925c
	.xword	0x13a4fb132fe75539
	.xword	0x44d34277a4f66426
	.xword	0xd60e14d7a1d63f8d
	.xword	0x4f94c0d6be57e206
	.xword	0xcabb864da4b80b13
	.xword	0xffff18971ddde224
	.xword	0x61c4f416ab5efeef
	.xword	0x8a3ec891aef76ad6
	.xword	0x12ad563e886f56cd
	.xword	0xd7ee7d2ac691264e
	.xword	0x7e5648b4128ca9a2
	.xword	0x01fd7f4f3b7065c8
	.xword	0x258a9fcf06ee5855
	.xword	0x26512d2b1091d92d
	.xword	0xd30ca354e2f4be9e
	.xword	0x38aca36aa52ed598
	.xword	0xcbca1e8e0e921421
	.xword	0xd95c32b9c586472c
	.xword	0xdf1dd25c2ffd59c4
	.xword	0x960ef6088404a40e
	.xword	0x4bdb85ee3a6689c1
	.xword	0x5c1c1980e8dadba8
	.xword	0x387d8f98a3800e8d
	.xword	0xb87437352b884ba7
	.xword	0xdf84d1f554fc4c31
	.xword	0xdb925a31ff493750
	.xword	0xc2ebe8bf1ee833a0
	.xword	0xc7d2663a2162c813
	.xword	0xd26a684405181839
	.xword	0x8f3d6035ff4c8596
	.xword	0x966ba1e2973c0d69
	.xword	0xd23a13b4ff798c97
	.xword	0x5c32e97a31d4e510
	.xword	0x18c4bf9e44f3ca5f
	.xword	0x12ab21e26935bdfd
	.xword	0x829a56a19313d998
	.xword	0xab8d84da57874007
	.xword	0x4f5c4b718ff5b6ce
	.xword	0x94348e861203f023
	.xword	0x8fc0d569d30fa8d7
	.xword	0x1a6447800ab1aa80
	.xword	0x21a991608e017b15
	.xword	0xb100cd04af41a154
	.xword	0x1415b35a9fb88607
	.xword	0x4131838830811958
	.xword	0xbd5ee57adb15e490
	.xword	0xa085d52300885318
	.xword	0xcfe5d190eb5e1ddf
	.xword	0x3b3817725ed4694f
	.xword	0x3d8220c022f065c9
	.xword	0x1089698cdca8dc28
	.xword	0x2266c6331b186b97
	.xword	0xb1befc17318f3ae9
	.xword	0x6fb805fbc20d801f
	.xword	0x9d665a2af45f5612
	.xword	0xda7819edf23a8ab9
	.xword	0xcc0411b5efa25cf2
	.xword	0x344de4332ab1557f
	.xword	0x220ec31bf2481a06
	.xword	0xbcbf1cd661c5dae3
	.xword	0xaf3327b19eace2ed
	.xword	0xc04c625e60dee53e
	.xword	0xc8be93a949c05c20
	.xword	0xd407b1d11363a141
	.xword	0x0e4bcce52312537d
	.xword	0x5102a18b04bf0888
	.xword	0x0e93a38d3eecbd00
	.xword	0xc15b7cbfa8e4581b
	.xword	0xb7b12823e31609bc
	.xword	0xe1bef0cfe7687d53
	.xword	0x01745470d38b7ed3
	.xword	0x244ccb795f398dc9
	.xword	0xba97c006bac3df37
	.xword	0xd3aa91c83d6480df
	.xword	0xf82daf4131614f2e
	.xword	0x7df457b7c0d22b7e
	.xword	0xf6bf18d9ee5fe487
	.xword	0xee0740668d26a7c4
	.xword	0x16b5d39f01bd7673
	.xword	0xe85b15b3dfef9a0f
	.xword	0xeae06433e75d7fc2
	.xword	0xaaff96968820a39f
	.xword	0xf491ace301e5c8cf
	.xword	0x03d2b369b9e7efb3
	.xword	0x2f8b35571ad7c37a
	.xword	0x647588d7432bf403
	.xword	0xf3f44956c0270852
	.xword	0x85c259f119368ff5
	.xword	0xd03533c5c25f4ed7
	.xword	0xad4b81cee4ce7c9b
	.xword	0x99dc501c4e7aa719
	.xword	0x709e260e5746b913
	.xword	0xd270112847bbf641
	.xword	0x7897e7bcbd2506fc
	.xword	0x414a0c333d874951
	.xword	0x97f08a460e6844b1
	.xword	0xded1d6eaf111eb13
	.xword	0x77f9fe3637f3ec76
	.xword	0xc6d7a1396e4ae8b1
	.xword	0xb1a6b7081d056ea0
	.xword	0x4021420f822656ed
	.xword	0x3a6a8428be277354
	.xword	0x37b922d04b6cad21
	.xword	0x6d574c9f8ffc869e
	.xword	0x4b8ec5f2edb42a11
	.xword	0x686ce4cb5a91897a
	.xword	0xc4d0120903267ee2
	.xword	0xc16ad1f47087e796
	.xword	0x5198d18fd9738c29
	.xword	0x6da28a247e056398
	.xword	0x792c265079f45082
	.xword	0xd65c342303754104
	.xword	0x73534e3f1bb6d975
	.xword	0x6f986de11b1252c3
	.xword	0x3d9065a65def9383
	.xword	0xf4f3e1dd6d373935
	.xword	0x6a1fbc0757c27f5b
	.xword	0xf8d34708533bce3a
	.xword	0xc30b0172971e2078
	.xword	0x3574d0d704448ce5
	.xword	0x84f55fa122eb77d4
	.xword	0xdb972ae1d79e462b
	.xword	0xc662fa56cfb1ef82
	.xword	0xa09934b233528bd5
	.xword	0x333190668d51a113
	.xword	0x56ac49b048fa1723
	.xword	0x4e0d9fd209f1a9d6
	.xword	0xa6d4827d8d1ceb90
	.xword	0xc5ff5e0acd1c02a0
	.xword	0x1324d5a877fb7f26
	.xword	0x273f86589e1a3a69
	.xword	0x83ad0ce53212159a
	.xword	0x69b38daba0614b8d
	.xword	0xe403d28a1753cb49
	.xword	0x044393220fe64752
	.xword	0xb106c9f71fa84ad9
	.xword	0x45c6bbd9dc80363d
	.xword	0xb456d4bc03e181cc
	.xword	0x630b1c8c6cf40060
	.xword	0x49d81630606c56c4
	.xword	0xb97bfc78a2756d3f
	.xword	0x70dbd8d3a7f103d1
	.xword	0xacd1d406ee4ceefb
	.xword	0x651234736779a240
	.xword	0x8af00e4147bdac36
	.xword	0x576d217ba14edbf5
	.xword	0xea48e6c0b8cb0ba4
	.xword	0xaea65ae9d903ad6f
	.xword	0xff8dc75da0800878
	.xword	0x7bd9e9af7b901269
	.xword	0x6e646167bd3c08d8
	.xword	0x22ff12a47ab6c8a6
	.xword	0x8d8c657b03b859ae
	.xword	0xa7dcfa407034a6d6
	.xword	0xd659c60913d659e9
	.xword	0x4c266d576f0433a4
	.xword	0x4cdb113d1819da0f
	.xword	0x585be94230fb0a16
	.xword	0xaef815b11d3f597c
	.xword	0x1a17a78632527768
	.xword	0xf12863c919a7a364
	.xword	0x236637f832ea4633
	.xword	0x6be3f38d0be11621
	.xword	0x5a6e41fedc355d02
	.xword	0x008a8ac403d3e07d
	.xword	0xbe1d9a87d23d998d
	.xword	0x8c074d34a4644773
	.xword	0x90443fbca2ab3f8f
	.xword	0xe28f48e728b00192
	.xword	0x082ad1ec0fa320bb
	.xword	0x96bfb0f2e7279fd5
	.xword	0xead88da1e1811fcc
	.xword	0xd1aff74ce07c7cd7
	.xword	0xffbf8ed49894d685
	.xword	0xe1d347a9cd0a27fa
	.xword	0x4ac2e4d8a686f383
	.xword	0x7623e2f2796f3aed
	.xword	0xdee70a396c44e147
	.xword	0xcd02d918957185af
	.xword	0x8eacdeab50268f2c
	.xword	0xe634dcd8668d722a
	.xword	0x277c7f094fba4bfb
	.xword	0xa606d02b8d963c84
	.xword	0xdfa19d4a87caed15
	.xword	0x5457bf8a55ef733f
	.xword	0x346d619852f33db6
	.xword	0x41f39a64ea2a4792
	.xword	0x15bd0429d6899cc5
	.xword	0x70f377e846e12b0a
	.xword	0x30f9a2d26d09107d
	.xword	0xc4d4cfa03f32eb2d
	.xword	0xe731a96199cf2fb4
	.xword	0x038c738adea9a77c
	.xword	0x797c25933e50c41e
	.xword	0x7b75b63b5a4add49
	.xword	0xbec80a59b311c9b4
	.xword	0x0aaef9dad13b5c10
	.xword	0x2309c668aa21fe3b
	.xword	0xa02171e453cf0862
	.xword	0x2dee7ffaa10e39fd
	.xword	0xd9c56fa69703bbd0
	.xword	0x3e37c4123de80631
	.xword	0x435deb2beb5c9d46
	.xword	0x35db77616cf30147
	.xword	0xa3e88449136be220
	.xword	0x5a7147ad557f2edd
	.xword	0x1ac2652da2172659
	.xword	0x2fd29605c4713f03
	.xword	0x863256c09d94c0e4
	.xword	0x7a3ec1bd622914e9
	.xword	0x0c26f68f0bf50645
	.xword	0xa274891a61a0e39d
	.xword	0x654de805cff1fc37
	.xword	0x8c9ede8239019dcb
	.xword	0x75cb4368968e8bf0
	.xword	0x61ee85951ee802f9
	.xword	0x56dc117a7fc32fd9
	.xword	0xa5f5d99300e93f49
	.xword	0x211f220416a92207
	.xword	0x9412c2f089034811
	.xword	0x805a4d66bda16ce4
	.xword	0x5808eb6a846eae39
	.xword	0x945367ca68630bf6
	.xword	0x7814295bc81b168c
	.xword	0x260958707319f3ea
	.xword	0x48c37d64b5782d67
	.xword	0x647d41ba9b3cae07
	.xword	0x441ed8e81d080083
	.xword	0xfe65f95e9231d0cc
	.xword	0x5437b35a774fe118
	.xword	0xf4cc83db3ede028d
	.xword	0xd6ffb2359299a552
	.xword	0xd04ab03080c7c813
	.xword	0xbed1f851193cef01
	.xword	0xb2323587290d719f
	.xword	0x88a16357ad42a7a4
	.xword	0x8f53a066c57f89e9
	.xword	0x0fd7affff969ec28
	.xword	0xb0f8ab67db9e54ca
	.xword	0xed89a068af257e1c
	.xword	0x9e90fe96789b05dd
	.xword	0x3a3bdd3d81550f76
	.xword	0xa4e963db2d8ce5be
	.xword	0x4063561d3bcfd33f
	.xword	0x3924ffbd7f4da162
	.xword	0xc89b7cb0c28fa9b2
	.xword	0xe3b382c5d0471e78
	.xword	0xf9ebd1fd288c08a5
	.xword	0x2fb66aea49b073cd
	.xword	0xd8c92537ff42f644
	.xword	0x30a5e9900f98d767
	.xword	0x370edc45612f7484
	.xword	0x5d7c2b74a04281e6
	.xword	0x042a030e8b37dae6
	.xword	0xe303b4481eee5820

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

