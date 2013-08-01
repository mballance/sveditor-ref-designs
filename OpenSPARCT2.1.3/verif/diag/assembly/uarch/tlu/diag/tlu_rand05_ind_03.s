/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_03.s
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
	mov 0xb0, %r14
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
	mov 0x34, %r14
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
	mov 0x35, %r14
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

	.word 0x87802014  ! 1: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902003  ! 2: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_0)) -> intp(0,0,0)
intvec_0_0:
	.word 0x39400001  ! 3: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 4: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa750c000  ! 5: RDPR_TT	rdpr	%tt, %r19
	.word 0xe71fe001  ! 6: LDDF_I	ldd	[%r31, 0x0001], %f19
debug_0_1:
	setx debug_0_1 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 7: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 8: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_0_2:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 10: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xe677e001  ! 11: STX_I	stx	%r19, [%r31 + 0x0001]
	.word 0x93d020b5  ! 12: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xe68008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x91d020b4  ! 14: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe64fe001  ! 15: LDSB_I	ldsb	[%r31 + 0x0001], %r19
splash_lsu_0_3:
	setx 0xa8ae6c2e634d36e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 16: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d2a  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x1d2a, %pstate
intveclr_0_4:
	set 0x2361aa76, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 18: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902bf8  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0bf8, %pstate
	.word 0xa1902003  ! 20: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_htba_0_5:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 21: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe727c00b  ! 22: STF_R	st	%f19, [%r11, %r31]
debug_0_6:
	mov 0x38, %r18
	.word 0xfef00b12  ! 23: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 24: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7508000  ! 25: RDPR_TSTATE	rdpr	%tstate, %r19
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_7)) -> intp(0,1,3)
xir_0_7:
	.word 0xa980a001  ! 26: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x879021cd  ! 27: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0x24700001  ! 28: BPLE	<illegal instruction>
	.word 0x93902002  ! 29: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_0_8:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xdf467d6d	! Random illegal ?
	.word 0xa9a00545  ! 1: FSQRTd	fsqrt	
	.word 0xa3a0c831  ! 30: FADDs	fadds	%f3, %f17, %f17
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 31: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 32: SIR	sir	0x0001
	set 0xc562a835, %r28
	stxa %r28, [%g0] 0x73
intvec_0_9:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8984400c  ! 34: WRTICK_R	wr	%r17, %r12, %tick
	.word 0x8d9030cb  ! 35: WRPR_PSTATE_I	wrpr	%r0, 0x10cb, %pstate
splash_cmpr_0_11:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 36: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xe28008a0  ! 37: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8d90282a  ! 38: WRPR_PSTATE_I	wrpr	%r0, 0x082a, %pstate
	.word 0xe28008a0  ! 39: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87902382  ! 40: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
	.word 0x87802063  ! 41: WRASI_I	wr	%r0, 0x0063, %asi
debug_0_12:
	mov 0x38, %r18
	.word 0xfef00b12  ! 42: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802058  ! 43: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe2800c20  ! 44: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xe2800c20  ! 45: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xe257c000  ! 46: LDSH_R	ldsh	[%r31 + %r0], %r17
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83508000  ! 48: RDPR_TSTATE	rdpr	%tstate, %r1
intveclr_0_13:
	set 0xa5be3d67, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 49: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_14)) -> intp(0,0,5)
intvec_0_14:
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_15:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 51: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc25fc000  ! 53: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x93902003  ! 54: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_0_16:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f12, %f2
	.word 0x9bb1c301  ! 55: ALIGNADDRESS	alignaddr	%r7, %r1, %r13
	.word 0xa351c000  ! 56: RDPR_TL	rdpr	%tl, %r17
	set 0x58bb456, %r28
	stxa %r28, [%g0] 0x73
intvec_0_17:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9751c000  ! 58: RDPR_TL	rdpr	%tl, %r11
	.word 0x87802080  ! 59: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd73fc001  ! 60: STDF_R	std	%f11, [%r1, %r31]
splash_htba_0_18:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 61: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd6c804a0  ! 62: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_lsu_0_19:
	setx 0x957dac9c20a0877f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_20)) -> intp(0,0,17)
intvec_0_20:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_21)) -> intp(0,1,3)
xir_0_21:
	.word 0xa984e001  ! 66: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x99494000  ! 67: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xa1902007  ! 68: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01968  ! 69: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x836c6001  ! 70: SDIVX_I	sdivx	%r17, 0x0001, %r1
	.word 0xc397e001  ! 71: LDQFA_I	-	[%r31, 0x0001], %f1
DS_0_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xb9640c73	! Random illegal ?
	.word 0xc9128012  ! 1: LDQF_R	-	[%r10, %r18], %f4
	.word 0x8ba20824  ! 72: FADDs	fadds	%f8, %f4, %f5
	.word 0x8780201c  ! 73: WRASI_I	wr	%r0, 0x001c, %asi
debug_0_25:
	setx debug_0_25 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 74: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 75: LDX_R	ldx	[%r31 + %r0], %r5
debug_0_26:
	mov 0x38, %r18
	.word 0xfef00b12  ! 76: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa350c000  ! 77: RDPR_TT	rdpr	%tt, %r17
	.word 0xa1902003  ! 78: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_0_27:
	mov 0x38, %r18
	.word 0xfef00b12  ! 79: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_28)) -> intp(0,1,3)
xir_0_28:
	.word 0xa980a001  ! 80: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
tagged_0_29:
	taddcctv %r22, 0x1ef7, %r23
	.word 0xe207e001  ! 81: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x91d02033  ! 82: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r17
mondo_0_30:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948014  ! 84: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x8790238a  ! 85: WRPR_TT_I	wrpr	%r0, 0x038a, %tt
splash_cmpr_0_31:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 86: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0xe317c000  ! 87: LDQF_R	-	[%r31, %r0], %f17
	.word 0xe24fc000  ! 88: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xa1902008  ! 89: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902007  ! 90: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_0_32:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 91: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 52
	set 0x725aa73d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_33:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_34:
	setx debug_0_34 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 94: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9032bf  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x12bf, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02034  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x879023e0  ! 98: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
DS_0_35:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 99: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_36:
	setx 0xa6d4c12b30017f01, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_37:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d924013  ! 101: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
intveclr_0_38:
	set 0xbad6bf27, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe247e001  ! 104: LDSW_I	ldsw	[%r31 + 0x0001], %r17
splash_lsu_0_39:
	setx 0x75ce936ddfada48d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_40:
	setx 0xf988f527a0b6c477, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 107: SIR	sir	0x0001
change_to_randtl_0_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_41:
	.word 0x8f902005  ! 108: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
mondo_0_42:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d950009  ! 109: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0x93902000  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe28008a0  ! 111: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa190200c  ! 112: WRPR_GL_I	wrpr	%r0, 0x000c, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_43)) -> intp(0,1,3)
xir_0_43:
	.word 0xa9806001  ! 113: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x93d02035  ! 114: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x86d44005  ! 115: UMULcc_R	umulcc 	%r17, %r5, %r3
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 116: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_0_44:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 117: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
tagged_0_45:
	taddcctv %r25, 0x1e51, %r18
	.word 0xc607e001  ! 118: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc737c005  ! 119: STQF_R	-	%f3, [%r5, %r31]
	.word 0xa3504000  ! 120: RDPR_TNPC	rdpr	%tnpc, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_46)) -> intp(0,0,18)
intvec_0_46:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe317c000  ! 122: LDQF_R	-	[%r31, %r0], %f17
	set 0x4c028418, %r28
	stxa %r28, [%g0] 0x73
intvec_0_47:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 124: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9ba34d30  ! 125: FsMULd	fsmuld	%f13, %f16, %f44
	.word 0x3c800001  ! 126: BPOS	bpos,a	<label_0x1>
	.word 0x8d902563  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x0563, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_48)) -> intp(0,0,20)
intvec_0_48:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 129: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902001  ! 130: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_49:
	set 0xd35006a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87902321  ! 133: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
	.word 0x24700001  ! 134: BPLE	<illegal instruction>
splash_htba_0_50:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 135: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200d  ! 136: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x42e78324, %r28
	stxa %r28, [%g0] 0x73
intvec_0_51:
	.word 0x39400001  ! 138: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_52)) -> intp(0,0,10)
intvec_0_52:
	.word 0x39400001  ! 139: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 140: Tcc_I	ta	icc_or_xcc, %r0 + 181
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 141: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_0_53:
	setx 0xc01faa00e4a1fb1d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(0,0,5)
intvec_0_54:
	.word 0x39400001  ! 143: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x5f4c267d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_55:
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xad846001  ! 145: WR_SOFTINT_REG_I	wr	%r17, 0x0001, %softint
splash_lsu_0_56:
	setx 0xddb812de8e058bc5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_57:
	set 0xe7d6697, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 148: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d902fcc  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0fcc, %pstate
tagged_0_58:
	tsubcctv %r4, 0x14db, %r13
	.word 0xda07e001  ! 150: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8353c000  ! 152: RDPR_FQ	<illegal instruction>
	.word 0x34800001  ! 153: BG	bg,a	<label_0x1>
	.word 0x8d9030fa  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x10fa, %pstate
	.word 0x81982147  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_59)) -> intp(0,1,3)
xir_0_59:
	.word 0xa9842001  ! 156: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_60)) -> intp(0,0,31)
intvec_0_60:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc28fe000  ! 158: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r1
intveclr_0_61:
	set 0xd3ee1eb3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 159: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_62:
	set 0x6a8304a2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 160: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 161: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_63:
	mov 0x38, %r18
	.word 0xfef00b12  ! 162: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_64)) -> intp(0,0,22)
intvec_0_64:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_65:
	mov 0x38, %r18
	.word 0xfef00b12  ! 164: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902004  ! 165: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_66:
	mov 0x38, %r18
	.word 0xfef00b12  ! 166: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	set 0xafd67371, %r28
	stxa %r28, [%g0] 0x73
intvec_0_67:
	.word 0x39400001  ! 167: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_68:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe534a001  ! 1: STQF_I	-	%f18, [0x0001, %r18]
	normalw
	.word 0xa9458000  ! 168: RD_SOFTINT_REG	rd	%softint, %r20
debug_0_69:
	mov 0x38, %r18
	.word 0xfef00b12  ! 169: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_70:
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 170: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_71:
	taddcctv %r10, 0x195b, %r16
	.word 0xe807e001  ! 171: LDUW_I	lduw	[%r31 + 0x0001], %r20
tagged_0_72:
	tsubcctv %r24, 0x141a, %r7
	.word 0xe807e001  ! 172: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8198284d  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
mondo_0_73:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d924009  ! 174: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
	.word 0xe8cfe000  ! 175: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
	.word 0x9f802001  ! 176: SIR	sir	0x0001
	.word 0xe8800b00  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r20
DS_0_74:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f30, %f4
	.word 0x97b4c308  ! 178: ALIGNADDRESS	alignaddr	%r19, %r8, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa550c000  ! 180: RDPR_TT	rdpr	%tt, %r18
	.word 0x87802058  ! 181: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe497e030  ! 182: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe48008a0  ! 183: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4800be0  ! 184: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 185: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_75:
	mov 0x38, %r18
	.word 0xfef00b12  ! 186: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95a04d34  ! 187: FsMULd	fsmuld	%f1, %f20, %f10
	ta	T_CHANGE_HPRIV	! macro
intveclr_0_76:
	set 0xc36622d9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 189: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd4800b80  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0x879023c6  ! 191: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0x81982e9f  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9f, %hpstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_77)) -> intp(0,1,3)
xir_0_77:
	.word 0xa982a001  ! 193: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x8153c000  ! 194: RDPR_FQ	<illegal instruction>
	.word 0xc04fe001  ! 195: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	ta	T_CHANGE_HPRIV	! macro
DS_0_78:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc3300008  ! 1: STQF_R	-	%f1, [%r8, %r0]
	normalw
	.word 0xa5458000  ! 197: RD_SOFTINT_REG	rd	%softint, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_79)) -> intp(0,1,3)
xir_0_79:
	.word 0xa984e001  ! 198: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xa1902003  ! 199: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe517c000  ! 200: LDQF_R	-	[%r31, %r0], %f18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_80)) -> intp(0,0,4)
intvec_0_80:
	.word 0x39400001  ! 201: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_81:
	mov 0x38, %r18
	.word 0xfef00b12  ! 202: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9192e001  ! 203: WRPR_PIL_I	wrpr	%r11, 0x0001, %pil
splash_lsu_0_82:
	setx 0xe3024f0345fb9cff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 204: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 206: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87464000  ! 207: RD_STICK_CMPR_REG	rd	%-, %r3
	set 0xa12c90d6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 208: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc65fc000  ! 209: LDX_R	ldx	[%r31 + %r0], %r3
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_84)) -> intp(0,0,20)
intvec_0_84:
	.word 0x39400001  ! 210: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902263  ! 211: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	.word 0xc71fc000  ! 212: LDDF_R	ldd	[%r31, %r0], %f3
	set 0xc6523fc1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_85:
	.word 0x39400001  ! 213: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_86)) -> intp(0,1,3)
xir_0_86:
	.word 0xa980a001  ! 214: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x8d903a3a  ! 215: WRPR_PSTATE_I	wrpr	%r0, 0x1a3a, %pstate
DS_0_87:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe1326001  ! 1: STQF_I	-	%f16, [0x0001, %r9]
	normalw
	.word 0x95458000  ! 216: RD_SOFTINT_REG	rd	%softint, %r10
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_88)) -> intp(0,0,0)
intvec_0_88:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_89:
	taddcctv %r21, 0x1b6a, %r12
	.word 0xd407e001  ! 218: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x81510000  ! 219: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd527e001  ! 220: STF_I	st	%f10, [0x0001, %r31]
	.word 0x94692001  ! 221: UDIVX_I	udivx 	%r4, 0x0001, %r10
	.word 0x93902000  ! 222: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd48008a0  ! 223: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
mondo_0_90:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d93400a  ! 224: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
	.word 0xa3450000  ! 225: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0x28800001  ! 226: BLEU	bleu,a	<label_0x1>
splash_lsu_0_91:
	setx 0xa1016e342a46ca0f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 227: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 228: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x9f802001  ! 229: SIR	sir	0x0001
	.word 0xe207c000  ! 230: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0x93d02035  ! 231: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa8d42001  ! 232: UMULcc_I	umulcc 	%r16, 0x0001, %r20
	.word 0xe8c7e020  ! 233: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
splash_lsu_0_92:
	setx 0xbd34528a27a88021, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 234: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93a00546  ! 236: FSQRTd	fsqrt	
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 237: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d903569  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x1569, %pstate
tagged_0_93:
	taddcctv %r14, 0x1420, %r5
	.word 0xd207e001  ! 239: LDUW_I	lduw	[%r31 + 0x0001], %r9
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_94)) -> intp(0,0,31)
intvec_0_94:
	.word 0x39400001  ! 240: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 241: LDX_R	ldx	[%r31 + %r0], %r9
tagged_0_95:
	taddcctv %r17, 0x1de7, %r19
	.word 0xd207e001  ! 242: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2c804a0  ! 243: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xd23fc006  ! 244: STD_R	std	%r9, [%r31 + %r6]
	.word 0x91d02034  ! 245: Tcc_I	ta	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 246: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2d7e010  ! 247: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
	.word 0xd2c804a0  ! 248: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 249: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa2f9800d  ! 250: SDIVcc_R	sdivcc 	%r6, %r13, %r17
	.word 0x8d903a9e  ! 251: WRPR_PSTATE_I	wrpr	%r0, 0x1a9e, %pstate
splash_lsu_0_96:
	setx 0x674e5cab551efb49, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 252: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_97:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 253: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xe21fc000  ! 254: LDD_R	ldd	[%r31 + %r0], %r17
DS_0_98:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 255: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe28008a0  ! 256: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2dfe030  ! 257: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	set 0xdbf2bca6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_99:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 259: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 260: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe29fc020  ! 261: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
	.word 0xa1902006  ! 262: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d9022a3  ! 263: WRPR_PSTATE_I	wrpr	%r0, 0x02a3, %pstate
	.word 0xe257c000  ! 264: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0x32800001  ! 265: BNE	bne,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_100)) -> intp(0,0,16)
intvec_0_100:
	.word 0x39400001  ! 266: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9454000  ! 267: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b50c000  ! 269: RDPR_TT	rdpr	%tt, %r13
	.word 0x93902001  ! 270: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xda1fc000  ! 271: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802088  ! 272: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xdb3fe001  ! 273: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x87450000  ! 274: RD_SET_SOFTINT	rd	%set_softint, %r3
	.word 0x819828d5  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0xc64fe001  ! 276: LDSB_I	ldsb	[%r31 + 0x0001], %r3
DS_0_101:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcf304000  ! 1: STQF_R	-	%f7, [%r0, %r1]
	normalw
	.word 0xa1458000  ! 277: RD_SOFTINT_REG	rd	%softint, %r16
DS_0_102:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7352001  ! 1: STQF_I	-	%f11, [0x0001, %r20]
	normalw
	.word 0xa3458000  ! 278: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe29fc020  ! 279: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
	.word 0xe2c00e80  ! 280: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r17
DS_0_103:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f28, %f14
	.word 0xa3b4030a  ! 281: ALIGNADDRESS	alignaddr	%r16, %r10, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 282: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xa1500000  ! 283: RDPR_TPC	rdpr	%tpc, %r16
splash_htba_0_104:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 284: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe01fe001  ! 285: LDD_I	ldd	[%r31 + 0x0001], %r16
change_to_randtl_0_105:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_105:
	.word 0x8f902005  ! 286: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c002  ! 287: WRTICK_R	wr	%r7, %r2, %tick
	set 0x9b479548, %r28
	stxa %r28, [%g0] 0x73
intvec_0_107:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_108:
	tsubcctv %r26, 0x12b2, %r15
	.word 0xe007e001  ! 289: LDUW_I	lduw	[%r31 + 0x0001], %r16
	set 0xd56319b8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_109:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xab820010  ! 291: WR_CLEAR_SOFTINT_R	wr	%r8, %r16, %clear_softint
	.word 0xe0d7e000  ! 292: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
intveclr_0_110:
	set 0xe92cbffd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 293: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r16
splash_cmpr_0_111:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 295: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x91d02035  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_112)) -> intp(0,1,3)
xir_0_112:
	.word 0xa9832001  ! 297: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0x8d802000  ! 298: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 299: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 300: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 301: SAVE_R	save	%r31, %r0, %r31
	.word 0xa44a000d  ! 302: MULX_R	mulx 	%r8, %r13, %r18
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 303: LDX_R	ldx	[%r31 + %r0], %r18
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_114)) -> intp(0,0,17)
intvec_0_114:
	.word 0x39400001  ! 304: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81982f5c  ! 305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe45fe001  ! 307: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe457c000  ! 308: LDSH_R	ldsh	[%r31 + %r0], %r18
tagged_0_115:
	taddcctv %r19, 0x1f8c, %r15
	.word 0xe407e001  ! 309: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x81510000  ! 310: RDPR_TICK	rdpr	%tick, %r0
	.word 0xa7494000  ! 311: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa1902001  ! 312: WRPR_GL_I	wrpr	%r0, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_116)) -> intp(0,0,20)
intvec_0_116:
	.word 0x39400001  ! 313: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_117:
	mov 0x38, %r18
	.word 0xfef00b12  ! 314: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6d004a0  ! 315: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x87902113  ! 316: WRPR_TT_I	wrpr	%r0, 0x0113, %tt
	.word 0xe68008a0  ! 317: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9951c000  ! 318: RDPR_TL	rdpr	%tl, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_118)) -> intp(0,0,9)
intvec_0_118:
	.word 0x39400001  ! 319: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8b508000  ! 320: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0xca9fe001  ! 321: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
mondo_0_119:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928010  ! 322: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0x81982987  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0987, %hpstate
	.word 0xca8008a0  ! 324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
mondo_0_120:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 325: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
tagged_0_121:
	taddcctv %r22, 0x1a89, %r4
	.word 0xca07e001  ! 326: LDUW_I	lduw	[%r31 + 0x0001], %r5
splash_tba_0_122:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 327: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_123:
	set 0x54dc4f90, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 328: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 329: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xa190200b  ! 330: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 331: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x87802089  ! 332: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802014  ! 333: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa3520000  ! 334: RDPR_PIL	rdpr	%pil, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_124)) -> intp(0,0,6)
intvec_0_124:
	.word 0x39400001  ! 335: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_0_125:
	set 0x81ee1667, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_126)) -> intp(0,1,3)
xir_0_126:
	.word 0xa984a001  ! 337: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x91d020b5  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 181
	set 0x6a589aff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_127:
	.word 0x39400001  ! 339: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 340: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a18d27  ! 341: FsMULd	fsmuld	%f6, %f38, %f16
	.word 0xe08fe030  ! 342: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 343: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0bfc027  ! 344: STDA_R	stda	%r16, [%r31 + %r7] 0x01
splash_htba_0_128:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8790206e  ! 346: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
intveclr_0_129:
	set 0xa97bd87b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 347: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe000  ! 348: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_130)) -> intp(0,0,10)
intvec_0_130:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b4  ! 350: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x926c6001  ! 351: UDIVX_I	udivx 	%r17, 0x0001, %r9
	.word 0x2a800001  ! 352: BCS	bcs,a	<label_0x1>
	.word 0xd31fe001  ! 353: LDDF_I	ldd	[%r31, 0x0001], %f9
	.word 0x91d02033  ! 354: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802055  ! 355: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802014  ! 356: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_0_131:
	setx 0xd2896c8d7a983c7d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 357: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_132:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 358: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x87902123  ! 359: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
DS_0_133:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb302001  ! 1: STQF_I	-	%f13, [0x0001, %r0]
	normalw
	.word 0x87458000  ! 360: RD_SOFTINT_REG	rd	%softint, %r3
splash_lsu_0_134:
	setx 0xa701ccf06fd9119f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 361: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 362: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xe057e001  ! 363: LDSH_I	ldsh	[%r31 + 0x0001], %r16
debug_0_135:
	mov 0x38, %r18
	.word 0xfef00b12  ! 364: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_136)) -> intp(0,0,8)
intvec_0_136:
	.word 0x39400001  ! 365: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 366: BNEG	bneg,a	<label_0x1>
	.word 0x93902006  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_0_137:
	taddcctv %r16, 0x1e9b, %r1
	.word 0xe007e001  ! 368: LDUW_I	lduw	[%r31 + 0x0001], %r16
	ta	T_CHANGE_HPRIV	! macro
intveclr_0_138:
	set 0x832e6bcd, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 370: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0d804a0  ! 371: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	set 0x154ce6fd, %r28
	stxa %r28, [%g0] 0x73
intvec_0_139:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe047c000  ! 374: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0xa1902000  ! 375: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe09fc020  ! 376: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0xa1902000  ! 377: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8ad4a001  ! 378: UMULcc_I	umulcc 	%r18, 0x0001, %r5
	.word 0xca4fc000  ! 379: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xcb97e001  ! 380: LDQFA_I	-	[%r31, 0x0001], %f5
	.word 0xcb3fc011  ! 381: STDF_R	std	%f5, [%r17, %r31]
	.word 0xa3508000  ! 382: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xe28008a0  ! 383: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_140)) -> intp(0,0,31)
intvec_0_140:
	.word 0x39400001  ! 384: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023b5  ! 385: WRPR_TT_I	wrpr	%r0, 0x03b5, %tt
	.word 0xe21fc000  ! 386: LDD_R	ldd	[%r31 + %r0], %r17
	set 0x362407fb, %r28
	stxa %r28, [%g0] 0x73
intvec_0_141:
	.word 0x39400001  ! 387: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_142:
	setx debug_0_142 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 388: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
tagged_0_143:
	taddcctv %r14, 0x1e87, %r26
	.word 0xe207e001  ! 389: LDUW_I	lduw	[%r31 + 0x0001], %r17
debug_0_144:
	mov 0x38, %r18
	.word 0xfef00b12  ! 390: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe397e001  ! 391: LDQFA_I	-	[%r31, 0x0001], %f17
	.word 0x93d020b3  ! 392: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x8282e001  ! 393: ADDcc_I	addcc 	%r11, 0x0001, %r1
	.word 0xc33fc011  ! 394: STDF_R	std	%f1, [%r17, %r31]
	.word 0x879023cb  ! 395: WRPR_TT_I	wrpr	%r0, 0x03cb, %tt
debug_0_145:
	setx debug_0_145 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 396: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x819826dd  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	.word 0xc21fe001  ! 398: LDD_I	ldd	[%r31 + 0x0001], %r1
splash_cmpr_0_146:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 399: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93902003  ! 400: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 401: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8d50c000  ! 402: RDPR_TT	rdpr	%tt, %r6
	set 0xb0758078, %r28
	stxa %r28, [%g0] 0x73
intvec_0_147:
	.word 0x39400001  ! 403: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xcc800c60  ! 404: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r6
	.word 0xa1a2c9f1  ! 405: FDIVq	dis not found

	.word 0xe08804a0  ! 406: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
DS_0_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xd95cdd2b	! Random illegal ?
	.word 0xcd14c000  ! 1: LDQF_R	-	[%r19, %r0], %f6
	.word 0x97a14828  ! 407: FADDs	fadds	%f5, %f8, %f11
	.word 0xd68008a0  ! 408: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd727c008  ! 409: STF_R	st	%f11, [%r8, %r31]
	.word 0x8d903821  ! 410: WRPR_PSTATE_I	wrpr	%r0, 0x1821, %pstate
intveclr_0_149:
	set 0xdf037d0e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 411: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_0_150:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 412: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 413: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x95508000  ! 414: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x99a00547  ! 415: FSQRTd	fsqrt	
	.word 0x87902139  ! 416: WRPR_TT_I	wrpr	%r0, 0x0139, %tt
	.word 0x91d02034  ! 417: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902000  ! 418: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x879020ad  ! 419: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0xa780a001  ! 420: WR_GRAPHICS_STATUS_REG_I	wr	%r2, 0x0001, %-
splash_lsu_0_151:
	setx 0x7f6a119cf695b8a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_152:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 422: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0xd81fe001  ! 423: LDD_I	ldd	[%r31 + 0x0001], %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 424: LDX_R	ldx	[%r31 + %r0], %r12
tagged_0_153:
	taddcctv %r16, 0x13d3, %r20
	.word 0xd807e001  ! 425: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd8d804a0  ! 426: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8800b00  ! 427: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r12
	.word 0xd88fe000  ! 428: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_154)) -> intp(0,0,14)
intvec_0_154:
	.word 0x39400001  ! 429: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 430: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x38800001  ! 431: BGU	bgu,a	<label_0x1>
tagged_0_155:
	taddcctv %r11, 0x1b75, %r24
	.word 0xd807e001  ! 432: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd88fe020  ! 433: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_156)) -> intp(0,0,23)
intvec_0_156:
	.word 0x39400001  ! 434: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba01a6a  ! 435: FqTOi	fqtoi	
	.word 0xa7508000  ! 436: RDPR_TSTATE	rdpr	%tstate, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 437: LDX_R	ldx	[%r31 + %r0], %r19
	set 0xbe246e25, %r28
	stxa %r28, [%g0] 0x73
intvec_0_157:
	.word 0x39400001  ! 438: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_158:
	mov 0x38, %r18
	.word 0xfef00b12  ! 439: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_159:
	set 0xe8bd4070, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 441: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe68008a0  ! 442: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x87802080  ! 443: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 444: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_160)) -> intp(0,0,19)
intvec_0_160:
	.word 0x39400001  ! 445: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_161)) -> intp(0,1,3)
xir_0_161:
	.word 0xa981e001  ! 446: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_162)) -> intp(0,0,9)
intvec_0_162:
	.word 0x39400001  ! 448: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe607c000  ! 449: LDUW_R	lduw	[%r31 + %r0], %r19
	.word 0xe71fc000  ! 450: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x83504000  ! 451: RDPR_TNPC	rdpr	%tnpc, %r1
	set 0x4e649e2, %r28
	stxa %r28, [%g0] 0x73
intvec_0_163:
	.word 0x39400001  ! 452: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc2c004a0  ! 453: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_164)) -> intp(0,1,3)
xir_0_164:
	.word 0xa9832001  ! 454: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
mondo_0_165:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d900013  ! 455: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xa4fb2001  ! 456: SDIVcc_I	sdivcc 	%r12, 0x0001, %r18
	.word 0xe44fe001  ! 457: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0xe457e001  ! 458: LDSH_I	ldsh	[%r31 + 0x0001], %r18
debug_0_166:
	setx debug_0_166 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 459: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 460: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa7832001  ! 461: WR_GRAPHICS_STATUS_REG_I	wr	%r12, 0x0001, %-
	.word 0xa1504000  ! 462: RDPR_TNPC	<illegal instruction>
	.word 0xa1902004  ! 463: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90348a  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x148a, %pstate
	.word 0xe08008a0  ! 465: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
DS_0_167:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 466: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_0_168:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xd37716f5	! Random illegal ?
	.word 0xe711800d  ! 1: LDQF_R	-	[%r6, %r13], %f19
	.word 0x97a4c825  ! 467: FADDs	fadds	%f19, %f5, %f11
	.word 0xa190200e  ! 468: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd73fc005  ! 469: STDF_R	std	%f11, [%r5, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 470: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6d7e000  ! 471: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
splash_lsu_0_169:
	setx 0x0a3bce22cf127837, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 472: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 473: LDX_I	ldx	[%r31 + 0x0001], %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_170)) -> intp(0,1,3)
xir_0_170:
	.word 0xa9846001  ! 474: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x93500000  ! 475: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa345c000  ! 477: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x99902005  ! 478: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8f500000  ! 479: RDPR_TPC	rdpr	%tpc, %r7
DS_0_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba00546  ! 1: FSQRTd	fsqrt	
	.word 0x95a1082a  ! 480: FADDs	fadds	%f4, %f10, %f10
	.word 0x9f802001  ! 481: SIR	sir	0x0001
tagged_0_172:
	tsubcctv %r13, 0x1412, %r23
	.word 0xd407e001  ! 482: LDUW_I	lduw	[%r31 + 0x0001], %r10
intveclr_0_173:
	set 0xf422e147, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 483: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97520000  ! 484: RDPR_PIL	rdpr	%pil, %r11
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 485: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 486: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd73fe001  ! 487: STDF_I	std	%f11, [0x0001, %r31]
DS_0_174:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 488: SAVE_R	save	%r31, %r0, %r31
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 489: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8d802000  ! 490: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd717c000  ! 491: LDQF_R	-	[%r31, %r0], %f11
	set 0x9d06052a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8551c000  ! 493: RDPR_TL	rdpr	%tl, %r2
debug_0_176:
	mov 0x38, %r18
	.word 0xfef00b12  ! 494: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d9024d5  ! 495: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0x91d02032  ! 496: Tcc_I	ta	icc_or_xcc, %r0 + 50
	set 0x1aeb0588, %r28
	stxa %r28, [%g0] 0x73
intvec_0_177:
	.word 0x39400001  ! 497: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91922001  ! 498: WRPR_PIL_I	wrpr	%r8, 0x0001, %pil
	.word 0xc4cfe030  ! 499: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r2
splash_lsu_0_178:
	setx 0x962d15266457abbd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 500: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_179:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940001  ! 501: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0xc44fc000  ! 502: LDSB_R	ldsb	[%r31 + %r0], %r2
splash_lsu_0_180:
	setx 0x91526e703dd529f1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 503: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc49fc020  ! 504: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x8d480000  ! 505: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 506: LDX_R	ldx	[%r31 + %r0], %r6
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 507: Tcc_R	te	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 508: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xa3464000  ! 509: RD_STICK_CMPR_REG	rd	%-, %r17
	set 0x8061fe83, %r28
	stxa %r28, [%g0] 0x73
intvec_0_181:
	.word 0x39400001  ! 510: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_182:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc5330001  ! 1: STQF_R	-	%f2, [%r1, %r12]
	normalw
	.word 0x91458000  ! 511: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd0800c80  ! 512: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0xa1902005  ! 513: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_HPRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_183)) -> intp(0,1,3)
xir_0_183:
	.word 0xa9836001  ! 515: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xa190200a  ! 516: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d9033f0  ! 517: WRPR_PSTATE_I	wrpr	%r0, 0x13f0, %pstate
	.word 0xd08008a0  ! 518: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_lsu_0_184:
	setx 0xfd5140b857f71fb3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 519: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022b7  ! 520: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
	.word 0x879023ee  ! 521: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
mondo_0_185:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d944010  ! 522: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xd127e001  ! 523: STF_I	st	%f8, [0x0001, %r31]
	.word 0xd117c000  ! 524: LDQF_R	-	[%r31, %r0], %f8
tagged_0_186:
	tsubcctv %r2, 0x1aae, %r10
	.word 0xd007e001  ! 525: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8790226e  ! 526: WRPR_TT_I	wrpr	%r0, 0x026e, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 527: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_187:
	setx 0xdf2c18b2a5ea11d1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 529: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd13fe001  ! 530: STDF_I	std	%f8, [0x0001, %r31]
	.word 0xd11fc000  ! 531: LDDF_R	ldd	[%r31, %r0], %f8
	.word 0xd007c000  ! 532: LDUW_R	lduw	[%r31 + %r0], %r8
	.word 0xd0c004a0  ! 533: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x87902324  ! 534: WRPR_TT_I	wrpr	%r0, 0x0324, %tt
	.word 0x93a000d0  ! 535: FNEGd	fnegd	%f16, %f40
	.word 0x36800001  ! 536: BGE	bge,a	<label_0x1>
	.word 0xd2bfe001  ! 537: STDA_I	stda	%r9, [%r31 + 0x0001] %asi
	.word 0xd327e001  ! 538: STF_I	st	%f9, [0x0001, %r31]
	.word 0x8d802000  ! 539: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_188:
	tsubcctv %r24, 0x1b18, %r25
	.word 0xd207e001  ! 540: LDUW_I	lduw	[%r31 + 0x0001], %r9
DS_0_189:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa3a44828  ! 541: FADDs	fadds	%f17, %f8, %f17
splash_lsu_0_190:
	setx 0x5040a031b0ce3b6b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 542: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	set 0x3f23125b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_191:
	.word 0x39400001  ! 543: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_192:
	setx 0x8ccc1120b85135ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 545: LDX_R	ldx	[%r31 + %r0], %r17
	set 0xe410577f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_193:
	.word 0x39400001  ! 546: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2d804a0  ! 547: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
	.word 0xe21fc000  ! 548: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x83464000  ! 549: RD_STICK_CMPR_REG	rd	%-, %r1
	.word 0xa1902006  ! 550: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x83d020b3  ! 551: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_lsu_0_194:
	setx 0xf0a9e531f2a5e6db, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 552: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 553: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f500000  ! 554: RDPR_TPC	rdpr	%tpc, %r7
tagged_0_195:
	taddcctv %r17, 0x1cfe, %r17
	.word 0xce07e001  ! 555: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01974  ! 556: FqTOd	dis not found

	.word 0x93902005  ! 557: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xdacfe000  ! 558: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 559: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_197:
	mov 0x38, %r18
	.word 0xfef00b12  ! 560: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93902000  ! 561: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 562: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x93902001  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xdadfe010  ! 564: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x93902003  ! 565: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902c97  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_198)) -> intp(0,0,13)
intvec_0_198:
	.word 0x39400001  ! 567: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 568: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xdb27e001  ! 569: STF_I	st	%f13, [0x0001, %r31]
mondo_0_199:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d950009  ! 570: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
debug_0_200:
	mov 0x38, %r18
	.word 0xfef00b12  ! 571: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 572: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xab850003  ! 573: WR_CLEAR_SOFTINT_R	wr	%r20, %r3, %clear_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 574: LDX_R	ldx	[%r31 + %r0], %r13
	set 0x4c77df97, %r28
	stxa %r28, [%g0] 0x73
intvec_0_201:
	.word 0x39400001  ! 575: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xdac004a0  ! 576: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0xdac00e60  ! 577: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
DS_0_202:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xef57a819	! Random illegal ?
	.word 0xc5114003  ! 1: LDQF_R	-	[%r5, %r3], %f2
	.word 0x8da50834  ! 578: FADDs	fadds	%f20, %f20, %f6
	.word 0xcd1fc000  ! 579: LDDF_R	ldd	[%r31, %r0], %f6
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 580: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 582: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_203)) -> intp(0,1,3)
xir_0_203:
	.word 0xa984a001  ! 583: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x93902003  ! 584: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_204)) -> intp(0,1,3)
xir_0_204:
	.word 0xa9852001  ! 585: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0x81460000  ! 586: RD_STICK_REG	stbar
tagged_0_205:
	taddcctv %r16, 0x1aa8, %r14
	.word 0xcc07e001  ! 587: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 588: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 589: BN	bn,a	<label_0x1>
	.word 0x93902004  ! 590: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_206)) -> intp(0,0,24)
intvec_0_206:
	.word 0x39400001  ! 591: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 592: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xcd17c000  ! 593: LDQF_R	-	[%r31, %r0], %f6
mondo_0_208:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 594: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
intveclr_0_209:
	set 0x3430526b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 595: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_210:
	mov 0x38, %r18
	.word 0xfef00b12  ! 596: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1902003  ! 597: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902009  ! 598: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcc47c000  ! 599: LDSW_R	ldsw	[%r31 + %r0], %r6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 600: LDX_R	ldx	[%r31 + %r0], %r6
intveclr_0_211:
	set 0x91e5ad4b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 601: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_212:
	set 0x39eb7e3b, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 602: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95702001  ! 603: POPC_I	popc	0x0001, %r10
debug_0_213:
	mov 0x38, %r18
	.word 0xfef00b12  ! 604: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd40fe001  ! 605: LDUB_I	ldub	[%r31 + 0x0001], %r10
splash_lsu_0_214:
	setx 0x2f52a0c6e4473fb5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 606: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_215:
	setx 0x52fe6a1d9cac5887, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 607: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_216)) -> intp(0,0,17)
intvec_0_216:
	.word 0x39400001  ! 608: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 609: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_lsu_0_217:
	setx 0x12f18323e908bf05, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 610: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4800b60  ! 611: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
debug_0_218:
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_0_219:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 613: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_220:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f6, %f10, %f8
	.word 0xa5b44305  ! 614: ALIGNADDRESS	alignaddr	%r17, %r5, %r18
	.word 0x91d02035  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_0_221:
	taddcctv %r4, 0x1711, %r1
	.word 0xe407e001  ! 616: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x8d903512  ! 617: WRPR_PSTATE_I	wrpr	%r0, 0x1512, %pstate
splash_lsu_0_222:
	setx 0x31b57b620f1a7211, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 618: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a01a62  ! 619: FqTOi	fqtoi	
	.word 0xe4c804a0  ! 620: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xa190200a  ! 621: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	set 0x8760025c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_223:
	.word 0x39400001  ! 622: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a40dc2  ! 623: FdMULq	fdmulq	
	.word 0xe4c804a0  ! 624: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe477c002  ! 625: STX_R	stx	%r18, [%r31 + %r2]
change_to_randtl_0_224:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_224:
	.word 0x8f902002  ! 626: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	set 0x1b610f66, %r28
	stxa %r28, [%g0] 0x73
intvec_0_225:
	.word 0x39400001  ! 627: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe53fe001  ! 628: STDF_I	std	%f18, [0x0001, %r31]
splash_lsu_0_226:
	setx 0xd067fdd6b404e329, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 629: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe537e001  ! 630: STQF_I	-	%f18, [0x0001, %r31]
splash_htba_0_227:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 631: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9024ec  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x04ec, %pstate
splash_lsu_0_228:
	setx 0x47f1aed1942ac753, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 633: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 635: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x80d1e001  ! 636: UMULcc_I	umulcc 	%r7, 0x0001, %r0
DS_0_229:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f8, %f0
	.word 0x95b2c30d  ! 637: ALIGNADDRESS	alignaddr	%r11, %r13, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_230:
	setx 0xfba4f355ed67282b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 639: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 640: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_0_231:
	setx 0xb01e7b6cf2014723, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 641: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_232:
	setx 0x533585e4c41d4db3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 642: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	set 0xd4a852e8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_233:
	.word 0x39400001  ! 644: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_234:
	mov 0x38, %r18
	.word 0xfef00b12  ! 645: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790212c  ! 646: WRPR_TT_I	wrpr	%r0, 0x012c, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_235)) -> intp(0,1,3)
xir_0_235:
	.word 0xa982e001  ! 647: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0xd48008a0  ! 648: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd49fe001  ! 649: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 650: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93902002  ! 651: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_0_236:
	set 0xd4db493e, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 652: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 653: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d020b3  ! 654: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xd44fe001  ! 655: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xa3480000  ! 656: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 657: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902b09  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x0b09, %pstate
	.word 0x9f802001  ! 659: SIR	sir	0x0001
	.word 0x8d90388f  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x188f, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 661: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe31fe001  ! 662: LDDF_I	ldd	[%r31, 0x0001], %f17
	.word 0x9f802001  ! 663: SIR	sir	0x0001
tagged_0_237:
	taddcctv %r21, 0x1785, %r5
	.word 0xe207e001  ! 664: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x30800001  ! 665: BA	ba,a	<label_0x1>
	.word 0x38800001  ! 666: BGU	bgu,a	<label_0x1>
	.word 0x8d802004  ! 667: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 668: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 669: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xab80400b  ! 670: WR_CLEAR_SOFTINT_R	wr	%r1, %r11, %clear_softint
	.word 0x91d020b2  ! 671: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe28804a0  ! 672: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0xe2cfe030  ! 673: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
	.word 0x91d02035  ! 674: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 675: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2dfe030  ! 676: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 677: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8d903b72  ! 678: WRPR_PSTATE_I	wrpr	%r0, 0x1b72, %pstate
	.word 0x879022dd  ! 679: WRPR_TT_I	wrpr	%r0, 0x02dd, %tt
	.word 0x8945c000  ! 680: RD_TICK_CMPR_REG	rd	%-, %r4
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_238)) -> intp(0,1,3)
xir_0_238:
	.word 0xa9846001  ! 681: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0x93902007  ! 682: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902072  ! 683: WRPR_TT_I	wrpr	%r0, 0x0072, %tt
debug_0_239:
	mov 0x38, %r18
	.word 0xfef00b12  ! 684: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 685: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_0_240:
	mov 0x38, %r18
	.word 0xfef00b12  ! 686: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
change_to_randtl_0_241:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_241:
	.word 0x8f902004  ! 687: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa4ab4005  ! 688: ANDNcc_R	andncc 	%r13, %r5, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1840011  ! 689: WR_STICK_REG_R	wr	%r16, %r17, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_243)) -> intp(0,1,3)
xir_0_243:
	.word 0xa9852001  ! 690: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
change_to_randtl_0_244:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_244:
	.word 0x8f902000  ! 691: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa2d32001  ! 692: UMULcc_I	umulcc 	%r12, 0x0001, %r17
	.word 0xe2c7e000  ! 693: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe207c000  ! 694: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xe297e030  ! 695: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
	.word 0xe2cfe000  ! 696: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_245)) -> intp(0,1,3)
xir_0_245:
	.word 0xa981a001  ! 697: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
DS_0_246:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8db2c310  ! 698: ALIGNADDRESS	alignaddr	%r11, %r16, %r6
	.word 0x87802080  ! 699: WRASI_I	wr	%r0, 0x0080, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 700: LDX_R	ldx	[%r31 + %r0], %r6
debug_0_247:
	setx debug_0_247 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 701: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xcc5fc000  ! 702: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x81510000  ! 703: RDPR_TICK	rdpr	%tick, %r0
debug_0_248:
	mov 0x38, %r18
	.word 0xfef00b12  ! 704: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 705: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87520000  ! 706: RDPR_PIL	rdpr	%pil, %r3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01972  ! 707: FqTOd	dis not found

	.word 0x8d9034cb  ! 708: WRPR_PSTATE_I	wrpr	%r0, 0x14cb, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 709: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x76bf7b4e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_251:
	.word 0x39400001  ! 710: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_252)) -> intp(0,0,14)
intvec_0_252:
	.word 0x39400001  ! 711: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022f3  ! 712: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
mondo_0_253:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d944005  ! 713: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x26700001  ! 714: BPL	<illegal instruction>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c008  ! 715: WRTICK_R	wr	%r7, %r8, %tick
	.word 0xe84fc000  ! 716: LDSB_R	ldsb	[%r31 + %r0], %r20
	.word 0xe927e001  ! 717: STF_I	st	%f20, [0x0001, %r31]
tagged_0_255:
	taddcctv %r4, 0x1ed7, %r19
	.word 0xe807e001  ! 718: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d903c10  ! 719: WRPR_PSTATE_I	wrpr	%r0, 0x1c10, %pstate
	.word 0xe937c008  ! 720: STQF_R	-	%f20, [%r8, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_256)) -> intp(0,0,20)
intvec_0_256:
	.word 0x39400001  ! 721: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 723: BNEG	bneg,a	<label_0x1>
	.word 0x91d02033  ! 724: Tcc_I	ta	icc_or_xcc, %r0 + 51
	set 0x4f852158, %r28
	stxa %r28, [%g0] 0x73
intvec_0_257:
	.word 0x39400001  ! 725: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 726: RD_STICK_REG	stbar
	.word 0xe84fc000  ! 727: LDSB_R	ldsb	[%r31 + %r0], %r20
tagged_0_258:
	tsubcctv %r6, 0x1fe8, %r4
	.word 0xe807e001  ! 728: LDUW_I	lduw	[%r31 + 0x0001], %r20
intveclr_0_259:
	set 0xd31d59f6, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 729: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021ed  ! 730: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
	.word 0xe8c804a0  ! 731: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
	.word 0x93902003  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 733: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_260:
	setx 0x9963c77ebc67b8c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 734: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe89004a0  ! 735: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x8d903db5  ! 736: WRPR_PSTATE_I	wrpr	%r0, 0x1db5, %pstate
	.word 0x879021f8  ! 737: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 738: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa1450000  ! 739: RD_SET_SOFTINT	rd	%set_softint, %r16
	set 0x7a3ef7ed, %r28
	stxa %r28, [%g0] 0x73
intvec_0_261:
	.word 0x39400001  ! 740: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0800ae0  ! 741: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r16
splash_lsu_0_262:
	setx 0x943777afb796528d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 742: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_263:
	mov 0x38, %r18
	.word 0xfef00b12  ! 743: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe08fe010  ! 744: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
tagged_0_264:
	tsubcctv %r4, 0x1854, %r13
	.word 0xe007e001  ! 745: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d004a0  ! 746: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
	.word 0xa1902009  ! 747: WRPR_GL_I	wrpr	%r0, 0x0009, %-
tagged_0_265:
	taddcctv %r12, 0x1313, %r13
	.word 0xe007e001  ! 748: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x93902005  ! 749: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 750: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_266)) -> intp(0,1,3)
xir_0_266:
	.word 0xa984a001  ! 751: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 752: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902a4b  ! 753: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	.word 0x8d802000  ! 754: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 755: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02035  ! 756: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x2c800001  ! 757: BNEG	bneg,a	<label_0x1>
DS_0_267:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xa3b40305  ! 758: ALIGNADDRESS	alignaddr	%r16, %r5, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 759: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 760: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_0_268:
	setx debug_0_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 761: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802063  ! 762: WRASI_I	wr	%r0, 0x0063, %asi
splash_lsu_0_269:
	setx 0x733d951b7431c29b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 763: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 764: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 765: LDX_R	ldx	[%r31 + %r0], %r10
tagged_0_270:
	tsubcctv %r18, 0x15e1, %r15
	.word 0xd407e001  ! 766: LDUW_I	lduw	[%r31 + 0x0001], %r10
DS_0_271:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 767: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d903680  ! 768: WRPR_PSTATE_I	wrpr	%r0, 0x1680, %pstate
	.word 0xd4c80e80  ! 769: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89840011  ! 770: WRTICK_R	wr	%r16, %r17, %tick
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_273)) -> intp(0,1,3)
xir_0_273:
	.word 0xa9816001  ! 771: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
splash_cmpr_0_274:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 772: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 773: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	set 0xb5278e41, %r28
	stxa %r28, [%g0] 0x73
intvec_0_275:
	.word 0x39400001  ! 774: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd40fc000  ! 775: LDUB_R	ldub	[%r31 + %r0], %r10
splash_lsu_0_276:
	setx 0xa9bce6121926edad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 776: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_277)) -> intp(0,1,3)
xir_0_277:
	.word 0xa980a001  ! 777: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0xd41fe001  ! 779: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x87802058  ! 780: WRASI_I	wr	%r0, 0x0058, %asi
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_278:
	setx 0x1224a20816d9e369, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 783: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 784: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021b0  ! 785: WRPR_TT_I	wrpr	%r0, 0x01b0, %tt
	.word 0xd4c7e020  ! 786: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0x85702001  ! 787: POPC_I	popc	0x0001, %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_279)) -> intp(0,1,3)
xir_0_279:
	.word 0xa984e001  ! 788: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xc4bfc031  ! 789: STDA_R	stda	%r2, [%r31 + %r17] 0x01
	.word 0xc48008a0  ! 790: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 791: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 792: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 794: RD_STICK_REG	stbar
tagged_0_280:
	tsubcctv %r23, 0x1e9c, %r19
	.word 0xc407e001  ! 795: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_0_281:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd930c00c  ! 1: STQF_R	-	%f12, [%r12, %r3]
	normalw
	.word 0x97458000  ! 796: RD_SOFTINT_REG	rd	%softint, %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_282)) -> intp(0,0,3)
intvec_0_282:
	.word 0x39400001  ! 797: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_283:
	taddcctv %r14, 0x1964, %r19
	.word 0xd607e001  ! 798: LDUW_I	lduw	[%r31 + 0x0001], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_284)) -> intp(0,0,0)
intvec_0_284:
	.word 0x39400001  ! 799: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6c804a0  ! 800: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
tagged_0_285:
	taddcctv %r9, 0x1a91, %r11
	.word 0xd607e001  ! 801: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x8d464000  ! 802: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0x8d902485  ! 803: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
intveclr_0_286:
	set 0x9a28a51, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 804: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8fb44fe1  ! 805: FONES	e	%f7
tagged_0_287:
	taddcctv %r18, 0x1828, %r16
	.word 0xce07e001  ! 806: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xa1902006  ! 807: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa8d26001  ! 808: UMULcc_I	umulcc 	%r9, 0x0001, %r20
	.word 0x879022e6  ! 809: WRPR_TT_I	wrpr	%r0, 0x02e6, %tt
	.word 0x87802089  ! 810: WRASI_I	wr	%r0, 0x0089, %asi
DS_0_288:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 811: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902002  ! 812: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
intveclr_0_289:
	set 0x76e100a8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 813: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2a800001  ! 814: BCS	bcs,a	<label_0x1>
	.word 0x8d903ab1  ! 815: WRPR_PSTATE_I	wrpr	%r0, 0x1ab1, %pstate
debug_0_290:
	mov 0x38, %r18
	.word 0xfef00b12  ! 816: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 817: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_0_291:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 818: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x91926001  ! 819: WRPR_PIL_I	wrpr	%r9, 0x0001, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 820: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8ec4e001  ! 821: ADDCcc_I	addccc 	%r19, 0x0001, %r7
intveclr_0_292:
	set 0x4003fa4f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 822: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xce9fe001  ! 823: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0xce800c80  ! 824: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r7
splash_cmpr_0_293:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 825: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0xa1902007  ! 826: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_0_294:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x85b1c309  ! 827: ALIGNADDRESS	alignaddr	%r7, %r9, %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_295)) -> intp(0,1,3)
xir_0_295:
	.word 0xa984e001  ! 828: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x28700001  ! 829: BPLEU	<illegal instruction>
	.word 0x879023a1  ! 830: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0x99902003  ! 831: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
intveclr_0_296:
	set 0xc06a01f4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 832: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_297:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d92c008  ! 833: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0xc527c008  ! 834: STF_R	st	%f2, [%r8, %r31]
	.word 0xc527e001  ! 835: STF_I	st	%f2, [0x0001, %r31]
	.word 0xc48008a0  ! 836: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
splash_tba_0_298:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 837: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_299:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe9350002  ! 1: STQF_R	-	%f20, [%r2, %r20]
	normalw
	.word 0x99458000  ! 838: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x3c700001  ! 839: BPPOS	<illegal instruction>
	.word 0xa190200c  ! 840: WRPR_GL_I	wrpr	%r0, 0x000c, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_300)) -> intp(0,0,13)
intvec_0_300:
	.word 0x39400001  ! 841: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xd492bfbc, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 842: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 843: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1450000  ! 844: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0x9a4a8010  ! 845: MULX_R	mulx 	%r10, %r16, %r13
	.word 0xda57e001  ! 846: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xda8804a0  ! 847: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(0,0,22)
intvec_0_302:
	.word 0x39400001  ! 848: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90390b  ! 849: WRPR_PSTATE_I	wrpr	%r0, 0x190b, %pstate
splash_lsu_0_303:
	setx 0x8c1bf1516b0e1edb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 850: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa6816001  ! 851: ADDcc_I	addcc 	%r5, 0x0001, %r19
	.word 0xa7464000  ! 852: RD_STICK_CMPR_REG	rd	%-, %r19
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 853: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0_304:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc3344005  ! 1: STQF_R	-	%f1, [%r5, %r17]
	normalw
	.word 0xa7458000  ! 854: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1824011  ! 855: WR_STICK_REG_R	wr	%r9, %r17, %-
	.word 0xa8d0a001  ! 856: UMULcc_I	umulcc 	%r2, 0x0001, %r20
	.word 0xab80c004  ! 857: WR_CLEAR_SOFTINT_R	wr	%r3, %r4, %clear_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_306)) -> intp(0,1,3)
xir_0_306:
	.word 0xa9822001  ! 858: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
intveclr_0_307:
	set 0x160ed8b3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 859: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_308:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d928014  ! 860: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0x8d802000  ! 861: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_309:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7140005  ! 1: LDQF_R	-	[%r16, %r5], %f19
	.word 0xa3a00821  ! 862: FADDs	fadds	%f0, %f1, %f17
	.word 0xab818004  ! 863: WR_CLEAR_SOFTINT_R	wr	%r6, %r4, %clear_softint
	.word 0x879023b1  ! 864: WRPR_TT_I	wrpr	%r0, 0x03b1, %tt
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 865: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91952001  ! 866: WRPR_PIL_I	wrpr	%r20, 0x0001, %pil
	.word 0xa7450000  ! 867: RD_SET_SOFTINT	rd	%set_softint, %r19
DS_0_310:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 868: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
debug_0_311:
	mov 0x38, %r18
	.word 0xfef00b12  ! 869: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x89b48fe1  ! 870: FONES	e	%f4
debug_0_312:
	mov 0x38, %r18
	.word 0xfef00b12  ! 871: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc8800c00  ! 872: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc85fc000  ! 873: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x89a40d33  ! 874: FsMULd	fsmuld	%f16, %f50, %f4
	.word 0x85520000  ! 875: RDPR_PIL	rdpr	%pil, %r2
	.word 0x879022c5  ! 876: WRPR_TT_I	wrpr	%r0, 0x02c5, %tt
tagged_0_313:
	taddcctv %r17, 0x1cea, %r1
	.word 0xc407e001  ! 877: LDUW_I	lduw	[%r31 + 0x0001], %r2
debug_0_314:
	mov 0x38, %r18
	.word 0xfef00b12  ! 878: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 880: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 881: WRASI_I	wr	%r0, 0x0014, %asi
tagged_0_315:
	taddcctv %r14, 0x16c3, %r18
	.word 0xc407e001  ! 882: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x87802055  ! 883: WRASI_I	wr	%r0, 0x0055, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_316)) -> intp(0,0,15)
intvec_0_316:
	.word 0x39400001  ! 884: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 885: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_0_317:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_317:
	.word 0x8f902004  ! 886: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
tagged_0_318:
	tsubcctv %r17, 0x100e, %r11
	.word 0xc407e001  ! 887: LDUW_I	lduw	[%r31 + 0x0001], %r2
intveclr_0_319:
	set 0x66ad9c3f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 888: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc457e001  ! 889: LDSH_I	ldsh	[%r31 + 0x0001], %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_320)) -> intp(0,0,21)
intvec_0_320:
	.word 0x39400001  ! 890: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc41fe001  ! 892: LDD_I	ldd	[%r31 + 0x0001], %r2
splash_cmpr_0_321:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 893: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 894: LDX_R	ldx	[%r31 + %r0], %r2
mondo_0_322:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 895: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x8d902e29  ! 896: WRPR_PSTATE_I	wrpr	%r0, 0x0e29, %pstate
	set 0xba9012c7, %r28
	stxa %r28, [%g0] 0x73
intvec_0_323:
	.word 0x39400001  ! 897: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_324)) -> intp(0,1,3)
xir_0_324:
	.word 0xa9816001  ! 898: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0xa951c000  ! 899: RDPR_TL	<illegal instruction>
	.word 0xe847c000  ! 900: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0xa1902004  ! 901: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe917c000  ! 902: LDQF_R	-	[%r31, %r0], %f20
	.word 0xe847c000  ! 903: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0x87802089  ! 904: WRASI_I	wr	%r0, 0x0089, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_325)) -> intp(0,1,3)
xir_0_325:
	.word 0xa9842001  ! 905: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
tagged_0_326:
	tsubcctv %r15, 0x1250, %r22
	.word 0xe807e001  ! 906: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d903d5e  ! 907: WRPR_PSTATE_I	wrpr	%r0, 0x1d5e, %pstate
	.word 0xe997e001  ! 908: LDQFA_I	-	[%r31, 0x0001], %f20
	.word 0x38800001  ! 909: BGU	bgu,a	<label_0x1>
	.word 0xe88008a0  ! 910: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 911: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_327)) -> intp(0,1,3)
xir_0_327:
	.word 0xa981e001  ! 912: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xe8d7e010  ! 913: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 914: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 915: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902003  ! 916: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe8800a60  ! 917: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r20
	.word 0x8f514000  ! 918: RDPR_TBA	rdpr	%tba, %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 919: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce47c000  ! 920: LDSW_R	ldsw	[%r31 + %r0], %r7
mondo_0_328:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d930007  ! 921: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 922: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_329)) -> intp(0,1,3)
xir_0_329:
	.word 0xa982a001  ! 923: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x879022f2  ! 924: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0xa3480000  ! 925: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xe20fc000  ! 926: LDUB_R	ldub	[%r31 + %r0], %r17
DS_0_330:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x89b1c30d  ! 927: ALIGNADDRESS	alignaddr	%r7, %r13, %r4
	.word 0xa1902002  ! 928: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	set 0x41f5a353, %r28
	stxa %r28, [%g0] 0x73
intvec_0_331:
	.word 0x39400001  ! 929: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa982c001  ! 930: WR_SET_SOFTINT_R	wr	%r11, %r1, %set_softint
intveclr_0_332:
	set 0x4347b6c7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 931: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_333:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_333:
	.word 0x8f902003  ! 932: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93d02035  ! 933: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x85504000  ! 934: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x91946001  ! 935: WRPR_PIL_I	wrpr	%r17, 0x0001, %pil
DS_0_334:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 936: SAVE_R	save	%r31, %r0, %r31
	.word 0xc4d804a0  ! 937: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
debug_0_335:
	mov 0x38, %r18
	.word 0xfef00b12  ! 938: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc527e001  ! 939: STF_I	st	%f2, [0x0001, %r31]
	.word 0x93902006  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_336:
	setx 0x2084e3626f7f7963, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 941: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 942: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xad842001  ! 943: WR_SOFTINT_REG_I	wr	%r16, 0x0001, %softint
mondo_0_337:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d918004  ! 944: WRPR_WSTATE_R	wrpr	%r6, %r4, %wstate
	.word 0xc4d804a0  ! 945: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xc447c000  ! 946: LDSW_R	ldsw	[%r31 + %r0], %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_338)) -> intp(0,0,18)
intvec_0_338:
	.word 0x39400001  ! 947: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc4800c60  ! 948: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
	.word 0xc48fe010  ! 949: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_339)) -> intp(0,1,3)
xir_0_339:
	.word 0xa9802001  ! 950: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xc4d7e030  ! 951: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0x87802058  ! 952: WRASI_I	wr	%r0, 0x0058, %asi
splash_htba_0_340:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 953: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 954: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc407c000  ! 955: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0xc537c004  ! 956: STQF_R	-	%f2, [%r4, %r31]
splash_lsu_0_341:
	setx 0xf0a44a8b92b0332f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 957: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8551c000  ! 958: RDPR_TL	rdpr	%tl, %r2
tagged_0_342:
	tsubcctv %r16, 0x100f, %r5
	.word 0xc407e001  ! 959: LDUW_I	lduw	[%r31 + 0x0001], %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 960: LDX_R	ldx	[%r31 + %r0], %r2
	set 0x67d88597, %r28
	stxa %r28, [%g0] 0x73
intvec_0_343:
	.word 0x39400001  ! 961: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 962: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xa1902007  ! 963: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 964: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x22700001  ! 965: BPE	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_344)) -> intp(0,0,16)
intvec_0_344:
	.word 0x39400001  ! 966: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90353d  ! 967: WRPR_PSTATE_I	wrpr	%r0, 0x153d, %pstate
	.word 0xc527e001  ! 968: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8780201c  ! 969: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902002  ! 970: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93508000  ! 971: RDPR_TSTATE	rdpr	%tstate, %r9
debug_0_345:
	mov 0x38, %r18
	.word 0xfef00b12  ! 972: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_346:
	setx 0x7177efee3b77befd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 973: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_347:
	set 0xa472a981, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 974: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b5  ! 975: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa190200b  ! 976: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 977: LDX_R	ldx	[%r31 + %r0], %r9
splash_lsu_0_348:
	setx 0xca5ded9b92c91e57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 978: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 979: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 980: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28804a0  ! 981: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd337e001  ! 982: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x87802010  ! 983: WRASI_I	wr	%r0, 0x0010, %asi
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_349)) -> intp(0,1,3)
xir_0_349:
	.word 0xa9832001  ! 984: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_350)) -> intp(0,0,4)
intvec_0_350:
	.word 0x39400001  ! 985: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 987: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8198205e  ! 988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005e, %hpstate
DS_0_351:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3340007  ! 1: STQF_R	-	%f9, [%r7, %r16]
	normalw
	.word 0x85458000  ! 989: RD_SOFTINT_REG	rd	%softint, %r2
splash_tba_0_352:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 990: WRPR_TBA_R	wrpr	%r0, %r2, %tba
intveclr_0_353:
	set 0x7c435b88, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 991: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc44fe001  ! 992: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	ta	T_CHANGE_PRIV	! macro
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_354)) -> intp(0,0,23)
intvec_0_354:
	.word 0x39400001  ! 994: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x17a35339, %r28
	stxa %r28, [%g0] 0x73
intvec_0_355:
	.word 0x39400001  ! 995: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc4c7e030  ! 996: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
DS_0_356:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xb37aafa5	! Random illegal ?
	.word 0x87a00546  ! 1: FSQRTd	fsqrt	
	.word 0x95a08821  ! 997: FADDs	fadds	%f2, %f1, %f10
	.word 0x96d46001  ! 998: UMULcc_I	umulcc 	%r17, 0x0001, %r11
debug_0_357:
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

	.xword	0x4a8f238515bed820
	.xword	0x75be13447c624d55
	.xword	0x2af9122479d2314d
	.xword	0x095989bd6e064130
	.xword	0x6588aa9e6de9e019
	.xword	0x741333826d26e303
	.xword	0x655ce4dd2fd09fe1
	.xword	0xc18fb3ce19be2b48
	.xword	0x13321b407a1d3647
	.xword	0xaabe1255531fcc5e
	.xword	0xb981747d283ede6c
	.xword	0xaeb74544b5c57aaa
	.xword	0x0fb969f59e7463b9
	.xword	0xbd3fbd8ce68382b2
	.xword	0x2bef103f47840fca
	.xword	0x7c825e3ea18cb99b
	.xword	0xad2be683086aa03a
	.xword	0xd03cbbcd189639c8
	.xword	0xde3d6395ec146b6b
	.xword	0xeb8d54f642fd8887
	.xword	0x5f0e70218a66bef3
	.xword	0xac903710762d7981
	.xword	0x233cfeac26830fd6
	.xword	0x77beb58eb799db28
	.xword	0x1ab59aa87c32ad2e
	.xword	0x588cd95daa368cab
	.xword	0x72a61fa8b859a16d
	.xword	0x4a696b5bc153c31a
	.xword	0x4b24a37a3846be45
	.xword	0x95035c3e117e3459
	.xword	0x3a016e6bce9f44c5
	.xword	0x034d1609d4c4e2fb
	.xword	0x3735f96caa652854
	.xword	0xf98286ecbe51a810
	.xword	0x481de16ecd719b85
	.xword	0xbba5e9deece3784d
	.xword	0x1f9ab853116605ad
	.xword	0x831cd350822b5f74
	.xword	0xec7f9cffb5a6b382
	.xword	0xc230cacefaec879d
	.xword	0x20838e0d03b70d4c
	.xword	0x092543dcd545b2fd
	.xword	0xe994d1dc38615e01
	.xword	0x9de922d652bf93dd
	.xword	0x1f67fce84ee6bee7
	.xword	0x6747c5dd5be0ec8f
	.xword	0x784f8dd26ae4fbef
	.xword	0xbcd1e8185a6c4d72
	.xword	0x0404634adf44b6ad
	.xword	0x035c1c621a1433a5
	.xword	0xddbc0d16e9d5c68f
	.xword	0x12e9781aea6b9cd8
	.xword	0x8df84b6248cfea8b
	.xword	0x631e9ae4e6a158a0
	.xword	0x9d35f36cf78c3183
	.xword	0xcebfb14528037029
	.xword	0xef7b10bab0033962
	.xword	0x1c678ca5bc2686b3
	.xword	0x2f8499b3d50987e9
	.xword	0x40f806e834532bfc
	.xword	0xf23612e383bdf86b
	.xword	0x4bde12f1c46569d4
	.xword	0xbbb71a1176341b0f
	.xword	0x5f03d415a9e41759
	.xword	0x0d3502b8bbd47ab9
	.xword	0xfbadd2adaf6bbc5e
	.xword	0x638341bade81b7cc
	.xword	0x7bfbbb6fc5d8147e
	.xword	0x1e64dcc0fa9b41a9
	.xword	0x1c857afd11f4e4a5
	.xword	0x943bfc171d16d3c6
	.xword	0x49060bf683923e14
	.xword	0xd24d5bed166a93da
	.xword	0x7df37b8df42d2d31
	.xword	0xe278e4899e27da63
	.xword	0x5f5840d2c20671e4
	.xword	0xa9941ddd50f3f1ed
	.xword	0x7c018207b17ad28d
	.xword	0xcbaf7da55cecdffb
	.xword	0x8ce1c784164f27da
	.xword	0xbc2e813526f28d09
	.xword	0xb7fe31adb38a64b0
	.xword	0xa5545d0f80f2f6ff
	.xword	0x8bdceda17ed3b1ee
	.xword	0x7b525bc8a508c37f
	.xword	0xc50ee4e039b1ef38
	.xword	0x8fec80726c3c2102
	.xword	0x92b939eb09635813
	.xword	0x75baf79ad16bd4d4
	.xword	0x1f2eb4aa73a0708a
	.xword	0x2edbee3480e6d9a8
	.xword	0x9a5c7e6b31f57d8b
	.xword	0xadf2e5a5ad930c5e
	.xword	0xf5c9b4491714e55c
	.xword	0x5007888a79dc00fb
	.xword	0x67d3a7a2e3121f46
	.xword	0xd6b98c8543eacf56
	.xword	0x99f632d54f35cbb8
	.xword	0x07ff5d291376a8d6
	.xword	0xc1b18725a4dec049
	.xword	0xb1a36f1a4ad206de
	.xword	0x52dbbd3d50532f0c
	.xword	0x5cc061e56db32466
	.xword	0x9cd650c7333b5d4e
	.xword	0xee804e0847936773
	.xword	0x74702e233c12ae3c
	.xword	0xe2a3ce7902b61e93
	.xword	0x5e0df1b4a75077e5
	.xword	0x5877a82f20eb16fe
	.xword	0x30501ff14daf7561
	.xword	0xf78768da2d162515
	.xword	0x08403e2445eb6831
	.xword	0x6ae66ae0f6bfd897
	.xword	0xa1f8dc1bfc429645
	.xword	0x7e08bd67dcf84d7d
	.xword	0x47bcc62e21458fa3
	.xword	0xf4fe6b079a13346b
	.xword	0x3df95b1b636eb13b
	.xword	0x7afc80bdaa79ed32
	.xword	0xb8d46dbfab821965
	.xword	0xeb43b77adcd86ccc
	.xword	0x300013e8ca8fed8f
	.xword	0x6acb060497999974
	.xword	0x1616e14edf01b6b2
	.xword	0xcb6907d4fa356fb6
	.xword	0xc9f88c35ff0b26af
	.xword	0x810531d5703a6873
	.xword	0x5513f7d5969c0f5c
	.xword	0x56771f7787f632e2
	.xword	0x42e058aa46ebd628
	.xword	0x5767f593b7e31a10
	.xword	0x1cdd0b40a57b8856
	.xword	0xed08751694c50791
	.xword	0x8ab712fbb44ef7cd
	.xword	0xf5a3fecc9a670d8f
	.xword	0x9551f3a3ecf2bbee
	.xword	0x7429c202e333fd1b
	.xword	0xbcd0f31a984a1b6b
	.xword	0x39fdea6b95948d8b
	.xword	0x12687b955aa54910
	.xword	0xe9faea3072598623
	.xword	0x949895a1f13037ce
	.xword	0x9b20029518ea8106
	.xword	0xc23c5c775f31ab24
	.xword	0xbf41606c0b638256
	.xword	0x6695fec448ea8fe1
	.xword	0x3120bea804818218
	.xword	0x5de16725f99c3d8f
	.xword	0x68112c4a4d658102
	.xword	0xd1d9f8c6e64a1b98
	.xword	0xb613efa771ecba8b
	.xword	0xd2aca7d33fc47d2c
	.xword	0x09503a5af82c806c
	.xword	0xe7651434e80b7429
	.xword	0x329ebd5aad2c85bf
	.xword	0xdea6aac4b36c0ebe
	.xword	0x615947d3e0dbbc49
	.xword	0x91b541c2c0a2be7d
	.xword	0xce75c8452ad535c7
	.xword	0x27e79c7cb4b0e90f
	.xword	0x2897e6c816e000af
	.xword	0xf50d2d9ef66459ba
	.xword	0x6d0a13a9d2191cba
	.xword	0xb7a6f6ab4592ae4d
	.xword	0x71a9be2a175a6c5c
	.xword	0x9808472ed72378ee
	.xword	0x95ac78a0209bbc99
	.xword	0xd0e6f907cafe4a09
	.xword	0x19cf3373e80aaa4d
	.xword	0xfcbf2de060d68631
	.xword	0x5a3752a7b8aff180
	.xword	0x75105637f8199a52
	.xword	0x38827a10ce24b8dc
	.xword	0xc855103a0810c1e8
	.xword	0xadc037b0ffddbc4e
	.xword	0x848e55c64308f231
	.xword	0xe3bc12687001a9ce
	.xword	0xf8fed625216f76a7
	.xword	0x6f58eda6b8d53250
	.xword	0x6160a29c885140dd
	.xword	0x1da1b4341beb3f49
	.xword	0x9bca68cd9eef2bee
	.xword	0xf4489dea6fef9b8d
	.xword	0xe5eeec532fb58729
	.xword	0x5e5bcdf2af3876de
	.xword	0x12cb1396ec0c0e1d
	.xword	0x33de75cfbdc4d486
	.xword	0x7aa0681bb2c88ea2
	.xword	0x108f7fbe4f54d31d
	.xword	0x8f3153ebcbb6eaa9
	.xword	0x092a9394fd5cf9bb
	.xword	0x37afe3086c9b2389
	.xword	0xfe831a80feba5424
	.xword	0xf7284b46dc0a213f
	.xword	0x00f44349fd0fac87
	.xword	0x02d21efa3a5ce796
	.xword	0x0d6c651869456d59
	.xword	0x8653dabb42a348c4
	.xword	0x2b1af50fa7034eb9
	.xword	0x01690081eff6e1c7
	.xword	0x6a19d4745fc61c48
	.xword	0x03cf60eaa83115b9
	.xword	0x3756500411de7b6f
	.xword	0xef6a177856ac8e3f
	.xword	0xe4a8647c32fe5547
	.xword	0x0725b051bdb24e06
	.xword	0xfcea0e2e9bd7b872
	.xword	0xed2d26036ad59944
	.xword	0x693dac9663d4182e
	.xword	0x358d2e841a2a3455
	.xword	0xfedcedee9cf03e92
	.xword	0x56ecbad43e797bc1
	.xword	0x0178c45c8fdacfc5
	.xword	0x7482e731dfea2257
	.xword	0x3f27d08836bb4d11
	.xword	0xabd4bfb77bbb80b0
	.xword	0xc676c6fd8713e592
	.xword	0xf10ae3dfd66a6c13
	.xword	0xc48bfa77941a3771
	.xword	0x03830bcd91167a95
	.xword	0xa3cfa496d145b123
	.xword	0xa220b8c9373631fc
	.xword	0x612c4725ec950a93
	.xword	0xa8b59e383d077d08
	.xword	0xd85d27f233814e15
	.xword	0x06d7dc5468d0e4dd
	.xword	0xf9152d95d522dd8c
	.xword	0x09c470a30497f0a4
	.xword	0xb7cc368c58e7b0ee
	.xword	0xcdb3bace8f3e32ea
	.xword	0xb7f04af2dbfee0e5
	.xword	0xd1453815a989116c
	.xword	0x3a4ffca2381c9ab8
	.xword	0x2255b31440d233a2
	.xword	0x44aff8afa1d0ecd9
	.xword	0xa1b5303e44492857
	.xword	0x9126956ffe582afd
	.xword	0xc27862c22faef0fe
	.xword	0x66156eabe6e0394d
	.xword	0xfd34216a0c97617f
	.xword	0xcbfb6611487f1fb9
	.xword	0xbb6810408d58e4b9
	.xword	0x2f415bb12a181fd4
	.xword	0xd67dae2f92a14622
	.xword	0x3e02bb3c7c1eeba8
	.xword	0xaa5eb7ee798fb0be
	.xword	0x67d29215a0fb6487
	.xword	0xf6cc12753a9d8447
	.xword	0xd0866cd32c54317b
	.xword	0x5e57c6d37985b04f
	.xword	0x64e10ef74eec6525
	.xword	0x18dc99580a07b9ae
	.xword	0x4a0f5c9542dab1d2
	.xword	0xaf515cd041118be6
	.xword	0xa79ab51bd164bd8f
	.xword	0x0a9f4d7b9d0a9ab8

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

