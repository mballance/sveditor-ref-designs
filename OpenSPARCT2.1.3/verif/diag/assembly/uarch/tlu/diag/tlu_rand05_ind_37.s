/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_37.s
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
#define IMMU_SKIP_IF_NO_TTE
#define DMMU_SKIP_IF_NO_TTE
#define PORTABLE_CORE
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

#define H_HT0_Software_Initiated_Reset_0x04
#define SUN_H_HT0_Software_Initiated_Reset_0x04 \
    setx Software_Reset_Handler, %g1, %g2 ;\
    jmp %g2 ;\
    nop
# 30 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 59 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 168 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
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
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7;\
    stw %l5, [%i7];\
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    done;nop

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
    done;nop

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
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
    retry;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
    retry;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
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

#define H_T1_VA_Watchpoint_0x62
#define SUN_H_T1_VA_Watchpoint_0x62 \
    done; nop

#define H_HT0_VA_Watchpoint_0x62
#define My_H_HT0_VA_Watchpoint_0x62 \
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
    rdhpr %htstate, %g1;\
    wrhpr %g1, 0x400, %htstate;\
    retry;nop
# 696 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    done;nop

#define H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    done;nop
# 713 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 718 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 727 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g6, %g7; \
    jmp %g7; \
    nop 

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
    	mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40; retry

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d \
    	mov 0x80,%g1; stxa %g0,[%g1]0x40; retry
# 32 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 46 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 146 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 149 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 194 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 197 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g2;\
    wr %g2, %g0, %pcr;\
	retry; 
# 687 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 257 "diag.j"
!# Steer towards main TBA on these errors ..
!# These are redefines ...
#define SUN_H_HT0_DAE_nc_page_0x16 \
    set 0x120000, %r2;\
    wrpr %r0, %r2, %tba; \
    done;nop

#define SUN_H_HT0_DAE_nfo_page_0x17 \
    set 0x120000, %r2;\
    wrpr %r0, %r2, %tba; \
    done;nop

#define SUN_H_HT0_IAE_unauth_access_0x0b \
    set retry_with_base_tba, %g2;\
    jmp %g2;\
    nop

#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set retry_with_base_tba, %g2;\
    jmp %g2;\
    nop

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
	mov 0x30, %r14
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
	mov 0x35, %r14
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
	mov 0x32, %r30
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

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr

    ! Set up fpr PMU traps 
    set 0x1ff8bfff, %g2
    wr %g2, %g0, %pcr
    ta T_RD_THID
    brnz %o1, skip_non0
setup_cmp:
    stw %g0, [%g0]
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x58]%asi, %r14
	stxa %r14, [0x50]%asi
setup_spu:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    setx CWQ_BASE, %g1, %l6

    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
    stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ data
    setx 0x2061000000000000, %l1, %l2		!#		Control Word

    !# write CWQ entry (%l6 points to CWQ)
    stx  %l2, [%l6 + 0x0]

    setx msg, %g1, %l2
    stx %l2, [%l6 + 0x8]	!# source address

    stx %g0, [%l6 + 0x10]	!# Authentication Key  Address (40-bit)
    stx %g0, [%l6 + 0x18]	!# Authentication IV   Address (40-bit)
    stx %g0, [%l6 + 0x20]	!# Authentication FSAS Address (40-bit)
    stx %g0, [%l6 + 0x28]	!# Encryption Key Address (40-bit)
    stx %g0, [%l6 + 0x30]	!# Encryption Initialization Vector Address (40-bit)

    setx    results, %g1, %o3
    stx %o3, [%l6 + 0x38]	!# Destination Address (40-bit)

    membar #Sync

    ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
    add %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi

    !# Kick off the CWQ operation by writing to the CWQ_CSR
    !# Set the enabled bit and reset the other bits
    or      %g0, 0x1, %g1
    stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi

    wr %r0, %r12, %asi
skip_non0:
    ta T_CHANGE_NONHPRIV 
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
pmu_7_0:
	nop
	setx 0xfffffaf7fffffc24, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_7_1:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0xa0d5360a  ! 4: UMULcc_I	umulcc 	%r20, 0xfffff60a, %r16
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_7_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_7_3:
	setx 0xdbe1f0ea13935b71, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 8: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_4:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902005  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	setx 0xa5ebc7998d48a98f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021a8  ! 13: WRPR_TT_I	wrpr	%r0, 0x01a8, %tt
splash_lsu_7_6:
	setx 0x3f679eb5f8666597, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9834011  ! 15: WR_SET_SOFTINT_R	wr	%r13, %r17, %set_softint
	.word 0x8d90392f  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x192f, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x34fe788ac3f6e1e5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a34dc3  ! 19: FdMULq	fdmulq	
change_to_randtl_7_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_8:
	.word 0x8f902001  ! 20: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_7_9:
	setx 0xd6256131f43d225b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_10:
	.word 0x81982d44  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95692331  ! 23: SDIVX_I	sdivx	%r4, 0x0331, %r10
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802010  ! 25: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d02034  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9024e1  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x04e1, %pstate
mondo_7_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d928004  ! 28: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
tagged_7_13:
	taddcctv %r2, 0x1e1a, %r23
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_7_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_7_16:
	setx 0x79908c0f1b14820a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_7_17:
	taddcctv %r2, 0x1633, %r10
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 34: FqTOd	dis not found

	.word 0x97a00160  ! 35: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a0196d  ! 36: FqTOd	dis not found

debug_7_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x9ba00164  ! 40: FABSq	dis not found

	setx 0x4453deafdf69cf42, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c80  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x9745c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01967  ! 44: FqTOd	dis not found

	.word 0xa1902009  ! 45: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_randtl_7_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_23:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_7_24:
	setx 0xfbc68eb7ba6f4829, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9034f6  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x14f6, %pstate
splash_htba_7_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9020a5  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x00a5, %pstate
splash_tba_7_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_7_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_27:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe6c804a0  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
mondo_7_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d95000a  ! 54: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
splash_cmpr_7_29:
	setx 0xa781c285d2a80cf3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_30:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 56: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe6d00e40  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r19
tagged_7_31:
	taddcctv %r20, 0x1626, %r14
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_7_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d928007  ! 59: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_33-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_33:
	.word 0x9192c012  ! 60: WRPR_PIL_R	wrpr	%r11, %r18, %pil
splash_lsu_7_34:
	setx 0x6df68e50738b1871, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_7_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_36:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 63: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 64: FqTOd	dis not found

mondo_7_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d91c014  ! 65: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
intveclr_7_39:
	setx 0xc6ee0c0fb994481f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800b00  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
	.word 0xa190200d  ! 68: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_40:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 69: RDPC	rd	%pc, %r9
splash_hpstate_7_41:
	.word 0x81982b96  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
splash_hpstate_7_42:
	.word 0x81982efc  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0efc, %hpstate
splash_cmpr_7_43:
	setx 0x10d94fbd60e19c1d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_7_44:
	setx 0xbaafdac96fc7a727, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab84c005  ! 74: WR_CLEAR_SOFTINT_R	wr	%r19, %r5, %clear_softint
debug_7_45:
	nop
	mov 8, %r18
	.word 0xe6f00852  ! 75: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
splash_lsu_7_46:
	setx 0x5d185831bf1e22cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_7_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 78: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0xa8a8800d  ! 79: ANDNcc_R	andncc 	%r2, %r13, %r20
memptr_7_48:
	set user_data_start, %r31
	.word 0x858079bc  ! 80: WRCCR_I	wr	%r1, 0x19bc, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902002  ! 82: WRPR_GL_I	wrpr	%r0, 0x0002, %-
change_to_randtl_7_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_49:
	.word 0x8f902003  ! 83: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
mondo_7_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d948014  ! 84: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
splash_lsu_7_51:
	setx 0xd2ba07bd864d3a99, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_7_52:
	setx 0xe04a67220853d635, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xd515dfb3c0c80908, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_7_54:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_55)+56, 16, 16)) -> intp(7,1,3)
xir_7_55:
	.word 0xa9853d53  ! 90: WR_SET_SOFTINT_I	wr	%r20, 0x1d53, %set_softint
	.word 0x99a08dc8  ! 91: FdMULq	fdmulq	
memptr_7_56:
	set 0x60140000, %r31
	.word 0x858426a4  ! 92: WRCCR_I	wr	%r16, 0x06a4, %ccr
	.word 0x8d9029a4  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x09a4, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_7_57:
	setx 0xf4f6a0733a19b9d6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9190a316  ! 96: WRPR_PIL_I	wrpr	%r2, 0x0316, %pil
	.word 0x9745c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x87902284  ! 98: WRPR_TT_I	wrpr	%r0, 0x0284, %tt
	.word 0xad82621f  ! 99: WR_SOFTINT_REG_I	wr	%r9, 0x021f, %softint
change_to_randtl_7_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_58:
	.word 0x8f902001  ! 100: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_7_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902001  ! 102: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_hpstate_7_60:
	.word 0x8198233c  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x033c, %hpstate
	.word 0x93d02032  ! 104: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa1a00165  ! 105: FABSq	dis not found

splash_cmpr_7_61:
	setx 0xff55bda61d00d54e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x93a489c9  ! 108: FDIVd	fdivd	%f18, %f40, %f40
	.word 0xd4800b80  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0x91d02033  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9ba00167  ! 111: FABSq	dis not found

tagged_7_62:
	tsubcctv %r4, 0x1716, %r3
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_7_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d928004  ! 113: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76afb95  ! 114: SDIVX_I	sdivx	%r11, 0xfffffb95, %r19
	.word 0x91d020b2  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 178
	setx 0x8fe08cda546a79d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902244  ! 117: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01968  ! 118: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01972  ! 119: FqTOd	dis not found

mondo_7_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d914014  ! 120: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
DS_7_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_7_70:
	.word 0x81982ad5  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad5, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 125: RDPC	rd	%pc, %r19
mondo_7_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d900004  ! 126: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
	.word 0x9a494012  ! 127: MULX_R	mulx 	%r5, %r18, %r13
	setx 0x18c0e3dedf10c127, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_7_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e010  ! 131: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_7_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940008  ! 137: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_7_77:
	set 0x60340000, %r31
	.word 0x8584a4e8  ! 140: WRCCR_I	wr	%r18, 0x04e8, %ccr
debug_7_78:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 141: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802055  ! 142: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_7_79:
	setx 0xc1f8c250722726e6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa1902009  ! 146: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9b540000  ! 147: RDPR_GL	rdpr	%-, %r13
splash_hpstate_7_81:
	.word 0x81982a36  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a36, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_82) + 56, 16, 16)) -> intp(2,0,3)
intvec_7_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb34c00c  ! 1: STQF_R	-	%f13, [%r12, %r19]
	normalw
	.word 0xa7458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d903ced  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x1ced, %pstate
	.word 0x93d020b4  ! 153: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_7_84:
	setx 0x53e0dd7c7080f895, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 155: RDPC	rd	%pc, %r18
splash_cmpr_7_86:
	setx 0xfe10a213f7b01afc, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01973  ! 158: FqTOd	dis not found

mondo_7_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d92000d  ! 159: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_90-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_90:
	.word 0x91940009  ! 160: WRPR_PIL_R	wrpr	%r16, %r9, %pil
mondo_7_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d908010  ! 161: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
splash_lsu_7_92:
	setx 0x1388a1e7ac601c3f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_93:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 163: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
DS_7_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_7_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9844010  ! 166: WR_SET_SOFTINT_R	wr	%r17, %r16, %set_softint
	.word 0xe8d7e010  ! 167: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_96)+48, 16, 16)) -> intp(7,1,3)
xir_7_96:
	.word 0xa9812639  ! 171: WR_SET_SOFTINT_I	wr	%r4, 0x0639, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_7_97:
	setx 0x4c80742eb018299d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa8fc4003  ! 175: SDIVcc_R	sdivcc 	%r17, %r3, %r20
	.word 0xa550c000  ! 176: RDPR_TT	rdpr	%tt, %r18
	.word 0xd88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
memptr_7_98:
	set 0x60740000, %r31
	.word 0x85823a81  ! 178: WRCCR_I	wr	%r8, 0x1a81, %ccr
	setx 0x8044439dceaa410b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_100:
	setx 0xbd151eadc62f7b73, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902005  ! 182: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_7_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_101:
	.word 0x8f902001  ! 183: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_7_102:
	tsubcctv %r9, 0x106e, %r10
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_103:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 186: RDPC	rd	%pc, %r9
memptr_7_104:
	set 0x60340000, %r31
	.word 0x8581f1c1  ! 187: WRCCR_I	wr	%r7, 0x11c1, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01969  ! 188: FqTOd	dis not found

	.word 0x8d903df5  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1df5, %pstate
	.word 0x8790237a  ! 190: WRPR_TT_I	wrpr	%r0, 0x037a, %tt
debug_7_106:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_107:
	setx 0xdf4b8f9283cd1651, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790208a  ! 193: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
DS_7_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b24308  ! 194: ALIGNADDRESS	alignaddr	%r9, %r8, %r8
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0xa1a2c9c6  ! 196: FDIVd	fdivd	%f42, %f6, %f16
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 197: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_109:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 198: RDPC	rd	%pc, %r11
	.word 0x87902064  ! 199: WRPR_TT_I	wrpr	%r0, 0x0064, %tt
	.word 0xd8d00e60  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_110:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 201: RDPC	rd	%pc, %r12
	.word 0x8d903be5  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x1be5, %pstate
mondo_7_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d928003  ! 203: WRPR_WSTATE_R	wrpr	%r10, %r3, %wstate
mondo_7_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d91800b  ! 204: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_7_113:
	setx 0xffa8219eb219ce95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_114:
	setx 0x85d5c4b790471f09, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802014  ! 208: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91500000  ! 209: RDPR_TPC	rdpr	%tpc, %r8
debug_7_115:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_7_116:
	setx 0x504b47cb58532080, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 212: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_7_117:
	setx 0xfab40aada57c23ae, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0x9b500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 216: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_7_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x5922481bfd169135, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_122:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 222: RDPC	rd	%pc, %r20
tagged_7_123:
	taddcctv %r14, 0x1367, %r11
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_7_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f14, %f6
	.word 0xa5b50310  ! 224: ALIGNADDRESS	alignaddr	%r20, %r16, %r18
memptr_7_125:
	set 0x60140000, %r31
	.word 0x8583620a  ! 225: WRCCR_I	wr	%r13, 0x020a, %ccr
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0x7ad3aefe3dff5a68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90211c  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x011c, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_7_128:
	setx 0x83469749a7a88c33, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_7_129:
	set user_data_start, %r31
	.word 0x858461c4  ! 231: WRCCR_I	wr	%r17, 0x01c4, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_130:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 232: RDPC	rd	%pc, %r11
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_7_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_7_132:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 237: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
	.word 0x94830008  ! 238: ADDcc_R	addcc 	%r12, %r8, %r10
	.word 0x91d02035  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_7_133:
	.word 0x8198295e  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095e, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_7_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d930007  ! 242: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
tagged_7_135:
	taddcctv %r18, 0x15c2, %r16
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_7_136:
	setx 0x7760f9d42d456db8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803451  ! 245: SIR	sir	0x1451
	.word 0x9ba00167  ! 246: FABSq	dis not found

splash_tba_7_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e010  ! 248: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
mondo_7_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d904009  ! 249: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0x87802089  ! 250: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_7_139:
	setx 0x907fff686658c998, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9350c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x93a509c6  ! 255: FDIVd	fdivd	%f20, %f6, %f40
mondo_7_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 256: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
splash_lsu_7_142:
	setx 0xe8b81b330a94b9e5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_143)+56, 16, 16)) -> intp(7,1,3)
xir_7_143:
	.word 0xa984bdf2  ! 258: WR_SET_SOFTINT_I	wr	%r18, 0x1df2, %set_softint
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_144:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 259: RDPC	rd	%pc, %r10
	.word 0x8d90262b  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x062b, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0xa5540000  ! 262: RDPR_GL	rdpr	%-, %r18
	.word 0xa1902003  ! 263: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d902879  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0879, %pstate
	.word 0x91d02033  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802058  ! 268: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_7_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_145:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad8224b0  ! 271: WR_SOFTINT_REG_I	wr	%r8, 0x04b0, %softint
	.word 0x8790221f  ! 272: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
	.word 0xd4800ba0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686fd2  ! 274: SDIVX_I	sdivx	%r1, 0x0fd2, %r9
splash_hpstate_7_147:
	.word 0x81982757  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
	.word 0xa190200c  ! 276: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_7_148:
	setx 0x537a892eabbdff3d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7a00171  ! 280: FABSq	dis not found

splash_tba_7_150:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_151:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 282: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_7_152-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_152:
	.word 0x91924007  ! 283: WRPR_PIL_R	wrpr	%r9, %r7, %pil
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_153:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 284: RDPC	rd	%pc, %r9
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_7_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d944006  ! 286: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x8d90287c  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x087c, %pstate
mondo_7_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94800d  ! 288: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_7_157:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_7_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa96a5dfc	! Random illegal ?
	.word 0xe7118007  ! 1: LDQF_R	-	[%r6, %r7], %f19
	.word 0xa1a28834  ! 291: FADDs	fadds	%f10, %f20, %f16
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_7_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_159-donret_7_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_7_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_7_161:
	taddcctv %r17, 0x1fd8, %r9
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0xa745c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_7_162:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 298: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_7_163:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93520000  ! 300: RDPR_PIL	rdpr	%pil, %r9
	rd %pc, %r19
	add %r19, (ivw_7_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_164:
	.word 0x9192c003  ! 301: WRPR_PIL_R	wrpr	%r11, %r3, %pil
	.word 0xe0d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_7_165:
	setx 0x6508871b5802ac48, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_166:
	.word 0x81982196  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
donret_7_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_167-donret_7_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_7_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_7_168:
	setx 0xcea58ed42f692b8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200b  ! 308: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_hpstate_7_169:
	.word 0x819826dd  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768748d  ! 310: SDIVX_I	sdivx	%r1, 0xfffff48d, %r11
	.word 0x8d9020ee  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x00ee, %pstate
splash_htba_7_171:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_7_172:
	.word 0x81982d8d  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
	.word 0x91450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xd68008a0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa150c000  ! 316: RDPR_TT	rdpr	%tt, %r16
	rd %pc, %r19
	add %r19, (ivw_7_173-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_173:
	.word 0x91950007  ! 317: WRPR_PIL_R	wrpr	%r20, %r7, %pil
mondo_7_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92400a  ! 318: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x8d9036f7  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x16f7, %pstate
	.word 0x919469b3  ! 320: WRPR_PIL_I	wrpr	%r17, 0x09b3, %pil
	.word 0x93454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe0cfe020  ! 322: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
memptr_7_175:
	set 0x60140000, %r31
	.word 0x85846422  ! 323: WRCCR_I	wr	%r17, 0x0422, %ccr
	.word 0x93902007  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_176:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 326: RDPC	rd	%pc, %r12
debug_7_177:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 327: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe0d7e000  ! 328: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
debug_7_178:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_7_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_7_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d950001  ! 331: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x9b464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r13
splash_cmpr_7_181:
	setx 0xf52f2b5e2ec83504, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200a  ! 334: WRPR_GL_I	wrpr	%r0, 0x000a, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_182:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 335: RDPC	rd	%pc, %r17
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0x9753c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_7_183:
	setx 0xdf1b571b3c8a65e7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_7_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_7_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d904010  ! 340: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_186) + 0, 16, 16)) -> intp(0,0,12)
intvec_7_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 342: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_7_187-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_187:
	.word 0x91910011  ! 344: WRPR_PIL_R	wrpr	%r4, %r17, %pil
mondo_7_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d90c004  ! 345: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_189-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_189:
	.word 0x9194c001  ! 346: WRPR_PIL_R	wrpr	%r19, %r1, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_190) + 8, 16, 16)) -> intp(5,0,1)
intvec_7_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_7_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x91d02034  ! 351: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_192:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 352: RDPC	rd	%pc, %r19
	.word 0x99902001  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
tagged_7_193:
	taddcctv %r5, 0x13e3, %r14
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad00e40  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ae521  ! 358: SDIVX_I	sdivx	%r11, 0x0521, %r11
debug_7_195:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 359: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_hpstate_7_196:
	.word 0x81982984  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x95520000  ! 362: RDPR_PIL	rdpr	%pil, %r10
splash_cmpr_7_197:
	setx 0xab89dcdf8de81937, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02034  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_7_198:
	set user_data_start, %r31
	.word 0x8580b59b  ! 366: WRCCR_I	wr	%r2, 0x159b, %ccr
	.word 0x87802014  ! 367: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_7_199:
	setx 0x62d9a97efff08079, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a509d1  ! 369: FDIVd	fdivd	%f20, %f48, %f48
memptr_7_200:
	set 0x60340000, %r31
	.word 0x8581a154  ! 370: WRCCR_I	wr	%r6, 0x0154, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_7_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950011  ! 372: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
debug_7_202:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_7_203:
	nop
	setx 0xfffff6abfffff1b7, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02032  ! 375: Tcc_I	te	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_204) + 32, 16, 16)) -> intp(4,0,2)
intvec_7_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa545c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01963  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_206:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 380: RDPC	rd	%pc, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9169b620  ! 381: SDIVX_I	sdivx	%r6, 0xfffff620, %r8
debug_7_208:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_7_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_209:
	.word 0x8f902002  ! 383: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x879021ab  ! 384: WRPR_TT_I	wrpr	%r0, 0x01ab, %tt
	.word 0xa1902003  ! 385: WRPR_GL_I	wrpr	%r0, 0x0003, %-
memptr_7_210:
	set user_data_start, %r31
	.word 0x85842a74  ! 386: WRCCR_I	wr	%r16, 0x0a74, %ccr
	rd %pc, %r19
	add %r19, (ivw_7_211-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_211:
	.word 0x91928004  ! 387: WRPR_PIL_R	wrpr	%r10, %r4, %pil
	.word 0x8d903f63  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x1f63, %pstate
debug_7_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_213:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 390: RDPC	rd	%pc, %r16
	.word 0x91500000  ! 391: RDPR_TPC	rdpr	%tpc, %r8
DS_7_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5588ff3	! Random illegal ?
	.word 0xd910000b  ! 1: LDQF_R	-	[%r0, %r11], %f12
	.word 0x9ba48824  ! 392: FADDs	fadds	%f18, %f4, %f13
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x9192fd90  ! 395: WRPR_PIL_I	wrpr	%r11, 0x1d90, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xf1b731ca9cfdf699, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe49004a0  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0xa1a14d22  ! 401: FsMULd	fsmuld	%f5, %f2, %f16
	.word 0x91d020b5  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 181
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c76fd  ! 404: SDIVX_I	sdivx	%r17, 0xfffff6fd, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01964  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_220:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 406: RDPC	rd	%pc, %r10
DS_7_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd714000a  ! 1: LDQF_R	-	[%r16, %r10], %f11
	.word 0x9ba4c82c  ! 407: FADDs	fadds	%f19, %f12, %f13
	.word 0xd4dfe000  ! 408: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
DS_7_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb4030d  ! 409: ALIGNADDRESS	alignaddr	%r16, %r13, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91682d85  ! 410: SDIVX_I	sdivx	%r0, 0x0d85, %r8
splash_hpstate_7_224:
	.word 0x81982b45  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 412: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_7_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d924006  ! 414: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_226:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 415: RDPC	rd	%pc, %r11
	setx 0x341811ad6785defc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00167  ! 417: FABSq	dis not found

donret_7_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_7_228-donret_7_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_7_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x919273ab  ! 419: WRPR_PIL_I	wrpr	%r9, 0x13ab, %pil
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 420: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd88fe020  ! 422: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
tagged_7_229:
	taddcctv %r24, 0x14f8, %r17
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f803fe1  ! 424: SIR	sir	0x1fe1
tagged_7_230:
	tsubcctv %r4, 0x19f3, %r7
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802004  ! 426: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_232:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 429: RDPC	rd	%pc, %r10
pmu_7_233:
	nop
	setx 0xfffff60ffffff6d4, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_234:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 431: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_7_235:
	set 0x60540000, %r31
	.word 0x8584ab63  ! 433: WRCCR_I	wr	%r18, 0x0b63, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01972  ! 434: FqTOd	dis not found

splash_lsu_7_237:
	setx 0x2b63d8f580535a5f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00167  ! 436: FABSq	dis not found

change_to_randtl_7_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_238:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196d  ! 439: FqTOd	dis not found

intveclr_7_241:
	setx 0x679d23a06a5d4c64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200c  ! 442: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x91540000  ! 444: RDPR_GL	rdpr	%-, %r8
splash_cmpr_7_242:
	setx 0x48b73d3a23b602db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x47cc646eb9477b62, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_7_244:
	set 0x60540000, %r31
	.word 0x8580b13f  ! 447: WRCCR_I	wr	%r2, 0x113f, %ccr
splash_cmpr_7_245:
	setx 0x6b98d4acb2e392b6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 449: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x91d020b3  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 179
pmu_7_247:
	nop
	setx 0xfffff6e1fffff936, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cf186  ! 452: SDIVX_I	sdivx	%r19, 0xfffff186, %r12
DS_7_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_250:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 454: RDPC	rd	%pc, %r9
splash_cmpr_7_251:
	setx 0x8995e19796920e07, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_252) + 40, 16, 16)) -> intp(4,0,15)
intvec_7_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe7110004  ! 1: LDQF_R	-	[%r4, %r4], %f19
	.word 0x95a04821  ! 457: FADDs	fadds	%f1, %f1, %f10
	.word 0xe0c7e020  ! 458: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	.word 0x87802004  ! 459: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_7_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_7_255:
	set user_data_start, %r31
	.word 0x85806759  ! 462: WRCCR_I	wr	%r1, 0x0759, %ccr
memptr_7_256:
	set 0x60540000, %r31
	.word 0x85826b43  ! 463: WRCCR_I	wr	%r9, 0x0b43, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 464: RDPC	rd	%pc, %r19
debug_7_258:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 465: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
mondo_7_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d90800a  ! 466: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
DS_7_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f14, %f26
	.word 0xa9b40301  ! 467: ALIGNADDRESS	alignaddr	%r16, %r1, %r20
mondo_7_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d914004  ! 468: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0x99a00174  ! 469: FABSq	dis not found

	.word 0xa1902004  ! 470: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x95540000  ! 471: RDPR_GL	rdpr	%-, %r10
change_to_randtl_7_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_262:
	.word 0x8f902000  ! 472: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802004  ! 473: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902000  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_7_263:
	setx 0x6b6f087b002c1171, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_264:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 477: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
splash_cmpr_7_265:
	setx 0x27ed45a6986115af, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_266) + 8, 16, 16)) -> intp(3,0,26)
intvec_7_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_7_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_7_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_7_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d944008  ! 482: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0x9ba00168  ! 483: FABSq	dis not found

splash_tba_7_270:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_7_271:
	setx 0x1774fae80c106aae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802cd9  ! 486: SIR	sir	0x0cd9
splash_lsu_7_272:
	setx 0xb5b26aa18620e9dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01967  ! 488: FqTOd	dis not found

	.word 0xa1902007  ! 489: WRPR_GL_I	wrpr	%r0, 0x0007, %-
debug_7_274:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6800be0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
	setx 0xdd906565452cf726, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022fa  ! 493: WRPR_TT_I	wrpr	%r0, 0x02fa, %tt
memptr_7_276:
	set user_data_start, %r31
	.word 0x85837468  ! 494: WRCCR_I	wr	%r13, 0x1468, %ccr
	.word 0xa1902004  ! 495: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_7_277:
	setx 0x5ebc24902c8dd895, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 497: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_7_278:
	set 0x60540000, %r31
	.word 0x85852960  ! 498: WRCCR_I	wr	%r20, 0x0960, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
pmu_6_0:
	nop
	setx 0xffffffa8fffff790, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_6_1:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0x94d52de6  ! 4: UMULcc_I	umulcc 	%r20, 0x0de6, %r10
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_6_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_6_3:
	setx 0x7b45403daea8e194, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 8: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_4:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx 0xf114d8037bef2596, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902007  ! 13: WRPR_TT_I	wrpr	%r0, 0x0007, %tt
splash_lsu_6_6:
	setx 0xc892758f93a513fd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9818013  ! 15: WR_SET_SOFTINT_R	wr	%r6, %r19, %set_softint
	.word 0x8d903ce7  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x1ce7, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 17: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0xf6868f9b60b300db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a24dcd  ! 19: FdMULq	fdmulq	
change_to_randtl_6_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_8:
	.word 0x8f902000  ! 20: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_6_9:
	setx 0x3615e34d0f32fca8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_10:
	.word 0x8198245c  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045c, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936d2d62  ! 23: SDIVX_I	sdivx	%r20, 0x0d62, %r9
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802016  ! 25: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93d02032  ! 26: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d90363c  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x163c, %pstate
mondo_6_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d928005  ! 28: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
tagged_6_13:
	taddcctv %r22, 0x1b36, %r25
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_6_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_6_16:
	setx 0xe862fd45da482935, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_6_17:
	taddcctv %r13, 0x1e1e, %r24
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01971  ! 34: FqTOd	dis not found

	.word 0xa1a00162  ! 35: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 36: FqTOd	dis not found

debug_6_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1a00172  ! 40: FABSq	dis not found

	setx 0x0dbe49d86a3677e0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4800b60  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r10
	.word 0xa545c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01960  ! 44: FqTOd	dis not found

	.word 0xa1902001  ! 45: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_6_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_23:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_6_24:
	setx 0xe03728ba41ad80f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902964  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0964, %pstate
splash_htba_6_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9029b7  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x09b7, %pstate
splash_tba_6_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_6_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_27:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe6c804a0  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
mondo_6_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d910008  ! 54: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
splash_cmpr_6_29:
	setx 0x42aa888dd16decd2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_30:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 56: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe6d00e80  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r19
tagged_6_31:
	taddcctv %r21, 0x101b, %r3
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_6_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d930006  ! 59: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_33-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_33:
	.word 0x9190c00c  ! 60: WRPR_PIL_R	wrpr	%r3, %r12, %pil
splash_lsu_6_34:
	setx 0x4135b05d9ade4005, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_6_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_36:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 63: RDPC	rd	%pc, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01960  ! 64: FqTOd	dis not found

mondo_6_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 65: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
intveclr_6_39:
	setx 0x029705a4d78f41ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800b20  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r8
	.word 0xa190200d  ! 68: WRPR_GL_I	wrpr	%r0, 0x000d, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_40:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 69: RDPC	rd	%pc, %r11
splash_hpstate_6_41:
	.word 0x819822d4  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
splash_hpstate_6_42:
	.word 0x81982e0f  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
splash_cmpr_6_43:
	setx 0x4291c80bd4284c01, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_6_44:
	setx 0x8da080a5879c0a04, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab808010  ! 74: WR_CLEAR_SOFTINT_R	wr	%r2, %r16, %clear_softint
debug_6_45:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_6_46:
	setx 0xe1136da7f3dc6ee5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_6_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 78: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0xa8ac4009  ! 79: ANDNcc_R	andncc 	%r17, %r9, %r20
memptr_6_48:
	set user_data_start, %r31
	.word 0x8584ec5c  ! 80: WRCCR_I	wr	%r19, 0x0c5c, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa190200a  ! 82: WRPR_GL_I	wrpr	%r0, 0x000a, %-
change_to_randtl_6_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_49:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
mondo_6_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d91c000  ! 84: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
splash_lsu_6_51:
	setx 0x1a556ed48c9b0479, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_6_52:
	setx 0x2f7bcf133b051b9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x26c236edfc5037aa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_6_54:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d020b4  ! 89: Tcc_I	te	icc_or_xcc, %r0 + 180
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_55)+0, 16, 16)) -> intp(6,1,3)
xir_6_55:
	.word 0xa98163b1  ! 90: WR_SET_SOFTINT_I	wr	%r5, 0x03b1, %set_softint
	.word 0x91a20dd3  ! 91: FdMULq	fdmulq	
memptr_6_56:
	set 0x60140000, %r31
	.word 0x85843a20  ! 92: WRCCR_I	wr	%r16, 0x1a20, %ccr
	.word 0x8d90367b  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x167b, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_6_57:
	setx 0x37ddd30b6ce6e2ba, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9190fcdc  ! 96: WRPR_PIL_I	wrpr	%r3, 0x1cdc, %pil
	.word 0x9545c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x879021c4  ! 98: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
	.word 0xad843901  ! 99: WR_SOFTINT_REG_I	wr	%r16, 0x1901, %softint
change_to_randtl_6_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_58:
	.word 0x8f902000  ! 100: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_6_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 102: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_6_60:
	.word 0x81982f84  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
	.word 0x91d02033  ! 104: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9ba00165  ! 105: FABSq	dis not found

splash_cmpr_6_61:
	setx 0x00ba694858f2794c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x93a089c6  ! 108: FDIVd	fdivd	%f2, %f6, %f40
	.word 0xd48008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x91d020b2  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x91a00170  ! 111: FABSq	dis not found

tagged_6_62:
	tsubcctv %r15, 0x1966, %r18
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_6_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 113: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93693f92  ! 114: SDIVX_I	sdivx	%r4, 0xffffff92, %r9
	.word 0x93d02035  ! 115: Tcc_I	tne	icc_or_xcc, %r0 + 53
	setx 0x93fa2c66d8bd9d6b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790204b  ! 117: WRPR_TT_I	wrpr	%r0, 0x004b, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 118: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01967  ! 119: FqTOd	dis not found

mondo_6_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d918011  ! 120: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
DS_6_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_6_70:
	.word 0x81982605  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
	.word 0xd6c00e80  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_71:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 125: RDPC	rd	%pc, %r9
mondo_6_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d904003  ! 126: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
	.word 0x904d0000  ! 127: MULX_R	mulx 	%r20, %r0, %r8
	setx 0x8fdd241be4e2c697, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_6_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e000  ! 131: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 136: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_6_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 137: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_6_77:
	set 0x60540000, %r31
	.word 0x8582fe50  ! 140: WRCCR_I	wr	%r11, 0x1e50, %ccr
debug_6_78:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 141: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x87802010  ! 142: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_6_79:
	setx 0x78da3155c215ef93, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200c  ! 146: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x95540000  ! 147: RDPR_GL	rdpr	%-, %r10
splash_hpstate_6_81:
	.word 0x819820a5  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00a5, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_82) + 56, 16, 16)) -> intp(7,0,27)
intvec_6_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd730400c  ! 1: STQF_R	-	%f11, [%r12, %r1]
	normalw
	.word 0x91458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d903fb9  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x1fb9, %pstate
	.word 0x91d02034  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_6_84:
	setx 0x0a276cae38645fa0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 155: RDPC	rd	%pc, %r20
splash_cmpr_6_86:
	setx 0x2e5b2035f6bb6c29, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 158: FqTOd	dis not found

mondo_6_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94000b  ! 159: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_90-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_90:
	.word 0x9195000a  ! 160: WRPR_PIL_R	wrpr	%r20, %r10, %pil
mondo_6_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d914011  ! 161: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
splash_lsu_6_92:
	setx 0xd6e5ba6cd12fd489, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_93:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 163: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
DS_6_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_6_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9850014  ! 166: WR_SET_SOFTINT_R	wr	%r20, %r20, %set_softint
	.word 0xe8d7e000  ! 167: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902002  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_96)+0, 16, 16)) -> intp(6,1,3)
xir_6_96:
	.word 0xa982b9dc  ! 171: WR_SET_SOFTINT_I	wr	%r10, 0x19dc, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_6_97:
	setx 0x877aa794797a5c9d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x90fb4014  ! 175: SDIVcc_R	sdivcc 	%r13, %r20, %r8
	.word 0x9550c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd8800b40  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
memptr_6_98:
	set 0x60140000, %r31
	.word 0x85853427  ! 178: WRCCR_I	wr	%r20, 0x1427, %ccr
	setx 0x30418b6869279807, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_100:
	setx 0x2639008c0dd0834c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902007  ! 182: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_6_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_101:
	.word 0x8f902003  ! 183: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_6_102:
	tsubcctv %r17, 0x1a2d, %r24
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_103:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 186: RDPC	rd	%pc, %r9
memptr_6_104:
	set 0x60140000, %r31
	.word 0x8581e9e7  ! 187: WRCCR_I	wr	%r7, 0x09e7, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01972  ! 188: FqTOd	dis not found

	.word 0x8d90326b  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x126b, %pstate
	.word 0x879021d6  ! 190: WRPR_TT_I	wrpr	%r0, 0x01d6, %tt
debug_6_106:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_107:
	setx 0xc0537d4be47bae86, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902304  ! 193: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
DS_6_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b10314  ! 194: ALIGNADDRESS	alignaddr	%r4, %r20, %r18
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0x91a149cc  ! 196: FDIVd	fdivd	%f36, %f12, %f8
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 197: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_109:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 198: RDPC	rd	%pc, %r20
	.word 0x8790228f  ! 199: WRPR_TT_I	wrpr	%r0, 0x028f, %tt
	.word 0xd8d00e80  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 201: RDPC	rd	%pc, %r20
	.word 0x8d903612  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x1612, %pstate
mondo_6_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d904013  ! 203: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
mondo_6_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 204: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_6_113:
	setx 0xe3f6073c48e05c95, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_114:
	setx 0x92135a5658ccda83, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802016  ! 208: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99500000  ! 209: RDPR_TPC	rdpr	%tpc, %r12
debug_6_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_6_116:
	setx 0x67bf79bb9ab73804, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 212: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_6_117:
	setx 0xbc91566bb5505ec0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa9500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 216: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_6_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x1ef7ca98d039801c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_122:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 222: RDPC	rd	%pc, %r19
tagged_6_123:
	taddcctv %r14, 0x1cc5, %r15
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_6_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f12, %f14
	.word 0x9bb40312  ! 224: ALIGNADDRESS	alignaddr	%r16, %r18, %r13
memptr_6_125:
	set 0x60140000, %r31
	.word 0x85823e19  ! 225: WRCCR_I	wr	%r8, 0x1e19, %ccr
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0x69f8fa11ef17435b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d28  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x1d28, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_6_128:
	setx 0xc5887acaa0d21751, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_6_129:
	set user_data_start, %r31
	.word 0x85833fea  ! 231: WRCCR_I	wr	%r12, 0x1fea, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_130:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 232: RDPC	rd	%pc, %r20
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_6_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_6_132:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 237: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x9682c002  ! 238: ADDcc_R	addcc 	%r11, %r2, %r11
	.word 0x91d020b5  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_hpstate_6_133:
	.word 0x81982756  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0756, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_6_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d924002  ! 242: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
tagged_6_135:
	taddcctv %r18, 0x16fc, %r15
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_6_136:
	setx 0x39cb53d46f5aa717, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802ab4  ! 245: SIR	sir	0x0ab4
	.word 0x93a00170  ! 246: FABSq	dis not found

splash_tba_6_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e020  ! 248: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
mondo_6_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d95000b  ! 249: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x87802004  ! 250: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_6_139:
	setx 0x7756dcebcc1c149b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9350c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x97a409d1  ! 255: FDIVd	fdivd	%f16, %f48, %f42
mondo_6_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d930003  ! 256: WRPR_WSTATE_R	wrpr	%r12, %r3, %wstate
splash_lsu_6_142:
	setx 0xa6c262528db8a679, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_143)+40, 16, 16)) -> intp(6,1,3)
xir_6_143:
	.word 0xa984695f  ! 258: WR_SET_SOFTINT_I	wr	%r17, 0x095f, %set_softint
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 259: RDPC	rd	%pc, %r11
	.word 0x8d9025a3  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x05a3, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0x91540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa190200b  ! 263: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d9020ec  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x00ec, %pstate
	.word 0x91d02032  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802014  ! 268: WRASI_I	wr	%r0, 0x0014, %asi
change_to_randtl_6_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_145:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad833775  ! 271: WR_SOFTINT_REG_I	wr	%r12, 0x1775, %softint
	.word 0x87902238  ! 272: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95697065  ! 274: SDIVX_I	sdivx	%r5, 0xfffff065, %r10
splash_hpstate_6_147:
	.word 0x81982dec  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dec, %hpstate
	.word 0xa190200f  ! 276: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_6_148:
	setx 0xfe731f72a329d58f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9a00173  ! 280: FABSq	dis not found

splash_tba_6_150:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_151:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 282: RDPC	rd	%pc, %r18
	rd %pc, %r19
	add %r19, (ivw_6_152-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_152:
	.word 0x9193400a  ! 283: WRPR_PIL_R	wrpr	%r13, %r10, %pil
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_153:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 284: RDPC	rd	%pc, %r12
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_6_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d900012  ! 286: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x8d90313c  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x113c, %pstate
mondo_6_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d950008  ! 288: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_6_157:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_6_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9f6b4906	! Random illegal ?
	.word 0xd714c008  ! 1: LDQF_R	-	[%r19, %r8], %f11
	.word 0x93a34823  ! 291: FADDs	fadds	%f13, %f3, %f9
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_6_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_159-donret_6_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_6_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_6_161:
	taddcctv %r20, 0x17c2, %r17
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9545c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_6_162:
	nop
	mov 8, %r18
	.word 0xe4f00852  ! 298: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
debug_6_163:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa3520000  ! 300: RDPR_PIL	rdpr	%pil, %r17
	rd %pc, %r19
	add %r19, (ivw_6_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_164:
	.word 0x91950001  ! 301: WRPR_PIL_R	wrpr	%r20, %r1, %pil
	.word 0xe0d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_6_165:
	setx 0x090a81e1fed8fe68, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_166:
	.word 0x81982e85  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
donret_6_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_167-donret_6_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_6_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_6_168:
	setx 0x7bdbdf33afe30219, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa1902007  ! 308: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_hpstate_6_169:
	.word 0x81982a4d  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568ecba  ! 310: SDIVX_I	sdivx	%r3, 0x0cba, %r10
	.word 0x8d90349e  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x149e, %pstate
splash_htba_6_171:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_6_172:
	.word 0x819820de  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
	.word 0xa7450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xd6800c20  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0x9750c000  ! 316: RDPR_TT	rdpr	%tt, %r11
	rd %pc, %r19
	add %r19, (ivw_6_173-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_173:
	.word 0x91950011  ! 317: WRPR_PIL_R	wrpr	%r20, %r17, %pil
mondo_6_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d944014  ! 318: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x8d903142  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x1142, %pstate
	.word 0x91906c69  ! 320: WRPR_PIL_I	wrpr	%r1, 0x0c69, %pil
	.word 0x97454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe0cfe030  ! 322: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
memptr_6_175:
	set 0x60740000, %r31
	.word 0x8584eef3  ! 323: WRCCR_I	wr	%r19, 0x0ef3, %ccr
	.word 0x93902000  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_176:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 326: RDPC	rd	%pc, %r8
debug_6_177:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 327: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe0d7e030  ! 328: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_6_178:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_6_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_6_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 331: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x95464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r10
splash_cmpr_6_181:
	setx 0xd01377244f64aad7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200e  ! 334: WRPR_GL_I	wrpr	%r0, 0x000e, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_182:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 335: RDPC	rd	%pc, %r19
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0x9753c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_6_183:
	setx 0xd4cbd6de3ca2b4e5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_6_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_6_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934006  ! 340: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_186) + 24, 16, 16)) -> intp(3,0,11)
intvec_6_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 342: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_6_187-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_187:
	.word 0x9192c005  ! 344: WRPR_PIL_R	wrpr	%r11, %r5, %pil
mondo_6_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 345: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_189-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_189:
	.word 0x91910010  ! 346: WRPR_PIL_R	wrpr	%r4, %r16, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_190) + 24, 16, 16)) -> intp(0,0,25)
intvec_6_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_6_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x91d020b2  ! 351: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_192:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 352: RDPC	rd	%pc, %r10
	.word 0x99902002  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
tagged_6_193:
	taddcctv %r5, 0x1be6, %r9
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c22f0  ! 358: SDIVX_I	sdivx	%r16, 0x02f0, %r8
debug_6_195:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 359: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
splash_hpstate_6_196:
	.word 0x819824c6  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0xa3520000  ! 362: RDPR_PIL	rdpr	%pil, %r17
splash_cmpr_6_197:
	setx 0xca1dd49fd713caa2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_6_198:
	set user_data_start, %r31
	.word 0x85807cf7  ! 366: WRCCR_I	wr	%r1, 0x1cf7, %ccr
	.word 0x87802063  ! 367: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_6_199:
	setx 0x45f252928d0f2042, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a409d1  ! 369: FDIVd	fdivd	%f16, %f48, %f50
memptr_6_200:
	set 0x60540000, %r31
	.word 0x8582a9e0  ! 370: WRCCR_I	wr	%r10, 0x09e0, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_6_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d908006  ! 372: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
debug_6_202:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_6_203:
	nop
	setx 0xfffff4a9fffff97a, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 375: Tcc_I	ta	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_204) + 8, 16, 16)) -> intp(7,0,1)
intvec_6_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9945c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01971  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_206:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 380: RDPC	rd	%pc, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1692d78  ! 381: SDIVX_I	sdivx	%r4, 0x0d78, %r16
debug_6_208:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_6_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_209:
	.word 0x8f902000  ! 383: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x879022cb  ! 384: WRPR_TT_I	wrpr	%r0, 0x02cb, %tt
	.word 0xa1902005  ! 385: WRPR_GL_I	wrpr	%r0, 0x0005, %-
memptr_6_210:
	set user_data_start, %r31
	.word 0x858277af  ! 386: WRCCR_I	wr	%r9, 0x17af, %ccr
	rd %pc, %r19
	add %r19, (ivw_6_211-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_211:
	.word 0x91908003  ! 387: WRPR_PIL_R	wrpr	%r2, %r3, %pil
	.word 0x8d9034a2  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x14a2, %pstate
debug_6_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_213:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 390: RDPC	rd	%pc, %r13
	.word 0xa7500000  ! 391: RDPR_TPC	rdpr	%tpc, %r19
DS_6_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd16d66e1	! Random illegal ?
	.word 0xd914400a  ! 1: LDQF_R	-	[%r17, %r10], %f12
	.word 0x91a28833  ! 392: FADDs	fadds	%f10, %f19, %f8
	.word 0xe4800c60  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x9193723a  ! 395: WRPR_PIL_I	wrpr	%r13, 0x123a, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xeb6c3880975c1f7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4900e80  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
	.word 0x95a10d33  ! 401: FsMULd	fsmuld	%f4, %f50, %f10
	.word 0x83d02032  ! 402: Tcc_I	te	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96cf208  ! 404: SDIVX_I	sdivx	%r19, 0xfffff208, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01972  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_220:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 406: RDPC	rd	%pc, %r13
DS_6_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5118008  ! 1: LDQF_R	-	[%r6, %r8], %f10
	.word 0x9ba0c825  ! 407: FADDs	fadds	%f3, %f5, %f13
	.word 0xd4dfe030  ! 408: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
DS_6_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b2c312  ! 409: ALIGNADDRESS	alignaddr	%r11, %r18, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ce25c  ! 410: SDIVX_I	sdivx	%r19, 0x025c, %r20
splash_hpstate_6_224:
	.word 0x81982cce  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_6_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94000c  ! 414: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_226:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 415: RDPC	rd	%pc, %r12
	setx 0x827717b596d5f834, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a00174  ! 417: FABSq	dis not found

donret_6_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_6_228-donret_6_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_6_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x9191a62d  ! 419: WRPR_PIL_I	wrpr	%r6, 0x062d, %pil
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 420: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe020  ! 421: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0xd88fe020  ! 422: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
tagged_6_229:
	taddcctv %r3, 0x18c2, %r15
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f803436  ! 424: SIR	sir	0x1436
tagged_6_230:
	tsubcctv %r18, 0x1716, %r20
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802004  ! 426: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 427: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_232:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 429: RDPC	rd	%pc, %r8
pmu_6_233:
	nop
	setx 0xfffff921fffff2da, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_234:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 431: RDPC	rd	%pc, %r12
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_6_235:
	set 0x60340000, %r31
	.word 0x85842273  ! 433: WRCCR_I	wr	%r16, 0x0273, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 434: FqTOd	dis not found

splash_lsu_6_237:
	setx 0xaf3bce396547c291, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00174  ! 436: FABSq	dis not found

change_to_randtl_6_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_238:
	.word 0x8f902001  ! 437: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01966  ! 439: FqTOd	dis not found

intveclr_6_241:
	setx 0xfafe575472e2aa95, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902000  ! 442: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0xa9540000  ! 444: RDPR_GL	rdpr	%-, %r20
splash_cmpr_6_242:
	setx 0xe6fa60c469bbcd7d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x20a80b2cd517c7d7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_6_244:
	set 0x60540000, %r31
	.word 0x858120c0  ! 447: WRCCR_I	wr	%r4, 0x00c0, %ccr
splash_cmpr_6_245:
	setx 0x2ed6fd9711e96a6a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d914012  ! 449: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0x91d020b3  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 179
pmu_6_247:
	nop
	setx 0xfffff843fffff3b7, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c3d12  ! 452: SDIVX_I	sdivx	%r16, 0xfffffd12, %r16
DS_6_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_250:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 454: RDPC	rd	%pc, %r13
splash_cmpr_6_251:
	setx 0xde2767dc19a306ce, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_252) + 48, 16, 16)) -> intp(3,0,4)
intvec_6_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9110013  ! 1: LDQF_R	-	[%r4, %r19], %f12
	.word 0x91a0882d  ! 457: FADDs	fadds	%f2, %f13, %f8
	.word 0xe0c7e020  ! 458: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	.word 0x87802058  ! 459: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_6_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_6_255:
	set user_data_start, %r31
	.word 0x8584fc41  ! 462: WRCCR_I	wr	%r19, 0x1c41, %ccr
memptr_6_256:
	set 0x60740000, %r31
	.word 0x8581b386  ! 463: WRCCR_I	wr	%r6, 0x1386, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_257:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 464: RDPC	rd	%pc, %r13
debug_6_258:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 465: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
mondo_6_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d91c00b  ! 466: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
DS_6_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f6, %f10
	.word 0x97b44308  ! 467: ALIGNADDRESS	alignaddr	%r17, %r8, %r11
mondo_6_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 468: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x93a00160  ! 469: FABSq	dis not found

	.word 0xa1902005  ! 470: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x97540000  ! 471: RDPR_GL	rdpr	%-, %r11
change_to_randtl_6_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_262:
	.word 0x8f902000  ! 472: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802055  ! 473: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902006  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_6_263:
	setx 0xa64c8f30cf7cd793, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_264:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 477: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
splash_cmpr_6_265:
	setx 0x61f403b41aa5ccd9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_266) + 32, 16, 16)) -> intp(5,0,20)
intvec_6_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_6_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_6_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_6_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d934000  ! 482: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
	.word 0x99a00160  ! 483: FABSq	dis not found

splash_tba_6_270:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_6_271:
	setx 0xb9e275e90d17c59b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80356b  ! 486: SIR	sir	0x156b
splash_lsu_6_272:
	setx 0xeb3c50563721664b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196d  ! 488: FqTOd	dis not found

	.word 0xa190200c  ! 489: WRPR_GL_I	wrpr	%r0, 0x000c, %-
debug_6_274:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6800aa0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r19
	setx 0xcb9f5a8e25349334, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902296  ! 493: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
memptr_6_276:
	set user_data_start, %r31
	.word 0x85827266  ! 494: WRCCR_I	wr	%r9, 0x1266, %ccr
	.word 0xa1902007  ! 495: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_6_277:
	setx 0x82126342a5d64d43, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_6_278:
	set 0x60540000, %r31
	.word 0x8581fde7  ! 498: WRCCR_I	wr	%r7, 0x1de7, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
pmu_5_0:
	nop
	setx 0xfffff18ffffff6dd, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_5_1:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0x9ad37585  ! 4: UMULcc_I	umulcc 	%r13, 0xfffff585, %r13
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_5_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_5_3:
	setx 0x5987fc0659d085b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 8: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 9: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_5_4:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902006  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx 0x85274a2fb857dac8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902005  ! 13: WRPR_TT_I	wrpr	%r0, 0x0005, %tt
splash_lsu_5_6:
	setx 0x777bd9f5889666cd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9830007  ! 15: WR_SET_SOFTINT_R	wr	%r12, %r7, %set_softint
	.word 0x8d902847  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x8d59c0ff077aec68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a4cdd0  ! 19: FdMULq	fdmulq	
change_to_randtl_5_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_8:
	.word 0x8f902000  ! 20: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_9:
	setx 0x2a2cdb3eb0aa1fb9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_10:
	.word 0x81982a84  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a84, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5683c39  ! 23: SDIVX_I	sdivx	%r0, 0xfffffc39, %r18
	.word 0xd8800b20  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r12
	.word 0x8780201c  ! 25: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x91d02033  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d903b9f  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1b9f, %pstate
mondo_5_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 28: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
tagged_5_13:
	taddcctv %r15, 0x1087, %r16
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_5_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_5_16:
	setx 0x84e81b59a5dc01b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_5_17:
	taddcctv %r15, 0x178a, %r15
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196a  ! 34: FqTOd	dis not found

	.word 0x99a00172  ! 35: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01961  ! 36: FqTOd	dis not found

debug_5_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x91a0016d  ! 40: FABSq	dis not found

	setx 0x45d24e596fb99012, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9b45c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196c  ! 44: FqTOd	dis not found

	.word 0xa190200d  ! 45: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_5_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_23:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_5_24:
	setx 0x36bfee51fe7ac979, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903472  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1472, %pstate
splash_htba_5_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902446  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x0446, %pstate
splash_tba_5_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_5_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_27:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe6c804a0  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
mondo_5_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94c003  ! 54: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
splash_cmpr_5_29:
	setx 0xe82e8cd32d729223, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_30:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 56: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe6d00e80  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r19
tagged_5_31:
	taddcctv %r23, 0x1dfc, %r6
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_5_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d944006  ! 59: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_33-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_33:
	.word 0x91948013  ! 60: WRPR_PIL_R	wrpr	%r18, %r19, %pil
splash_lsu_5_34:
	setx 0x569f3d5a1e20da1f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_5_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_36:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 63: RDPC	rd	%pc, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01966  ! 64: FqTOd	dis not found

mondo_5_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d928008  ! 65: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
intveclr_5_39:
	setx 0xf7ccec531124174f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa1902002  ! 68: WRPR_GL_I	wrpr	%r0, 0x0002, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_40:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 69: RDPC	rd	%pc, %r13
splash_hpstate_5_41:
	.word 0x81982b97  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
splash_hpstate_5_42:
	.word 0x819826d4  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
splash_cmpr_5_43:
	setx 0x8a2b47d115bbaa82, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_5_44:
	setx 0xf9b2262177f21aba, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab834011  ! 74: WR_CLEAR_SOFTINT_R	wr	%r13, %r17, %clear_softint
debug_5_45:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_5_46:
	setx 0x4e68f57d5ad165f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_5_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 78: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0x90aac00a  ! 79: ANDNcc_R	andncc 	%r11, %r10, %r8
memptr_5_48:
	set user_data_start, %r31
	.word 0x858024c2  ! 80: WRCCR_I	wr	%r0, 0x04c2, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902007  ! 82: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_5_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_49:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_5_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d900004  ! 84: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
splash_lsu_5_51:
	setx 0xda190566c71ad69f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_5_52:
	setx 0x4499a3d387c6658a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x94b87e4ad4e42d69, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_5_54:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02032  ! 89: Tcc_I	tne	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_55)+8, 16, 16)) -> intp(5,1,3)
xir_5_55:
	.word 0xa980ef11  ! 90: WR_SET_SOFTINT_I	wr	%r3, 0x0f11, %set_softint
	.word 0x97a50dc1  ! 91: FdMULq	fdmulq	
memptr_5_56:
	set 0x60340000, %r31
	.word 0x85853c34  ! 92: WRCCR_I	wr	%r20, 0x1c34, %ccr
	.word 0x8d90352d  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x152d, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_5_57:
	setx 0x2bed3bdc114c2d5e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91937f5e  ! 96: WRPR_PIL_I	wrpr	%r13, 0x1f5e, %pil
	.word 0xa945c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x879021af  ! 98: WRPR_TT_I	wrpr	%r0, 0x01af, %tt
	.word 0xad813436  ! 99: WR_SOFTINT_REG_I	wr	%r4, 0x1436, %softint
change_to_randtl_5_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_58:
	.word 0x8f902001  ! 100: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_5_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 102: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_hpstate_5_60:
	.word 0x81982e5d  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0x83d020b5  ! 104: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x93a00170  ! 105: FABSq	dis not found

splash_cmpr_5_61:
	setx 0x0637cc296356daa6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x91a189d0  ! 108: FDIVd	fdivd	%f6, %f16, %f8
	.word 0xd48008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x91d02034  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x95a00160  ! 111: FABSq	dis not found

tagged_5_62:
	tsubcctv %r21, 0x1c13, %r12
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_5_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c003  ! 113: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b3cd3  ! 114: SDIVX_I	sdivx	%r12, 0xfffffcd3, %r10
	.word 0x91d02032  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 50
	setx 0x727804dc5f0ec1c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790202c  ! 117: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01965  ! 118: FqTOd	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01967  ! 119: FqTOd	dis not found

mondo_5_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c010  ! 120: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
DS_5_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_5_70:
	.word 0x81982d4f  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 125: RDPC	rd	%pc, %r17
mondo_5_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d920008  ! 126: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
	.word 0x924c400c  ! 127: MULX_R	mulx 	%r17, %r12, %r9
	setx 0xf2bdcd9be49c27d1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_5_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 136: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_5_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92000d  ! 137: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_5_77:
	set 0x60340000, %r31
	.word 0x8581a9a4  ! 140: WRCCR_I	wr	%r6, 0x09a4, %ccr
debug_5_78:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 141: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802063  ! 142: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_5_79:
	setx 0x254b604b4b5febf7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200f  ! 146: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9b540000  ! 147: RDPR_GL	rdpr	%-, %r13
splash_hpstate_5_81:
	.word 0x81982cc5  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc5, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_82) + 16, 16, 16)) -> intp(4,0,11)
intvec_5_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb344010  ! 1: STQF_R	-	%f13, [%r16, %r17]
	normalw
	.word 0x99458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d902149  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x0149, %pstate
	.word 0x93d02032  ! 153: Tcc_I	tne	icc_or_xcc, %r0 + 50
intveclr_5_84:
	setx 0x0afe870376769ab2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_85:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 155: RDPC	rd	%pc, %r10
splash_cmpr_5_86:
	setx 0x79da66b3812f9a59, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196b  ! 158: FqTOd	dis not found

mondo_5_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d944002  ! 159: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_90-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_90:
	.word 0x91928004  ! 160: WRPR_PIL_R	wrpr	%r10, %r4, %pil
mondo_5_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d934011  ! 161: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
splash_lsu_5_92:
	setx 0xa0945ee457ee7c53, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_93:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 163: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
DS_5_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_5_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa980800a  ! 166: WR_SET_SOFTINT_R	wr	%r2, %r10, %set_softint
	.word 0xe8d7e030  ! 167: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902000  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_96)+40, 16, 16)) -> intp(5,1,3)
xir_5_96:
	.word 0xa981aa5f  ! 171: WR_SET_SOFTINT_I	wr	%r6, 0x0a5f, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_5_97:
	setx 0xc70b1d4b92833923, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x94fb4007  ! 175: SDIVcc_R	sdivcc 	%r13, %r7, %r10
	.word 0x9b50c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd8800be0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
memptr_5_98:
	set 0x60740000, %r31
	.word 0x8584fa8e  ! 178: WRCCR_I	wr	%r19, 0x1a8e, %ccr
	setx 0x501776e4fee225d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_100:
	setx 0x2be73509bf2db667, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800ae0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r12
	.word 0xa1902000  ! 182: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_5_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_101:
	.word 0x8f902000  ! 183: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d020b4  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 180
tagged_5_102:
	tsubcctv %r6, 0x162d, %r24
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_103:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 186: RDPC	rd	%pc, %r13
memptr_5_104:
	set 0x60540000, %r31
	.word 0x85827a04  ! 187: WRCCR_I	wr	%r9, 0x1a04, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 188: FqTOd	dis not found

	.word 0x8d90342a  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x142a, %pstate
	.word 0x87902148  ! 190: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
debug_5_106:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_107:
	setx 0x5729f6ab441fcd0d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879022f9  ! 193: WRPR_TT_I	wrpr	%r0, 0x02f9, %tt
DS_5_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b4c300  ! 194: ALIGNADDRESS	alignaddr	%r19, %r0, %r16
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0x93a049c7  ! 196: FDIVd	fdivd	%f32, %f38, %f40
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 197: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_109:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 198: RDPC	rd	%pc, %r12
	.word 0x879023f0  ! 199: WRPR_TT_I	wrpr	%r0, 0x03f0, %tt
	.word 0xd8d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_110:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 201: RDPC	rd	%pc, %r13
	.word 0x8d903908  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x1908, %pstate
mondo_5_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 203: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
mondo_5_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 204: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_5_113:
	setx 0x42abd0d810f3399d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_114:
	setx 0xbe0c0a22d47b9535, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 208: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa5500000  ! 209: RDPR_TPC	rdpr	%tpc, %r18
debug_5_115:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_5_116:
	setx 0x04fa405660f412fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 212: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_5_117:
	setx 0xe1ed86b2a16ed4c2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0x9b500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802004  ! 216: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_5_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0xdda8045978516be9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802004  ! 221: WRFPRS_I	wr	%r0, 0x0004, %fprs
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_122:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 222: RDPC	rd	%pc, %r13
tagged_5_123:
	taddcctv %r24, 0x1e14, %r15
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_5_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f4, %f4
	.word 0xa3b18313  ! 224: ALIGNADDRESS	alignaddr	%r6, %r19, %r17
memptr_5_125:
	set 0x60740000, %r31
	.word 0x858168bf  ! 225: WRCCR_I	wr	%r5, 0x08bf, %ccr
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0x98599d1fe574e493, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ac6  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0ac6, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_5_128:
	setx 0xe7044cb3a02f81f7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_5_129:
	set user_data_start, %r31
	.word 0x8585371d  ! 231: WRCCR_I	wr	%r20, 0x171d, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_130:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 232: RDPC	rd	%pc, %r11
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802004  ! 235: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_5_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_5_132:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 237: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x96848014  ! 238: ADDcc_R	addcc 	%r18, %r20, %r11
	.word 0x91d02033  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_5_133:
	.word 0x81982145  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0145, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_5_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d900002  ! 242: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
tagged_5_135:
	taddcctv %r15, 0x1a18, %r4
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_5_136:
	setx 0xf27b36826f98c5df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803f0c  ! 245: SIR	sir	0x1f0c
	.word 0x91a00169  ! 246: FABSq	dis not found

splash_tba_5_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e000  ! 248: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
mondo_5_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d908012  ! 249: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0x87802058  ! 250: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_5_139:
	setx 0xfcdfa8031e85839d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa750c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x99a189c4  ! 255: FDIVd	fdivd	%f6, %f4, %f12
mondo_5_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d904011  ! 256: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_lsu_5_142:
	setx 0xc6637a6d12e185ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_143)+48, 16, 16)) -> intp(5,1,3)
xir_5_143:
	.word 0xa98372af  ! 258: WR_SET_SOFTINT_I	wr	%r13, 0x12af, %set_softint
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_144:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 259: RDPC	rd	%pc, %r10
	.word 0x8d9020e8  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x00e8, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0x99540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa1902004  ! 263: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d902cd9  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x91d02032  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802088  ! 268: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_5_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_145:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad812311  ! 271: WR_SOFTINT_REG_I	wr	%r4, 0x0311, %softint
	.word 0x879022b0  ! 272: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	.word 0xd4800a60  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168bb4b  ! 274: SDIVX_I	sdivx	%r2, 0xfffffb4b, %r8
splash_hpstate_5_147:
	.word 0x81982446  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0446, %hpstate
	.word 0xa190200b  ! 276: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_5_148:
	setx 0xe8b5d8788837bf55, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 278: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_5_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93a00172  ! 280: FABSq	dis not found

splash_tba_5_150:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_151:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 282: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_5_152-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_152:
	.word 0x91914012  ! 283: WRPR_PIL_R	wrpr	%r5, %r18, %pil
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_153:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 284: RDPC	rd	%pc, %r8
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_5_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d910014  ! 286: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0x8d902ad9  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x0ad9, %pstate
mondo_5_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d910008  ! 288: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_5_157:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_5_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb95f4910	! Random illegal ?
	.word 0xd313400b  ! 1: LDQF_R	-	[%r13, %r11], %f9
	.word 0x95a10822  ! 291: FADDs	fadds	%f4, %f2, %f10
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_5_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_159-donret_5_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_5_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_5_161:
	taddcctv %r15, 0x137a, %r6
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9145c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_5_162:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 298: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_5_163:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93520000  ! 300: RDPR_PIL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_5_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_164:
	.word 0x91944014  ! 301: WRPR_PIL_R	wrpr	%r17, %r20, %pil
	.word 0xe0d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_5_165:
	setx 0x4801370c456e356d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_166:
	.word 0x819821c7  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
donret_5_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_167-donret_5_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_5_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_5_168:
	setx 0x6f25c1ad2f47ef8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800be0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r16
	.word 0xa1902001  ! 308: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_hpstate_5_169:
	.word 0x81982c14  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c14, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56961d2  ! 310: SDIVX_I	sdivx	%r5, 0x01d2, %r18
	.word 0x8d9031ec  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x11ec, %pstate
splash_htba_5_171:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_5_172:
	.word 0x81982397  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0397, %hpstate
	.word 0x9b450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd68008a0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa750c000  ! 316: RDPR_TT	rdpr	%tt, %r19
	rd %pc, %r19
	add %r19, (ivw_5_173-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_173:
	.word 0x9194c012  ! 317: WRPR_PIL_R	wrpr	%r19, %r18, %pil
mondo_5_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d930014  ! 318: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x8d90287f  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x087f, %pstate
	.word 0x919337bf  ! 320: WRPR_PIL_I	wrpr	%r12, 0x17bf, %pil
	.word 0x97454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe0cfe030  ! 322: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
memptr_5_175:
	set 0x60740000, %r31
	.word 0x85806541  ! 323: WRCCR_I	wr	%r1, 0x0541, %ccr
	.word 0x93902006  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_176:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 326: RDPC	rd	%pc, %r9
debug_5_177:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 327: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xe0d7e020  ! 328: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_5_178:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_5_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_5_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 331: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xa3464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r17
splash_cmpr_5_181:
	setx 0xef32c5fa1a42c64b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 334: WRPR_GL_I	wrpr	%r0, 0x000f, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_182:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 335: RDPC	rd	%pc, %r8
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0xa953c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_5_183:
	setx 0xa059d096890191ea, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_5_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_5_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d924012  ! 340: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_186) + 8, 16, 16)) -> intp(4,0,19)
intvec_5_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 342: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_5_187-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_187:
	.word 0x9191400b  ! 344: WRPR_PIL_R	wrpr	%r5, %r11, %pil
mondo_5_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d930002  ! 345: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_189-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_189:
	.word 0x91914008  ! 346: WRPR_PIL_R	wrpr	%r5, %r8, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_190) + 16, 16, 16)) -> intp(6,0,0)
intvec_5_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_5_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x91d02033  ! 351: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_192:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 352: RDPC	rd	%pc, %r12
	.word 0x99902000  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
tagged_5_193:
	taddcctv %r21, 0x1dd5, %r15
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad00e40  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b7d59  ! 358: SDIVX_I	sdivx	%r13, 0xfffffd59, %r13
debug_5_195:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 359: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
splash_hpstate_5_196:
	.word 0x81982944  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0944, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x9b520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_5_197:
	setx 0x23feec3c858f8db8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02032  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_5_198:
	set user_data_start, %r31
	.word 0x85842296  ! 366: WRCCR_I	wr	%r16, 0x0296, %ccr
	.word 0x87802055  ! 367: WRASI_I	wr	%r0, 0x0055, %asi
splash_cmpr_5_199:
	setx 0x81a3c947fb3033fb, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a309cb  ! 369: FDIVd	fdivd	%f12, %f42, %f18
memptr_5_200:
	set 0x60540000, %r31
	.word 0x8581fca2  ! 370: WRCCR_I	wr	%r7, 0x1ca2, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_5_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d920013  ! 372: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
debug_5_202:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_5_203:
	nop
	setx 0xfffff0eefffff7c7, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02033  ! 375: Tcc_I	te	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_204) + 0, 16, 16)) -> intp(1,0,18)
intvec_5_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa945c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01962  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 380: RDPC	rd	%pc, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6d2e72  ! 381: SDIVX_I	sdivx	%r20, 0x0e72, %r13
debug_5_208:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_5_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_209:
	.word 0x8f902003  ! 383: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8790234a  ! 384: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
	.word 0xa190200b  ! 385: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_5_210:
	set user_data_start, %r31
	.word 0x8581abc5  ! 386: WRCCR_I	wr	%r6, 0x0bc5, %ccr
	rd %pc, %r19
	add %r19, (ivw_5_211-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_211:
	.word 0x9190c005  ! 387: WRPR_PIL_R	wrpr	%r3, %r5, %pil
	.word 0x8d902533  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0533, %pstate
debug_5_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_213:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 390: RDPC	rd	%pc, %r13
	.word 0x93500000  ! 391: RDPR_TPC	<illegal instruction>
DS_5_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8b7bb17f	! Random illegal ?
	.word 0xd911400b  ! 1: LDQF_R	-	[%r5, %r11], %f12
	.word 0xa3a48828  ! 392: FADDs	fadds	%f18, %f8, %f17
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x91943925  ! 395: WRPR_PIL_I	wrpr	%r16, 0x1925, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xd9ec123356076eed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4900e80  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
	.word 0x93a1cd2b  ! 401: FsMULd	fsmuld	%f7, %f42, %f40
	.word 0x83d020b3  ! 402: Tcc_I	te	icc_or_xcc, %r0 + 179
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c26f2  ! 404: SDIVX_I	sdivx	%r16, 0x06f2, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01972  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_220:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 406: RDPC	rd	%pc, %r18
DS_5_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3100012  ! 1: LDQF_R	-	[%r0, %r18], %f17
	.word 0x91a2082c  ! 407: FADDs	fadds	%f8, %f12, %f8
	.word 0xd4dfe030  ! 408: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
DS_5_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b0c303  ! 409: ALIGNADDRESS	alignaddr	%r3, %r3, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976c6835  ! 410: SDIVX_I	sdivx	%r17, 0x0835, %r11
splash_hpstate_5_224:
	.word 0x8198234d  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 412: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_5_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d920007  ! 414: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_226:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 415: RDPC	rd	%pc, %r10
	setx 0x52b803318dc5e507, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a0016b  ! 417: FABSq	dis not found

donret_5_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_5_228-donret_5_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_5_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x9192f81a  ! 419: WRPR_PIL_I	wrpr	%r11, 0x181a, %pil
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 420: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd88fe000  ! 422: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
tagged_5_229:
	taddcctv %r9, 0x1779, %r23
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f8032f2  ! 424: SIR	sir	0x12f2
tagged_5_230:
	tsubcctv %r14, 0x120c, %r3
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802004  ! 426: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_232:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 429: RDPC	rd	%pc, %r10
pmu_5_233:
	nop
	setx 0xfffff149fffff8fc, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_234:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 431: RDPC	rd	%pc, %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_5_235:
	set 0x60340000, %r31
	.word 0x8584362f  ! 433: WRCCR_I	wr	%r16, 0x162f, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01960  ! 434: FqTOd	dis not found

splash_lsu_5_237:
	setx 0xe4de62612b69564b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a00172  ! 436: FABSq	dis not found

change_to_randtl_5_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_238:
	.word 0x8f902001  ! 437: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01970  ! 439: FqTOd	dis not found

intveclr_5_241:
	setx 0x20af6746a80a1600, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200b  ! 442: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x99540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_5_242:
	setx 0x3e1abd90c4829b80, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xcbf0da8d2877f831, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_5_244:
	set 0x60540000, %r31
	.word 0x85847d8e  ! 447: WRCCR_I	wr	%r17, 0x1d8e, %ccr
splash_cmpr_5_245:
	setx 0x977953dae1743539, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 449: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	.word 0x93d02032  ! 450: Tcc_I	tne	icc_or_xcc, %r0 + 50
pmu_5_247:
	nop
	setx 0xfffff489fffff8ff, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916cbbe0  ! 452: SDIVX_I	sdivx	%r18, 0xfffffbe0, %r8
DS_5_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_250:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 454: RDPC	rd	%pc, %r10
splash_cmpr_5_251:
	setx 0xe285f605e0b95553, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_252) + 8, 16, 16)) -> intp(2,0,3)
intvec_5_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb11800a  ! 1: LDQF_R	-	[%r6, %r10], %f13
	.word 0x97a1482a  ! 457: FADDs	fadds	%f5, %f10, %f11
	.word 0xe0c7e010  ! 458: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	.word 0x87802004  ! 459: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_5_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_5_255:
	set user_data_start, %r31
	.word 0x8581296b  ! 462: WRCCR_I	wr	%r4, 0x096b, %ccr
memptr_5_256:
	set 0x60540000, %r31
	.word 0x8582f305  ! 463: WRCCR_I	wr	%r11, 0x1305, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_257:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 464: RDPC	rd	%pc, %r9
debug_5_258:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 465: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
mondo_5_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d944002  ! 466: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
DS_5_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f30, %f8
	.word 0xa1b18302  ! 467: ALIGNADDRESS	alignaddr	%r6, %r2, %r16
mondo_5_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d928008  ! 468: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
	.word 0xa7a00173  ! 469: FABSq	dis not found

	.word 0xa1902001  ! 470: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x99540000  ! 471: RDPR_GL	rdpr	%-, %r12
change_to_randtl_5_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_262:
	.word 0x8f902001  ! 472: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802080  ! 473: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902000  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_5_263:
	setx 0x0ed6b37896a2f6eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_264:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 477: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_cmpr_5_265:
	setx 0x88d34a2736532b3c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_266) + 32, 16, 16)) -> intp(3,0,6)
intvec_5_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_5_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_5_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_5_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d928010  ! 482: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
	.word 0xa5a00174  ! 483: FABSq	dis not found

splash_tba_5_270:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_5_271:
	setx 0x9812814ed5fba3ce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802598  ! 486: SIR	sir	0x0598
splash_lsu_5_272:
	setx 0x719d610d4f5c0adf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 488: FqTOd	dis not found

	.word 0xa1902003  ! 489: WRPR_GL_I	wrpr	%r0, 0x0003, %-
debug_5_274:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	setx 0x9b3f3bae28d45436, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879021b4  ! 493: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
memptr_5_276:
	set user_data_start, %r31
	.word 0x85806253  ! 494: WRCCR_I	wr	%r1, 0x0253, %ccr
	.word 0xa190200b  ! 495: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_5_277:
	setx 0x4726900e62317b6d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 497: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_5_278:
	set 0x60140000, %r31
	.word 0x8584eaaf  ! 498: WRCCR_I	wr	%r19, 0x0aaf, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
pmu_4_0:
	nop
	setx 0xffffff57fffffa4a, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_4_1:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0xa6d0e443  ! 4: UMULcc_I	umulcc 	%r3, 0x0443, %r19
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_4_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_4_3:
	setx 0x4662b44209e736d7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02034  ! 8: Tcc_I	tne	icc_or_xcc, %r0 + 52
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_4_4:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	setx 0xc377f489a9813544, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790205a  ! 13: WRPR_TT_I	wrpr	%r0, 0x005a, %tt
splash_lsu_4_6:
	setx 0xa13010971b8a80dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa981c00c  ! 15: WR_SET_SOFTINT_R	wr	%r7, %r12, %set_softint
	.word 0x8d902b11  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0b11, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x00c4ea33d8097fea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a08dc4  ! 19: FdMULq	fdmulq	
change_to_randtl_4_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_8:
	.word 0x8f902000  ! 20: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_9:
	setx 0xc49d848471c3d3e9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_10:
	.word 0x8198278d  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a3cc4  ! 23: SDIVX_I	sdivx	%r8, 0xfffffcc4, %r17
	.word 0xd8800c60  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
	.word 0x87802058  ! 25: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d020b5  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d902f17  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x0f17, %pstate
mondo_4_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c00d  ! 28: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
tagged_4_13:
	taddcctv %r24, 0x16bd, %r19
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_4_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_4_16:
	setx 0x3b740995fbdc3256, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_17:
	taddcctv %r26, 0x1171, %r3
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a0196c  ! 34: FqTOd	dis not found

	.word 0x97a0016b  ! 35: FABSq	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01966  ! 36: FqTOd	dis not found

debug_4_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa5a00170  ! 40: FABSq	dis not found

	setx 0x0bf84ad62bd026ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa945c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01962  ! 44: FqTOd	dis not found

	.word 0xa1902007  ! 45: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_4_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_23:
	.word 0x8f902001  ! 46: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_4_24:
	setx 0xc18efb194f6f64f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902292  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0292, %pstate
splash_htba_4_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902da2  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x0da2, %pstate
splash_tba_4_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_4_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_27:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe6c804a0  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
mondo_4_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 54: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
splash_cmpr_4_29:
	setx 0xb0d59320b8963c5a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_30:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_30:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_30
    nop
debug_wait4_30:
    ld [%r23], %r2
    brnz %r2, debug_wait4_30
    nop
    ba,a debug_startwait4_30
continue_debug_4_30:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_30:
    cmp %r13, %r15
    bne,a wait_for_stat_4_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_30:
    cmp %r14, %r15
    bne,a wait_for_debug_4_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 56: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xe6d00e60  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r19
tagged_4_31:
	taddcctv %r17, 0x1481, %r18
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_4_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c002  ! 59: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_33-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_33:
	.word 0x91910004  ! 60: WRPR_PIL_R	wrpr	%r4, %r4, %pil
splash_lsu_4_34:
	setx 0x8e52129106c31927, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_4_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_36:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 63: RDPC	rd	%pc, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01968  ! 64: FqTOd	dis not found

mondo_4_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 65: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
intveclr_4_39:
	setx 0xc2ca84a2a37722dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800aa0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r8
	.word 0xa1902004  ! 68: WRPR_GL_I	wrpr	%r0, 0x0004, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_40:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 69: RDPC	rd	%pc, %r11
splash_hpstate_4_41:
	.word 0x81982d57  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
splash_hpstate_4_42:
	.word 0x81982cfd  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cfd, %hpstate
splash_cmpr_4_43:
	setx 0x5b99a023e94f351d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_44:
	setx 0xa701db1f79d8db61, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab824011  ! 74: WR_CLEAR_SOFTINT_R	wr	%r9, %r17, %clear_softint
debug_4_45:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_45:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_45
    nop
debug_wait4_45:
    ld [%r23], %r2
    brnz %r2, debug_wait4_45
    nop
    ba,a debug_startwait4_45
continue_debug_4_45:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_45:
    cmp %r13, %r15
    bne,a wait_for_stat_4_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_45:
    cmp %r14, %r15
    bne,a wait_for_debug_4_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 75: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_lsu_4_46:
	setx 0x46995af4c7f48be9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_4_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d928009  ! 78: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
	.word 0x92acc009  ! 79: ANDNcc_R	andncc 	%r19, %r9, %r9
memptr_4_48:
	set user_data_start, %r31
	.word 0x8581fea5  ! 80: WRCCR_I	wr	%r7, 0x1ea5, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa190200f  ! 82: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_4_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_49:
	.word 0x8f902002  ! 83: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_4_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d928013  ! 84: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
splash_lsu_4_51:
	setx 0x6b88a69bb75c3e03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_52:
	setx 0x43fcbf206469a809, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x158fdae58c6768fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_54:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_55)+24, 16, 16)) -> intp(4,1,3)
xir_4_55:
	.word 0xa983376b  ! 90: WR_SET_SOFTINT_I	wr	%r12, 0x176b, %set_softint
	.word 0xa7a48dc0  ! 91: FdMULq	fdmulq	
memptr_4_56:
	set 0x60540000, %r31
	.word 0x85812b7b  ! 92: WRCCR_I	wr	%r4, 0x0b7b, %ccr
	.word 0x8d902e0e  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0e0e, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_4_57:
	setx 0x1ec1f728e65f2bef, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9192386b  ! 96: WRPR_PIL_I	wrpr	%r8, 0x186b, %pil
	.word 0x9345c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x879022de  ! 98: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
	.word 0xad812cb2  ! 99: WR_SOFTINT_REG_I	wr	%r4, 0x0cb2, %softint
change_to_randtl_4_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_58:
	.word 0x8f902002  ! 100: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_4_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902000  ! 102: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_hpstate_4_60:
	.word 0x81982d36  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d36, %hpstate
	.word 0x83d02035  ! 104: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x97a0016d  ! 105: FABSq	dis not found

splash_cmpr_4_61:
	setx 0x37fca2769d104568, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0xa1a089d4  ! 108: FDIVd	fdivd	%f2, %f20, %f16
	.word 0xd4800aa0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
	.word 0x91d020b5  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9a00167  ! 111: FABSq	dis not found

tagged_4_62:
	tsubcctv %r22, 0x1940, %r19
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_4_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d904012  ! 113: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96a2ce4  ! 114: SDIVX_I	sdivx	%r8, 0x0ce4, %r20
	.word 0x91d02034  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 52
	setx 0xd9a9bcdc0f5f6c2e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902357  ! 117: WRPR_TT_I	wrpr	%r0, 0x0357, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01969  ! 118: FqTOd	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01967  ! 119: FqTOd	dis not found

mondo_4_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d91800c  ! 120: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
DS_4_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_4_70:
	.word 0x81982b94  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_71:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 125: RDPC	rd	%pc, %r10
mondo_4_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c000  ! 126: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	.word 0xa24cc012  ! 127: MULX_R	mulx 	%r19, %r18, %r17
	setx 0x474f42fc82058500, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_4_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_4_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d930006  ! 137: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_4_77:
	set 0x60340000, %r31
	.word 0x8581bed0  ! 140: WRCCR_I	wr	%r6, 0x1ed0, %ccr
debug_4_78:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_78:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_78
    nop
debug_wait4_78:
    ld [%r23], %r2
    brnz %r2, debug_wait4_78
    nop
    ba,a debug_startwait4_78
continue_debug_4_78:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_78:
    cmp %r13, %r15
    bne,a wait_for_stat_4_78
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_78:
    cmp %r14, %r15
    bne,a wait_for_debug_4_78
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 141: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0x87802089  ! 142: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_4_79:
	setx 0x1305a8bc6d585a0e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa1902001  ! 146: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x95540000  ! 147: RDPR_GL	rdpr	%-, %r10
splash_hpstate_4_81:
	.word 0x81982b96  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_82) + 0, 16, 16)) -> intp(4,0,31)
intvec_4_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1348006  ! 1: STQF_R	-	%f8, [%r6, %r18]
	normalw
	.word 0x9b458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d902e6f  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x0e6f, %pstate
	.word 0x83d02032  ! 153: Tcc_I	te	icc_or_xcc, %r0 + 50
intveclr_4_84:
	setx 0x25f675c80a219fec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 155: RDPC	rd	%pc, %r18
splash_cmpr_4_86:
	setx 0x3cb2d06e330409b7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01973  ! 158: FqTOd	dis not found

mondo_4_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c009  ! 159: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_90-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_90:
	.word 0x9192c00a  ! 160: WRPR_PIL_R	wrpr	%r11, %r10, %pil
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d910008  ! 161: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
splash_lsu_4_92:
	setx 0x07bead1919a7dff7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_93:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_93:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_93
    nop
debug_wait4_93:
    ld [%r23], %r2
    brnz %r2, debug_wait4_93
    nop
    ba,a debug_startwait4_93
continue_debug_4_93:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_93:
    cmp %r13, %r15
    bne,a wait_for_stat_4_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_93:
    cmp %r14, %r15
    bne,a wait_for_debug_4_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 163: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
DS_4_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_4_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9818009  ! 166: WR_SET_SOFTINT_R	wr	%r6, %r9, %set_softint
	.word 0xe8d7e030  ! 167: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902003  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_96)+32, 16, 16)) -> intp(4,1,3)
xir_4_96:
	.word 0xa983713f  ! 171: WR_SET_SOFTINT_I	wr	%r13, 0x113f, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_4_97:
	setx 0xa2a6ab5cb5e62e57, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x92f9400b  ! 175: SDIVcc_R	sdivcc 	%r5, %r11, %r9
	.word 0xa750c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
memptr_4_98:
	set 0x60740000, %r31
	.word 0x85822173  ! 178: WRCCR_I	wr	%r8, 0x0173, %ccr
	setx 0x9ef32ecb0ab6665a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_100:
	setx 0x760a2a7de80ab698, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa190200d  ! 182: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_4_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_101:
	.word 0x8f902003  ! 183: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02033  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_4_102:
	tsubcctv %r18, 0x10cd, %r1
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 186: RDPC	rd	%pc, %r19
memptr_4_104:
	set 0x60340000, %r31
	.word 0x858438cb  ! 187: WRCCR_I	wr	%r16, 0x18cb, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01972  ! 188: FqTOd	dis not found

	.word 0x8d902cc9  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
	.word 0x879021b8  ! 190: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
debug_4_106:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_107:
	setx 0x0c4d7320c4083f7a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790233b  ! 193: WRPR_TT_I	wrpr	%r0, 0x033b, %tt
DS_4_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b00301  ! 194: ALIGNADDRESS	alignaddr	%r0, %r1, %r8
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0xa7a489c2  ! 196: FDIVd	fdivd	%f18, %f2, %f50
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 197: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_109:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 198: RDPC	rd	%pc, %r12
	.word 0x8790229c  ! 199: WRPR_TT_I	wrpr	%r0, 0x029c, %tt
	.word 0xd8d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_110:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 201: RDPC	rd	%pc, %r10
	.word 0x8d902c9a  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
mondo_4_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 203: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
mondo_4_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d91c003  ! 204: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_4_113:
	setx 0x484eec9c76a23727, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_114:
	setx 0xe464c1ef320e9f26, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802088  ! 208: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9b500000  ! 209: RDPR_TPC	<illegal instruction>
debug_4_115:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_4_116:
	setx 0x81f655dd64e7654e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 212: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_4_117:
	setx 0xdaa878ce3890366d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa5500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802004  ! 216: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_4_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x4dd0fa0940488216, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_122:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 222: RDPC	rd	%pc, %r10
tagged_4_123:
	taddcctv %r4, 0x177c, %r3
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_4_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f16, %f2, %f24
	.word 0xa5b04303  ! 224: ALIGNADDRESS	alignaddr	%r1, %r3, %r18
memptr_4_125:
	set 0x60140000, %r31
	.word 0x858376e8  ! 225: WRCCR_I	wr	%r13, 0x16e8, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0xa456610edffa52b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e1a  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_4_128:
	setx 0xb2b0a69acafc6595, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_129:
	set user_data_start, %r31
	.word 0x85843bf3  ! 231: WRCCR_I	wr	%r16, 0x1bf3, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_130:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 232: RDPC	rd	%pc, %r8
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_4_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_4_132:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_132:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_132
    nop
debug_wait4_132:
    ld [%r23], %r2
    brnz %r2, debug_wait4_132
    nop
    ba,a debug_startwait4_132
continue_debug_4_132:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_132:
    cmp %r13, %r15
    bne,a wait_for_stat_4_132
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_132:
    cmp %r14, %r15
    bne,a wait_for_debug_4_132
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00852  ! 237: STXA_R	stxa	%r19, [%r0 + %r18] 0x42
	.word 0x92824002  ! 238: ADDcc_R	addcc 	%r9, %r2, %r9
	.word 0x91d02034  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_hpstate_4_133:
	.word 0x81982b1d  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_4_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d910010  ! 242: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
tagged_4_135:
	taddcctv %r26, 0x1dea, %r3
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_4_136:
	setx 0xa392c6b87d07d1f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803ea3  ! 245: SIR	sir	0x1ea3
	.word 0x9ba00160  ! 246: FABSq	dis not found

splash_tba_4_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e000  ! 248: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
mondo_4_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d924013  ! 249: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x87802089  ! 250: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_4_139:
	setx 0x6ff27c8ca356cf67, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b50c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xa5a1c9c7  ! 255: FDIVd	fdivd	%f38, %f38, %f18
mondo_4_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d934010  ! 256: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
splash_lsu_4_142:
	setx 0x2167670bb9c27439, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_143)+40, 16, 16)) -> intp(4,1,3)
xir_4_143:
	.word 0xa981ba66  ! 258: WR_SET_SOFTINT_I	wr	%r6, 0x1a66, %set_softint
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 259: RDPC	rd	%pc, %r11
	.word 0x8d902a48  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x0a48, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0x91540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa1902002  ! 263: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d903d71  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1d71, %pstate
	.word 0x91d02032  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802063  ! 268: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_4_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_145:
	.word 0x8f902000  ! 269: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad84b1ab  ! 271: WR_SOFTINT_REG_I	wr	%r18, 0x11ab, %softint
	.word 0x87902206  ! 272: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c7db2  ! 274: SDIVX_I	sdivx	%r17, 0xfffffdb2, %r16
splash_hpstate_4_147:
	.word 0x81982455  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0455, %hpstate
	.word 0xa1902000  ! 276: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_4_148:
	setx 0xdd7d2d284d1d5027, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 278: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_4_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95a0016c  ! 280: FABSq	dis not found

splash_tba_4_150:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_151:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 282: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_4_152-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_152:
	.word 0x91900013  ! 283: WRPR_PIL_R	wrpr	%r0, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_153:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 284: RDPC	rd	%pc, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_4_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d918008  ! 286: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
	.word 0x8d903506  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x1506, %pstate
mondo_4_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904011  ! 288: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_4_157:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_4_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd15b9753	! Random illegal ?
	.word 0xe5114011  ! 1: LDQF_R	-	[%r5, %r17], %f18
	.word 0x99a44833  ! 291: FADDs	fadds	%f17, %f19, %f12
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_4_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_159-donret_4_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_4_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_4_161:
	taddcctv %r22, 0x1550, %r21
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9345c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_4_162:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_162:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_162
    nop
debug_wait4_162:
    ld [%r23], %r2
    brnz %r2, debug_wait4_162
    nop
    ba,a debug_startwait4_162
continue_debug_4_162:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_162:
    cmp %r13, %r15
    bne,a wait_for_stat_4_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_162:
    cmp %r14, %r15
    bne,a wait_for_debug_4_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 298: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
debug_4_163:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91520000  ! 300: RDPR_PIL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_4_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_164:
	.word 0x91948010  ! 301: WRPR_PIL_R	wrpr	%r18, %r16, %pil
	.word 0xe0d7e010  ! 302: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
splash_cmpr_4_165:
	setx 0x975f2fad0e1ca5b5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_166:
	.word 0x8198284f  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
donret_4_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_167-donret_4_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_4_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_4_168:
	setx 0xaa0cbab0a727a17b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa1902003  ! 308: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_hpstate_4_169:
	.word 0x81982757  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6b2fa5  ! 310: SDIVX_I	sdivx	%r12, 0x0fa5, %r13
	.word 0x8d9025e0  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x05e0, %pstate
splash_htba_4_171:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_4_172:
	.word 0x81982a8f  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8f, %hpstate
	.word 0x93450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xd6800be0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
	.word 0xa550c000  ! 316: RDPR_TT	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_4_173-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_173:
	.word 0x91900005  ! 317: WRPR_PIL_R	wrpr	%r0, %r5, %pil
mondo_4_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d928002  ! 318: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
	.word 0x8d9026a2  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x06a2, %pstate
	.word 0x91907f84  ! 320: WRPR_PIL_I	wrpr	%r1, 0x1f84, %pil
	.word 0x93454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe0cfe010  ! 322: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_4_175:
	set 0x60340000, %r31
	.word 0x8582b759  ! 323: WRCCR_I	wr	%r10, 0x1759, %ccr
	.word 0x93902006  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 326: RDPC	rd	%pc, %r16
debug_4_177:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_177:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_177
    nop
debug_wait4_177:
    ld [%r23], %r2
    brnz %r2, debug_wait4_177
    nop
    ba,a debug_startwait4_177
continue_debug_4_177:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_177:
    cmp %r13, %r15
    bne,a wait_for_stat_4_177
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_177:
    cmp %r14, %r15
    bne,a wait_for_debug_4_177
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 327: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
	.word 0xe0d7e020  ! 328: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
debug_4_178:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_4_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_4_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d920012  ! 331: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xa5464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r18
splash_cmpr_4_181:
	setx 0x5bf63fbc3c59ca90, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902006  ! 334: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_182:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 335: RDPC	rd	%pc, %r10
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0x9953c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_4_183:
	setx 0x2a956343346784b7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_4_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_4_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c007  ! 340: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_186) + 48, 16, 16)) -> intp(1,0,13)
intvec_4_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 342: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_4_187-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_187:
	.word 0x9192c014  ! 344: WRPR_PIL_R	wrpr	%r11, %r20, %pil
mondo_4_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d920006  ! 345: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_189-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_189:
	.word 0x91900010  ! 346: WRPR_PIL_R	wrpr	%r0, %r16, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_190) + 24, 16, 16)) -> intp(1,0,20)
intvec_4_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_4_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x91d020b5  ! 351: Tcc_I	ta	icc_or_xcc, %r0 + 181
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_192:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 352: RDPC	rd	%pc, %r10
	.word 0x99902005  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
tagged_4_193:
	taddcctv %r14, 0x1996, %r19
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c7f35  ! 358: SDIVX_I	sdivx	%r17, 0xffffff35, %r10
debug_4_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_195:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_195
    nop
debug_wait4_195:
    ld [%r23], %r2
    brnz %r2, debug_wait4_195
    nop
    ba,a debug_startwait4_195
continue_debug_4_195:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_195:
    cmp %r13, %r15
    bne,a wait_for_stat_4_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_195:
    cmp %r14, %r15
    bne,a wait_for_debug_4_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 359: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_hpstate_4_196:
	.word 0x81982345  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0345, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0xa7520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_4_197:
	setx 0x7f159a01cd12914b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_4_198:
	set user_data_start, %r31
	.word 0x8581ed3d  ! 366: WRCCR_I	wr	%r7, 0x0d3d, %ccr
	.word 0x87802004  ! 367: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_4_199:
	setx 0x2c3bf61882852220, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba489c1  ! 369: FDIVd	fdivd	%f18, %f32, %f44
memptr_4_200:
	set 0x60540000, %r31
	.word 0x8580f451  ! 370: WRCCR_I	wr	%r3, 0x1451, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_4_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d92c004  ! 372: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
debug_4_202:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_4_203:
	nop
	setx 0xfffff53efffffaf6, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 375: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_204) + 16, 16, 16)) -> intp(1,0,10)
intvec_4_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9945c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01974  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_206:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 380: RDPC	rd	%pc, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b6cc9  ! 381: SDIVX_I	sdivx	%r13, 0x0cc9, %r13
debug_4_208:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_4_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_209:
	.word 0x8f902003  ! 383: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87902197  ! 384: WRPR_TT_I	wrpr	%r0, 0x0197, %tt
	.word 0xa190200f  ! 385: WRPR_GL_I	wrpr	%r0, 0x000f, %-
memptr_4_210:
	set user_data_start, %r31
	.word 0x8581a4f1  ! 386: WRCCR_I	wr	%r6, 0x04f1, %ccr
	rd %pc, %r19
	add %r19, (ivw_4_211-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_211:
	.word 0x91920005  ! 387: WRPR_PIL_R	wrpr	%r8, %r5, %pil
	.word 0x8d903b14  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x1b14, %pstate
debug_4_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_213:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 390: RDPC	rd	%pc, %r18
	.word 0xa9500000  ! 391: RDPR_TPC	<illegal instruction>
DS_4_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe545abcf	! Random illegal ?
	.word 0xd1150014  ! 1: LDQF_R	-	[%r20, %r20], %f8
	.word 0x95a0c828  ! 392: FADDs	fadds	%f3, %f8, %f10
	.word 0xe4800a60  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x91926864  ! 395: WRPR_PIL_I	wrpr	%r9, 0x0864, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xaca350361e642758, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe49004a0  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x95a40d23  ! 401: FsMULd	fsmuld	%f16, %f34, %f10
	.word 0x93d020b2  ! 402: Tcc_I	tne	icc_or_xcc, %r0 + 178
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c7704  ! 404: SDIVX_I	sdivx	%r17, 0xfffff704, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_220:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 406: RDPC	rd	%pc, %r16
DS_4_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd1114012  ! 1: LDQF_R	-	[%r5, %r18], %f8
	.word 0x93a04823  ! 407: FADDs	fadds	%f1, %f3, %f9
	.word 0xd4dfe020  ! 408: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_4_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b10303  ! 409: ALIGNADDRESS	alignaddr	%r4, %r3, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cbd49  ! 410: SDIVX_I	sdivx	%r18, 0xfffffd49, %r8
splash_hpstate_4_224:
	.word 0x81982a0e  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0e, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 412: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_4_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 414: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_226:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 415: RDPC	rd	%pc, %r8
	setx 0x9f850d2c02d04f8b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00171  ! 417: FABSq	dis not found

donret_4_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_4_228-donret_4_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_4_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x91917a76  ! 419: WRPR_PIL_I	wrpr	%r5, 0x1a76, %pil
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 420: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe030  ! 421: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0xd88fe000  ! 422: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
tagged_4_229:
	taddcctv %r14, 0x1768, %r12
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f8020da  ! 424: SIR	sir	0x00da
tagged_4_230:
	tsubcctv %r6, 0x1ae8, %r20
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802000  ! 426: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_232:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 429: RDPC	rd	%pc, %r9
pmu_4_233:
	nop
	setx 0xfffff06bfffffd7a, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_234:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 431: RDPC	rd	%pc, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_4_235:
	set 0x60540000, %r31
	.word 0x85822cd2  ! 433: WRCCR_I	wr	%r8, 0x0cd2, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01966  ! 434: FqTOd	dis not found

splash_lsu_4_237:
	setx 0xda73e072b02e1821, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97a00162  ! 436: FABSq	dis not found

change_to_randtl_4_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_238:
	.word 0x8f902001  ! 437: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01964  ! 439: FqTOd	dis not found

intveclr_4_241:
	setx 0x556542985545f849, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200e  ! 442: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x95540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_4_242:
	setx 0x7a6f80e99fd33d08, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xd6e2cb17766906df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_244:
	set 0x60340000, %r31
	.word 0x858525d2  ! 447: WRCCR_I	wr	%r20, 0x05d2, %ccr
splash_cmpr_4_245:
	setx 0x4597b7e86e269a5b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d90c011  ! 449: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
	.word 0x83d02033  ! 450: Tcc_I	te	icc_or_xcc, %r0 + 51
pmu_4_247:
	nop
	setx 0xfffff99bfffff84a, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956d25fb  ! 452: SDIVX_I	sdivx	%r20, 0x05fb, %r10
DS_4_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_250:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 454: RDPC	rd	%pc, %r8
splash_cmpr_4_251:
	setx 0x5f6e6fd8fc5e9785, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_252) + 56, 16, 16)) -> intp(0,0,2)
intvec_4_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7114013  ! 1: LDQF_R	-	[%r5, %r19], %f11
	.word 0x97a20828  ! 457: FADDs	fadds	%f8, %f8, %f11
	.word 0xe0c7e000  ! 458: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0x87802088  ! 459: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_4_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_4_255:
	set user_data_start, %r31
	.word 0x8584e545  ! 462: WRCCR_I	wr	%r19, 0x0545, %ccr
memptr_4_256:
	set 0x60140000, %r31
	.word 0x8582afbc  ! 463: WRCCR_I	wr	%r10, 0x0fbc, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_257:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 464: RDPC	rd	%pc, %r8
debug_4_258:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_258:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_258
    nop
debug_wait4_258:
    ld [%r23], %r2
    brnz %r2, debug_wait4_258
    nop
    ba,a debug_startwait4_258
continue_debug_4_258:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_258:
    cmp %r13, %r15
    bne,a wait_for_stat_4_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_258:
    cmp %r14, %r15
    bne,a wait_for_debug_4_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00852  ! 465: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
mondo_4_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d918008  ! 466: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
DS_4_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f22, %f26
	.word 0x99b0830c  ! 467: ALIGNADDRESS	alignaddr	%r2, %r12, %r12
mondo_4_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c009  ! 468: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xa9a00167  ! 469: FABSq	dis not found

	.word 0xa1902002  ! 470: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x97540000  ! 471: RDPR_GL	rdpr	%-, %r11
change_to_randtl_4_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_262:
	.word 0x8f902002  ! 472: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802063  ! 473: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902000  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_4_263:
	setx 0x22ae00880fe0c52f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_264:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_264:
    mov 0x4, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_4_264
    nop
debug_wait4_264:
    ld [%r23], %r2
    brnz %r2, debug_wait4_264
    nop
    ba,a debug_startwait4_264
continue_debug_4_264:
    mov 0xe0, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_264:
    cmp %r13, %r15
    bne,a wait_for_stat_4_264
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_4_264:
    cmp %r14, %r15
    bne,a wait_for_debug_4_264
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %19, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00852  ! 477: STXA_R	stxa	%r18, [%r0 + %r18] 0x42
splash_cmpr_4_265:
	setx 0x35c7b86a48c46dc9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_266) + 0, 16, 16)) -> intp(1,0,1)
intvec_4_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_4_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_4_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 482: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x91a00164  ! 483: FABSq	dis not found

splash_tba_4_270:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_4_271:
	setx 0xb93ff5aaaf7005ed, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802ca5  ! 486: SIR	sir	0x0ca5
splash_lsu_4_272:
	setx 0x3aebd6468ecf099f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01961  ! 488: FqTOd	dis not found

	.word 0xa190200d  ! 489: WRPR_GL_I	wrpr	%r0, 0x000d, %-
debug_4_274:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6800bc0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	setx 0xb5507d16169ee6d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902286  ! 493: WRPR_TT_I	wrpr	%r0, 0x0286, %tt
memptr_4_276:
	set user_data_start, %r31
	.word 0x8584b655  ! 494: WRCCR_I	wr	%r18, 0x1655, %ccr
	.word 0xa1902005  ! 495: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_4_277:
	setx 0x93dc69a11e89826e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_278:
	set 0x60540000, %r31
	.word 0x85853a43  ! 498: WRCCR_I	wr	%r20, 0x1a43, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
pmu_3_0:
	nop
	setx 0xfffff93ffffff113, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_3_1:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0xa6d06cda  ! 4: UMULcc_I	umulcc 	%r1, 0x0cda, %r19
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_3_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_3_3:
	setx 0xab58ca2774e420d2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02032  ! 8: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_4:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902007  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	setx 0x84138cb1c3afb9a4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902317  ! 13: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
splash_lsu_3_6:
	setx 0x7995aeeabe48bdf9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9800001  ! 15: WR_SET_SOFTINT_R	wr	%r0, %r1, %set_softint
	.word 0x8d902e97  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 17: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0x5ef895ca39c497b9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a40dd0  ! 19: FdMULq	fdmulq	
change_to_randtl_3_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_8:
	.word 0x8f902001  ! 20: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_3_9:
	setx 0x94b1481456669bc9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_10:
	.word 0x81982a96  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a96, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa168f29a  ! 23: SDIVX_I	sdivx	%r3, 0xfffff29a, %r16
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802088  ! 25: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d020b3  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d90204b  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
mondo_3_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 28: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
tagged_3_13:
	taddcctv %r16, 0x15bf, %r20
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_3_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_3_16:
	setx 0x560309e24f034f82, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_3_17:
	taddcctv %r19, 0x18da, %r7
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 34: FqTOd	dis not found

	.word 0x99a00174  ! 35: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01962  ! 36: FqTOd	dis not found

debug_3_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa3a00168  ! 40: FABSq	dis not found

	setx 0x08797610ba446f5f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9745c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01962  ! 44: FqTOd	dis not found

	.word 0xa1902004  ! 45: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_3_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_23:
	.word 0x8f902002  ! 46: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_3_24:
	setx 0x94a1fff89ba486f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b29  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1b29, %pstate
splash_htba_3_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903c32  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x1c32, %pstate
splash_tba_3_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_3_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_27:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe6c80e40  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
mondo_3_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d92c009  ! 54: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
splash_cmpr_3_29:
	setx 0xf9b10a5e9c09c755, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_30:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 56: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe6d004a0  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
tagged_3_31:
	taddcctv %r10, 0x1cb3, %r10
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_3_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d924001  ! 59: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_33-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_33:
	.word 0x91928014  ! 60: WRPR_PIL_R	wrpr	%r10, %r20, %pil
splash_lsu_3_34:
	setx 0xb6bb0b7db2361d35, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_3_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_36:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 63: RDPC	rd	%pc, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01972  ! 64: FqTOd	dis not found

mondo_3_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d918001  ! 65: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
intveclr_3_39:
	setx 0xae3559394ac0c839, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800ac0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0xa1902009  ! 68: WRPR_GL_I	wrpr	%r0, 0x0009, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_40:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 69: RDPC	rd	%pc, %r8
splash_hpstate_3_41:
	.word 0x819824c5  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
splash_hpstate_3_42:
	.word 0x81982687  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
splash_cmpr_3_43:
	setx 0x71a6586ca58721af, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_3_44:
	setx 0xd2a3a273d76671f2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab81c00a  ! 74: WR_CLEAR_SOFTINT_R	wr	%r7, %r10, %clear_softint
debug_3_45:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 75: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
splash_lsu_3_46:
	setx 0x2ccfe01e3b6c99cb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_3_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d920013  ! 78: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0xa6ad0002  ! 79: ANDNcc_R	andncc 	%r20, %r2, %r19
memptr_3_48:
	set user_data_start, %r31
	.word 0x8584ac8e  ! 80: WRCCR_I	wr	%r18, 0x0c8e, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902006  ! 82: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_3_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_49:
	.word 0x8f902002  ! 83: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_3_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c009  ! 84: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
splash_lsu_3_51:
	setx 0x6fc19de8e8f5cef5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_3_52:
	setx 0xc9c3876a65795af1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x5ecab5bdb5689efc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_3_54:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_55)+16, 16, 16)) -> intp(3,1,3)
xir_3_55:
	.word 0xa9843879  ! 90: WR_SET_SOFTINT_I	wr	%r16, 0x1879, %set_softint
	.word 0x97a1cdca  ! 91: FdMULq	fdmulq	
memptr_3_56:
	set 0x60740000, %r31
	.word 0x85822cc6  ! 92: WRCCR_I	wr	%r8, 0x0cc6, %ccr
	.word 0x8d902c70  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0c70, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_3_57:
	setx 0xe773171e491634ba, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91947412  ! 96: WRPR_PIL_I	wrpr	%r17, 0x1412, %pil
	.word 0xa145c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0x879023e3  ! 98: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0xad803380  ! 99: WR_SOFTINT_REG_I	wr	%r0, 0x1380, %softint
change_to_randtl_3_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_58:
	.word 0x8f902001  ! 100: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_3_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 102: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_hpstate_3_60:
	.word 0x81982f25  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f25, %hpstate
	.word 0x93d02033  ! 104: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa3a00167  ! 105: FABSq	dis not found

splash_cmpr_3_61:
	setx 0x1a402e9a89ba51e3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x91a249cb  ! 108: FDIVd	fdivd	%f40, %f42, %f8
	.word 0xd4800b40  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	.word 0x91d02034  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91a00164  ! 111: FABSq	dis not found

tagged_3_62:
	tsubcctv %r21, 0x1e7c, %r8
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_3_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d90c000  ! 113: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cf06b  ! 114: SDIVX_I	sdivx	%r19, 0xfffff06b, %r9
	.word 0x91d02032  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 50
	setx 0xa2f4ed26c152ebb5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902030  ! 117: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196d  ! 118: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01967  ! 119: FqTOd	dis not found

mondo_3_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 120: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
DS_3_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_3_70:
	.word 0x8198271c  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_71:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 125: RDPC	rd	%pc, %r19
mondo_3_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 126: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xa4490011  ! 127: MULX_R	mulx 	%r4, %r17, %r18
	setx 0x2fe30e0a7ef70048, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_3_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_3_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d940014  ! 137: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_3_77:
	set 0x60540000, %r31
	.word 0x85843983  ! 140: WRCCR_I	wr	%r16, 0x1983, %ccr
debug_3_78:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 141: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x87802020  ! 142: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_3_79:
	setx 0xc64f552d2cfd6355, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200e  ! 146: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x97540000  ! 147: RDPR_GL	rdpr	%-, %r11
splash_hpstate_3_81:
	.word 0x81982c9d  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9d, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_82) + 40, 16, 16)) -> intp(5,0,29)
intvec_3_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9330002  ! 1: STQF_R	-	%f20, [%r2, %r12]
	normalw
	.word 0x93458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d902423  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x0423, %pstate
	.word 0x83d02034  ! 153: Tcc_I	te	icc_or_xcc, %r0 + 52
intveclr_3_84:
	setx 0x6a9c20ffe9eac5b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_85:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 155: RDPC	rd	%pc, %r11
splash_cmpr_3_86:
	setx 0xad928d6d5f92759f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01972  ! 158: FqTOd	dis not found

mondo_3_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 159: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_90-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_90:
	.word 0x9192400c  ! 160: WRPR_PIL_R	wrpr	%r9, %r12, %pil
mondo_3_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 161: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_lsu_3_92:
	setx 0x88812227b4774b6b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_93:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 163: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
DS_3_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_3_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa981c00a  ! 166: WR_SET_SOFTINT_R	wr	%r7, %r10, %set_softint
	.word 0xe8d7e020  ! 167: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_96)+24, 16, 16)) -> intp(3,1,3)
xir_3_96:
	.word 0xa981a40f  ! 171: WR_SET_SOFTINT_I	wr	%r6, 0x040f, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_3_97:
	setx 0x43b3e66e2b2bf8af, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4f9000d  ! 175: SDIVcc_R	sdivcc 	%r4, %r13, %r18
	.word 0x9550c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd8800a60  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
memptr_3_98:
	set 0x60740000, %r31
	.word 0x858229cc  ! 178: WRCCR_I	wr	%r8, 0x09cc, %ccr
	setx 0x1377a8d2e8081490, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_100:
	setx 0x70d92362ad656837, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902004  ! 182: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_3_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_101:
	.word 0x8f902002  ! 183: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02035  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_3_102:
	tsubcctv %r15, 0x1d73, %r3
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_103:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 186: RDPC	rd	%pc, %r13
memptr_3_104:
	set 0x60340000, %r31
	.word 0x85853a55  ! 187: WRCCR_I	wr	%r20, 0x1a55, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01971  ! 188: FqTOd	dis not found

	.word 0x8d90342e  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x142e, %pstate
	.word 0x879022bb  ! 190: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
debug_3_106:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_107:
	setx 0xd5977d5ead7eca39, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x879021eb  ! 193: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
DS_3_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb4c304  ! 194: ALIGNADDRESS	alignaddr	%r19, %r4, %r13
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0x9ba049c7  ! 196: FDIVd	fdivd	%f32, %f38, %f44
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 197: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_109:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 198: RDPC	rd	%pc, %r8
	.word 0x8790235c  ! 199: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
	.word 0xd8d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_110:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 201: RDPC	rd	%pc, %r10
	.word 0x8d9033a3  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x13a3, %pstate
mondo_3_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d940007  ! 203: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
mondo_3_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918001  ! 204: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_3_113:
	setx 0x1820e2e0912f1253, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_114:
	setx 0xc9cd187550a29749, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 208: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99500000  ! 209: RDPR_TPC	<illegal instruction>
debug_3_115:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_3_116:
	setx 0x2b5b3a070c36118c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 212: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_3_117:
	setx 0xbf5a3fe80c371e7b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0x93500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802004  ! 216: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_3_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0xa305509fa24424c5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_122:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 222: RDPC	rd	%pc, %r11
tagged_3_123:
	taddcctv %r14, 0x1363, %r11
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_3_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f0, %f24
	.word 0xa3b48312  ! 224: ALIGNADDRESS	alignaddr	%r18, %r18, %r17
memptr_3_125:
	set 0x60340000, %r31
	.word 0x8580a614  ! 225: WRCCR_I	wr	%r2, 0x0614, %ccr
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0xa3a164f0c86ee487, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902cae  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0cae, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_3_128:
	setx 0xcd1c4fcff03ccd9b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_3_129:
	set user_data_start, %r31
	.word 0x85843cd6  ! 231: WRCCR_I	wr	%r16, 0x1cd6, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_130:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 232: RDPC	rd	%pc, %r13
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802004  ! 235: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_3_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_3_132:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 237: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xa280c014  ! 238: ADDcc_R	addcc 	%r3, %r20, %r17
	.word 0x93d020b2  ! 239: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_hpstate_3_133:
	.word 0x81982117  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_3_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d940005  ! 242: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
tagged_3_135:
	taddcctv %r5, 0x1dba, %r5
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_3_136:
	setx 0xfb432a7142b9b7c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803bd5  ! 245: SIR	sir	0x1bd5
	.word 0xa1a00172  ! 246: FABSq	dis not found

splash_tba_3_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e000  ! 248: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
mondo_3_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92c011  ! 249: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0x87802016  ! 250: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_3_139:
	setx 0x7f9f0272bfebc407, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa550c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xa3a509cc  ! 255: FDIVd	fdivd	%f20, %f12, %f48
mondo_3_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d91c00a  ! 256: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
splash_lsu_3_142:
	setx 0xcbfcfb219df380f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_143)+0, 16, 16)) -> intp(3,1,3)
xir_3_143:
	.word 0xa985251b  ! 258: WR_SET_SOFTINT_I	wr	%r20, 0x051b, %set_softint
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 259: RDPC	rd	%pc, %r8
	.word 0x8d903af3  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1af3, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0xa3540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa190200d  ! 263: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d90206f  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x006f, %pstate
	.word 0x91d02034  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802063  ! 268: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_3_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_145:
	.word 0x8f902002  ! 269: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad80f69f  ! 271: WR_SOFTINT_REG_I	wr	%r3, 0x169f, %softint
	.word 0x87902380  ! 272: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968ece0  ! 274: SDIVX_I	sdivx	%r3, 0x0ce0, %r12
splash_hpstate_3_147:
	.word 0x81982955  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
	.word 0xa190200b  ! 276: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_3_148:
	setx 0x5f05e1215f0ca601, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95a00172  ! 280: FABSq	dis not found

splash_tba_3_150:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_151:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 282: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_3_152-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_152:
	.word 0x91900000  ! 283: WRPR_PIL_R	wrpr	%r0, %r0, %pil
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_153:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 284: RDPC	rd	%pc, %r19
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_3_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 286: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0x8d90388a  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x188a, %pstate
mondo_3_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d924010  ! 288: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_3_157:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_3_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93477873	! Random illegal ?
	.word 0xd7110011  ! 1: LDQF_R	-	[%r4, %r17], %f11
	.word 0xa3a44822  ! 291: FADDs	fadds	%f17, %f2, %f17
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_3_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_159-donret_3_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_3_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_3_161:
	taddcctv %r17, 0x13d2, %r3
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0xa345c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_3_162:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 298: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_3_163:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1520000  ! 300: RDPR_PIL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_3_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_164:
	.word 0x91948009  ! 301: WRPR_PIL_R	wrpr	%r18, %r9, %pil
	.word 0xe0d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_3_165:
	setx 0x3e5bfc88a8e7481c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_166:
	.word 0x8198285d  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085d, %hpstate
donret_3_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_167-donret_3_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_3_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_3_168:
	setx 0xa5ccf81405e43774, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200d  ! 308: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_hpstate_3_169:
	.word 0x81982146  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0146, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76c3206  ! 310: SDIVX_I	sdivx	%r16, 0xfffff206, %r19
	.word 0x8d9034b2  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x14b2, %pstate
splash_htba_3_171:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_3_172:
	.word 0x81982b1d  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x93450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xd6800c00  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
	.word 0xa750c000  ! 316: RDPR_TT	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_3_173-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_173:
	.word 0x91948010  ! 317: WRPR_PIL_R	wrpr	%r18, %r16, %pil
mondo_3_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 318: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x8d903b42  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x1b42, %pstate
	.word 0x91953788  ! 320: WRPR_PIL_I	wrpr	%r20, 0x1788, %pil
	.word 0xa9454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe0cfe000  ! 322: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
memptr_3_175:
	set 0x60740000, %r31
	.word 0x8584f04c  ! 323: WRCCR_I	wr	%r19, 0x104c, %ccr
	.word 0x93902005  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_176:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 326: RDPC	rd	%pc, %r13
debug_3_177:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 327: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xe0d7e010  ! 328: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
debug_3_178:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_3_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_3_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 331: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0xa1464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r16
splash_cmpr_3_181:
	setx 0x6192549b64a342fb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 334: WRPR_GL_I	wrpr	%r0, 0x0004, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_182:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 335: RDPC	rd	%pc, %r18
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0xa153c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_3_183:
	setx 0xfa5fa563661f6d23, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_3_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_3_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94000a  ! 340: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_186) + 32, 16, 16)) -> intp(0,0,25)
intvec_3_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 342: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_3_187-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_187:
	.word 0x9192400d  ! 344: WRPR_PIL_R	wrpr	%r9, %r13, %pil
mondo_3_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d940003  ! 345: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_189-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_189:
	.word 0x91934011  ! 346: WRPR_PIL_R	wrpr	%r13, %r17, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_190) + 56, 16, 16)) -> intp(5,0,22)
intvec_3_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_3_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x93d02033  ! 351: Tcc_I	tne	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_192:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 352: RDPC	rd	%pc, %r17
	.word 0x99902004  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
tagged_3_193:
	taddcctv %r11, 0x10ef, %r15
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad00e80  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1687153  ! 358: SDIVX_I	sdivx	%r1, 0xfffff153, %r16
debug_3_195:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 359: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
splash_hpstate_3_196:
	.word 0x819822dc  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dc, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x99520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_3_197:
	setx 0x73f395891b42b44f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_3_198:
	set user_data_start, %r31
	.word 0x8580a99d  ! 366: WRCCR_I	wr	%r2, 0x099d, %ccr
	.word 0x87802063  ! 367: WRASI_I	wr	%r0, 0x0063, %asi
splash_cmpr_3_199:
	setx 0x07235b78c1dc8301, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a109c0  ! 369: FDIVd	fdivd	%f4, %f0, %f50
memptr_3_200:
	set 0x60740000, %r31
	.word 0x8580bc9c  ! 370: WRCCR_I	wr	%r2, 0x1c9c, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_3_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d91c004  ! 372: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
debug_3_202:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_3_203:
	nop
	setx 0xfffff1cafffff87a, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b2  ! 375: Tcc_I	tne	icc_or_xcc, %r0 + 178
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_204) + 56, 16, 16)) -> intp(1,0,15)
intvec_3_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa745c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_206:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 380: RDPC	rd	%pc, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769a688  ! 381: SDIVX_I	sdivx	%r6, 0x0688, %r11
debug_3_208:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_3_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_209:
	.word 0x8f902001  ! 383: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879021f5  ! 384: WRPR_TT_I	wrpr	%r0, 0x01f5, %tt
	.word 0xa1902009  ! 385: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_3_210:
	set user_data_start, %r31
	.word 0x85802f6a  ! 386: WRCCR_I	wr	%r0, 0x0f6a, %ccr
	rd %pc, %r19
	add %r19, (ivw_3_211-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_211:
	.word 0x91934003  ! 387: WRPR_PIL_R	wrpr	%r13, %r3, %pil
	.word 0x8d902509  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0509, %pstate
debug_3_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_213:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 390: RDPC	rd	%pc, %r9
	.word 0xa7500000  ! 391: RDPR_TPC	<illegal instruction>
DS_3_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb5a9c3a	! Random illegal ?
	.word 0xd1144001  ! 1: LDQF_R	-	[%r17, %r1], %f8
	.word 0xa1a0c82d  ! 392: FADDs	fadds	%f3, %f13, %f16
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x9191af07  ! 395: WRPR_PIL_I	wrpr	%r6, 0x0f07, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0x1b591fe1012e7574, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe49004a0  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x99a44d30  ! 401: FsMULd	fsmuld	%f17, %f16, %f12
	.word 0x91d02032  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ca54f  ! 404: SDIVX_I	sdivx	%r18, 0x054f, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01965  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_220:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 406: RDPC	rd	%pc, %r8
DS_3_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5120012  ! 1: LDQF_R	-	[%r8, %r18], %f10
	.word 0x91a4c824  ! 407: FADDs	fadds	%f19, %f4, %f8
	.word 0xd4dfe030  ! 408: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
DS_3_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb0830c  ! 409: ALIGNADDRESS	alignaddr	%r2, %r12, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c231c  ! 410: SDIVX_I	sdivx	%r16, 0x031c, %r19
splash_hpstate_3_224:
	.word 0x819822d5  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_3_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94000c  ! 414: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_226:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 415: RDPC	rd	%pc, %r13
	setx 0x0341849a9dc32a36, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00170  ! 417: FABSq	dis not found

donret_3_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_3_228-donret_3_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_3_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x9190bc4d  ! 419: WRPR_PIL_I	wrpr	%r2, 0x1c4d, %pil
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 420: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd88fe030  ! 422: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
tagged_3_229:
	taddcctv %r7, 0x1223, %r26
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f803796  ! 424: SIR	sir	0x1796
tagged_3_230:
	tsubcctv %r1, 0x139c, %r14
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802000  ! 426: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_232:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 429: RDPC	rd	%pc, %r10
pmu_3_233:
	nop
	setx 0xfffff53efffffd2f, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_234:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 431: RDPC	rd	%pc, %r9
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_3_235:
	set 0x60740000, %r31
	.word 0x85846cd4  ! 433: WRCCR_I	wr	%r17, 0x0cd4, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 434: FqTOd	dis not found

splash_lsu_3_237:
	setx 0x9aeb0ffa9a233657, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00165  ! 436: FABSq	dis not found

change_to_randtl_3_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_238:
	.word 0x8f902002  ! 437: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01963  ! 439: FqTOd	dis not found

intveclr_3_241:
	setx 0xffbbd1925f0ed2c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200b  ! 442: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x93540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_3_242:
	setx 0x7de7df1fa09de933, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xca9f90007cb9b4c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_3_244:
	set 0x60140000, %r31
	.word 0x85842253  ! 447: WRCCR_I	wr	%r16, 0x0253, %ccr
splash_cmpr_3_245:
	setx 0x1fcc164e12c7e36e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d908006  ! 449: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
	.word 0x91d02033  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 51
pmu_3_247:
	nop
	setx 0xfffffce7fffff1d1, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa369758f  ! 452: SDIVX_I	sdivx	%r5, 0xfffff58f, %r17
DS_3_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_250:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 454: RDPC	rd	%pc, %r10
splash_cmpr_3_251:
	setx 0xe11f873c89c724c3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_252) + 0, 16, 16)) -> intp(5,0,7)
intvec_3_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9144007  ! 1: LDQF_R	-	[%r17, %r7], %f12
	.word 0x91a3482c  ! 457: FADDs	fadds	%f13, %f12, %f8
	.word 0xe0c7e030  ! 458: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
	.word 0x87802088  ! 459: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_3_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_3_255:
	set user_data_start, %r31
	.word 0x8584f3f6  ! 462: WRCCR_I	wr	%r19, 0x13f6, %ccr
memptr_3_256:
	set 0x60540000, %r31
	.word 0x85842143  ! 463: WRCCR_I	wr	%r16, 0x0143, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_257:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 464: RDPC	rd	%pc, %r9
debug_3_258:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 465: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
mondo_3_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d94000a  ! 466: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
DS_3_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f4, %f24
	.word 0xa7b44306  ! 467: ALIGNADDRESS	alignaddr	%r17, %r6, %r19
mondo_3_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d900008  ! 468: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0x97a00170  ! 469: FABSq	dis not found

	.word 0xa1902007  ! 470: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1540000  ! 471: RDPR_GL	rdpr	%-, %r16
change_to_randtl_3_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_262:
	.word 0x8f902001  ! 472: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802004  ! 473: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902005  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_3_263:
	setx 0x57b81d701831f81d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_264:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 477: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
splash_cmpr_3_265:
	setx 0xcee457d18ef2bde2, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_266) + 16, 16, 16)) -> intp(6,0,5)
intvec_3_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_3_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_3_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_3_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 482: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
	.word 0xa9a0016c  ! 483: FABSq	dis not found

splash_tba_3_270:
	set 0x003d0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_3_271:
	setx 0x0d411a0d4fc5c81c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803669  ! 486: SIR	sir	0x1669
splash_lsu_3_272:
	setx 0x5f921670f7d2b089, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01961  ! 488: FqTOd	dis not found

	.word 0xa190200e  ! 489: WRPR_GL_I	wrpr	%r0, 0x000e, %-
debug_3_274:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6800c60  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
	setx 0xb2b534e3262723e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023f7  ! 493: WRPR_TT_I	wrpr	%r0, 0x03f7, %tt
memptr_3_276:
	set user_data_start, %r31
	.word 0x85817ed6  ! 494: WRCCR_I	wr	%r5, 0x1ed6, %ccr
	.word 0xa190200c  ! 495: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_3_277:
	setx 0xf1dd851e3f1460cc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_278:
	set 0x60140000, %r31
	.word 0x8581b177  ! 498: WRCCR_I	wr	%r6, 0x1177, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
pmu_2_0:
	nop
	setx 0xfffff5c1fffff89a, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_2_1:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0x92d16240  ! 4: UMULcc_I	umulcc 	%r5, 0x0240, %r9
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_2_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_2_3:
	setx 0x194fa88c1a9bbdd8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 8: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_4:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0xc995cc538a0c4cb6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879023e3  ! 13: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
splash_lsu_2_6:
	setx 0x507ba56741764ee3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa981800d  ! 15: WR_SET_SOFTINT_R	wr	%r6, %r13, %set_softint
	.word 0x8d902884  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0884, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x2d78ecfecaeae636, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a10dc4  ! 19: FdMULq	fdmulq	
change_to_randtl_2_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_8:
	.word 0x8f902001  ! 20: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_2_9:
	setx 0xa60ff57320d04742, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_10:
	.word 0x8198261e  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061e, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36d356b  ! 23: SDIVX_I	sdivx	%r20, 0xfffff56b, %r17
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802063  ! 25: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x91d02032  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902a51  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
mondo_2_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d904003  ! 28: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
tagged_2_13:
	taddcctv %r7, 0x1193, %r7
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_2_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_2_16:
	setx 0x204a3305067acb16, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_17:
	taddcctv %r12, 0x1f97, %r25
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01973  ! 34: FqTOd	dis not found

	.word 0xa7a00161  ! 35: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196c  ! 36: FqTOd	dis not found

debug_2_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x99a0016d  ! 40: FABSq	dis not found

	setx 0x5a11762188ae73b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c40  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x9345c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01964  ! 44: FqTOd	dis not found

	.word 0xa1902006  ! 45: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_2_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_23:
	.word 0x8f902003  ! 46: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_lsu_2_24:
	setx 0x649ba523b17820a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902553  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0553, %pstate
splash_htba_2_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9022b8  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x02b8, %pstate
splash_tba_2_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_2_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_27:
	.word 0x8f902003  ! 52: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe6c80e40  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
mondo_2_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d930005  ! 54: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
splash_cmpr_2_29:
	setx 0x5634e1a647baf745, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_30:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 56: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
	.word 0xe6d004a0  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
tagged_2_31:
	taddcctv %r20, 0x12d6, %r2
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_2_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d908004  ! 59: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_33-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_33:
	.word 0x91924002  ! 60: WRPR_PIL_R	wrpr	%r9, %r2, %pil
splash_lsu_2_34:
	setx 0xaafdba1d43464d43, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_2_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_36:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 63: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01960  ! 64: FqTOd	dis not found

mondo_2_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d90c009  ! 65: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
intveclr_2_39:
	setx 0xcb4872be1224176d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa1902006  ! 68: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_40:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 69: RDPC	rd	%pc, %r20
splash_hpstate_2_41:
	.word 0x819823d5  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
splash_hpstate_2_42:
	.word 0x819825fe  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05fe, %hpstate
splash_cmpr_2_43:
	setx 0x5055e3743acba474, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_44:
	setx 0x2af45ca8296fe85e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab80800c  ! 74: WR_CLEAR_SOFTINT_R	wr	%r2, %r12, %clear_softint
debug_2_45:
	nop
	mov 8, %r18
	.word 0xd8f00852  ! 75: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
splash_lsu_2_46:
	setx 0xb84ca0cf843726ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_2_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 78: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0x92ab400a  ! 79: ANDNcc_R	andncc 	%r13, %r10, %r9
memptr_2_48:
	set user_data_start, %r31
	.word 0x8584ef60  ! 80: WRCCR_I	wr	%r19, 0x0f60, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa190200b  ! 82: WRPR_GL_I	wrpr	%r0, 0x000b, %-
change_to_randtl_2_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_49:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
mondo_2_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d908013  ! 84: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
splash_lsu_2_51:
	setx 0x3e60f914d99236f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_52:
	setx 0xec94fb40c867fc0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xba421f94e92157cc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_54:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_55)+8, 16, 16)) -> intp(2,1,3)
xir_2_55:
	.word 0xa98534bc  ! 90: WR_SET_SOFTINT_I	wr	%r20, 0x14bc, %set_softint
	.word 0x9ba1cdc3  ! 91: FdMULq	fdmulq	
memptr_2_56:
	set 0x60740000, %r31
	.word 0x858461f6  ! 92: WRCCR_I	wr	%r17, 0x01f6, %ccr
	.word 0x8d9038e3  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x18e3, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_2_57:
	setx 0x2a10be3c74e6b93a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9191ab86  ! 96: WRPR_PIL_I	wrpr	%r6, 0x0b86, %pil
	.word 0xa545c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8790223c  ! 98: WRPR_TT_I	wrpr	%r0, 0x023c, %tt
	.word 0xad8267ff  ! 99: WR_SOFTINT_REG_I	wr	%r9, 0x07ff, %softint
change_to_randtl_2_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_58:
	.word 0x8f902001  ! 100: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_2_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902002  ! 102: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_hpstate_2_60:
	.word 0x81982a5c  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	.word 0x91d02035  ! 104: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91a00174  ! 105: FABSq	dis not found

splash_cmpr_2_61:
	setx 0x9caf0f0237b4b5c6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x95a0c9c6  ! 108: FDIVd	fdivd	%f34, %f6, %f10
	.word 0xd48008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x91d020b4  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1a00172  ! 111: FABSq	dis not found

tagged_2_62:
	tsubcctv %r13, 0x128b, %r10
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_2_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d924014  ! 113: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968bea1  ! 114: SDIVX_I	sdivx	%r2, 0xfffffea1, %r12
	.word 0x91d02033  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 51
	setx 0x0f141bfa2b8e196e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790227e  ! 117: WRPR_TT_I	wrpr	%r0, 0x027e, %tt
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01960  ! 118: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01969  ! 119: FqTOd	dis not found

mondo_2_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92c004  ! 120: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
DS_2_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_2_70:
	.word 0x81982f96  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f96, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_71:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 125: RDPC	rd	%pc, %r11
mondo_2_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d934014  ! 126: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0xa84c0000  ! 127: MULX_R	mulx 	%r16, %r0, %r20
	setx 0xcbce49da80d9d41a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_2_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_2_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d904012  ! 137: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_2_77:
	set 0x60740000, %r31
	.word 0x85817e1c  ! 140: WRCCR_I	wr	%r5, 0x1e1c, %ccr
debug_2_78:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 141: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0x87802010  ! 142: WRASI_I	wr	%r0, 0x0010, %asi
splash_cmpr_2_79:
	setx 0xeb939f09ae879965, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200d  ! 146: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x97540000  ! 147: RDPR_GL	rdpr	%-, %r11
splash_hpstate_2_81:
	.word 0x819827ee  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ee, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_82) + 32, 16, 16)) -> intp(6,0,6)
intvec_2_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1318010  ! 1: STQF_R	-	%f8, [%r16, %r6]
	normalw
	.word 0xa3458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d9036a2  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x16a2, %pstate
	.word 0x93d02032  ! 153: Tcc_I	tne	icc_or_xcc, %r0 + 50
intveclr_2_84:
	setx 0x106278d8fbb983d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_85:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 155: RDPC	rd	%pc, %r13
splash_cmpr_2_86:
	setx 0xc7e60119a2ee4ccf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01964  ! 158: FqTOd	dis not found

mondo_2_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924002  ! 159: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_90-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_90:
	.word 0x9192c010  ! 160: WRPR_PIL_R	wrpr	%r11, %r16, %pil
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 161: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
splash_lsu_2_92:
	setx 0xa3cd76a57b932f79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_93:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 163: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
DS_2_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_2_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa981000d  ! 166: WR_SET_SOFTINT_R	wr	%r4, %r13, %set_softint
	.word 0xe8d7e020  ! 167: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902003  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_96)+32, 16, 16)) -> intp(2,1,3)
xir_2_96:
	.word 0xa9836732  ! 171: WR_SET_SOFTINT_I	wr	%r13, 0x0732, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_2_97:
	setx 0xf60aa00619b665a5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x94f80003  ! 175: SDIVcc_R	sdivcc 	%r0, %r3, %r10
	.word 0x9150c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
memptr_2_98:
	set 0x60540000, %r31
	.word 0x8580f4ba  ! 178: WRCCR_I	wr	%r3, 0x14ba, %ccr
	setx 0x20ec3b736ffc3b30, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_100:
	setx 0x676e43246a017a12, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902009  ! 182: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_randtl_2_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_101:
	.word 0x8f902000  ! 183: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_2_102:
	tsubcctv %r24, 0x1bdb, %r3
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_103:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 186: RDPC	rd	%pc, %r11
memptr_2_104:
	set 0x60540000, %r31
	.word 0x85803175  ! 187: WRCCR_I	wr	%r0, 0x1175, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01972  ! 188: FqTOd	dis not found

	.word 0x8d90327b  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x127b, %pstate
	.word 0x879023e2  ! 190: WRPR_TT_I	wrpr	%r0, 0x03e2, %tt
debug_2_106:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_107:
	setx 0xc865088e3ad7337b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902002  ! 193: WRPR_TT_I	wrpr	%r0, 0x0002, %tt
DS_2_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x99b04306  ! 194: ALIGNADDRESS	alignaddr	%r1, %r6, %r12
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0xa1a249cd  ! 196: FDIVd	fdivd	%f40, %f44, %f16
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 197: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_109:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 198: RDPC	rd	%pc, %r20
	.word 0x87902177  ! 199: WRPR_TT_I	wrpr	%r0, 0x0177, %tt
	.word 0xd8d00e40  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 201: RDPC	rd	%pc, %r20
	.word 0x8d9027f3  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x07f3, %pstate
mondo_2_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d910000  ! 203: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
mondo_2_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d918010  ! 204: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_2_113:
	setx 0x74f0b310060ad5f9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_114:
	setx 0xfb53eb22c932a756, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802063  ! 208: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93500000  ! 209: RDPR_TPC	<illegal instruction>
debug_2_115:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_2_116:
	setx 0xf6abacb9cbe839bf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 212: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_2_117:
	setx 0xfa6777ed7346a209, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0x97500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 216: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_2_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x13a342637074310a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_122:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 222: RDPC	rd	%pc, %r18
tagged_2_123:
	taddcctv %r3, 0x1167, %r7
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_2_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f28, %f4
	.word 0xa7b30302  ! 224: ALIGNADDRESS	alignaddr	%r12, %r2, %r19
memptr_2_125:
	set 0x60740000, %r31
	.word 0x8580bdd3  ! 225: WRCCR_I	wr	%r2, 0x1dd3, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0x31aa37dcce997057, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90388f  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x188f, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_2_128:
	setx 0x2c11e43b5e82221d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_129:
	set user_data_start, %r31
	.word 0x8584391e  ! 231: WRCCR_I	wr	%r16, 0x191e, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_130:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 232: RDPC	rd	%pc, %r12
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_2_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_2_132:
	nop
	mov 8, %r18
	.word 0xd4f00852  ! 237: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0x96824002  ! 238: ADDcc_R	addcc 	%r9, %r2, %r11
	.word 0x83d02033  ! 239: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_hpstate_2_133:
	.word 0x81982e97  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e97, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_2_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d904012  ! 242: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
tagged_2_135:
	taddcctv %r19, 0x17fd, %r15
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_2_136:
	setx 0xf47c6dc0dc8edc70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802501  ! 245: SIR	sir	0x0501
	.word 0xa3a00174  ! 246: FABSq	dis not found

splash_tba_2_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e010  ! 248: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
mondo_2_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d92c011  ! 249: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0x8780204f  ! 250: WRASI_I	wr	%r0, 0x004f, %asi
splash_cmpr_2_139:
	setx 0x460698bc3f8b26e7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa350c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe8900e80  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x74, %r20
	.word 0x91a089d3  ! 255: FDIVd	fdivd	%f2, %f50, %f8
mondo_2_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 256: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
splash_lsu_2_142:
	setx 0x9339127d31929e03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_143)+0, 16, 16)) -> intp(2,1,3)
xir_2_143:
	.word 0xa9846660  ! 258: WR_SET_SOFTINT_I	wr	%r17, 0x0660, %set_softint
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 259: RDPC	rd	%pc, %r13
	.word 0x8d90207d  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x007d, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0x95540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa1902009  ! 263: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d9028a5  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x08a5, %pstate
	.word 0x91d02033  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802058  ! 268: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_2_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_145:
	.word 0x8f902003  ! 269: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad846bf7  ! 271: WR_SOFTINT_REG_I	wr	%r17, 0x0bf7, %softint
	.word 0x879021e5  ! 272: WRPR_TT_I	wrpr	%r0, 0x01e5, %tt
	.word 0xd4800ba0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916d3e56  ! 274: SDIVX_I	sdivx	%r20, 0xfffffe56, %r8
splash_hpstate_2_147:
	.word 0x81982a6d  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a6d, %hpstate
	.word 0xa1902001  ! 276: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_2_148:
	setx 0x21ce93705c0bfa41, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97a00167  ! 280: FABSq	dis not found

splash_tba_2_150:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_151:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 282: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_2_152-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_152:
	.word 0x9194400c  ! 283: WRPR_PIL_R	wrpr	%r17, %r12, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_153:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 284: RDPC	rd	%pc, %r13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_2_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 286: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	.word 0x8d9025af  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x05af, %pstate
mondo_2_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 288: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_2_157:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_2_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbb6842af	! Random illegal ?
	.word 0xd914400d  ! 1: LDQF_R	-	[%r17, %r13], %f12
	.word 0xa7a44821  ! 291: FADDs	fadds	%f17, %f1, %f19
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_2_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_159-donret_2_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_2_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_2_161:
	taddcctv %r4, 0x1950, %r8
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9345c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_2_162:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 298: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_2_163:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x91520000  ! 300: RDPR_PIL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_2_164-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_164:
	.word 0x91948011  ! 301: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0xe0d7e000  ! 302: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
splash_cmpr_2_165:
	setx 0xf478b32acc60b259, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_166:
	.word 0x81982d97  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
donret_2_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_167-donret_2_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_2_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_2_168:
	setx 0x92da63e203db1a21, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200b  ! 308: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_hpstate_2_169:
	.word 0x81982544  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cb5da  ! 310: SDIVX_I	sdivx	%r18, 0xfffff5da, %r9
	.word 0x8d903b61  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1b61, %pstate
splash_htba_2_171:
	set 0x003a0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_2_172:
	.word 0x81982086  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0086, %hpstate
	.word 0x9b450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xd6800b00  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
	.word 0x9350c000  ! 316: RDPR_TT	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_2_173-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_173:
	.word 0x9194c013  ! 317: WRPR_PIL_R	wrpr	%r19, %r19, %pil
mondo_2_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d950008  ! 318: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x8d90312a  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x112a, %pstate
	.word 0x9191b014  ! 320: WRPR_PIL_I	wrpr	%r6, 0x1014, %pil
	.word 0x93454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe0cfe010  ! 322: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_2_175:
	set 0x60740000, %r31
	.word 0x8581e621  ! 323: WRCCR_I	wr	%r7, 0x0621, %ccr
	.word 0x93902007  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 326: RDPC	rd	%pc, %r19
debug_2_177:
	nop
	mov 8, %r18
	.word 0xe8f00852  ! 327: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0xe0d7e030  ! 328: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_2_178:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_2_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_2_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91800c  ! 331: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
	.word 0x9b464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r13
splash_cmpr_2_181:
	setx 0x574029b552de4a5c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902006  ! 334: WRPR_GL_I	wrpr	%r0, 0x0006, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_182:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 335: RDPC	rd	%pc, %r9
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0x9153c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_2_183:
	setx 0x6fcbd3b589609075, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_2_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_2_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 340: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_186) + 56, 16, 16)) -> intp(1,0,23)
intvec_2_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 342: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_2_187-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_187:
	.word 0x9194000b  ! 344: WRPR_PIL_R	wrpr	%r16, %r11, %pil
mondo_2_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d930005  ! 345: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_189-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_189:
	.word 0x91944014  ! 346: WRPR_PIL_R	wrpr	%r17, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_190) + 48, 16, 16)) -> intp(3,0,27)
intvec_2_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
debug_2_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x83d02034  ! 351: Tcc_I	te	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_192:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 352: RDPC	rd	%pc, %r9
	.word 0x99902004  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
tagged_2_193:
	taddcctv %r21, 0x16ef, %r15
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad00e40  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956c6349  ! 358: SDIVX_I	sdivx	%r17, 0x0349, %r10
debug_2_195:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 359: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_hpstate_2_196:
	.word 0x81982286  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0286, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x95520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_2_197:
	setx 0x8561bc86a54dc934, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02035  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_2_198:
	set user_data_start, %r31
	.word 0x8583782a  ! 366: WRCCR_I	wr	%r13, 0x182a, %ccr
	.word 0x87802014  ! 367: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_2_199:
	setx 0x9a3f7053f80a7fe0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a189c6  ! 369: FDIVd	fdivd	%f6, %f6, %f12
memptr_2_200:
	set 0x60540000, %r31
	.word 0x858531e5  ! 370: WRCCR_I	wr	%r20, 0x11e5, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_2_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 372: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
debug_2_202:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_2_203:
	nop
	setx 0xfffff93efffffa12, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 375: Tcc_I	ta	icc_or_xcc, %r0 + 180
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_204) + 8, 16, 16)) -> intp(3,0,16)
intvec_2_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9345c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01974  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_206:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 380: RDPC	rd	%pc, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b683f6f  ! 381: SDIVX_I	sdivx	%r0, 0xffffff6f, %r13
debug_2_208:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_2_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_209:
	.word 0x8f902001  ! 383: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902209  ! 384: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
	.word 0xa1902009  ! 385: WRPR_GL_I	wrpr	%r0, 0x0009, %-
memptr_2_210:
	set user_data_start, %r31
	.word 0x85843c43  ! 386: WRCCR_I	wr	%r16, 0x1c43, %ccr
	rd %pc, %r19
	add %r19, (ivw_2_211-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_211:
	.word 0x9194c013  ! 387: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0x8d902b09  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0b09, %pstate
debug_2_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_213:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 390: RDPC	rd	%pc, %r16
	.word 0x9b500000  ! 391: RDPR_TPC	<illegal instruction>
DS_2_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xb57587f6	! Random illegal ?
	.word 0xd7144002  ! 1: LDQF_R	-	[%r17, %r2], %f11
	.word 0x99a2c832  ! 392: FADDs	fadds	%f11, %f18, %f12
	.word 0xe4800c40  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x9194bf3e  ! 395: WRPR_PIL_I	wrpr	%r18, 0x1f3e, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xb0371f22c3d8de18, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4900e80  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
	.word 0x91a48d2a  ! 401: FsMULd	fsmuld	%f18, %f10, %f8
	.word 0x91d02033  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ce807  ! 404: SDIVX_I	sdivx	%r19, 0x0807, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01960  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_220:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 406: RDPC	rd	%pc, %r18
DS_2_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd310000c  ! 1: LDQF_R	-	[%r0, %r12], %f9
	.word 0xa3a40833  ! 407: FADDs	fadds	%f16, %f19, %f17
	.word 0xd4dfe000  ! 408: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
DS_2_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b18304  ! 409: ALIGNADDRESS	alignaddr	%r6, %r4, %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b7771  ! 410: SDIVX_I	sdivx	%r13, 0xfffff771, %r17
splash_hpstate_2_224:
	.word 0x8198209e  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_2_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d92800c  ! 414: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_226:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 415: RDPC	rd	%pc, %r10
	setx 0x7c3784a9485036c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00170  ! 417: FABSq	dis not found

donret_2_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_2_228-donret_2_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_2_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x91933eb0  ! 419: WRPR_PIL_I	wrpr	%r12, 0x1eb0, %pil
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 420: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe010  ! 421: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd88fe000  ! 422: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
tagged_2_229:
	taddcctv %r20, 0x1812, %r3
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f803123  ! 424: SIR	sir	0x1123
tagged_2_230:
	tsubcctv %r2, 0x11bd, %r7
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802004  ! 426: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_232:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 429: RDPC	rd	%pc, %r12
pmu_2_233:
	nop
	setx 0xfffff1bdfffffc16, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_234:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 431: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_2_235:
	set 0x60740000, %r31
	.word 0x8584337b  ! 433: WRCCR_I	wr	%r16, 0x137b, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01967  ! 434: FqTOd	dis not found

splash_lsu_2_237:
	setx 0x64ca82ce1abe70ff, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a00166  ! 436: FABSq	dis not found

change_to_randtl_2_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_238:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196b  ! 439: FqTOd	dis not found

intveclr_2_241:
	setx 0xe149a2e8ecebf31b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa1902006  ! 442: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x95540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_2_242:
	setx 0x2f8cf8b639b73e7d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xaf214755d26507e7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_244:
	set 0x60140000, %r31
	.word 0x8582b10a  ! 447: WRCCR_I	wr	%r10, 0x110a, %ccr
splash_cmpr_2_245:
	setx 0x9d3edecc92e5ed24, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c007  ! 449: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0x91d020b3  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 179
pmu_2_247:
	nop
	setx 0xfffff86cfffffcf5, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36ae120  ! 452: SDIVX_I	sdivx	%r11, 0x0120, %r17
DS_2_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_250:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 454: RDPC	rd	%pc, %r8
splash_cmpr_2_251:
	setx 0x203b1fd746bb2b58, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_252) + 32, 16, 16)) -> intp(7,0,28)
intvec_2_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9150001  ! 1: LDQF_R	-	[%r20, %r1], %f20
	.word 0x97a1c831  ! 457: FADDs	fadds	%f7, %f17, %f11
	.word 0xe0c7e030  ! 458: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
	.word 0x87802010  ! 459: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_2_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_2_255:
	set user_data_start, %r31
	.word 0x858274b1  ! 462: WRCCR_I	wr	%r9, 0x14b1, %ccr
memptr_2_256:
	set 0x60340000, %r31
	.word 0x85806b49  ! 463: WRCCR_I	wr	%r1, 0x0b49, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 464: RDPC	rd	%pc, %r17
debug_2_258:
	nop
	mov 8, %r18
	.word 0xd0f00852  ! 465: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
mondo_2_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d908010  ! 466: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
DS_2_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f8, %f12
	.word 0x95b3430a  ! 467: ALIGNADDRESS	alignaddr	%r13, %r10, %r10
mondo_2_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d930006  ! 468: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	.word 0xa9a00168  ! 469: FABSq	dis not found

	.word 0xa190200b  ! 470: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93540000  ! 471: RDPR_GL	rdpr	%-, %r9
change_to_randtl_2_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_262:
	.word 0x8f902000  ! 472: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802063  ! 473: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902007  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_2_263:
	setx 0x9619eaf895bc9611, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_264:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 477: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_cmpr_2_265:
	setx 0x985f3a005aae8c25, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_266) + 0, 16, 16)) -> intp(7,0,15)
intvec_2_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_2_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_2_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d920009  ! 482: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
	.word 0x99a00164  ! 483: FABSq	dis not found

splash_tba_2_270:
	set 0x003e0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_2_271:
	setx 0xdd367de22649813c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802586  ! 486: SIR	sir	0x0586
splash_lsu_2_272:
	setx 0xfe3ec3e574ba7df5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01963  ! 488: FqTOd	dis not found

	.word 0xa1902009  ! 489: WRPR_GL_I	wrpr	%r0, 0x0009, %-
debug_2_274:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe6800be0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
	setx 0x6e5a70014565adf3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902267  ! 493: WRPR_TT_I	wrpr	%r0, 0x0267, %tt
memptr_2_276:
	set user_data_start, %r31
	.word 0x85807846  ! 494: WRCCR_I	wr	%r1, 0x1846, %ccr
	.word 0xa1902008  ! 495: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_2_277:
	setx 0xd1d9b052cfa0eb71, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_2_278:
	set 0x60140000, %r31
	.word 0x8583373b  ! 498: WRCCR_I	wr	%r12, 0x173b, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
pmu_1_0:
	nop
	setx 0xfffff6ddfffffc72, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_1_1:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0x94d363c8  ! 4: UMULcc_I	umulcc 	%r13, 0x03c8, %r10
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_1_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_1_3:
	setx 0x7b803a387c562420, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b4  ! 8: Tcc_I	ta	icc_or_xcc, %r0 + 180
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 9: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_1_4:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902001  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	setx 0x73a1f7bf07a13b52, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790229f  ! 13: WRPR_TT_I	wrpr	%r0, 0x029f, %tt
splash_lsu_1_6:
	setx 0x5010c91bb2c22dbf, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9800014  ! 15: WR_SET_SOFTINT_R	wr	%r0, %r20, %set_softint
	.word 0x8d902b7f  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0b7f, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x24a6611e7c1485f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a50dcd  ! 19: FdMULq	fdmulq	
change_to_randtl_1_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_8:
	.word 0x8f902002  ! 20: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_1_9:
	setx 0x93dfd3ee9d293bfd, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_10:
	.word 0x819828ce  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936cf920  ! 23: SDIVX_I	sdivx	%r19, 0xfffff920, %r9
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802089  ! 25: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02033  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90301d  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x101d, %pstate
mondo_1_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d944011  ! 28: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
tagged_1_13:
	taddcctv %r17, 0x1917, %r20
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_1_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_1_16:
	setx 0xe1e18b872a05a4e5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_17:
	taddcctv %r8, 0x1c78, %r12
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01969  ! 34: FqTOd	dis not found

	.word 0x97a00169  ! 35: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a0196b  ! 36: FqTOd	dis not found

debug_1_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa7a00161  ! 40: FABSq	dis not found

	setx 0xab5e74b9cb7d4b1d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9b45c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01970  ! 44: FqTOd	dis not found

	.word 0xa1902006  ! 45: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_1_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_23:
	.word 0x8f902001  ! 46: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_1_24:
	setx 0x7fd36c2813d2f15b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038b2  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x18b2, %pstate
splash_htba_1_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9038b8  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x18b8, %pstate
splash_tba_1_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_1_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_27:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe6c80e40  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
mondo_1_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d94400d  ! 54: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
splash_cmpr_1_29:
	setx 0x6f1921486cd7f6a2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_30:
	nop
	mov 8, %r18
	.word 0xdef00852  ! 56: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
	.word 0xe6d00e60  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r19
tagged_1_31:
	taddcctv %r20, 0x1fec, %r12
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_1_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934009  ! 59: WRPR_WSTATE_R	wrpr	%r13, %r9, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_33-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_33:
	.word 0x91900014  ! 60: WRPR_PIL_R	wrpr	%r0, %r20, %pil
splash_lsu_1_34:
	setx 0x51204dcbf62c6c8d, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_1_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_36:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 63: RDPC	rd	%pc, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01961  ! 64: FqTOd	dis not found

mondo_1_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d920013  ! 65: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
intveclr_1_39:
	setx 0xd6eef7c8a7cf3038, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa1902004  ! 68: WRPR_GL_I	wrpr	%r0, 0x0004, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_40:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 69: RDPC	rd	%pc, %r11
splash_hpstate_1_41:
	.word 0x81982e05  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e05, %hpstate
splash_hpstate_1_42:
	.word 0x8198297d  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x097d, %hpstate
splash_cmpr_1_43:
	setx 0x3de9c3ab25b252eb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_44:
	setx 0x6e4cfc52adb31ff6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab850010  ! 74: WR_CLEAR_SOFTINT_R	wr	%r20, %r16, %clear_softint
debug_1_45:
	nop
	mov 8, %r18
	.word 0xd6f00852  ! 75: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
splash_lsu_1_46:
	setx 0x3e91e487a0d2fb79, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_1_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908012  ! 78: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	.word 0x98ac8000  ! 79: ANDNcc_R	andncc 	%r18, %r0, %r12
memptr_1_48:
	set user_data_start, %r31
	.word 0x85846196  ! 80: WRCCR_I	wr	%r17, 0x0196, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902005  ! 82: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_1_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_49:
	.word 0x8f902002  ! 83: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_1_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d928009  ! 84: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
splash_lsu_1_51:
	setx 0x7175d72663bb667f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_52:
	setx 0xd46b6baa0505f8d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x04650fd995a266f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_54:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02033  ! 89: Tcc_I	te	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_55)+48, 16, 16)) -> intp(1,1,3)
xir_1_55:
	.word 0xa98372b3  ! 90: WR_SET_SOFTINT_I	wr	%r13, 0x12b3, %set_softint
	.word 0x99a14dc7  ! 91: FdMULq	fdmulq	
memptr_1_56:
	set 0x60140000, %r31
	.word 0x8584f6cc  ! 92: WRCCR_I	wr	%r19, 0x16cc, %ccr
	.word 0x8d903a9f  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1a9f, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_1_57:
	setx 0xff65f71d7a1eb566, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91906f1d  ! 96: WRPR_PIL_I	wrpr	%r1, 0x0f1d, %pil
	.word 0x9b45c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x879023e5  ! 98: WRPR_TT_I	wrpr	%r0, 0x03e5, %tt
	.word 0xad826a6f  ! 99: WR_SOFTINT_REG_I	wr	%r9, 0x0a6f, %softint
change_to_randtl_1_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_58:
	.word 0x8f902002  ! 100: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_1_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902004  ! 102: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_hpstate_1_60:
	.word 0x819828e5  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08e5, %hpstate
	.word 0x91d02033  ! 104: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7a00170  ! 105: FABSq	dis not found

splash_cmpr_1_61:
	setx 0x7ed311bd3c7ddf35, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x95a0c9d0  ! 108: FDIVd	fdivd	%f34, %f16, %f10
	.word 0xd4800a80  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0x91d02033  ! 110: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99a00171  ! 111: FABSq	dis not found

tagged_1_62:
	tsubcctv %r15, 0x1143, %r7
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_1_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d90c00b  ! 113: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c31c0  ! 114: SDIVX_I	sdivx	%r16, 0xfffff1c0, %r8
	.word 0x91d02035  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0xba1e082055a7ed22, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879022d4  ! 117: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 118: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 119: FqTOd	dis not found

mondo_1_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d950001  ! 120: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
DS_1_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_1_70:
	.word 0x81982516  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0516, %hpstate
	.word 0xd6c004a0  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_71:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 125: RDPC	rd	%pc, %r11
mondo_1_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d900002  ! 126: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
	.word 0x904a8009  ! 127: MULX_R	mulx 	%r10, %r9, %r8
	setx 0x7d88a3a6b7d4d958, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_1_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e020  ! 131: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 136: Tcc_R	te	icc_or_xcc, %r0 + %r30
mondo_1_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d90000a  ! 137: WRPR_WSTATE_R	wrpr	%r0, %r10, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_1_77:
	set 0x60540000, %r31
	.word 0x85813496  ! 140: WRCCR_I	wr	%r4, 0x1496, %ccr
debug_1_78:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 141: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0x87802004  ! 142: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_1_79:
	setx 0x9f1e0ad1a272e1fa, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200c  ! 146: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1540000  ! 147: RDPR_GL	rdpr	%-, %r16
splash_hpstate_1_81:
	.word 0x819824ce  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_82) + 32, 16, 16)) -> intp(1,0,12)
intvec_1_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7300012  ! 1: STQF_R	-	%f19, [%r18, %r0]
	normalw
	.word 0x93458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d902bb3  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x0bb3, %pstate
	.word 0x91d02032  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_1_84:
	setx 0xdc58d78a2875e4d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 155: RDPC	rd	%pc, %r17
splash_cmpr_1_86:
	setx 0xade0018a4bd0f577, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01967  ! 158: FqTOd	dis not found

mondo_1_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d900011  ! 159: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_90-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_90:
	.word 0x9192c008  ! 160: WRPR_PIL_R	wrpr	%r11, %r8, %pil
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 161: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
splash_lsu_1_92:
	setx 0xbfb5b1f64ba0ad35, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_93:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 163: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
DS_1_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_1_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9830007  ! 166: WR_SET_SOFTINT_R	wr	%r12, %r7, %set_softint
	.word 0xe8d7e010  ! 167: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_96)+8, 16, 16)) -> intp(1,1,3)
xir_1_96:
	.word 0xa9812d18  ! 171: WR_SET_SOFTINT_I	wr	%r4, 0x0d18, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_1_97:
	setx 0x32f032a3c9c9f319, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa8fc8013  ! 175: SDIVcc_R	sdivcc 	%r18, %r19, %r20
	.word 0x9350c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd8800aa0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
memptr_1_98:
	set 0x60340000, %r31
	.word 0x8580aee9  ! 178: WRCCR_I	wr	%r2, 0x0ee9, %ccr
	setx 0xad652da68355c3f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_100:
	setx 0x9cd926effd4c2de5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8800c80  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
	.word 0xa1902004  ! 182: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_1_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_101:
	.word 0x8f902002  ! 183: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d02035  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_1_102:
	tsubcctv %r9, 0x1bdb, %r21
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 186: RDPC	rd	%pc, %r18
memptr_1_104:
	set 0x60340000, %r31
	.word 0x8582f238  ! 187: WRCCR_I	wr	%r11, 0x1238, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01963  ! 188: FqTOd	dis not found

	.word 0x8d903c46  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1c46, %pstate
	.word 0x879021fe  ! 190: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
debug_1_106:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_107:
	setx 0xc5f673bfb090cc18, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8790200a  ! 193: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
DS_1_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x97b2830c  ! 194: ALIGNADDRESS	alignaddr	%r10, %r12, %r11
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0xa3a149c1  ! 196: FDIVd	fdivd	%f36, %f32, %f48
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 197: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_109:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 198: RDPC	rd	%pc, %r10
	.word 0x87902138  ! 199: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0xd8d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_110:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 201: RDPC	rd	%pc, %r11
	.word 0x8d9034ce  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x14ce, %pstate
mondo_1_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d924010  ! 203: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
mondo_1_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 204: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_1_113:
	setx 0xb2fd24290fcd4799, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_114:
	setx 0x21d29e53fabf35ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8780204f  ! 208: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91500000  ! 209: RDPR_TPC	<illegal instruction>
debug_1_115:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_1_116:
	setx 0xd9e97f3b67fa99e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 212: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_1_117:
	setx 0xe07aaca2f22c746b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0x9b500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 216: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_1_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0x4dae647517e1fc57, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_122:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 222: RDPC	rd	%pc, %r11
tagged_1_123:
	taddcctv %r4, 0x1887, %r25
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_1_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f26, %f24
	.word 0x91b30309  ! 224: ALIGNADDRESS	alignaddr	%r12, %r9, %r8
memptr_1_125:
	set 0x60140000, %r31
	.word 0x858321f2  ! 225: WRCCR_I	wr	%r12, 0x01f2, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0xf0924550b8dd566c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e92  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_1_128:
	setx 0x0ddfe8c60c4609b1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_129:
	set user_data_start, %r31
	.word 0x85852b81  ! 231: WRCCR_I	wr	%r20, 0x0b81, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_130:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 232: RDPC	rd	%pc, %r16
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
debug_1_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_1_132:
	nop
	mov 8, %r18
	.word 0xd2f00852  ! 237: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
	.word 0xa883000c  ! 238: ADDcc_R	addcc 	%r12, %r12, %r20
	.word 0x93d020b4  ! 239: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_hpstate_1_133:
	.word 0x81982297  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0297, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_1_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91c000  ! 242: WRPR_WSTATE_R	wrpr	%r7, %r0, %wstate
tagged_1_135:
	taddcctv %r8, 0x14f5, %r17
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_1_136:
	setx 0xce20db93a0a52c81, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803b15  ! 245: SIR	sir	0x1b15
	.word 0x9ba00168  ! 246: FABSq	dis not found

splash_tba_1_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e020  ! 248: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
mondo_1_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90400c  ! 249: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	.word 0x87802058  ! 250: WRASI_I	wr	%r0, 0x0058, %asi
splash_cmpr_1_139:
	setx 0xe68a09e7e552a9ce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9550c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe8900e80  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x74, %r20
	.word 0x95a4c9d0  ! 255: FDIVd	fdivd	%f50, %f16, %f10
mondo_1_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d92800d  ! 256: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
splash_lsu_1_142:
	setx 0x57bab9e517b1ea09, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_143)+32, 16, 16)) -> intp(1,1,3)
xir_1_143:
	.word 0xa98430aa  ! 258: WR_SET_SOFTINT_I	wr	%r16, 0x10aa, %set_softint
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 259: RDPC	rd	%pc, %r18
	.word 0x8d903236  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x1236, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0xa3540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa190200c  ! 263: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d903c05  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1c05, %pstate
	.word 0x91d02033  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802058  ! 268: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_1_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_145:
	.word 0x8f902003  ! 269: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad833c98  ! 271: WR_SOFTINT_REG_I	wr	%r12, 0x1c98, %softint
	.word 0x87902247  ! 272: WRPR_TT_I	wrpr	%r0, 0x0247, %tt
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916860c5  ! 274: SDIVX_I	sdivx	%r1, 0x00c5, %r8
splash_hpstate_1_147:
	.word 0x81982d05  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0xa1902004  ! 276: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_1_148:
	setx 0x072d96db54b9fd61, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 278: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_1_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9ba00161  ! 280: FABSq	dis not found

splash_tba_1_150:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_151:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 282: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_1_152-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_152:
	.word 0x91904006  ! 283: WRPR_PIL_R	wrpr	%r1, %r6, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_153:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 284: RDPC	rd	%pc, %r20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_1_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d95000a  ! 286: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0x8d9029ac  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x09ac, %pstate
mondo_1_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d924014  ! 288: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xd2c804a0  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
debug_1_157:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_1_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf550d6f0	! Random illegal ?
	.word 0xdb114005  ! 1: LDQF_R	-	[%r5, %r5], %f13
	.word 0x93a08833  ! 291: FADDs	fadds	%f2, %f19, %f9
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_1_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_159-donret_1_159), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_1_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_1_161:
	taddcctv %r24, 0x1203, %r26
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9145c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_1_162:
	nop
	mov 8, %r18
	.word 0xdcf00852  ! 298: STXA_R	stxa	%r14, [%r0 + %r18] 0x42
debug_1_163:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x97520000  ! 300: RDPR_PIL	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_1_164-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_164:
	.word 0x9191c009  ! 301: WRPR_PIL_R	wrpr	%r7, %r9, %pil
	.word 0xe0d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
splash_cmpr_1_165:
	setx 0xb519baf392462ca5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_166:
	.word 0x819826de  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
donret_1_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_167-donret_1_167), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_1_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_1_168:
	setx 0x350b1a57f084cb7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800ba0  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r16
	.word 0xa190200f  ! 308: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_hpstate_1_169:
	.word 0x81982307  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996af3cc  ! 310: SDIVX_I	sdivx	%r11, 0xfffff3cc, %r12
	.word 0x8d902838  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x0838, %pstate
splash_htba_1_171:
	set 0x003b0000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_1_172:
	.word 0x8198299f  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099f, %hpstate
	.word 0xa9450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r20
	.word 0xd68008a0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa950c000  ! 316: RDPR_TT	<illegal instruction>
	rd %pc, %r19
	add %r19, (ivw_1_173-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_173:
	.word 0x91920000  ! 317: WRPR_PIL_R	wrpr	%r8, %r0, %pil
mondo_1_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90800d  ! 318: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
	.word 0x8d903e8b  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x1e8b, %pstate
	.word 0x91907aad  ! 320: WRPR_PIL_I	wrpr	%r1, 0x1aad, %pil
	.word 0x91454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xe0cfe000  ! 322: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
memptr_1_175:
	set 0x60740000, %r31
	.word 0x8581b6b5  ! 323: WRCCR_I	wr	%r6, 0x16b5, %ccr
	.word 0x93902007  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_176:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 326: RDPC	rd	%pc, %r9
debug_1_177:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 327: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
	.word 0xe0d7e030  ! 328: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
debug_1_178:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_1_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_1_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d92c00c  ! 331: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0xa9464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r20
splash_cmpr_1_181:
	setx 0x4d240e4a6fdbd542, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1902004  ! 334: WRPR_GL_I	wrpr	%r0, 0x0004, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_182:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 335: RDPC	rd	%pc, %r13
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0xa353c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_1_183:
	setx 0xda56d97e91d0e84c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_1_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_1_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d928014  ! 340: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_186) + 48, 16, 16)) -> intp(7,0,9)
intvec_1_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 342: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
	rd %pc, %r19
	add %r19, (ivw_1_187-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_187:
	.word 0x91908014  ! 344: WRPR_PIL_R	wrpr	%r2, %r20, %pil
mondo_1_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d944002  ! 345: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_189-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_189:
	.word 0x91918014  ! 346: WRPR_PIL_R	wrpr	%r6, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_190) + 40, 16, 16)) -> intp(7,0,2)
intvec_1_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
debug_1_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x93d02034  ! 351: Tcc_I	tne	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_192:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 352: RDPC	rd	%pc, %r12
	.word 0x99902004  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
tagged_1_193:
	taddcctv %r16, 0x1aa8, %r11
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c2c62  ! 358: SDIVX_I	sdivx	%r16, 0x0c62, %r8
debug_1_195:
	nop
	mov 8, %r18
	.word 0xdaf00852  ! 359: STXA_R	stxa	%r13, [%r0 + %r18] 0x42
splash_hpstate_1_196:
	.word 0x81982747  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x91520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_1_197:
	setx 0x0620d48dad121c2e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02035  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_1_198:
	set user_data_start, %r31
	.word 0x85852c4a  ! 366: WRCCR_I	wr	%r20, 0x0c4a, %ccr
	.word 0x87802004  ! 367: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_1_199:
	setx 0x4b5db96550db6633, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a4c9cb  ! 369: FDIVd	fdivd	%f50, %f42, %f18
memptr_1_200:
	set 0x60140000, %r31
	.word 0x85837851  ! 370: WRCCR_I	wr	%r13, 0x1851, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_1_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d948008  ! 372: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
debug_1_202:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_1_203:
	nop
	setx 0xfffffb02fffffcd8, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 375: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_204) + 24, 16, 16)) -> intp(5,0,13)
intvec_1_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa545c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01969  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_206:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 380: RDPC	rd	%pc, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c3d31  ! 381: SDIVX_I	sdivx	%r16, 0xfffffd31, %r9
debug_1_208:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_1_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_209:
	.word 0x8f902001  ! 383: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902243  ! 384: WRPR_TT_I	wrpr	%r0, 0x0243, %tt
	.word 0xa190200b  ! 385: WRPR_GL_I	wrpr	%r0, 0x000b, %-
memptr_1_210:
	set user_data_start, %r31
	.word 0x8584bc32  ! 386: WRCCR_I	wr	%r18, 0x1c32, %ccr
	rd %pc, %r19
	add %r19, (ivw_1_211-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_211:
	.word 0x9192c00a  ! 387: WRPR_PIL_R	wrpr	%r11, %r10, %pil
	.word 0x8d90353f  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x153f, %pstate
debug_1_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_213:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 390: RDPC	rd	%pc, %r11
	.word 0xa7500000  ! 391: RDPR_TPC	<illegal instruction>
DS_1_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9b40bb5b	! Random illegal ?
	.word 0xd1140006  ! 1: LDQF_R	-	[%r16, %r6], %f8
	.word 0xa1a48830  ! 392: FADDs	fadds	%f18, %f16, %f16
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x91903806  ! 395: WRPR_PIL_I	wrpr	%r0, 0x1806, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0xcb8361cb932349dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe49004a0  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x99a18d2c  ! 401: FsMULd	fsmuld	%f6, %f12, %f12
	.word 0x91d020b4  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16c275e  ! 404: SDIVX_I	sdivx	%r16, 0x075e, %r16
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01969  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_220:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 406: RDPC	rd	%pc, %r13
DS_1_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7110005  ! 1: LDQF_R	-	[%r4, %r5], %f11
	.word 0xa5a2c823  ! 407: FADDs	fadds	%f11, %f3, %f18
	.word 0xd4dfe000  ! 408: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
DS_1_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b1430c  ! 409: ALIGNADDRESS	alignaddr	%r5, %r12, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ca97d  ! 410: SDIVX_I	sdivx	%r18, 0x097d, %r10
splash_hpstate_1_224:
	.word 0x81982fc6  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_1_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90400c  ! 414: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_226:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 415: RDPC	rd	%pc, %r20
	setx 0xe42b6e5728509e11, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00167  ! 417: FABSq	dis not found

donret_1_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_1_228-donret_1_228), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_1_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x9192b3db  ! 419: WRPR_PIL_I	wrpr	%r10, 0x13db, %pil
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 420: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe000  ! 421: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0xd88fe000  ! 422: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
tagged_1_229:
	taddcctv %r24, 0x19bc, %r5
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f802cff  ! 424: SIR	sir	0x0cff
tagged_1_230:
	tsubcctv %r2, 0x1a8c, %r6
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802000  ! 426: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_232:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 429: RDPC	rd	%pc, %r8
pmu_1_233:
	nop
	setx 0xfffff900fffff56b, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_234:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 431: RDPC	rd	%pc, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_1_235:
	set 0x60140000, %r31
	.word 0x8584b419  ! 433: WRCCR_I	wr	%r18, 0x1419, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01970  ! 434: FqTOd	dis not found

splash_lsu_1_237:
	setx 0xb11bd85004cd01dd, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a0016d  ! 436: FABSq	dis not found

change_to_randtl_1_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_238:
	.word 0x8f902001  ! 437: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01962  ! 439: FqTOd	dis not found

intveclr_1_241:
	setx 0x86576367e306b871, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200a  ! 442: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x97540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_1_242:
	setx 0x6f7310cd29a501b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x5cc06c47d6a285bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_244:
	set 0x60540000, %r31
	.word 0x8584ec47  ! 447: WRCCR_I	wr	%r19, 0x0c47, %ccr
splash_cmpr_1_245:
	setx 0xe048c804641046a7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d94c006  ! 449: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x91d020b5  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 181
pmu_1_247:
	nop
	setx 0xfffffeccfffff149, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5687802  ! 452: SDIVX_I	sdivx	%r1, 0xfffff802, %r18
DS_1_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_250:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 454: RDPC	rd	%pc, %r8
splash_cmpr_1_251:
	setx 0x388b2211873ec02e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_252) + 32, 16, 16)) -> intp(5,0,29)
intvec_1_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd9104006  ! 1: LDQF_R	-	[%r1, %r6], %f12
	.word 0x97a20823  ! 457: FADDs	fadds	%f8, %f3, %f11
	.word 0xe0c7e020  ! 458: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	.word 0x87802020  ! 459: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_1_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_1_255:
	set user_data_start, %r31
	.word 0x8583795c  ! 462: WRCCR_I	wr	%r13, 0x195c, %ccr
memptr_1_256:
	set 0x60540000, %r31
	.word 0x8581b1b4  ! 463: WRCCR_I	wr	%r6, 0x11b4, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_257:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 464: RDPC	rd	%pc, %r10
debug_1_258:
	nop
	mov 8, %r18
	.word 0xe0f00852  ! 465: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
mondo_1_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d950004  ! 466: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
DS_1_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f4, %f14
	.word 0x9bb20306  ! 467: ALIGNADDRESS	alignaddr	%r8, %r6, %r13
mondo_1_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92800a  ! 468: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	.word 0x93a0016b  ! 469: FABSq	dis not found

	.word 0xa190200b  ! 470: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x97540000  ! 471: RDPR_GL	rdpr	%-, %r11
change_to_randtl_1_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_262:
	.word 0x8f902001  ! 472: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802014  ! 473: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902004  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_1_263:
	setx 0xe4199ec0bf5c5019, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_264:
	nop
	mov 8, %r18
	.word 0xe2f00852  ! 477: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
splash_cmpr_1_265:
	setx 0xcd603c1f5d4aa576, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_266) + 40, 16, 16)) -> intp(5,0,7)
intvec_1_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_1_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_1_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d930001  ! 482: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
	.word 0x93a0016d  ! 483: FABSq	dis not found

splash_tba_1_270:
	set 0x003f0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_1_271:
	setx 0x4e6b476e05b6f60c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8037eb  ! 486: SIR	sir	0x17eb
splash_lsu_1_272:
	setx 0x54fbe4300c1856a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01967  ! 488: FqTOd	dis not found

	.word 0xa1902002  ! 489: WRPR_GL_I	wrpr	%r0, 0x0002, %-
debug_1_274:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	setx 0x4743b3d02666421c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902245  ! 493: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
memptr_1_276:
	set user_data_start, %r31
	.word 0x8581a680  ! 494: WRCCR_I	wr	%r6, 0x0680, %ccr
	.word 0xa1902009  ! 495: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_1_277:
	setx 0xd4499d7eb2541037, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 497: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_1_278:
	set 0x60740000, %r31
	.word 0x85812e41  ! 498: WRCCR_I	wr	%r4, 0x0e41, %ccr
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
pmu_0_0:
	nop
	setx 0xffffff54fffff205, %g1, %g7
	.word 0xdb17c000  ! 1: LDQF_R	-	[%r31, %r0], %f13
debug_0_1:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 2: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 3: RD_STICK_REG	stbar
	.word 0x9ad1f498  ! 4: UMULcc_I	umulcc 	%r7, 0xfffff498, %r13
	.word 0xda57c000  ! 5: LDSH_R	ldsh	[%r31 + %r0], %r13
DS_0_2:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 6: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_0_3:
	setx 0x436026c76216b482, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 7: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d02032  ! 8: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_4:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 10: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x93902004  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	setx 0xb34446ca21ad1c7a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_5:
	.word 0x39400001  ! 12: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902248  ! 13: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
splash_lsu_0_6:
	setx 0x15b091853829ba5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 14: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9828010  ! 15: WR_SET_SOFTINT_R	wr	%r10, %r16, %set_softint
	.word 0x8d902ae3  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0ae3, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x4367512007e7dc3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_7:
	.word 0x39400001  ! 18: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a24dca  ! 19: FdMULq	fdmulq	
change_to_randtl_0_8:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_8:
	.word 0x8f902002  ! 20: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_0_9:
	setx 0x2ec77cf330a393b3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 21: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_10:
	.word 0x81982806  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0806, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9969fb93  ! 23: SDIVX_I	sdivx	%r7, 0xfffffb93, %r12
	.word 0xd88008a0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802088  ! 25: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d02032  ! 26: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d903bb4  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1bb4, %pstate
mondo_0_12:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92800b  ! 28: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
tagged_0_13:
	taddcctv %r16, 0x152c, %r13
	.word 0xd807fb93  ! 29: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
debug_0_14:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 30: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_15:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 31: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_cmpr_0_16:
	setx 0x99381e808b2aec82, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 32: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_0_17:
	taddcctv %r15, 0x1b01, %r21
	.word 0xd807fb93  ! 33: LDUW_I	lduw	[%r31 + 0xfffffb93], %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a0196b  ! 34: FqTOd	dis not found

	.word 0xa9a00167  ! 35: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01963  ! 36: FqTOd	dis not found

debug_0_20:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 37: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd8bfc020  ! 38: STDA_R	stda	%r12, [%r31 + %r0] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x95a00163  ! 40: FABSq	dis not found

	setx 0xb6e785f65bd9ffb6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_21:
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd48008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa945c000  ! 43: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01960  ! 44: FqTOd	dis not found

	.word 0xa190200f  ! 45: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_randtl_0_23:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_23:
	.word 0x8f902000  ! 46: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_0_24:
	setx 0x1befde3a788b1c03, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 47: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a63  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1a63, %pstate
splash_htba_0_25:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 49: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903b58  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x1b58, %pstate
splash_tba_0_26:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 51: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_0_27:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_27:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe6c80e40  ! 53: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r19
mondo_0_28:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d91000b  ! 54: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
splash_cmpr_0_29:
	setx 0x54817b94488e336b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 55: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_30:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_30:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_30
    nop
debug_wait0_30:
    ld [%r23], %r2
    brnz %r2, debug_wait0_30
    nop
    ba,a debug_startwait0_30
continue_debug_0_30:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_30:
    cmp %r13, %r15
    bne,a wait_for_stat_0_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_30:
    cmp %r14, %r15
    bne,a wait_for_debug_0_30
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 56: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
	.word 0xe6d004a0  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
tagged_0_31:
	taddcctv %r11, 0x1efb, %r8
	.word 0xe607fb93  ! 58: LDUW_I	lduw	[%r31 + 0xfffffb93], %r19
mondo_0_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 59: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
cmp_0_33:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_33:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_33
    nop
cmp_wait0_33:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_33
    nop
    ba,a cmp_startwait0_33
continue_cmp_0_33:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908014  ! 60: WRPR_PIL_R	wrpr	%r2, %r20, %pil
splash_lsu_0_34:
	setx 0x63bf203f4d7525e1, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 61: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_35:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 62: SAVE_R	save	%r31, %r0, %r31
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_36
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_36
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_36:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 63: RDPC	rd	%pc, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01965  ! 64: FqTOd	dis not found

mondo_0_38:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d92400c  ! 65: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
intveclr_0_39:
	setx 0xb4bdb8525bbffccf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 66: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd0800b60  ! 67: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0xa1902005  ! 68: WRPR_GL_I	wrpr	%r0, 0x0005, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_40
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_40:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 69: RDPC	rd	%pc, %r12
splash_hpstate_0_41:
	.word 0x8198250f  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
splash_hpstate_0_42:
	.word 0x819825fe  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05fe, %hpstate
splash_cmpr_0_43:
	setx 0x2008e4500593cdfb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 72: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_0_44:
	setx 0x82f426b64c49cd8a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 73: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xab828006  ! 74: WR_CLEAR_SOFTINT_R	wr	%r10, %r6, %clear_softint
debug_0_45:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_45:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_45
    nop
debug_wait0_45:
    ld [%r23], %r2
    brnz %r2, debug_wait0_45
    nop
    ba,a debug_startwait0_45
continue_debug_0_45:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_45:
    cmp %r13, %r15
    bne,a wait_for_stat_0_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_45:
    cmp %r14, %r15
    bne,a wait_for_debug_0_45
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd0f00852  ! 75: STXA_R	stxa	%r8, [%r0 + %r18] 0x42
splash_lsu_0_46:
	setx 0x5cb11b553ff40487, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 77: RD_STICK_REG	stbar
mondo_0_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 78: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0x92ac800a  ! 79: ANDNcc_R	andncc 	%r18, %r10, %r9
memptr_0_48:
	set user_data_start, %r31
	.word 0x8582bc98  ! 80: WRCCR_I	wr	%r10, 0x1c98, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902000  ! 82: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_0_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_49:
	.word 0x8f902002  ! 83: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_0_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d934014  ! 84: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
splash_lsu_0_51:
	setx 0x4ddaa8c5d451f9c7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_0_52:
	setx 0x4d7fafe6350b55c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 86: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x01832d2b77f390bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_53:
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_0_54:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02033  ! 89: Tcc_I	te	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_55)+24, 16, 16)) -> intp(0,1,3)
xir_0_55:
	.word 0xa982a03e  ! 90: WR_SET_SOFTINT_I	wr	%r10, 0x003e, %set_softint
	.word 0xa5a34dd3  ! 91: FdMULq	fdmulq	
memptr_0_56:
	set 0x60740000, %r31
	.word 0x8580ff2c  ! 92: WRCCR_I	wr	%r3, 0x1f2c, %ccr
	.word 0x8d9026a5  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x06a5, %pstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 94: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_0_57:
	setx 0x85c5179c3ef6f69b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 95: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x919068a9  ! 96: WRPR_PIL_I	wrpr	%r1, 0x08a9, %pil
	.word 0x9345c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x879022a4  ! 98: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
	.word 0xad8425d7  ! 99: WR_SOFTINT_REG_I	wr	%r16, 0x05d7, %softint
change_to_randtl_0_58:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_58:
	.word 0x8f902002  ! 100: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_tba_0_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 101: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 102: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_hpstate_0_60:
	.word 0x81982b7c  ! 103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b7c, %hpstate
	.word 0x91d02033  ! 104: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99a00165  ! 105: FABSq	dis not found

splash_cmpr_0_61:
	setx 0x091b47764f724600, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd847c000  ! 107: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x95a449d2  ! 108: FDIVd	fdivd	%f48, %f18, %f10
	.word 0xd4800c00  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x83d02034  ! 110: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99a00173  ! 111: FABSq	dis not found

tagged_0_62:
	tsubcctv %r5, 0x15ee, %r23
	.word 0xd807e5d7  ! 112: LDUW_I	lduw	[%r31 + 0x05d7], %r12
mondo_0_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d90c007  ! 113: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b68bf64  ! 114: SDIVX_I	sdivx	%r2, 0xffffff64, %r13
	.word 0x91d02033  ! 115: Tcc_I	ta	icc_or_xcc, %r0 + 51
	setx 0xf6218c401e07f2ee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_65:
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902004  ! 117: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 118: FqTOd	dis not found

	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01966  ! 119: FqTOd	dis not found

mondo_0_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 120: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
DS_0_69:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 121: RESTORE_R	restore	%r31, %r0, %r31
splash_hpstate_0_70:
	.word 0x8198218c  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018c, %hpstate
	.word 0xd6c00e60  ! 123: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r11
	.word 0xd71fff64  ! 124: LDDF_I	ldd	[%r31, 0x1f64], %f11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_71
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_71:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 125: RDPC	rd	%pc, %r10
mondo_0_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c008  ! 126: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
	.word 0x944c8000  ! 127: MULX_R	mulx 	%r18, %r0, %r10
	setx 0x179ee1556efbd6f3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_73:
	.word 0x39400001  ! 128: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 129: BL	bl,a	<label_0x1>
debug_0_74:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 130: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd497e030  ! 131: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x3a700001  ! 132: BPCC	<illegal instruction>
	.word 0x2c700001  ! 133: BPNEG	<illegal instruction>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 134: LDX_R	ldx	[%r31 + %r0], %r10
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_75
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_75:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 135: CASA_R	casa	[%r31] %asi, %r0, %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_76:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 137: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0x2a800001  ! 138: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 139: LDX_R	ldx	[%r31 + %r0], %r10
memptr_0_77:
	set 0x60540000, %r31
	.word 0x85813b98  ! 140: WRCCR_I	wr	%r4, 0x1b98, %ccr
debug_0_78:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_78:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_78
    nop
debug_wait0_78:
    ld [%r23], %r2
    brnz %r2, debug_wait0_78
    nop
    ba,a debug_startwait0_78
continue_debug_0_78:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_78:
    cmp %r13, %r15
    bne,a wait_for_stat_0_78
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_78:
    cmp %r14, %r15
    bne,a wait_for_debug_0_78
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00852  ! 141: STXA_R	stxa	%r11, [%r0 + %r18] 0x42
	.word 0x87802014  ! 142: WRASI_I	wr	%r0, 0x0014, %asi
splash_cmpr_0_79:
	setx 0xf903c514b1c3b0c5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 143: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9b454000  ! 144: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_80
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_80:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0xa190200b  ! 146: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91540000  ! 147: RDPR_GL	rdpr	%-, %r8
splash_hpstate_0_81:
	.word 0x819828ac  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ac, %hpstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_82) + 48, 16, 16)) -> intp(5,0,27)
intvec_0_82:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_83:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5344002  ! 1: STQF_R	-	%f10, [%r2, %r17]
	normalw
	.word 0x95458000  ! 150: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x2c800001  ! 151: BNEG	bneg,a	<label_0x1>
	.word 0x8d9021fa  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x01fa, %pstate
	.word 0x91d02033  ! 153: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_0_84:
	setx 0x4f3e3e34086d8bf9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 154: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_85
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_85:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 155: RDPC	rd	%pc, %r11
splash_cmpr_0_86:
	setx 0x1260b8343422a949, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 156: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_87:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 157: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01967  ! 158: FqTOd	dis not found

mondo_0_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d90c010  ! 159: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
cmp_0_90:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_90:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_90
    nop
cmp_wait0_90:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_90
    nop
    ba,a cmp_startwait0_90
continue_cmp_0_90:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xce, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c001  ! 160: WRPR_PIL_R	wrpr	%r11, %r1, %pil
mondo_0_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 161: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
splash_lsu_0_92:
	setx 0x84a88133cb75d989, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_93:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_93:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_93
    nop
debug_wait0_93:
    ld [%r23], %r2
    brnz %r2, debug_wait0_93
    nop
    ba,a debug_startwait0_93
continue_debug_0_93:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_93:
    cmp %r13, %r15
    bne,a wait_for_stat_0_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_93:
    cmp %r14, %r15
    bne,a wait_for_debug_0_93
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00852  ! 163: STXA_R	stxa	%r12, [%r0 + %r18] 0x42
DS_0_94:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 164: SAVE_R	save	%r31, %r0, %r31
debug_0_95:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 165: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa983400c  ! 166: WR_SET_SOFTINT_R	wr	%r13, %r12, %set_softint
	.word 0xe8d7e030  ! 167: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe86ffb98  ! 169: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffffb98]
	.word 0x93902004  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_96)+0, 16, 16)) -> intp(0,1,3)
xir_0_96:
	.word 0xa982e83d  ! 171: WR_SET_SOFTINT_I	wr	%r11, 0x083d, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe997e83d  ! 173: LDQFA_I	-	[%r31, 0x083d], %f20
splash_lsu_0_97:
	setx 0x571b83595c75b72b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x90f98002  ! 175: SDIVcc_R	sdivcc 	%r6, %r2, %r8
	.word 0x9950c000  ! 176: RDPR_TT	<illegal instruction>
	.word 0xd88008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
memptr_0_98:
	set 0x60340000, %r31
	.word 0x85806ab4  ! 178: WRCCR_I	wr	%r1, 0x0ab4, %ccr
	setx 0xf80674f52cdc11fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_99:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_100:
	setx 0x07f2751a91920fe6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 180: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd88008a0  ! 181: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902004  ! 182: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_0_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_101:
	.word 0x8f902000  ! 183: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93d02032  ! 184: Tcc_I	tne	icc_or_xcc, %r0 + 50
tagged_0_102:
	tsubcctv %r22, 0x1096, %r25
	.word 0xd807eab4  ! 185: LDUW_I	lduw	[%r31 + 0x0ab4], %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_103
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_103:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 186: RDPC	rd	%pc, %r13
memptr_0_104:
	set 0x60140000, %r31
	.word 0x85852f3f  ! 187: WRCCR_I	wr	%r20, 0x0f3f, %ccr
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01970  ! 188: FqTOd	dis not found

	.word 0x8d903fd5  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1fd5, %pstate
	.word 0x879023ae  ! 190: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
debug_0_106:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 191: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_107:
	setx 0x48e9d05da2f8c35a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 192: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87902196  ! 193: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
DS_0_108:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x97b2030a  ! 194: ALIGNADDRESS	alignaddr	%r8, %r10, %r11
	.word 0x24800001  ! 195: BLE	ble,a	<label_0x1>
	.word 0xa1a509c7  ! 196: FDIVd	fdivd	%f20, %f38, %f16
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 197: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_109
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_109:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 198: RDPC	rd	%pc, %r12
	.word 0x87902131  ! 199: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
	.word 0xd8d004a0  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_110
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_110:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 201: RDPC	rd	%pc, %r16
	.word 0x8d902ea9  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x0ea9, %pstate
mondo_0_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914013  ! 203: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
mondo_0_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d90400a  ! 204: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
	.word 0xe0bfef3f  ! 205: STDA_I	stda	%r16, [%r31 + 0x0f3f] %asi
splash_lsu_0_113:
	setx 0xddffbd8b7aa81733, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 206: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_114:
	setx 0x5b09042aa6ee8934, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x87802004  ! 208: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93500000  ! 209: RDPR_TPC	<illegal instruction>
debug_0_115:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 210: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
intveclr_0_116:
	setx 0x4f8fddcaac199704, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 211: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 212: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_0_117:
	setx 0x1337a9ae4505a8c5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 213: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_118
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_118:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 214: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa3500000  ! 215: RDPR_TPC	<illegal instruction>
	.word 0x8d802000  ! 216: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_0_119:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 217: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_120:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 218: RESTORE_R	restore	%r31, %r0, %r31
	setx 0xab440029482055b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_121:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe257ef3f  ! 220: LDSH_I	ldsh	[%r31 + 0x0f3f], %r17
	.word 0x8d802000  ! 221: WRFPRS_I	wr	%r0, 0x0000, %fprs
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_122
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_122
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_122:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 222: RDPC	rd	%pc, %r8
tagged_0_123:
	taddcctv %r24, 0x1072, %r13
	.word 0xd007ef3f  ! 223: LDUW_I	lduw	[%r31 + 0x0f3f], %r8
DS_0_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f24, %f24
	.word 0x97b30313  ! 224: ALIGNADDRESS	alignaddr	%r12, %r19, %r11
memptr_0_125:
	set 0x60340000, %r31
	.word 0x8581bf61  ! 225: WRCCR_I	wr	%r6, 0x1f61, %ccr
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_126:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 226: CASA_R	casa	[%r31] %asi, %r19, %r11
	setx 0xd162e15e175edb02, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_127:
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903bc6  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x1bc6, %pstate
	.word 0xd61fc000  ! 229: LDD_R	ldd	[%r31 + %r0], %r11
splash_lsu_0_128:
	setx 0xc5c9913c2a6db94f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_0_129:
	set user_data_start, %r31
	.word 0x85853f2a  ! 231: WRCCR_I	wr	%r20, 0x1f2a, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_130
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_130:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 232: RDPC	rd	%pc, %r13
	.word 0xda6fff2a  ! 233: LDSTUB_I	ldstub	%r13, [%r31 + 0xffffff2a]
	.word 0xda57c000  ! 234: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d802004  ! 235: WRFPRS_I	wr	%r0, 0x0004, %fprs
debug_0_131:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 236: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
debug_0_132:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_132:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_132
    nop
debug_wait0_132:
    ld [%r23], %r16
    brnz %r16, debug_wait0_132
    nop
    ba,a debug_startwait0_132
continue_debug_0_132:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_132:
    cmp %r13, %r15
    bne,a wait_for_stat_0_132
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_132:
    cmp %r14, %r15
    bne,a wait_for_debug_0_132
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %13, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00852  ! 237: STXA_R	stxa	%r20, [%r0 + %r18] 0x42
	.word 0x9881c013  ! 238: ADDcc_R	addcc 	%r7, %r19, %r12
	.word 0x91d02035  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_0_133:
	.word 0x81982887  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0887, %hpstate
	.word 0x81510000  ! 241: RDPR_TICK	rdpr	%tick, %r0
mondo_0_134:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d91400d  ! 242: WRPR_WSTATE_R	wrpr	%r5, %r13, %wstate
tagged_0_135:
	taddcctv %r24, 0x1d78, %r13
	.word 0xd807ff2a  ! 243: LDUW_I	lduw	[%r31 + 0xffffff2a], %r12
intveclr_0_136:
	setx 0x0b61878fbe084935, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8038d3  ! 245: SIR	sir	0x18d3
	.word 0x95a00162  ! 246: FABSq	dis not found

splash_tba_0_137:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e020  ! 248: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
mondo_0_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914000  ! 249: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
	.word 0x87802080  ! 250: WRASI_I	wr	%r0, 0x0080, %asi
splash_cmpr_0_139:
	setx 0x065af9e6a6d8e35d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 251: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_140:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 252: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa950c000  ! 253: RDPR_TT	<illegal instruction>
	.word 0xe89004a0  ! 254: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xa3a349d3  ! 255: FDIVd	fdivd	%f44, %f50, %f48
mondo_0_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d928008  ! 256: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
splash_lsu_0_142:
	setx 0x450c13489e7398c5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_143)+32, 16, 16)) -> intp(0,1,3)
xir_0_143:
	.word 0xa980299e  ! 258: WR_SET_SOFTINT_I	wr	%r0, 0x099e, %set_softint
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_144
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_144:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 259: RDPC	rd	%pc, %r9
	.word 0x8d90378c  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x178c, %pstate
	.word 0xd327c000  ! 261: STF_R	st	%f9, [%r0, %r31]
	.word 0x95540000  ! 262: RDPR_GL	<illegal instruction>
	.word 0xa1902007  ! 263: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 264: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d902271  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0271, %pstate
	.word 0x93d02034  ! 266: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81460000  ! 267: RD_STICK_REG	stbar
	.word 0x87802010  ! 268: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_0_145:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_145:
	.word 0x8f902002  ! 269: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd41fc000  ! 270: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xad81fe2f  ! 271: WR_SOFTINT_REG_I	wr	%r7, 0x1e2f, %softint
	.word 0x879021a3  ! 272: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
	.word 0xd48008a0  ! 273: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996aabd3  ! 274: SDIVX_I	sdivx	%r10, 0x0bd3, %r12
splash_hpstate_0_147:
	.word 0x81982c5c  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5c, %hpstate
	.word 0xa190200d  ! 276: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_lsu_0_148:
	setx 0xde5de66f2861e4f5, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_149:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 279: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99a00164  ! 280: FABSq	dis not found

splash_tba_0_150:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 281: WRPR_TBA_R	wrpr	%r0, %r2, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_151
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_151
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_151:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 282: RDPC	rd	%pc, %r17
cmp_0_152:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_152:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_152
    nop
cmp_wait0_152:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_152
    nop
    ba,a cmp_startwait0_152
continue_cmp_0_152:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 22, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91910010  ! 283: WRPR_PIL_R	wrpr	%r4, %r16, %pil
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_153
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_153:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 284: RDPC	rd	%pc, %r9
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 285: CASA_R	casa	[%r31] %asi, %r16, %r9
mondo_0_155:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d940004  ! 286: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x8d902fd9  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x0fd9, %pstate
mondo_0_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d900010  ! 288: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	.word 0xd2c80e40  ! 289: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r9
debug_0_157:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 290: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
DS_0_158:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8b673b52	! Random illegal ?
	.word 0xd110400a  ! 1: LDQF_R	-	[%r1, %r10], %f8
	.word 0x95a4482c  ! 291: FADDs	fadds	%f17, %f12, %f10
	.word 0xd517c000  ! 292: LDQF_R	-	[%r31, %r0], %f10
donret_0_159:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_159-donret_0_159), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_159:
	.word 0xd4ffebd3  ! 293: SWAPA_I	swapa	%r10, [%r31 + 0x0bd3] %asi
splash_tba_0_160:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 294: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_0_161:
	taddcctv %r1, 0x12f6, %r9
	.word 0xd407ebd3  ! 295: LDUW_I	lduw	[%r31 + 0x0bd3], %r10
	.word 0x9145c000  ! 296: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xd06febd3  ! 297: LDSTUB_I	ldstub	%r8, [%r31 + 0x0bd3]
debug_0_162:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_162:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_162
    nop
debug_wait0_162:
    ld [%r23], %r2
    brnz %r2, debug_wait0_162
    nop
    ba,a debug_startwait0_162
continue_debug_0_162:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_162:
    cmp %r13, %r15
    bne,a wait_for_stat_0_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_162:
    cmp %r14, %r15
    bne,a wait_for_debug_0_162
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe0f00852  ! 298: STXA_R	stxa	%r16, [%r0 + %r18] 0x42
debug_0_163:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 299: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xa1520000  ! 300: RDPR_PIL	<illegal instruction>
cmp_0_164:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_164:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_164
    nop
cmp_wait0_164:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_164
    nop
    ba,a cmp_startwait0_164
continue_cmp_0_164:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 30, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c004  ! 301: WRPR_PIL_R	wrpr	%r19, %r4, %pil
	.word 0xe0d7e020  ! 302: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
splash_cmpr_0_165:
	setx 0x622802eed6df01b8, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 303: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_166:
	.word 0x81982244  ! 304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0244, %hpstate
donret_0_167:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_167-donret_0_167), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	done
donretarg_0_167:
	.word 0xe0ffebd3  ! 305: SWAPA_I	swapa	%r16, [%r31 + 0x0bd3] %asi
intveclr_0_168:
	setx 0x637acbb2f401c847, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800c80  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
	.word 0xa1902007  ! 308: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_hpstate_0_169:
	.word 0x81982e57  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e57, %hpstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69b762  ! 310: SDIVX_I	sdivx	%r6, 0xfffff762, %r13
	.word 0x8d903f48  ! 311: WRPR_PSTATE_I	wrpr	%r0, 0x1f48, %pstate
splash_htba_0_171:
	set 0x00380000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_hpstate_0_172:
	.word 0x81982cd5  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	.word 0x97450000  ! 314: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd68008a0  ! 315: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x9150c000  ! 316: RDPR_TT	<illegal instruction>
cmp_0_173:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_173:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_173
    nop
cmp_wait0_173:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_173
    nop
    ba,a cmp_startwait0_173
continue_cmp_0_173:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x44, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c012  ! 317: WRPR_PIL_R	wrpr	%r11, %r18, %pil
mondo_0_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91c013  ! 318: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0x8d903ec5  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x1ec5, %pstate
	.word 0x919471b8  ! 320: WRPR_PIL_I	wrpr	%r17, 0x11b8, %pil
	.word 0xa1454000  ! 321: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe0cfe010  ! 322: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
memptr_0_175:
	set 0x60140000, %r31
	.word 0x8580262c  ! 323: WRCCR_I	wr	%r0, 0x062c, %ccr
	.word 0x93902006  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe06fe62c  ! 325: LDSTUB_I	ldstub	%r16, [%r31 + 0x062c]
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 326: RDPC	rd	%pc, %r16
debug_0_177:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_177:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_177
    nop
debug_wait0_177:
    ld [%r23], %r2
    brnz %r2, debug_wait0_177
    nop
    ba,a debug_startwait0_177
continue_debug_0_177:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_177:
    cmp %r13, %r15
    bne,a wait_for_stat_0_177
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_177:
    cmp %r14, %r15
    bne,a wait_for_debug_0_177
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00852  ! 327: STXA_R	stxa	%r10, [%r0 + %r18] 0x42
	.word 0xe0d7e000  ! 328: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
debug_0_178:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 329: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
debug_0_179:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 330: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
mondo_0_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d918014  ! 331: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x99464000  ! 332: RD_STICK_CMPR_REG	rd	%-, %r12
splash_cmpr_0_181:
	setx 0x1a5790c0c347fd12, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 333: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa190200f  ! 334: WRPR_GL_I	wrpr	%r0, 0x000f, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_182
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_182:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 335: RDPC	rd	%pc, %r12
	.word 0xd927c000  ! 336: STF_R	st	%f12, [%r0, %r31]
	.word 0x9753c000  ! 337: RDPR_FQ	<illegal instruction>
splash_cmpr_0_183:
	setx 0xa9cb1b170dd6f2b7, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 338: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_0_184:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
mondo_0_185:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 340: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_186) + 32, 16, 16)) -> intp(4,0,24)
intvec_0_186:
	.word 0x39400001  ! 341: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 342: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd66fe62c  ! 343: LDSTUB_I	ldstub	%r11, [%r31 + 0x062c]
cmp_0_187:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_187:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_187
    nop
cmp_wait0_187:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_187
    nop
    ba,a cmp_startwait0_187
continue_cmp_0_187:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbe, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91900004  ! 344: WRPR_PIL_R	wrpr	%r0, %r4, %pil
mondo_0_188:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 345: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
cmp_0_189:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_189:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_189
    nop
cmp_wait0_189:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_189
    nop
    ba,a cmp_startwait0_189
continue_cmp_0_189:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 14, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190000b  ! 346: WRPR_PIL_R	wrpr	%r0, %r11, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_190) + 8, 16, 16)) -> intp(4,0,7)
intvec_0_190:
	.word 0x39400001  ! 347: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_0_191:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 349: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xd6d004a0  ! 350: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	.word 0x83d02033  ! 351: Tcc_I	te	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_192
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_192
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_192:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 352: RDPC	rd	%pc, %r13
	.word 0x99902003  ! 353: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
tagged_0_193:
	taddcctv %r1, 0x1a5b, %r20
	.word 0xda07e62c  ! 354: LDUW_I	lduw	[%r31 + 0x062c], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 355: LDX_R	ldx	[%r31 + %r0], %r13
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69f63c  ! 358: SDIVX_I	sdivx	%r7, 0xfffff63c, %r13
debug_0_195:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_195:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_195
    nop
debug_wait0_195:
    ld [%r23], %r2
    brnz %r2, debug_wait0_195
    nop
    ba,a debug_startwait0_195
continue_debug_0_195:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_195:
    cmp %r13, %r15
    bne,a wait_for_stat_0_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_195:
    cmp %r14, %r15
    bne,a wait_for_debug_0_195
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd2f00852  ! 359: STXA_R	stxa	%r9, [%r0 + %r18] 0x42
splash_hpstate_0_196:
	.word 0x8198224e  ! 360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024e, %hpstate
	.word 0xdb37f63c  ! 361: STQF_I	-	%f13, [0x163c, %r31]
	.word 0x93520000  ! 362: RDPR_PIL	<illegal instruction>
splash_cmpr_0_197:
	setx 0x34b71c0bdb362329, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 363: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b5  ! 364: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xd2bff63c  ! 365: STDA_I	stda	%r9, [%r31 + 0xfffff63c] %asi
memptr_0_198:
	set user_data_start, %r31
	.word 0x8582b76b  ! 366: WRCCR_I	wr	%r10, 0x176b, %ccr
	.word 0x87802020  ! 367: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_0_199:
	setx 0x6f02c4f68300c22a, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 368: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a109c2  ! 369: FDIVd	fdivd	%f4, %f2, %f8
memptr_0_200:
	set 0x60340000, %r31
	.word 0x8584a763  ! 370: WRCCR_I	wr	%r18, 0x0763, %ccr
	.word 0xd01fe763  ! 371: LDD_I	ldd	[%r31 + 0x0763], %r8
mondo_0_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 372: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
debug_0_202:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 373: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_0_203:
	nop
	setx 0xfffffd9dfffff2e6, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02032  ! 375: Tcc_I	te	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_204) + 16, 16, 16)) -> intp(4,0,29)
intvec_0_204:
	.word 0x39400001  ! 376: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 377: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa945c000  ! 378: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01960  ! 379: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 380: RDPC	rd	%pc, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c61e6  ! 381: SDIVX_I	sdivx	%r17, 0x01e6, %r18
debug_0_208:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 382: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
change_to_randtl_0_209:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_209:
	.word 0x8f902002  ! 383: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x879020d6  ! 384: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0xa190200d  ! 385: WRPR_GL_I	wrpr	%r0, 0x000d, %-
memptr_0_210:
	set user_data_start, %r31
	.word 0x8582f44b  ! 386: WRCCR_I	wr	%r11, 0x144b, %ccr
cmp_0_211:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_211:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_211
    nop
cmp_wait0_211:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_211
    nop
    ba,a cmp_startwait0_211
continue_cmp_0_211:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x52, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950012  ! 387: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0x8d902b3b  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x0b3b, %pstate
debug_0_212:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 389: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_213
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_213
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_213:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 390: RDPC	rd	%pc, %r19
	.word 0xa7500000  ! 391: RDPR_TPC	<illegal instruction>
DS_0_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe94a94e8	! Random illegal ?
	.word 0xdb14000b  ! 1: LDQF_R	-	[%r16, %r11], %f13
	.word 0xa5a30820  ! 392: FADDs	fadds	%f12, %f0, %f18
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_215
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_215:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 394: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0x91926316  ! 395: WRPR_PIL_I	wrpr	%r9, 0x0316, %pil
	.word 0xe43fe316  ! 396: STD_I	std	%r18, [%r31 + 0x0316]
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_216:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e000  ! 397: CASA_R	casa	[%r31] %asi, %r0, %r18
	setx 0x56dd45ebb071d3d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_217:
	.word 0x39400001  ! 398: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 399: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe49004a0  ! 400: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x9ba44d30  ! 401: FsMULd	fsmuld	%f17, %f16, %f44
	.word 0x93d020b4  ! 402: Tcc_I	tne	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 403: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93697bda  ! 404: SDIVX_I	sdivx	%r5, 0xfffffbda, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01964  ! 405: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_220
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_220
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_220:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 406: RDPC	rd	%pc, %r8
DS_0_221:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe114c013  ! 1: LDQF_R	-	[%r19, %r19], %f16
	.word 0x95a44822  ! 407: FADDs	fadds	%f17, %f2, %f10
	.word 0xd4dfe020  ! 408: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
DS_0_222:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b4c314  ! 409: ALIGNADDRESS	alignaddr	%r19, %r20, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7682b47  ! 410: SDIVX_I	sdivx	%r0, 0x0b47, %r19
splash_hpstate_0_224:
	.word 0x81982f9d  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9d, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 412: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe66feb47  ! 413: LDSTUB_I	ldstub	%r19, [%r31 + 0x0b47]
mondo_0_225:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d918013  ! 414: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_226
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_226
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_226:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 415: RDPC	rd	%pc, %r17
	setx 0x310634d16a6e0c04, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_227:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00171  ! 417: FABSq	dis not found

donret_0_228:
	nop
	rd %pc, %r12
	add %r12, (donretarg_0_228-donret_0_228), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, %r13, %tstate
    wrhpr %g0, %r14, %htstate
	retry
donretarg_0_228:
	.word 0xd8ffeb47  ! 418: SWAPA_I	swapa	%r12, [%r31 + 0x0b47] %asi
	.word 0x9194fd80  ! 419: WRPR_PIL_I	wrpr	%r19, 0x1d80, %pil
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 420: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe030  ! 421: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0xd88fe030  ! 422: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
tagged_0_229:
	taddcctv %r25, 0x16a4, %r25
	.word 0xd807fd80  ! 423: LDUW_I	lduw	[%r31 + 0xfffffd80], %r12
	.word 0x9f8039f8  ! 424: SIR	sir	0x19f8
tagged_0_230:
	tsubcctv %r1, 0x14b4, %r12
	.word 0xd807f9f8  ! 425: LDUW_I	lduw	[%r31 + 0xfffff9f8], %r12
	.word 0x8d802000  ! 426: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 427: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_231:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 428: CASA_R	casa	[%r31] %asi, %r17, %r12
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_232
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 429: RDPC	rd	%pc, %r16
pmu_0_233:
	nop
	setx 0xfffffe7dfffffae7, %g1, %g7
	.word 0xa3800007  ! 430: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_234
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_234:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 431: RDPC	rd	%pc, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r19
memptr_0_235:
	set 0x60140000, %r31
	.word 0x85843432  ! 433: WRCCR_I	wr	%r16, 0x1432, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01965  ! 434: FqTOd	dis not found

splash_lsu_0_237:
	setx 0x0dcee2f79a473a77, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97a0016b  ! 436: FABSq	dis not found

change_to_randtl_0_238:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_238:
	.word 0x8f902000  ! 437: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 438: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01971  ! 439: FqTOd	dis not found

intveclr_0_241:
	setx 0x1ad04304cdd00b2a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 440: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xa190200c  ! 442: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81460000  ! 443: RD_STICK_REG	stbar
	.word 0x9b540000  ! 444: RDPR_GL	<illegal instruction>
splash_cmpr_0_242:
	setx 0x9706c0fbe4bcb203, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 445: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xd726d8d78f24a0e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_243:
	.word 0x39400001  ! 446: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_0_244:
	set 0x60140000, %r31
	.word 0x8580fd23  ! 447: WRCCR_I	wr	%r3, 0x1d23, %ccr
splash_cmpr_0_245:
	setx 0xdbb87edefcf95575, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_246:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d950005  ! 449: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x83d02033  ! 450: Tcc_I	te	icc_or_xcc, %r0 + 51
pmu_0_247:
	nop
	setx 0xfffff7aafffff2f7, %g1, %g7
	.word 0xa3800007  ! 451: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9569eb87  ! 452: SDIVX_I	sdivx	%r7, 0x0b87, %r10
DS_0_249:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 453: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_250
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_250
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_250:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 454: RDPC	rd	%pc, %r12
splash_cmpr_0_251:
	setx 0x94a2cc70ea310b35, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 455: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_252) + 32, 16, 16)) -> intp(7,0,11)
intvec_0_252:
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1134000  ! 1: LDQF_R	-	[%r13, %r0], %f16
	.word 0xa1a2c831  ! 457: FADDs	fadds	%f11, %f17, %f16
	.word 0xe0c7e000  ! 458: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0x87802080  ! 459: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe11feb87  ! 460: LDDF_I	ldd	[%r31, 0x0b87], %f16
debug_0_254:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 461: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
memptr_0_255:
	set user_data_start, %r31
	.word 0x8580ff6f  ! 462: WRCCR_I	wr	%r3, 0x1f6f, %ccr
memptr_0_256:
	set 0x60140000, %r31
	.word 0x8584a2c0  ! 463: WRCCR_I	wr	%r18, 0x02c0, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_257
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 464: RDPC	rd	%pc, %r20
debug_0_258:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_258:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_258
    nop
debug_wait0_258:
    ld [%r23], %r2
    brnz %r2, debug_wait0_258
    nop
    ba,a debug_startwait0_258
continue_debug_0_258:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_258:
    cmp %r13, %r15
    bne,a wait_for_stat_0_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_258:
    cmp %r14, %r15
    bne,a wait_for_debug_0_258
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00852  ! 465: STXA_R	stxa	%r17, [%r0 + %r18] 0x42
mondo_0_259:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d914012  ! 466: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
DS_0_260:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f22, %f20
	.word 0x95b24314  ! 467: ALIGNADDRESS	alignaddr	%r9, %r20, %r10
mondo_0_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950004  ! 468: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0x91a00161  ! 469: FABSq	dis not found

	.word 0xa1902005  ! 470: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9b540000  ! 471: RDPR_GL	rdpr	%-, %r13
change_to_randtl_0_262:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_262:
	.word 0x8f902000  ! 472: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8780201c  ! 473: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902007  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xda6fe2c0  ! 475: LDSTUB_I	ldstub	%r13, [%r31 + 0x02c0]
splash_lsu_0_263:
	setx 0xaad393b5c79065b7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_264:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_264:
    mov 0x1, %r2
    cas [%r23],%g0,%r2       !lock
    brz,a %r2, continue_debug_0_264
    nop
debug_wait0_264:
    ld [%r23], %r2
    brnz %r2, debug_wait0_264
    nop
    ba,a debug_startwait0_264
continue_debug_0_264:
    mov 0x0e, %r2
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_264:
    cmp %r13, %r15
    bne,a wait_for_stat_0_264
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r2, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_debug_0_264:
    cmp %r14, %r15
    bne,a wait_for_debug_0_264
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %11, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00852  ! 477: STXA_R	stxa	%r15, [%r0 + %r18] 0x42
splash_cmpr_0_265:
	setx 0x24cbab5aacb6bc9d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 478: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_266) + 16, 16, 16)) -> intp(4,0,31)
intvec_0_266:
	.word 0x39400001  ! 479: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_267:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 480: SAVE_R	save	%r31, %r0, %r31
splash_tba_0_268:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
mondo_0_269:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d934006  ! 482: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	.word 0x9ba00172  ! 483: FABSq	dis not found

splash_tba_0_270:
	set 0x003c0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_0_271:
	setx 0x2ffb3eebc62f0695, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 485: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8028eb  ! 486: SIR	sir	0x08eb
splash_lsu_0_272:
	setx 0xd911e142af4ec2ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196a  ! 488: FqTOd	dis not found

	.word 0xa190200f  ! 489: WRPR_GL_I	wrpr	%r0, 0x000f, %-
debug_0_274:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 490: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 491: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	setx 0xce1d66219a074d2b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_275:
	.word 0x39400001  ! 492: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87902398  ! 493: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
memptr_0_276:
	set user_data_start, %r31
	.word 0x858530d8  ! 494: WRCCR_I	wr	%r20, 0x10d8, %ccr
	.word 0xa1902002  ! 495: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_0_277:
	setx 0x545040cac21fc188, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 496: WR_STICK_REG_R	wr	%r0, %r1, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_0_278:
	set 0x60740000, %r31
	.word 0x858227f5  ! 498: WRCCR_I	wr	%r8, 0x07f5, %ccr
cmpenall_0_279:
	nop
	ta T_CHANGE_HPRIV
	mov 0x50, %r18
	mov 0xff, %r8
	stxa %r8, [%r18] 0x41

join_lbl_0_0:
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

	.xword	0x0c1dc1548e155a12
	.xword	0x7d7550fc40f190f6
	.xword	0xacf900667e106a07
	.xword	0xdd580473b1a9322a
	.xword	0x80938e6d7da63ed2
	.xword	0x7fc9131c82fe6c3e
	.xword	0x6b78ee4b4666a99d
	.xword	0xc7e24ee54c0e2dbb
	.xword	0x0a4afe30e24ade87
	.xword	0x2ad8234b3913e8ed
	.xword	0xe0f249420020ed05
	.xword	0xc127265c15812638
	.xword	0xf2117413f3ec44af
	.xword	0x3dc82d2cb669849b
	.xword	0x483ef7027d4a37d9
	.xword	0xed17b8cf1fdd7bf1
	.xword	0x3913394d66178e59
	.xword	0xff27d666eeb7a7c3
	.xword	0xf82ef5016d2696fb
	.xword	0xaf9a220feed9ee22
	.xword	0x38b8b20716dbb2b3
	.xword	0xc02340d0f9dfaff3
	.xword	0x3959175413498fb7
	.xword	0x6588703e766f9516
	.xword	0xadca6f6298fcaa29
	.xword	0xa0d3bb7ebd1c026b
	.xword	0xad906fde4195ec93
	.xword	0xce430a86ace72b1a
	.xword	0xae847b06ca254b54
	.xword	0x814e97042cee61d7
	.xword	0xbf0b59d8da2213d1
	.xword	0xf9bc0fc4055fd7a4
	.xword	0x1ba40db316e51d7e
	.xword	0xca332aac27e3f769
	.xword	0x09277807505d4c99
	.xword	0x90111bdecb970fc3
	.xword	0x7836926b25514a8e
	.xword	0xb3880be64f7c4341
	.xword	0xd4d9a09188dfff1b
	.xword	0xcca396ea9fadcf6a
	.xword	0xe87204aa8ff1dbe1
	.xword	0x80af2f5f3e17406c
	.xword	0xd2e8e90afabc02ae
	.xword	0xf666402e600fdc8b
	.xword	0x0776ed7a7e45317d
	.xword	0x5f7eab36f7d9b070
	.xword	0x55f15a5ca1ec2a0d
	.xword	0xa21df3a45d61d95b
	.xword	0x31214dc1932863d9
	.xword	0xf72983158b993877
	.xword	0x292c1e218cf07752
	.xword	0xf1511a3318eb0e12
	.xword	0x4a71d72a54cb4f37
	.xword	0x3c016da645336c6a
	.xword	0xb5b1ce2a4a4e8a39
	.xword	0xcb840da9a4919b22
	.xword	0xfb4bab26d16972dd
	.xword	0x4381b1e0a1cd5eea
	.xword	0xe94810aad2d5b492
	.xword	0x73a36c416e7f94aa
	.xword	0xf82a3bd4216470ad
	.xword	0x5e8b9d0989b3eb68
	.xword	0x3f192878c89d23b3
	.xword	0xcd5008575a2d9e49
	.xword	0x9333b236b5eccc3e
	.xword	0x6d876dbb0444708c
	.xword	0xe1957fc9190561b0
	.xword	0xba94e673229b097b
	.xword	0xfa8ad71153b09ac1
	.xword	0xd14895d13cb24f4b
	.xword	0x43889688d8c7cc2f
	.xword	0x5513fbffc40049be
	.xword	0xc3ab2afca6eb036b
	.xword	0xdda9e2f9949771bb
	.xword	0xdfb52b81dc86fdcd
	.xword	0x0c53cfa7b5c73c02
	.xword	0x10abeab0fb65526c
	.xword	0x409f3957a327b2d7
	.xword	0x30110461be9c1b24
	.xword	0xca011e7ed0713c98
	.xword	0xe6e7b066d6f86a34
	.xword	0x737484fa6c5525df
	.xword	0xa1ddf8ff959ba9e3
	.xword	0x4eb0d4d49b2ddece
	.xword	0x6b79914d339a1a59
	.xword	0xe9e4afaff6beba05
	.xword	0xf0dbc8554b201047
	.xword	0x7bdbba0f193e9a1d
	.xword	0xc0ad763797dfb10f
	.xword	0xb50d3b288a39cc2c
	.xword	0xad4e3cdcaedf7e85
	.xword	0x54add128b00e420e
	.xword	0xa9282115e1660340
	.xword	0x05a4b46826dd58c3
	.xword	0xcf5777de48ac1f57
	.xword	0x898e6f47798ebd14
	.xword	0xd1a03cc128649d9c
	.xword	0x68ecfc1f579d0703
	.xword	0x2f609796a3c82ef6
	.xword	0x91c56a6097c41582
	.xword	0x2fd63ca5eed7cfb4
	.xword	0x69d6515784a7584f
	.xword	0x3be63c83aee6c756
	.xword	0xfe3949bf492f5d3f
	.xword	0x38482eed4d3fc95d
	.xword	0xd5e7fd9c91863154
	.xword	0x1e3ef5cf16a8729d
	.xword	0x1f74ba9e421eca95
	.xword	0x0794e523dc4186a1
	.xword	0x7229d239df5bd316
	.xword	0x2ad097c37ea8e67f
	.xword	0xce19e180476f3d88
	.xword	0x74c6d08fcbcdc503
	.xword	0x377aaddd7c73c78d
	.xword	0xc2b4caa159140880
	.xword	0xb279a59790b41ffb
	.xword	0x6130824faeb3d9c4
	.xword	0x057c1fb459b71ca8
	.xword	0xd9e577e74ff69ba6
	.xword	0xd951e7555cd60be4
	.xword	0x11c57704947babda
	.xword	0x74d88528d5468de2
	.xword	0x5be2823c934602c4
	.xword	0xb654ea390126881d
	.xword	0x3e3f293882acf2d1
	.xword	0x50a8c9b1b2efbb3c
	.xword	0x7598683172a8c3cd
	.xword	0x1b13bf5fc8b1f431
	.xword	0x9b384a469e0807ae
	.xword	0xa89e167a4ba4e012
	.xword	0x74b177eea9319f7a
	.xword	0x4aace967549232ee
	.xword	0xdcf4aa09112ca641
	.xword	0xc0911ffe2e8ada02
	.xword	0x1591f34bfb764163
	.xword	0x9f26e519982be035
	.xword	0x7fd78b2bc054ea52
	.xword	0xfe0f816c63fab906
	.xword	0xc6ffe642576969a6
	.xword	0x0ff7db83c437f53d
	.xword	0x29df05e9c5e28cc2
	.xword	0x12af6d020a191b31
	.xword	0x9f62ac6828559eab
	.xword	0x669648e99f68cd71
	.xword	0x1726d6746a54e6eb
	.xword	0x8c6c5491bf25eb05
	.xword	0x8150d221c3005e0a
	.xword	0x199e6acca47a430b
	.xword	0xeb0e470ebe823496
	.xword	0xc26029d935dfe7ef
	.xword	0x8191c10089ccafe0
	.xword	0x38350607b4dcaedb
	.xword	0x78b46c1e1dd8f0b9
	.xword	0xb61afc5116e51275
	.xword	0xd54f6fd00efd971e
	.xword	0xfb901d0a68e5446f
	.xword	0x99b827f0244fd9f9
	.xword	0x0c33db715203d388
	.xword	0x80a86f15472e2770
	.xword	0xe6534bea899fb270
	.xword	0x22ac64b7d6aa4d32
	.xword	0xf02e49f9aa1c5d95
	.xword	0xbe455f155cc41671
	.xword	0xd2a9a492d3e75de0
	.xword	0x3853d58f62ff6d51
	.xword	0x204d32396d8cc08b
	.xword	0x332fd2ac40cf8356
	.xword	0xcca683bdc7aee08a
	.xword	0x16e1905e33bcd239
	.xword	0x58fcaa27eadaad8c
	.xword	0xf84198f12d334443
	.xword	0x0c3d1e66ebc17d67
	.xword	0xcd240c4c65b8c22f
	.xword	0xb7e454853cd1fa7b
	.xword	0x1a5a91fb022319fe
	.xword	0x6cb9a78cd51c3878
	.xword	0xcb4432b8056179de
	.xword	0x83284f483f533230
	.xword	0x63c12beb141385dc
	.xword	0x0ff3fefbbac369cb
	.xword	0x165d8040c27fa655
	.xword	0x049b080d96080260
	.xword	0x44b8b4233baacbd6
	.xword	0x5754868b0d55ba19
	.xword	0x02b053e77db89a58
	.xword	0x55dfc282d41f1830
	.xword	0xbfd240de14cc61dc
	.xword	0x86c6e1d36ad43818
	.xword	0x40370546f0c86b47
	.xword	0x858d60b2411011a9
	.xword	0xa81ac4515810a46a
	.xword	0x90385ebb4efcb028
	.xword	0x47fffb360355264d
	.xword	0x44317ec8db14fa48
	.xword	0x30f43e0a53814f43
	.xword	0xa55d81e52a7ca1dc
	.xword	0x922335ebc8275343
	.xword	0xe92158b418e72a6a
	.xword	0x2d13bf6eee10bb3d
	.xword	0x2cb92de06180e919
	.xword	0xa349c7a21cb8911e
	.xword	0xe1df20ae4af5c7e1
	.xword	0x0d3466a7d12a6454
	.xword	0x53c81e1918f14542
	.xword	0x9c2554097fc7e6c2
	.xword	0x50d5593d03618479
	.xword	0x8caec14d76cfd920
	.xword	0xe979df3576c7721d
	.xword	0xbf56b2782f8f2e61
	.xword	0xc9546fc0071dd920
	.xword	0x9eac62b6ae3c5729
	.xword	0x7c30326ec08fe03f
	.xword	0xf4890512a937a47e
	.xword	0xeaee7d680ab3ff9f
	.xword	0x801554a91437fde1
	.xword	0xb53991aeb427282d
	.xword	0x18f983c4e6062979
	.xword	0xabde73a635b67394
	.xword	0xb5b301de103af5ff
	.xword	0xe7ceca5a8ad1731a
	.xword	0x012262245cf3fb11
	.xword	0x5d83165f3b2508fa
	.xword	0xfa880aece9a5bf5f
	.xword	0x81c3b50e5f3ff71f
	.xword	0xf02e3efa4c257c13
	.xword	0xdecadb5e7be69942
	.xword	0x96478d26ec290622
	.xword	0x71b9bf2b2d530be5
	.xword	0xe09f93ce7ea2dd45
	.xword	0x607d3e22342b9b2a
	.xword	0x77db1371f7d4e505
	.xword	0xa2cb7853c0630ba7
	.xword	0x5800a24ea8929f05
	.xword	0x3bddb1698e4f44cf
	.xword	0xdb58b5f17908870c
	.xword	0xe852deb9a4b07e0a
	.xword	0xb77f4d8d3d26c67b
	.xword	0x415c1c4c2c7ad7bd
	.xword	0x07b494d5a170d070
	.xword	0xa7a6416d62d5f85f
	.xword	0x8c22de9e8fe8763d
	.xword	0xd88b54f762491445
	.xword	0xa22b8cf9f6aff8b9
	.xword	0x3b2fa5a668a2047a
	.xword	0x0c2c21c409d9a0f3
	.xword	0x7b9fbcfa9acde2de
	.xword	0x345c9baf542eacfd
	.xword	0x184b716d32dde55d
	.xword	0xe5ba74c43a197871
	.xword	0x41e87825795fb5f1
	.xword	0x9c027794b44d0750
	.xword	0xc0ec0852d49b0f84
	.xword	0xfba5a1ff276608ae
	.xword	0xb526dcb9d6f643f4
	.xword	0x88b605a589461ed1
	.xword	0x15d6b4b8b117a3f4

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext
.global retry_with_base_tba

SECTION .HTRAPS
.text
retry_with_base_tba:
    set 0x120000, %r2
    set 0x7fff, %r3
    rdpr %tpc, %r4
    and %r4, %r3, %r4
    or %r2, %r4, %r4
    wrpr %r4, %tpc
    add %r4, 0x4, %r4
    wrpr %r4, %tnpc
    retry

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
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1
    cmp %l1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htstate, %l2
    and %l2, 0x4, %l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l2, wdog_2_goto_handler_1
    rdhpr %htba, %l2
    srlx %l1, 7, %l2     ! Send priv sw traps to priv mode ..
    cmp %l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a wdog_2_goto_handler_1
    rdpr %tba, %l2
    rdhpr %htba, %l2
wdog_2_goto_handler_1:
    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    jmp %l2
    nop
# 71 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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

    rdpr %tt, %l1

    rdhpr %htstate, %l2
    and %l2, 0x4, %l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l2, red_goto_handler
    rdhpr %htba, %l2
    srlx %l1, 7, %l2     ! Send priv sw traps to priv mode ..
    cmp %l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a red_goto_handler
    rdpr %tba, %l2
    rdhpr %htba, %l2
red_goto_handler:

    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
    cmp %l1, 6
    bl wdog_end
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

wdog_end:
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    done
# 457 "diag.j"
SECTION .CWQ_DATA DATA_VA =0x4000
attr_data {
    Name = .CWQ_DATA 
    hypervisor
}

.data
.align 16
.global msg
msg:
.xword 0xad32fa52374cc6ba
.xword 0x4cbf52280549003a

.align 16
.global results
results:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
!# CWQ data area 
.align 64
.global CWQ_BASE
CWQ_BASE:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.global CWQ_LAST
.align 64
CWQ_LAST:



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
	TTE_X	 = 0
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
	TTE_X	 = 0
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
	TTE_X	 = 0
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
	TTE_X	 = 0
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
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
	TTE_CP	 = 0,
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
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_NFO	 = 1,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
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
	TTE_CP	 = 0,
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
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_NFO	 = 1,
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





SECTION .MyDATA_0 TEXT_VA = 0x00000000e0140000, DATA_VA = 0x0000000060140000
attr_data {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0xa5b611beee56beaf
	.xword	0x6bf14c9813d3c7c2
	.xword	0xe23acab5d7fc8f74
	.xword	0xefa41abab4885e2e
	.xword	0xe70f8a60b8c88531
	.xword	0x6f8fb97e63e7421f
	.xword	0x333838a84f82efad
	.xword	0x2b29741b3268393d
	.xword	0x2ce45ba6b2a2c711
	.xword	0xde0cb5b352a5aed0
	.xword	0x425b6d6c6049a106
	.xword	0x41cbeec2374e01e8
	.xword	0x7dc636d019b06984
	.xword	0xa9d661f2b84f77b2
	.xword	0xe2ce3ab8aa30f860
	.xword	0xcf3b681d29ad94f7
	.xword	0xb5aa195e424f2ea0
	.xword	0xa5a40a017461c810
	.xword	0x7404852b9773e3a0
	.xword	0x21e83cf698193e84
	.xword	0x294bb7738c4ed360
	.xword	0x7154349aa8c88102
	.xword	0xc67db4240508f0f6
	.xword	0x6afe9a19dfbc9f98
	.xword	0x8bc3541b415abccc
	.xword	0xeebea0bc7988e7c7
	.xword	0x013458ccab7172c3
	.xword	0xfb4e7372457cf30a
	.xword	0x6b8c2cff38a802ea
	.xword	0x24273a565dd3a8f6
	.xword	0x316846153a6b4eab
	.xword	0xc1b19c6abc7ac722



SECTION .MyDATA_1 TEXT_VA = 0x00000000e0340000, DATA_VA = 0x0000000060340000
attr_data {
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0xd0c2650ba0d0034b
	.xword	0x41be545259d8113c
	.xword	0x41fd03c1d2867f45
	.xword	0x1ad078f6aceea604
	.xword	0x1e743143ed994ea4
	.xword	0x67daeb61e4c5c9a1
	.xword	0x7ab1543ca62b44d1
	.xword	0xd9eca34b2c73add7
	.xword	0xf6f6c7c6bd21f7dc
	.xword	0x747bd2f8967e7408
	.xword	0x186d65c620479c83
	.xword	0x22a211793d0676c6
	.xword	0x29c2b3e45c8873b4
	.xword	0x572e9933dc34ca99
	.xword	0x7b5dfd6d52e96b5a
	.xword	0xc5a9dd56a38df7b9
	.xword	0x94d05315c98cc030
	.xword	0x53f272095972a54e
	.xword	0x2bf0e151c6df01ee
	.xword	0xfed2661af72e7c51
	.xword	0x5567a05d0efa2a7e
	.xword	0xa9edf97d4bfb9809
	.xword	0x0aabc4b0cc5e5fb6
	.xword	0x40d497a9a7d7cf01
	.xword	0x1a49de63fd2bcb7b
	.xword	0x890b5349e8ae20c3
	.xword	0xd700cec6e23c0979
	.xword	0x1133ab4c2d832b96
	.xword	0x4ff735bc291a0498
	.xword	0x5b70118599053109
	.xword	0xb2487c4415f19de9
	.xword	0xc5f5f9429dbf2001



SECTION .MyDATA_2 TEXT_VA = 0x00000000e0540000, DATA_VA = 0x0000000060540000
attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0x2adcd7cf97903a72
	.xword	0x7b32604d934d9839
	.xword	0xe060ced91994855c
	.xword	0x715981464d2dbea4
	.xword	0xee2dc746692a38b9
	.xword	0x0761e3e0891af0ef
	.xword	0xeabf5a8be19d25b2
	.xword	0xe20f44b64900d342
	.xword	0xeedda49f6e21838b
	.xword	0x2d13b2871763fdc9
	.xword	0x38a42b4f10616490
	.xword	0x8c4de7d0a34b6270
	.xword	0x9e62a613e11cb162
	.xword	0xbeb110ca43dbc9a9
	.xword	0x24d15e4fba3423cb
	.xword	0x361b1d0d74c9d891
	.xword	0xe607916fba14a4e9
	.xword	0x13a28ed46ba3892c
	.xword	0xeed5c8d996d494fb
	.xword	0xf065413135d2df48
	.xword	0xa9278d3a5347b02d
	.xword	0x75dbd1636e0404bd
	.xword	0x759447cb29049757
	.xword	0xd72e3884a63cab9a
	.xword	0x89e003ee9609cbb2
	.xword	0xd32b71593db5da36
	.xword	0x01306dcbdb789ff1
	.xword	0x9f97ab3152c34971
	.xword	0x4d43add418410dbb
	.xword	0x49ff604d40e40b83
	.xword	0x27ba565ce51a7aee
	.xword	0xceac5aae185ce4ad



SECTION .MyDATA_3 TEXT_VA = 0x00000000e0740000, DATA_VA = 0x0000000060740000
attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_3,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_3,
	hypervisor
}

.data
	.xword	0x85d8cf878f2cb6e2
	.xword	0x543f7bc9f9961408
	.xword	0x30729b9b3923a460
	.xword	0xd6377ea977c466eb
	.xword	0xd3ffbc939bfb90d6
	.xword	0xf80b5c6a678d86be
	.xword	0x670d554031a1236f
	.xword	0x96023c755812d3be
	.xword	0xb806cf1e6f87ea94
	.xword	0xe1c1aa9c9b46737b
	.xword	0x7f8204d393468457
	.xword	0x434c9b56603bd803
	.xword	0x30ca24adf4f10afd
	.xword	0x1890e4ce84822fb8
	.xword	0x1dad9acbf28ef17e
	.xword	0x73567d7405eee884
	.xword	0xe011afb3751eac5e
	.xword	0x52a711dad0597c3d
	.xword	0x7ee73d4d9a741b19
	.xword	0xe3592f775f3a6491
	.xword	0x17c787015a6a36dc
	.xword	0x6538620e21036bd6
	.xword	0x34fd38b74452e61e
	.xword	0xd60692384205ba6a
	.xword	0x7e1fc73857708ce5
	.xword	0x1e7e0f563a0d8f1d
	.xword	0x56c220c1e582cf73
	.xword	0x2705ebbaf4815244
	.xword	0x641c014e5e7a6fcb
	.xword	0xd7ca3adaeb04da02
	.xword	0xae07f29f6418229d
	.xword	0xe7749b8373424702



#if 0
#endif

