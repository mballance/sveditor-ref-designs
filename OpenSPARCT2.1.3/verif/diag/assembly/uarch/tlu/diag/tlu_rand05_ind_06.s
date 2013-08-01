/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_06.s
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
	mov 0xb2, %r14
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
	mov 0x31, %r14
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
	mov 0x33, %r14
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
	mov 0x30, %r14
	mov 0x31, %r30
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

	.word 0x9345c000  ! 1: RD_TICK_CMPR_REG	rd	%-, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 2: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c00e80  ! 3: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x93902001  ! 4: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd21fe001  ! 5: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0xd337c00b  ! 6: STQF_R	-	%f9, [%r11, %r31]
	.word 0x2c800001  ! 7: BNEG	bneg,a	<label_0x1>
	.word 0x20800001  ! 8: BN	bn,a	<label_0x1>
	.word 0x91d020b5  ! 9: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_0_0:
	setx 0x53848e476142ebaf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81510000  ! 12: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87802004  ! 13: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 14: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902035  ! 16: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
	.word 0x93902005  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_0_1:
	taddcctv %r26, 0x1d64, %r14
	.word 0xd207e001  ! 18: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x93d02032  ! 19: Tcc_I	tne	icc_or_xcc, %r0 + 50
tagged_0_2:
	tsubcctv %r21, 0x1cab, %r15
	.word 0xd207e001  ! 20: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91696001  ! 21: SDIVX_I	sdivx	%r5, 0x0001, %r8
DS_0_4:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc3322001  ! 1: STQF_I	-	%f1, [0x0001, %r8]
	normalw
	.word 0x81458000  ! 22: RD_SOFTINT_REG	stbar
debug_0_5:
	mov 0x38, %r18
	.word 0xfef00b12  ! 23: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa350c000  ! 24: RDPR_TT	rdpr	%tt, %r17
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902333  ! 26: WRPR_TT_I	wrpr	%r0, 0x0333, %tt
splash_htba_0_6:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 27: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879020b1  ! 28: WRPR_TT_I	wrpr	%r0, 0x00b1, %tt
	.word 0x93902007  ! 29: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_7:
	setx debug_0_7 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 30: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe2c004a0  ! 31: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 32: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xab808013  ! 33: WR_CLEAR_SOFTINT_R	wr	%r2, %r19, %clear_softint
	.word 0xab84c014  ! 34: WR_CLEAR_SOFTINT_R	wr	%r19, %r20, %clear_softint
	.word 0xe337c014  ! 35: STQF_R	-	%f17, [%r20, %r31]
	.word 0x3e800001  ! 36: BVC	bvc,a	<label_0x1>
	.word 0xe20fc000  ! 37: LDUB_R	ldub	[%r31 + %r0], %r17
	.word 0xa190200c  ! 38: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200f  ! 39: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_0_8:
	setx 0x30264e563f752922, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 40: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_9:
	set 0xc77d4749, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 41: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95520000  ! 42: RDPR_PIL	rdpr	%pil, %r10
	.word 0x87902251  ! 43: WRPR_TT_I	wrpr	%r0, 0x0251, %tt
	.word 0x8d902db5  ! 44: WRPR_PSTATE_I	wrpr	%r0, 0x0db5, %pstate
	.word 0x87802014  ! 45: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879020b4  ! 46: WRPR_TT_I	wrpr	%r0, 0x00b4, %tt
	.word 0xa7480000  ! 47: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa190200e  ! 48: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa7500000  ! 49: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xa1902001  ! 50: WRPR_GL_I	wrpr	%r0, 0x0001, %-
tagged_0_10:
	tsubcctv %r21, 0x1837, %r7
	.word 0xe607e001  ! 51: LDUW_I	lduw	[%r31 + 0x0001], %r19
DS_0_11:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 52: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_0_12:
	set 0xb3940b73, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 53: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 54: SIR	sir	0x0001
mondo_0_13:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d940000  ! 55: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
	.word 0x8b500000  ! 56: RDPR_TPC	rdpr	%tpc, %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 57: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x91d02034  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_0_14:
	setx 0x60dfcda9d713f393, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 59: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_15:
	mov 8, %r18
	.word 0xe2f00852  ! 60: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
debug_0_16:
	setx debug_0_16 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 61: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8780204f  ! 62: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xca8008a0  ! 63: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xad84e001  ! 64: WR_SOFTINT_REG_I	wr	%r19, 0x0001, %softint
	.word 0x81460000  ! 65: RD_STICK_REG	stbar
	.word 0x3e700001  ! 66: BPVC	<illegal instruction>
	.word 0xcac004a0  ! 67: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0xcb1fe001  ! 68: LDDF_I	ldd	[%r31, 0x0001], %f5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 69: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 70: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_htba_0_17:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 71: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xca8008a0  ! 72: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802058  ! 73: WRASI_I	wr	%r0, 0x0058, %asi
tagged_0_18:
	tsubcctv %r5, 0x157e, %r16
	.word 0xca07e001  ! 74: LDUW_I	lduw	[%r31 + 0x0001], %r5
splash_lsu_0_19:
	setx 0xb1b5dff8890c5795, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 75: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xa9450000  ! 77: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xe8d804a0  ! 78: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_20)) -> intp(0,1,3)
xir_0_20:
	.word 0xa9832001  ! 79: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xa190200e  ! 80: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe8dfe000  ! 81: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_21)) -> intp(0,1,3)
xir_0_21:
	.word 0xa9852001  ! 82: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa190200b  ! 83: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x99902000  ! 84: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa9840011  ! 85: WR_SET_SOFTINT_R	wr	%r16, %r17, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x87902211  ! 87: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0xe8dfe030  ! 88: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	.word 0xe877c011  ! 89: STX_R	stx	%r20, [%r31 + %r17]
change_to_randtl_0_22:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_22:
	.word 0x8f902001  ! 90: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe807c000  ! 91: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x8d802004  ! 92: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_0_23:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 93: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
mondo_0_24:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d90c00a  ! 94: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0xe81fc000  ! 95: LDD_R	ldd	[%r31 + %r0], %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85696001  ! 97: SDIVX_I	sdivx	%r5, 0x0001, %r2
splash_lsu_0_26:
	setx 0xd6f9ddac7c324bfd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 98: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_27:
	taddcctv %r9, 0x1f64, %r7
	.word 0xc407e001  ! 99: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc517c000  ! 100: LDQF_R	-	[%r31, %r0], %f2
	.word 0x8d90302e  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x102e, %pstate
debug_0_28:
	setx debug_0_28 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 102: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_29:
	set 0xb00d2388, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 103: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_30:
	set 0xa492071a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_31:
	setx 0x2c0cdf2c589742ac, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 105: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_32)) -> intp(0,1,3)
xir_0_32:
	.word 0xa9832001  ! 106: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xc407c000  ! 107: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x3e700001  ! 108: BPVC	<illegal instruction>
	.word 0x93902007  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_0_33:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 110: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x99902003  ! 111: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x83454000  ! 112: RD_CLEAR_SOFTINT	rd	%clear_softint, %r1
	.word 0xa190200d  ! 113: WRPR_GL_I	wrpr	%r0, 0x000d, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_34)) -> intp(0,1,3)
xir_0_34:
	.word 0xa9816001  ! 114: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
splash_lsu_0_35:
	setx 0x6e29cf25add0d46b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 115: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 116: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0xc337c00a  ! 118: STQF_R	-	%f1, [%r10, %r31]
	.word 0xc277e001  ! 119: STX_I	stx	%r1, [%r31 + 0x0001]
	.word 0x93902001  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_0_36:
	mov 8, %r18
	.word 0xd4f00852  ! 121: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
intveclr_0_37:
	set 0xbeaf89aa, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 122: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_0_38:
	setx 0xa2fd8bdbe7ad602f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 125: BPNE	<illegal instruction>
	.word 0xc2d004a0  ! 126: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
splash_cmpr_0_39:
	setx 0xfe5b483591ad4660, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 127: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_40:
	setx 0xd6f10e3a421e4ff4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 128: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc33fc00a  ! 129: STDF_R	std	%f1, [%r10, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_41)) -> intp(0,1,3)
xir_0_41:
	.word 0xa981a001  ! 130: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	.word 0xc2800a60  ! 131: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
DS_0_42:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8fb04303  ! 132: ALIGNADDRESS	alignaddr	%r1, %r3, %r7
splash_cmpr_0_43:
	setx 0xd22541e062a25fb6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 133: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce8008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce8008a0  ! 135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcf27e001  ! 136: STF_I	st	%f7, [0x0001, %r31]
	.word 0x89454000  ! 137: RD_CLEAR_SOFTINT	rd	%clear_softint, %r4
	.word 0xc927e001  ! 138: STF_I	st	%f4, [0x0001, %r31]
DS_0_44:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3304013  ! 1: STQF_R	-	%f9, [%r19, %r1]
	normalw
	.word 0xa9458000  ! 139: RD_SOFTINT_REG	rd	%softint, %r20
splash_tba_0_45:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe89fe001  ! 141: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	.word 0x87802014  ! 142: WRASI_I	wr	%r0, 0x0014, %asi
debug_0_46:
	setx debug_0_46 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 143: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_47:
	setx 0xc0d340090f8dd684, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 144: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe937c013  ! 145: STQF_R	-	%f20, [%r19, %r31]
debug_0_48:
	mov 8, %r18
	.word 0xdaf00852  ! 146: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x81982d0d  ! 147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
intveclr_0_49:
	set 0x4c8fd2e2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_50:
	setx 0x31762b9532d1056d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 149: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_51:
	taddcctv %r9, 0x1874, %r26
	.word 0xe807e001  ! 150: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xa1902006  ! 151: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 152: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903e51  ! 153: WRPR_PSTATE_I	wrpr	%r0, 0x1e51, %pstate
	.word 0xa1902008  ! 154: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01973  ! 155: FqTOd	dis not found

	.word 0x8d90385a  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x185a, %pstate
	.word 0xa06c0012  ! 157: UDIVX_R	udivx 	%r16, %r18, %r16
debug_0_53:
	mov 0x38, %r18
	.word 0xfef00b12  ! 158: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7520000  ! 159: RDPR_PIL	rdpr	%pil, %r19
	.word 0xe60fc000  ! 160: LDUB_R	ldub	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 161: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_0_54:
	setx 0xe7144de440c0b8d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe000  ! 163: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
DS_0_55:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f18, %f28, %f28
	.word 0x8fb2430d  ! 164: ALIGNADDRESS	alignaddr	%r9, %r13, %r7
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xce5fc000  ! 165: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x82fc2001  ! 166: SDIVcc_I	sdivcc 	%r16, 0x0001, %r1
intveclr_0_56:
	set 0x88623a5a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc25fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r1
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 169: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_57:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90800b  ! 170: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
splash_htba_0_58:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 171: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_59:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 172: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc337c00b  ! 173: STQF_R	-	%f1, [%r11, %r31]
	.word 0xc24fe001  ! 174: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x93902000  ! 175: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879020ce  ! 176: WRPR_TT_I	wrpr	%r0, 0x00ce, %tt
	.word 0x91d020b5  ! 177: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xc2dfe010  ! 178: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 179: LDX_R	ldx	[%r31 + %r0], %r1
splash_cmpr_0_60:
	setx 0x78ea26a83e3c9ab1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_61:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90c00d  ! 181: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0x93902005  ! 182: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc25fe001  ! 183: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 184: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28008a0  ! 185: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x91d020b2  ! 186: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d903a1d  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x1a1d, %pstate
	.word 0x9350c000  ! 188: RDPR_TT	rdpr	%tt, %r9
	.word 0xa9804000  ! 189: WR_SET_SOFTINT_R	wr	%r1, %r0, %set_softint
	.word 0x85454000  ! 190: RD_CLEAR_SOFTINT	rd	%clear_softint, %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc45fc000  ! 191: LDX_R	ldx	[%r31 + %r0], %r2
intveclr_0_62:
	set 0xd55dc3d3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_63:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d920011  ! 193: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
debug_0_64:
	setx debug_0_64 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 194: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xad84e001  ! 196: WR_SOFTINT_REG_I	wr	%r19, 0x0001, %softint
splash_cmpr_0_65:
	setx 0xcd42995746d0783c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 197: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902102  ! 198: WRPR_TT_I	wrpr	%r0, 0x0102, %tt
	.word 0xc45fe001  ! 199: LDX_I	ldx	[%r31 + 0x0001], %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc447c000  ! 201: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x91d02034  ! 202: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d903146  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x1146, %pstate
debug_0_66:
	mov 8, %r18
	.word 0xe2f00852  ! 204: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x87802004  ! 206: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc537e001  ! 207: STQF_I	-	%f2, [0x0001, %r31]
debug_0_67:
	setx debug_0_67 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 208: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x92850013  ! 209: ADDcc_R	addcc 	%r20, %r19, %r9
	.word 0xd20fe001  ! 210: LDUB_I	ldub	[%r31 + 0x0001], %r9
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_0_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_68:
	.word 0x8f902001  ! 212: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903050  ! 213: WRPR_PSTATE_I	wrpr	%r0, 0x1050, %pstate
	.word 0xa190200c  ! 214: WRPR_GL_I	wrpr	%r0, 0x000c, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_69)) -> intp(0,1,3)
xir_0_69:
	.word 0xa9806001  ! 215: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
debug_0_70:
	setx debug_0_70 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 216: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x879021ef  ! 217: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0xd28fe030  ! 218: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
DS_0_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc5124003  ! 1: LDQF_R	-	[%r9, %r3], %f2
	.word 0x83a5082d  ! 219: FADDs	fadds	%f20, %f13, %f1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_72)) -> intp(0,1,3)
xir_0_72:
	.word 0xa9816001  ! 220: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x97464000  ! 221: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x81510000  ! 222: RDPR_TICK	<illegal instruction>
tagged_0_73:
	taddcctv %r20, 0x1f59, %r13
	.word 0xd607e001  ! 223: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x91454000  ! 224: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
intveclr_0_74:
	set 0xa71b2cf5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd11fc000  ! 226: LDDF_R	ldd	[%r31, %r0], %f8
	.word 0xd097e020  ! 227: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0x32700001  ! 228: BPNE	<illegal instruction>
	.word 0xd0cfe030  ! 229: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
splash_lsu_0_75:
	setx 0xc4507e89c16335fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 231: RD_STICK_REG	stbar
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_76)) -> intp(0,1,3)
xir_0_76:
	.word 0xa984e001  ! 232: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
intveclr_0_77:
	set 0x8d4b5550, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802004  ! 235: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd0d7e000  ! 236: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
DS_0_78:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc3350006  ! 1: STQF_R	-	%f1, [%r6, %r20]
	normalw
	.word 0xa9458000  ! 237: RD_SOFTINT_REG	rd	%softint, %r20
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_79)) -> intp(0,1,3)
xir_0_79:
	.word 0xa9802001  ! 238: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xa3a0054c  ! 239: FSQRTd	fsqrt	
	.word 0x93902005  ! 240: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe2d804a0  ! 242: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
	.word 0x24700001  ! 243: BPLE	<illegal instruction>
mondo_0_80:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d920011  ! 244: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xe2d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2c004a0  ! 246: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0xad82a001  ! 247: WR_SOFTINT_REG_I	wr	%r10, 0x0001, %softint
	.word 0x34800001  ! 248: BG	bg,a	<label_0x1>
	.word 0xad832001  ! 249: WR_SOFTINT_REG_I	wr	%r12, 0x0001, %softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_81)) -> intp(0,1,3)
xir_0_81:
	.word 0xa984e001  ! 250: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x95450000  ! 251: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xab828008  ! 252: WR_CLEAR_SOFTINT_R	wr	%r10, %r8, %clear_softint
	.word 0xd537e001  ! 253: STQF_I	-	%f10, [0x0001, %r31]
	.word 0x81460000  ! 254: RD_STICK_REG	stbar
	.word 0x87802010  ! 255: WRASI_I	wr	%r0, 0x0010, %asi
intveclr_0_82:
	set 0xd47a359d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 256: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_83:
	mov 0x38, %r18
	.word 0xfef00b12  ! 257: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802080  ! 258: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd4d7e000  ! 259: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xd527e001  ! 260: STF_I	st	%f10, [0x0001, %r31]
debug_0_84:
	mov 8, %r18
	.word 0xe4f00852  ! 261: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xd527e001  ! 262: STF_I	st	%f10, [0x0001, %r31]
	.word 0x87802088  ! 263: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d02034  ! 264: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d020b2  ! 265: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_0_85:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d924008  ! 266: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
splash_cmpr_0_86:
	setx 0xaf79f66a5da03aa8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 267: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 268: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x85500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0x93902006  ! 270: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc49fc020  ! 271: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0xa5a0054c  ! 272: FSQRTd	fsqrt	
	.word 0x81b01021  ! 273: SIAM	siam	1
	.word 0x93902002  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_87:
	mov 8, %r18
	.word 0xd0f00852  ! 275: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 276: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_88:
	setx debug_0_88 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 277: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_89:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f22, %f20
	.word 0x81b00312  ! 278: ALIGNADDRESS	alignaddr	%r0, %r18, %r0
splash_lsu_0_90:
	setx 0x952b6eeb9e36d4ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 279: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_91:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d91c014  ! 280: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0xc0d7e010  ! 281: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
mondo_0_92:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 282: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 283: FqTOd	dis not found

	.word 0xe01fc000  ! 284: LDD_R	ldd	[%r31 + %r0], %r16
splash_lsu_0_94:
	setx 0x212b15f0e49b2955, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 285: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 287: LDX_R	ldx	[%r31 + %r0], %r16
debug_0_95:
	mov 0x38, %r18
	.word 0xfef00b12  ! 288: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_96:
	mov 8, %r18
	.word 0xd2f00852  ! 289: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x93902001  ! 290: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe137e001  ! 291: STQF_I	-	%f16, [0x0001, %r31]
	.word 0xe0dfe020  ! 292: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r16
	.word 0xe0c7e000  ! 293: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0xa9480000  ! 294: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa145c000  ! 295: RD_TICK_CMPR_REG	rd	%-, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_97)) -> intp(0,1,3)
xir_0_97:
	.word 0xa9802001  ! 296: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xe0d7e020  ! 297: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
splash_lsu_0_98:
	setx 0x157fe66cad6805e9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 298: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 299: SIR	sir	0x0001
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 300: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 301: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8780204f  ! 302: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87902005  ! 303: WRPR_TT_I	wrpr	%r0, 0x0005, %tt
	.word 0xe07fe001  ! 304: SWAP_I	swap	%r16, [%r31 + 0x0001]
	.word 0x8145c000  ! 305: RD_TICK_CMPR_REG	stbar
debug_0_99:
	mov 8, %r18
	.word 0xe8f00852  ! 306: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_100)) -> intp(0,1,3)
xir_0_100:
	.word 0xa9822001  ! 307: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
	.word 0x93902004  ! 308: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_0_101:
	mov 0x38, %r18
	.word 0xfef00b12  ! 309: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8790236a  ! 310: WRPR_TT_I	wrpr	%r0, 0x036a, %tt
	.word 0x879022bb  ! 311: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0x9ad34000  ! 312: UMULcc_R	umulcc 	%r13, %r0, %r13
	.word 0xdac00e80  ! 313: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
	.word 0x9f802001  ! 314: SIR	sir	0x0001
	.word 0xa1902000  ! 315: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_0_102:
	setx 0xaf84c03701aa73e6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xda47c000  ! 317: LDSW_R	ldsw	[%r31 + %r0], %r13
DS_0_103:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 318: SAVE_R	save	%r31, %r0, %r31
	.word 0x91454000  ! 319: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 320: LDX_R	ldx	[%r31 + %r0], %r8
change_to_randtl_0_104:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_104:
	.word 0x8f902001  ! 321: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902003  ! 323: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_0_105:
	taddcctv %r17, 0x1758, %r12
	.word 0xd007e001  ! 324: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x87802063  ! 325: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802004  ! 326: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d90349b  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x149b, %pstate
splash_lsu_0_106:
	setx 0x4b35b433a4c575eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 328: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790238d  ! 329: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x87802004  ! 330: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd0c80e60  ! 331: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x8d903ad1  ! 332: WRPR_PSTATE_I	wrpr	%r0, 0x1ad1, %pstate
intveclr_0_107:
	set 0x14991ead, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_108:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d934014  ! 334: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0xd08008a0  ! 335: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95a000cc  ! 336: FNEGd	fnegd	%f12, %f10
tagged_0_109:
	taddcctv %r12, 0x1936, %r19
	.word 0xd407e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r10
debug_0_110:
	mov 0x38, %r18
	.word 0xfef00b12  ! 338: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_111:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d904014  ! 339: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
splash_htba_0_112:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 340: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02033  ! 341: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd42fe001  ! 342: STB_I	stb	%r10, [%r31 + 0x0001]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 343: LDX_R	ldx	[%r31 + %r0], %r10
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 344: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 345: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902000  ! 346: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802004  ! 347: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_0_113:
	setx 0x2b5e2e709483b13c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 348: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99520000  ! 349: RDPR_PIL	<illegal instruction>
	.word 0x8790213a  ! 350: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
splash_tba_0_114:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 351: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 352: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93902003  ! 353: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd82fe001  ! 354: STB_I	stb	%r12, [%r31 + 0x0001]
	.word 0xd8d80e80  ! 355: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0xd81fc000  ! 356: LDD_R	ldd	[%r31 + %r0], %r12
DS_0_115:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f18, %f20
	.word 0x95b34312  ! 357: ALIGNADDRESS	alignaddr	%r13, %r18, %r10
	.word 0x8790238c  ! 358: WRPR_TT_I	wrpr	%r0, 0x038c, %tt
splash_cmpr_0_116:
	setx 0x5a6d5ca0bc67960f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 359: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_117:
	setx 0x7db28c1d5b821281, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_118:
	setx debug_0_118 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 361: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_119:
	setx 0x40c8dfa75b65b826, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 362: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_120:
	mov 8, %r18
	.word 0xd0f00852  ! 363: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x87802004  ! 364: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902000  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 366: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0_121:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 367: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa1902008  ! 368: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902006  ! 369: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_0_122:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xe34b012b	! Random illegal ?
	.word 0x8ba00550  ! 1: FSQRTd	fsqrt	
	.word 0x81a48822  ! 370: FADDs	fadds	%f18, %f2, %f0
	.word 0x87802004  ! 371: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902009  ! 372: WRPR_GL_I	wrpr	%r0, 0x0009, %-
intveclr_0_123:
	set 0xf9ecae3c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 373: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_124:
	tsubcctv %r22, 0x1122, %r19
	.word 0xc007e001  ! 374: LDUW_I	lduw	[%r31 + 0x0001], %r0
mondo_0_125:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d920001  ! 375: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
splash_lsu_0_126:
	setx 0x11d0d154bf216af5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 376: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2e800001  ! 377: BVS	bvs,a	<label_0x1>
tagged_0_127:
	taddcctv %r12, 0x10eb, %r25
	.word 0xc007e001  ! 378: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0c004a0  ! 379: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0xa1902004  ! 380: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879021b8  ! 381: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
	.word 0xc137e001  ! 382: STQF_I	-	%f0, [0x0001, %r31]
debug_0_128:
	mov 0x38, %r18
	.word 0xfef00b12  ! 383: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc047c000  ! 384: LDSW_R	ldsw	[%r31 + %r0], %r0
debug_0_129:
	mov 8, %r18
	.word 0xdef00852  ! 385: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
intveclr_0_130:
	set 0x7e12b772, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 386: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 387: BPNEG	<illegal instruction>
	.word 0xc0800c60  ! 388: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r0
DS_0_131:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902007  ! 390: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_132)) -> intp(0,1,3)
xir_0_132:
	.word 0xa9842001  ! 391: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x8cf96001  ! 392: SDIVcc_I	sdivcc 	%r5, 0x0001, %r6
debug_0_133:
	setx debug_0_133 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 393: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_134:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d924007  ! 394: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	.word 0x81460000  ! 395: RD_STICK_REG	stbar
splash_lsu_0_135:
	setx 0x81ccb610a6415e7b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 396: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xccdfe000  ! 397: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0xcde7c027  ! 398: CASA_I	casa	[%r31] 0x 1, %r7, %r6
	.word 0xcc800c00  ! 399: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r6
	.word 0x93902003  ! 400: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_136:
	setx debug_0_136 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 401: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_137:
	mov 0x38, %r18
	.word 0xfef00b12  ! 402: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x88c4a001  ! 403: ADDCcc_I	addccc 	%r18, 0x0001, %r4
	.word 0x97540000  ! 404: RDPR_GL	rdpr	%-, %r11
tagged_0_138:
	tsubcctv %r21, 0x147c, %r17
	.word 0xd607e001  ! 405: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xa1902000  ! 406: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902335  ! 407: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	.word 0x87802058  ! 408: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93902007  ! 409: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7846001  ! 410: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0001, %-
	.word 0xd68fe010  ! 411: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
debug_0_139:
	setx debug_0_139 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 412: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x36800001  ! 413: BGE	bge,a	<label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 414: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_140:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xf34fe267	! Random illegal ?
	.word 0xa1a00554  ! 1: FSQRTd	fsqrt	
	.word 0x85a10832  ! 415: FADDs	fadds	%f4, %f18, %f2
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_141)) -> intp(0,1,3)
xir_0_141:
	.word 0xa984e001  ! 416: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_142)) -> intp(0,1,3)
xir_0_142:
	.word 0xa9852001  ! 417: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0x93902001  ! 418: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902000  ! 419: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc457c000  ! 420: LDSH_R	ldsh	[%r31 + %r0], %r2
splash_cmpr_0_143:
	setx 0x307707b8d11fab67, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 421: WR_STICK_REG_R	wr	%r0, %r1, %-
	ta	T_CHANGE_HPRIV	! macro
intveclr_0_144:
	set 0xcb89a1ee, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 423: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc49fc020  ! 424: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
intveclr_0_145:
	set 0x70d072bf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_146:
	setx 0xd1c198641a710eed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 426: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_147:
	mov 8, %r18
	.word 0xe2f00852  ! 427: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xc4c7e020  ! 428: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc45fc000  ! 429: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x91a00550  ! 430: FSQRTd	fsqrt	
debug_0_148:
	setx debug_0_148 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 431: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87802004  ! 432: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_0_149:
	setx 0xf6e32b41fbcab9c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 433: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_150:
	setx 0xe682b2b8fed23dbe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 434: WR_STICK_REG_R	wr	%r0, %r1, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 435: LDX_R	ldx	[%r31 + %r0], %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 436: LDX_R	ldx	[%r31 + %r0], %r8
splash_cmpr_0_151:
	setx 0x978430824db34000, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 437: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 438: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd09fc020  ! 439: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd0800ac0  ! 440: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0x879023a5  ! 441: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
splash_lsu_0_152:
	setx 0x288434dfdb468cf5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 442: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1480000  ! 443: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe09fc020  ! 444: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x34800001  ! 445: BG	bg,a	<label_0x1>
debug_0_153:
	mov 8, %r18
	.word 0xdcf00852  ! 446: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0xe09fc020  ! 447: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x879020f4  ! 448: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
splash_cmpr_0_154:
	setx 0xa11456f713894300, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99500000  ! 450: RDPR_TPC	<illegal instruction>
mondo_0_155:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d92000d  ! 451: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
	.word 0x93902002  ! 452: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_0_156:
	setx 0x777931f2d8b58391, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 454: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd93fc00d  ! 455: STDF_R	std	%f12, [%r13, %r31]
	.word 0x87902004  ! 456: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 457: LDX_R	ldx	[%r31 + %r0], %r12
splash_cmpr_0_157:
	setx 0x224a11e6f79a3620, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 458: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_158:
	set 0x689b0faf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 459: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9020c3  ! 460: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
DS_0_159:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd8900e80  ! 462: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
tagged_0_160:
	tsubcctv %r16, 0x1f26, %r2
	.word 0xd807e001  ! 463: LDUW_I	lduw	[%r31 + 0x0001], %r12
mondo_0_161:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 464: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xd89004a0  ! 465: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd89fc020  ! 466: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x91d02033  ! 467: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02035  ! 469: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9bb48fea  ! 470: FONES	e	%f13
tagged_0_162:
	tsubcctv %r1, 0x1c14, %r25
	.word 0xda07e001  ! 471: LDUW_I	lduw	[%r31 + 0x0001], %r13
debug_0_163:
	setx debug_0_163 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 472: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xdbe7c02a  ! 473: CASA_I	casa	[%r31] 0x 1, %r10, %r13
	.word 0x93902000  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xdb27c00a  ! 475: STF_R	st	%f13, [%r10, %r31]
	.word 0xa7540000  ! 476: RDPR_GL	rdpr	%-, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 477: LDX_R	ldx	[%r31 + %r0], %r19
mondo_0_164:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d900014  ! 478: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
	.word 0x8d802000  ! 479: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3a800001  ! 480: BCC	bcc,a	<label_0x1>
splash_tba_0_165:
	set 0x003d0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_0_166:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_166:
	.word 0x8f902000  ! 482: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_0_167:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcb10c006  ! 1: LDQF_R	-	[%r3, %r6], %f5
	.word 0x87a34828  ! 483: FADDs	fadds	%f13, %f8, %f3
intveclr_0_168:
	set 0x793c8200, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 484: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_169:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 485: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01971  ! 486: FqTOd	dis not found

	.word 0x8d802004  ! 487: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd65fe001  ! 488: LDX_I	ldx	[%r31 + 0x0001], %r11
intveclr_0_171:
	set 0x8bbc455a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 489: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd657c000  ! 490: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xa1902003  ! 491: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd697e000  ! 492: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x8d903427  ! 493: WRPR_PSTATE_I	wrpr	%r0, 0x1427, %pstate
DS_0_172:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7334006  ! 1: STQF_R	-	%f11, [%r6, %r13]
	normalw
	.word 0x8b458000  ! 494: RD_SOFTINT_REG	rd	%softint, %r5
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xca5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r5
mondo_0_173:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d91c00b  ! 496: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
splash_cmpr_0_174:
	setx 0x2f24f647406327f7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 497: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xca4fc000  ! 498: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x91d02035  ! 499: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196a  ! 500: FqTOd	dis not found

mondo_0_176:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d944001  ! 501: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
splash_tba_0_177:
	set 0x003f0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 502: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe6cfe010  ! 503: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r19
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 505: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 506: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x9750c000  ! 507: RDPR_TT	rdpr	%tt, %r11
	.word 0x93d020b5  ! 508: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x91d02033  ! 509: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83d020b2  ! 510: Tcc_I	te	icc_or_xcc, %r0 + 178
mondo_0_178:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d92800a  ! 511: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0xd607c000  ! 512: LDUW_R	lduw	[%r31 + %r0], %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 513: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd71fe001  ! 514: LDDF_I	ldd	[%r31, 0x0001], %f11
	.word 0xad84a001  ! 515: WR_SOFTINT_REG_I	wr	%r18, 0x0001, %softint
	.word 0x91d02035  ! 516: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 517: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902007  ! 518: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_179:
	mov 0x38, %r18
	.word 0xfef00b12  ! 519: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 520: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_0_180:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xb97b00c3	! Random illegal ?
	.word 0xe914c001  ! 1: LDQF_R	-	[%r19, %r1], %f20
	.word 0x89a14824  ! 521: FADDs	fadds	%f5, %f4, %f4
	.word 0x87902199  ! 522: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0xc81fe001  ! 523: LDD_I	ldd	[%r31 + 0x0001], %r4
debug_0_181:
	setx debug_0_181 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 524: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_182:
	setx 0x56af2a8568792872, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 525: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d90311e  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x111e, %pstate
DS_0_183:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 527: SAVE_R	save	%r31, %r0, %r31
	.word 0xc89fc020  ! 528: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 529: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 530: WRASI_I	wr	%r0, 0x001c, %asi
intveclr_0_184:
	set 0x9d7ad8cb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 531: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc807c000  ! 532: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_0_185:
	setx 0x1dcb664494d51d6f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 533: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3686001  ! 534: SDIVX_I	sdivx	%r1, 0x0001, %r17
	.word 0x93902003  ! 535: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe20fc000  ! 536: LDUB_R	ldub	[%r31 + %r0], %r17
	.word 0x91d02034  ! 537: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x34700001  ! 538: BPG	<illegal instruction>
	.word 0xa1902002  ! 539: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe2c00e60  ! 540: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r17
	.word 0x87802004  ! 541: WRASI_I	wr	%r0, 0x0004, %asi
tagged_0_187:
	taddcctv %r9, 0x19d8, %r1
	.word 0xe207e001  ! 542: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x93902003  ! 543: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_0_188:
	setx 0x699a2f35f3316170, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 544: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d902e79  ! 545: WRPR_PSTATE_I	wrpr	%r0, 0x0e79, %pstate
	.word 0x8790224a  ! 546: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
debug_0_189:
	mov 8, %r18
	.word 0xdaf00852  ! 547: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x91d020b5  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_0_190:
	set 0x26760a3c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_191:
	mov 0x38, %r18
	.word 0xfef00b12  ! 550: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87902212  ! 551: WRPR_TT_I	wrpr	%r0, 0x0212, %tt
	.word 0x3a800001  ! 552: BCC	bcc,a	<label_0x1>
	.word 0x8d802004  ! 553: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_192:
	mov 8, %r18
	.word 0xe2f00852  ! 554: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_193)) -> intp(0,1,3)
xir_0_193:
	.word 0xa9846001  ! 555: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xa1902007  ! 556: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_0_194:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_194:
	.word 0x8f902002  ! 557: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902000  ! 558: WRPR_GL_I	wrpr	%r0, 0x0000, %-
mondo_0_195:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94000a  ! 559: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	.word 0x81510000  ! 560: RDPR_TICK	rdpr	%tick, %r0
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 561: LDX_R	ldx	[%r31 + %r0], %r17
tagged_0_196:
	tsubcctv %r22, 0x1f2e, %r19
	.word 0xe207e001  ! 562: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_lsu_0_197:
	setx 0xb925657d02cd754f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 563: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 564: WRASI_I	wr	%r0, 0x0089, %asi
splash_lsu_0_198:
	setx 0x31cee40e253ddb17, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 565: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_199:
	setx 0x15665244180277e8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 566: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8d9034af  ! 567: WRPR_PSTATE_I	wrpr	%r0, 0x14af, %pstate
intveclr_0_200:
	set 0x61297fd5, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 568: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe030  ! 569: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	.word 0x99480000  ! 570: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
mondo_0_201:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d930009  ! 571: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
	.word 0xd8c7e020  ! 572: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0xd88008a0  ! 573: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x879023a6  ! 574: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
intveclr_0_202:
	set 0x8d5f0a05, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 575: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9021b2  ! 576: WRPR_PSTATE_I	wrpr	%r0, 0x01b2, %pstate
	.word 0xd8800be0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
splash_lsu_0_203:
	setx 0x39c1a5c9c8eb42eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 578: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8d7e020  ! 580: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
debug_0_204:
	mov 8, %r18
	.word 0xd2f00852  ! 581: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x93d020b3  ! 582: Tcc_I	tne	icc_or_xcc, %r0 + 179
debug_0_205:
	setx debug_0_205 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 583: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd847c000  ! 584: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x8790221a  ! 585: WRPR_TT_I	wrpr	%r0, 0x021a, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83a01969  ! 586: FqTOd	dis not found

	.word 0xc29fc020  ! 587: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
tagged_0_207:
	taddcctv %r16, 0x1114, %r4
	.word 0xc207e001  ! 588: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x87902390  ! 589: WRPR_TT_I	wrpr	%r0, 0x0390, %tt
	.word 0x93d02033  ! 590: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa8d1e001  ! 591: UMULcc_I	umulcc 	%r7, 0x0001, %r20
tagged_0_208:
	tsubcctv %r1, 0x1bf4, %r5
	.word 0xe807e001  ! 592: LDUW_I	lduw	[%r31 + 0x0001], %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 594: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe81fe001  ! 595: LDD_I	ldd	[%r31 + 0x0001], %r20
splash_cmpr_0_209:
	setx 0xcb044fc14f0470a8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 596: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_210:
	setx 0x950ef97345be77fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 597: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_0_211:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 598: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_212:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 599: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe927e001  ! 600: STF_I	st	%f20, [0x0001, %r31]
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 601: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020e4  ! 602: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
change_to_randtl_0_213:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_213:
	.word 0x8f902003  ! 603: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x81510000  ! 604: RDPR_TICK	rdpr	%tick, %r0
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_214)) -> intp(0,1,3)
xir_0_214:
	.word 0xa9812001  ! 605: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
splash_cmpr_0_215:
	setx 0xab7b94b70ac143b0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 606: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a10d24  ! 607: FsMULd	fsmuld	%f4, %f4, %f40
	.word 0x87802010  ! 608: WRASI_I	wr	%r0, 0x0010, %asi
splash_htba_0_216:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 609: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90358d  ! 610: WRPR_PSTATE_I	wrpr	%r0, 0x158d, %pstate
	.word 0xd207c000  ! 611: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0xd327c004  ! 612: STF_R	st	%f9, [%r4, %r31]
	.word 0x93902005  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
intveclr_0_217:
	set 0x5049528, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 614: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9a686001  ! 615: UDIVX_I	udivx 	%r1, 0x0001, %r13
	.word 0xda880e40  ! 616: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
	.word 0xa7b18fe9  ! 617: FONES	e	%f19
	.word 0xe64fc000  ! 618: LDSB_R	ldsb	[%r31 + %r0], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 619: LDX_R	ldx	[%r31 + %r0], %r19
debug_0_218:
	mov 0x38, %r18
	.word 0xfef00b12  ! 620: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6c7e000  ! 621: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r19
splash_cmpr_0_219:
	setx 0xe018f6fdbcd5c453, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 622: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902107  ! 623: WRPR_TT_I	wrpr	%r0, 0x0107, %tt
	.word 0xe71fc000  ! 624: LDDF_R	ldd	[%r31, %r0], %f19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 625: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x8ed0c00c  ! 626: UMULcc_R	umulcc 	%r3, %r12, %r7
	.word 0x91d02032  ! 627: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_220:
	setx debug_0_220 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 628: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xcf27c00c  ! 629: STF_R	st	%f7, [%r12, %r31]
	.word 0x97464000  ! 630: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xa5540000  ! 631: RDPR_GL	rdpr	%-, %r18
	.word 0xe48008a0  ! 632: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d802004  ! 633: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902009  ! 634: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_0_221:
	setx 0x929b0515b82606ea, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 635: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe427e001  ! 636: STW_I	stw	%r18, [%r31 + 0x0001]
mondo_0_222:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914001  ! 637: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0x28800001  ! 638: BLEU	bleu,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_223)) -> intp(0,1,3)
xir_0_223:
	.word 0xa9832001  ! 639: WR_SET_SOFTINT_I	wr	%r12, 0x0001, %set_softint
	.word 0xe51fe001  ! 640: LDDF_I	ldd	[%r31, 0x0001], %f18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902004  ! 642: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83454000  ! 643: RD_CLEAR_SOFTINT	rd	%clear_softint, %r1
	ta	T_CHANGE_PRIV	! macro
splash_tba_0_224:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 645: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_225:
	mov 8, %r18
	.word 0xdaf00852  ! 646: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0x87802004  ! 647: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 648: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_226:
	tsubcctv %r23, 0x17a3, %r21
	.word 0xc207e001  ! 649: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 650: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc327e001  ! 651: STF_I	st	%f1, [0x0001, %r31]
	.word 0xc33fe001  ! 652: STDF_I	std	%f1, [0x0001, %r31]
	.word 0xc33fc001  ! 653: STDF_R	std	%f1, [%r1, %r31]
	.word 0xa1902006  ! 654: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x83d02035  ! 655: Tcc_I	te	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_227)) -> intp(0,1,3)
xir_0_227:
	.word 0xa9802001  ! 656: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0x9b45c000  ! 657: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xdb17c000  ! 658: LDQF_R	-	[%r31, %r0], %f13
	.word 0x38800001  ! 659: BGU	bgu,a	<label_0x1>
splash_cmpr_0_228:
	setx 0x5a17d829dd0034de, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902003  ! 661: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 662: LDX_R	ldx	[%r31 + %r0], %r13
mondo_0_229:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d914007  ! 663: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0x99902001  ! 664: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902004  ! 665: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_230)) -> intp(0,1,3)
xir_0_230:
	.word 0xa9846001  ! 666: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
tagged_0_231:
	taddcctv %r25, 0x198e, %r25
	.word 0xda07e001  ! 667: LDUW_I	lduw	[%r31 + 0x0001], %r13
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 668: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_232:
	set 0x5c203eeb, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 669: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xdacfe010  ! 670: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
splash_cmpr_0_233:
	setx 0xb386192f76adfc05, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 671: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab808000  ! 672: WR_CLEAR_SOFTINT_R	wr	%r2, %r0, %clear_softint
	.word 0x9191e001  ! 673: WRPR_PIL_I	wrpr	%r7, 0x0001, %pil
	.word 0x36700001  ! 674: BPGE	<illegal instruction>
	.word 0xdacfe000  ! 675: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
debug_0_234:
	mov 8, %r18
	.word 0xe2f00852  ! 676: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0xa1902004  ! 677: WRPR_GL_I	wrpr	%r0, 0x0004, %-
debug_0_235:
	setx debug_0_235 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 678: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xda8008a0  ! 679: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790205b  ! 681: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0x8d802000  ! 682: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81460000  ! 683: RD_STICK_REG	stbar
	.word 0xa1902009  ! 684: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d903ac3  ! 685: WRPR_PSTATE_I	wrpr	%r0, 0x1ac3, %pstate
	.word 0x83d02032  ! 686: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xad82e001  ! 687: WR_SOFTINT_REG_I	wr	%r11, 0x0001, %softint
	.word 0x99902002  ! 688: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xdb27e001  ! 689: STF_I	st	%f13, [0x0001, %r31]
intveclr_0_236:
	set 0x129d69c8, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 690: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xda07c000  ! 692: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x93902007  ! 693: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802010  ! 694: WRASI_I	wr	%r0, 0x0010, %asi
debug_0_237:
	mov 8, %r18
	.word 0xd0f00852  ! 695: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
debug_0_238:
	setx debug_0_238 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 696: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 697: SIR	sir	0x0001
splash_htba_0_239:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 698: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_240:
	setx 0xd8b51578d1ed8199, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 699: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86c4a001  ! 701: ADDCcc_I	addccc 	%r18, 0x0001, %r3
	.word 0xc6c00e40  ! 702: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 704: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_0_241:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 705: WRPR_TBA_R	wrpr	%r0, %r2, %tba
debug_0_242:
	mov 0x38, %r18
	.word 0xfef00b12  ! 706: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 707: Tcc_I	te	icc_or_xcc, %r0 + 52
intveclr_0_243:
	set 0x52572781, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 708: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_0_244:
	setx 0x4dc3022c22ddcc3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 709: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d020b2  ! 711: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 712: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 713: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 714: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xc6dfe000  ! 715: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
splash_cmpr_0_245:
	setx 0x89dc419bd209bb99, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 716: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_246:
	tsubcctv %r21, 0x1b39, %r25
	.word 0xc607e001  ! 717: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc69fc020  ! 718: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_0_247:
	setx 0x855d5f055c75abe7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 719: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01974  ! 720: FqTOd	dis not found

	.word 0x879023aa  ! 721: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0x85480000  ! 722: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x89a28d21  ! 723: FsMULd	fsmuld	%f10, %f32, %f4
debug_0_249:
	mov 8, %r18
	.word 0xd2f00852  ! 724: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_tba_0_250:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 726: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_0_251:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcf34e001  ! 1: STQF_I	-	%f7, [0x0001, %r19]
	normalw
	.word 0x83458000  ! 727: RD_SOFTINT_REG	rd	%softint, %r1
debug_0_252:
	mov 8, %r18
	.word 0xe8f00852  ! 728: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x879023a5  ! 729: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
tagged_0_253:
	taddcctv %r26, 0x1d3b, %r9
	.word 0xc207e001  ! 730: LDUW_I	lduw	[%r31 + 0x0001], %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_254)) -> intp(0,1,3)
xir_0_254:
	.word 0xa982e001  ! 731: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x9945c000  ! 732: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xd937e001  ! 733: STQF_I	-	%f12, [0x0001, %r31]
	.word 0xd847e001  ! 734: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0xd8800c80  ! 735: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
debug_0_255:
	mov 8, %r18
	.word 0xdcf00852  ! 736: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x97a00571  ! 737: FSQRTq	fsqrt	
splash_cmpr_0_256:
	setx 0x452173417a2957a6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 738: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902036  ! 739: WRPR_TT_I	wrpr	%r0, 0x0036, %tt
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 740: LDX_R	ldx	[%r31 + %r0], %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_257)) -> intp(0,1,3)
xir_0_257:
	.word 0xa984e001  ! 741: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6800ac0  ! 743: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
DS_0_258:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 744: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 745: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200a  ! 746: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd797e001  ! 747: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x91d020b5  ! 748: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8ba4cdc4  ! 749: FdMULq	fdmulq	
intveclr_0_259:
	set 0x233a75c1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 750: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcacfe010  ! 751: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r5
	.word 0xcad7e000  ! 752: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	.word 0xca8008a0  ! 753: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x91d020b2  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_0_260:
	setx 0xf09f92a78a00e5ad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_0_261:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 756: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0xa190200d  ! 757: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8368a001  ! 758: SDIVX_I	sdivx	%r2, 0x0001, %r1
	.word 0x91d020b5  ! 759: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_0_263:
	mov 0x38, %r18
	.word 0xfef00b12  ! 760: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_264:
	mov 8, %r18
	.word 0xd2f00852  ! 761: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802055  ! 762: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc2d804a0  ! 763: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0x87802088  ! 764: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d903758  ! 765: WRPR_PSTATE_I	wrpr	%r0, 0x1758, %pstate
	.word 0x91d02033  ! 766: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802063  ! 767: WRASI_I	wr	%r0, 0x0063, %asi
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 769: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc23fe001  ! 770: STD_I	std	%r1, [%r31 + 0x0001]
debug_0_265:
	setx debug_0_265 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 771: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_266:
	mov 0x38, %r18
	.word 0xfef00b12  ! 772: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_267:
	set 0xa99a9cc7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 773: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 774: SIR	sir	0x0001
debug_0_268:
	setx debug_0_268 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 775: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc29fe001  ! 776: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xc2dfe000  ! 777: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
DS_0_269:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 778: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
debug_0_270:
	mov 8, %r18
	.word 0xdcf00852  ! 779: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_271)) -> intp(0,1,3)
xir_0_271:
	.word 0xa9802001  ! 780: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 781: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc28008a0  ! 782: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc247c000  ! 783: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0xc227c010  ! 784: STW_R	stw	%r1, [%r31 + %r16]
	.word 0x87802014  ! 785: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802004  ! 786: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99902000  ! 787: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d9031b0  ! 788: WRPR_PSTATE_I	wrpr	%r0, 0x11b0, %pstate
intveclr_0_272:
	set 0x744fd694, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 789: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc21fe001  ! 790: LDD_I	ldd	[%r31 + 0x0001], %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_273)) -> intp(0,1,3)
xir_0_273:
	.word 0xa981e001  ! 791: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 792: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc24fc000  ! 793: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xc2c004a0  ! 794: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xc2cfe010  ! 795: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r1
splash_lsu_0_274:
	setx 0x83c42478c7af7eeb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 796: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a349f4  ! 797: FDIVq	dis not found

	.word 0x819825c6  ! 798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c6, %hpstate
splash_cmpr_0_275:
	setx 0x6c8f916ccc7b40d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 799: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_276:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x8fb08311  ! 800: ALIGNADDRESS	alignaddr	%r2, %r17, %r7
	.word 0xce5fe001  ! 801: LDX_I	ldx	[%r31 + 0x0001], %r7
	.word 0x8d902154  ! 802: WRPR_PSTATE_I	wrpr	%r0, 0x0154, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_277)) -> intp(0,1,3)
xir_0_277:
	.word 0xa9852001  ! 803: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
debug_0_278:
	mov 0x38, %r18
	.word 0xfef00b12  ! 804: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d902386  ! 805: WRPR_PSTATE_I	wrpr	%r0, 0x0386, %pstate
	.word 0xad82e001  ! 806: WR_SOFTINT_REG_I	wr	%r11, 0x0001, %softint
	.word 0xce8008a0  ! 807: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcf27e001  ! 808: STF_I	st	%f7, [0x0001, %r31]
	.word 0xcec004a0  ! 809: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
debug_0_279:
	mov 8, %r18
	.word 0xd8f00852  ! 810: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0x91d02033  ! 811: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_0_280:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 812: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802004  ! 813: WRASI_I	wr	%r0, 0x0004, %asi
debug_0_281:
	mov 0x38, %r18
	.word 0xfef00b12  ! 814: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f454000  ! 815: RD_CLEAR_SOFTINT	rd	%clear_softint, %r7
splash_cmpr_0_282:
	setx 0x003dc3501e5a0df0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 816: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce4fc000  ! 817: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x91d020b3  ! 818: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xce4fe001  ! 819: LDSB_I	ldsb	[%r31 + 0x0001], %r7
DS_0_283:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc7314006  ! 1: STQF_R	-	%f3, [%r6, %r5]
	normalw
	.word 0x85458000  ! 820: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc48008a0  ! 821: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d90222b  ! 822: WRPR_PSTATE_I	wrpr	%r0, 0x022b, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_284)) -> intp(0,1,3)
xir_0_284:
	.word 0xa981a001  ! 823: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802063  ! 825: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc49fc020  ! 826: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
DS_0_285:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x8fa4c833  ! 827: FADDs	fadds	%f19, %f19, %f7
	.word 0x30800001  ! 828: BA	ba,a	<label_0x1>
	.word 0xcf27c013  ! 829: STF_R	st	%f7, [%r19, %r31]
debug_0_286:
	setx debug_0_286 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 830: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x95520000  ! 831: RDPR_PIL	rdpr	%pil, %r10
	.word 0xd41fc000  ! 832: LDD_R	ldd	[%r31 + %r0], %r10
debug_0_287:
	mov 0x38, %r18
	.word 0xfef00b12  ! 833: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x87802055  ! 834: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_0_288:
	setx 0x9b3efd691668dc59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 835: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_tba_0_289:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 836: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa3a00551  ! 837: FSQRTd	fsqrt	
	.word 0xa190200b  ! 838: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902299  ! 839: WRPR_PSTATE_I	wrpr	%r0, 0x0299, %pstate
DS_0_290:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x8b541459	! Random illegal ?
	.word 0xa9a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa5a30822  ! 840: FADDs	fadds	%f12, %f2, %f18
	.word 0xe4c7e030  ! 841: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r18
	.word 0xe48fe000  ! 842: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
splash_lsu_0_291:
	setx 0x81aebe28214ef997, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 844: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902098  ! 845: WRPR_TT_I	wrpr	%r0, 0x0098, %tt
	.word 0xa7812001  ! 846: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x0001, %-
mondo_0_292:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d950005  ! 847: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0xa1902000  ! 848: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe41fc000  ! 849: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x9f802001  ! 850: SIR	sir	0x0001
	.word 0xa5520000  ! 851: RDPR_PIL	rdpr	%pil, %r18
	.word 0x879021d5  ! 852: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0xa9840009  ! 853: WR_SET_SOFTINT_R	wr	%r16, %r9, %set_softint
	.word 0x93902005  ! 854: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d6aa001  ! 855: SDIVX_I	sdivx	%r10, 0x0001, %r6
	.word 0x8d9020a9  ! 856: WRPR_PSTATE_I	wrpr	%r0, 0x00a9, %pstate
	.word 0xcccfe010  ! 857: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0xcd37e001  ! 858: STQF_I	-	%f6, [0x0001, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xcc5fc000  ! 859: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x93902002  ! 860: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 861: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_294)) -> intp(0,1,3)
xir_0_294:
	.word 0xa984e001  ! 862: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
splash_cmpr_0_295:
	setx 0xa769cab15b933202, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 863: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902006  ! 864: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8745c000  ! 865: RD_TICK_CMPR_REG	rd	%-, %r3
splash_cmpr_0_296:
	setx 0x6254c0083dfdc42d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 866: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab81000c  ! 867: WR_CLEAR_SOFTINT_R	wr	%r4, %r12, %clear_softint
	.word 0xa36a4013  ! 868: SDIVX_R	sdivx	%r9, %r19, %r17
DS_0_297:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 869: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_0_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xeb41e326	! Random illegal ?
	.word 0xd3144006  ! 1: LDQF_R	-	[%r17, %r6], %f9
	.word 0x95a00826  ! 870: FADDs	fadds	%f0, %f6, %f10
	.word 0x8d9035ee  ! 871: WRPR_PSTATE_I	wrpr	%r0, 0x15ee, %pstate
	.word 0xd49fc020  ! 872: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0xd4c7e000  ! 873: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0xd40fe001  ! 874: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x87902167  ! 875: WRPR_TT_I	wrpr	%r0, 0x0167, %tt
	.word 0x9b500000  ! 876: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8d90226e  ! 877: WRPR_PSTATE_I	wrpr	%r0, 0x026e, %pstate
	.word 0xda7fe001  ! 878: SWAP_I	swap	%r13, [%r31 + 0x0001]
tagged_0_299:
	taddcctv %r23, 0x1419, %r20
	.word 0xda07e001  ! 879: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda47c000  ! 880: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x99480000  ! 881: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x91d02035  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_0_300:
	set 0x4fc2051c, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 883: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_301:
	taddcctv %r19, 0x1323, %r26
	.word 0xd807e001  ! 884: LDUW_I	lduw	[%r31 + 0x0001], %r12
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 885: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_302:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 886: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023e4  ! 887: WRPR_TT_I	wrpr	%r0, 0x03e4, %tt
	.word 0x8d902c60  ! 888: WRPR_PSTATE_I	wrpr	%r0, 0x0c60, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 889: LDX_R	ldx	[%r31 + %r0], %r12
intveclr_0_303:
	set 0xc90eafa9, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 890: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 891: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x3a800001  ! 892: BCC	bcc,a	<label_0x1>
splash_cmpr_0_304:
	setx 0xc8fcdc290cee23f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 893: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x819829cd  ! 894: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cd, %hpstate
tagged_0_305:
	taddcctv %r24, 0x1454, %r14
	.word 0xd807e001  ! 895: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_htba_0_306:
	set 0x00390000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 896: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200b  ! 897: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_0_307:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 898: SAVE_R	save	%r31, %r0, %r31
	.word 0x81510000  ! 899: RDPR_TICK	rdpr	%tick, %r0
mondo_0_308:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d944012  ! 900: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x99520000  ! 901: RDPR_PIL	rdpr	%pil, %r12
debug_0_309:
	mov 8, %r18
	.word 0xd4f00852  ! 902: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 903: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd8880e80  ! 904: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
	.word 0xd847e001  ! 905: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x93902007  ! 906: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_0_310:
	setx debug_0_310 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 907: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 908: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8780204f  ! 909: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_311:
	setx 0x6d5714a64ddd4b39, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 910: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_312:
	set 0xcbc3127a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 911: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9025eb  ! 912: WRPR_PSTATE_I	wrpr	%r0, 0x05eb, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 913: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902005  ! 914: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_0_313:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_313:
	.word 0x8f902005  ! 915: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_0_314:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 916: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_0_315:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d904000  ! 917: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 918: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 919: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd88008a0  ! 920: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x879022f1  ! 921: WRPR_TT_I	wrpr	%r0, 0x02f1, %tt
	.word 0xd8c804a0  ! 922: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_316)) -> intp(0,1,3)
xir_0_316:
	.word 0xa984a001  ! 923: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x87802063  ! 924: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa1902005  ! 925: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8780204f  ! 926: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_317:
	setx 0x2e22dde6a1b3b6cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 927: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800b60  ! 928: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
	.word 0xa1902001  ! 929: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x81460000  ! 930: RD_STICK_REG	stbar
	.word 0xd8d00e80  ! 931: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
	.word 0x8d902986  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0986, %pstate
	.word 0xa190200e  ! 933: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 934: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93d020b4  ! 935: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_cmpr_0_318:
	setx 0x7c8bbf7bd331fd09, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 936: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_319:
	taddcctv %r16, 0x1341, %r19
	.word 0xd807e001  ! 937: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_cmpr_0_320:
	setx 0x42b32a5cd3b08e34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 938: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd81fc000  ! 939: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x81982c4c  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 941: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8790232e  ! 942: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
	.word 0xd81fc000  ! 943: LDD_R	ldd	[%r31 + %r0], %r12
tagged_0_321:
	taddcctv %r10, 0x1603, %r9
	.word 0xd807e001  ! 944: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8ba40dc3  ! 945: FdMULq	fdmulq	
	.word 0xcb1fc000  ! 946: LDDF_R	ldd	[%r31, %r0], %f5
	.word 0x8d464000  ! 947: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0xa950c000  ! 948: RDPR_TT	rdpr	%tt, %r20
DS_0_322:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 949: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_0_323:
	setx 0x1047f8afaa949d45, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 950: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xb95de489	! Random illegal ?
	.word 0x91a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa3a4c834  ! 951: FADDs	fadds	%f19, %f20, %f17
intveclr_0_325:
	set 0x5ca247ca, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 952: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe2c7e030  ! 953: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r17
splash_cmpr_0_326:
	setx 0x0515212a71a46463, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 954: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_327:
	taddcctv %r20, 0x12ab, %r19
	.word 0xe207e001  ! 955: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe257e001  ! 956: LDSH_I	ldsh	[%r31 + 0x0001], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 957: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8d903c1f  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x1c1f, %pstate
	.word 0xe33fc014  ! 959: STDF_R	std	%f17, [%r20, %r31]
	.word 0x9f802001  ! 960: SIR	sir	0x0001
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 961: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 962: LDX_R	ldx	[%r31 + %r0], %r17
DS_0_328:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 963: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa190200f  ! 964: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 965: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8d9031f9  ! 966: WRPR_PSTATE_I	wrpr	%r0, 0x11f9, %pstate
	.word 0x36800001  ! 967: BGE	bge,a	<label_0x1>
	.word 0x9753c000  ! 968: RDPR_FQ	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 969: LDX_R	ldx	[%r31 + %r0], %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 970: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 971: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d903cff  ! 972: WRPR_PSTATE_I	wrpr	%r0, 0x1cff, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 973: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_329)) -> intp(0,1,3)
xir_0_329:
	.word 0xa982a001  ! 974: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0xa190200f  ! 975: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd6c7e030  ! 976: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
splash_htba_0_330:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 977: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 978: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 979: LDX_R	ldx	[%r31 + %r0], %r11
debug_0_331:
	setx debug_0_331 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 980: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x9f802001  ! 981: SIR	sir	0x0001
splash_lsu_0_332:
	setx 0xf3e1f5dc12453aa5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 982: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 983: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902888  ! 984: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0x879020cc  ! 985: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_333)) -> intp(0,1,3)
xir_0_333:
	.word 0xa982e001  ! 986: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
intveclr_0_334:
	set 0x7d1c8944, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 987: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3464000  ! 988: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8d9037c1  ! 989: WRPR_PSTATE_I	wrpr	%r0, 0x17c1, %pstate
mondo_0_335:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 990: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xa5464000  ! 991: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0x38700001  ! 992: BPGU	<illegal instruction>
	.word 0x8d902fa9  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x0fa9, %pstate
	.word 0xe51fe001  ! 994: LDDF_I	ldd	[%r31, 0x0001], %f18
tagged_0_336:
	tsubcctv %r14, 0x10df, %r12
	.word 0xe407e001  ! 995: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe43fe001  ! 996: STD_I	std	%r18, [%r31 + 0x0001]
	.word 0xa190200d  ! 997: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902367  ! 998: WRPR_TT_I	wrpr	%r0, 0x0367, %tt
	.word 0x87802020  ! 999: WRASI_I	wr	%r0, 0x0020, %asi
splash_htba_0_337:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1000: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903713  ! 1001: WRPR_PSTATE_I	wrpr	%r0, 0x1713, %pstate
splash_htba_0_338:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1002: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe4cfe020  ! 1003: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
	.word 0x8d902e4f  ! 1004: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
splash_lsu_0_339:
	setx 0x5157464a25b213dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1005: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe597e001  ! 1006: LDQFA_I	-	[%r31, 0x0001], %f18
debug_0_340:
	setx debug_0_340 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1007: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1902008  ! 1008: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_0_341:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d920004  ! 1009: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1010: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe437e001  ! 1011: STH_I	sth	%r18, [%r31 + 0x0001]
	.word 0xa1520000  ! 1012: RDPR_PIL	rdpr	%pil, %r16
intveclr_0_342:
	set 0xce21fcc7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1013: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_343:
	setx debug_0_343 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1014: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8790220a  ! 1015: WRPR_TT_I	wrpr	%r0, 0x020a, %tt
debug_0_344:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1016: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe0c804a0  ! 1017: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
mondo_0_345:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 1018: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
DS_0_346:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1019: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_347:
	setx 0x2fa94a487d93082b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1020: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9084a001  ! 1021: ADDcc_I	addcc 	%r18, 0x0001, %r8
	.word 0x9f802001  ! 1022: SIR	sir	0x0001
	.word 0xa190200a  ! 1023: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8ba249cc  ! 1024: FDIVd	fdivd	%f40, %f12, %f36
tagged_0_348:
	tsubcctv %r24, 0x1f44, %r5
	.word 0xca07e001  ! 1025: LDUW_I	lduw	[%r31 + 0x0001], %r5
change_to_randtl_0_349:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_349:
	.word 0x8f902003  ! 1026: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_0_350:
	setx 0x9f9e7b54ef7299ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1027: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1028: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xca8fe020  ! 1029: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
tagged_0_351:
	taddcctv %r18, 0x1930, %r15
	.word 0xca07e001  ! 1030: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x34800001  ! 1031: BG	bg,a	<label_0x1>
tagged_0_352:
	tsubcctv %r11, 0x1a67, %r24
	.word 0xca07e001  ! 1032: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xcad004a0  ! 1033: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x8d903673  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x1673, %pstate
	.word 0x87902244  ! 1035: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
	.word 0xa9808001  ! 1036: WR_SET_SOFTINT_R	wr	%r2, %r1, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_353)) -> intp(0,1,3)
xir_0_353:
	.word 0xa982a001  ! 1037: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
	.word 0x2c700001  ! 1038: BPNEG	<illegal instruction>
	.word 0x87802089  ! 1039: WRASI_I	wr	%r0, 0x0089, %asi
debug_0_354:
	mov 8, %r18
	.word 0xe2f00852  ! 1040: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
	.word 0x28700001  ! 1041: BPLEU	<illegal instruction>
	.word 0xab828010  ! 1042: WR_CLEAR_SOFTINT_R	wr	%r10, %r16, %clear_softint
intveclr_0_355:
	set 0x9c2d049a, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1043: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xcb17c000  ! 1044: LDQF_R	-	[%r31, %r0], %f5
	.word 0x8d9024e5  ! 1045: WRPR_PSTATE_I	wrpr	%r0, 0x04e5, %pstate
	.word 0xca1fc000  ! 1046: LDD_R	ldd	[%r31 + %r0], %r5
DS_0_356:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f12, %f0
	.word 0x91b48309  ! 1047: ALIGNADDRESS	alignaddr	%r18, %r9, %r8
	.word 0x83d02034  ! 1048: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa1902009  ! 1049: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8ba249a8  ! 1050: FDIVs	fdivs	%f9, %f8, %f5
	.word 0xcad804a0  ! 1051: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0xca97e030  ! 1052: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r5
	.word 0xad852001  ! 1053: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	.word 0x9b520000  ! 1054: RDPR_PIL	<illegal instruction>
	.word 0x91d02035  ! 1055: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_0_357:
	setx 0x31eed52b0ff66771, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1056: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba44dc9  ! 1057: FdMULq	fdmulq	
mondo_0_358:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d92400a  ! 1058: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 1059: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa190200b  ! 1060: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_0_359:
	setx 0x63bdffc37273e6e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1061: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1062: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda4fe001  ! 1063: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x9ba00551  ! 1064: FSQRTd	fsqrt	
	.word 0xda3fc011  ! 1065: STD_R	std	%r13, [%r31 + %r17]
	.word 0xdb1fc000  ! 1066: LDDF_R	ldd	[%r31, %r0], %f13
splash_lsu_0_360:
	setx 0x38c628fcbbd7cb89, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1067: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_361:
	set 0x64279497, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1068: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa6c52001  ! 1069: ADDCcc_I	addccc 	%r20, 0x0001, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 1070: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x91540000  ! 1071: RDPR_GL	rdpr	%-, %r8
	.word 0xd08008a0  ! 1072: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
mondo_0_362:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90c006  ! 1073: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
DS_0_363:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x87b4c30b  ! 1074: ALIGNADDRESS	alignaddr	%r19, %r11, %r3
	.word 0xc6d804a0  ! 1075: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
splash_tba_0_364:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1076: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6d004a0  ! 1077: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
splash_tba_0_365:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1078: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9029b0  ! 1079: WRPR_PSTATE_I	wrpr	%r0, 0x09b0, %pstate
	.word 0x879020a7  ! 1080: WRPR_TT_I	wrpr	%r0, 0x00a7, %tt
DS_0_366:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x83b48309  ! 1081: ALIGNADDRESS	alignaddr	%r18, %r9, %r1
	.word 0x82d5000c  ! 1082: UMULcc_R	umulcc 	%r20, %r12, %r1
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc25fc000  ! 1083: LDX_R	ldx	[%r31 + %r0], %r1
debug_0_367:
	setx debug_0_367 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1084: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
tagged_0_368:
	tsubcctv %r21, 0x1cd2, %r15
	.word 0xc207e001  ! 1086: LDUW_I	lduw	[%r31 + 0x0001], %r1
mondo_0_369:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 1087: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
tagged_0_370:
	tsubcctv %r11, 0x1f37, %r19
	.word 0xc207e001  ! 1088: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_cmpr_0_371:
	setx 0xc9741db065679923, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1089: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_372:
	mov 8, %r18
	.word 0xd6f00852  ! 1090: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0xc28008a0  ! 1091: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x87802004  ! 1092: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021e2  ! 1093: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	.word 0x93902002  ! 1094: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902350  ! 1095: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
mondo_0_373:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d948013  ! 1096: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
debug_0_374:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1097: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02032  ! 1098: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_lsu_0_375:
	setx 0x6f4eb886eb87f7b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1099: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_376:
	setx debug_0_376 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1100: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0xc257c000  ! 1102: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0xc227e001  ! 1103: STW_I	stw	%r1, [%r31 + 0x0001]
	.word 0x879022f4  ! 1104: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
	.word 0x91d02034  ! 1105: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x32700001  ! 1106: BPNE	<illegal instruction>
	.word 0x879021b7  ! 1107: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0xad826001  ! 1108: WR_SOFTINT_REG_I	wr	%r9, 0x0001, %softint
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8fa01962  ! 1109: FqTOd	dis not found

	.word 0x879021db  ! 1110: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
debug_0_378:
	mov 8, %r18
	.word 0xe4f00852  ! 1111: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0x8d90305c  ! 1112: WRPR_PSTATE_I	wrpr	%r0, 0x105c, %pstate
	.word 0xcec7e010  ! 1113: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1114: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_379:
	taddcctv %r1, 0x18cd, %r21
	.word 0xce07e001  ! 1115: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xa1500000  ! 1116: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa190200a  ! 1117: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe0800b20  ! 1118: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r16
	.word 0xe0c00e40  ! 1119: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r16
	.word 0x8b50c000  ! 1120: RDPR_TT	rdpr	%tt, %r5
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1121: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_380:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1122: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8d480000  ! 1123: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
DS_0_381:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1124: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcc4fe001  ! 1125: LDSB_I	ldsb	[%r31 + 0x0001], %r6
intveclr_0_382:
	set 0x766bbb16, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1126: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_383:
	set 0xe1a79a03, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1127: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x879021d2  ! 1128: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
debug_0_384:
	mov 8, %r18
	.word 0xe6f00852  ! 1129: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x9f802001  ! 1130: SIR	sir	0x0001
	.word 0xcc57e001  ! 1131: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0xcc9fe001  ! 1132: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x93902001  ! 1133: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902001  ! 1134: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xcc8fe010  ! 1135: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
debug_0_385:
	setx debug_0_385 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1136: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_386:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1139: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_387:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1140: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790226a  ! 1141: WRPR_TT_I	wrpr	%r0, 0x026a, %tt
	.word 0x91912001  ! 1142: WRPR_PIL_I	wrpr	%r4, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_388)) -> intp(0,1,3)
xir_0_388:
	.word 0xa9802001  ! 1143: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
debug_0_389:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1144: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
tagged_0_390:
	tsubcctv %r21, 0x1308, %r25
	.word 0xcc07e001  ! 1145: LDUW_I	lduw	[%r31 + 0x0001], %r6
debug_0_391:
	setx debug_0_391 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1146: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 1147: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_0_392:
	tsubcctv %r8, 0x1f15, %r14
	.word 0xcc07e001  ! 1148: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x93540000  ! 1149: RDPR_GL	<illegal instruction>
	.word 0xa1902009  ! 1150: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91952001  ! 1151: WRPR_PIL_I	wrpr	%r20, 0x0001, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa969a001  ! 1152: SDIVX_I	sdivx	%r6, 0x0001, %r20
mondo_0_394:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d948004  ! 1153: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
splash_lsu_0_395:
	setx 0x50b7970568b0aaeb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 1155: WRPR_GL_I	wrpr	%r0, 0x000d, %-
intveclr_0_396:
	set 0xd4478a7, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_397:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8fa00551  ! 1: FSQRTd	fsqrt	
	.word 0x99a30834  ! 1157: FADDs	fadds	%f12, %f20, %f12
	.word 0xd89fc020  ! 1158: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xa190200d  ! 1159: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200c  ! 1160: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd8800bc0  ! 1161: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r12
tagged_0_398:
	tsubcctv %r10, 0x1a66, %r5
	.word 0xd807e001  ! 1162: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd8c80e60  ! 1163: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r12
debug_0_399:
	mov 8, %r18
	.word 0xd0f00852  ! 1164: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0x8d9038b7  ! 1165: WRPR_PSTATE_I	wrpr	%r0, 0x18b7, %pstate
tagged_0_400:
	tsubcctv %r19, 0x1082, %r13
	.word 0xd807e001  ! 1166: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_lsu_0_401:
	setx 0xce1270e943dd454b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 1168: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_0_402:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904012  ! 1169: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
debug_0_403:
	setx debug_0_403 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1170: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1171: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 1172: WRASI_I	wr	%r0, 0x0055, %asi
intveclr_0_404:
	set 0x8f335f0f, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x85520000  ! 1174: RDPR_PIL	rdpr	%pil, %r2
	.word 0xc41fe001  ! 1175: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x83520000  ! 1176: RDPR_PIL	rdpr	%pil, %r1
	.word 0xc29fc020  ! 1177: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0xab81c00a  ! 1178: WR_CLEAR_SOFTINT_R	wr	%r7, %r10, %clear_softint
	.word 0x8ba1c9eb  ! 1179: FDIVq	dis not found

intveclr_0_405:
	set 0xea72f83d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1180: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba01966  ! 1181: FqTOd	dis not found

	.word 0x9f802001  ! 1182: SIR	sir	0x0001
	.word 0x93902002  ! 1183: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_407:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1184: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_408:
	mov 8, %r18
	.word 0xe8f00852  ! 1185: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x2c800001  ! 1186: BNEG	bneg,a	<label_0x1>
	.word 0x99902003  ! 1187: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x924c0012  ! 1188: MULX_R	mulx 	%r16, %r18, %r9
	.word 0x91d02032  ! 1189: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02034  ! 1190: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd2c7e030  ! 1191: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xd29004a0  ! 1192: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
tagged_0_409:
	taddcctv %r4, 0x1df0, %r25
	.word 0xd207e001  ! 1193: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xa0d32001  ! 1194: UMULcc_I	umulcc 	%r12, 0x0001, %r16
	.word 0x84d04011  ! 1195: UMULcc_R	umulcc 	%r1, %r17, %r2
	.word 0x81450000  ! 1196: RD_SET_SOFTINT	stbar
	.word 0xc0c804a0  ! 1197: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x87802063  ! 1198: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc03fe001  ! 1199: STD_I	std	%r0, [%r31 + 0x0001]
debug_0_410:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1200: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
DS_0_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1201: SAVE_R	save	%r31, %r0, %r31
	.word 0xa3454000  ! 1202: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x91d02032  ! 1203: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_0_412:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d908011  ! 1204: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0x8945c000  ! 1205: RD_TICK_CMPR_REG	rd	%-, %r4
splash_tba_0_413:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1206: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902002  ! 1207: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc8dfe030  ! 1208: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r4
	.word 0xc8c00e60  ! 1209: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r4
	.word 0xc8c00e60  ! 1210: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r4
	.word 0x93902003  ! 1211: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc91fe001  ! 1212: LDDF_I	ldd	[%r31, 0x0001], %f4
DS_0_414:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc534c008  ! 1: STQF_R	-	%f2, [%r8, %r19]
	normalw
	.word 0x85458000  ! 1213: RD_SOFTINT_REG	rd	%softint, %r2
tagged_0_415:
	taddcctv %r18, 0x115f, %r26
	.word 0xc407e001  ! 1214: LDUW_I	lduw	[%r31 + 0x0001], %r2
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1215: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90326f  ! 1216: WRPR_PSTATE_I	wrpr	%r0, 0x126f, %pstate
DS_0_416:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1217: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xc42fc008  ! 1218: STB_R	stb	%r2, [%r31 + %r8]
mondo_0_417:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92c00c  ! 1219: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
debug_0_418:
	setx debug_0_418 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1220: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc447c000  ! 1221: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0xab84c006  ! 1222: WR_CLEAR_SOFTINT_R	wr	%r19, %r6, %clear_softint
	.word 0xa9520000  ! 1223: RDPR_PIL	<illegal instruction>
splash_cmpr_0_419:
	setx 0x2e638eed65043e8a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1224: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe89fc020  ! 1225: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1226: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8d80e80  ! 1227: LDXA_R	ldxa	[%r0, %r0] 0x74, %r20
mondo_0_420:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d950014  ! 1228: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xe8800c00  ! 1229: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
	.word 0xa550c000  ! 1230: RDPR_TT	rdpr	%tt, %r18
mondo_0_421:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 1231: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0x93902004  ! 1232: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d903aeb  ! 1233: WRPR_PSTATE_I	wrpr	%r0, 0x1aeb, %pstate
	.word 0xe4d00e40  ! 1234: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r18
	.word 0xe4c00e80  ! 1235: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r18
splash_htba_0_422:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1236: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xab82c00c  ! 1237: WR_CLEAR_SOFTINT_R	wr	%r11, %r12, %clear_softint
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_423:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1239: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8da000c2  ! 1240: FNEGd	fnegd	%f2, %f6
	.word 0xa753c000  ! 1241: RDPR_FQ	<illegal instruction>
	.word 0xab82c009  ! 1242: WR_CLEAR_SOFTINT_R	wr	%r11, %r9, %clear_softint
	.word 0x87802063  ! 1243: WRASI_I	wr	%r0, 0x0063, %asi
tagged_0_424:
	tsubcctv %r6, 0x1f1a, %r6
	.word 0xe607e001  ! 1244: LDUW_I	lduw	[%r31 + 0x0001], %r19
mondo_0_425:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91c014  ! 1245: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
splash_cmpr_0_426:
	setx 0x3bea971f72ea1845, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1246: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x28800001  ! 1247: BLEU	bleu,a	<label_0x1>
	.word 0x93902003  ! 1248: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_0_427:
	set 0x163c5cad, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68fe030  ! 1250: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
	.word 0x81b01021  ! 1251: SIAM	siam	1
debug_0_428:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_429:
	setx 0x56cb25673bfd92d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1253: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe61fe001  ! 1254: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0xe68008a0  ! 1255: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1256: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 1257: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe727e001  ! 1258: STF_I	st	%f19, [0x0001, %r31]
	.word 0x9f802001  ! 1259: SIR	sir	0x0001
	.word 0x9b480000  ! 1260: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
intveclr_0_430:
	set 0xe46f6e39, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1261: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_431:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 1262: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
debug_0_432:
	mov 8, %r18
	.word 0xd2f00852  ! 1263: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_433)) -> intp(0,1,3)
xir_0_433:
	.word 0xa9846001  ! 1264: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	.word 0xda9fc020  ! 1265: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
tagged_0_434:
	tsubcctv %r23, 0x19d5, %r13
	.word 0xda07e001  ! 1266: LDUW_I	lduw	[%r31 + 0x0001], %r13
DS_0_435:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1267: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
debug_0_436:
	setx debug_0_436 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1268: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200f  ! 1270: WRPR_GL_I	wrpr	%r0, 0x000f, %-
intveclr_0_437:
	set 0x31bd80f2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1271: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_0_438:
	tsubcctv %r10, 0x1098, %r2
	.word 0xda07e001  ! 1272: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda77c010  ! 1273: STX_R	stx	%r13, [%r31 + %r16]
	.word 0x8f45c000  ! 1274: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x81510000  ! 1275: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02033  ! 1276: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_0_439:
	setx 0xeb19ce42a11e3936, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1277: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xce27e001  ! 1278: STW_I	stw	%r7, [%r31 + 0x0001]
DS_0_440:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f4, %f10, %f4
	.word 0x97b0c30a  ! 1279: ALIGNADDRESS	alignaddr	%r3, %r10, %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 1280: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd71fe001  ! 1281: LDDF_I	ldd	[%r31, 0x0001], %f11
	.word 0xd727e001  ! 1282: STF_I	st	%f11, [0x0001, %r31]
	.word 0x93902003  ! 1283: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_0_441:
	setx 0xccc306a04654fb07, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1284: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_442:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1285: SAVE_R	save	%r31, %r0, %r31
debug_0_443:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1286: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x81982b55  ! 1287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0x91d02032  ! 1288: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9b540000  ! 1289: RDPR_GL	rdpr	%-, %r13
DS_0_444:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b50307  ! 1290: ALIGNADDRESS	alignaddr	%r20, %r7, %r11
splash_cmpr_0_445:
	setx 0xc497209e771dde6a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1291: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_446)) -> intp(0,1,3)
xir_0_446:
	.word 0xa9846001  ! 1292: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
splash_lsu_0_447:
	setx 0xb209f483272533fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1293: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 1294: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802020  ! 1295: WRASI_I	wr	%r0, 0x0020, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 1296: LDX_R	ldx	[%r31 + %r0], %r11
tagged_0_448:
	tsubcctv %r7, 0x11b7, %r22
	.word 0xd607e001  ! 1297: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 1298: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd73fc007  ! 1299: STDF_R	std	%f11, [%r7, %r31]
debug_0_449:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1300: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd64fc000  ! 1301: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd627c007  ! 1302: STW_R	stw	%r11, [%r31 + %r7]
debug_0_450:
	mov 8, %r18
	.word 0xdcf00852  ! 1303: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	ta	T_CHANGE_PRIV	! macro
debug_0_451:
	setx debug_0_451 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1305: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	ta	T_CHANGE_PRIV	! macro
	.word 0xd727c007  ! 1307: STF_R	st	%f11, [%r7, %r31]
	.word 0x8790220f  ! 1308: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
splash_lsu_0_452:
	setx 0x30b76d6aad163aad, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1309: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 1310: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x87902024  ! 1311: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0xa1902000  ! 1312: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xda2fc007  ! 1313: STB_R	stb	%r13, [%r31 + %r7]
	.word 0x8d903814  ! 1314: WRPR_PSTATE_I	wrpr	%r0, 0x1814, %pstate
splash_cmpr_0_453:
	setx 0x0e4e60d06401d2ad, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1315: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_454:
	tsubcctv %r7, 0x1fb0, %r10
	.word 0xda07e001  ! 1316: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda8fe010  ! 1317: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0xa3454000  ! 1318: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xa5520000  ! 1319: RDPR_PIL	<illegal instruction>
splash_cmpr_0_455:
	setx 0xed6628e6895e7e74, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1320: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe4dfe000  ! 1321: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
intveclr_0_456:
	set 0x75d723bf, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5540000  ! 1323: RDPR_GL	rdpr	%-, %r18
DS_0_457:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1324: SAVE_R	save	%r31, %r0, %r31
	.word 0xe4d00e80  ! 1325: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
DS_0_458:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1326: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe4d7e020  ! 1327: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0xe497e030  ! 1328: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_459)) -> intp(0,1,3)
xir_0_459:
	.word 0xa9852001  ! 1329: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xa1902006  ! 1330: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 1332: LDX_R	ldx	[%r31 + %r0], %r18
intveclr_0_460:
	set 0xcbc6d589, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe49fe001  ! 1334: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0xe457c000  ! 1335: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xe4d7e030  ! 1336: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	.word 0xe4d804a0  ! 1337: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x97464000  ! 1338: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x93902006  ! 1339: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81510000  ! 1341: RDPR_TICK	rdpr	%tick, %r0
	.word 0xd69fc020  ! 1342: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
DS_0_461:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1343: SAVE_R	save	%r31, %r0, %r31
DS_0_462:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xdf75333f	! Random illegal ?
	.word 0xe7130011  ! 1: LDQF_R	-	[%r12, %r17], %f19
	.word 0x81a0c824  ! 1344: FADDs	fadds	%f3, %f4, %f0
	.word 0x87902063  ! 1345: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_463)) -> intp(0,1,3)
xir_0_463:
	.word 0xa9812001  ! 1346: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xa7500000  ! 1347: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 1348: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_464:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1349: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87802063  ! 1350: WRASI_I	wr	%r0, 0x0063, %asi
DS_0_465:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe934e001  ! 1: STQF_I	-	%f20, [0x0001, %r19]
	normalw
	.word 0x91458000  ! 1351: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd01fc000  ! 1352: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0x87902268  ! 1353: WRPR_TT_I	wrpr	%r0, 0x0268, %tt
	.word 0xa1902002  ! 1354: WRPR_GL_I	wrpr	%r0, 0x0002, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_466)) -> intp(0,1,3)
xir_0_466:
	.word 0xa9806001  ! 1355: WR_SET_SOFTINT_I	wr	%r1, 0x0001, %set_softint
	.word 0x9f802001  ! 1356: SIR	sir	0x0001
	.word 0xd01fc000  ! 1357: LDD_R	ldd	[%r31 + %r0], %r8
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_467)) -> intp(0,1,3)
xir_0_467:
	.word 0xa9842001  ! 1358: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xd08008a0  ! 1359: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa345c000  ! 1360: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x91d02032  ! 1361: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_0_468:
	tsubcctv %r9, 0x159c, %r9
	.word 0xe207e001  ! 1362: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_lsu_0_469:
	setx 0x4fe83ec9210e5299, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1363: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_470:
	set 0x64e134f3, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_0_471:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1365: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8f454000  ! 1366: RD_CLEAR_SOFTINT	rd	%clear_softint, %r7
debug_0_472:
	setx debug_0_472 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1367: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x87902228  ! 1368: WRPR_TT_I	wrpr	%r0, 0x0228, %tt
debug_0_473:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1369: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xced80e40  ! 1370: LDXA_R	ldxa	[%r0, %r0] 0x72, %r7
	.word 0x91d02034  ! 1371: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200f  ! 1372: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xcec004a0  ! 1373: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
intveclr_0_474:
	set 0xb0758f33, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 1375: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x85450000  ! 1376: RD_SET_SOFTINT	rd	%set_softint, %r2
	.word 0x8d902915  ! 1377: WRPR_PSTATE_I	wrpr	%r0, 0x0915, %pstate
	.word 0xc41fe001  ! 1378: LDD_I	ldd	[%r31 + 0x0001], %r2
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1379: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 1380: BPN	<illegal instruction>
	.word 0xa1902004  ! 1381: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1382: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 1383: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81b01021  ! 1384: SIAM	siam	1
	.word 0xa190200a  ! 1385: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc40fe001  ! 1386: LDUB_I	ldub	[%r31 + 0x0001], %r2
DS_0_475:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a00547  ! 1: FSQRTd	fsqrt	
	.word 0xa1a40821  ! 1387: FADDs	fadds	%f16, %f1, %f16
	.word 0x8d902801  ! 1388: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
splash_cmpr_0_476:
	setx 0x3fd179df0ed48f46, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1389: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_477:
	set 0x3c4373d4, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1390: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe09fe001  ! 1391: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0xe197e001  ! 1392: LDQFA_I	-	[%r31, 0x0001], %f16
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe0800c20  ! 1394: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
mondo_0_478:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d90c008  ! 1395: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x93902006  ! 1396: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982a86  ! 1397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a86, %hpstate
	.word 0xa190200c  ! 1398: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe00fe001  ! 1399: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0xe01fe001  ! 1400: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0xe09fe001  ! 1401: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
DS_0_479:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe135000b  ! 1: STQF_R	-	%f16, [%r11, %r20]
	normalw
	.word 0x85458000  ! 1402: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc49fe001  ! 1403: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0xc48804a0  ! 1404: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fe001  ! 1405: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x8284000d  ! 1406: ADDcc_R	addcc 	%r16, %r13, %r1
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_480)) -> intp(0,1,3)
xir_0_480:
	.word 0xa9842001  ! 1407: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xc23fc00d  ! 1408: STD_R	std	%r1, [%r31 + %r13]
	.word 0xa1902000  ! 1409: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa6c0e001  ! 1410: ADDCcc_I	addccc 	%r3, 0x0001, %r19
debug_0_481:
	setx debug_0_481 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1411: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6880e60  ! 1412: LDUBA_R	lduba	[%r0, %r0] 0x73, %r19
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1413: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe737e001  ! 1414: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xe64fc000  ! 1415: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xa982c013  ! 1416: WR_SET_SOFTINT_R	wr	%r11, %r19, %set_softint
	.word 0x8d540000  ! 1417: RDPR_GL	<illegal instruction>
	.word 0x879022d2  ! 1418: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0xcc800aa0  ! 1419: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r6
	.word 0xad82a001  ! 1420: WR_SOFTINT_REG_I	wr	%r10, 0x0001, %softint
	.word 0xcd37e001  ! 1421: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x9b454000  ! 1422: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
DS_0_482:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1423: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_0_483:
	setx 0xe228b5960dd2529b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1424: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99902001  ! 1425: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_0_484:
	setx 0xa0d65a50bd274f72, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1426: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_485:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1427: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_0_486:
	set 0x6b078d14, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_487:
	setx debug_0_487 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1429: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x86ac800d  ! 1430: ANDNcc_R	andncc 	%r18, %r13, %r3
splash_cmpr_0_488:
	setx 0xa4332ee0ba4131bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1431: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_489)) -> intp(0,1,3)
xir_0_489:
	.word 0xa9822001  ! 1432: WR_SET_SOFTINT_I	wr	%r8, 0x0001, %set_softint
debug_0_490:
	setx debug_0_490 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1433: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903aab  ! 1434: WRPR_PSTATE_I	wrpr	%r0, 0x1aab, %pstate
	.word 0xc68008a0  ! 1435: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_491)) -> intp(0,1,3)
xir_0_491:
	.word 0xa9812001  ! 1436: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
debug_0_492:
	mov 8, %r18
	.word 0xd8f00852  ! 1437: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xc71fe001  ! 1438: LDDF_I	ldd	[%r31, 0x0001], %f3
	.word 0xc65fe001  ! 1439: LDX_I	ldx	[%r31 + 0x0001], %r3
intveclr_0_493:
	set 0x524ad34d, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_494:
	setx 0xe0c4a41cad6aad38, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1441: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc61fe001  ! 1442: LDD_I	ldd	[%r31 + 0x0001], %r3
debug_0_495:
	mov 8, %r18
	.word 0xdef00852  ! 1443: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
debug_0_496:
	setx debug_0_496 + 64, %r11, %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 1444: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xc6d004a0  ! 1445: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 1447: WRASI_I	wr	%r0, 0x0016, %asi
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 1448: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x91d02033  ! 1449: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d903053  ! 1450: WRPR_PSTATE_I	wrpr	%r0, 0x1053, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xc65fc000  ! 1451: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x91d020b4  ! 1452: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_0_497:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1453: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02034  ! 1454: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_0_498:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1455: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879023a1  ! 1456: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_0_499:
	setx 0x6f5e972daa263528, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1458: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_500:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1459: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xc797e001  ! 1460: LDQFA_I	-	[%r31, 0x0001], %f3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1461: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_501:
	mov 8, %r18
	.word 0xdef00852  ! 1462: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xc69004a0  ! 1463: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_502)) -> intp(0,1,3)
xir_0_502:
	.word 0xa9826001  ! 1464: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x87802088  ! 1465: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_0_503:
	setx 0x529973ec32bbfacb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_504:
	mov 8, %r18
	.word 0xd8f00852  ! 1467: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
	.word 0xc60fc000  ! 1468: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xc6cfe020  ! 1469: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0x8545c000  ! 1470: RD_TICK_CMPR_REG	rd	%-, %r2
intveclr_0_505:
	set 0x4dcb86e2, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x38700001  ! 1472: BPGU	<illegal instruction>
	.word 0xc41fc000  ! 1473: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0xc427e001  ! 1474: STW_I	stw	%r2, [%r31 + 0x0001]
intveclr_0_506:
	set 0x278fa927, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1475: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1476: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_507:
	mov 8, %r18
	.word 0xd4f00852  ! 1477: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
intveclr_0_508:
	set 0x2f572707, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1478: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc41fe001  ! 1479: LDD_I	ldd	[%r31 + 0x0001], %r2
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc41fc000  ! 1481: LDD_R	ldd	[%r31 + %r0], %r2
debug_0_509:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1482: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_510)) -> intp(0,1,3)
xir_0_510:
	.word 0xa9802001  ! 1483: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
DS_0_511:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd734c012  ! 1: STQF_R	-	%f11, [%r18, %r19]
	normalw
	.word 0x85458000  ! 1484: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8153c000  ! 1485: RDPR_FQ	<illegal instruction>
	.word 0x81982acf  ! 1486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xc05fc000  ! 1487: LDX_R	ldx	[%r31 + %r0], %r0
debug_0_512:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1488: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_513:
	set 0xc2edce53, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1489: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc097e030  ! 1490: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc09fe001  ! 1492: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0x8d903a73  ! 1493: WRPR_PSTATE_I	wrpr	%r0, 0x1a73, %pstate
intveclr_0_514:
	set 0x13f07bef, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 1494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9500000  ! 1495: RDPR_TPC	rdpr	%tpc, %r20
debug_0_515:
	mov 0x38, %r18
	.word 0xfef00b12  ! 1496: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_lsu_0_516:
	setx 0xed2f44c4657ffad7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1497: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9540000  ! 1498: RDPR_GL	rdpr	%-, %r20
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

	.xword	0x2133542ad03a6e31
	.xword	0xb352911d20eae102
	.xword	0x7b6aea12a8a4a1c8
	.xword	0x236ac92f446088b9
	.xword	0x74881f4ea936e49a
	.xword	0xade2b0b3d4f7b32c
	.xword	0xae13a4b6ef451f9f
	.xword	0x990547c835f2793b
	.xword	0x7fc617d21b022fde
	.xword	0x13814748509f6719
	.xword	0x701758721234ba71
	.xword	0xbc5acf5c23f7746f
	.xword	0xac2891db5f003313
	.xword	0x4ae0880e949b4b06
	.xword	0xee83f889504be889
	.xword	0xd19abd6ab884b691
	.xword	0xc18982cda1bb8af1
	.xword	0x714d390c54132761
	.xword	0x900c6094ef4326ed
	.xword	0x3c874b9b5b5b9f89
	.xword	0x828a356f270dc0c4
	.xword	0x4c52806faedeef39
	.xword	0xd6db25cee618d03d
	.xword	0x87a34305b7ba1067
	.xword	0x046e6a716f0a24a1
	.xword	0xa86b992f97a6ba53
	.xword	0xdfa23ee4a30c8124
	.xword	0xcf38286b539b21e6
	.xword	0x94e02c9c942c8008
	.xword	0x6f2bae4a2f137dee
	.xword	0x2200b508eeb44eb6
	.xword	0xe75db9d1e09a0d00
	.xword	0x93dc3ba575d0cae9
	.xword	0x81a687c930ef6513
	.xword	0xcb5fa35e1cf69727
	.xword	0x8d18e9df570800ef
	.xword	0xf6e6bef1d42d57e2
	.xword	0xf644dbf647f842f0
	.xword	0x41ab993bde97fc27
	.xword	0x0324e36a07c87a6a
	.xword	0xa7710f5df8450c18
	.xword	0x7c87c98321519567
	.xword	0x64289ef1fad6523a
	.xword	0xa724946f7f380eb3
	.xword	0x437c495945b86e95
	.xword	0x4cde9e2116915dce
	.xword	0xc9adea38d01cb0c2
	.xword	0xefa6e7150d7985a0
	.xword	0xad7f5c89f28cb88e
	.xword	0xb4f673d90849a33d
	.xword	0xd44a63095b31c027
	.xword	0xf5366cf0b2ac458b
	.xword	0x1992301044626adf
	.xword	0xeb13d952e3157137
	.xword	0xb95d7118fa8fb564
	.xword	0x6195971a97ca0443
	.xword	0x0c0b65b91149a28d
	.xword	0x72651f2833248953
	.xword	0xf16fcc04d1bde0c8
	.xword	0xf431e0a4ab2f8e18
	.xword	0xbebac1abccf3608a
	.xword	0x7012dbaa5a500245
	.xword	0x8b48f2c508e69be5
	.xword	0x552c06211c9ccfe9
	.xword	0x6d56121d7845d0e8
	.xword	0x81afa6c26e8967c5
	.xword	0x3472ba5ba5c4e1b8
	.xword	0xbd83854de2a40c44
	.xword	0xb81194a1645cf95d
	.xword	0x40b3ca6fb8084496
	.xword	0xdc0edc59467c1d3f
	.xword	0x776a35288241465c
	.xword	0xa28e076a1548a0a7
	.xword	0x75b9e74503d761c9
	.xword	0x2729b462f0e4c92d
	.xword	0x50cff90d79450afb
	.xword	0xf36953753afe3f7f
	.xword	0xb09a23c81dbaa14c
	.xword	0xfa24c6af2d68bc1f
	.xword	0x68c447650b1478c8
	.xword	0xb3757976fc7096f9
	.xword	0x00963be19cfd09a7
	.xword	0x43ce9ccfd3ed7807
	.xword	0xc23f70c9bc988314
	.xword	0x8f1e8814f39c84ae
	.xword	0x4cbd2cf9954177ea
	.xword	0xbe317f675ab04dd2
	.xword	0x4213eca9e139b4cc
	.xword	0x9a8f9693c312998c
	.xword	0xec3a4ccff2964a31
	.xword	0x31458cdb38149e19
	.xword	0x74f16bf9156de90c
	.xword	0x32f6e46e347cee62
	.xword	0x0a7572bf86e44138
	.xword	0xb06860978a006edb
	.xword	0xa9c324e2fb811894
	.xword	0x4e553d952bbaa572
	.xword	0xc026df6199d2a36d
	.xword	0xb4434a941870cc65
	.xword	0xbb702713afa7e520
	.xword	0xe3c872a9deda2791
	.xword	0x875954bd7e32e562
	.xword	0x8fbc2c1219db3872
	.xword	0x175c7426ef692b04
	.xword	0x7e89dcd7aff5c762
	.xword	0x3541b95ad1a0f24a
	.xword	0xc48fa7b136d75382
	.xword	0xb475afbe3593e924
	.xword	0xd556d724dd98a3d3
	.xword	0x76e7abf74a43ab52
	.xword	0x501f7c4631cd27ca
	.xword	0xe13d0bd49b38bed4
	.xword	0x6d46b8a944872bab
	.xword	0x5e35d047c843da89
	.xword	0xa89f6da49e885dfc
	.xword	0x461729dfe068965e
	.xword	0xd9a9d81392040402
	.xword	0x7d6bb8f65b795bdc
	.xword	0x786d7249b972f41a
	.xword	0xee0d2d99fedee994
	.xword	0xf8a6ef6dc1ea1ece
	.xword	0x06c01a8a0a019d36
	.xword	0xe4750734ef50de98
	.xword	0xa844e43242c5d9d5
	.xword	0x3765295818889034
	.xword	0x698ce9e245a5afe3
	.xword	0x9f3b4219f4765bd8
	.xword	0x0fc43f896383f715
	.xword	0xac3c08a48bb693d6
	.xword	0xb264bafdcf92a4ed
	.xword	0x5d28ab8d06f54a64
	.xword	0x9dfa13a4b8e40d19
	.xword	0x4e8070902b518cb5
	.xword	0x29aa058fdff50ebb
	.xword	0x974f92cb113f4fb5
	.xword	0x01c9c00327d17854
	.xword	0x776528f1a2952b90
	.xword	0xc667573f5f7c46ac
	.xword	0x7bafc49b75fab00a
	.xword	0x1bfbae225968cc0d
	.xword	0xcc12df23a25fb2ed
	.xword	0x5280bca583710171
	.xword	0xfc4174b60fc22352
	.xword	0xfff79e3c7cfbd24d
	.xword	0x8de902eb7d9e662d
	.xword	0xc849d53ef60c26ec
	.xword	0xc65c7e2135d3a9ae
	.xword	0xdb2b169b27ab3554
	.xword	0x879d1edd9e6e30ad
	.xword	0xa03825bad2022c12
	.xword	0xa145c06a659c182c
	.xword	0x44283e52c87c3b3e
	.xword	0xb194b37a08ec4466
	.xword	0x10346b2166f2ee06
	.xword	0x0ccd80ed7f332c79
	.xword	0x19fa8c3c976f8975
	.xword	0x218fae7c60453ff9
	.xword	0xc2e680b95a726dfe
	.xword	0xd6c7531fb8fd0906
	.xword	0xaaa845375613609b
	.xword	0x185621d8c25c6d42
	.xword	0xabfd95fd6ab20212
	.xword	0x9a1e815ce25561df
	.xword	0x3ff7f03e0014ea03
	.xword	0x3da2ae48ddf1a412
	.xword	0xfee207be586741c8
	.xword	0x73ab2961530ff719
	.xword	0xf2e08f5715abd925
	.xword	0xd860031ee367e4d8
	.xword	0xdef82c6deef833de
	.xword	0x4ebb845663c32344
	.xword	0x9f3f0cd23578b70c
	.xword	0xdd489246fd683ffb
	.xword	0xa57ae87a6f4f7399
	.xword	0xf415a92a08f80246
	.xword	0x4d50df9d0da53622
	.xword	0xd6b6a333b03d00af
	.xword	0x39e8e43d29e13dcb
	.xword	0xda46078bff78c3b8
	.xword	0x585293e8923018d5
	.xword	0xf4782dfc48547bb4
	.xword	0xbf934036067d77aa
	.xword	0xddff2f2fb2c4ec3f
	.xword	0xc0104b8cd24d55da
	.xword	0x6ee89d85e7475f8e
	.xword	0x80b3dff3268294e9
	.xword	0x165e0946f3304cd8
	.xword	0x71787ae346c30a87
	.xword	0xfa4dcefa5674ae51
	.xword	0x68109fc4e74d2797
	.xword	0xb28563d8cd5669ce
	.xword	0x56a894f1c69637a4
	.xword	0x317fca6a78cfb00b
	.xword	0xc9bf3e087a6ed392
	.xword	0xc040a889bdd95414
	.xword	0x049c3d2c5a084d72
	.xword	0x693daf782163179b
	.xword	0xd5d447edc32ecf2f
	.xword	0x1381baa9a3eeab05
	.xword	0x048e414470c702e5
	.xword	0xe51ecc615718f207
	.xword	0x20907957aaa16547
	.xword	0xda442b364bdd7034
	.xword	0x40de22e29ed302e6
	.xword	0xa220ea1aaf6b451b
	.xword	0x5892eae964222966
	.xword	0xb4f18be8529422da
	.xword	0x3b4055a04632c66f
	.xword	0x0ae8b34e98b08d7c
	.xword	0x6c6e2c815f30e83e
	.xword	0x72fbc9f77ba2a0f6
	.xword	0xdebf5e094cfe961e
	.xword	0xe0b213aa9b70f6e9
	.xword	0x06fbf85a3c814ed6
	.xword	0xc6fa0c0a9bc2ec9f
	.xword	0xf8e5edea369a1eda
	.xword	0x0461460e0ee7cc89
	.xword	0x0384944e98b006b0
	.xword	0xb46e92eee1f07bef
	.xword	0xb0c55c1235ca0ff9
	.xword	0x131ea3c1f77f0c65
	.xword	0x5e3c7fb29a6a7c4e
	.xword	0x126eadb80cbdfe12
	.xword	0xafe2838023f256dc
	.xword	0xcdb576abb8392777
	.xword	0x383b98f8a6c85957
	.xword	0x1411e6b24b50d3bf
	.xword	0xcff44d4b9db3b66e
	.xword	0x6a59472f1ae8d5a9
	.xword	0x0a84cae8983f377e
	.xword	0x7e9465f968b76bab
	.xword	0x43c7dfd4b422e5f3
	.xword	0x1d10ef7b4814eb3c
	.xword	0xb4753696781e928d
	.xword	0xd787f19a2196e58b
	.xword	0x23e33efcf9666985
	.xword	0x9923606574483b24
	.xword	0x9dceee7c2f5f5db3
	.xword	0xe76d6d14a9007177
	.xword	0x98371150f24b67ca
	.xword	0x607301b7a3455f9c
	.xword	0xcda1754886c2e1db
	.xword	0x52d2f72a2c1cb381
	.xword	0x24d7d3c3bde997cc
	.xword	0x714820cf79d89d97
	.xword	0x594e7b39be2b440a
	.xword	0x3eed4fbf93671aad
	.xword	0x555ce05b07554f83
	.xword	0x42f448781a5b4d2a
	.xword	0x46d3d4e1d1e988e9
	.xword	0x57e7d2837feca1d8
	.xword	0xe618f45e5cd0840f
	.xword	0x705ffeee34501701
	.xword	0x265079ee5d3e68dc
	.xword	0x772eb7a23e794a2f
	.xword	0x6c4dd740e1774f2e

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

